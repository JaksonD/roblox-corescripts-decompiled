local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_CentralOverlayType_0 = v9.CentralOverlayType;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_AvatarEditorNavigation_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarEditorNavigation;
local l_Characters_0 = l_AvatarEditorNavigation_0.Categories.Characters;
local l_Accessories_0 = l_AvatarEditorNavigation_0.Categories.Accessories;
local l_Purchased_0 = l_AvatarEditorNavigation_0.Subcategories[l_Characters_0].Purchased;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local v20 = require(l_CorePackages_0.Workspace.Packages.PaymentsProtocol);
local l_ProductType_0 = v20.Enum.ProductType;
local l_PaymentsProtocolConstants_0 = v20.PaymentsProtocolConstants;
local l_UiMode_0 = v9.UiMode;
local v24 = {
    mid = l_PaymentsProtocolConstants_0.MESSAGE_ON_PURCHASE_PROCESSED_EVENT, 
    validateParams = v3.table
};
local v25 = {
    Hat = 8, 
    BackAccessory = 46
};
local v26 = {
    [v25.Hat] = l_AvatarEditorNavigation_0.Categories.Accessories, 
    [v25.BackAccessory] = l_AvatarEditorNavigation_0.Categories.Accessories
};
local v27 = {
    [v25.Hat] = l_AvatarEditorNavigation_0.Subcategories[l_Accessories_0].Hats, 
    [v25.BackAccessory] = l_AvatarEditorNavigation_0.Subcategories[l_Accessories_0].Back
};
local v28 = {
    [v25.Hat] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventoryWithPath", 
    [v25.BackAccessory] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventoryWithPath"
};
local v29 = {
    [v25.Hat] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.HeadAccessoriesInventoryPath", 
    [v25.BackAccessory] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.BackAccessoriesInventoryPath"
};
local l_FFlagShowConfirmationScreenForOOAP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagShowConfirmationScreenForOOAP;
local v31 = l_MessageBus_0.Subscriber.new();
local function _(v32) --[[ Line: 75 ]] --[[ Name: getFontColorSpanStart ]]
    -- upvalues: l_FFlagShowConfirmationScreenForOOAP_0 (copy), l_UiMode_0 (copy)
    if l_FFlagShowConfirmationScreenForOOAP_0 then
        if v32 == l_UiMode_0.TenFoot then
            return "<font color=\"rgb(255, 255, 255)\">";
        else
            return "<font color=\"rgb(0, 0, 0)\">";
        end;
    else
        return "<font color=\"rgb(255, 255, 255)\">";
    end;
end;
local function _(v34) --[[ Line: 87 ]] --[[ Name: getDialogData ]]
    -- upvalues: v26 (copy), l_Characters_0 (copy), v27 (copy), l_Purchased_0 (copy), v28 (copy), v29 (copy)
    return {
        avatarEditorCategory = v26[v34] or l_Characters_0, 
        avatarEditorSubCategory = v27[v34] or l_Purchased_0, 
        bodyTextKey = v28[v34] or "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory", 
        inventoryPathKey = v29[v34]
    };
end;
return function() --[[ Line: 97 ]] --[[ Name: PurchaseProcessedEventReceiver ]]
    -- upvalues: v2 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_FFlagShowConfirmationScreenForOOAP_0 (copy), l_CloseCentralOverlay_0 (copy), l_AvatarScreen_0 (copy), l_Characters_0 (copy), l_Purchased_0 (copy), l_MarketplaceService_0 (copy), v26 (copy), v27 (copy), v28 (copy), v29 (copy), l_useUiModeInfo_0 (copy), l_useLocalization_0 (copy), l_UiMode_0 (copy), v31 (copy), v24 (copy), l_ProductType_0 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    local v36, v37 = v2.useState({
        id = nil, 
        name = nil, 
        thumbnailType = nil, 
        assetTypeId = nil
    });
    local v38, v39 = v2.useState({
        bodyTextKey = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory", 
        inventoryPathKey = nil
    });
    local v40 = l_useDispatch_0();
    local v41 = nil;
    local v42 = nil;
    local v43 = l_useNavigation_0();
    if not l_FFlagShowConfirmationScreenForOOAP_0 then
        v41 = v2.useCallback(function() --[[ Line: 115 ]]
            -- upvalues: v40 (copy), l_CloseCentralOverlay_0 (ref), v43 (copy), l_AvatarScreen_0 (ref), l_Characters_0 (ref), l_Purchased_0 (ref), v37 (copy)
            v40(l_CloseCentralOverlay_0());
            v43.navigate(l_AvatarScreen_0.AvatarEditor, {
                avatarEditorCategory = l_Characters_0, 
                avatarEditorSubcategory = l_Purchased_0
            });
            v37({
                id = nil, 
                name = nil, 
                thumbnailType = nil
            });
        end, {
            v40, 
            v43
        });
    end;
    v42 = v2.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v40 (copy), l_CloseCentralOverlay_0 (ref), v37 (copy)
        v40(l_CloseCentralOverlay_0());
        v37({
            id = nil, 
            name = nil, 
            thumbnailType = nil
        });
    end, {
        v40
    });
    local v52 = v2.useCallback(function(v44, v45, v46) --[[ Line: 138 ]]
        -- upvalues: l_MarketplaceService_0 (ref), l_FFlagShowConfirmationScreenForOOAP_0 (ref), v26 (ref), l_Characters_0 (ref), v27 (ref), l_Purchased_0 (ref), v28 (ref), v29 (ref), v39 (copy), v37 (copy)
        local v47 = {
            id = v44, 
            name = nil, 
            thumbnailType = v46, 
            assetTypeId = nil
        };
        if v44 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 147 ]]
                -- upvalues: l_MarketplaceService_0 (ref), v44 (copy), v45 (copy)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return l_MarketplaceService_0:GetProductInfoAsync(v44, v45);
                else
                    return l_MarketplaceService_0:GetProductInfo(v44, v45);
                end;
            end);
            if l_status_0 then
                v47.name = l_result_0.Name;
                if l_FFlagShowConfirmationScreenForOOAP_0 then
                    v47.assetTypeId = l_result_0.AssetTypeId;
                    local l_assetTypeId_0 = v47.assetTypeId;
                    local v51 = {
                        avatarEditorCategory = v26[l_assetTypeId_0] or l_Characters_0, 
                        avatarEditorSubCategory = v27[l_assetTypeId_0] or l_Purchased_0, 
                        bodyTextKey = v28[l_assetTypeId_0] or "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory", 
                        inventoryPathKey = v29[l_assetTypeId_0]
                    };
                    v39({
                        bodyTextKey = v51.bodyTextKey, 
                        inventoryPathKey = v51.inventoryPathKey
                    });
                end;
            end;
        end;
        v37(v47);
    end, {});
    local l_uiMode_0 = l_useUiModeInfo_0().uiMode;
    local v54 = nil;
    if not l_FFlagShowConfirmationScreenForOOAP_0 then
        v54 = l_useLocalization_0({
            titleText = "Feature.AvatarBundleReceivedInteractiveAlert.Title.ItemsAcquired", 
            bodyText = {
                "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory"; 
                avatarName = if v36.name then v36.name else "", 
                fontColorSpanStart = if l_FFlagShowConfirmationScreenForOOAP_0 then l_uiMode_0 == l_UiMode_0.TenFoot and "<font color=\"rgb(255, 255, 255)\">" or "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">", 
                fontColorSpanEnd = "</font>"
            }, 
            errorBodyText = {
                "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.UnknownAddedToInventory"; 
                fontColorSpanStart = if l_FFlagShowConfirmationScreenForOOAP_0 then l_uiMode_0 == l_UiMode_0.TenFoot and "<font color=\"rgb(255, 255, 255)\">" or "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">", 
                fontColorSpanEnd = "</font>"
            }, 
            takeALookText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.TakeALook", 
            okButtonText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.Ok"
        });
    else
        local v55 = l_useLocalization_0({
            inventoryPath = v38.inventoryPathKey
        });
        v54 = l_useLocalization_0({
            titleText = "Feature.AvatarBundleReceivedInteractiveAlert.Title.ItemsAcquired", 
            bodyText = {
                v38.bodyTextKey; 
                avatarName = if v36.name then v36.name else "", 
                fontColorSpanStart = if l_FFlagShowConfirmationScreenForOOAP_0 then l_uiMode_0 == l_UiMode_0.TenFoot and "<font color=\"rgb(255, 255, 255)\">" or "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">", 
                fontColorSpanEnd = "</font>", 
                inventoryPath = v55.inventoryPath
            }, 
            errorBodyText = {
                "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.UnknownAddedToInventory"; 
                fontColorSpanStart = if l_FFlagShowConfirmationScreenForOOAP_0 then l_uiMode_0 == l_UiMode_0.TenFoot and "<font color=\"rgb(255, 255, 255)\">" or "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">", 
                fontColorSpanEnd = "</font>"
            }, 
            takeALookText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.TakeALook", 
            okButtonText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.Ok"
        });
    end;
    v2.useEffect(function() --[[ Line: 214 ]]
        -- upvalues: v31 (ref), v24 (ref), l_ProductType_0 (ref), v52 (copy), l_Constants_0 (ref)
        v31:subscribe(v24, function(v56) --[[ Line: 215 ]]
            -- upvalues: l_ProductType_0 (ref), v52 (ref), l_Constants_0 (ref)
            if not v56.nativeProduct then
                warn("PaymentProcessedEventReceiver: Response does not have nativeProduct key");
                return;
            else
                if v56.nativeProduct.productType == l_ProductType_0.PlayStationPlusItem then
                    if not v56.payload then
                        warn("Response does not have payload key");
                        return;
                    else
                        local l_granted_asset_ids_0 = v56.payload.granted_asset_ids;
                        local v58 = if l_granted_asset_ids_0 and #l_granted_asset_ids_0 > 0 then l_granted_asset_ids_0[1] else nil;
                        local l_granted_bundle_ids_0 = v56.payload.granted_bundle_ids;
                        local v60 = if l_granted_bundle_ids_0 and #l_granted_bundle_ids_0 > 0 then l_granted_bundle_ids_0[1] else nil;
                        if v58 then
                            v52(v58, Enum.InfoType.Asset, l_Constants_0.RbxthumbTypes.Asset);
                        end;
                        if v60 then
                            v52(v60, Enum.InfoType.Bundle, l_Constants_0.RbxthumbTypes.BundleThumbnail);
                        end;
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 246 ]]
            -- upvalues: v31 (ref), v24 (ref)
            v31:unsubscribe(v24);
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 251 ]]
        -- upvalues: v36 (copy), l_FFlagShowConfirmationScreenForOOAP_0 (ref), v26 (ref), l_Characters_0 (ref), v27 (ref), l_Purchased_0 (ref), v28 (ref), v29 (ref), v40 (copy), l_CloseCentralOverlay_0 (ref), v43 (copy), l_AvatarScreen_0 (ref), v37 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v54 (ref), v41 (ref), v42 (ref)
        if not v36.id then
            return;
        else
            local v61 = nil;
            if l_FFlagShowConfirmationScreenForOOAP_0 then
                local l_assetTypeId_1 = v36.assetTypeId;
                local v63 = {
                    avatarEditorCategory = v26[l_assetTypeId_1] or l_Characters_0, 
                    avatarEditorSubCategory = v27[l_assetTypeId_1] or l_Purchased_0, 
                    bodyTextKey = v28[l_assetTypeId_1] or "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory", 
                    inventoryPathKey = v29[l_assetTypeId_1]
                };
                local l_v63_0 = v63 --[[ copy: 1 -> 3 ]];
                v61 = function() --[[ Line: 259 ]]
                    -- upvalues: v40 (ref), l_CloseCentralOverlay_0 (ref), v43 (ref), l_AvatarScreen_0 (ref), l_v63_0 (copy), v37 (ref)
                    v40(l_CloseCentralOverlay_0());
                    v43.navigate(l_AvatarScreen_0.AvatarEditor, {
                        avatarEditorCategory = l_v63_0.avatarEditorCategory, 
                        avatarEditorSubcategory = l_v63_0.avatarEditorSubCategory
                    });
                    v37({
                        id = nil, 
                        name = nil, 
                        thumbnailType = nil, 
                        assetTypeId = nil
                    });
                end;
            end;
            local v65 = l_getRbxthumbWithTypeSizeAndOptions_0(v36.id, v36.thumbnailType, 420);
            v40(l_SetCentralOverlay_0(l_CentralOverlayType_0.ItemsReceivedAlert, {
                titleText = v54.titleText, 
                avatarThumbnail = v65, 
                avatarThumbnailDisplayHeight = v36.name and 276 or 0, 
                bodyText = if v36.name then v54.bodyText else v54.errorBodyText, 
                primaryButtonText = v54.takeALookText, 
                onPrimaryButtonActivated = if l_FFlagShowConfirmationScreenForOOAP_0 then v61 else v41, 
                secondaryButtonText = v54.okButtonText, 
                onSecondaryButtonActivated = v42
            }));
            return;
        end;
    end, {
        v36, 
        v54, 
        v40, 
        if l_FFlagShowConfirmationScreenForOOAP_0 then nil else v41, 
        v42, 
        if l_FFlagShowConfirmationScreenForOOAP_0 then v43 else nil
    });
end;