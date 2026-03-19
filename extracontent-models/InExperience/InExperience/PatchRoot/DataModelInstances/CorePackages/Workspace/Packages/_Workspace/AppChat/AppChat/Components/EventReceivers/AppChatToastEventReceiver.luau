local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.ToastNotification);
local l_default_0 = require(l_Parent_0.ToastNotificationsProtocol).ToastNotificationProtocol.default;
local l_default_1 = v6.ToastNotificationSnoozeManager.default;
local l_SnoozeActionEnum_0 = v6.ToastNotificationTypeModule.SnoozeActionEnum;
local l_NotificationGroups_0 = v6.NotificationGroups;
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_LifecycleEvents_0 = v6.LifecycleEvents;
local l_NotificationTypeEnum_0 = v6.ToastNotificationTypeModule.NotificationTypeEnum;
local l_NotificationSnoozedSignal_0 = v6.Signals.NotificationSnoozedSignal;
local l_ShowNotificationSnoozeMenuSignal_0 = v6.Signals.ShowNotificationSnoozeMenuSignal;
local l_DismissNotificationSnoozeMenuSignal_0 = v6.Signals.DismissNotificationSnoozeMenuSignal;
local v19 = require(l_Parent_0.UniversalAppPolicy);
local l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagUseNotificationGroupsConfig_0 = require(l_Parent_0.SharedFlags).FFlagUseNotificationGroupsConfig;
local v24 = {
    hideAllChatToasts = false, 
    isAppChatVisible = false, 
    isInExperience = false, 
    navigateToChat = function() --[[ Line: 44 ]] --[[ Name: navigateToChat ]]

    end
};
return function(v25) --[[ Line: 47 ]]
    -- upvalues: v3 (copy), v24 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy), v19 (copy), v11 (copy), v4 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), l_HttpService_0 (copy), l_default_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), l_FFlagUseNotificationGroupsConfig_0 (copy), l_NotificationGroups_0 (copy), l_dependencyArray_0 (copy), l_NotificationSnoozedSignal_0 (copy), l_SnoozeActionEnum_0 (copy), l_default_1 (copy), l_DismissNotificationSnoozeMenuSignal_0 (copy)
    local v26 = v3.Dictionary.join(v24, v25);
    local v27 = l_useLocalization_0({
        snoozeDescription = "Feature.Chat.Description.SnoozeDescription", 
        snoozeTitle = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.SnoozePartyNotifications" or "Feature.Chat.Label.SnoozeChatNotifications"
    });
    local v28 = 0;
    local v29 = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then v26.isAppChatVisible else v26.hideAllChatToasts;
    local v30 = v19.getAppFeaturePolicies().getCanSeeChatTab();
    local v31 = v11();
    v29 = v29 or not v31;
    v4.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), v26 (copy), l_ShowNotificationSnoozeMenuSignal_0 (ref), v27 (copy), l_FFlagUseNotificationGroupsConfig_0 (ref), l_NotificationGroups_0 (ref)
        local v34 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.ChatNewMessage, function(v32) --[[ Line: 71 ]]
            -- upvalues: l_HttpService_0 (ref), l_default_0 (ref), v26 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v27 (ref), l_FFlagUseNotificationGroupsConfig_0 (ref), l_NotificationGroups_0 (ref), l_NotificationTypeEnum_0 (ref)
            if v32 and v32.userActionType == "click" and v32.notificationData and v32.visualItem and v32.visualItem.eventName == "ChatMessageBody" and v32.visualItem.actionEventParams then
                local v33 = l_HttpService_0:JSONDecode(v32.visualItem.actionEventParams);
                l_default_0:dismissNotification(v32.notificationData.id);
                v26.navigateToChat(v33.conversationId);
            end;
            if v32 and v32.userActionType == "click" and v32.notificationData and v32.visualItem and v32.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "Toast", 
                    description = v27.snoozeDescription, 
                    notificationType = if l_FFlagUseNotificationGroupsConfig_0 then l_NotificationGroups_0.ChatMessageGroup else l_NotificationTypeEnum_0.ChatNewMessage, 
                    title = v27.snoozeTitle
                });
            end;
        end);
        return function() --[[ Line: 105 ]]
            -- upvalues: v34 (copy)
            v34();
        end;
    end, l_dependencyArray_0(v26.navigateToChat, v27));
    v4.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), v29 (ref), v30 (copy), v28 (ref), l_FFlagUseNotificationGroupsConfig_0 (ref), l_NotificationSnoozedSignal_0 (ref), l_SnoozeActionEnum_0 (ref), l_default_1 (ref)
        local v36 = l_default_0:listenToDisplayNotification(function(v35) --[[ Line: 112 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v29 (ref), v30 (ref), l_default_0 (ref), v28 (ref)
            if v35.notificationType == l_NotificationTypeEnum_0.ChatNewMessage then
                if v29 or not v30 then
                    l_default_0:dismissNotification(v35.notificationId);
                    return;
                else
                    v28 = v28 + 1;
                end;
            end;
        end);
        local v37 = nil;
        if not l_FFlagUseNotificationGroupsConfig_0 then
            v37 = l_NotificationSnoozedSignal_0:connect(function(v38) --[[ Line: 125 ]]
                -- upvalues: l_NotificationTypeEnum_0 (ref), l_SnoozeActionEnum_0 (ref), l_default_1 (ref)
                if v38.notificationType == l_NotificationTypeEnum_0.ChatNewMessage then
                    if v38.actionType == l_SnoozeActionEnum_0.Mute then
                        l_default_1:snoozeNotification({
                            context = v38.context, 
                            durationMinutes = v38.durationMinutes, 
                            notificationType = l_NotificationTypeEnum_0.SquadInvitation
                        });
                        return;
                    elseif v38.actionType == l_SnoozeActionEnum_0.Unmute then
                        l_default_1:unmuteNotification({
                            context = v38.context, 
                            notificationType = l_NotificationTypeEnum_0.SquadInvitation
                        });
                    end;
                end;
            end);
        end;
        return function() --[[ Line: 149 ]]
            -- upvalues: v36 (copy), l_FFlagUseNotificationGroupsConfig_0 (ref), v37 (ref)
            v36:Disconnect();
            if not l_FFlagUseNotificationGroupsConfig_0 and v37 then
                v37:disconnect();
            end;
        end;
    end, {
        v29, 
        v30
    });
    if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then
        v4.useEffect(function() --[[ Line: 158 ]]
            -- upvalues: v26 (copy), l_DismissNotificationSnoozeMenuSignal_0 (ref)
            if not v26.isAppChatVisible and l_DismissNotificationSnoozeMenuSignal_0 then
                l_DismissNotificationSnoozeMenuSignal_0:fire();
            end;
        end, {
            v26.isAppChatVisible
        });
    end;
end;