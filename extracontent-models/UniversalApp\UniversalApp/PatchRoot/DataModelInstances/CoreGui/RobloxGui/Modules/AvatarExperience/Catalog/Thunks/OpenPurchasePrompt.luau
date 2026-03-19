local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseProduct);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandlePurchaseSuccess);
local v10 = require(l_CorePackages_0.Packages.Promise);
local v11 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local v13 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v14 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v15 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local v18 = require(l_CorePackages_0.Packages.Cryo);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v21 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v22 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v22.getIsUserEligibleForUnifiedPurchaseFlow;
local l_ProductPurchaseSurface_0 = v22.Enums.ProductPurchaseSurface;
local v25 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v26 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_EconomicRestrictionsCounter_0 = v26.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v31 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local l_getTTIEventName_0 = v22.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_parseEconomicRestrictionsFailureReason_0 = v26.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v26.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAddTypesToWidgetItems_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAddTypesToWidgetItems;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v25.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableUnifiedProductPurchaseForMarketplace;
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = v25.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = v25.FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = v25.FFlagPurchasePromptSubtitleForTimedOptions;
local l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration;
local l_FFlagFixUnifiedPurchaseResalePurchases_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagFixUnifiedPurchaseResalePurchases;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v51(v46, v47, v48, v49, v50) --[[ Line: 90 ]] --[[ Name: buildUnifiedPurchaseProductInfo ]]
    return {
        AssetType = v46.assetType, 
        CollectibleItemId = v46.collectibleItemId, 
        CollectibleProductId = v47, 
        Description = v46.description, 
        PriceInRobux = v48, 
        ImageUrl = v46.imageUrl, 
        Name = v46.name, 
        ProductId = v49, 
        AssetTypeId = v46.assetType, 
        ProductType = v50, 
        TargetId = v46.id, 
        AssetId = v46.id, 
        items = v46.items, 
        product = {
            id = v49, 
            isForSale = v46.isPurchasable
        }
    };
end;
local v52 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v53 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v54 = {
    toastMessage = "IAPExperience.RobuxUpsell.Title.InsufficientRobux", 
    isLocalized = false, 
    toastType = v53.InformationMessage
};
return function(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68) --[[ Line: 140 ]]
    -- upvalues: v5 (copy), v13 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v16 (copy), v6 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 (copy), l_FFlagFixUnifiedPurchaseResalePurchases_0 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v7 (copy), v52 (copy), v54 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v31 (copy), v11 (copy), v8 (copy), v9 (copy), v18 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogConstants_0 (copy), v14 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 (copy), v10 (copy), v51 (copy), v21 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v15 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy)
    return function(v69) --[[ Line: 156 ]]
        -- upvalues: v61 (copy), v62 (copy), v60 (copy), v5 (ref), v13 (ref), v58 (copy), l_AvatarScreen_0 (ref), v59 (copy), v66 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v57 (copy), v16 (ref), v6 (ref), l_FFlagAXDurablesSupport_0 (ref), v67 (copy), l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 (ref), l_FFlagFixUnifiedPurchaseResalePurchases_0 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v56 (copy), v65 (copy), v7 (ref), v63 (copy), v52 (ref), v64 (copy), v54 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v31 (ref), v11 (ref), v8 (ref), v55 (copy), v9 (ref), v18 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref), v14 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 (ref), v10 (ref), v51 (ref), v21 (ref), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v68 (copy), v15 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref)
        local v70 = v69:getState();
        local l_v61_0 = v61;
        local l_v62_0 = v62;
        local l_name_0 = v60.opaque.name;
        local v74 = v5(v70.AvatarExperience.Common, l_v61_0, l_v62_0);
        if not v74 then
            return;
        else
            local l_TryOnItems_0 = v70.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            local v76 = v13.checkTryOnHasAdjustments(l_TryOnItems_0, (tostring(l_v61_0)));
            if v58 then
                local l_RequestId_0 = v70.AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                local v78 = nil;
                local v79 = v70.Navigation and v70.Navigation.currentRoute;
                if v79 and v79.name == l_AvatarScreen_0.CatalogSearch then
                    v78 = v79.params and v79.params.searchParams and v79.params.searchParams.searchKeyword;
                end;
                v58.clickPurchaseItemButton(l_v61_0, l_v62_0, v59, l_name_0, l_RequestId_0, v78, v76, v70.AvatarExperience.AnalyticsMetadata, v66, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v57 then v57.getParam(v16.NavigationParams.fromSurface) else nil);
            end;
            local l_resellerUserAssetIds_0 = v74.resellerUserAssetIds;
            local v81 = l_resellerUserAssetIds_0 and l_resellerUserAssetIds_0[1];
            local v82 = v70.AvatarExperience.Catalog.UserAssets[v81];
            local v83 = v70.UserRobux[v70.LocalUserId];
            local v84 = v74.lowestPrice or v74.priceInRobux;
            local v85 = nil;
            local v86 = nil;
            local v87 = nil;
            local v88 = nil;
            v85 = v6.IsResellable(v74);
            v86 = v74.expectedSellerId;
            v87 = v74.creator and v74.creator.name;
            v88 = v74.collectibleItemId;
            if l_FFlagAXDurablesSupport_0 and v67 and v74.timedOptions then
                for _, v90 in v74.timedOptions do
                    if v90.days == v67 then
                        v84 = v90.price;
                        break;
                    end;
                end;
            end;
            local v91 = nil;
            if v85 and v82 then
                v91 = v82.userAssetId;
                v86 = v82.userId;
                v87 = v82.userName;
            end;
            local v92 = nil;
            local v93 = nil;
            if v88 then
                local l_CollectiblesItemInfo_0 = v70.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
                local l_CollectiblesResellersInstances_0 = v70.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
                local l_CollectiblesResellableInstances_0 = v70.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
                local v97 = v6.findCheapestCollectiblePurchaseInfoV2(v88, v85, l_CollectiblesItemInfo_0, l_CollectiblesResellersInstances_0, l_CollectiblesResellableInstances_0);
                if l_FFlagAXDurablesSupport_0 then
                    if v97.price and not v67 then
                        v84 = v97.price;
                    end;
                elseif v97.price then
                    v84 = v97.price;
                end;
                if v97.collectibleInstanceId then
                    v92 = v97.collectibleInstanceId;
                    v86 = v97.expectedSellerId;
                    v87 = v97.sellerName;
                end;
                if l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 then
                    v93 = l_CollectiblesItemInfo_0[v88].collectibleProductId;
                    if l_FFlagFixUnifiedPurchaseResalePurchases_0 and v92 ~= nil then
                        local v98 = l_CollectiblesResellersInstances_0[v88];
                        local v99 = v98 and v98.Instances and v98.Instances[v92];
                        if v99 and v99.collectibleProductId then
                            v93 = v99 and v99.collectibleProductId;
                        end;
                    end;
                end;
            end;
            local function v115() --[[ Line: 272 ]]
                -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v84 (ref), v83 (copy), v57 (ref), l_AvatarScreen_0 (ref), l_v61_0 (copy), l_v62_0 (copy), v86 (ref), v87 (ref), v91 (ref), v92 (ref), v56 (ref), v59 (ref), v60 (ref), v65 (ref), v66 (ref), l_FFlagAXDurablesSupport_0 (ref), v67 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v16 (ref), v69 (copy), v7 (ref), v63 (ref), v52 (ref), v64 (ref), v54 (ref), v6 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v74 (copy), l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v31 (ref), v11 (ref), v8 (ref), v55 (ref), v58 (ref)
                if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
                    local v100 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
                    l_TimeToInteractiveTracker_0.trackStart(v100);
                    l_TimeToInteractiveTracker_0.updateMetadata(v100, {
                        page = l_ProductPurchaseSurface_0.Catalog, 
                        category = "legacy_purchase_modal"
                    });
                end;
                if v84 and v84 <= v83 then
                    v69:dispatch(v7(function() --[[ Line: 282 ]]
                        -- upvalues: v57 (ref), l_AvatarScreen_0 (ref), l_v61_0 (ref), l_v62_0 (ref), v84 (ref), v86 (ref), v87 (ref), v91 (ref), v92 (ref), v56 (ref), v59 (ref), v60 (ref), v65 (ref), v66 (ref), l_FFlagAXDurablesSupport_0 (ref), v67 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v16 (ref)
                        v57.navigate(l_AvatarScreen_0.PurchaseCatalogItem, {
                            itemId = l_v61_0, 
                            itemType = l_v62_0, 
                            priceInRobux = v84, 
                            sellerId = v86, 
                            sellerName = v87, 
                            userAssetId = v91, 
                            collectibleInstanceId = v92, 
                            onOverlayClosed = v56, 
                            fromProfile = v59, 
                            fromAvatarRoute = v60, 
                            widgetInfo = v65, 
                            fromContentFeed = v66, 
                            timedOptionDays = if l_FFlagAXDurablesSupport_0 then v67 else nil, 
                            fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 and v57 then v57.getParam(v16.NavigationParams.fromSurface) else nil
                        });
                    end));
                    return;
                elseif v63 then
                    v69:dispatch(v52(if v64 then v64 else v54));
                    return;
                else
                    local l_InsufficientRobuxPrompt_0 = l_AvatarScreen_0.InsufficientRobuxPrompt;
                    local v102 = {
                        onOverlayClosed = v56
                    };
                    local v103 = v6.GetRbxThumbType(l_v62_0);
                    local v104 = l_getRbxthumbWithTypeSizeAndOptions_0(l_v61_0, v103, 150);
                    local l_name_1 = v74.name;
                    local function v109(v106) --[[ Line: 324 ]]
                        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v69 (ref), v31 (ref)
                        local v107 = l_parseEconomicRestrictionsFailureReason_0(v106);
                        local v108 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v106);
                        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                            surface = l_EconomicRestrictionsSurface_0.AvatarExperience, 
                            failureReason = v107
                        });
                        return v69:dispatch(v31(v107, v108));
                    end;
                    l_InsufficientRobuxPrompt_0 = l_AvatarScreen_0.RobuxUpsellPrompt;
                    v102.triggerContext = v11.UACatalog;
                    v102.priceInRobux = v84;
                    v102.userRobux = v83;
                    v102.itemProductId = l_v61_0;
                    v102.itemName = l_name_1;
                    v102.itemIcon = v104;
                    v102.purchaseItem = function() --[[ Line: 343 ]]
                        -- upvalues: v57 (ref), v74 (ref), v6 (ref), l_v62_0 (ref), v69 (ref), v8 (ref), v55 (ref), v84 (ref), v86 (ref), l_v61_0 (ref), v91 (ref), v58 (ref), v59 (ref), v92 (ref), v65 (ref), v66 (ref), v109 (copy), l_FFlagAXDurablesSupport_0 (ref), v67 (ref)
                        local v110 = if v57 then v57.state.routeName else nil;
                        local v111 = v74 and v74.product and v74.product.id;
                        local v112 = v6.GetItemSubType(l_v62_0, v74);
                        local l_collectibleItemId_0 = v74.collectibleItemId;
                        local v114 = v74.creator and v74.creator.type;
                        return v69:dispatch(v8(v55, v111, v84, v86, l_v61_0, l_v62_0, v112, false, v91, v58, v57, v59, false, v110, l_collectibleItemId_0, v92, v114, v65, v66, v109, if l_FFlagAXDurablesSupport_0 then v67 else nil));
                    end;
                    v69:dispatch(v7(function() --[[ Line: 376 ]]
                        -- upvalues: v57 (ref), l_InsufficientRobuxPrompt_0 (ref), v102 (copy)
                        v57.navigate(l_InsufficientRobuxPrompt_0, v102);
                    end));
                    return;
                end;
            end;
            if l_FFlagAXEnableUnifiedProductPurchaseForMarketplace_0 then
                local function v138() --[[ Line: 383 ]]
                    -- upvalues: l_v62_0 (copy), v6 (ref), v74 (copy), v16 (ref), v69 (copy), v9 (ref), v55 (ref), v61 (ref), v62 (ref), v88 (ref), v58 (ref), v59 (ref), v66 (ref), v60 (ref), l_name_0 (copy), v65 (ref), v84 (ref), v57 (ref), v18 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref), v14 (ref), l_FFlagAXDurablesSupport_0 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 (ref), v10 (ref), v51 (ref), v93 (ref), l_v61_0 (copy), v21 (ref), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v68 (ref), v92 (ref), v67 (ref), v15 (ref), l_ProductPurchaseSurface_0 (ref), v83 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref)
                    local function _() --[[ Line: 385 ]] --[[ Name: showWearAfterPurchase ]]
                        -- upvalues: l_v62_0 (ref), v6 (ref), v74 (ref), v16 (ref)
                        local l_l_v62_0_0 = l_v62_0;
                        local v117 = v6.GetItemSubType(l_v62_0, v74);
                        local v118 = false;
                        if l_l_v62_0_0 == v16.ItemType.Asset then
                            v118 = v117 ~= v16.AssetTypeIdStrings.EmoteAnimation;
                        end;
                        return v118;
                    end;
                    local function v123(v120, v121) --[[ Line: 394 ]] --[[ Name: onPurchaseSuccess ]]
                        -- upvalues: v6 (ref), l_v62_0 (ref), v74 (ref), v69 (ref), v9 (ref), v55 (ref), v61 (ref), v62 (ref), v88 (ref), v58 (ref), v59 (ref), v66 (ref), v60 (ref), l_name_0 (ref), v65 (ref), v84 (ref), v57 (ref)
                        local v122 = v6.GetItemSubType(l_v62_0, v74);
                        v69:dispatch(v9(v120, v121, v55, v61, v62, v88, v58, v59, v66, v60, l_name_0, v65, v84, v122, v57));
                    end;
                    local function v128(v124) --[[ Line: 416 ]] --[[ Name: onBuyItemButtonMounted ]]
                        -- upvalues: v65 (ref), v18 (ref), v61 (ref), v62 (ref), v16 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), v74 (ref), v84 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref)
                        if v124 then
                            local v125 = {
                                current = v124
                            };
                            local v126 = v65 or {};
                            local v127 = v18.Dictionary.join(v126, {
                                itemId = v61, 
                                itemType = if v62 == v16.ItemType.Asset then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else if v62 == v16.ItemType.Bundle then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE else nil, 
                                assetType = if l_FFlagAddTypesToWidgetItems_0 and v126.widgetType then nil else v74.assetType, 
                                widgetAssetType = if l_FFlagAddTypesToWidgetItems_0 and v126.widgetType then v74.assetType else nil, 
                                bundleType = if l_FFlagAddTypesToWidgetItems_0 and v126.widgetType then nil else v74.bundleType, 
                                widgetBundleType = if l_FFlagAddTypesToWidgetItems_0 and v126.widgetType then v74.bundleType else nil, 
                                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                                widgetItemPrice = if v126.widgetType then v84 else nil, 
                                organicItemPrice = if v126.widgetType then nil else v84
                            });
                            l_addUnifiedEventLogging_0(v125, v127, {
                                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                            });
                        end;
                    end;
                    local function v129() --[[ Line: 451 ]] --[[ Name: onFlowComplete ]]
                        -- upvalues: v69 (ref), v14 (ref)
                        v69:dispatch(v14());
                    end;
                    local v130 = l_FFlagAXDurablesSupport_0 and l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 and v74.expirationTime ~= nil or l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0;
                    local function v131() --[[ Line: 459 ]]
                        -- upvalues: v10 (ref), v51 (ref), v74 (ref), v93 (ref), v84 (ref), l_v61_0 (ref), l_v62_0 (ref)
                        return v10.resolve((v51(v74, v93, v84, l_v61_0, l_v62_0)));
                    end;
                    local l_v69_0 = v69;
                    local l_v21_0 = v21;
                    local v134 = {
                        subtitleView = if l_FFlagAXDurablesSupport_0 and l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v68 else nil, 
                        productPayload = {
                            id = l_v61_0, 
                            kind = l_v62_0, 
                            equipIfPurchased = false, 
                            isRobloxPurchase = true, 
                            collectibleItemId = v74.collectibleItemId, 
                            collectibleItemInstanceId = v92, 
                            collectibleProductId = v93, 
                            expectedPrice = v84, 
                            timedOptionDays = if l_FFlagAXDurablesSupport_0 and l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then v67 else nil
                        }, 
                        purchaseCallbacks = {
                            onFlowComplete = v129, 
                            onPurchaseSuccess = v123, 
                            onBuyItemButtonMounted = v128, 
                            fetchProductInfo = if l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 then v131 else nil
                        }
                    };
                    local l_l_v62_0_1 = l_v62_0;
                    local v136 = v6.GetItemSubType(l_v62_0, v74);
                    local v137 = false;
                    if l_l_v62_0_1 == v16.ItemType.Asset then
                        v137 = v136 ~= v16.AssetTypeIdStrings.EmoteAnimation;
                    end;
                    v134.postPurchaseActions = v137 and {
                        {
                            label = v15:Format("Feature.Catalog.Label.WearAfterPurchase"), 
                            actionKey = v16.WearAfterPurchasePostPurchaseActionKey, 
                            isActionSelected = true
                        }
                    };
                    v134.purchaseAnalyticsMetadata = {
                        surface = l_ProductPurchaseSurface_0.Catalog
                    };
                    v134.purchaseOptions = if l_FFlagAXDurablesSupport_0 and l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 or l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 then {
                        shouldSkipOwnershipCheck = v130, 
                        providedRobuxBalance = if l_FFlagUnifiedPurchaseOptimizeTTIMarketplaceIntegration_0 then v83 else nil
                    } else nil;
                    l_v69_0:dispatch(l_v21_0(v134, l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and true or nil));
                end;
                l_getIsUserEligibleForUnifiedPurchaseFlow_0(v55):andThen(function(v139) --[[ Line: 520 ]]
                    -- upvalues: v138 (copy), v115 (copy)
                    if v139 then
                        v138();
                        return;
                    else
                        v115();
                        return;
                    end;
                end):catch(function(_) --[[ Line: 527 ]]
                    -- upvalues: v115 (copy)
                    v115();
                end);
                return;
            else
                v115();
                return;
            end;
        end;
    end;
end;