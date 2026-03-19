local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v11 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v12 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v18 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v25 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v26 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local l_selectSearchKeyword_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword;
local l_getTryOnItemReducerKey_0 = v7.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v7.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v5.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v6.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 = v5.FFlagAXFixWearAfterPurchaseToggleForEquippedAssets;
local l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 = v5.FFlagAXUnifiedPurchaseExtendRentalsFix;
local function _(v38, v39) --[[ Line: 53 ]] --[[ Name: updateRobux ]]
    -- upvalues: v3 (copy), v11 (copy)
    local l_LocalUserId_0 = v39:getState().LocalUserId;
    v3.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v39:dispatch(v11(v38, l_LocalUserId_0, true));
    end;
end;
local v42 = {
    toastMessage = "Feature.Catalog.Label.Purchased", 
    isLocalized = false, 
    toastType = v15.SuccessConfirmation
};
return function(v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57) --[[ Line: 68 ]] --[[ Name: handlePurchaseSuccess ]]
    -- upvalues: v14 (copy), v13 (copy), v21 (copy), v8 (copy), v22 (copy), v19 (copy), v20 (copy), v9 (copy), v16 (copy), l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 (copy), v23 (copy), v17 (copy), v3 (copy), v11 (copy), l_AvatarScreenProperties_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v4 (copy), l_UnifiedEventLogEnums_0 (copy), l_selectSearchKeyword_0 (copy), l_mutedError_0 (copy), v26 (copy), v10 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v25 (copy), v42 (copy), v18 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (copy), l_getTryOnItemReducerKey_0 (copy), v24 (copy), v2 (copy), v12 (copy)
    return function(v58) --[[ Line: 85 ]]
        -- upvalues: v14 (ref), v46 (copy), v47 (copy), v13 (ref), v43 (copy), v48 (copy), v21 (ref), v45 (copy), v8 (ref), v22 (ref), v19 (ref), v20 (ref), v9 (ref), v16 (ref), l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 (ref), v23 (ref), v49 (copy), v17 (ref), v3 (ref), v11 (ref), v44 (copy), v52 (copy), l_AvatarScreenProperties_0 (ref), v54 (copy), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), l_selectSearchKeyword_0 (ref), l_mutedError_0 (ref), v56 (copy), v55 (copy), v50 (copy), v26 (ref), v51 (copy), v10 (ref), v53 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v57 (copy), v25 (ref), v42 (ref), v18 (ref), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (ref), l_getTryOnItemReducerKey_0 (ref), v24 (ref), v2 (ref), v12 (ref)
        local v59 = v14(v58:getState().AvatarExperience.Common, v46, v47);
        local v60 = v13.IsResellable(v59);
        local l_v43_0 = v43;
        if type(l_v43_0) == "table" then
            if v60 then
                if v48 then
                    v58:dispatch(v21(v45, v48, nil, v8.MaxResellersPerPage));
                    local l_LocalUserId_1 = v58:getState().LocalUserId;
                    v58:dispatch(v22(v45, v48, l_LocalUserId_1));
                else
                    v58:dispatch(v19(v45, v46, nil, v8.MaxResellersPerPage, true));
                    local l_LocalUserId_2 = v58:getState().LocalUserId;
                    v58:dispatch(v20(v45, v46, l_LocalUserId_2));
                end;
            end;
            if l_v43_0.purchased then
                if v47 == v9.ItemType.Asset then
                    v58:dispatch(v16(v46, true));
                    if l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 then
                        v58:dispatch(v23(v45, v49, v46, v47, true));
                    end;
                else
                    v58:dispatch(v17(v46, true));
                end;
                local l_v45_0 = v45;
                local l_LocalUserId_3 = v58:getState().LocalUserId;
                v3.isNonEmptyString(l_LocalUserId_3, "Thunk.PurchaseProduct.updateRobux.localUserId");
                if typeof(l_LocalUserId_3) == "string" and l_LocalUserId_3 ~= "" then
                    v58:dispatch(v11(l_v45_0, l_LocalUserId_3, true));
                end;
                l_v45_0, l_LocalUserId_3 = pcall(function() --[[ Line: 124 ]]
                    -- upvalues: v44 (ref), v9 (ref), v52 (ref), l_AvatarScreenProperties_0 (ref), v54 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), v58 (copy), l_UnifiedEventLogEnums_0 (ref), l_selectSearchKeyword_0 (ref)
                    local v66 = false;
                    if v44[v9.WearAfterPurchasePostPurchaseActionKey] then
                        v66 = v44[v9.WearAfterPurchasePostPurchaseActionKey];
                    end;
                    local v67 = nil;
                    if v52 and v52.current and v52.opaque then
                        v67 = l_AvatarScreenProperties_0[v52.opaque.name];
                    end;
                    local v68 = v54 or {
                        widgetType = nil
                    };
                    l_sendUnifiedEventForDeferredAction_0(v4.Dictionary.join(v58:getState().AvatarExperience.AnalyticsMetadata, {
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                        keyword = l_selectSearchKeyword_0(v58:getState()), 
                        surface = if v67 and v67.analyticsData then v67.analyticsData.unifiedLoggingSurface else nil, 
                        widgetItemWearAfterPurchase = if v68.widgetType then v66 else nil, 
                        organicItemWearAfterPurchase = if v68.widgetType then nil else v66
                    }));
                end);
                if not l_v45_0 then
                    l_mutedError_0(l_LocalUserId_3);
                end;
                local l_TryOnItems_0 = v58:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
                if v47 == v9.ItemType.Asset then
                    v49.purchaseAsset(v46, v56, v55, v50, v26.checkTryOnHasAdjustments(l_TryOnItems_0, (tostring(v46))), v51);
                elseif v47 == v9.ItemType.Bundle then
                    v49.purchaseBundle(v46, v56, v55, v50, v51);
                end;
                if v54 then
                    local v70 = v4.Dictionary.join(v54, {
                        totalRobux = v55
                    });
                    v49.widgetInteractionV2(v70, v10.ActionType.PURCHASE_SUCCESS);
                end;
                local l_RequestId_0 = v58:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                local v72 = nil;
                local v73 = nil;
                local _ = nil;
                local _ = nil;
                v72 = v58:getState();
                v73 = l_selectSearchKeyword_0(v72);
                local v76, v77 = v13.getCategoryAndSubcategory(v72);
                v49.avatarShopBuyItem(v46, v47, v55, v53, l_RequestId_0, v73, v76, v77, v58:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v57 then v57.getParam(v9.NavigationParams.fromSurface) else nil);
                v58:dispatch(v25(v42));
                v58:dispatch(v18(v57));
                if v44[v9.WearAfterPurchasePostPurchaseActionKey] and v47 == v9.ItemType.Asset and v56 ~= v9.AssetTypeIdStrings.EmoteAnimation then
                    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
                        l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
                    end;
                    v76 = nil;
                    if l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 then
                        v77 = v58:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
                        v76 = v77 and v77[v56] and v77[v56][v46] ~= nil;
                    end;
                    if not v76 then
                        v77 = l_getTryOnItemReducerKey_0(v46, v47);
                        local v78 = l_TryOnItems_0[v77] and l_TryOnItems_0[v77].order;
                        local v79 = l_TryOnItems_0[v77] and {
                            position = l_TryOnItems_0[v77].position, 
                            rotation = l_TryOnItems_0[v77].rotation, 
                            scale = l_TryOnItems_0[v77].scale
                        };
                        v58:dispatch(v24(v56, v46, v57, false, v78, v79));
                    end;
                end;
                return v2.resolve(l_v43_0);
            else
                v58:dispatch(v12(l_v43_0));
                return v2.reject(l_v43_0);
            end;
        else
            return;
        end;
    end;
end;