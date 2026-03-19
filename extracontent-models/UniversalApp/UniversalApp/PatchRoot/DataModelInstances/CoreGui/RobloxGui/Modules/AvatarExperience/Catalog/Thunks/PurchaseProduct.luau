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
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v13 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v16 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v17 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v18 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v21 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v22 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v23 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v24 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v31 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v32 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v34 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_selectSearchKeyword_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword;
local l_findItemInTryOnItems_0 = v10.Utils.findItemInTryOnItems;
local l_getTryOnItemReducerKey_0 = v10.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v10.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v43 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsAnalyticsV2);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local l_FFlagAXMISEnableMultiShopping_0 = v8.FFlagAXMISEnableMultiShopping;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v9.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXInventoryDurablesSupport_0 = v8.FFlagAXInventoryDurablesSupport;
local l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 = v8.FFlagAXFixWearAfterPurchaseToggleForEquippedAssets;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v8.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v51 = {
    HttpError = Enum.HttpError.OK
};
local v52 = {
    toastMessage = "Feature.Catalog.Label.Purchased", 
    isLocalized = false, 
    toastType = v21.SuccessConfirmation
};
local function _(v53, v54) --[[ Line: 77 ]] --[[ Name: updateRobux ]]
    -- upvalues: v5 (copy), v16 (copy)
    local l_LocalUserId_0 = v54:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v54:dispatch(v16(v53, l_LocalUserId_0, true));
    end;
end;
local function v67(v57, v58) --[[ Line: 89 ]] --[[ Name: removeFromTryOn ]]
    -- upvalues: v14 (copy), l_findItemInTryOnItems_0 (copy), v32 (copy)
    local v59 = v57:getState();
    local l_TryOnItems_0 = v59.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local l_assetId_0 = v58.assetId;
    if not l_assetId_0 and v58.productId then
        for v62, v63 in l_TryOnItems_0 do
            if v63.itemType ~= v14.ItemType.Asset then
                local v64 = v59.AvatarExperience.Common.BundleInfos[v62];
                local v65 = v64 and v64.product.id;
                if v65 and v65 == tostring(v58.productId) then
                    l_assetId_0 = v63.itemId;
                end;
            end;
        end;
    end;
    local v66 = nil;
    if l_assetId_0 then
        v66 = l_findItemInTryOnItems_0(l_TryOnItems_0, l_assetId_0);
        v57:dispatch(v32((tostring(l_assetId_0))));
    end;
    return v66;
end;
local function _(v68) --[[ Line: 120 ]] --[[ Name: purchaseProductKeyMapper ]]
    -- upvalues: v13 (copy)
    return v13.PurchaseProductKey .. tostring(v68);
end;
return function(v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90) --[[ Line: 124 ]]
    -- upvalues: l_PerformFetch_0 (copy), v13 (copy), v20 (copy), v19 (copy), l_HttpService_0 (copy), v4 (copy), v11 (copy), l_FFlagAXDurablesSupport_0 (copy), l_isEconomicRestrictionResponse_0 (copy), v27 (copy), v28 (copy), v25 (copy), v26 (copy), v14 (copy), v22 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v29 (copy), v23 (copy), v5 (copy), v16 (copy), l_AvatarScreenProperties_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v6 (copy), l_selectSearchKeyword_0 (copy), v34 (copy), v15 (copy), v43 (copy), l_AvatarScreen_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v31 (copy), v52 (copy), v67 (copy), v24 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v7 (copy), v30 (copy), v18 (copy), v51 (copy), l_Logging_0 (copy), v17 (copy)
    return l_PerformFetch_0.Single(v13.PurchaseProductKey .. tostring(v71), function(v91) --[[ Line: 147 ]]
        -- upvalues: v20 (ref), v74 (copy), v75 (copy), v19 (ref), v84 (copy), l_HttpService_0 (ref), v85 (copy), v4 (ref), v11 (ref), v70 (copy), v72 (copy), v73 (copy), v86 (copy), l_FFlagAXDurablesSupport_0 (ref), v90 (copy), v71 (copy), v78 (copy), l_isEconomicRestrictionResponse_0 (ref), v89 (copy), v27 (ref), v13 (ref), v28 (ref), v25 (ref), v26 (ref), v14 (ref), v22 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v29 (ref), v79 (copy), v23 (ref), v5 (ref), v16 (ref), l_AvatarScreenProperties_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v6 (ref), l_selectSearchKeyword_0 (ref), v87 (copy), v76 (copy), v81 (copy), v34 (ref), v88 (copy), v15 (ref), v82 (copy), v43 (ref), l_AvatarScreen_0 (ref), v83 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v80 (copy), v31 (ref), v52 (ref), v67 (ref), v24 (ref), v77 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (ref), l_getTryOnItemReducerKey_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v7 (ref), v30 (ref), v18 (ref), v51 (ref), l_Logging_0 (ref), v17 (ref)
        local v92 = nil;
        local v93 = v20(v91:getState().AvatarExperience.Common, v74, v75);
        v92 = v19.IsResellable(v93);
        local v94 = nil;
        local l_Collectibles_0 = v91:getState().AvatarExperience.Common.Collectibles;
        local l_CollectiblesItemInfo_0 = l_Collectibles_0.CollectiblesItemInfo;
        if v84 and l_CollectiblesItemInfo_0[v84] then
            local l_LocalUserId_1 = v91:getState().LocalUserId;
            local v98 = l_HttpService_0:GenerateGUID(false);
            if v85 ~= nil then
                local v99 = l_Collectibles_0.CollectiblesResellersInstances[v84];
                local v100 = v99 and v99.Instances[v85];
                local v101 = v100 and v100.collectibleProductId;
                v94 = if not v101 then v4.reject({
                    reason = "CollectibleProductIdNotFound", 
                    HttpError = Enum.HttpError.OK
                }) else v11.PurchaseCollectibleItemResale(v70, v84, v85, v101, v72, v73, v86, l_LocalUserId_1, v98);
            else
                local v102 = l_CollectiblesItemInfo_0[v84];
                local v103 = nil;
                if not l_FFlagAXDurablesSupport_0 then
                    v103 = v102.price;
                end;
                local l_collectibleProductId_0 = v102.collectibleProductId;
                v94 = v11.PurchaseCollectibleItem(v70, v84, l_collectibleProductId_0, if l_FFlagAXDurablesSupport_0 then v72 else v103, v73, v86, l_LocalUserId_1, v98, if l_FFlagAXDurablesSupport_0 then v90 else nil);
            end;
        else
            v94 = v11.PurchaseProduct(v70, v71, v72, v73, v78);
        end;
        return v94:andThen(function(v105) --[[ Line: 217 ]]
            -- upvalues: l_isEconomicRestrictionResponse_0 (ref), v89 (ref), v4 (ref), v92 (ref), v84 (ref), v91 (copy), v27 (ref), v70 (ref), v13 (ref), v28 (ref), v25 (ref), v74 (ref), v26 (ref), v75 (ref), v14 (ref), v22 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v29 (ref), v79 (ref), v23 (ref), v5 (ref), v16 (ref), l_AvatarScreenProperties_0 (ref), l_FFlagAXDurablesSupport_0 (ref), v90 (ref), l_UnifiedEventLogEnums_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v6 (ref), l_selectSearchKeyword_0 (ref), v87 (ref), v76 (ref), v72 (ref), v81 (ref), v34 (ref), v88 (ref), v15 (ref), v82 (ref), v43 (ref), v19 (ref), l_AvatarScreen_0 (ref), v83 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v80 (ref), v31 (ref), v52 (ref), v67 (ref), v24 (ref), v77 (ref), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (ref), l_getTryOnItemReducerKey_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v7 (ref), v30 (ref), v18 (ref), v51 (ref), l_Logging_0 (ref), v17 (ref)
            local l_responseBody_0 = v105.responseBody;
            if type(l_responseBody_0) == "table" then
                if l_isEconomicRestrictionResponse_0(l_responseBody_0) and v89 then
                    v89(l_responseBody_0);
                    return v4.resolve(l_responseBody_0);
                else
                    local l_l_responseBody_0_0 = l_responseBody_0;
                    if v92 then
                        if v84 then
                            v91:dispatch(v27(v70, v84, nil, v13.MaxResellersPerPage));
                            local l_LocalUserId_2 = v91:getState().LocalUserId;
                            v91:dispatch(v28(v70, v84, l_LocalUserId_2));
                        else
                            v91:dispatch(v25(v70, v74, nil, v13.MaxResellersPerPage, true));
                            local l_LocalUserId_3 = v91:getState().LocalUserId;
                            v91:dispatch(v26(v70, v74, l_LocalUserId_3));
                        end;
                    end;
                    if l_l_responseBody_0_0.purchased then
                        if v75 == v14.ItemType.Asset then
                            v91:dispatch(v22(v74, true));
                            if l_FFlagAXInventoryDurablesSupport_0 then
                                v91:dispatch(v29(v70, v79, v74, v75, true));
                            end;
                        else
                            v91:dispatch(v23(v74, true));
                        end;
                        local l_v70_0 = v70;
                        local l_v91_0 = v91;
                        local l_LocalUserId_4 = l_v91_0:getState().LocalUserId;
                        v5.isNonEmptyString(l_LocalUserId_4, "Thunk.PurchaseProduct.updateRobux.localUserId");
                        if typeof(l_LocalUserId_4) == "string" and l_LocalUserId_4 ~= "" then
                            l_v91_0:dispatch(v16(l_v70_0, l_LocalUserId_4, true));
                        end;
                        l_v70_0 = nil;
                        pcall(function() --[[ Line: 260 ]]
                            -- upvalues: l_v70_0 (ref), v91 (ref), l_AvatarScreenProperties_0 (ref), l_FFlagAXDurablesSupport_0 (ref), v90 (ref), v13 (ref), l_UnifiedEventLogEnums_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v6 (ref), l_selectSearchKeyword_0 (ref), v87 (ref)
                            l_v70_0 = v91:getState().Navigation and v91:getState().Navigation.currentRoute;
                            local v113 = nil;
                            if l_v70_0 and l_v70_0.params and l_v70_0.params.fromAvatarRoute and l_v70_0.params.fromAvatarRoute.opaque then
                                v113 = l_AvatarScreenProperties_0[l_v70_0.params.fromAvatarRoute.opaque.name];
                            end;
                            local v114 = nil;
                            if l_FFlagAXDurablesSupport_0 then
                                v114 = if v90 then v13.TimedOptionsMap[v90] else l_UnifiedEventLogEnums_0.MarketplaceTimedOption.PERMANENT;
                            end;
                            l_sendUnifiedEventForDeferredAction_0(v6.Dictionary.join(v91:getState().AvatarExperience.AnalyticsMetadata, {
                                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                                keyword = l_selectSearchKeyword_0(v91:getState()), 
                                surface = if v113 and v113.analyticsData then v113.analyticsData.unifiedLoggingSurface else nil, 
                                widgetTimedOption = if v87 then v114 else nil, 
                                organicTimedOption = if v87 then nil else v114
                            }));
                        end);
                        l_v91_0 = v91:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
                        if v75 == v14.ItemType.Asset then
                            v79.purchaseAsset(v74, v76, v72, v81, v34.checkTryOnHasAdjustments(l_v91_0, (tostring(v74))), v88);
                        elseif v75 == v14.ItemType.Bundle then
                            v79.purchaseBundle(v74, v76, v72, v81, v88);
                        end;
                        if v87 then
                            l_LocalUserId_4 = v6.Dictionary.join(v87, {
                                totalRobux = v72
                            });
                            v79.widgetInteractionV2(l_LocalUserId_4, v15.ActionType.PURCHASE_SUCCESS);
                        end;
                        if not v82 then
                            l_LocalUserId_4 = v91:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                            local v115 = nil;
                            local v116 = nil;
                            local v117 = nil;
                            local v118 = nil;
                            local v119 = nil;
                            v115 = v91:getState();
                            if v43() then
                                v116 = l_selectSearchKeyword_0(v115);
                                local v120, v121 = v19.getCategoryAndSubcategory(v115);
                                v118 = v120;
                                v119 = v121;
                            else
                                local v122 = l_v70_0 and l_v70_0.params and l_v70_0.params.fromAvatarRoute;
                                local v123 = v122 and v122.current;
                                if v123 and v123.name == l_AvatarScreen_0.CatalogSearch then
                                    v117 = v123.key;
                                    v116 = v115.Search and v115.Search.SearchesInCatalog[v117] and v115.Search.SearchesInCatalog[v117].keyword;
                                end;
                                local v124 = v19.getCurrentCategoryNames(v115);
                                local v125 = v123 and v123.name == l_AvatarScreen_0.CatalogSearch;
                                if v124 then
                                    if v125 then
                                        v118 = v124.catalogSearchCategory or v118;
                                        v119 = v124.catalogSearchSubcategory or v119;
                                    else
                                        v118 = v124.catalogCategory or v118;
                                        v119 = v124.catalogSubcategory or v119;
                                    end;
                                end;
                            end;
                            v79.avatarShopBuyItem(v74, v75, v72, v83, l_LocalUserId_4, v116, v118, v119, v91:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v80 then v80.getParam(v14.NavigationParams.fromSurface) else nil);
                            v91:dispatch(v31(v52));
                        end;
                        if v82 then
                            l_LocalUserId_4 = v67(v91, l_l_responseBody_0_0);
                            if l_LocalUserId_4 then
                                if l_l_responseBody_0_0.assetIsWearable == false and l_LocalUserId_4.itemId ~= nil then
                                    l_l_responseBody_0_0 = v6.Dictionary.join(l_l_responseBody_0_0, {
                                        bundleId = l_LocalUserId_4.itemId, 
                                        tryOnBundleInfo = l_LocalUserId_4.bundleInfo
                                    });
                                end;
                                l_l_responseBody_0_0 = v6.Dictionary.join(l_l_responseBody_0_0, {
                                    itemSubType = v76, 
                                    overrideOrder = l_LocalUserId_4.order
                                });
                            end;
                        end;
                        v91:dispatch(v24(v80));
                        if v77 and v75 == v14.ItemType.Asset and v76 ~= v14.AssetTypeIdStrings.EmoteAnimation then
                            if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
                                l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
                            end;
                            l_LocalUserId_4 = nil;
                            if l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 then
                                local l_EquippedAssets_0 = v91:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
                                l_LocalUserId_4 = l_EquippedAssets_0 and l_EquippedAssets_0[v76] and l_EquippedAssets_0[v76][v74] ~= nil;
                            end;
                            if not l_LocalUserId_4 then
                                local v127 = l_getTryOnItemReducerKey_0(v74, v75);
                                local v128 = l_v91_0[v127] and l_v91_0[v127].order;
                                local v129 = l_v91_0[v127] and {
                                    position = l_v91_0[v127].position, 
                                    rotation = l_v91_0[v127].rotation, 
                                    scale = l_v91_0[v127].scale
                                };
                                local v130 = false;
                                if l_FFlagAXMISEnableMultiShopping_0 then
                                    v130 = v7.fieldCount(l_v91_0) > 1;
                                end;
                                v91:dispatch(v30(v76, v74, v80, v130, v128, v129));
                            end;
                        end;
                        return v4.resolve(l_l_responseBody_0_0);
                    else
                        if not v82 then
                            v91:dispatch(v18(l_l_responseBody_0_0));
                        end;
                        return v4.reject(l_l_responseBody_0_0);
                    end;
                end;
            else
                local l_v51_0 = v51;
                l_Logging_0.warn("Response from PurchaseProduct is malformed!");
                if not v82 then
                    v91:dispatch(v17(l_v51_0));
                end;
                return v4.reject(l_v51_0);
            end;
        end, function(v132) --[[ Line: 472 ]]
            -- upvalues: v51 (ref), v82 (ref), v91 (copy), v17 (ref), v4 (ref)
            if type(v132) ~= "table" or v132.HttpError == nil then
                v132 = v51;
            end;
            if not v82 then
                v91:dispatch(v17(v132));
            end;
            return v4.reject(v132);
        end);
    end);
end;