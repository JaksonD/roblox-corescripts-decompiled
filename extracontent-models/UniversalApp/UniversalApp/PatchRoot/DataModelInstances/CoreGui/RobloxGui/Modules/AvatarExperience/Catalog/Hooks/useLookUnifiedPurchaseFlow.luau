local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local Modules = CoreGui.RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local Cryo = require(CorePackages.Packages.Cryo)
local Promise = require(CorePackages.Packages.Promise)
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local Constants = require(Modules.AvatarExperience.Common.Constants)
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = AvatarExperienceCatalog.WidgetConstants

require(Modules.AvatarExperience.Common.Reducers.Looks)

local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local Analytics2 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local CartIdService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService
local OpenCentralOverlayForUnifiedPurchasePrompt = require(Modules.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
local CloseCentralOverlay = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NavigateWithLock = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local addUnifiedEventLogging = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLoggingUtils = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Utils.UnifiedEventLoggingUtils
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local ProductPurchaseSurface = require(CorePackages.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local FFlagAXAddLookTypeEnumForLogging = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddLookTypeEnumForLogging
local useAvatarSaveContext = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext
local GetAvatarEditorCategories = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local Constants3 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local LookUtils = require(Modules.AvatarExperience.Common.Util.LookUtils)
local HandleLooksPurchaseSuccess = require(Modules.AvatarExperience.Catalog.Thunks.HandleLooksPurchaseSuccess)
local LookDetailsBottomBarUtils = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local v40 = game:DefineFastFlag("AXFixUnifiedPurchaseFlowSessionTag", false)
local FFlagAXUnifiedPurchasePromptTimedOptionsInLooks = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXUnifiedPurchasePromptTimedOptionsInLooks
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXRenameBackToAddToAvatar = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRenameBackToAddToAvatar
local FFlagAXBlackbirdRoot = AvatarExperienceFlags.FFlagAXBlackbirdRoot
local v45 = game:DefineFastFlag("HideLookDiscountPercentWithIneligibleItems", false)

return function(t1: {[any]: any}) --[[ useLookUnifiedPurchaseFlow ]] -- line: 118
	-- upvalues: useDispatch (copy), useNavigation (copy), useAvatarRoute (copy), useRoactService (copy), RoactNetworking (copy), Analytics (copy), Analytics2 (copy), useAvatarSaveContext (copy), React (copy), LookUtils (copy), Cryo (copy), WidgetConstants (copy), CloseCentralOverlay (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), FFlagAXAddLookTypeEnumForLogging (copy), v40 (copy), UnifiedEventLogEnums (copy), CartIdService (copy), UnifiedEventLoggingUtils (copy), addUnifiedEventLogging (copy), UnifiedEventLogConstants (copy), LookDetailsBottomBarUtils (copy), HandleLooksPurchaseSuccess (copy), FFlagAXBlackbirdRoot (copy), v45 (copy), Promise (copy), FFlagAXUnifiedPurchasePromptTimedOptionsInLooks (copy), FFlagAXCatalogMakeupSupport (copy), Constants (copy), OpenCentralOverlayForUnifiedPurchasePrompt (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagAXRenameBackToAddToAvatar (copy), ProductPurchaseSurface (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), Constants2 (copy), Constants3 (copy), GetAvatarEditorCategories (copy), AvatarScreen (copy), NavigateWithLock (copy)
	local v55 = useDispatch()
	local v56 = useNavigation()
	local v57 = useAvatarRoute()
	local v58 = useRoactService(RoactNetworking)
	local v59 = useRoactService(Analytics)
	local v60 = useRoactService(Analytics2)
	local v61 = useAvatarSaveContext()
	local v62 = React.useCallback(function() -- line: 128
		-- upvalues: LookUtils (copy), t1 (copy), Cryo (copy), v59 (copy), WidgetConstants (copy)
		local _, _, _, v72 = LookUtils.getPurchaseInfoForLookId(t1.tryOnItems, t1.lookDetailsObj, t1.lookId)
		local v73 = if not t1.lookAnalyticsInfo then nil else Cryo.Dictionary.join(t1.lookAnalyticsInfo, {
			totalRobux = t1.totalPrice,
			assetIds = v72
		})

		if v73 and #v72 > 0 then
			v59.widgetInteractionV2(v73, WidgetConstants.ActionType.PURCHASE_ATTEMPT)
		end
	end, {
		t1.tryOnItems,
		t1.lookDetailsObj,
		t1.lookId,
		t1.lookAnalyticsInfo,
		t1.totalPrice,
		v59
	})
	local v63 = React.useCallback(function() -- line: 153
		-- upvalues: v55 (copy), CloseCentralOverlay (copy)
		v55(CloseCentralOverlay())
	end, { v55 })
	local v64 = React.useCallback(function(p1) -- line: 158
		-- upvalues: FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), t1 (copy), FFlagAXAddLookTypeEnumForLogging (copy), v40 (copy), Cryo (copy), UnifiedEventLogEnums (copy), CartIdService (copy), UnifiedEventLoggingUtils (copy), addUnifiedEventLogging (copy), UnifiedEventLogConstants (copy)
		if FFlagAXMISEnableMultiShoppingUnifiedEvents and not t1.lookAnalyticsInfo then
			t1.lookAnalyticsInfo = {}
		end

		if p1 and t1.lookAnalyticsInfo then
			local t2 = {
				current = p1
			}
			local v76 = if not FFlagAXAddLookTypeEnumForLogging or (not t1.lookId or (not t1.lookDetailsObj or not t1.lookDetailsObj[t1.lookId])) then nil else t1.lookDetailsObj[t1.lookId].lookType

			if v40 then
				local v77 = Cryo.Dictionary.join(t1.lookAnalyticsInfo, {
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
					cartId = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else CartIdService.getCartId(),
					itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK,
					organicLookType = if not FFlagAXAddLookTypeEnumForLogging or (t1.lookAnalyticsInfo.widgetType or not v76) then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(v76),
					widgetLookType = if not FFlagAXAddLookTypeEnumForLogging or (not t1.lookAnalyticsInfo.widgetType or not v76) then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(v76),
					widgetItemPrice = if not t1.lookAnalyticsInfo.widgetType then nil else t1.totalPrice,
					organicItemPrice = if not t1.lookAnalyticsInfo.widgetType then t1.totalPrice else nil
				})

				addUnifiedEventLogging(t2, v77, {
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})

				return
			end

			local v78 = Cryo.Dictionary.join(t1.lookAnalyticsInfo, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
				cartId = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else CartIdService.getCartId(),
				itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK,
				organicLookType = if not FFlagAXAddLookTypeEnumForLogging or (t1.lookAnalyticsInfo.widgetType or not v76) then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(v76),
				widgetLookType = if not FFlagAXAddLookTypeEnumForLogging or (not t1.lookAnalyticsInfo.widgetType or not v76) then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(v76),
				widgetItemPrice = if not t1.lookAnalyticsInfo.widgetType then nil else t1.totalPrice,
				organicItemPrice = if not t1.lookAnalyticsInfo.widgetType then t1.totalPrice else nil,
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			}, {
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})

			addUnifiedEventLogging(t2, v78)
		end
	end, {
		t1.totalPrice,
		t1.lookAnalyticsInfo,
		if not FFlagAXAddLookTypeEnumForLogging then nil else t1.lookDetailsObj,
		if not FFlagAXAddLookTypeEnumForLogging then nil else t1.lookId
	})
	local v65 = React.useCallback(function(p2, p3) -- line: 230
		-- upvalues: LookDetailsBottomBarUtils (copy), t1 (copy), LookUtils (copy), Cryo (copy), v55 (copy), HandleLooksPurchaseSuccess (copy), v58 (copy), v61 (copy), v56 (copy), v59 (copy), v60 (copy), v57 (copy)
		local v81 = LookDetailsBottomBarUtils.getOwnedTryOnItems(t1.tryOnItems, t1.lookDetailsObj, t1.lookId)
		local isTryOnFromOutsideAX = t1.isTryOnFromOutsideAX
		local _, _, _, v86 = LookUtils.getPurchaseInfoForLookId(t1.tryOnItems, t1.lookDetailsObj, t1.lookId)
		local v87 = if not t1.lookAnalyticsInfo then nil else Cryo.Dictionary.join(t1.lookAnalyticsInfo, {
			totalRobux = t1.totalPrice,
			assetIds = v86
		})

		v55(HandleLooksPurchaseSuccess(p2, p3, v58, t1.lookId, t1.totalPrice, t1.tryOnItems, v81, v61, isTryOnFromOutsideAX, v87, v56, v59, v60, v57))
	end, {
		v55,
		v58,
		t1.lookId,
		t1.lookAnalyticsInfo,
		t1.totalPrice,
		t1.tryOnItems,
		v61,
		v56,
		v59,
		v60,
		t1.lookDetailsObj,
		v57,
		t1.isTryOnFromOutsideAX
	})
	local v66 = if not FFlagAXBlackbirdRoot then nil else React.useCallback(function() -- line: 283
		-- upvalues: t1 (copy), v45 (copy), Promise (copy)
		local t3 = {}
		local v89 = if not t1.lookId or (not t1.lookDetailsObj[t1.lookId] or not t1.lookDetailsObj[t1.lookId].lookDiscounts) then nil else t1.lookDetailsObj[t1.lookId].lookDiscounts

		if v89 then
			local v90 = v89[1]

			t3.Type = v90.discountCampaign
			t3.AmountInRobux = if not t1.originalPrice then nil else t1.originalPrice - t1.totalPrice
			t3.Percent = if not v45 or not t1.hasNonDiscountedItems then v90.robuxDiscountPercentage else 0
		end

		return Promise.resolve({
			PriceInRobux = t1.totalPrice,
			IsForSale = true,
			Name = "Looks",
			BasePriceInRobux = t1.originalPrice,
			PriceDiscountDetails = { t3 }
		})
	end, {
		t1.lookId,
		t1.lookDetailsObj,
		t1.originalPrice,
		t1.totalPrice,
		if not v45 then nil else t1.hasNonDiscountedItems
	})
	local v67 = React.useCallback(function() -- line: 325
		-- upvalues: t1 (copy), FFlagAXUnifiedPurchasePromptTimedOptionsInLooks (copy), LookUtils (copy), FFlagAXCatalogMakeupSupport (copy), Constants (copy), v55 (copy), OpenCentralOverlayForUnifiedPurchasePrompt (copy), v63 (copy), v62 (copy), v65 (copy), v64 (copy), FFlagAXBlackbirdRoot (copy), v66 (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagAXRenameBackToAddToAvatar (copy), ProductPurchaseSurface (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy)
		if not t1.lookId then
			return
		end

		local v91 = nil
		local v93, v94

		if FFlagAXUnifiedPurchasePromptTimedOptionsInLooks then
			local v92, v95

			v92, v93, v94, v95, v91 = LookUtils.getPurchaseInfoForLookId(t1.tryOnItems, t1.lookDetailsObj, t1.lookId)
		else
			local v96, v97

			v96, v93, v94, v97 = LookUtils.getPurchaseInfoForLookId(t1.tryOnItems, t1.lookDetailsObj, t1.lookId)
		end

		local v98 = if not FFlagAXCatalogMakeupSupport or (not t1.lookDetailsObj or (not t1.lookDetailsObj[t1.lookId] or not t1.lookDetailsObj[t1.lookId].lookType)) then nil else t1.lookDetailsObj[t1.lookId].lookType == Constants.LookType.Makeup

		v55(OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = {
				kind = "Look",
				id = t1.lookId,
				expectedPrice = t1.totalPrice,
				salesLocationId = 0,
				excludedAssetIds = v93,
				excludedBundleIds = v94,
				timedOptions = if not FFlagAXUnifiedPurchasePromptTimedOptionsInLooks or (not v91 or not (#v91 > 0)) then nil else v91
			},
			purchaseCallbacks = {
				onFlowComplete = v63,
				onPurchaseAttempt = v62,
				onPurchaseSuccess = v65,
				onBuyItemButtonMounted = v64,
				fetchProductInfo = if not FFlagAXBlackbirdRoot then nil else v66
			},
			postPurchaseActions = {
				{
					label = if not FFlagAXCatalogMakeupSupport or not v98 then if not FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then t1.localized.wearAfterPurchaseLabel else t1.localized.wearAvatarAfterPurchaseLabel else t1.localized.wearAfterPurchaseMakeupLabel,
					actionKey = Constants.WearAfterPurchasePostPurchaseActionKey,
					isActionSelected = true
				},
				{
					label = if not FFlagAXCatalogMakeupSupport or not v98 then if not FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then t1.localized.addToMyAvatarsLabel else if not FFlagAXRenameBackToAddToAvatar then t1.localized.saveAsCharacterLabel else t1.localized.addToMyAvatarsLabel else t1.localized.saveAsMakeupLookLabel,
					actionKey = Constants.SaveAsCharacterPostPurchaseActionKey,
					isActionSelected = true
				}
			},
			purchaseAnalyticsMetadata = {
				surface = ProductPurchaseSurface.Catalog
			},
			purchaseOptions = if not FFlagAXUnifiedPurchasePromptTimedOptionsInLooks then nil else {
				shouldSkipOwnershipCheck = true
			}
		}, not not FFlagAddPerformanceMetricsToUnifiedPurchaseModal or nil))
	end, {
		v55,
		t1.lookId,
		t1.totalPrice,
		t1.tryOnItems,
		t1.lookDetailsObj,
		v58,
		v61,
		v56,
		v59,
		v60,
		t1.localized,
		v57,
		t1.isTryOnFromOutsideAX,
		v63,
		v62,
		v65,
		v64,
		if not FFlagAXBlackbirdRoot then nil else v66
	})
	local v68 = React.useCallback(function() -- line: 434
		-- upvalues: t1 (copy), v59 (copy), Constants2 (copy), Cryo (copy), Constants3 (copy), GetAvatarEditorCategories (copy), AvatarScreen (copy), v56 (copy), v55 (copy), NavigateWithLock (copy), v67 (copy)
		if t1.userRobux < t1.totalPrice then
			v59.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux)
		end

		if Cryo.isEmpty(t1.itemsToPurchase) and t1.lookId ~= nil then
			local CharacterKey = Constants3.CharacterKey
			local v100 = nil

			for v101, v102 in (GetAvatarEditorCategories()) do
				if CharacterKey == v102.Name then
					v100 = v101

					break
				end
			end

			local LeaveCatalogToAvatarPrompt = AvatarScreen.LeaveCatalogToAvatarPrompt
			local t4 = {
				onOverlayClosed = t1.onOverlayClosed,
				categoryOverride = v100,
				subcategoryOverride = nil
			}

			v59.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase)
			v55(NavigateWithLock(function() -- line: 453
				-- upvalues: v56 (copy), LeaveCatalogToAvatarPrompt (copy), t4 (copy)
				v56.navigate(LeaveCatalogToAvatarPrompt, t4)
			end))

			return
		end

		v67()
	end, {
		t1.tryOnItems,
		t1.lookDetailsObj,
		t1.lookId,
		t1.userRobux,
		v55,
		v56,
		t1.onOverlayClosed,
		v59,
		v57,
		t1.itemsToPurchase,
		t1.totalPrice,
		v67
	})

	return {
		onPurchaseAttempt = v62,
		onFlowComplete = v63,
		onBuyItemButtonMounted = v64,
		onPurchaseSuccess = v65,
		openUnifiedPurchasePrompt = v67,
		onButtonPressWithUnifiedPurchaseFlow = v68
	}
end
