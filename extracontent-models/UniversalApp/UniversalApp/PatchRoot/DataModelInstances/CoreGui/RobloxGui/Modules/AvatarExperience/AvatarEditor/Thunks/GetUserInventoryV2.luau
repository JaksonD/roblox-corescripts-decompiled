local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local MemStorageService = game:GetService("MemStorageService")
local Modules = CoreGui.RobloxGui.Modules
local Promise = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local Dash = require(CorePackages.Packages.Dash)
local AvatarExperienceSlotBasedEditor = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local InventorySorts = AvatarExperienceSlotBasedEditor.Enums.InventorySorts
local InventoryFilterToAvailabilityStatus = AvatarExperienceSlotBasedEditor.Constants.InventoryFilterToAvailabilityStatus
local AvatarEditorCategories = AvatarExperienceSlotBasedEditor.Enums.AvatarEditorCategories
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local SetOwnedItemIdsBySubtype = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype)
local SetPageFinished = require(Modules.AvatarExperience.AvatarEditor.Actions.SetPageFinished)
local SetOutfitOrAsset = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset)
local SetAssetInfoFromInventoryFetch = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch)
local GetOutfit = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local BatchGetOutfits = require(Modules.AvatarExperience.Common.Thunks.BatchGetOutfits)

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
require(Modules.AvatarExperience.Common.Types)

local Constants = require(Modules.AvatarExperience.AvatarEditor.Constants)
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local Utils2 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local WebApi = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local FetchAssetOrBundleInfoBatched = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfoBatched)
local sendAXCounterV2 = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2

require(Modules.LuaApp.Types.RoduxTypes)
require(Modules.AvatarExperience.Common.AvatarExperienceState)

local mutedError = require(Modules.LuaApp.mutedError)
local FFlagAXInventoryV2CombineGetOutfitDispatches = require(Modules.AvatarExperience.Flags.FFlagAXInventoryV2CombineGetOutfitDispatches)
local FIntAXDefaultInventoryPageSize = AvatarExperienceFlags.FIntAXDefaultInventoryPageSize
local GetFFlagAXRemoveAwaitUsageInThunks = require(Modules.AvatarExperience.Flags.GetFFlagAXRemoveAwaitUsageInThunks)
local GetFFlagAXEnableNewInventoryItemsList = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local GetFFlagAXEnableInventorySortsAndFilters = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlags.FFlagAXEditorSubcategoryFilters
local FFlagAXPhotoboothIsStandalone = AvatarExperienceFlags.FFlagAXPhotoboothIsStandalone
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = AvatarExperienceFlags.FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlags.FFlagAXInventoryDurablesSupport
local FFlagAXFixStaleModerationStatusFromGrant = AvatarExperienceFlags.FFlagAXFixStaleModerationStatusFromGrant
local FFlagAXFixIecModerationFromInventoryFetch = AvatarExperienceFlags.FFlagAXFixIecModerationFromInventoryFetch
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlags.FFlagAXInventoryDurablesExpiredFilter

local function checkAndSendDuplicateItemCount(p1, s1: string, t1: {[any]: any}) -- line: 78
	-- upvalues: Dash (copy), sendAXCounterV2 (copy), Constants2 (copy)
	local v51 = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[s1]

	if not v51 or #v51 == 0 then
		return
	end

	local v52 = Dash.keyBy(v51, function(p2) -- line: 87
		return p2
	end)

	for _, v54 in t1 do
		if v52[v54] then
			sendAXCounterV2(Constants2.Counter.AvatarInventory.ReceivedDuplicateItem)
		else
			v52[v54] = v54
		end
	end
end
local function getRequestItemCategoriesFromInfo(p3) -- line: 99
	-- upvalues: GetFFlagAXEnableNewInventoryItemsList (copy), AvatarEditorCategories (copy), Constants (copy), Constants2 (copy)
	local t2 = {}

	if GetFFlagAXEnableNewInventoryItemsList() and p3.NavigationKey == AvatarEditorCategories.All then
		return {}
	end

	if p3.AssetTypeIdStrings then
		for _, v58 in p3.AssetTypeIdStrings do
			table.insert(t2, {
				itemType = string.lower(Constants.OutfitOrAsset.Asset or "asset"),
				itemSubType = tonumber(v58)
			})
		end
	end

	if GetFFlagAXEnableNewInventoryItemsList() then
		if p3.BundleTypeIdStrings then
			for _, v60 in p3.BundleTypeIdStrings do
				local v61 = Constants2.BundleTypeIdStringsForBackend[v60]

				if v61 then
					table.insert(t2, {
						itemType = string.lower(Constants.OutfitOrAsset.Outfit or "outfit"),
						itemSubType = tonumber(v61)
					})
				end
			end

			return t2
		end
	elseif p3.OutfitTypeIdStrings then
		for _, v63 in p3.OutfitTypeIdStrings do
			local v64 = Constants2.BundleTypeIdStringsForBackend[v63]

			if v64 then
				table.insert(t2, {
					itemType = string.lower(Constants.OutfitOrAsset.Outfit or "outfit"),
					itemSubType = tonumber(v64)
				})
			end
		end
	end

	return t2
end

local t3 = {
	PendingReview = Enum.ModerationStatus.NotReviewed,
	Unavailable = Enum.ModerationStatus.ReviewedRejected
}
local v45 = if not FFlagAXInventoryDurablesExpiredFilter then nil else function(p4, p5, t4: {[any]: any}) -- line: 181
	-- upvalues: Constants2 (copy), FetchAssetOrBundleInfoBatched (copy)
	local t5 = {}

	for _, v76 in t4 do
		local Asset = nil

		if v76.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then
			Asset = Constants2.ItemType.Asset
		elseif v76.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then
			Asset = Constants2.ItemType.Bundle
		end

		if Asset then
			table.insert(t5, {
				id = tostring(v76.itemId),
				itemType = Asset
			})
		end
	end

	if #t5 > 0 then
		p5:dispatch(FetchAssetOrBundleInfoBatched(p4, nil, t5, true))
	end
end

local function v46(t6: {[any]: any}) -- line: 206
	-- upvalues: GetFFlagAXEnableNewInventoryItemsList (copy), FFlagAXPhotoboothIsStandalone (copy), FFlagAXFixIecModerationFromInventoryFetch (copy), t3 (copy), FFlagAXFixStaleModerationStatusFromGrant (copy), Utils (copy), Constants2 (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXInventoryV2CombineGetOutfitDispatches (copy), GetOutfit (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), SetAssetInfoFromInventoryFetch (copy), checkAndSendDuplicateItemCount (copy), BatchGetOutfits (copy), SetOutfitOrAsset (copy), Constants (copy), SetOwnedItemIdsBySubtype (copy), FFlagAXInventoryDurablesExpiredFilter (copy), v45 (copy), MemStorageService (copy), SetPageFinished (copy)
	if (GetFFlagAXEnableNewInventoryItemsList() or FFlagAXPhotoboothIsStandalone) and t6.categoryInventoryStore then
		t6.categoryInventoryStore.addResultsPage(t6.results)
	end

	local store = t6.store
	local searchUuid = t6.searchUuid
	local results = t6.results
	local resolve = t6.resolve
	local v83 = store:getState()
	local v84 = results.avatarInventoryItems or {}
	local t7 = {}
	local t8 = {}
	local t9 = {}
	local t10 = {}

	for _, v90 in v84 do
		local str = tostring(v90.itemId)
		local itemCategory = v90.itemCategory

		t9[#t9 + 1] = str

		if itemCategory.itemType == Enum.AvatarItemType.Asset.Value then
			local v93 = v83.AvatarExperience.Common.AssetInfos[str]

			if not v93 or not v93.receivedFromInventoryFetch then
				local v94 = nil
				local str2 = nil
				local availabilityStatus = v90.availabilityStatus

				if availabilityStatus then
					v94 = if not FFlagAXFixIecModerationFromInventoryFetch or not v90.creatingUniverseId then if not FFlagAXFixStaleModerationStatusFromGrant then t3[availabilityStatus] else Utils.getModerationStatusFromAvailabilityStatus(availabilityStatus) else t3[availabilityStatus]
				end

				if v90.creatingUniverseId then
					str2 = tostring(v90.creatingUniverseId)
				end

				t7[#t7 + 1] = {
					assetId = v90.itemId,
					name = v90.itemName,
					assetType = Constants2.AssetTypeIdStringToName[tostring(itemCategory.itemSubType)],
					moderationStatus = v94,
					creatingUniverseId = str2,
					expirationTime = if not FFlagAXInventoryDurablesSupport then nil else v90.expirationTime
				}
			end
		elseif itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then
			t8[#t8 + 1] = str

			if v83.AvatarExperience.AvatarEditor.OutfitInfos[str] == nil then
				if FFlagAXInventoryV2CombineGetOutfitDispatches then
					table.insert(t10, str)
				else
					store:dispatch(GetOutfit(str, nil, nil, if not FFlagAXModeratedItemsFlow and not FFlagAXEnableModeratedItemsFlowForDurables then nil else t6.networkImpl))
				end
			end
		end
	end

	if #t7 > 0 then
		store:dispatch(SetAssetInfoFromInventoryFetch(t7))
	end

	checkAndSendDuplicateItemCount(v83, searchUuid, t9)

	if FFlagAXInventoryV2CombineGetOutfitDispatches then
		store:dispatch(BatchGetOutfits(t10, if not FFlagAXModeratedItemsFlow and not FFlagAXEnableModeratedItemsFlowForDurables then nil else t6.networkImpl))
	end

	store:dispatch(SetOutfitOrAsset(t8, Constants.OutfitOrAsset.Outfit))
	store:dispatch(SetOwnedItemIdsBySubtype(searchUuid, t9))

	if FFlagAXInventoryDurablesExpiredFilter and t6.shouldFetchItemDetails then
		v45(t6.networkImpl, store, v84)
	end

	local ReachedLastPage = nil

	if results then
		local nextPageToken = results.nextPageToken

		if nextPageToken and nextPageToken ~= "" then
			MemStorageService:SetItem(searchUuid, nextPageToken)
		else
			store:dispatch(SetPageFinished(searchUuid, true))
			MemStorageService:SetItem(searchUuid, Constants.ReachedLastPage)
			ReachedLastPage = Constants.ReachedLastPage
		end
	end

	resolve(ReachedLastPage)
end
local function fetchItems(t11: {[any]: any}) -- line: 335
	-- upvalues: FIntAXDefaultInventoryPageSize (copy), GetFFlagAXEnableInventorySortsAndFilters (copy), InventorySorts (copy), FFlagAXInventoryDurablesExpiredFilter (copy), InventoryFilterToAvailabilityStatus (copy), GetFFlagAXRemoveAwaitUsageInThunks (copy), WebApi (copy), getRequestItemCategoriesFromInfo (copy), v46 (copy), GetFFlagAXEnableNewInventoryItemsList (copy), FFlagAXPhotoboothIsStandalone (copy), FFlagAXRootSlotBasedEditorFlag (copy)
	local v100 = FIntAXDefaultInventoryPageSize
	local v101 = if not GetFFlagAXEnableInventorySortsAndFilters() or not t11.sortAndFiltersStore then nil else t11.sortAndFiltersStore.getSortAndFilters(false)
	local v102 = (not GetFFlagAXEnableInventorySortsAndFilters() or (not v101 or v101.sort ~= InventorySorts.RecentlyWorn)) and "recentAdded" or "recentEquipped"
	local u103 = nil
	local v104 = nil

	if FFlagAXInventoryDurablesExpiredFilter and (GetFFlagAXEnableInventorySortsAndFilters() and v101) then
		v104 = InventoryFilterToAvailabilityStatus[v101.filter]
		u103 = v104 ~= nil
	end

	if GetFFlagAXRemoveAwaitUsageInThunks() then
		return WebApi.GetUserAvatarInventory(t11.networkImpl, getRequestItemCategoriesFromInfo(t11.categoryInfo), v102, v100, t11.nextPageCursor, (if not FFlagAXInventoryDurablesExpiredFilter then nil else v104)):andThen(function(p6) -- line: 372
			-- upvalues: v46 (copy), t11 (copy), GetFFlagAXEnableNewInventoryItemsList (copy), FFlagAXPhotoboothIsStandalone (copy), FFlagAXInventoryDurablesExpiredFilter (copy), u103 (ref)
			local responseBody = p6.responseBody

			v46({
				networkImpl = t11.networkImpl,
				results = responseBody,
				searchUuid = t11.searchUuid,
				store = t11.store,
				resolve = t11.resolve,
				categoryInventoryStore = if not GetFFlagAXEnableNewInventoryItemsList() and not FFlagAXPhotoboothIsStandalone then nil else t11.categoryInventoryStore,
				shouldFetchItemDetails = if not FFlagAXInventoryDurablesExpiredFilter then nil else u103
			})
		end):catch(function(p7) -- line: 389
			-- upvalues: t11 (copy)
			warn("GetUserInventoryV2 failure: ", p7)

			return t11.reject()
		end)
	end

	local v105, v106 = WebApi.GetUserAvatarInventory(t11.networkImpl, getRequestItemCategoriesFromInfo(t11.categoryInfo), v102, v100, t11.nextPageCursor, (if not FFlagAXInventoryDurablesExpiredFilter then nil else v104)):await()

	if not v105 then
		warn("GetUserInventoryV2 failure: ", v106)

		return t11.reject(if not FFlagAXRootSlotBasedEditorFlag then nil else v106)
	end

	local responseBody = v106.responseBody

	v46({
		networkImpl = t11.networkImpl,
		results = responseBody,
		searchUuid = t11.searchUuid,
		store = t11.store,
		resolve = t11.resolve,
		categoryInventoryStore = if not GetFFlagAXEnableNewInventoryItemsList() and not FFlagAXPhotoboothIsStandalone then nil else t11.categoryInventoryStore,
		shouldFetchItemDetails = if not FFlagAXInventoryDurablesExpiredFilter then nil else u103
	})
end

return function(p8, p9, _, p11, p12) -- line: 425
	-- upvalues: ArgCheck (copy), Utils2 (copy), FFlagAXEditorSubcategoryFilters (copy), Promise (copy), PerformFetch (copy), GetFFlagAXEnableNewInventoryItemsList (copy), Constants (copy), MemStorageService (copy), fetchItems (copy), FFlagAXPhotoboothIsStandalone (copy), GetFFlagAXEnableInventorySortsAndFilters (copy), mutedError (copy)
	ArgCheck.isType(p9, "table", "GetUserInventoryV2 thunk expects categoryInfo to be a table")

	return function(p13) -- line: 433
		-- upvalues: Utils2 (copy), p9 (copy), FFlagAXEditorSubcategoryFilters (copy), Promise (copy), PerformFetch (copy), GetFFlagAXEnableNewInventoryItemsList (copy), p11 (copy), Constants (copy), MemStorageService (copy), fetchItems (copy), p8 (copy), FFlagAXPhotoboothIsStandalone (copy), GetFFlagAXEnableInventorySortsAndFilters (copy), p12 (copy), mutedError (copy)
		local v118 = p13:getState()
		local v119 = Utils2.getSearchUuidAndAssetTypes(p9, v118.AvatarExperience.AvatarEditor.Categories.subButton, if not FFlagAXEditorSubcategoryFilters then nil else v118.AvatarExperience.AvatarEditor.Categories.subcategoryFilter)

		if not v119 then
			return Promise.resolve("No SearchUuid")
		end

		return PerformFetch.Single(v119, function() -- line: 451
			-- upvalues: GetFFlagAXEnableNewInventoryItemsList (copy), p11 (copy), Promise (copy), Constants (copy), v119 (copy), MemStorageService (copy), fetchItems (copy), p8 (copy), p9 (copy), p13 (copy), FFlagAXPhotoboothIsStandalone (copy), GetFFlagAXEnableInventorySortsAndFilters (copy), p12 (copy)
			local nextPageCursor

			if GetFFlagAXEnableNewInventoryItemsList() and p11 then
				nextPageCursor = p11.nextPageCursor

				if p11.getHasReachedLastPage(false) then
					return Promise.resolve(Constants.ReachedLastPage)
				end
			else
				local v121 = v119

				nextPageCursor = if v121 then MemStorageService:GetItem(v121) else nil

				if Constants.ReachedLastPage == nextPageCursor then
					return Promise.resolve(Constants.ReachedLastPage)
				end
			end

			return Promise.new(function(p14, p15) -- line: 464
				-- upvalues: fetchItems (copy), p8 (copy), v119 (copy), p9 (copy), p13 (copy), nextPageCursor (ref), GetFFlagAXEnableNewInventoryItemsList (copy), FFlagAXPhotoboothIsStandalone (copy), p11 (copy), GetFFlagAXEnableInventorySortsAndFilters (copy), p12 (copy)
				fetchItems({
					networkImpl = p8,
					searchUuid = v119,
					categoryInfo = p9,
					store = p13,
					resolve = p14,
					reject = p15,
					nextPageCursor = nextPageCursor,
					categoryInventoryStore = if not GetFFlagAXEnableNewInventoryItemsList() and not FFlagAXPhotoboothIsStandalone then nil else p11,
					sortAndFiltersStore = if not GetFFlagAXEnableInventorySortsAndFilters() then nil else p12
				})
			end)
		end)(p13):catch(function(p16) -- line: 482
			-- upvalues: mutedError (copy)
			mutedError("GetUserInventoryV2 fetch failed: ", p16)
		end)
	end
end
