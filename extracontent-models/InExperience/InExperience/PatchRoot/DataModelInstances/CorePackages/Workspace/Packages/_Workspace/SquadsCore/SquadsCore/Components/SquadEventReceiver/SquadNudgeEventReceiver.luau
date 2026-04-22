local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v7 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v8 = require(l_script_FirstAncestor_0.Thunks.actOnPartyNudge);
local v9 = require(l_script_FirstAncestor_0.Thunks.createConversation);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.ToastNotification);
local v13 = require(l_Parent_0.ToastNotificationsProtocol);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v15 = require(l_Parent_0.RealtimeDelivery);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v18 = require(l_Parent_0.UserProfiles);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v20 = require(l_Parent_0.SharedFlags);
local l_LifecycleEvents_0 = v12.LifecycleEvents;
local l_NotificationTypeEnum_0 = v12.ToastNotificationTypeModule.NotificationTypeEnum;
local l_ShowNotificationSnoozeMenuSignal_0 = v12.Signals.ShowNotificationSnoozeMenuSignal;
local l_NotificationGroups_0 = v12.NotificationGroups;
local l_default_0 = v13.ToastNotificationProtocol.default;
local l_UserProfileStore_0 = v18.Stores.UserProfileStore;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v20.FFlagRemoveDependencyArrayAntipattern;
return function(v28) --[[ Line: 42 ]]
    -- upvalues: l_useDispatch_0 (copy), v11 (copy), v7 (copy), l_useLocalUserId_0 (copy), l_useLocalization_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_UserProfileStore_0 (copy), l_GuiService_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v15 (copy), v4 (copy), v5 (copy), l_default_0 (copy), v6 (copy), l_NotificationTypeEnum_0 (copy), v8 (copy), l_LifecycleEvents_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), l_NotificationGroups_0 (copy), l_HttpService_0 (copy), v9 (copy)
    local v29 = l_useDispatch_0();
    local v30 = v11.useContext(v7);
    local v31 = tonumber(l_useLocalUserId_0()) or 0;
    local v32 = v30.useIsChatEnabled();
    local v33 = v30.useIsLoadingChatSettings();
    local v34 = l_useLocalization_0({
        YouJoinedFriendParty = "Feature.Squads.Label.YouJoinedFriendParty", 
        FriendJoinedYourParty = "Feature.Squads.Label.FriendJoinedYourParty", 
        snoozeTitle = "Feature.Chat.Label.SnoozePartyNotifications", 
        snoozeDescription = "Feature.Chat.Description.SnoozeDescription"
    });
    local v35 = v11.useRef({});
    local v42 = v11.useCallback(function(v36, v37) --[[ Line: 60 ]]
        -- upvalues: v31 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), l_UserProfileStore_0 (ref), l_GuiService_0 (ref), v34 (copy)
        if v36 == 0 or v37 == 0 then
            return;
        else
            local v38 = nil;
            if v36 == v31 then
                v38 = v37;
            elseif v37 == v31 then
                v38 = v36;
            end;
            if v38 then
                local v39 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v38)));
                l_UserProfileStore_0.get().fetchNamesByUserIds({
                    (tostring(v38))
                }, function(v40) --[[ Line: 74 ]]
                    -- upvalues: v36 (copy), v31 (ref), l_GuiService_0 (ref), v34 (ref), v39 (copy)
                    if #v40.data > 0 and v40.data[1] and v40.data[1].names then
                        local v41 = v40.data[1].names.getCombinedName(false);
                        if v36 == v31 then
                            l_GuiService_0:SendNotification({
                                Title = v34.FriendJoinedYourParty:gsub("{(.-)}", {
                                    combinedName = v41
                                }), 
                                Icon = v39
                            });
                            return;
                        else
                            l_GuiService_0:SendNotification({
                                Title = v34.YouJoinedFriendParty:gsub("{(.-)}", {
                                    combinedName = v41
                                }), 
                                Icon = v39
                            });
                        end;
                    end;
                end);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v31, 
        v34.FriendJoinedYourParty, 
        v34.YouJoinedFriendParty
    } else l_dependencyArray_0(v31, v34.FriendJoinedYourParty, v34.YouJoinedFriendParty));
    v15.useRealtimeNamespace(v4.PARTY_NUDGE_RTN_NAMESPACE, function(v43) --[[ Line: 100 ]]
        -- upvalues: v4 (ref), v31 (copy), v28 (copy), v42 (copy)
        if v43.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v43.status == v4.PARTY_INVITE_ACCEPTED_STATUS and v43.inviterId == v31 and v28.currentSquadId ~= "" and v43.groupUpId == v28.currentSquadId then
            v42(v43.inviterId, v43.inviteeId);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v31, 
        v28.currentSquadId, 
        v42
    } else l_dependencyArray_0(v31, v28.currentSquadId, v42));
    local v46 = v11.useCallback(function(v44, v45) --[[ Line: 118 ]]
        -- upvalues: v30 (copy), v5 (ref), v35 (copy)
        v30.fireSquadAnalytics(v5.SquadToastActions, {
            toastAction = v45, 
            toastType = if v35.current[v44] then v35.current[v44].toastType else nil, 
            nudgeId = if v35.current[v44] then v35.current[v44].nudgeId else nil, 
            nudgeType = if v35.current[v44] then v35.current[v44].nudgeType else nil, 
            partyAttemptId = if v35.current[v44] then v35.current[v44].partyAttemptId else nil, 
            squadLocation = v30.squadLocation
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v30.fireSquadAnalytics, 
        v30.squadLocation
    } else l_dependencyArray_0(v30.fireSquadAnalytics, v30.squadLocation));
    v11.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: l_default_0 (ref), v35 (copy), v46 (copy), v6 (ref), v4 (ref), l_NotificationTypeEnum_0 (ref), v29 (copy), v8 (ref), v30 (copy), v32 (copy)
        local v52 = l_default_0:listenToDismissNotification(function(v47) --[[ Line: 144 ]]
            -- upvalues: v35 (ref), v46 (ref), v6 (ref), v4 (ref), l_NotificationTypeEnum_0 (ref), v29 (ref), v8 (ref), v30 (ref), v32 (ref)
            if v47.notificationId and v35.current[v47.notificationId] then
                v46(v47.notificationId, v6.PartyNudgeGeneralDismiss);
                if v35.current[v47.notificationId].shouldActWhenDismiss then
                    local v48 = v35.current[v47.notificationId];
                    local l_nudgeType_0 = v48.nudgeType;
                    local l_toastType_0 = v48.toastType;
                    if l_nudgeType_0 == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                        local v51 = nil;
                        if l_toastType_0 == l_NotificationTypeEnum_0.SquadNudgeInvite then
                            v51 = v4.REJECT_PARTY_INVITE_ACTION;
                        elseif l_toastType_0 == l_NotificationTypeEnum_0.SquadStartPartyPrompt then
                            v51 = v4.REJECT_START_PARTY_REQUEST_ACTION;
                        end;
                        if v51 then
                            v29(v8(v51, v48.nudgeId, false, v30.setSquadPrompt, v30.fireSquadAnalytics, v30.squadLocation, v32));
                        end;
                    end;
                end;
            end;
            v35.current[v47.notificationId] = nil;
        end);
        return function() --[[ Line: 182 ]]
            -- upvalues: v52 (copy)
            if v52 then
                v52:Disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v46, 
        v32, 
        v30.setSquadPrompt, 
        v30.fireSquadAnalytics, 
        v30.squadLocation
    } else l_dependencyArray_0(v46, v32, v30.setSquadPrompt, v30.fireSquadAnalytics, v30.squadLocation));
    v11.useEffect(function() --[[ Line: 206 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v34 (copy), l_NotificationGroups_0 (ref), v4 (ref), v35 (copy), v33 (copy), v32 (copy), l_default_0 (ref), l_HttpService_0 (ref), v46 (copy), v6 (ref), v29 (copy), v9 (ref), v30 (copy), v8 (ref), v28 (copy), v42 (copy)
        local v62 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadStartPartyPrompt, function(v53) --[[ Line: 210 ]]
            -- upvalues: l_ShowNotificationSnoozeMenuSignal_0 (ref), v34 (ref), l_NotificationGroups_0 (ref), v4 (ref), v35 (ref), v33 (ref), v32 (ref), l_default_0 (ref), l_HttpService_0 (ref), v46 (ref), v6 (ref), v29 (ref), v9 (ref), v30 (ref), v8 (ref), v28 (ref)
            if v53 and v53.userActionType == "click" and v53.notificationData and v53.visualItem and v53.visualItem.visualItemName == "SnoozeSingleMetaAction" then
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "Toast", 
                    description = v34.snoozeDescription, 
                    notificationType = l_NotificationGroups_0.SquadStartPartyPromptGroup, 
                    title = v34.snoozeTitle
                });
            end;
            if v53 and v53.userActionType == "click" and v53.notificationData and v53.visualItem and v53.visualItem.actionEventParams and v53.visualItem.visualItemName and (v53.visualItem.visualItemName == v4.START_PARTY_FROM_PROMPT_BUTTON_TYPE or v53.visualItem.visualItemName == v4.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE) then
                local l_id_0 = v53.notificationData.id;
                if v35.current[l_id_0] then
                    v35.current[l_id_0].shouldActWhenDismiss = false;
                end;
                if not v33 and not v32 then
                    l_default_0:dismissNotification(l_id_0);
                    return;
                else
                    local v55 = l_HttpService_0:JSONDecode(v53.visualItem.actionEventParams);
                    if v55.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and game.JobId ~= "" and v55.gameInstanceId == game.JobId then
                        if v53.visualItem.visualItemName == v4.START_PARTY_FROM_PROMPT_BUTTON_TYPE then
                            l_default_0:dismissNotification(l_id_0);
                            v46(l_id_0, v6.PartyNudgeAccept);
                            v29(v9({
                                conversationType = "one_to_one", 
                                userIds = {
                                    (tostring(v55.inviteeUserId))
                                }, 
                                source = v4.START_PARTY_FROM_PROMPT_BUTTON_TYPE, 
                                squadContext = v30, 
                                onSuccessCallback = function(v56) --[[ Line: 260 ]] --[[ Name: onSuccessCallback ]]
                                    -- upvalues: v29 (ref), v8 (ref), v4 (ref), v55 (copy), v28 (ref), v30 (ref), v32 (ref), v35 (ref), l_id_0 (copy)
                                    local l_v29_0 = v29;
                                    local l_v8_0 = v8;
                                    local l_ACCEPT_START_PARTY_REQUEST_ACTION_0 = v4.ACCEPT_START_PARTY_REQUEST_ACTION;
                                    local l_nudgeId_0 = v55.nudgeId;
                                    local v61 = false;
                                    if v28.currentParentChannelId ~= "" then
                                        v61 = v28.currentParentChannelId ~= v56;
                                    end;
                                    l_v29_0(l_v8_0(l_ACCEPT_START_PARTY_REQUEST_ACTION_0, l_nudgeId_0, v61, v30.setSquadPrompt, v30.fireSquadAnalytics, v30.squadLocation, v32, if v35.current[l_id_0] then v35.current[l_id_0].partyAttemptId else nil, v56));
                                end, 
                                onErrorCallback = function() --[[ Line: 278 ]] --[[ Name: onErrorCallback ]]
                                    -- upvalues: v29 (ref), v8 (ref), v4 (ref), v55 (copy), v30 (ref), v32 (ref)
                                    v29(v8(v4.REJECT_START_PARTY_REQUEST_ACTION, v55.nudgeId, false, v30.setSquadPrompt, v30.fireSquadAnalytics, v30.squadLocation, v32));
                                end
                            }));
                            return;
                        elseif v53.visualItem.visualItemName == v4.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE then
                            v46(l_id_0, v6.PartyNudgeButtonDismiss);
                            v29(v8(v4.REJECT_START_PARTY_REQUEST_ACTION, v55.nudgeId, false, v30.setSquadPrompt, v30.fireSquadAnalytics, v30.squadLocation, v32));
                        end;
                    end;
                end;
            end;
        end);
        local v70 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v63) --[[ Line: 320 ]]
            -- upvalues: l_ShowNotificationSnoozeMenuSignal_0 (ref), v34 (ref), l_NotificationGroups_0 (ref), v4 (ref), v35 (ref), v33 (ref), v32 (ref), l_default_0 (ref), l_HttpService_0 (ref), v46 (ref), v6 (ref), v28 (ref), v29 (ref), v8 (ref), v30 (ref), v42 (ref)
            if v63 and v63.userActionType == "click" and v63.notificationData and v63.visualItem and v63.visualItem.visualItemName == "SnoozeSingleMetaAction" then
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "Toast", 
                    description = v34.snoozeDescription, 
                    notificationType = l_NotificationGroups_0.SquadNudgeInviteGroup, 
                    title = v34.snoozeTitle
                });
            end;
            if v63 and v63.userActionType == "click" and v63.notificationData and v63.visualItem and v63.visualItem.actionEventParams and v63.visualItem.visualItemName and (v63.visualItem.visualItemName == v4.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE or v63.visualItem.visualItemName == v4.DISMISS_SQUAD_NUDGE_BUTTON_TYPE) then
                local l_id_1 = v63.notificationData.id;
                if v35.current[l_id_1] then
                    v35.current[l_id_1].shouldActWhenDismiss = false;
                end;
                if not v33 and not v32 then
                    l_default_0:dismissNotification(l_id_1);
                    return;
                else
                    local v65 = l_HttpService_0:JSONDecode(v63.visualItem.actionEventParams);
                    if v65.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                        local v66 = nil;
                        local v67 = false;
                        if v63.visualItem.visualItemName == v4.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE then
                            v66 = v4.ACCEPT_PARTY_INVITE_ACTION;
                            l_default_0:dismissNotification(l_id_1);
                            v46(l_id_1, v6.PartyNudgeAccept);
                            local v68 = false;
                            if v28.currentSquadId ~= "" then
                                v68 = v65.squadId ~= v28.currentSquadId;
                            end;
                            v67 = v68;
                        elseif v63.visualItem.visualItemName == v4.DISMISS_SQUAD_NUDGE_BUTTON_TYPE then
                            v66 = v4.REJECT_PARTY_INVITE_ACTION;
                            v46(l_id_1, v6.PartyNudgeButtonDismiss);
                        end;
                        do
                            local l_v66_0 = v66;
                            if l_v66_0 then
                                v29(v8(l_v66_0, v65.nudgeId, v67, v30.setSquadPrompt, v30.fireSquadAnalytics, v30.squadLocation, v32, if v35.current[l_id_1] then v35.current[l_id_1].partyAttemptId else nil)):andThen(function() --[[ Line: 388 ]]
                                    -- upvalues: l_v66_0 (ref), v4 (ref), v42 (ref), v65 (copy)
                                    if l_v66_0 == v4.ACCEPT_PARTY_INVITE_ACTION then
                                        v42(tonumber(v65.inviterUserId) or 0, tonumber(v65.inviteeUserId) or 0);
                                    end;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 402 ]]
            -- upvalues: v62 (copy), v70 (copy)
            if v62 then
                v62();
            end;
            if v70 then
                v70();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v46, 
        v32, 
        v30, 
        v33, 
        v30.setSquadPrompt, 
        v30.fireSquadAnalytics, 
        v30.squadLocation, 
        v28.currentSquadId, 
        v28.currentParentChannelId, 
        v42, 
        v34.snoozeTitle, 
        v34.snoozeDescription
    } else l_dependencyArray_0(v46, v32, v30, v33, v30.setSquadPrompt, v30.fireSquadAnalytics, v30.squadLocation, v28.currentSquadId, v28.currentParentChannelId, v42, v34.snoozeTitle, v34.snoozeDescription));
    v11.useEffect(function() --[[ Line: 444 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v33 (copy), v32 (copy), l_default_0 (ref), l_HttpService_0 (ref), v4 (ref), v28 (copy), v35 (copy), v46 (copy), v6 (ref)
        local v78 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadStartPartyPrompt, function(v71) --[[ Line: 448 ]]
            -- upvalues: v33 (ref), v32 (ref), l_default_0 (ref), l_HttpService_0 (ref), v4 (ref), v28 (ref), v35 (ref), v46 (ref), v6 (ref)
            local l_actionEventParams_0 = v71.state.visualItems.button[1].actionEventParams;
            local l_id_2 = v71.id;
            if not v33 and not v32 then
                l_default_0:dismissNotification(l_id_2);
                return;
            else
                local v74 = false;
                local v75 = true;
                local v76 = true;
                local v77 = l_HttpService_0:JSONDecode(l_actionEventParams_0);
                if v77.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                    if v28.currentSquadId ~= "" then
                        v74 = true;
                    elseif game.JobId == "" or v77.gameInstanceId ~= game.JobId then
                        v74 = true;
                        v75 = false;
                        v76 = false;
                    end;
                end;
                if v75 then
                    v35.current[l_id_2] = {
                        toastType = v71.notificationType, 
                        partyAttemptId = l_HttpService_0:GenerateGUID(false), 
                        shouldActWhenDismiss = v76, 
                        nudgeId = v77.nudgeId, 
                        nudgeType = v77.nudgeType
                    };
                    v46(l_id_2, v6.PartyNudgeDisplay);
                end;
                if v74 then
                    l_default_0:dismissNotification(l_id_2);
                end;
                return;
            end;
        end);
        local v83 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v79) --[[ Line: 497 ]]
            -- upvalues: v33 (ref), v32 (ref), l_default_0 (ref), l_HttpService_0 (ref), v4 (ref), v28 (ref), v35 (ref), v46 (ref), v6 (ref)
            local l_actionEventParams_1 = v79.state.visualItems.button[1].actionEventParams;
            local l_id_3 = v79.id;
            if not v33 and not v32 then
                l_default_0:dismissNotification(l_id_3);
                return;
            else
                local v82 = l_HttpService_0:JSONDecode(l_actionEventParams_1);
                if v82.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v28.currentSquadId ~= "" and v28.currentSquadId == v82.squadId then
                    l_default_0:dismissNotification(l_id_3);
                    return;
                else
                    v35.current[l_id_3] = {
                        toastType = v79.notificationType, 
                        partyAttemptId = l_HttpService_0:GenerateGUID(false), 
                        shouldActWhenDismiss = true, 
                        nudgeId = v82.nudgeId, 
                        nudgeType = v82.nudgeType
                    };
                    v46(l_id_3, v6.PartyNudgeDisplay);
                    return;
                end;
            end;
        end);
        return function() --[[ Line: 525 ]]
            -- upvalues: v78 (copy), v83 (copy)
            if v78 then
                v78();
            end;
            if v83 then
                v83();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32, 
        v46, 
        v33, 
        v28.currentSquadId
    } else l_dependencyArray_0(v32, v46, v33, v28.currentSquadId));
    v11.useEffect(function() --[[ Line: 540 ]]
        -- upvalues: v28 (copy), v35 (copy), v4 (ref), l_NotificationTypeEnum_0 (ref), l_default_0 (ref)
        if v28.currentSquadId ~= "" then
            for v84, v85 in v35.current do
                if v85 and v85.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v85.toastType == l_NotificationTypeEnum_0.SquadStartPartyPrompt then
                    l_default_0:dismissNotification(v84);
                end;
            end;
        end;
    end, {
        v28.currentSquadId
    });
    return nil;
end;