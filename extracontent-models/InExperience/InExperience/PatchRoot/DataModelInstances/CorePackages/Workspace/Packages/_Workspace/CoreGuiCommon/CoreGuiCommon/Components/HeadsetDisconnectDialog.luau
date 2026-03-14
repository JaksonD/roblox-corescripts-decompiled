local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script:FindFirstAncestor("CoreGuiCommon").Parent;
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.React);
local l_Dialog_0 = v4.Dialog;
local l_useLocalization_0 = v5.Hooks.useLocalization;
HeadsetDisconnectDialog = function(v9) --[[ Line: 30 ]] --[[ Name: HeadsetDisconnectDialog ]]
    -- upvalues: l_GuiService_0 (copy), l_VRService_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_ContextActionService_0 (copy), l_Dialog_0 (copy), v4 (copy)
    local v10 = v9.mockGuiService or l_GuiService_0;
    local v11 = v9.mockVRService or l_VRService_0;
    local v12 = l_useLocalization_0({
        titleText = "InGame.ConnectionError.Heading.VRDisconnected", 
        bodyText = "InGame.ConnectionError.Message.RestartApp", 
        buttonText = "InGame.ConnectionError.Action.Restart"
    });
    local v13, v14 = v6.useState(false);
    v6.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v11 (copy), v14 (copy)
        local v16 = v11:GetPropertyChangedSignal("VRDeviceAvailable"):Connect(function(v15) --[[ Line: 44 ]]
            -- upvalues: v14 (ref)
            v14(not v15);
        end);
        return function() --[[ Line: 48 ]]
            -- upvalues: v16 (copy)
            v16:Disconnect();
        end;
    end, {});
    local v18 = v6.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v10 (copy)
        local l_v10_NotificationTypeList_0 = v10:GetNotificationTypeList();
        if game:GetEngineFeature("EnableLuaControlsRestartApp") then
            v10:BroadcastNotification("", l_v10_NotificationTypeList_0.RESTART_APP);
            return;
        else
            v10:BroadcastNotification("", l_v10_NotificationTypeList_0.NATIVE_EXIT);
            return;
        end;
    end, {});
    v6.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v13 (copy), v10 (copy), l_ContextActionService_0 (ref), v18 (copy)
        if v13 then
            v10:SetMenuIsOpen(true, "HeadsetDisconnectedDialog");
            l_ContextActionService_0:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() --[[ Line: 67 ]]
                return Enum.ContextActionResult.Sink;
            end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape);
            l_ContextActionService_0:BindCoreAction("TopBarDialogConfirm", function(_, v20, _) --[[ Line: 71 ]]
                -- upvalues: v18 (ref)
                if v20 ~= Enum.UserInputState.Begin then
                    return Enum.ContextActionResult.Pass;
                else
                    v18();
                    return Enum.ContextActionResult.Sink;
                end;
            end, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA);
        else
            v10:SetMenuIsOpen(false, "HeadsetDisconnectedDialog");
            l_ContextActionService_0:UnbindCoreAction("TopBarGamepadDisableMenuShortcut");
            l_ContextActionService_0:UnbindCoreAction("TopBarDialogConfirm");
        end;
        return function() --[[ Line: 85 ]]
            -- upvalues: v10 (ref), l_ContextActionService_0 (ref)
            v10:SetMenuIsOpen(false, "HeadsetDisconnectedDialog");
            l_ContextActionService_0:UnbindCoreAction("TopBarGamepadDisableMenuShortcut");
            l_ContextActionService_0:UnbindCoreAction("TopBarDialogConfirm");
        end;
    end, {
        v13
    });
    if v13 then
        return (v6.createElement(l_Dialog_0.Root, {
            size = v4.Enums.DialogSize.Small, 
            hasBackdrop = v9.hasBackdrop == nil or v9.hasBackdrop, 
            disablePortal = v9.disablePortal, 
            testId = "headset-disconnect-dialog"
        }, {
            DialogTitle = v6.createElement(l_Dialog_0.Title, {
                text = v12.titleText
            }), 
            DialogContent = v6.createElement(l_Dialog_0.Content, nil, {
                DialogText = v6.createElement(l_Dialog_0.Text, {
                    Text = v12.bodyText
                })
            }), 
            DialogActions = v6.createElement(l_Dialog_0.Actions, {
                actions = {
                    {
                        text = v12.buttonText, 
                        variant = v4.Enums.ButtonVariant.Emphasis, 
                        onActivated = v18, 
                        testId = "restart-button"
                    }
                }
            })
        }));
    else
        return nil;
    end;
end;
return v6.memo(HeadsetDisconnectDialog);