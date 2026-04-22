local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_WidgetConstants_0 = v7.WidgetConstants;
local v13 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v14 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v17 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v18 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v27 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v28 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local l_selectSearchKeyword_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword;
local l_getTryOnItemReducerKey_0 = v8.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v8.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_CartIdService_0 = v9.Lib.CartIdService;
local l_UnifiedSelectionListStore_0 = v9.Store.UnifiedSelectionListStore;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v5.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v6.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 = v5.FFlagAXFixWearAfterPurchaseToggleForEquippedAssets;
local l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 = v5.FFlagAXUnifiedPurchaseExtendRentalsFix;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v5.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace_0 = v5.FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace;
local function _(v44, v45) --[[ Line: 61 ]] --[[ Name: updateRobux ]]
    -- upvalues: v3 (copy), v13 (copy)
    local l_LocalUserId_0 = v45:getState().LocalUserId;
    v3.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v45:dispatch(v13(v44, l_LocalUserId_0, true));
    end;
end;
local v48 = {
    toastMessage = "Feature.Catalog.Label.Purchased", 
    isLocalized = false, 
    toastType = v17.SuccessConfirmation
};
return function(v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63) --[[ Line: 76 ]] --[[ Name: handlePurchaseSuccess ]]
    -- upvalues: v16 (copy), v15 (copy), v23 (copy), v10 (copy), v24 (copy), v21 (copy), v22 (copy), v11 (copy), v18 (copy), l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 (copy), v25 (copy), v19 (copy), v3 (copy), v13 (copy), l_AvatarScreenProperties_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v4 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_CartIdService_0 (copy), l_selectSearchKeyword_0 (copy), l_mutedError_0 (copy), l_UnifiedSelectionListStore_0 (copy), v28 (copy), l_WidgetConstants_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace_0 (copy), v27 (copy), v48 (copy), v20 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (copy), l_getTryOnItemReducerKey_0 (copy), v26 (copy), v2 (copy), v14 (copy)
    return function(v64) --[[ Line: 93 ]]
        -- upvalues: v16 (ref), v52 (copy), v53 (copy), v15 (ref), v49 (copy), v54 (copy), v23 (ref), v51 (copy), v10 (ref), v24 (ref), v21 (ref), v22 (ref), v11 (ref), v18 (ref), l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 (ref), v25 (ref), v55 (copy), v19 (ref), v3 (ref), v13 (ref), v50 (copy), v58 (copy), l_AvatarScreenProperties_0 (ref), v60 (copy), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_CartIdService_0 (ref), l_selectSearchKeyword_0 (ref), l_mutedError_0 (ref), l_UnifiedSelectionListStore_0 (ref), v62 (copy), v61 (copy), v56 (copy), v28 (ref), v57 (copy), l_WidgetConstants_0 (ref), v59 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v63 (copy), l_FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace_0 (ref), v27 (ref), v48 (ref), v20 (ref), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 (ref), l_getTryOnItemReducerKey_0 (ref), v26 (ref), v2 (ref), v14 (ref)
        local v65 = v16(v64:getState().AvatarExperience.Common, v52, v53);
        local v66 = v15.IsResellable(v65);
        local l_v49_0 = v49;
        if type(l_v49_0) == "table" then
            if v66 then
                if v54 then
                    v64:dispatch(v23(v51, v54, nil, v10.MaxResellersPerPage));
                    local l_LocalUserId_1 = v64:getState().LocalUserId;
                    v64:dispatch(v24(v51, v54, l_LocalUserId_1));
                else
                    v64:dispatch(v21(v51, v52, nil, v10.MaxResellersPerPage, true));
                    local l_LocalUserId_2 = v64:getState().LocalUserId;
                    v64:dispatch(v22(v51, v52, l_LocalUserId_2));
                end;
            end;
            if l_v49_0.purchased then
                if v53 == v11.ItemType.Asset then
                    v64:dispatch(v18(v52, true));
                    if l_FFlagAXUnifiedPurchaseExtendRentalsFix_0 then
                        v64:dispatch(v25(v51, v55, v52, v53, true));
                    end;
                else
                    v64:dispatch(v19(v52, true));
                end;
                local l_v51_0 = v51;
                local l_LocalUserId_3 = v64:getState().LocalUserId;
                v3.isNonEmptyString(l_LocalUserId_3, "Thunk.PurchaseProduct.updateRobux.localUserId");
                if typeof(l_LocalUserId_3) == "string" and l_LocalUserId_3 ~= "" then
                    v64:dispatch(v13(l_v51_0, l_LocalUserId_3, true));
                end;
                l_v51_0, l_LocalUserId_3 = pcall(function() --[[ Line: 132 ]]
                    -- upvalues: v50 (ref), v11 (ref), v58 (ref), l_AvatarScreenProperties_0 (ref), v60 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), v64 (copy), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_CartIdService_0 (ref), l_selectSearchKeyword_0 (ref)
                    local v72 = false;
                    if v50[v11.WearAfterPurchasePostPurchaseActionKey] then
                        v72 = v50[v11.WearAfterPurchasePostPurchaseActionKey];
                    end;
                    local v73 = nil;
                    if v58 and v58.current and v58.opaque then
                        v73 = l_AvatarScreenProperties_0[v58.opaque.name];
                    end;
                    local v74 = v60 or {
                        widgetType = nil
                    };
                    l_sendUnifiedEventForDeferredAction_0(v4.Dictionary.join(v64:getState().AvatarExperience.AnalyticsMetadata, {
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                        cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
                        keyword = l_selectSearchKeyword_0(v64:getState()), 
                        surface = if v73 and v73.analyticsData then v73.analyticsData.unifiedLoggingSurface else nil, 
                        widgetItemWearAfterPurchase = if v74.widgetType then v72 else nil, 
                        organicItemWearAfterPurchase = if v74.widgetType then nil else v72
                    }));
                end);
                if not l_v51_0 then
                    l_mutedError_0(l_LocalUserId_3);
                end;
                if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                    l_CartIdService_0.refreshCartId();
                    l_UnifiedSelectionListStore_0.clearSelectionList();
                end;
                local l_TryOnItems_0 = v64:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
                if v53 == v11.ItemType.Asset then
                    v55.purchaseAsset(v52, v62, v61, v56, v28.checkTryOnHasAdjustments(l_TryOnItems_0, (tostring(v52))), v57);
                elseif v53 == v11.ItemType.Bundle then
                    v55.purchaseBundle(v52, v62, v61, v56, v57);
                end;
                if v60 then
                    local v76 = v4.Dictionary.join(v60, {
                        totalRobux = v61
                    });
                    v55.widgetInteractionV2(v76, l_WidgetConstants_0.ActionType.PURCHASE_SUCCESS);
                end;
                local l_RequestId_0 = v64:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
                local v78 = nil;
                local v79 = nil;
                local _ = nil;
                local _ = nil;
                v78 = v64:getState();
                v79 = l_selectSearchKeyword_0(v78);
                local v82, v83 = v15.getCategoryAndSubcategory(v78);
                v55.avatarShopBuyItem(v52, v53, v61, v59, l_RequestId_0, v79, v82, v83, v64:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v63 then v63.getParam(v11.NavigationParams.fromSurface) else nil);
                if not l_FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace_0 then
                    v64:dispatch(v27(v48));
                end;
                v64:dispatch(v20(v63));
                if v50[v11.WearAfterPurchasePostPurchaseActionKey] and v53 == v11.ItemType.Asset and v62 ~= v11.AssetTypeIdStrings.EmoteAnimation then
                    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
                        l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
                    end;
                    v82 = nil;
                    if l_FFlagAXFixWearAfterPurchaseToggleForEquippedAssets_0 then
                        v83 = v64:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
                        v82 = v83 and v83[v62] and v83[v62][v52] ~= nil;
                    end;
                    if not v82 then
                        v83 = l_getTryOnItemReducerKey_0(v52, v53);
                        local v84 = l_TryOnItems_0[v83] and l_TryOnItems_0[v83].order;
                        local v85 = l_TryOnItems_0[v83] and {
                            position = l_TryOnItems_0[v83].position, 
                            rotation = l_TryOnItems_0[v83].rotation, 
                            scale = l_TryOnItems_0[v83].scale
                        };
                        v64:dispatch(v26(v62, v52, v63, false, v84, v85));
                    end;
                end;
                return v2.resolve(l_v49_0);
            else
                v64:dispatch(v14(l_v49_0));
                return v2.reject(l_v49_0);
            end;
        else
            return;
        end;
    end;
end;