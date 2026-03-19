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
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ExperienceService_0 = v10.ExperienceService;
local l_GameParams_0 = v10.GameParams;
local l_LifecycleEvents_0 = v12.LifecycleEvents;
local l_NotificationTypeEnum_0 = v12.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_0 = v13.ToastNotificationProtocol.default;
return function(v20) --[[ Line: 35 ]]
    -- upvalues: l_useDispatch_0 (copy), v11 (copy), v7 (copy), l_default_0 (copy), l_dependencyArray_0 (copy), l_HttpService_0 (copy), v4 (copy), v6 (copy), v3 (copy), l_NotificationTypeEnum_0 (copy), v8 (copy), l_LifecycleEvents_0 (copy), l_GameParams_0 (copy), l_ExperienceService_0 (copy), v5 (copy)
    local v21 = l_useDispatch_0();
    local v22 = v11.useContext(v7);
    local v23 = v22.useIsChatEnabled();
    local v24 = v22.useIsLoadingChatSettings();
    local v25 = v11.useRef({});
    local v27 = v11.useCallback(function(v26) --[[ Line: 44 ]]
        -- upvalues: v24 (copy), v23 (copy), l_default_0 (ref)
        if not v24 and not v23 then
            l_default_0:dismissNotification(v26);
            return true;
        else
            return false;
        end;
    end, l_dependencyArray_0(v24, v23));
    local v31 = v11.useCallback(function(v28, v29, v30) --[[ Line: 53 ]]
        -- upvalues: v25 (copy), l_HttpService_0 (ref)
        v25.current[v28] = {
            toastType = v29.notificationType, 
            partyAttemptId = l_HttpService_0:GenerateGUID(false), 
            shouldActWhenDismiss = true, 
            nudgeId = v30.nudgeId, 
            nudgeType = v30.nudgeType
        };
    end, {});
    local v34 = v11.useCallback(function(v32, v33) --[[ Line: 65 ]]
        -- upvalues: v22 (copy), v4 (ref), v25 (copy)
        v22.fireSquadAnalytics(v4.SquadToastActions, {
            toastAction = v33, 
            toastType = if v25.current[v32] then v25.current[v32].toastType else nil, 
            nudgeId = if v25.current[v32] then v25.current[v32].nudgeId else nil, 
            nudgeType = if v25.current[v32] then v25.current[v32].nudgeType else nil, 
            partyAttemptId = if v25.current[v32] then v25.current[v32].partyAttemptId else nil, 
            squadLocation = v22.squadLocation
        });
    end, l_dependencyArray_0(v22.fireSquadAnalytics, v22.squadLocation));
    v11.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: l_default_0 (ref), v25 (copy), v34 (copy), v6 (ref), v3 (ref), l_NotificationTypeEnum_0 (ref), v21 (copy), v8 (ref), v22 (copy), v23 (copy)
        local v40 = l_default_0:listenToDismissNotification(function(v35) --[[ Line: 87 ]]
            -- upvalues: v25 (ref), v34 (ref), v6 (ref), v3 (ref), l_NotificationTypeEnum_0 (ref), v21 (ref), v8 (ref), v22 (ref), v23 (ref)
            if v35.notificationId and v25.current[v35.notificationId] then
                v34(v35.notificationId, v6.PartyNudgeGeneralDismiss);
                if v25.current[v35.notificationId].shouldActWhenDismiss then
                    local v36 = v25.current[v35.notificationId];
                    local l_nudgeType_0 = v36.nudgeType;
                    local l_toastType_0 = v36.toastType;
                    if (l_nudgeType_0 == v3.PARTY_TO_ONE_NUDGE_TYPE or l_nudgeType_0 == v3.PARTY_TO_PARTY_NUDGE_TYPE) and l_toastType_0 == l_NotificationTypeEnum_0.SquadNudgeInvite then
                        local l_REJECT_PARTY_INVITE_ACTION_0 = v3.REJECT_PARTY_INVITE_ACTION;
                        v21(v8(l_REJECT_PARTY_INVITE_ACTION_0, v36.nudgeId, false, v22.setSquadPrompt, v22.fireSquadAnalytics, v22.squadLocation, v23));
                    end;
                end;
            end;
            v25.current[v35.notificationId] = nil;
        end);
        return function() --[[ Line: 123 ]]
            -- upvalues: v40 (copy)
            if v40 then
                v40:Disconnect();
            end;
        end;
    end, l_dependencyArray_0(v34, v23, v22.setSquadPrompt, v22.fireSquadAnalytics, v22.squadLocation));
    v11.useEffect(function() --[[ Line: 139 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v25 (copy), v27 (copy), l_HttpService_0 (ref), v3 (ref), l_default_0 (ref), v34 (copy), v6 (ref), l_GameParams_0 (ref), l_ExperienceService_0 (ref), v5 (ref)
        local v44 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v41) --[[ Line: 143 ]]
            -- upvalues: v25 (ref), v27 (ref), l_HttpService_0 (ref), v3 (ref)
            if v41 and v41.userActionType == "click" and v41.notificationData and v41.visualItem and v41.visualItem.actionEventParams and v41.visualItem.visualItemName then
                local l_id_0 = v41.notificationData.id;
                if v25.current[l_id_0] then
                    v25.current[l_id_0].shouldActWhenDismiss = false;
                end;
                if v27(l_id_0) then
                    return;
                else
                    local v43 = l_HttpService_0:JSONDecode(v41.visualItem.actionEventParams);
                    if v43.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v43.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE then

                    end;
                end;
            end;
        end);
        local v49 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.NudgeForInviterSquad, function(v45) --[[ Line: 176 ]]
            -- upvalues: v25 (ref), v27 (ref), l_HttpService_0 (ref), v3 (ref), l_default_0 (ref), v34 (ref), v6 (ref), l_GameParams_0 (ref), l_ExperienceService_0 (ref), v5 (ref)
            if v45 and v45.userActionType == "click" and v45.notificationData and v45.visualItem and v45.visualItem.actionEventParams and v45.visualItem.visualItemName then
                local l_id_1 = v45.notificationData.id;
                if v25.current[l_id_1] then
                    v25.current[l_id_1].shouldActWhenDismiss = false;
                end;
                if v27(l_id_1) then
                    return;
                else
                    local v47 = l_HttpService_0:JSONDecode(v45.visualItem.actionEventParams);
                    if v47.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v47.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE then
                        if v45.visualItem.visualItemName == v3.JOIN_EXPERIENCE_FROM_NUDGE_BUTTON_TYPE then
                            l_default_0:dismissNotification(l_id_1);
                            v34(l_id_1, v6.PartyNudgeAccept);
                            local v48 = l_GameParams_0.fromPlaceId(v47.placeId);
                            l_ExperienceService_0:LaunchExperience(v48, v5.NudgeForInviterSquad, nil);
                            return;
                        elseif v45.visualItem.visualItemName == v3.DISMISS_INVITER_SQUAD_NUDGE_BUTTON_TYPE then
                            v34(l_id_1, v6.PartyNudgeButtonDismiss);
                        end;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 224 ]]
            -- upvalues: v44 (copy), v49 (copy)
            if v44 then
                v44();
            end;
            if v49 then
                v49();
            end;
        end;
    end, l_dependencyArray_0(v27, v34, v22, v22.setSquadPrompt, v22.fireSquadAnalytics, v22.squadLocation, v20.currentSquadId));
    v11.useEffect(function() --[[ Line: 245 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v27 (copy), l_HttpService_0 (ref), v3 (ref), v20 (copy), l_default_0 (ref), v31 (copy), v34 (copy), v6 (ref)
        local v54 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v50) --[[ Line: 249 ]]
            -- upvalues: v27 (ref), l_HttpService_0 (ref), v3 (ref), v20 (ref), l_default_0 (ref), v31 (ref), v34 (ref), v6 (ref)
            local l_actionEventParams_0 = v50.state.visualItems.button[1].actionEventParams;
            local l_id_2 = v50.id;
            if v27(l_id_2) then
                return;
            else
                local v53 = l_HttpService_0:JSONDecode(l_actionEventParams_0);
                if (v53.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v53.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE) and v20.currentSquadId ~= "" and v20.currentSquadId == v53.squadId then
                    l_default_0:dismissNotification(l_id_2);
                    return;
                else
                    v31(l_id_2, v50, v53);
                    v34(l_id_2, v6.PartyNudgeDisplay);
                    return;
                end;
            end;
        end);
        local v59 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.NudgeForInviterSquad, function(v55) --[[ Line: 278 ]]
            -- upvalues: v27 (ref), l_HttpService_0 (ref), v3 (ref), l_default_0 (ref), v20 (ref), v31 (ref), v34 (ref), v6 (ref)
            local l_actionEventParams_1 = v55.state.visualItems.button[1].actionEventParams;
            local l_id_3 = v55.id;
            if v27(l_id_3) then
                return;
            else
                local v58 = l_HttpService_0:JSONDecode(l_actionEventParams_1);
                if v58.nudgeType == v3.PARTY_TO_ONE_NUDGE_TYPE or v58.nudgeType == v3.PARTY_TO_PARTY_NUDGE_TYPE then
                    if v58.gameInstanceId == game.JobId then
                        l_default_0:dismissNotification(l_id_3);
                        return;
                    elseif v20.currentSquadId == "" or v20.currentSquadId ~= v58.squadId then
                        l_default_0:dismissNotification(l_id_3);
                        return;
                    end;
                end;
                v31(l_id_3, v55, v58);
                v34(l_id_3, v6.PartyNudgeDisplay);
                return;
            end;
        end);
        local v64 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadJoinRequestPrompt, function(v60) --[[ Line: 310 ]]
            -- upvalues: v27 (ref), l_HttpService_0 (ref), v31 (ref), v34 (ref), v6 (ref)
            local l_actionEventParams_2 = v60.state.visualItems.button[1].actionEventParams;
            local l_id_4 = v60.id;
            if v27(l_id_4) then
                return;
            else
                local v63 = l_HttpService_0:JSONDecode(l_actionEventParams_2);
                v31(l_id_4, v60, v63);
                v34(l_id_4, v6.PartyNudgeDisplay);
                return;
            end;
        end);
        local v69 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadAcceptJoinRequest, function(v65) --[[ Line: 327 ]]
            -- upvalues: v27 (ref), l_HttpService_0 (ref), v31 (ref), v34 (ref), v6 (ref)
            local l_actionEventParams_3 = v65.state.visualItems.button[1].actionEventParams;
            local l_id_5 = v65.id;
            if v27(l_id_5) then
                return;
            else
                local v68 = l_HttpService_0:JSONDecode(l_actionEventParams_3);
                v31(l_id_5, v65, v68);
                v34(l_id_5, v6.PartyNudgeDisplay);
                return;
            end;
        end);
        return function() --[[ Line: 341 ]]
            -- upvalues: v54 (copy), v59 (copy), v64 (copy), v69 (copy)
            if v54 then
                v54();
            end;
            if v59 then
                v59();
            end;
            if v64 then
                v64();
            end;
            if v69 then
                v69();
            end;
        end;
    end, l_dependencyArray_0(v27, v31, v34, v20.currentSquadId));
    return nil;
end;