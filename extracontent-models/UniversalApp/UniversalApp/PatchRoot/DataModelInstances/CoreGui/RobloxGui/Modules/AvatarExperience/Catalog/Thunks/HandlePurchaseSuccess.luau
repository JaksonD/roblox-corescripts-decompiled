local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Promise = require(CorePackages.Packages.Promise)
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local Cryo = require(CorePackages.Packages.Cryo)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = AvatarExperienceCatalog.WidgetConstants
local ApiFetchEconomyCurrency = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local SetPurchaseErrorToast = require(Modules.LuaApp.Thunks.SetPurchaseErrorToast)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ItemData = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ToastType = require(Modules.LuaApp.Enum.ToastType)
local SetAssetOwned = require(Modules.AvatarExperience.Common.Actions.SetAssetOwned)
local SetBundleOwned = require(Modules.AvatarExperience.Common.Actions.SetBundleOwned)
local CloseAllItemDetails = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)
local FetchAssetResellers = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetResellers)
local FetchSellPageData = require(Modules.AvatarExperience.Catalog.Thunks.FetchSellPageData)
local FetchCollectibResellersInstances = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances)
local FetchCollectibleResellableInstances = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances)
local FetchAssetOrBundleInfo = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local ToggleEquipAsset = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local SetCurrentToastMessage = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local AccessoryAdjustmentUtils = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local selectSearchKeyword = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword
local getTryOnItemReducerKey = AvatarExperienceCommon.Utils.getTryOnItemReducerKey
local avatarLastEquippedStateStore = AvatarExperienceCommon.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local sendUnifiedEventForDeferredAction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local mutedError = require(CorePackages.Workspace.Packages.Loggers).mutedError
local CartIdService = AvatarExperienceAnalytics.Lib.CartIdService
local UnifiedSelectionListStore = AvatarExperienceAnalytics.Store.UnifiedSelectionListStore
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlags.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXFixPurchaseSurfaceLogging = SharedFlags.FFlagAXFixPurchaseSurfaceLogging
local FFlagAXFixWearAfterPurchaseToggleForEquippedAssets = AvatarExperienceFlags.FFlagAXFixWearAfterPurchaseToggleForEquippedAssets
local FFlagAXUnifiedPurchaseExtendRentalsFix = AvatarExperienceFlags.FFlagAXUnifiedPurchaseExtendRentalsFix
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlags.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace = AvatarExperienceFlags.FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace
local t1 = {
	toastMessage = "Feature.Catalog.Label.Purchased",
	isLocalized = false,
	toastType = ToastType.SuccessConfirmation
}

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15) --[[ handlePurchaseSuccess ]] -- line: 76
	-- upvalues: ItemData (copy), CatalogUtils (copy), FetchCollectibResellersInstances (copy), CatalogConstants (copy), FetchCollectibleResellableInstances (copy), FetchAssetResellers (copy), FetchSellPageData (copy), Constants (copy), SetAssetOwned (copy), FFlagAXUnifiedPurchaseExtendRentalsFix (copy), FetchAssetOrBundleInfo (copy), SetBundleOwned (copy), ArgCheck (copy), ApiFetchEconomyCurrency (copy), AvatarScreenProperties (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), Cryo (copy), CartIdService (copy), selectSearchKeyword (copy), mutedError (copy), UnifiedSelectionListStore (copy), AccessoryAdjustmentUtils (copy), WidgetConstants (copy), FFlagAXFixPurchaseSurfaceLogging (copy), FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace (copy), SetCurrentToastMessage (copy), t1 (copy), CloseAllItemDetails (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), FFlagAXFixWearAfterPurchaseToggleForEquippedAssets (copy), getTryOnItemReducerKey (copy), ToggleEquipAsset (copy), Promise (copy), SetPurchaseErrorToast (copy)
	return function(p16) -- line: 93
		-- upvalues: ItemData (copy), p4 (copy), p5 (copy), CatalogUtils (copy), p1 (copy), p6 (copy), FetchCollectibResellersInstances (copy), p3 (copy), CatalogConstants (copy), FetchCollectibleResellableInstances (copy), FetchAssetResellers (copy), FetchSellPageData (copy), Constants (copy), SetAssetOwned (copy), FFlagAXUnifiedPurchaseExtendRentalsFix (copy), FetchAssetOrBundleInfo (copy), p7 (copy), SetBundleOwned (copy), ArgCheck (copy), ApiFetchEconomyCurrency (copy), p2 (copy), p10 (copy), AvatarScreenProperties (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), p12 (copy), sendUnifiedEventForDeferredAction (copy), Cryo (copy), CartIdService (copy), selectSearchKeyword (copy), mutedError (copy), UnifiedSelectionListStore (copy), p14 (copy), p13 (copy), p8 (copy), AccessoryAdjustmentUtils (copy), p9 (copy), WidgetConstants (copy), p11 (copy), FFlagAXFixPurchaseSurfaceLogging (copy), p15 (copy), FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace (copy), SetCurrentToastMessage (copy), t1 (copy), CloseAllItemDetails (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), FFlagAXFixWearAfterPurchaseToggleForEquippedAssets (copy), getTryOnItemReducerKey (copy), ToggleEquipAsset (copy), Promise (copy), SetPurchaseErrorToast (copy)
		local v65 = ItemData(p16:getState().AvatarExperience.Common, p4, p5)
		local v66 = CatalogUtils.IsResellable(v65)
		local v67 = p1

		if type(v67) == "table" then
			if v66 then
				if p6 then
					p16:dispatch(FetchCollectibResellersInstances(p3, p6, nil, CatalogConstants.MaxResellersPerPage))

					local LocalUserId = p16:getState().LocalUserId

					p16:dispatch(FetchCollectibleResellableInstances(p3, p6, LocalUserId))
				else
					p16:dispatch(FetchAssetResellers(p3, p4, nil, CatalogConstants.MaxResellersPerPage, true))

					local LocalUserId = p16:getState().LocalUserId

					p16:dispatch(FetchSellPageData(p3, p4, LocalUserId))
				end
			end

			if v67.purchased then
				if p5 == Constants.ItemType.Asset then
					p16:dispatch(SetAssetOwned(p4, true))

					if FFlagAXUnifiedPurchaseExtendRentalsFix then
						p16:dispatch(FetchAssetOrBundleInfo(p3, p7, p4, p5, true))
					end
				else
					p16:dispatch(SetBundleOwned(p4, true))
				end

				local v70 = p3
				local LocalUserId = p16:getState().LocalUserId

				ArgCheck.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")

				if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
					p16:dispatch(ApiFetchEconomyCurrency(v70, LocalUserId, true))
				end

				local ok, result = pcall(function() -- line: 132
					-- upvalues: p2 (copy), Constants (copy), p10 (copy), AvatarScreenProperties (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), p5 (copy), UnifiedEventLogEnums (copy), p12 (copy), sendUnifiedEventForDeferredAction (copy), Cryo (copy), p16 (copy), CartIdService (copy), selectSearchKeyword (copy), p4 (copy)
					local v86 = false

					if p2[Constants.WearAfterPurchasePostPurchaseActionKey] then
						v86 = p2[Constants.WearAfterPurchasePostPurchaseActionKey]
					end

					local v87 = nil

					if p10 and p10.current and p10.opaque then
						v87 = AvatarScreenProperties[p10.opaque.name]
					end

					local ASSET = nil

					if FFlagAXMISEnableMultiShoppingUnifiedEvents then
						if p5 == "Asset" then
							ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
						elseif p5 == "Bundle" then
							ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
						end
					end

					local v89 = p12 or {
						widgetType = nil
					}

					sendUnifiedEventForDeferredAction(Cryo.Dictionary.join(p16:getState().AvatarExperience.AnalyticsMetadata, {
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
						cartId = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else CartIdService.getCartId(),
						keyword = selectSearchKeyword(p16:getState()),
						itemId = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else p4,
						itemType = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else ASSET,
						surface = if not v87 or not v87.analyticsData then nil else v87.analyticsData.unifiedLoggingSurface,
						widgetItemWearAfterPurchase = if not v89.widgetType then nil else v86,
						organicItemWearAfterPurchase = if not v89.widgetType then v86 else nil
					}))
				end)

				if not ok then
					mutedError(result)
				end

				if FFlagAXMISEnableMultiShoppingUnifiedEvents then
					CartIdService.refreshCartId()
					UnifiedSelectionListStore.clearSelectionList()
				end

				local TryOnItems = p16:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems

				if p5 == Constants.ItemType.Asset then
					p7.purchaseAsset(p4, p14, p13, p8, AccessoryAdjustmentUtils.checkTryOnHasAdjustments(TryOnItems, (tostring(p4))), p9)
				elseif p5 == Constants.ItemType.Bundle then
					p7.purchaseBundle(p4, p14, p13, p8, p9)
				end

				if p12 then
					local v75 = Cryo.Dictionary.join(p12, {
						totalRobux = p13
					})

					p7.widgetInteractionV2(v75, WidgetConstants.ActionType.PURCHASE_SUCCESS)
				end

				local RequestId = p16:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId
				local v77 = p16:getState()
				local v78 = selectSearchKeyword(v77)
				local v79, v80 = CatalogUtils.getCategoryAndSubcategory(v77)

				p7.avatarShopBuyItem(p4, p5, p13, p11, RequestId, v78, v79, v80, p16:getState().AvatarExperience.AnalyticsMetadata, if not FFlagAXFixPurchaseSurfaceLogging or not p15 then nil else p15.getParam(Constants.NavigationParams.fromSurface))

				if not FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace then
					p16:dispatch(SetCurrentToastMessage(t1))
				end

				p16:dispatch(CloseAllItemDetails(p15))

				if p2[Constants.WearAfterPurchasePostPurchaseActionKey] and p5 == Constants.ItemType.Asset and p14 ~= Constants.AssetTypeIdStrings.EmoteAnimation then
					if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
						avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
					end

					local v81 = nil

					if FFlagAXFixWearAfterPurchaseToggleForEquippedAssets then
						local EquippedAssets = p16:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets

						v81 = EquippedAssets and (EquippedAssets[p14] and EquippedAssets[p14][p4] ~= nil)
					end

					if not v81 then
						local v83 = getTryOnItemReducerKey(p4, p5)
						local v84 = TryOnItems[v83] and TryOnItems[v83].order
						local v85 = TryOnItems[v83] and {
							position = TryOnItems[v83].position,
							rotation = TryOnItems[v83].rotation,
							scale = TryOnItems[v83].scale
						}

						p16:dispatch(ToggleEquipAsset(p14, p4, p15, false, v84, v85))
					end
				end

				return Promise.resolve(v67)
			end

			p16:dispatch(SetPurchaseErrorToast(v67))

			return Promise.reject(v67)
		end
	end
end
