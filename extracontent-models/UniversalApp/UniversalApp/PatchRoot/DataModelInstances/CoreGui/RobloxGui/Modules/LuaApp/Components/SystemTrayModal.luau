local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
return function() --[[ Line: 11 ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy)
    local v9 = l_useLocalization_0({
        header = "Notifications.DesktopPushNotificationPrompts.Heading.SystemTrayPrompt", 
        description = "Notifications.DesktopPushNotificationPrompts.Description.SystemTrayPrompt", 
        buttonText = "Notifications.DesktopPushNotificationPrompts.Action.OK"
    });
    local v10 = v2.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
        l_GuiService_0:BroadcastNotification("", l_l_GuiService_0_NotificationTypeList_0.NATIVE_EXIT);
    end, {});
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v9.header, 
            LayoutOrder = 1
        }), 
        DialogText = v2.createElement(l_Dialog_0.Text, {
            Text = v9.description, 
            LayoutOrder = 2
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            actions = {
                {
                    variant = l_ButtonVariant_0.Emphasis, 
                    text = v9.buttonText, 
                    onActivated = v10
                }
            }, 
            LayoutOrder = 3
        })
    });
end;