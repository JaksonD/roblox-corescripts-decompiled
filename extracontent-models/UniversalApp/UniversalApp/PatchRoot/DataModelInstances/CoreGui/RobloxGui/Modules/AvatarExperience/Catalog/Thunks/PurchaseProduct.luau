local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.tutils);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v9 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_WidgetConstants_0 = v12.WidgetConstants;
local v19 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v20 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v21 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v24 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v25 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v26 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v34 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v35 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v37 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_selectSearchKeyword_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword;
local l_findItemInTryOnItems_0 = v11.Utils.findItemInTryOnItems;
local l_getTryOnItemReducerKey_0 = v11.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v11.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local l_CartIdService_0 = v10.Lib.CartIdService;
local l_UnifiedSelectionListStore_0 = v10.Store.UnifiedSelectionListStore;
local v48 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsAnalyticsV2);
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local l_FFlagAXMISEnableMultiShopping_0 = v8.FFlagAXMISEnableMultiShopping;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v9.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXInventoryDurablesSupport_0 = v8.FFlagAXInventoryDurablesSupport;
local l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 = v8.FFlagAXFixWearAfterPurchaseToggleForEquippedAssets;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v8.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local l_FFlagUseNavigationSelectors_0 = v9.FFlagUseNavigationSelectors;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v8.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v57 = {
    HttpError = Enum.HttpError.OK
};
local v58 = {
    toastMessage = "Feature.Catalog.Label.Purchased", 
    isLocalized = false, 
    toastType = v24.SuccessConfirmation
};
local function _(v59, v60) --[[ Line: 83 ]] --[[ Name: updateRobux ]]
    -- upvalues: v5 (copy), v19 (copy)
    local l_LocalUserId_0 = v60:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v60:dispatch(v19(v59, l_LocalUserId_0, true));
    end;
end;
local function v73(v63, v64) --[[ Line: 95 ]] --[[ Name: removeFromTryOn ]]
    -- upvalues: v17 (copy), l_findItemInTryOnItems_0 (copy), v35 (copy)
    local v65 = v63:getState();
    local l_TryOnItems_0 = v65.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local l_assetId_0 = v64.assetId;
    if not l_assetId_0 and v64.productId then
        for v68, v69 in l_TryOnItems_0 do
            if v69.itemType ~= v17.ItemType.Asset then
                local v70 = v65.AvatarExperience.Common.BundleInfos[v68];
                local v71 = v70 and v70.product.id;
                if v71 and v71 == tostring(v64.productId) then
                    l_assetId_0 = v69.itemId;
                end;
            end;
        end;
    end;
    local v72 = nil;
    if l_assetId_0 then
        v72 = l_findItemInTryOnItems_0(l_TryOnItems_0, l_assetId_0);
        v63:dispatch(v35((tostring(l_assetId_0))));
    end;
    return v72;
end;
local function _(v74) --[[ Line: 126 ]] --[[ Name: purchaseProductKeyMapper ]]
    -- upvalues: v16 (copy)
    return v16.PurchaseProductKey .. tostring(v74);
end;
return function(v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96) --[[ Line: 130 ]]
    -- upvalues: l_PerformFetch_0 (copy), v16 (copy), v23 (copy), v22 (copy), l_HttpService_0 (copy), v4 (copy), v14 (copy), l_isEconomicRestrictionResponse_0 (copy), v30 (copy), v31 (copy), v28 (copy), v29 (copy), v17 (copy), v25 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v32 (copy), v26 (copy), v5 (copy), v19 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreenProperties_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v6 (copy), l_CartIdService_0 (copy), l_selectSearchKeyword_0 (copy), l_UnifiedSelectionListStore_0 (copy), v37 (copy), l_WidgetConstants_0 (copy), v48 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v34 (copy), v58 (copy), v73 (copy), v27 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v7 (copy), v33 (copy), v21 (copy), v57 (copy), l_Logging_0 (copy), v20 (copy)
    return l_PerformFetch_0.Single(v16.PurchaseProductKey .. tostring(v77), function(v97) --[[ Line: 153 ]]
        -- upvalues: v23 (ref), v80 (copy), v81 (copy), v22 (ref), v90 (copy), l_HttpService_0 (ref), v91 (copy), v4 (ref), v14 (ref), v76 (copy), v78 (copy), v79 (copy), v92 (copy), v96 (copy), v77 (copy), v84 (copy), l_isEconomicRestrictionResponse_0 (ref), v95 (copy), v30 (ref), v16 (ref), v31 (ref), v28 (ref), v29 (ref), v17 (ref), v25 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v32 (ref), v85 (copy), v26 (ref), v5 (ref), v19 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreenProperties_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v6 (ref), l_CartIdService_0 (ref), l_selectSearchKeyword_0 (ref), v93 (copy), l_UnifiedSelectionListStore_0 (ref), v82 (copy), v87 (copy), v37 (ref), v94 (copy), l_WidgetConstants_0 (ref), v88 (copy), v48 (ref), l_AvatarScreen_0 (ref), v89 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v86 (copy), v34 (ref), v58 (ref), v73 (ref), v27 (ref), v83 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (ref), l_getTryOnItemReducerKey_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v7 (ref), v33 (ref), v21 (ref), v57 (ref), l_Logging_0 (ref), v20 (ref)
        local v98 = nil;
        local v99 = v23(v97:getState().AvatarExperience.Common, v80, v81);
        v98 = v22.IsResellable(v99);
        local v100 = nil;
        local l_Collectibles_0 = v97:getState().AvatarExperience.Common.Collectibles;
        local l_CollectiblesItemInfo_0 = l_Collectibles_0.CollectiblesItemInfo;
        if v90 and l_CollectiblesItemInfo_0[v90] then
            local l_LocalUserId_1 = v97:getState().LocalUserId;
            local v104 = l_HttpService_0:GenerateGUID(false);
            if v91 ~= nil then
                local v105 = l_Collectibles_0.CollectiblesResellersInstances[v90];
                local v106 = v105 and v105.Instances[v91];
                local v107 = v106 and v106.collectibleProductId;
                v100 = if not v107 then v4.reject({
                    reason = "CollectibleProductIdNotFound", 
                    HttpError = Enum.HttpError.OK
                }) else v14.PurchaseCollectibleItemResale(v76, v90, v91, v107, v78, v79, v92, l_LocalUserId_1, v104);
            else
                local l_collectibleProductId_0 = l_CollectiblesItemInfo_0[v90].collectibleProductId;
                v100 = v14.PurchaseCollectibleItem(v76, v90, l_collectibleProductId_0, v78, v79, v92, l_LocalUserId_1, v104, v96);
            end;
        else
            v100 = v14.PurchaseProduct(v76, v77, v78, v79, v84);
        end;
        return v100:andThen(function(v109) --[[ Line: 216 ]]
            -- upvalues: l_isEconomicRestrictionResponse_0 (ref), v95 (ref), v4 (ref), v98 (ref), v90 (ref), v97 (copy), v30 (ref), v76 (ref), v16 (ref), v31 (ref), v28 (ref), v80 (ref), v29 (ref), v81 (ref), v17 (ref), v25 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v32 (ref), v85 (ref), v26 (ref), v5 (ref), v19 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreenProperties_0 (ref), v96 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v6 (ref), l_CartIdService_0 (ref), l_selectSearchKeyword_0 (ref), v93 (ref), l_UnifiedSelectionListStore_0 (ref), v82 (ref), v78 (ref), v87 (ref), v37 (ref), v94 (ref), l_WidgetConstants_0 (ref), v88 (ref), v48 (ref), v22 (ref), l_AvatarScreen_0 (ref), v89 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v86 (ref), v34 (ref), v58 (ref), v73 (ref), v27 (ref), v83 (ref), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (ref), l_getTryOnItemReducerKey_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v7 (ref), v33 (ref), v21 (ref), v57 (ref), l_Logging_0 (ref), v20 (ref)
            local l_responseBody_0 = v109.responseBody;
            if type(l_responseBody_0) == "table" then
                if l_isEconomicRestrictionResponse_0(l_responseBody_0) and v95 then
                    v95(l_responseBody_0);
                    return v4.resolve(l_responseBody_0);
                else
                    local l_l_responseBody_0_0 = l_responseBody_0;
                    if v98 then
                        if v90 then
                            v97:dispatch(v30(v76, v90, nil, v16.MaxResellersPerPage));
                            local l_LocalUserId_2 = v97:getState().LocalUserId;
                            v97:dispatch(v31(v76, v90, l_LocalUserId_2));
                        else
                            v97:dispatch(v28(v76, v80, nil, v16.MaxResellersPerPage, true));
                            local l_LocalUserId_3 = v97:getState().LocalUserId;
                            v97:dispatch(v29(v76, v80, l_LocalUserId_3));
                        end;
                    end;
                    if l_l_responseBody_0_0.purchased then
                        if v81 == v17.ItemType.Asset then
                            v97:dispatch(v25(v80, true));
                            if l_FFlagAXInventoryDurablesSupport_0 then
                                v97:dispatch(v32(v76, v85, v80, v81, true));
                            end;
                        else
                            v97:dispatch(v26(v80, true));
                        end;
                        local l_v76_0 = v76;
                        local l_v97_0 = v97;
                        local l_LocalUserId_4 = l_v97_0:getState().LocalUserId;
                        v5.isNonEmptyString(l_LocalUserId_4, "Thunk.PurchaseProduct.updateRobux.localUserId");
                        if typeof(l_LocalUserId_4) == "string" and l_LocalUserId_4 ~= "" then
                            l_v97_0:dispatch(v19(l_v76_0, l_LocalUserId_4, true));
                        end;
                        l_v76_0 = nil;
                        pcall(function() --[[ Line: 259 ]]
                            -- upvalues: l_v76_0 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v97 (ref), l_AvatarScreenProperties_0 (ref), v96 (ref), v16 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v81 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v6 (ref), l_CartIdService_0 (ref), v80 (ref), l_selectSearchKeyword_0 (ref), v93 (ref)
                            l_v76_0 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentRoactNavigationRoute(v97:getState()) else v97:getState().Navigation and v97:getState().Navigation.currentRoute;
                            local v117 = nil;
                            if l_v76_0 and l_v76_0.params and l_v76_0.params.fromAvatarRoute and l_v76_0.params.fromAvatarRoute.opaque then
                                v117 = l_AvatarScreenProperties_0[l_v76_0.params.fromAvatarRoute.opaque.name];
                            end;
                            local v118 = nil;
                            v118 = if v96 then v16.TimedOptionsMap[v96] else l_UnifiedEventLogEnums_0.MarketplaceTimedOption.PERMANENT;
                            local v119 = nil;
                            if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                                if v81 == "Asset" then
                                    v119 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET;
                                elseif v81 == "Bundle" then
                                    v119 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
                                end;
                            end;
                            l_sendUnifiedEventForDeferredAction_0(v6.Dictionary.join(v97:getState().AvatarExperience.AnalyticsMetadata, {
                                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                                cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
                                itemId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v80 else nil, 
                                itemType = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v119 else nil, 
                                keyword = l_selectSearchKeyword_0(v97:getState()), 
                                surface = if v117 and v117.analyticsData then v117.analyticsData.unifiedLoggingSurface else nil, 
                                widgetTimedOption = if v93 then v118 else nil, 
                                organicTimedOption = if v93 then nil else v118
                            }));
                        end);
                        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                            l_CartIdService_0.refreshCartId();
                            l_UnifiedSelectionListStore_0.clearSelectionList();
                        end;
                        l_v97_0 = v97:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
                        if v81 == v17.ItemType.Asset then
                            v85.purchaseAsset(v80, v82, v78, v87, v37.checkTryOnHasAdjustments(l_v97_0, (tostring(v80))), v94);
                        elseif v81 == v17.ItemType.Bundle then
                            v85.purchaseBundle(v80, v82, v78, v87, v94);
                        end;
                        if v93 then
                            l_LocalUserId_4 = v6.Dictionary.join(v93, {
                                totalRobux = v78
                            });
                            v85.widgetInteractionV2(l_LocalUserId_4, l_WidgetConstants_0.ActionType.PURCHASE_SUCCESS);
                        end;
                        if not v88 then
                            l_LocalUserId_4 = v97:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                            local v120 = nil;
                            local v121 = nil;
                            local v122 = nil;
                            local v123 = nil;
                            local v124 = nil;
                            v120 = v97:getState();
                            if v48() then
                                v121 = l_selectSearchKeyword_0(v120);
                                local v125, v126 = v22.getCategoryAndSubcategory(v120);
                                v123 = v125;
                                v124 = v126;
                            else
                                local v127 = l_v76_0 and l_v76_0.params and l_v76_0.params.fromAvatarRoute;
                                local v128 = v127 and v127.current;
                                if v128 and v128.name == l_AvatarScreen_0.CatalogSearch then
                                    v122 = v128.key;
                                    v121 = v120.Search and v120.Search.SearchesInCatalog[v122] and v120.Search.SearchesInCatalog[v122].keyword;
                                end;
                                local v129 = v22.getCurrentCategoryNames(v120);
                                local v130 = v128 and v128.name == l_AvatarScreen_0.CatalogSearch;
                                if v129 then
                                    if v130 then
                                        v123 = v129.catalogSearchCategory or v123;
                                        v124 = v129.catalogSearchSubcategory or v124;
                                    else
                                        v123 = v129.catalogCategory or v123;
                                        v124 = v129.catalogSubcategory or v124;
                                    end;
                                end;
                            end;
                            v85.avatarShopBuyItem(v80, v81, v78, v89, l_LocalUserId_4, v121, v123, v124, v97:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v86 then v86.getParam(v17.NavigationParams.fromSurface) else nil);
                            v97:dispatch(v34(v58));
                        end;
                        if v88 then
                            l_LocalUserId_4 = v73(v97, l_l_responseBody_0_0);
                            if l_LocalUserId_4 then
                                if l_l_responseBody_0_0.assetIsWearable == false and l_LocalUserId_4.itemId ~= nil then
                                    l_l_responseBody_0_0 = v6.Dictionary.join(l_l_responseBody_0_0, {
                                        bundleId = l_LocalUserId_4.itemId, 
                                        tryOnBundleInfo = l_LocalUserId_4.bundleInfo
                                    });
                                end;
                                l_l_responseBody_0_0 = v6.Dictionary.join(l_l_responseBody_0_0, {
                                    itemSubType = v82, 
                                    overrideOrder = l_LocalUserId_4.order
                                });
                            end;
                        end;
                        v97:dispatch(v27(v86));
                        if v83 and v81 == v17.ItemType.Asset and v82 ~= v17.AssetTypeIdStrings.EmoteAnimation then
                            if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
                                l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
                            end;
                            l_LocalUserId_4 = nil;
                            if l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 then
                                local l_EquippedAssets_0 = v97:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
                                l_LocalUserId_4 = l_EquippedAssets_0 and l_EquippedAssets_0[v82] and l_EquippedAssets_0[v82][v80] ~= nil;
                            end;
                            if not l_LocalUserId_4 then
                                local v132 = l_getTryOnItemReducerKey_0(v80, v81);
                                local v133 = l_v97_0[v132] and l_v97_0[v132].order;
                                local v134 = l_v97_0[v132] and {
                                    position = l_v97_0[v132].position, 
                                    rotation = l_v97_0[v132].rotation, 
                                    scale = l_v97_0[v132].scale
                                };
                                local v135 = false;
                                if l_FFlagAXMISEnableMultiShopping_0 then
                                    v135 = v7.fieldCount(l_v97_0) > 1;
                                end;
                                v97:dispatch(v33(v82, v80, v86, v135, v133, v134));
                            end;
                        end;
                        return v4.resolve(l_l_responseBody_0_0);
                    else
                        if not v88 then
                            v97:dispatch(v21(l_l_responseBody_0_0));
                        end;
                        return v4.reject(l_l_responseBody_0_0);
                    end;
                end;
            else
                local l_v57_0 = v57;
                l_Logging_0.warn("Response from PurchaseProduct is malformed!");
                if not v88 then
                    v97:dispatch(v20(l_v57_0));
                end;
                return v4.reject(l_v57_0);
            end;
        end, function(v137) --[[ Line: 490 ]]
            -- upvalues: v57 (ref), v88 (ref), v97 (copy), v20 (ref), v4 (ref)
            if type(v137) ~= "table" or v137.HttpError == nil then
                v137 = v57;
            end;
            if not v88 then
                v97:dispatch(v20(v137));
            end;
            return v4.reject(v137);
        end);
    end);
end;