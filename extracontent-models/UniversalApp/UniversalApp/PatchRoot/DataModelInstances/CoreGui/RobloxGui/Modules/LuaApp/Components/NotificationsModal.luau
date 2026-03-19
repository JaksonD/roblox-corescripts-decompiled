local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v6 = require(l_CorePackages_0.Packages.Foundation);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v9 = require(l_Modules_0.LuaApp.Http.Url);
local l_Dialog_0 = v6.Dialog;
local l_DialogSize_0 = v6.Enums.DialogSize;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
local l_Toggle_0 = v6.Toggle;
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
return function() --[[ Line: 20 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v3 (copy), v9 (copy), l_HttpService_0 (copy), v8 (copy), v5 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Toggle_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy)
    local v17 = l_useDispatch_0();
    local v18 = l_useLocalization_0({
        header = "Notifications.DesktopPushNotificationPrompts.Heading.EnablePrompt", 
        description = "Notifications.DesktopPushNotificationPrompts.Description.EnablePrompt", 
        switchLabel = "Notifications.DesktopPushNotificationPrompts.Label.GetNotifications", 
        buttonText = "Notifications.DesktopPushNotificationPrompts.Action.OK"
    });
    local v19, v20 = v3.useState(false);
    local v22 = v3.useCallback(function(v21) --[[ Line: 32 ]]
        -- upvalues: v20 (copy)
        v20(v21);
    end, {});
    local v27 = v3.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v19 (copy), v9 (ref), l_HttpService_0 (ref), v8 (ref)
        local v23 = {
            aggregatedDesktopNotifications = v19 and "Enabled" or "Disabled"
        };
        local v24 = {
            Url = v9.APIS_URL .. "user-settings-api/v2/user-settings", 
            Method = "POST", 
            Body = l_HttpService_0:JSONEncode(v23), 
            Headers = {
                ["Content-Type"] = "application/json"
            }
        };
        spawn(function() --[[ Line: 50 ]]
            -- upvalues: l_HttpService_0 (ref), v24 (copy), v8 (ref)
            l_HttpService_0:RequestInternal(v24):Start(function(v25, v26) --[[ Line: 52 ]]
                -- upvalues: v8 (ref)
                if not v25 then
                    v8:error("Error updating user notification preferences. Status code: " .. tostring(v26.StatusCode));
                    return;
                elseif v26.StatusCode < 200 or v26.StatusCode >= 300 then
                    v8:error("Error updating user notification preferences. Status code: " .. tostring(v26.StatusCode));
                    return;
                else
                    v8:info("Successfully updated user notification preferences.");
                    return;
                end;
            end);
        end);
    end, {
        v19
    });
    local v28 = v3.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v27 (copy), v17 (copy), v5 (ref)
        v27();
        return v17(v5());
    end, {
        v17, 
        v27
    });
    return v3.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium
    }, {
        DialogTitle = v3.createElement(l_Dialog_0.Title, {
            text = v18.header, 
            LayoutOrder = 1
        }), 
        DialogText = v3.createElement(l_Dialog_0.Text, {
            Text = v18.description, 
            LayoutOrder = 2
        }), 
        DialogContent = v3.createElement(l_Dialog_0.Content, {
            LayoutOrder = 3
        }, {
            v3.createElement(l_View_0, {
                tag = "row size-full-0 auto-y padding-medium bg-shift-100 radius-medium"
            }, {
                Text = v3.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Text = v18.switchLabel, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    tag = "fill auto-y"
                }), 
                Toggle = v3.createElement(l_Toggle_0, {
                    label = "", 
                    LayoutOrder = 2, 
                    isChecked = v19, 
                    size = l_InputSize_0.Medium, 
                    onActivated = v22
                })
            })
        }), 
        DialogActions = v3.createElement(l_Dialog_0.Actions, {
            actions = {
                {
                    variant = l_ButtonVariant_0.Emphasis, 
                    text = v18.buttonText, 
                    onActivated = v28
                }
            }, 
            LayoutOrder = 4
        })
    });
end;