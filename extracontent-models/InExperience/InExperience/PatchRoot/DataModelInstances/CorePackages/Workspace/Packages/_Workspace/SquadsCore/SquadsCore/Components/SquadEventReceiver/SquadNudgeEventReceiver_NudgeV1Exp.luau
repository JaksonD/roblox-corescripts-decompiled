local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v5 = require(l_script_FirstAncestor_0.Enums.SquadGameJoinOrigin);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v7 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v8 = require(l_script_FirstAncestor_0.Thunks.actOnPartyNudge);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v10 = require(l_Parent_0.ExperienceService);
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.ToastNotification);
local v13 = require(l_Parent_0.ToastNotificationsProtocol);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ExperienceService_0 = v10.ExperienceService;
local l_GameParams_0 = v10.GameParams;
local l_LifecycleEvents_0 = v12.LifecycleEvents;
local l_NotificationTypeEnum_0 = v12.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_0 = v13.ToastNotificationProtocol.default;
return function(v21) --[[ Line: 37 ]]
    -- upvalues: l_useDispatch_0 (copy), v11 (copy), v7 (copy), l_default_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_HttpService_0 (copy), v4 (copy), v6 (copy), v3 (copy), l_NotificationTypeEnum_0 (copy), v8 (copy), l_LifecycleEvents_0 (copy), l_GameParams_0 (copy), l_ExperienceService_0 (copy), v5 (copy)
    local v22 = l_useDispatch_0();
    local v23 = v11.useContext(v7);
    local v24 = v23.useIsChatEnabled();
    local v25 = v23.useIsLoadingChatSettings();
    local v26 = v11.useRef({});
    local v28 = v11.useCallback(function(v27) --[[ Line: 47 ]]
        -- upvalues: v25 (copy), v24 (copy), l_default_0 (ref)
        if not v25 and not v24 then
            l_default_0:dismissNotification(v27);
            return true;
        else
            return false;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v25, 
        v24
    } else l_dependencyArray_0(v25, v24));
    local v32 = v11.useCallback(function(v29, v30, v31) --[[ Line: 60 ]]
        -- upvalues: v26 (copy), l_HttpService_0 (ref)
        v26.current[v29] = {
            toastType = v30.notificationType, 
            partyAttemptId = l_HttpService_0:GenerateGUID(false), 
            shouldActWhenDismiss = true, 
            nudgeId = v31.nudgeId, 
            nudgeType = v31.nudgeType
        };
    end, {});
    local v35 = v11.useCallback(function(v33, v34) --[[ Line: 73 ]]
        -- upvalues: v23 (copy), v4 (ref), v26 (copy)
        v23.fireSquadAnalytics(v4.SquadToastActions, {
            toastAction = v34, 
            toastType = if v26.current[v33] then v26.current[v33].toastType else nil, 
            nudgeId = if v26.current[v33] then v26.current[v33].nudgeId else nil, 
            nudgeType = if v26.current[v33] then v26.current[v33].nudgeType else nil, 
            partyAttemptId = if v26.current[v33] then v26.current[v33].partyAttemptId else nil, 
            squadLocation = v23.squadLocation
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v23.fireSquadAnalytics, 
        v23.squadLocation
    } else l_dependencyArray_0(v23.fireSquadAnalytics, v23.squadLocation));
    v11.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: l_default_0 (ref), v26 (copy), v35 (copy), v6 (ref), v3 (ref), l_NotificationTypeEnum_0 (ref), v22 (copy), v8 (ref), v23 (copy), v24 (copy)
        local v41 = l_default_0:listenToDismissNotification(function(v36) --[[ Line: 99 ]]
            -- upvalues: v26 (ref), v35 (ref), v6 (ref), v3 (ref), l_NotificationTypeEnum_0 (ref), v22 (ref), v8 (ref), v23 (ref), v24 (ref)
            if v36.notificationId and v26.current[v36.notificationId] then
                v35(v36.notificationId, v6.PartyNudgeGeneralDismiss);
                if v26.current[v36.notificationId].shouldActWhenDismiss then
                    local v37 = v26.current[v36.notificationId];
                    local l_nudgeType_0 = v37.nudgeType;
                    local l_toastType_0 = v37.toastType;
                    if (l_nudgeType_0 == v3.PARTY_TO_ONE_NUDGE_TYPE or l_nudgeType_0 == v3.PARTY_TO_PARTY_NUDGE_TYPE) and l_toastType_0 == l_NotificationTypeEnum_0.SquadNudgeInvite then
                        local l_REJECT_PARTY_INVITE_ACTION_0 = v3.REJECT_PARTY_INVITE_ACTION;
                        v22(v8(l_REJECT_PARTY_INVITE_ACTION_0, v37.nudgeId, false, v23.setSquadPrompt, v23.fireSquadAnalytics, v23.squadLocation, v24));
                    end;
                end;
            end;
            v26.current[v36.notificationId] = nil;
        end);
        return function() --[[ Line: 135 ]]
            -- upvalues: v41 (copy)
            if v41 then
                v41:Disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v35, 
        v24, 
        v23.setSquadPrompt, 
        v23.fireSquadAnalytics, 
        v23.squadLocation
    } else l_dependencyArray_0(v35, v24, v23.setSquadPrompt, v23.fireSquadAnalytics, v23.squadLocation));
    v11.useEffect(function() --[[ Line: 159 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v26 (copy), v28 (copy), l_HttpService_0 (ref), v3 (ref), l_default_0 (ref), v35 (copy), v6 (ref), l_GameParams_0 (ref), l_ExperienceService_0 (ref), v5 (ref)
        local v45 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v42) --[[ Line: 163 ]]
            -- upvalues: v26 (ref), v28 (ref), l_HttpService_0 (ref), v3 (ref)
            if v42 and v42.userActionType == "click" and v42.notificationData and v42.visualItem and v42.visualItem.actionEventParams and v42.visualItem.visualItemName then
                local l_id_0 = v42.notificationData.id;
                if v26.current[l_id_0] then
                    v26.current[l_id_0].shouldActWhenDismiss = false;
                end;
                if v28(l_id_0) then
                    return;
                else
                    local v44 = l_HttpService_0:JSONDecode(v42.visualItem.actionEventParams);
                    if v44.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v44.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE then

                    end;
                end;
            end;
        end);
        local v50 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.NudgeForInviterSquad, function(v46) --[[ Line: 196 ]]
            -- upvalues: v26 (ref), v28 (ref), l_HttpService_0 (ref), v3 (ref), l_default_0 (ref), v35 (ref), v6 (ref), l_GameParams_0 (ref), l_ExperienceService_0 (ref), v5 (ref)
            if v46 and v46.userActionType == "click" and v46.notificationData and v46.visualItem and v46.visualItem.actionEventParams and v46.visualItem.visualItemName then
                local l_id_1 = v46.notificationData.id;
                if v26.current[l_id_1] then
                    v26.current[l_id_1].shouldActWhenDismiss = false;
                end;
                if v28(l_id_1) then
                    return;
                else
                    local v48 = l_HttpService_0:JSONDecode(v46.visualItem.actionEventParams);
                    if v48.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v48.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE then
                        if v46.visualItem.visualItemName == v3.JOIN_EXPERIENCE_FROM_NUDGE_BUTTON_TYPE then
                            l_default_0:dismissNotification(l_id_1);
                            v35(l_id_1, v6.PartyNudgeAccept);
                            local v49 = l_GameParams_0.fromPlaceId(v48.placeId);
                            l_ExperienceService_0:LaunchExperience(v49, v5.NudgeForInviterSquad, nil);
                            return;
                        elseif v46.visualItem.visualItemName == v3.DISMISS_INVITER_SQUAD_NUDGE_BUTTON_TYPE then
                            v35(l_id_1, v6.PartyNudgeButtonDismiss);
                        end;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 244 ]]
            -- upvalues: v45 (copy), v50 (copy)
            if v45 then
                v45();
            end;
            if v50 then
                v50();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v28, 
        v35, 
        v23, 
        v23.setSquadPrompt, 
        v23.fireSquadAnalytics, 
        v23.squadLocation, 
        v21.currentSquadId
    } else l_dependencyArray_0(v28, v35, v23, v23.setSquadPrompt, v23.fireSquadAnalytics, v23.squadLocation, v21.currentSquadId));
    v11.useEffect(function() --[[ Line: 276 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v28 (copy), l_HttpService_0 (ref), v3 (ref), v21 (copy), l_default_0 (ref), v32 (copy), v35 (copy), v6 (ref)
        local v55 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v51) --[[ Line: 280 ]]
            -- upvalues: v28 (ref), l_HttpService_0 (ref), v3 (ref), v21 (ref), l_default_0 (ref), v32 (ref), v35 (ref), v6 (ref)
            local l_actionEventParams_0 = v51.state.visualItems.button[1].actionEventParams;
            local l_id_2 = v51.id;
            if v28(l_id_2) then
                return;
            else
                local v54 = l_HttpService_0:JSONDecode(l_actionEventParams_0);
                if (v54.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v54.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE) and v21.currentSquadId ~= "" and v21.currentSquadId == v54.squadId then
                    l_default_0:dismissNotification(l_id_2);
                    return;
                else
                    v32(l_id_2, v51, v54);
                    v35(l_id_2, v6.PartyNudgeDisplay);
                    return;
                end;
            end;
        end);
        local v60 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.NudgeForInviterSquad, function(v56) --[[ Line: 309 ]]
            -- upvalues: v28 (ref), l_HttpService_0 (ref), v3 (ref), l_default_0 (ref), v21 (ref), v32 (ref), v35 (ref), v6 (ref)
            local l_actionEventParams_1 = v56.state.visualItems.button[1].actionEventParams;
            local l_id_3 = v56.id;
            if v28(l_id_3) then
                return;
            else
                local v59 = l_HttpService_0:JSONDecode(l_actionEventParams_1);
                if v59.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v59.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE then
                    if v59.gameInstanceId == game.JobId then
                        l_default_0:dismissNotification(l_id_3);
                        return;
                    elseif v21.currentSquadId == "" or v21.currentSquadId ~= v59.squadId then
                        l_default_0:dismissNotification(l_id_3);
                        return;
                    end;
                end;
                v32(l_id_3, v56, v59);
                v35(l_id_3, v6.PartyNudgeDisplay);
                return;
            end;
        end);
        local v65 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadJoinRequestPrompt, function(v61) --[[ Line: 343 ]]
            -- upvalues: v28 (ref), l_HttpService_0 (ref), v32 (ref), v35 (ref), v6 (ref)
            local l_actionEventParams_2 = v61.state.visualItems.button[1].actionEventParams;
            local l_id_4 = v61.id;
            if v28(l_id_4) then
                return;
            else
                local v64 = l_HttpService_0:JSONDecode(l_actionEventParams_2);
                v32(l_id_4, v61, v64);
                v35(l_id_4, v6.PartyNudgeDisplay);
                return;
            end;
        end);
        local v70 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadAcceptJoinRequest, function(v66) --[[ Line: 360 ]]
            -- upvalues: v28 (ref), l_HttpService_0 (ref), v32 (ref), v35 (ref), v6 (ref)
            local l_actionEventParams_3 = v66.state.visualItems.button[1].actionEventParams;
            local l_id_5 = v66.id;
            if v28(l_id_5) then
                return;
            else
                local v69 = l_HttpService_0:JSONDecode(l_actionEventParams_3);
                v32(l_id_5, v66, v69);
                v35(l_id_5, v6.PartyNudgeDisplay);
                return;
            end;
        end);
        return function() --[[ Line: 374 ]]
            -- upvalues: v55 (copy), v60 (copy), v65 (copy), v70 (copy)
            if v55 then
                v55();
            end;
            if v60 then
                v60();
            end;
            if v65 then
                v65();
            end;
            if v70 then
                v70();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v28, 
        v32, 
        v35, 
        v21.currentSquadId
    } else l_dependencyArray_0(v28, v32, v35, v21.currentSquadId));
    return nil;
end;