local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Thunks.createOrJoinSquad);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v7 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v8 = require(l_script_FirstAncestor_0.Enums.SquadToastType);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.ToastNotification);
local v11 = require(l_Parent_0.ToastNotificationsProtocol);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_LifecycleEvents_0 = v10.LifecycleEvents;
local l_NotificationTypeEnum_0 = v10.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_0 = v11.ToastNotificationProtocol.default;
return function() --[[ Line: 24 ]] --[[ Name: SquadScheduledSquadEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v9 (copy), v6 (copy), l_default_0 (copy), l_NotificationTypeEnum_0 (copy), l_LifecycleEvents_0 (copy), v3 (copy), l_HttpService_0 (copy), v5 (copy), v7 (copy), v8 (copy), v4 (copy)
    local v16 = l_useDispatch_0();
    local v17 = v9.useContext(v6);
    local v18 = v17.useIsChatEnabled();
    v9.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), v18 (copy)
        local v20 = l_default_0:listenToDisplayNotification(function(v19) --[[ Line: 31 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v18 (ref), l_default_0 (ref)
            if (v19.notificationType == l_NotificationTypeEnum_0.ScheduledSquadHappeningNow or v19.notificationType == l_NotificationTypeEnum_0.ScheduledSquadReminder) and not v18 then
                l_default_0:dismissNotification(v19.notificationId);
            end;
        end);
        return function() --[[ Line: 43 ]]
            -- upvalues: v20 (copy)
            v20:Disconnect();
        end;
    end, {
        v18
    });
    v9.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v3 (ref), l_HttpService_0 (ref), v17 (copy), v5 (ref), v7 (ref), v8 (ref), v16 (copy), v4 (ref)
        local v23 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.ScheduledSquadHappeningNow, function(v21) --[[ Line: 53 ]]
            -- upvalues: v3 (ref), l_HttpService_0 (ref), v17 (ref), v5 (ref), v7 (ref), v8 (ref), v16 (ref), v4 (ref)
            if v21 and v21.userActionType == "click" and v21.visualItem and v21.visualItem.actionEventParams and v21.visualItem.visualItemName == v3.JOIN_SQUAD then
                local v22 = l_HttpService_0:JSONDecode(v21.visualItem.actionEventParams);
                v17.fireSquadAnalytics(v5.SquadToastActions, {
                    parentChannelId = v22.parentChannelId, 
                    toastAction = v7.ScheduledSquadHappeningNowJoinParty, 
                    toastType = v8.ScheduledSquadHappeningNow
                });
                v16(v4(v22.parentChannelId, v17.setSquadPrompt, v17.fireSquadAnalytics, v17.squadLocation, l_HttpService_0:GenerateGUID(false), function() --[[ Line: 75 ]]

                end, (tostring(v22.scheduledGroupUpId))));
            end;
        end);
        return function() --[[ Line: 83 ]]
            -- upvalues: v23 (copy)
            v23();
        end;
    end, {
        v16, 
        v17.setSquadPrompt, 
        v17.fireSquadAnalytics, 
        v17.squadLocation
    });
end;