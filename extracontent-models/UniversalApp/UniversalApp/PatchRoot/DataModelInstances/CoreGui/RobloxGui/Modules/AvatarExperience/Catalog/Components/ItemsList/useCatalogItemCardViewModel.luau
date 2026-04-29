local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local useFocusController = RoactGamepad.useFocusController
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local tutils = require(CorePackages.Packages.tutils)
local Cryo = require(CorePackages.Packages.Cryo)
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local getZoomedSizeAndOffset = AvatarExperienceCommon.Utils.getZoomedSizeAndOffset
local getThumbSizeVectorFromParamString = AvatarExperienceCommon.Utils.getThumbSizeVectorFromParamString
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local useMultiItemShoppingFtux = AvatarExperienceCatalog.Hooks.useMultiItemShoppingFtux
local useMakeupFtux = AvatarExperienceCatalog.Hooks.useMakeupFtux
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local RoactUtils = require(CorePackages.Workspace.Packages.RoactUtils)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local useLastInput = Responsive.useLastInput
local useIsSpatial = Responsive.useIsSpatial
local AvatarExperienceAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalytics.UnifiedEventLogEnums
local addUnifiedEventLogging = AvatarExperienceAnalytics.addUnifiedEventLogging
local UnifiedEventLogConstants = AvatarExperienceAnalytics.UnifiedEventLogConstants
local UnifiedEventLoggingUtils = AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils
local getTimedOptionForItemData = AvatarExperienceAnalytics.Utils.getTimedOptionForItemData
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local Foundation = require(CorePackages.Packages.Foundation)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlags.FFlagAXLookAndFeelBackgrounds
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation = SharedFlags.FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation
local GetFFlagEnableShowRobloxAsLookCreator = require(Modules.AvatarExperience.Flags.GetFFlagEnableShowRobloxAsLookCreator)
local FFlagAddTypesToWidgetItems = AvatarExperienceFlags.FFlagAddTypesToWidgetItems
local AvatarExperienceRodux = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local AddAnalyticsMetadata = AvatarExperienceRodux.Actions.AddAnalyticsMetadata
local SetTryOnManagerPeekViewState = AvatarExperienceRodux.Actions.SetTryOnManagerPeekViewState
local SetLastToggledLookType = AvatarExperienceCatalog.State.Actions.SetLastToggledLookType
local RemoveLookFromTryOn = require(Modules.AvatarExperience.Common.Actions.RemoveLookFromTryOn)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local WidgetConstants = AvatarExperienceCatalog.WidgetConstants
local WebApi = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local ImpressionsUtil = AvatarExperienceAnalytics.ImpressionsReporter.ImpressionsUtil
local OrganicEventImpressionsSchema = AvatarExperienceAnalytics.ImpressionsReporter.OrganicEventImpressionsSchema
local SetCurrentToastMessage = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastType = require(Modules.LuaApp.Enum.ToastType)
local FullView = AvatarExperienceCommon.Enums.FullView

require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)

local ItemData = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local selectEquippedLayeredMakeupAssets = AvatarExperienceCommon.State.Selectors.selectEquippedLayeredMakeupAssets
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local Analytics2 = require(Modules.AvatarExperience.Common.Services.Analytics)

require(Modules.AvatarExperience.Common.Types)

local SendDetailedCatalogAnalytics = require(Modules.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics)
local MaybePromptForR15Upgrade = require(Modules.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade)
local OpenItemDetails = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local ToggleTryOnThunk = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local CloseAllItemDetails = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)
local SetAnimationPreview = require(Modules.AvatarExperience.Common.Actions.SetAnimationPreview)
local SetFullView = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local logOnOverlayClosed = AvatarExperienceNavigation.Debug.logOnOverlayClosed
local useAdaptiveScrolling = AvatarExperienceCommon.Hooks.useAdaptiveScrolling
local selectIsFullViewTable = require(Modules.AvatarExperience.Common.Selectors.selectIsFullViewTable)
local getTryOnItemReducerKey = AvatarExperienceCommon.Utils.getTryOnItemReducerKey
local ItemTypeEnum = AvatarExperienceCommon.Enums.ItemTypeEnum
local CatalogItemCardStatusIconTypeEnum = AvatarExperienceCommon.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = AvatarExperienceCommon.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local MAX_MAKEUP_LAYERS = AvatarExperienceCommon.Constants.MAX_MAKEUP_LAYERS
local TryOnLookV2 = require(Modules.AvatarExperience.Common.Thunks.TryOnLookV2)
local OpenLookDetailsFromButton = require(Modules.AvatarExperience.Common.Thunks.OpenLookDetailsFromButton)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local sendUnifiedEventForDeferredAction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction
local NavigateWithLock = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock

require(script.Parent.CatalogItemCard)

local useCatalogItemCardFocusNavigationBindings = require(script.Parent.useCatalogItemCardFocusNavigationBindings)
local useCatalogItemCardFtux = require(script.Parent.useCatalogItemCardFtux)
local getItemCardStatus = require(script.Parent.getItemCardStatus)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXCatalogItemCardSelectedOverlayButtonLogging = AvatarExperienceFlags.FFlagAXCatalogItemCardSelectedOverlayButtonLogging
local FFlagAXDurablesSupportForPermanent = AvatarExperienceFlags.FFlagAXDurablesSupportForPermanent
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXAddLookTypeEnumForLogging = AvatarExperienceFlags.FFlagAXAddLookTypeEnumForLogging
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlags.FFlagAXCatalogMakeupSupport
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local FFlagAXDurablesFooter = AvatarExperienceFlags.FFlagAXDurablesFooter
local v92 = game:DefineFastFlag("AXDurablesFooterWithPermanent", false)
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlags.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlags.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXWearTimeSupport = SharedFlags.FFlagAXWearTimeSupport
local LOOKS_IMAGE_OFFSET_MULTIPLIERS = AvatarExperienceCatalog.Constants.LOOKS_IMAGE_OFFSET_MULTIPLIERS
local LOOKS_IMAGE_ZOOM = AvatarExperienceCatalog.Constants.LOOKS_IMAGE_ZOOM
local t1 = {
	toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning",
	isLocalized = false,
	toastType = ToastType.InformationMessage
}

local function getTimedOptionDays(p1) -- line: 161
	-- upvalues: v92 (copy)
	for _, v113 in p1 do
		if not v92 then
			if not v113.selected or not (v113.days > 0) then
				continue
			end

			return v113.days
		end

		if v113.selected then
			return v113.days
		end
	end

	if v92 then
		return 0
	end

	return nil
end
local function getCreatorFromLookData(p2) -- line: 191
	-- upvalues: GetFFlagEnableShowRobloxAsLookCreator (copy), Constants (copy)
	if p2 and (p2.curator and p2.curator.name) and (GetFFlagEnableShowRobloxAsLookCreator() or p2.curator.name:lower() ~= Constants.RobloxCreatorName:lower()) then
		return {
			name = p2.curator.name,
			verified = if not p2 or not p2.curator then nil else p2.curator.hasVerifiedBadge
		}
	end

	return nil
end
local function getLookStatusFromModerationStatus(s1: string?) -- line: 210
	-- upvalues: Constants (copy)
	if s1 == Constants.ModerationStatus.PendingModeration then
		return {
			type = "icon",
			iconType = "PendingModeration"
		}
	end

	if s1 == Constants.ModerationStatus.Moderated then
		return {
			type = "icon",
			iconType = "Moderated"
		}
	end

	return nil
end

local u102 = nil

if FFlagAXMISEnableMultiShopping then
	function u102(p3) -- line: 242
		-- upvalues: ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy)
		local t2 = {}

		for _, v126 in p3 do
			if v126.selectedInTryOnManager and v126.itemType and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v126.itemSubType] then
				table.insert(t2, v126)
			end
		end

		return t2
	end
end

local function cardIsSelectedInTryOnOutfit(p4, s2: string?, p5) -- line: 256
	-- upvalues: FFlagAXCatalogMakeupSupport (copy), FFlagAXMISEnableMultiShopping (copy), getTryOnItemReducerKey (copy)
	if s2 and s2 == p4.AvatarExperience.AvatarScene.OutfitTryOn.LookId then
		return true
	end

	if FFlagAXCatalogMakeupSupport and FFlagAXMISEnableMultiShopping and s2 and s2 == p4.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId then
		return true
	end

	local TryOnItems = p4.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local v131 = p4.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil

	if s2 and p5 then
		local v132 = getTryOnItemReducerKey(s2, p5)

		if FFlagAXMISEnableMultiShopping then
			return TryOnItems[v132] ~= nil
		end

		return TryOnItems[v132] ~= nil and v131
	end

	return false
end
local function selectCatalogItemCardState(p6, s3: string?, p7) -- line: 284
	-- upvalues: cardIsSelectedInTryOnOutfit (copy), ItemData (copy), CatalogUtils (copy), FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesStore (copy), Utils (copy), Constants (copy), selectIsFullViewTable (copy), PeekViewState (copy)
	local v136 = cardIsSelectedInTryOnOutfit(p6, s3, p7)
	local LastToggledItem = p6.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem
	local v138 = nil
	local v139 = ItemData(p6.AvatarExperience.Common, s3, p7)

	if v139 then
		local v140

		v140, v138 = CatalogUtils.GetStatus(v139)
	end

	local v141 = if not FFlagAXCatalogCategoriesStore then Utils.getCatalogCategoryInfoFromState(p6) else GetCatalogCategoriesStore.getCatalogSelectionStore().selectedCategoryInfo(false)
	local v142 = v136 and (v139 and v139.bundleType == Constants.BundleTypeIdStrings.Animations)
	local PageType = v141.PageType
	local v144 = v142 and (LastToggledItem and s3 == LastToggledItem.itemId or (PageType == Constants.PageType.Animation or PageType == Constants.PageType.AllAnimation))
	local viewState = p6.AvatarExperience.Common.ItemDetailsPeekView.viewState

	return {
		itemData = v139,
		isSelected = v136,
		statusText = v138,
		avatarType = p6.AvatarExperience.AvatarEditor.Character.AvatarType,
		isAvatarR6 = p6.AvatarExperience.AvatarEditor.Character.AvatarType == Constants.AvatarType.R6,
		fullView = selectIsFullViewTable(p6),
		showAnimationTabs = v144,
		isItemDetailsViewStateFull = viewState == PeekViewState.Full
	}
end
local function v105(p8) -- line: 332
	return p8.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end
local function showDurableBadge(p9) -- line: 336
	-- upvalues: FFlagAXDurablesFooter (copy), CatalogItemCardStatusIconTypeEnum (copy), FFlagAXDurablesSupportForPermanent (copy)
	if FFlagAXDurablesFooter then
		return nil
	end

	if not p9 or not p9.timedOptions then
		return nil
	end

	for _, v149 in p9.timedOptions do
		if v149.selected then
			return {
				type = "badge",
				iconType = CatalogItemCardStatusIconTypeEnum.Durable,
				text = if not FFlagAXDurablesSupportForPermanent then tostring(v149.days) else not (v149.days > 0) and "" or tostring(v149.days)
			}
		end
	end

	return {
		type = "badge",
		iconType = CatalogItemCardStatusIconTypeEnum.Durable,
		text = ""
	}
end

return function(t3: {[any]: any}) --[[ useCatalogItemCardViewModel ]] -- line: 401
	-- upvalues: React (copy), useLastInput (copy), useIsSpatial (copy), Responsive (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), useFocusController (copy), useAdaptiveScrolling (copy), useRoactService (copy), RoactNetworking (copy), Analytics2 (copy), Analytics (copy), FFlagAXMISEnableMultiShopping (copy), useMultiItemShoppingFtux (copy), FFlagAXCatalogMakeupSupport (copy), useMakeupFtux (copy), useNavigation (copy), useAvatarRoute (copy), useDispatch (copy), selectCatalogItemCardState (copy), useSelector (copy), tutils (copy), v105 (copy), selectEquippedLayeredMakeupAssets (copy), FFlagAXDurablesFooter (copy), getTimedOptionDays (copy), useLocalization (copy), CatalogUtils (copy), Constants (copy), getThumbSizeVectorFromParamString (copy), getZoomedSizeAndOffset (copy), LOOKS_IMAGE_ZOOM (copy), LOOKS_IMAGE_OFFSET_MULTIPLIERS (copy), FFlagAXCatalogItemCardSelectedOverlayButtonLogging (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), ItemTypeEnum (copy), OpenLookDetailsFromButton (copy), AvatarScreen (copy), SetLastToggledLookType (copy), NavigateWithLock (copy), OpenItemDetails (copy), FFlagAXWearTimeSupport (copy), useCatalogItemCardFtux (copy), FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation (copy), logOnOverlayClosed (copy), MaybePromptForR15Upgrade (copy), SetFullView (copy), FullView (copy), TryOnLookV2 (copy), PeekViewState (copy), RemoveLookFromTryOn (copy), SetTryOnManagerPeekViewState (copy), AddAnalyticsMetadata (copy), SendDetailedCatalogAnalytics (copy), WidgetConstants (copy), ToggleTryOnThunk (copy), SetCurrentToastMessage (copy), t1 (copy), SetAnimationPreview (copy), WebApi (copy), CloseAllItemDetails (copy), getTryOnItemReducerKey (copy), u102 (ref), MAX_MAKEUP_LAYERS (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), RoactGamepad (copy), Cryo (copy), addUnifiedEventLogging (copy), FFlagAXAddLookTypeEnumForLogging (copy), UnifiedEventLoggingUtils (copy), getTimedOptionForItemData (copy), FFlagAddTypesToWidgetItems (copy), UnifiedEventLogConstants (copy), useCatalogItemCardFocusNavigationBindings (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy), getCreatorFromLookData (copy), v92 (copy), Foundation (copy), FFlagAXInventoryDurablesExpiredFilter (copy), getItemCardStatus (copy), ItemTileEnums (copy), getLookStatusFromModerationStatus (copy), showDurableBadge (copy), FFlagAXLookAndFeelBackgrounds (copy)
	local v151 = React.useRef(nil)
	local v152 = React.useRef(nil)
	local v153 = useLastInput()
	local v154 = useIsSpatial()
	local v155 = v153 == Responsive.Input.Directional and not v154
	local v156 = if not FFlagAXMigrateAXToGlobalAutofocus then useFocusController() else nil
	local v157 = useAdaptiveScrolling()
	local v158 = useRoactService(RoactNetworking)
	local v159 = useRoactService(Analytics2)
	local v160 = useRoactService(Analytics)
	local v161 = if not FFlagAXMISEnableMultiShopping then nil else useMultiItemShoppingFtux()
	local v162 = if not FFlagAXCatalogMakeupSupport then nil else useMakeupFtux()
	local v163 = useNavigation()
	local v164 = useAvatarRoute()
	local v165 = useDispatch()
	local itemId = t3.itemId
	local itemType = t3.itemType
	local lookData = t3.lookData
	local v169 = v164 and (v164.opaque and v164.opaque.name)
	local v170 = React.useCallback(function(p10) -- line: 422
		-- upvalues: selectCatalogItemCardState (copy), itemId (copy), itemType (copy)
		return (selectCatalogItemCardState(p10, itemId, itemType))
	end, {
		itemId,
		itemType
	})
	local v171 = useSelector(v170, tutils.shallowEqual)
	local v172 = if not FFlagAXMISEnableMultiShopping and not FFlagAXCatalogMakeupSupport then nil else useSelector(v105)
	local v173 = if not FFlagAXCatalogMakeupSupport then nil else useSelector(selectEquippedLayeredMakeupAssets)
	local v174 = (not lookData or not lookData.assets) and 0 or #lookData.assets
	local v175 = (not lookData or not lookData.bundles) and 0 or #lookData.bundles
	local v176 = if not FFlagAXDurablesFooter or (not v171 or (not v171.itemData or not v171.itemData.timedOptions)) then nil else getTimedOptionDays(v171.itemData.timedOptions)
	local v177 = useLocalization({
		statusText = v171.statusText,
		details = "Feature.Avatar.Label.DetailsButton",
		detailsWithItemsCount = {
			"Feature.Avatar.Label.Details",
			quantity = v174 + v175
		},
		timedOptionDays = if not FFlagAXDurablesFooter or (not v176 or not (v176 > 0)) then nil else {
			"Feature.Durables.TimeRemaining.Days",
			number = v176
		}
	})
	local isSelected = v171.isSelected
	local itemData = v171.itemData
	local v180 = if not itemType then nil else CatalogUtils.GetRbxThumbType(itemType)
	local _150x150 = Constants.CatalogThumbnailTypeToSize.Asset._150x150

	if t3.thumbnailSize then
		local thumbnailSize = t3.thumbnailSize
		local g186 = nil
		local v185 = nil

		if v180 ~= nil then
			for _, v184 in Constants.CatalogThumbnailTypeToSize[v180] do
				if v184 == thumbnailSize then
					v185 = true
					g186 = true
				end

				if g186 then
					break
				end
			end
		end

		if not g186 then
			v185 = false
		end

		g186 = false

		if v185 then
			_150x150 = t3.thumbnailSize
		end
	end

	local v187 = getThumbSizeVectorFromParamString(_150x150)
	local v188 = if not (not not itemData and itemData.bundleType == Constants.BundleTypeIdStrings.BodyParts) or not v187 then nil else getZoomedSizeAndOffset(v187, LOOKS_IMAGE_ZOOM, LOOKS_IMAGE_OFFSET_MULTIPLIERS)
	local v189 = if not (itemId ~= nil and itemId ~= "0") then nil else `rbxthumb://type={ v180 }&id={ itemId }&{ _150x150 }`
	local v190 = React.useCallback(function(b1: boolean?) -- line: 481
		-- upvalues: itemId (copy), itemType (copy), FFlagAXCatalogItemCardSelectedOverlayButtonLogging (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), ItemTypeEnum (copy), lookData (copy), v160 (copy), v164 (copy), v165 (copy), OpenLookDetailsFromButton (copy), FFlagAXMISEnableMultiShopping (copy), v169 (copy), AvatarScreen (copy), SetLastToggledLookType (copy), NavigateWithLock (copy), v163 (copy), OpenItemDetails (copy), CatalogUtils (copy), itemData (copy), t3 (copy)
		if itemId and itemType then
			if FFlagAXCatalogItemCardSelectedOverlayButtonLogging then
				if FFlagAXMISEnableMultiShoppingUnifiedEvents then
					local ASSET = nil

					if itemType == "Asset" then
						ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
					elseif itemType == "Bundle" then
						ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
					elseif itemType == "Look" then
						ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK
					end

					sendUnifiedEventForDeferredAction({
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
						elementName = "CLICK_ITEM_DETAILS",
						itemId = itemId,
						itemType = ASSET
					})
				else
					sendUnifiedEventForDeferredAction({
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
						elementName = "CLICK_ITEM_DETAILS"
					})
				end
			end

			if itemType == ItemTypeEnum.Look then
				local t4 = {
					lookId = lookData and lookData.id,
					valueInRobux = lookData and lookData.totalValue,
					catalogAnalytics = v160,
					avatarRoute = v164
				}

				v165(OpenLookDetailsFromButton(t4))

				if FFlagAXMISEnableMultiShopping and v169 ~= AvatarScreen.MySharedAvatars then
					if lookData then
						v165(SetLastToggledLookType({
							lastToggledLookType = lookData.lookType
						}))
					end

					v165(NavigateWithLock(function() -- line: 524
						-- upvalues: v163 (copy), AvatarScreen (copy)
						v163.navigate(AvatarScreen.LookDetails)
					end))

					return
				end
			else
				v165(OpenItemDetails({
					itemId = itemId,
					itemType = itemType,
					itemSubType = CatalogUtils.GetItemSubType(itemType, itemData),
					priceInRobux = if not itemData then nil else itemData.priceInRobux,
					catalogAnalytics = v160,
					avatarRoute = v164,
					navigation = v163,
					itemDetailsPeekViewRefs = t3.itemDetailsPeekViewRefs,
					resultsListRef = t3.resultsListRef,
					widgetInfo = t3.widgetAnalyticsInfo,
					showFullWithNoPeekView = b1
				}))
			end
		end
	end, {
		v165,
		itemId,
		itemType,
		v160,
		v164,
		v163,
		t3.itemDetailsPeekViewRefs,
		t3.resultsListRef,
		t3.widgetAnalyticsInfo,
		lookData,
		v169
	})

	if FFlagAXWearTimeSupport then
		useCatalogItemCardFtux({
			isSelected = isSelected,
			itemData = itemData
		})
	end

	local v191 = nil

	if FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation then
		v191 = React.useCallback(function() -- line: 566
			-- upvalues: v190 (copy)
			v190(true)
		end, { v190 })
	end

	local v192 = React.useCallback(function() -- line: 572
		-- upvalues: logOnOverlayClosed (copy), v155 (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), v156 (copy), itemId (copy), v190 (copy), v165 (copy), MaybePromptForR15Upgrade (copy), v163 (copy), itemType (copy)
		return v165(MaybePromptForR15Upgrade(v163, itemId, itemType, function() --[[ onR15PromptWillClose ]] -- line: 573
			-- upvalues: logOnOverlayClosed (copy), v155 (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), v156 (copy), itemId (copy), v190 (copy)
			logOnOverlayClosed("CatalogItemCard", v155)

			if not FFlagAXMigrateAXToGlobalAutofocus and v155 then
				v156.captureFocus()
			end

			if itemId then
				v190()
			end
		end, nil, true))
	end, {
		if not FFlagAXMigrateAXToGlobalAutofocus then v155 else nil,
		if not FFlagAXMigrateAXToGlobalAutofocus then v156 else nil,
		itemId,
		v190,
		v165,
		v163,
		itemId,
		itemType
	})
	local v193 = React.useCallback(function(b2: boolean?) -- line: 613
		-- upvalues: itemId (copy), itemType (copy), ItemTypeEnum (copy), isSelected (copy), v157 (copy), v151 (copy), v169 (copy), v165 (copy), SetFullView (copy), v160 (copy), FullView (copy), FFlagAXMISEnableMultiShopping (copy), AvatarScreen (copy), TryOnLookV2 (copy), v158 (copy), v163 (copy), t3 (copy), PeekViewState (copy), RemoveLookFromTryOn (copy), SetTryOnManagerPeekViewState (copy), AddAnalyticsMetadata (copy), SendDetailedCatalogAnalytics (copy), WidgetConstants (copy), v192 (copy), CatalogUtils (copy), itemData (copy), ToggleTryOnThunk (copy), v164 (copy), v171 (copy), v159 (copy), Constants (copy), SetCurrentToastMessage (copy), t1 (copy), SetAnimationPreview (copy), WebApi (copy), CloseAllItemDetails (copy)
		if not itemId or not itemType then
			return
		end

		if itemType == ItemTypeEnum.Look then
			if not isSelected then
				if v157 then
					local v229 = if not v151 then nil else v151.current

					if v229 ~= nil then
						v157.setSelectedItemInstance(v229)
					end
				end

				if v169 ~= nil then
					v165(SetFullView(v160, v169, FullView.None))
				end

				local n1 = 2

				if FFlagAXMISEnableMultiShopping and v169 ~= AvatarScreen.MySharedAvatars then
					n1 = 1
				end

				v165(TryOnLookV2(v158, v163, t3.widgetAnalyticsInfo, itemId, if not FFlagAXMISEnableMultiShopping then nil else PeekViewState.SuperBrief, n1))
			else
				if v157 then
					v157.setSelectedItemInstance(nil)
				end

				if FFlagAXMISEnableMultiShopping then
					v165(RemoveLookFromTryOn(itemId))
				end

				v165(SetTryOnManagerPeekViewState(PeekViewState.Closed))
			end

			if t3.isOrganic then
				if not isSelected then
					local analyticsContext = t3.analyticsContext
					local analyticsItemCountPerPage = t3.analyticsItemCountPerPage
					local index = t3.index

					v165(AddAnalyticsMetadata({
						selectedItemIndex = index
					}))
					v165(SendDetailedCatalogAnalytics(analyticsContext, v160.clickCatalogItem, itemId, itemType, index, analyticsItemCountPerPage, false))

					return
				end
			else
				v160.widgetInteractionV2(t3.widgetAnalyticsInfo, if not isSelected then WidgetConstants.ActionType.ITEM_CLICK else WidgetConstants.ActionType.ITEM_DESELECTED)
			end

			return
		end

		if v192() then
			return
		end

		local v234 = CatalogUtils.GetItemSubType(itemType, itemData)
		local v235 = isSelected

		if FFlagAXMISEnableMultiShopping then
			v165(SetTryOnManagerPeekViewState(PeekViewState.Closed))
		end

		v165(ToggleTryOnThunk(v158, v160, itemType, v234, itemId, true, v164, v163, t3.widgetAnalyticsInfo, nil, if not FFlagAXMISEnableMultiShopping then nil else b2))

		if not FFlagAXMISEnableMultiShopping and v157 then
			v165(SetTryOnManagerPeekViewState(PeekViewState.Closed))
		end

		if v157 and v235 then
			v157.setSelectedItemInstance()
		end

		if not v235 then
			if v157 then
				v157.setSelectedItemInstance(v151.current)
			end

			if isSelected then
				return
			end

			if v171.fullView[v164.opaque.name] == FullView.UIFullView then
				v165(SetFullView(v159, v164.opaque.name, FullView.None))
			end
		end

		if isSelected then
			return
		end

		local v236 = itemData and itemData.assetType

		if v171.isAvatarR6 and v236 ~= Constants.AssetTypeIdStrings.HairAccessory and Constants.LayeredAssetTypes[v236] ~= nil then
			v165(SetCurrentToastMessage(t1))
		end

		if itemType == Constants.ItemType.Asset and Constants.AssetTypeIdToCategory[v234] == Constants.AssetCategories.Animation then
			v165(SetAnimationPreview(itemId, v236))
		end

		local analyticsContext = t3.analyticsContext
		local analyticsItemCountPerPage = t3.analyticsItemCountPerPage
		local index = t3.index
		local adTrackingData = t3.adTrackingData

		v165(AddAnalyticsMetadata({
			selectedItemIndex = index
		}))
		v165(SendDetailedCatalogAnalytics(analyticsContext, v160.clickCatalogItem, itemId, itemType, index, analyticsItemCountPerPage, false))

		if t3.widgetAnalyticsInfo then
			local widgetAnalyticsInfo = t3.widgetAnalyticsInfo

			v160.widgetInteractionV2(widgetAnalyticsInfo, WidgetConstants.ActionType.ITEM_CLICK)
		end

		if adTrackingData then
			WebApi.TrackSponsoredItemClick(v158, adTrackingData)
		end

		if v171.isItemDetailsViewStateFull then
			v165(CloseAllItemDetails(v163))
		end
	end, {
		v165,
		itemId,
		v192,
		itemData,
		v158,
		v160,
		itemType,
		v164,
		v163,
		t3.widgetAnalyticsInfo,
		v157,
		v171.fullView,
		v171.isAvatarR6,
		v171.isItemDetailsViewStateFull,
		v159,
		v164.opaque.name,
		t3.analyticsContext,
		t3.analyticsItemCountPerPage,
		t3.index,
		t3.adTrackingData,
		isSelected,
		v169
	})
	local v194 = if not FFlagAXMISEnableMultiShopping then nil else React.useCallback(function() -- line: 846
		-- upvalues: itemType (copy), ItemTypeEnum (copy), isSelected (copy), v169 (copy), AvatarScreen (copy), v172 (copy), lookData (copy), Constants (copy), v161 (copy), v163 (copy), v193 (copy)
		local v242 = itemType == ItemTypeEnum.Look

		if not isSelected and (v169 ~= AvatarScreen.MySharedAvatars and v242) and (v172 and next(v172) ~= nil and lookData and lookData.lookType ~= Constants.LookType.Makeup and v161 and v161.shouldShowWearAvatarReplaceAllItemsPrompt()) then
			v163.navigate(AvatarScreen.WearAvatarReplaceAllItemsPrompt, {
				onConfirm = function(p11) --[[ onConfirm ]] -- line: 861
					-- upvalues: v161 (copy), v193 (copy)
					if p11 then
						v161.hideWearAvatarReplaceAllItemsPrompt()
					end

					v193()
				end
			})

			return
		end

		v193()
	end, {
		itemType,
		v193,
		isSelected,
		v172,
		v161,
		v169,
		v163,
		lookData
	})
	local v195 = if not FFlagAXCatalogMakeupSupport then nil else React.useCallback(function() -- line: 887
		-- upvalues: itemId (copy), itemType (copy), getTryOnItemReducerKey (copy), v172 (copy), Constants (copy), FFlagAXMISEnableMultiShopping (copy), u102 (ref), MAX_MAKEUP_LAYERS (copy), v173 (copy), v162 (copy), itemData (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), v163 (copy), AvatarScreen (copy), v193 (copy)
		local v243 = nil

		if itemId and itemType then
			v243 = getTryOnItemReducerKey(itemId, itemType)
		end

		local v244 = v172 and (not v172[v243] and itemType == Constants.ItemType.Asset)
		local v245 = if not FFlagAXMISEnableMultiShopping or (not v244 or not v172) then nil else u102(v172)
		local v246 = FFlagAXMISEnableMultiShopping and (v245 and #v245 == MAX_MAKEUP_LAYERS)
		local v247 = FFlagAXMISEnableMultiShopping and (v173 and (v245 and #v173 + #v245 >= MAX_MAKEUP_LAYERS))

		if v162 and v162.shouldShowMakeupMax6LayersPrompt() and itemData and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[itemData.assetType] and v244 and (v173 and #v173 == MAX_MAKEUP_LAYERS or v246 or v247) then
			v163.navigate(AvatarScreen.MakeupMax6LayersPrompt, {
				onConfirm = function(p12) --[[ onConfirm ]] -- line: 923
					-- upvalues: v162 (copy), v193 (copy)
					if p12 then
						v162.hideMakeupMax6LayersPrompt()
					end

					v193()
				end
			})

			if FFlagAXMISEnableMultiShopping then
				v162.incrementSeenMakeupMax6LayersPrompt()

				return
			end
		else
			v193()
		end
	end, {
		v162,
		v163,
		v193,
		itemData,
		v173,
		v172,
		itemId,
		itemType
	})
	local v196 = React.useMemo(function() -- line: 951
		-- upvalues: RoactGamepad (copy), v190 (copy), v193 (copy)
		return {
			OpenDetails = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonL3, function() -- line: 954
				-- upvalues: v190 (copy)
				v190(true)
			end, {
				key = "Feature.Catalog.Action.OpenDetails"
			}) or nil,
			Select = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonA, function() -- line: 961
				-- upvalues: v193 (copy)
				v193()
			end, {
				key = "Feature.Avatar.Action.Select"
			}) or nil
		}
	end, {
		v193,
		v190
	})
	local v197 = React.useCallback(function(_: number) -- line: 969
		-- upvalues: t3 (copy), itemId (copy)
		if t3.onThumbnailLoaded then
			t3.onThumbnailLoaded(itemId)
		end
	end, { t3.onThumbnailLoaded })
	local v198 = React.useMemo(function() -- line: 975
		-- upvalues: lookData (copy), Cryo (copy)
		if lookData then
			local v249 = Cryo.List.map(if not lookData.assets then {} else lookData.assets, function(p13) -- line: 977
				return p13.id
			end)
			local v250 = Cryo.List.map(if not lookData.bundles then {} else lookData.bundles, function(p14) -- line: 980
				return p14.id
			end)

			return {
				assetIds = v249,
				bundleIds = v250
			}
		end

		return {}
	end, { lookData })
	local v199 = t3.hydratedContent or {
		price = nil
	}
	local v200 = if not t3.gridInformation then nil else t3.gridInformation.gridPositionRow
	local v201 = if not t3.gridInformation then nil else t3.gridInformation.gridPositionColumn
	local v202 = if itemType ~= "Look" then if itemType ~= "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK
	local v203 = React.useCallback(function(p15) -- line: 1005
		-- upvalues: v151 (copy), t3 (copy), itemType (copy), lookData (copy), v199 (copy), itemId (copy), itemData (copy), addUnifiedEventLogging (copy), Cryo (copy), v200 (copy), v201 (copy), v202 (copy), isSelected (copy), UnifiedEventLogEnums (copy), v198 (copy), FFlagAXAddLookTypeEnumForLogging (copy), UnifiedEventLoggingUtils (copy), getTimedOptionForItemData (copy), FFlagAddTypesToWidgetItems (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogConstants (copy)
		if p15 then
			v151.current = p15

			local v252 = nil
			local v253 = nil
			local v254 = nil

			if t3.widgetAnalyticsInfo then
				if itemType == "Look" then
					v252 = not not lookData and lookData.totalPrice ~= nil
					v253 = not not t3.widgetAnalyticsInfo and t3.widgetAnalyticsInfo.itemId ~= nil
					v254 = true
				else
					v252 = not not v199 and v199.price ~= nil
					v253 = not not t3.widgetAnalyticsInfo and t3.widgetAnalyticsInfo.itemId ~= nil
					v254 = true
				end
			elseif t3.isOrganic then
				if itemType == "Look" then
					v252 = not not lookData and lookData.totalPrice ~= nil
					v253 = itemId ~= nil
					v254 = true
				else
					v252 = not not itemData and (itemData.lowestPrice ~= nil or itemData.priceInRobux ~= nil)
					v253 = itemId ~= nil
					v254 = not not itemData and (itemData.assetType ~= nil or itemData.bundleType ~= nil and itemData.bundleType ~= "AvatarAnimations")
				end
			end

			if v252 and v253 and v254 then
				addUnifiedEventLogging(v151, Cryo.Dictionary.join(t3.widgetAnalyticsInfo or {
					itemId = itemId,
					assetType = if not itemData then nil else itemData.assetType,
					bundleType = if not itemData then nil else itemData.bundleType,
					gridPositionRow = v200,
					gridPositionColumn = v201
				}, {
					itemType = v202,
					action = if not isSelected then UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED else UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED,
					category = t3.impressionsCategory,
					subcategory = t3.impressionsSubcategory,
					taxonomyId = t3.impressionsTaxonomyId,
					assetIds = if not t3.widgetAnalyticsInfo or not v198 then nil else v198.assetIds,
					bundleIds = if not t3.widgetAnalyticsInfo or not v198 then nil else v198.bundleIds,
					organicAssetIds = if not t3.isOrganic or not v198 then nil else v198.assetIds,
					organicBundleIds = if not t3.isOrganic or not v198 then nil else v198.bundleIds,
					organicLookType = if not FFlagAXAddLookTypeEnumForLogging or (not t3.isOrganic or not lookData) then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(lookData.lookType),
					widgetLookType = if not FFlagAXAddLookTypeEnumForLogging or (not lookData or t3.isOrganic) then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(lookData.lookType),
					organicItemPrice = if not t3.isOrganic then nil else if not lookData then if not itemData then nil else itemData.lowestPrice or itemData.priceInRobux else lookData.totalPrice,
					widgetItemPrice = if not t3.widgetAnalyticsInfo then nil else if not lookData then v199.price else lookData.totalPrice,
					organicTimedOption = if not t3.isOrganic then nil else getTimedOptionForItemData(itemData),
					widgetTimedOption = if t3.isOrganic then nil else getTimedOptionForItemData(itemData),
					widgetAssetType = if not FFlagAddTypesToWidgetItems or (t3.isOrganic or not itemData) then nil else itemData.assetType,
					widgetBundleType = if not FFlagAddTypesToWidgetItems or (t3.isOrganic or not itemData) then nil else itemData.bundleType
				}), {
					hasDeferredActions = true,
					isSelected = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else isSelected,
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
			end
		end
	end, {
		t3.widgetAnalyticsInfo,
		t3.hydratedContent,
		itemId,
		v202,
		itemData,
		v200,
		v201,
		isSelected,
		t3.impressionsCategory,
		t3.impressionsSubcategory,
		t3.impressionsTaxonomyId,
		v198,
		lookData
	})
	local v204 = nil

	if FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation then
		local v205 = React.useCallback(function() -- line: 1145
			-- upvalues: itemId (copy), itemType (copy), ItemTypeEnum (copy), FFlagAXMISEnableMultiShopping (copy), v169 (copy), AvatarScreen (copy), v165 (copy), TryOnLookV2 (copy), v158 (copy), v163 (copy), t3 (copy), PeekViewState (copy), OpenItemDetails (copy), CatalogUtils (copy), itemData (copy), v160 (copy), v164 (copy)
			if itemId and itemType then
				if itemType == ItemTypeEnum.Look then
					local n3 = 2

					if FFlagAXMISEnableMultiShopping and v169 ~= AvatarScreen.MySharedAvatars then
						n3 = 1
					end

					v165(TryOnLookV2(v158, v163, t3.widgetAnalyticsInfo, itemId, PeekViewState.Full, n3))

					return
				end

				v165(OpenItemDetails({
					itemId = itemId,
					itemType = itemType,
					itemSubType = CatalogUtils.GetItemSubType(itemType, itemData),
					priceInRobux = if not itemData then nil else itemData.priceInRobux,
					catalogAnalytics = v160,
					avatarRoute = v164,
					navigation = v163,
					itemDetailsPeekViewRefs = t3.itemDetailsPeekViewRefs,
					resultsListRef = t3.resultsListRef,
					widgetInfo = t3.widgetAnalyticsInfo,
					showFullWithNoPeekView = true
				}))
			end
		end, {
			v165,
			itemId,
			itemType,
			itemData,
			v158,
			v163,
			t3.widgetAnalyticsInfo,
			v160,
			v164,
			t3.itemDetailsPeekViewRefs,
			t3.resultsListRef
		})

		v204 = useCatalogItemCardFocusNavigationBindings({
			onOpenItemDetailsPage = v205,
			onSelectItem = if not FFlagAXMigrateAXToGlobalAutofocus then if not FFlagAXCatalogMakeupSupport or itemType ~= Constants.ItemType.Asset then if not FFlagAXMISEnableMultiShopping or itemType ~= ItemTypeEnum.Look then v193 else v194 else v195 else nil
		}, v203)
	end

	React.useEffect(function() -- line: 1207
		-- upvalues: v152 (copy), t3 (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy)
		local current = v152.current

		if current and t3.impressionsId then
			current:SetAttribute(t3.impressionsTag, t3.impressionsId)

			local v257 = OrganicEventImpressionsSchema[t3.impressionsSchema]

			ImpressionsUtil.writeItemAttributes(v257, current, t3)
		end
	end, {
		t3.impressionsId,
		t3.impressionsTag,
		t3.impressionsSchema
	})

	local cardStyle = t3.cardStyle
	local tileWidth = t3.tileWidth
	local thumbailAspectRatio = t3.thumbailAspectRatio
	local v209 = itemData and itemData.name
	local u210 = itemData and (itemData.lowestPrice or itemData.priceInRobux) or nil
	local v211 = itemData and itemData.priceStatus
	local moderationStatus = nil

	if itemData and itemData.timedOptions then
		for _, v214 in itemData.timedOptions do
			if v214.selected then
				u210 = v214.price
			end
		end
	end

	if t3.itemType == ItemTypeEnum.Look then
		u210 = lookData and lookData.totalPrice
		v209 = lookData and lookData.name

		if v169 == AvatarScreen.MySharedAvatars and lookData and lookData.owned then
			moderationStatus = lookData.moderationStatus
		end
	end

	local v215 = React.useMemo(function() -- line: 1243
		-- upvalues: t3 (copy), ItemTypeEnum (copy), getCreatorFromLookData (copy), lookData (copy), itemData (copy)
		if t3.isCreatorNameVisible then
			if t3.itemType == ItemTypeEnum.Look then
				return (getCreatorFromLookData(lookData))
			end

			local v258 = itemData

			if v258 and v258.creator then
				local v259 = v258.creator.name or v258.creatorName

				if v259 then
					return {
						name = v259,
						verified = v258.creator.hasVerifiedBadge
					}
				end
			end

			return nil
		end

		return nil
	end, {
		lookData,
		itemData,
		t3.itemType,
		t3.isCreatorNameVisible,
		t3.creatorNameTileFooterEnabled
	})
	local v216 = if not FFlagAXDurablesFooter or (not v176 or not (v176 > 0)) then nil else v177.timedOptionDays
	local v217 = React.useMemo(function() -- line: 1265
		-- upvalues: t3 (copy), v211 (copy), u210 (ref), v92 (copy), v176 (copy), Foundation (copy), v216 (copy), FFlagAXDurablesFooter (copy)
		local v260 = if not t3.isPriceVisible then nil else if not v211 then if not u210 then nil else {
			type = "price",
			price = u210 or 0
		} else {
			type = "text",
			text = v211
		}

		if v92 and v176 then
			return {
				type = "multi",
				contents = {
					v260,
					{
						type = "timedOption",
						icon = Foundation.Enums.IconName.Clock,
						text = v216 or ""
					}
				}
			}
		end

		if FFlagAXDurablesFooter and v216 and v260 then
			return {
				type = "multi",
				contents = {
					v260,
					{
						type = "timedOption",
						icon = Foundation.Enums.IconName.Clock,
						text = v216
					}
				}
			}
		end

		return v260
	end, {
		t3.isPriceVisible,
		v211,
		u210,
		v216,
		v176
	})
	local v218 = React.useCallback(function() -- line: 1304
		-- upvalues: v190 (copy)
		v190(true)
	end, { v190 })
	local v219 = if not v155 then if not FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation then v218 else v191 else nil
	local v220 = if not FFlagAXInventoryDurablesExpiredFilter then nil else getItemCardStatus(t3.itemStatusOverride, t3.itemType, moderationStatus, v177.statusText, itemData)
	local t5 = {
		ref = if not FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation then v203 else v204,
		animationTabsItemData = if not v171.showAnimationTabs then nil else itemData,
		onActivated = if not FFlagAXCatalogMakeupSupport or itemType ~= Constants.ItemType.Asset then if not FFlagAXMISEnableMultiShopping or itemType ~= ItemTypeEnum.Look then v193 else v194 else v195,
		onOverlayButtonActivated = v219,
		overlayButtonText = if not v155 then if not FFlagAXMISEnableMultiShopping then if t3.itemType ~= ItemTypeEnum.Look then v177.details else v177.detailsWithItemsCount else v177.details else nil,
		thumbnailRef = v152,
		thumbnailTag = t3.impressionsTag,
		thumbnailUrl = v189,
		onThumbnailLoaded = v197,
		thumbnailRect = v188,
		priceLineContent = v217,
		creator = v215,
		title = if not t3.isTitleVisible then nil else v209
	}
	local v222

	if t3.itemType == ItemTypeEnum.Look then
		v222 = nil
	else
		local v223 = if not itemData then nil else itemData.tileRestrictionsMap

		v222 = if not v223 then nil else if not v223[ItemTileEnums.Restriction.Limited] then if not v223[ItemTileEnums.Restriction.LimitedUnique] and not v223[ItemTileEnums.Restriction.Collectible] then nil else "Collectible" else "Limited"
	end

	t5.itemType = v222
	t5.itemInfo = if t3.itemType ~= ItemTypeEnum.Look then if not itemData or itemData.bundleType ~= Constants.BundleTypeIdStrings.DynamicHead then nil else "DynamicHead" else nil
	t5.itemStatus = if not FFlagAXInventoryDurablesExpiredFilter then if t3.itemType ~= ItemTypeEnum.Look then if not v177.statusText then showDurableBadge(itemData) else {
		type = "text",
		text = v177.statusText
	} else getLookStatusFromModerationStatus(moderationStatus) else v220
	t5.headerAspectRatio = if not tileWidth then thumbailAspectRatio else nil
	t5.headerSize = if not tileWidth then nil else UDim2.fromOffset(tileWidth, tileWidth / (thumbailAspectRatio or 1))
	t5.isSelected = isSelected
	t5.backgroundLayers = if not FFlagAXLookAndFeelBackgrounds or not cardStyle then nil else cardStyle.backgroundLayers
	t5.inputBindings = if not FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation then v196 else nil

	return t5
end
