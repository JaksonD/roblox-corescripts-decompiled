local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.UIBlox);
local l_default_0 = require(l_Parent_0.PermissionsProtocol).PermissionsProtocol.default;
local l_default_1 = require(l_Parent_0.LoggingProtocol).default;
local l_useState_0 = v2.useState;
local l_useCallback_0 = v2.useCallback;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v11 = require(script.Parent.Parent.Analytics.ModalEventConstants);
local v12 = require(script.Parent.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName);
local v13 = require(script.Parent.Parent.Util.PushNotificationsUpsellUtils);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppPushUpsellDeprecateOldEvents;
return function(v17) --[[ Line: 27 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useCallback_0 (copy), v13 (copy), l_AppStorageService_0 (copy), l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (copy), l_sendEventDeferred_0 (copy), v11 (copy), l_default_1 (copy), v12 (copy), l_default_0 (copy), l_useState_0 (copy), v2 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v18 = l_useLocalization_0(v17.TranslationKeys);
    local v19 = l_useCallback_0(function() --[[ Line: 29 ]]
        -- upvalues: v13 (ref), l_AppStorageService_0 (ref), l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v11 (ref), l_default_1 (ref), v12 (ref), v17 (copy)
        v13.setPushEduUpsellResponse(l_AppStorageService_0, "Deny");
        v13.setPushEduUpsellResponseTimestamp(l_AppStorageService_0, os.time());
        if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
            l_sendEventDeferred_0(v11.ModalContextPushEduUpsell, v11.OptInPushEventName, {
                [v11.ActionType] = v11.Clicked, 
                [v11.Button] = v11.Cancel
            });
        end;
        l_default_1:logRobloxTelemetryEvent(v12, {}, {
            [v11.ActionType] = v11.Clicked, 
            [v11.Button] = v11.Cancel
        }, v11.ModalContextPushEduUpsell);
        v17.CloseModal();
    end, {
        v17.CloseModal
    });
    local v22 = l_useCallback_0(function() --[[ Line: 47 ]]
        -- upvalues: l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v11 (ref), l_default_1 (ref), v12 (ref), v13 (ref), l_AppStorageService_0 (ref), l_default_0 (ref), v17 (copy)
        if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
            l_sendEventDeferred_0(v11.ModalContextPushEduUpsell, v11.OptInPushEventName, {
                [v11.ActionType] = v11.Clicked, 
                [v11.Button] = v11.Confirm
            });
        end;
        l_default_1:logRobloxTelemetryEvent(v12, {}, {
            [v11.ActionType] = v11.Clicked, 
            [v11.Button] = v11.Confirm
        }, v11.ModalContextPushEduUpsell);
        v13.setPushEduUpsellResponse(l_AppStorageService_0, "Allow");
        v13.setPushEduUpsellResponseTimestamp(l_AppStorageService_0, os.time());
        l_default_1:logRobloxTelemetryEvent(v12, {}, {
            [v11.ActionType] = v11.Opened, 
            [v11.EntryPoint] = "LuaPushUpsellModal"
        }, v11.ModalContextSysUpsell);
        l_default_0:requestPermissions({
            l_default_0.Permissions.POST_NOTIFICATIONS
        }):andThen(function(_) --[[ Line: 74 ]]
            -- upvalues: v13 (ref), l_AppStorageService_0 (ref), l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v11 (ref), l_default_1 (ref), v12 (ref)
            v13.setPushSysUpsellPromptTimestamp(l_AppStorageService_0, os.time());
            if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                l_sendEventDeferred_0(v11.ModalContextSysUpsell, v11.OptInPushEventName, {
                    [v11.ActionType] = v11.Opened
                });
                l_sendEventDeferred_0(v11.ModalContextSysUpsell, v11.OptInPushEventName, {
                    [v11.ActionType] = v11.RequestSuccess
                });
            end;
            l_default_1:logRobloxTelemetryEvent(v12, {}, {
                [v11.ActionType] = v11.RequestSuccess
            }, v11.ModalContextSysUpsell);
        end, function(_) --[[ Line: 96 ]]
            -- upvalues: l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0 (ref), l_sendEventDeferred_0 (ref), v11 (ref), l_default_1 (ref), v12 (ref)
            if not l_GetFFlagLuaAppPushUpsellDeprecateOldEvents_0() then
                l_sendEventDeferred_0(v11.ModalContextSysUpsell, v11.OptInPushEventName, {
                    [v11.ActionType] = v11.RequestFailed
                });
            end;
            l_default_1:logRobloxTelemetryEvent(v12, {}, {
                [v11.ActionType] = v11.RequestFailed
            }, v11.ModalContextSysUpsell);
        end);
        v17.CloseModal();
    end, {
        v17.CloseModal, 
        v18
    });
    local v23, v24 = l_useState_0(Vector2.new(800, 600));
    local v26 = l_useCallback_0(function(v25) --[[ Line: 120 ]]
        -- upvalues: v24 (copy)
        v24(v25.AbsoluteSize);
    end, {
        v24
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v3.Change.AbsoluteSize] = v26
    }, {
        ConfirmationPrompt = v2.createElement(l_InteractiveAlert_0, {
            screenSize = v23, 
            title = v18.Heading, 
            bodyText = v18.Body, 
            richText = true, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v19, 
                            text = v18.CancelAction
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v22, 
                            text = v18.ConfirmAction
                        }, 
                        isDefaultChild = false
                    }
                }
            }
        })
    });
end;