local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrorType_0 = v1.SduiErrors.SduiErrorType;
local l_SduiActionType_0 = v1.SduiActionType;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v7 = require(l_Parent_0.DataHydration);
local l_localizeStrings_0 = require(l_Parent_0.Localization).localizeStrings;
return function(v9, _, v11, _) --[[ Line: 16 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_localizeStrings_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v7 (copy), l_CloseCentralOverlay_0 (copy)
    local v13 = v9 and v9.actionParams or nil;
    if v13 == nil then
        v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.RemoveBadgeFromInventory, 
            message = "Missing action params"
        }, v11.appPage);
        return;
    else
        assert(v13, "actionParams must exist");
        if v13.assetId == nil then
            v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.RemoveBadgeFromInventory, 
                message = "Missing actionParam: assetId"
            }, v11.appPage);
            return;
        else
            local l_assetId_0 = v13.assetId;
            local l_localization_0 = v11.dependencies.localization;
            local v16 = l_localizeStrings_0(l_localization_0, {
                RemoveBadgeTitle = "Feature.Item.Label.DeleteItemUndercase", 
                RemoveBadgeBody = "Feature.Item.Label.DeleteFromInventoryConfirmUndercaseDelete"
            });
            local l_dispatch_0 = v11.dependencies.dispatch;
            l_dispatch_0(l_SetCentralOverlay_0(l_CentralOverlayType_0.ConfirmationDialog, {
                title = v16.RemoveBadgeTitle, 
                body = v16.RemoveBadgeBody, 
                disablePortal = false, 
                onConfirm = function() --[[ Line: 53 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v7 (ref), l_assetId_0 (copy), l_dispatch_0 (copy), l_CloseCentralOverlay_0 (ref)
                    v7.Badges.getBadgeInfoStore(false).removeBadge((tostring(l_assetId_0)));
                    l_dispatch_0(l_CloseCentralOverlay_0());
                end, 
                onCancel = function() --[[ Line: 58 ]] --[[ Name: onCancel ]]
                    -- upvalues: l_dispatch_0 (copy), l_CloseCentralOverlay_0 (ref)
                    l_dispatch_0(l_CloseCentralOverlay_0());
                end
            }));
            return;
        end;
    end;
end;