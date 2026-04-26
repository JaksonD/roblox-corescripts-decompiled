local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local GenerateStringId = require(CorePackages.Workspace.Packages.AppCommonLib).GenerateStringId
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local tutils = require(CorePackages.Packages.tutils)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)

require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local Modules = CoreGui.RobloxGui.Modules

require(Modules.AvatarExperience.Common.Types)

local Constants = require(Modules.AvatarExperience.Common.Constants)
local ModelsUtils = require(script.Parent.ModelsUtils)
local v11 = game:DefineFastFlag("FixEmptyLimitedBadges", false)
local FFlagAXHydrateAssetFromBundleItems = AvatarExperienceFlags.FFlagAXHydrateAssetFromBundleItems
local FFlagAXDurablesSupportForRFYMigration = AvatarExperienceFlags.FFlagAXDurablesSupportForRFYMigration
local FFlagAXBlackbirdRoot = AvatarExperienceFlags.FFlagAXBlackbirdRoot
local FFlagAXTranformItemDetailsAssetType = AvatarExperienceFlags.FFlagAXTranformItemDetailsAssetType
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlags.FFlagAXInventoryDurablesSupport
local FFlagDynamicHeadsMigration = AvatarExperienceFlags.FFlagDynamicHeadsMigration
local FFlagAXFixRecommendedItemCreatorType = AvatarExperienceFlags.FFlagAXFixRecommendedItemCreatorType
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlags.FFlagAXInventoryDurablesExpiredFilter
local t4 = {
	mock = function() --[[ mock ]] -- line: 39
		-- upvalues: Constants (copy), GenerateStringId (copy)
		return {
			receivedCatalogData = false,
			receivedRecommendedData = false,
			receivedFromRecommendedData = false,
			receivedFromBundleItemData = false,
			receivedFromInventoryFetch = false,
			receivedFromOutfitDetails = false,
			receivedFromResaleData = false,
			receivedFromVersionData = false,
			name = "",
			description = "",
			creatorName = "",
			assetType = Constants.AssetTypeIdStrings.Hat,
			id = GenerateStringId(),
			priceInRobux = 1,
			creator = {
				id = GenerateStringId(),
				name = "",
				type = "",
				targetId = "",
				hasVerifiedBadge = false
			},
			created = "",
			updated = "",
			genres = {},
			minimumMembershipLevel = 0,
			product = {
				id = GenerateStringId(),
				type = "",
				isForSale = true
			},
			recommendedItemSummaries = {},
			favoriteCount = 0,
			priceStatus = "",
			itemRestrictions = {},
			itemStatus = {},
			lowestPrice = nil,
			numberRobloxHasAvailable = nil,
			totalQuantity = nil,
			resellerUserAssetIds = {},
			soldCount = 0,
			averagePrice = 0,
			originalPrice = 0,
			isForRent = false,
			isOwned = false,
			supportsHeadShapes = false,
			isPurchasable = false,
			expectedSellerId = GenerateStringId(),
			creatingUniverseId = nil,
			collectibleItemId = "0",
			moderationStatus = nil
		}
	end,
	fromRecommendedItemSummaries = function(t1: {[any]: any}?, p1) --[[ fromRecommendedItemSummaries ]] -- line: 115
		-- upvalues: tutils (copy)
		local v24 = tutils.deepCopy(p1 or {})

		v24.receivedRecommendedData = true
		v24.recommendedItemSummaries = t1

		return v24
	end,
	fromGetRecommendedItemsDataV2 = function(p2, p3, p4) --[[ fromGetRecommendedItemsDataV2 ]] -- line: 127
		-- upvalues: ModelsUtils (copy)
		local v28 = ModelsUtils.itemDataFromAssetInfo(p2, p4)

		v28.receivedFromRecommendedData = true

		if p3 then
			v28.assetType = p3
		end

		return v28
	end,
	fromHydrateWidgetInfo = function(p5, p6) --[[ fromHydrateWidgetInfo ]] -- line: 141
		-- upvalues: tutils (copy), Constants (copy), v11 (copy), ItemTileEnums (copy), FFlagAXDurablesSupportForRFYMigration (copy)
		local v31 = tutils.deepCopy(p6 or {})

		v31.id = tostring(p5.id)

		if p5.failedToHydrate then
			v31.failedToHydrate = true

			return v31
		end

		v31.name = p5.name
		v31.creator = {
			name = if not p5.creator then p5.creatorName else p5.creator.name,
			hasVerifiedBadge = if not p5.creator then nil else p5.creator.hasVerifiedBadge
		}
		v31.assetType = Constants.AssetTypeIdStrings[tostring(p5.assetType)]
		v31.priceInRobux = p5.price
		v31.receivedWidgetHydration = true

		local v32 = if not v11 then {} else nil

		if p5.isLimited or p5.isLimitedUnique or p5.isCollectible then
			v32 = {
				[ItemTileEnums.Restriction.Limited] = not not p5.isLimited,
				[ItemTileEnums.Restriction.LimitedUnique] = not not p5.isLimitedUnique,
				[ItemTileEnums.Restriction.Collectible] = not not p5.isCollectible
			}
		end

		v31.tileRestrictionsMap = v32

		if FFlagAXDurablesSupportForRFYMigration and p5.timedOptions then
			local t2 = {}

			for _, v35 in p5.timedOptions do
				table.insert(t2, {
					days = v35.days,
					price = v35.price,
					selected = v35.selected
				})
			end

			v31.timedOptions = t2
		end

		return v31
	end,
	fromGetRecommendedItemsData = function(p7, p8, p9) --[[ fromGetRecommendedItemsData ]] -- line: 193
		-- upvalues: tutils (copy), FFlagAXFixRecommendedItemCreatorType (copy)
		local v39 = tutils.deepCopy(p9 or {})

		v39.receivedFromRecommendedData = true

		if p7.item then
			v39.name = p7.item.name
			v39.id = tostring(p7.item.assetId)
			v39.priceInRobux = p7.item.price
		end

		if p7.product and p7.product.isFree then
			v39.priceInRobux = 0
		end

		if p7.product then
			v39.product = {
				id = tostring(p7.product.id)
			}
		end

		if p7.creator then
			v39.creator = {
				id = tostring(p7.creator.creatorId),
				name = p7.creator.name,
				type = if not FFlagAXFixRecommendedItemCreatorType then p7.creator.type else p7.creator.creatorType
			}
		end

		if p8 then
			v39.assetType = p8
		end

		return v39
	end,
	fromGetCatalogItemData = function(p10, p11) --[[ fromGetCatalogItemData ]] -- line: 234
		-- upvalues: ModelsUtils (copy), FFlagAXInventoryDurablesExpiredFilter (copy), FFlagAXBlackbirdRoot (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXMISEnableMultiShopping (copy), Constants (copy), FFlagAXTranformItemDetailsAssetType (copy)
		local v42 = ModelsUtils.itemDataFromAssetInfo(p10, p11)

		if not FFlagAXInventoryDurablesExpiredFilter or not p10.skipReceivedCatalogData then
			v42.receivedCatalogData = true
		end

		if p10.timedOptions then
			local t3 = {}

			for _, v45 in p10.timedOptions do
				table.insert(t3, {
					days = v45.days,
					price = v45.price,
					discountInformation = if not FFlagAXBlackbirdRoot or v45.days == 0 then p10.discountInformation else v45.discountInformation,
					selected = v45.selected
				})
			end

			v42.timedOptions = t3
		end

		if FFlagAXInventoryDurablesSupport then
			v42.expirationTime = p10.expirationTime
		end

		if FFlagAXMISEnableMultiShopping then
			v42.assetType = if not tonumber(p10.assetType) then Constants.AssetTypeIdStrings[tostring(p10.assetType)] else tostring(p10.assetType)

			return v42
		end

		if FFlagAXTranformItemDetailsAssetType then
			v42.assetType = Constants.AssetTypeIdStrings[tostring(p10.assetType)]

			if v42.assetType == nil then
				v42.assetType = tostring(p10.assetType)

				return v42
			end
		else
			v42.assetType = Constants.AssetTypeIdStrings[tostring(p10.assetType)]
		end

		return v42
	end,
	fromBundleItemData = function(p12, p13) --[[ fromBundleItemData ]] -- line: 285
		-- upvalues: tutils (copy)
		local v48 = tutils.deepCopy(p13 or {})

		v48.receivedFromBundleItemData = true
		v48.id = tostring(p12.id)
		v48.name = p12.name
		v48.isOwned = p12.owned

		return v48
	end,
	fromSortResults = function(p14, p15) --[[ fromSortResults ]] -- line: 296
		-- upvalues: ModelsUtils (copy)
		local v51 = ModelsUtils.itemDataFromAssetInfo(p14, p15)

		v51.receivedFromSortResults = true

		return v51
	end
}

if FFlagAXHydrateAssetFromBundleItems then
	function t4.fromBundledItems(p16, p17) -- line: 303
		-- upvalues: ModelsUtils (copy)
		return ModelsUtils.itemDataFromAssetInfo(p16, p17)
	end
end

function t4.fromInventoryFetch(p18, p19) -- line: 308
	-- upvalues: tutils (copy), Constants (copy), FFlagAXInventoryDurablesSupport (copy)
	local v56 = tutils.deepCopy(p19 or {})

	v56.receivedFromInventoryFetch = true
	v56.id = tostring(p18.assetId)
	v56.name = p18.name
	v56.assetType = Constants.AssetTypeIdStrings[p18.assetType]

	if p18.moderationStatus then
		v56.moderationStatus = p18.moderationStatus
	end

	if p18.creatingUniverseId then
		v56.creatingUniverseId = p18.creatingUniverseId
	end

	if FFlagAXInventoryDurablesSupport and p18.expirationTime then
		v56.expirationTime = p18.expirationTime
	end

	return v56
end
function t4.fromAssetGrant(p20, p21, p22) -- line: 333
	-- upvalues: tutils (copy), ArgCheck (copy)
	local v60 = tutils.deepCopy(p22 or {})

	ArgCheck.isType(p20, "string", "AssetInfo.fromAssetGrant expects assetId to be a string")
	ArgCheck.isType(p21, "string", "AssetInfo.fromAssetGrant expects assetType to be a string")
	v60.id = p20
	v60.assetType = p21
	v60.moderationStatus = Enum.ModerationStatus.NotReviewed

	return v60
end
function t4.fromModerationStatusUpdate(p23, p24, p25, p26, p27, p28) -- line: 350
	-- upvalues: tutils (copy)
	local v67 = tutils.deepCopy(p28 or {})

	v67.moderationStatus = p23
	v67.updateCounter = p24
	v67.id = p25
	v67.name = p26
	v67.creatingUniverseId = p27

	return v67
end
function t4.fromOutfitDetails(p29, p30, p31) -- line: 368
	-- upvalues: tutils (copy), FFlagDynamicHeadsMigration (copy)
	local v71 = tutils.deepCopy(p30 or {})

	v71.receivedFromOutfitDetails = true
	v71.id = tostring(p29.id)
	v71.name = p29.name
	v71.assetType = tostring(p29.assetType.id)
	v71.outfitModerationStatus = p31

	if FFlagDynamicHeadsMigration and p29.supportsHeadShapes ~= nil then
		v71.supportsHeadShapes = p29.supportsHeadShapes
	end

	return v71
end
function t4.fromGetResellers(p32, p33) -- line: 392
	-- upvalues: tutils (copy)
	local v74 = tutils.deepCopy(p33 or {})

	v74.resellerUserAssetIds = p32

	return v74
end
function t4.fromLowestPrice(n1: number, p34) -- line: 400
	-- upvalues: tutils (copy)
	local v77 = tutils.deepCopy(p34 or {})

	v77.lowestPrice = n1

	return v77
end
function t4.fromResaleData(p35, p36) -- line: 408
	-- upvalues: tutils (copy)
	local v80 = tutils.deepCopy(p36 or {})

	v80.receivedFromResaleData = true
	v80.soldCount = p35.sales
	v80.averagePrice = p35.recentAveragePrice
	v80.originalPrice = p35.originalPrice

	return v80
end
function t4.fromIsOwned(b1: boolean, p37) -- line: 419
	-- upvalues: tutils (copy)
	local v83 = tutils.deepCopy(p37 or {})

	v83.isOwned = b1

	return v83
end
function t4.fromReceivedAvatarData(p38) -- line: 426
	return {
		id = tostring(p38.id),
		name = p38.name,
		assetType = tostring(p38.assetType.id)
	}
end
function t4.fromVersionData(p39, p40) -- line: 446
	-- upvalues: tutils (copy)
	local v87 = tutils.deepCopy(p40 or {})
	local v88 = p39.data[1]

	v87.receivedFromVersionData = true
	v87.creatingUniverseId = if not v88.creatingUniverseId then nil else tostring(v88.creatingUniverseId)

	return v87
end

return t4
