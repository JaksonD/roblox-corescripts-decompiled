local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ToastNotification);
local v4 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_NotificationSnoozedSignal_0 = v3.Signals.NotificationSnoozedSignal;
local l_ShowNotificationSnoozeMenuSignal_0 = v3.Signals.ShowNotificationSnoozeMenuSignal;
local l_default_0 = v3.ToastNotificationSnoozeManager.default;
local l_ToastNotificationTypeModule_0 = v3.ToastNotificationTypeModule;
local l_NotificationGroups_0 = v3.NotificationGroups;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_Images_0 = v4.App.ImageSet.Images;
local v13 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("ChatLanding");
local v15 = require(l_script_FirstAncestor_1.ChatLandingTelemetryEvents);
local v16 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagUseNotificationGroupsConfig_0 = require(l_Parent_0.SharedFlags).FFlagUseNotificationGroupsConfig;
return function(v20) --[[ Line: 35 ]] --[[ Name: SnoozeToastNotificationsButton ]]
    -- upvalues: l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v2 (copy), l_default_0 (copy), l_ToastNotificationTypeModule_0 (copy), l_NotificationSnoozedSignal_0 (copy), v13 (copy), v16 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_FFlagUseNotificationGroupsConfig_0 (copy), l_NotificationGroups_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), v15 (copy)
    local v21 = l_useLocalization_0({
        chat = "Feature.Chat.Heading.ChatWithConnections", 
        party = "Feature.Squads.Label.Party", 
        snoozeTitle = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.SnoozePartyNotifications" or "Feature.Chat.Label.SnoozeChatNotifications", 
        unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback"
    });
    local v22, v23 = v2.useState(l_default_0:isSnoozedNotificationType(l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage));
    v2.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: l_NotificationSnoozedSignal_0 (ref), l_ToastNotificationTypeModule_0 (ref), v23 (copy)
        local v25 = l_NotificationSnoozedSignal_0:connect(function(v24) --[[ Line: 52 ]]
            -- upvalues: l_ToastNotificationTypeModule_0 (ref), v23 (ref)
            if v24.notificationType == l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage then
                v23(v24.actionType == l_ToastNotificationTypeModule_0.SnoozeActionEnum.Mute);
            end;
        end);
        return function() --[[ Line: 63 ]]
            -- upvalues: v25 (copy)
            v25:disconnect();
        end;
    end, {});
    local v26 = v13(v16.Context);
    return v2.createElement(l_IconButton_0, {
        size = v20.size, 
        icon = if v22 then l_Images_0["icons/common/snoozeNotificationsOn"] else l_Images_0["icons/common/snoozeNotificationsOff"], 
        layoutOrder = v20.layoutOrder, 
        onActivated = function() --[[ Line: 76 ]] --[[ Name: onActivated ]]
            -- upvalues: v22 (copy), v21 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), l_default_0 (ref), l_FFlagUseNotificationGroupsConfig_0 (ref), l_NotificationGroups_0 (ref), l_ToastNotificationTypeModule_0 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v26 (copy), v15 (ref)
            if v22 then
                local v27 = v21.unmuteFeedback:gsub("{title}", if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then v21.party else v21.chat);
                l_default_0:unmuteNotification({
                    notificationType = if l_FFlagUseNotificationGroupsConfig_0 then l_NotificationGroups_0.ChatLandingNotificationsGroup else l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage, 
                    modalMessage = v27, 
                    context = "ChatLandingSnoozeToastNotificationsButton"
                });
            else
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "ChatLandingSnoozeToastNotificationsButton", 
                    notificationType = if l_FFlagUseNotificationGroupsConfig_0 then l_NotificationGroups_0.ChatLandingNotificationsGroup else l_ToastNotificationTypeModule_0.NotificationTypeEnum.ChatNewMessage, 
                    title = v21.snoozeTitle
                });
            end;
            v26.emit(v15.ChatLandingSnoozeBtnClicked, {
                isChatNotificationsMuted = v22
            });
        end
    });
end;