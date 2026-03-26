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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v25 = {
    hideAllChatToasts = false, 
    isAppChatVisible = false, 
    isInExperience = false, 
    navigateToChat = function() --[[ Line: 46 ]] --[[ Name: navigateToChat ]]

    end
};
return function(v26) --[[ Line: 49 ]]
    -- upvalues: v3 (copy), v25 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy), v19 (copy), v11 (copy), v4 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), l_HttpService_0 (copy), l_default_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), l_FFlagUseNotificationGroupsConfig_0 (copy), l_NotificationGroups_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_NotificationSnoozedSignal_0 (copy), l_SnoozeActionEnum_0 (copy), l_default_1 (copy), l_DismissNotificationSnoozeMenuSignal_0 (copy)
    local v27 = v3.Dictionary.join(v25, v26);
    local v28 = l_useLocalization_0({
        snoozeDescription = "Feature.Chat.Description.SnoozeDescription", 
        snoozeTitle = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.SnoozePartyNotifications" or "Feature.Chat.Label.SnoozeChatNotifications"
    });
    local v29 = 0;
    local v30 = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then v27.isAppChatVisible else v27.hideAllChatToasts;
    local v31 = v19.getAppFeaturePolicies().getCanSeeChatTab();
    local v32 = v11();
    v30 = v30 or not v32;
    v4.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), v27 (copy), l_ShowNotificationSnoozeMenuSignal_0 (ref), v28 (copy), l_FFlagUseNotificationGroupsConfig_0 (ref), l_NotificationGroups_0 (ref)
        local v35 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.ChatNewMessage, function(v33) --[[ Line: 74 ]]
            -- upvalues: l_HttpService_0 (ref), l_default_0 (ref), v27 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v28 (ref), l_FFlagUseNotificationGroupsConfig_0 (ref), l_NotificationGroups_0 (ref), l_NotificationTypeEnum_0 (ref)
            if v33 and v33.userActionType == "click" and v33.notificationData and v33.visualItem and v33.visualItem.eventName == "ChatMessageBody" and v33.visualItem.actionEventParams then
                local v34 = l_HttpService_0:JSONDecode(v33.visualItem.actionEventParams);
                l_default_0:dismissNotification(v33.notificationData.id);
                v27.navigateToChat(v34.conversationId);
            end;
            if v33 and v33.userActionType == "click" and v33.notificationData and v33.visualItem and v33.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "Toast", 
                    description = v28.snoozeDescription, 
                    notificationType = if l_FFlagUseNotificationGroupsConfig_0 then l_NotificationGroups_0.ChatMessageGroup else l_NotificationTypeEnum_0.ChatNewMessage, 
                    title = v28.snoozeTitle
                });
            end;
        end);
        return function() --[[ Line: 108 ]]
            -- upvalues: v35 (copy)
            v35();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v27.navigateToChat, 
        v28
    } else l_dependencyArray_0(v27.navigateToChat, v28));
    v4.useEffect(function() --[[ Line: 117 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), v30 (ref), v31 (copy), v29 (ref), l_FFlagUseNotificationGroupsConfig_0 (ref), l_NotificationSnoozedSignal_0 (ref), l_SnoozeActionEnum_0 (ref), l_default_1 (ref)
        local v37 = l_default_0:listenToDisplayNotification(function(v36) --[[ Line: 119 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v30 (ref), v31 (ref), l_default_0 (ref), v29 (ref)
            if v36.notificationType == l_NotificationTypeEnum_0.ChatNewMessage then
                if v30 or not v31 then
                    l_default_0:dismissNotification(v36.notificationId);
                    return;
                else
                    v29 = v29 + 1;
                end;
            end;
        end);
        local v38 = nil;
        if not l_FFlagUseNotificationGroupsConfig_0 then
            v38 = l_NotificationSnoozedSignal_0:connect(function(v39) --[[ Line: 132 ]]
                -- upvalues: l_NotificationTypeEnum_0 (ref), l_SnoozeActionEnum_0 (ref), l_default_1 (ref)
                if v39.notificationType == l_NotificationTypeEnum_0.ChatNewMessage then
                    if v39.actionType == l_SnoozeActionEnum_0.Mute then
                        l_default_1:snoozeNotification({
                            context = v39.context, 
                            durationMinutes = v39.durationMinutes, 
                            notificationType = l_NotificationTypeEnum_0.SquadInvitation
                        });
                        return;
                    elseif v39.actionType == l_SnoozeActionEnum_0.Unmute then
                        l_default_1:unmuteNotification({
                            context = v39.context, 
                            notificationType = l_NotificationTypeEnum_0.SquadInvitation
                        });
                    end;
                end;
            end);
        end;
        return function() --[[ Line: 156 ]]
            -- upvalues: v37 (copy), l_FFlagUseNotificationGroupsConfig_0 (ref), v38 (ref)
            v37:Disconnect();
            if not l_FFlagUseNotificationGroupsConfig_0 and v38 then
                v38:disconnect();
            end;
        end;
    end, {
        v30, 
        v31
    });
    if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then
        v4.useEffect(function() --[[ Line: 165 ]]
            -- upvalues: v27 (copy), l_DismissNotificationSnoozeMenuSignal_0 (ref)
            if not v27.isAppChatVisible and l_DismissNotificationSnoozeMenuSignal_0 then
                l_DismissNotificationSnoozeMenuSignal_0:fire();
            end;
        end, {
            v27.isAppChatVisible
        });
    end;
end;