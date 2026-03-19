local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactRoblox);
local v7 = require(l_Parent_0.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local v9 = require(l_Parent_0.NotificationModalsManager);
local l_useState_0 = v5.useState;
local l_useCallback_0 = v5.useCallback;
local l_useEffect_0 = v5.useEffect;
local l_useRef_0 = v5.useRef;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v15 = game:DefineFastFlag("EnableConsoleAutoFocusForUEN1", false);
local v16 = game:DefineFastFlag("NotificationsUpsellLocalPlayerFromServiceFix", false);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local v19 = require(l_Parent_0.HttpRequest);
local v20 = v19.config({
    requestFunction = v19.requestFunctions.HttpRbxApi, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("NotificationsUpsellModalHttpRetryCount", 4) else nil
});
local v21 = require(script.Parent.Parent.Requests.FollowingsPostFollow);
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v23 = require(script.Parent.Parent.Analytics.ModalEventConstants);
local v24 = require(script.Parent.Parent.Util.RichTextEscape);
return function(v25) --[[ Line: 41 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useCallback_0 (copy), l_sendEventDeferred_0 (copy), v23 (copy), v16 (copy), l_Players_0 (copy), v21 (copy), v20 (copy), v9 (copy), l_Images_0 (copy), l_useState_0 (copy), l_useRef_0 (copy), v15 (copy), l_useEffect_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v5 (copy), v6 (copy), l_InteractiveAlert_0 (copy), v24 (copy), l_ButtonType_0 (copy)
    local v26 = l_useLocalization_0({
        Cancel = "CommonUI.Controls.Action.Cancel", 
        Yes = "CommonUI.Controls.Action.Yes", 
        Heading = "Feature.Notifications.Heading.TurnOnNotifications", 
        ReceiveUpdates = "Feature.Notifications.Label.ReceiveActivityUpdates", 
        ReceiveUpdatesForExperience = "Feature.Notifications.Label.GetUpdatesFromExperience", 
        NotificationsEnabledForExperience = "Feature.Notifications.Response.NotificationsEnabledForExperience", 
        NotificationsEnabled = "Feature.Notifications.Response.NotificationsEnabled", 
        SomethingWentWrong = "Feature.Call.Error.Description.Generic"
    });
    local v27 = l_useCallback_0(function() --[[ Line: 54 ]]
        -- upvalues: l_sendEventDeferred_0 (ref), v23 (ref), v25 (copy)
        l_sendEventDeferred_0(v23.ModalContext, v23.OptInEventName, {
            [v23.ActionType] = v23.Clicked, 
            [v23.Button] = v23.Cancel, 
            [v23.UniverseId] = v25.ExperienceId
        });
        v25.CloseModal();
    end, {
        v25.CloseModal, 
        v25.ExperienceId
    });
    local v29 = l_useCallback_0(function() --[[ Line: 63 ]]
        -- upvalues: l_sendEventDeferred_0 (ref), v23 (ref), v25 (copy), v16 (ref), l_Players_0 (ref), v21 (ref), v20 (ref), v9 (ref), l_Images_0 (ref), v26 (copy)
        l_sendEventDeferred_0(v23.ModalContext, v23.OptInEventName, {
            [v23.ActionType] = v23.Clicked, 
            [v23.Button] = v23.Confirm, 
            [v23.UniverseId] = v25.ExperienceId
        });
        local v28 = if v16 then l_Players_0 and l_Players_0.LocalPlayer else game.Players.LocalPlayer;
        if v25.ExperienceId ~= "0" and v28 then
            l_sendEventDeferred_0(v23.ModalContext, v23.OptInEventName, {
                [v23.ActionType] = v23.BackendRequested, 
                [v23.UniverseId] = v25.ExperienceId
            });
            v21(v20, tostring(v28.UserId), (tostring(v25.ExperienceId))):andThen(function() --[[ Line: 78 ]]
                -- upvalues: l_sendEventDeferred_0 (ref), v23 (ref), v25 (ref), v9 (ref), l_Images_0 (ref), v26 (ref)
                l_sendEventDeferred_0(v23.ModalContext, v23.OptInEventName, {
                    [v23.ActionType] = v23.BackendSuccess, 
                    [v23.UniverseId] = v25.ExperienceId
                });
                v9.SetUIBloxToast({
                    iconImage = l_Images_0["icons/common/notificationOn"], 
                    toastTitle = if v25.ExperienceName then v26.NotificationsEnabledForExperience:gsub("{experienceName}", v25.ExperienceName) else v26.NotificationsEnabled
                });
            end, function() --[[ Line: 93 ]]
                -- upvalues: l_sendEventDeferred_0 (ref), v23 (ref), v25 (ref), v9 (ref), l_Images_0 (ref), v26 (ref)
                l_sendEventDeferred_0(v23.ModalContext, v23.OptInEventName, {
                    [v23.ActionType] = v23.BackendFailed, 
                    [v23.UniverseId] = v25.ExperienceId
                });
                v9.SetUIBloxToast({
                    iconImage = l_Images_0["icons/status/alert"], 
                    toastTitle = v26.SomethingWentWrong
                });
            end);
        end;
        v25.CloseModal();
    end, {
        v25.CloseModal, 
        v25.ExperienceId, 
        v26
    });
    local v30, v31 = l_useState_0(Vector2.new(800, 600));
    local v33 = l_useCallback_0(function(v32) --[[ Line: 115 ]]
        -- upvalues: v31 (copy)
        v31(v32.AbsoluteSize);
    end, {
        v31
    });
    local v34 = l_useRef_0(nil);
    if v15 then
        l_useEffect_0(function() --[[ Line: 121 ]]
            -- upvalues: l_UserInputService_0 (ref), v34 (copy), l_GuiService_0 (ref)
            if not l_UserInputService_0.GamepadEnabled then
                return;
            else
                task.delay(0.3, function() --[[ Line: 128 ]]
                    -- upvalues: v34 (ref), l_GuiService_0 (ref)
                    local v35 = v34.current and v34.current:FindFirstChild("Buttons", true);
                    local v36 = v35 and v35:FindFirstChild("2");
                    if v36 then
                        l_GuiService_0.SelectedCoreObject = v36;
                    end;
                end);
                return function() --[[ Line: 136 ]]
                    -- upvalues: l_GuiService_0 (ref)
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
            end;
        end, {});
    else
        l_useEffect_0(function() --[[ Line: 141 ]]
            -- upvalues: l_UserInputService_0 (ref), v34 (copy), l_GuiService_0 (ref)
            if l_UserInputService_0.GamepadEnabled then
                task.delay(0.3, function() --[[ Line: 145 ]]
                    -- upvalues: v34 (ref), l_GuiService_0 (ref)
                    local v37 = v34.current and v34.current:FindFirstChild("Buttons", true);
                    local v38 = v37 and v37:FindFirstChild("2");
                    if v38 then
                        l_GuiService_0.SelectedCoreObject = v38;
                    end;
                end);
            end;
        end, {});
    end;
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ref = v34, 
        [v6.Change.AbsoluteSize] = v33
    }, {
        ConfirmationPrompt = v5.createElement(l_InteractiveAlert_0, {
            screenSize = v30, 
            title = v26.Heading, 
            bodyText = if v25.ExperienceName then string.gsub(v26.ReceiveUpdatesForExperience, "{experienceName}", "\n<b>" .. v24(v25.ExperienceName) .. "</b>") else v26.ReceiveUpdates, 
            richText = true, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v27, 
                            text = v26.Cancel
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v29, 
                            text = v26.Yes
                        }, 
                        isDefaultChild = false
                    }
                }
            }
        })
    });
end;