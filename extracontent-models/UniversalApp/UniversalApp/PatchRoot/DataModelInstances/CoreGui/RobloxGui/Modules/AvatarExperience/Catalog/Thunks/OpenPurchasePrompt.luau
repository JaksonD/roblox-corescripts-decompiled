local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v6 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local v7 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseProduct);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandlePurchaseSuccess);
local v12 = require(l_CorePackages_0.Packages.Promise);
local l_CartIdService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService;
local v14 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v16 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v17 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v18 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local v21 = require(l_CorePackages_0.Packages.Cryo);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v24 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v25 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v25.getIsUserEligibleForUnifiedPurchaseFlow;
local l_ProductPurchaseSurface_0 = v25.Enums.ProductPurchaseSurface;
local v28 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_EconomicRestrictionsCounter_0 = v6.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v33 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local l_getTTIEventName_0 = v25.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_parseEconomicRestrictionsFailureReason_0 = v6.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v6.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_FFlagAXBlackbirdRoot_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlackbirdRoot;
local l_FFlagAddTypesToWidgetItems_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAddTypesToWidgetItems;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v28.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableUnifiedProductPurchaseForMarketplace;
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = v28.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = v28.FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = v28.FFlagPurchasePromptSubtitleForTimedOptions;
local l_FFlagPurchaseModalTimedOptionExtension_0 = v28.FFlagPurchaseModalTimedOptionExtension;
local l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration;
local l_FFlagFixUnifiedPurchaseResalePurchases_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagFixUnifiedPurchaseResalePurchases;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles;
local l_FFlagUseNavigationSelectors_0 = v28.FFlagUseNavigationSelectors;
local function v63(v52, v53, v54, v55, v56, v57) --[[ Line: 109 ]] --[[ Name: buildUnifiedPurchaseProductInfo ]]
    -- upvalues: l_FFlagAXBlackbirdRoot_0 (copy)
    local v58 = if l_FFlagAXBlackbirdRoot_0 then {} else nil;
    local v59 = nil;
    if l_FFlagAXBlackbirdRoot_0 then
        v59 = v52.discountInformation;
        if v57 and v57 ~= 0 and v52.timedOptions then
            for _, v61 in v52.timedOptions do
                if v61.days == v57 then
                    v59 = v61.discountInformation;
                    break;
                end;
            end;
        end;
        if v59 then
            local v62 = v59.discounts[1];
            v58.Type = v62.discountCampaign;
            v58.AmountInRobux = v62.robuxDiscountAmount;
            v58.Percent = v62.robuxDiscountPercentage;
        end;
    end;
    return {
        AssetType = v52.assetType, 
        CollectibleItemId = v52.collectibleItemId, 
        CollectibleProductId = v53, 
        Description = v52.description, 
        PriceInRobux = v54, 
        BasePriceInRobux = if l_FFlagAXBlackbirdRoot_0 and v59 then v59.originalPrice else nil, 
        PriceDiscountDetails = if l_FFlagAXBlackbirdRoot_0 then {
            v58
        } else nil, 
        ImageUrl = v52.imageUrl, 
        Name = v52.name, 
        ProductId = v55, 
        AssetTypeId = v52.assetType, 
        ProductType = v56, 
        TargetId = v52.id, 
        AssetId = v52.id, 
        items = v52.items, 
        product = {
            id = v55, 
            isForSale = v52.isPurchasable
        }
    };
end;
local v64 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v65 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v66 = {
    toastMessage = "IAPExperience.RobuxUpsell.Title.InsufficientRobux", 
    isLocalized = false, 
    toastType = v65.InformationMessage
};
return function(v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80) --[[ Line: 193 ]]
    -- upvalues: v7 (copy), v16 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v19 (copy), v8 (copy), l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 (copy), l_FFlagFixUnifiedPurchaseResalePurchases_0 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_NavigateWithLock_0 (copy), v64 (copy), v66 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v33 (copy), v14 (copy), v10 (copy), v11 (copy), v21 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_CartIdService_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogConstants_0 (copy), v17 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 (copy), v12 (copy), v63 (copy), l_FFlagAXBlackbirdRoot_0 (copy), v24 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v18 (copy), l_FFlagPurchaseModalTimedOptionExtension_0 (copy), l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles_0 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy)
    return function(v81) --[[ Line: 209 ]]
        -- upvalues: v73 (copy), v74 (copy), v72 (copy), v7 (ref), v16 (ref), v70 (copy), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreen_0 (ref), v71 (copy), v78 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v69 (copy), v19 (ref), v8 (ref), v79 (copy), l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 (ref), l_FFlagFixUnifiedPurchaseResalePurchases_0 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v68 (copy), v77 (copy), l_NavigateWithLock_0 (ref), v75 (copy), v64 (ref), v76 (copy), v66 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v33 (ref), v14 (ref), v10 (ref), v67 (copy), v11 (ref), v21 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_CartIdService_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref), v17 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 (ref), v12 (ref), v63 (ref), l_FFlagAXBlackbirdRoot_0 (ref), v24 (ref), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v80 (copy), v18 (ref), l_FFlagPurchaseModalTimedOptionExtension_0 (ref), l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles_0 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref)
        local v82 = v81:getState();
        local l_v73_0 = v73;
        local l_v74_0 = v74;
        local l_name_0 = v72.opaque.name;
        local v86 = v7(v82.AvatarExperience.Common, l_v73_0, l_v74_0);
        if not v86 then
            return;
        else
            local l_TryOnItems_0 = v82.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            local v88 = v16.checkTryOnHasAdjustments(l_TryOnItems_0, (tostring(l_v73_0)));
            if v70 then
                local l_RequestId_0 = v82.AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                local v90 = nil;
                local v91 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentRoactNavigationRoute(v82) else v82.Navigation and v82.Navigation.currentRoute;
                if v91 and v91.name == l_AvatarScreen_0.CatalogSearch then
                    v90 = v91.params and v91.params.searchParams and v91.params.searchParams.searchKeyword;
                end;
                v70.clickPurchaseItemButton(l_v73_0, l_v74_0, v71, l_name_0, l_RequestId_0, v90, v88, v82.AvatarExperience.AnalyticsMetadata, v78, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v69 then v69.getParam(v19.NavigationParams.fromSurface) else nil);
            end;
            local l_resellerUserAssetIds_0 = v86.resellerUserAssetIds;
            local v93 = l_resellerUserAssetIds_0 and l_resellerUserAssetIds_0[1];
            local v94 = v82.AvatarExperience.Catalog.UserAssets[v93];
            local v95 = v82.UserRobux[v82.LocalUserId];
            local v96 = v86.lowestPrice or v86.priceInRobux;
            local v97 = nil;
            local v98 = nil;
            local v99 = nil;
            local v100 = nil;
            v97 = v8.IsResellable(v86);
            v98 = v86.expectedSellerId;
            v99 = v86.creator and v86.creator.name;
            v100 = v86.collectibleItemId;
            if v79 and v86.timedOptions then
                for _, v102 in v86.timedOptions do
                    if v102.days == v79 then
                        v96 = v102.price;
                        break;
                    end;
                end;
            end;
            local v103 = nil;
            if v97 and v94 then
                v103 = v94.userAssetId;
                v98 = v94.userId;
                v99 = v94.userName;
            end;
            local v104 = nil;
            local v105 = nil;
            if v100 then
                local l_CollectiblesItemInfo_0 = v82.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
                local l_CollectiblesResellersInstances_0 = v82.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
                local l_CollectiblesResellableInstances_0 = v82.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
                local v109 = v8.findCheapestCollectiblePurchaseInfoV2(v100, v97, l_CollectiblesItemInfo_0, l_CollectiblesResellersInstances_0, l_CollectiblesResellableInstances_0);
                if v109.price and not v79 then
                    v96 = v109.price;
                end;
                if v109.collectibleInstanceId then
                    v104 = v109.collectibleInstanceId;
                    v98 = v109.expectedSellerId;
                    v99 = v109.sellerName;
                end;
                if l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 then
                    v105 = l_CollectiblesItemInfo_0[v100].collectibleProductId;
                    if l_FFlagFixUnifiedPurchaseResalePurchases_0 and v104 ~= nil then
                        local v110 = l_CollectiblesResellersInstances_0[v100];
                        local v111 = v110 and v110.Instances and v110.Instances[v104];
                        if v111 and v111.collectibleProductId then
                            v105 = v111 and v111.collectibleProductId;
                        end;
                    end;
                end;
            end;
            local function v127() --[[ Line: 322 ]]
                -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v96 (ref), v95 (copy), v69 (ref), l_AvatarScreen_0 (ref), l_v73_0 (copy), l_v74_0 (copy), v98 (ref), v99 (ref), v103 (ref), v104 (ref), v68 (ref), v71 (ref), v72 (ref), v77 (ref), v78 (ref), v79 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v19 (ref), v81 (copy), l_NavigateWithLock_0 (ref), v75 (ref), v64 (ref), v76 (ref), v66 (ref), v8 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v86 (copy), l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v33 (ref), v14 (ref), v10 (ref), v67 (ref), v70 (ref)
                if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
                    local v112 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
                    l_TimeToInteractiveTracker_0.trackStart(v112);
                    l_TimeToInteractiveTracker_0.updateMetadata(v112, {
                        page = l_ProductPurchaseSurface_0.Catalog, 
                        category = "legacy_purchase_modal"
                    });
                end;
                if v96 and v96 <= v95 then
                    v81:dispatch(l_NavigateWithLock_0(function() --[[ Line: 332 ]]
                        -- upvalues: v69 (ref), l_AvatarScreen_0 (ref), l_v73_0 (ref), l_v74_0 (ref), v96 (ref), v98 (ref), v99 (ref), v103 (ref), v104 (ref), v68 (ref), v71 (ref), v72 (ref), v77 (ref), v78 (ref), v79 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v19 (ref)
                        v69.navigate(l_AvatarScreen_0.PurchaseCatalogItem, {
                            itemId = l_v73_0, 
                            itemType = l_v74_0, 
                            priceInRobux = v96, 
                            sellerId = v98, 
                            sellerName = v99, 
                            userAssetId = v103, 
                            collectibleInstanceId = v104, 
                            onOverlayClosed = v68, 
                            fromProfile = v71, 
                            fromAvatarRoute = v72, 
                            widgetInfo = v77, 
                            fromContentFeed = v78, 
                            timedOptionDays = v79, 
                            fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 and v69 then v69.getParam(v19.NavigationParams.fromSurface) else nil
                        });
                    end));
                    return;
                elseif v75 then
                    v81:dispatch(v64(if v76 then v76 else v66));
                    return;
                else
                    local l_InsufficientRobuxPrompt_0 = l_AvatarScreen_0.InsufficientRobuxPrompt;
                    local v114 = {
                        onOverlayClosed = v68
                    };
                    local v115 = v8.GetRbxThumbType(l_v74_0);
                    local v116 = l_getRbxthumbWithTypeSizeAndOptions_0(l_v73_0, v115, 150);
                    local l_name_1 = v86.name;
                    local function v121(v118) --[[ Line: 374 ]]
                        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v81 (ref), v33 (ref)
                        local v119 = l_parseEconomicRestrictionsFailureReason_0(v118);
                        local v120 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v118);
                        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                            surface = l_EconomicRestrictionsSurface_0.AvatarExperience, 
                            failureReason = v119
                        });
                        return v81:dispatch(v33(v119, v120));
                    end;
                    l_InsufficientRobuxPrompt_0 = l_AvatarScreen_0.RobuxUpsellPrompt;
                    v114.triggerContext = v14.UACatalog;
                    v114.priceInRobux = v96;
                    v114.userRobux = v95;
                    v114.itemProductId = l_v73_0;
                    v114.itemName = l_name_1;
                    v114.itemIcon = v116;
                    v114.purchaseItem = function() --[[ Line: 393 ]]
                        -- upvalues: v69 (ref), v86 (ref), v8 (ref), l_v74_0 (ref), v81 (ref), v10 (ref), v67 (ref), v96 (ref), v98 (ref), l_v73_0 (ref), v103 (ref), v70 (ref), v71 (ref), v104 (ref), v77 (ref), v78 (ref), v121 (copy), v79 (ref)
                        local v122 = if v69 then v69.state.routeName else nil;
                        local v123 = v86 and v86.product and v86.product.id;
                        local v124 = v8.GetItemSubType(l_v74_0, v86);
                        local l_collectibleItemId_0 = v86.collectibleItemId;
                        local v126 = v86.creator and v86.creator.type;
                        return v81:dispatch(v10(v67, v123, v96, v98, l_v73_0, l_v74_0, v124, false, v103, v70, v69, v71, false, v122, l_collectibleItemId_0, v104, v126, v77, v78, v121, v79));
                    end;
                    v81:dispatch(l_NavigateWithLock_0(function() --[[ Line: 426 ]]
                        -- upvalues: v69 (ref), l_InsufficientRobuxPrompt_0 (ref), v114 (copy)
                        v69.navigate(l_InsufficientRobuxPrompt_0, v114);
                    end));
                    return;
                end;
            end;
            if l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 then
                local function v150() --[[ Line: 433 ]]
                    -- upvalues: l_v74_0 (copy), v8 (ref), v86 (copy), v19 (ref), v81 (copy), v11 (ref), v67 (ref), v73 (ref), v74 (ref), v100 (ref), v70 (ref), v71 (ref), v78 (ref), v72 (ref), l_name_0 (copy), v77 (ref), v96 (ref), v69 (ref), v21 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_CartIdService_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref), v17 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 (ref), v12 (ref), v63 (ref), v105 (ref), l_v73_0 (copy), l_FFlagAXBlackbirdRoot_0 (ref), v79 (ref), v24 (ref), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v80 (ref), v104 (ref), v18 (ref), l_ProductPurchaseSurface_0 (ref), v95 (copy), l_FFlagPurchaseModalTimedOptionExtension_0 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref)
                    local function _() --[[ Line: 435 ]] --[[ Name: showWearAfterPurchase ]]
                        -- upvalues: l_v74_0 (ref), v8 (ref), v86 (ref), v19 (ref)
                        local l_l_v74_0_0 = l_v74_0;
                        local v129 = v8.GetItemSubType(l_v74_0, v86);
                        local v130 = false;
                        if l_l_v74_0_0 == v19.ItemType.Asset then
                            v130 = v129 ~= v19.AssetTypeIdStrings.EmoteAnimation;
                        end;
                        return v130;
                    end;
                    local function v135(v132, v133) --[[ Line: 444 ]] --[[ Name: onPurchaseSuccess ]]
                        -- upvalues: v8 (ref), l_v74_0 (ref), v86 (ref), v81 (ref), v11 (ref), v67 (ref), v73 (ref), v74 (ref), v100 (ref), v70 (ref), v71 (ref), v78 (ref), v72 (ref), l_name_0 (ref), v77 (ref), v96 (ref), v69 (ref)
                        local v134 = v8.GetItemSubType(l_v74_0, v86);
                        v81:dispatch(v11(v132, v133, v67, v73, v74, v100, v70, v71, v78, v72, l_name_0, v77, v96, v134, v69));
                    end;
                    local function v140(v136) --[[ Line: 466 ]] --[[ Name: onBuyItemButtonMounted ]]
                        -- upvalues: v77 (ref), v21 (ref), v73 (ref), v74 (ref), v19 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), v86 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_CartIdService_0 (ref), v96 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref)
                        if v136 then
                            local v137 = {
                                current = v136
                            };
                            local v138 = v77 or {};
                            local v139 = v21.Dictionary.join(v138, {
                                itemId = v73, 
                                itemType = if v74 == v19.ItemType.Asset then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else if v74 == v19.ItemType.Bundle then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE else nil, 
                                assetType = if l_FFlagAddTypesToWidgetItems_0 and v138.widgetType then nil else v86.assetType, 
                                widgetAssetType = if l_FFlagAddTypesToWidgetItems_0 and v138.widgetType then v86.assetType else nil, 
                                bundleType = if l_FFlagAddTypesToWidgetItems_0 and v138.widgetType then nil else v86.bundleType, 
                                widgetBundleType = if l_FFlagAddTypesToWidgetItems_0 and v138.widgetType then v86.bundleType else nil, 
                                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                                cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
                                widgetItemPrice = if v138.widgetType then v96 else nil, 
                                organicItemPrice = if v138.widgetType then nil else v96
                            });
                            l_addUnifiedEventLogging_0(v137, v139, {
                                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                            });
                        end;
                    end;
                    local function v141() --[[ Line: 504 ]] --[[ Name: onFlowComplete ]]
                        -- upvalues: v81 (ref), v17 (ref)
                        v81:dispatch(v17());
                    end;
                    local v142 = l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 and v86.expirationTime ~= nil or l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0;
                    local function v143() --[[ Line: 510 ]]
                        -- upvalues: v12 (ref), v63 (ref), v86 (ref), v105 (ref), v96 (ref), l_v73_0 (ref), l_v74_0 (ref), l_FFlagAXBlackbirdRoot_0 (ref), v79 (ref)
                        return v12.resolve((v63(v86, v105, v96, l_v73_0, l_v74_0, if l_FFlagAXBlackbirdRoot_0 then v79 else nil)));
                    end;
                    local l_v81_0 = v81;
                    local l_v24_0 = v24;
                    local v146 = {
                        subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v80 else nil, 
                        productPayload = {
                            id = l_v73_0, 
                            kind = l_v74_0, 
                            equipIfPurchased = false, 
                            isRobloxPurchase = true, 
                            collectibleItemId = v86.collectibleItemId, 
                            collectibleItemInstanceId = v104, 
                            collectibleProductId = v105, 
                            expectedPrice = v96, 
                            timedOptionDays = if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then v79 else nil
                        }, 
                        purchaseCallbacks = {
                            onFlowComplete = v141, 
                            onPurchaseSuccess = v135, 
                            onBuyItemButtonMounted = v140, 
                            fetchProductInfo = if l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 then v143 else nil
                        }
                    };
                    local l_l_v74_0_1 = l_v74_0;
                    local v148 = v8.GetItemSubType(l_v74_0, v86);
                    local v149 = false;
                    if l_l_v74_0_1 == v19.ItemType.Asset then
                        v149 = v148 ~= v19.AssetTypeIdStrings.EmoteAnimation;
                    end;
                    v146.postPurchaseActions = v149 and {
                        {
                            label = v18:Format("Feature.Catalog.Label.WearAfterPurchase"), 
                            actionKey = v19.WearAfterPurchasePostPurchaseActionKey, 
                            isActionSelected = true
                        }
                    };
                    v146.purchaseAnalyticsMetadata = {
                        surface = l_ProductPurchaseSurface_0.Catalog
                    };
                    v146.purchaseOptions = if not not l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 or l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 then {
                        shouldSkipOwnershipCheck = v142, 
                        providedRobuxBalance = if l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 then v95 else nil, 
                        completionMessage = if l_FFlagPurchaseModalTimedOptionExtension_0 and v86.expirationTime ~= nil then v18:Format("Feature.Durables.PurchaseModal.SuccessMessage", {
                            itemName = v86.name, 
                            number = tostring(v79)
                        }) else nil
                    } else nil;
                    l_v81_0:dispatch(l_v24_0(v146, l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and true or nil));
                end;
                if l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceAssetBundles_0 then
                    v150();
                    return;
                else
                    l_getIsUserEligibleForUnifiedPurchaseFlow_0(v67):andThen(function(v151) --[[ Line: 581 ]]
                        -- upvalues: v150 (copy), v127 (copy)
                        if v151 then
                            v150();
                            return;
                        else
                            v127();
                            return;
                        end;
                    end):catch(function(_) --[[ Line: 588 ]]
                        -- upvalues: v127 (copy)
                        v127();
                    end);
                    return;
                end;
            else
                v127();
                return;
            end;
        end;
    end;
end;