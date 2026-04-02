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
local l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 = v20.FFlagAddSnoozeSupportForSquadNudgeToasts;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v20.FFlagRemoveDependencyArrayAntipattern;
return function(v29) --[[ Line: 44 ]]
    -- upvalues: l_useDispatch_0 (copy), v11 (copy), v7 (copy), l_useLocalUserId_0 (copy), l_useLocalization_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_UserProfileStore_0 (copy), l_GuiService_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v15 (copy), v4 (copy), v5 (copy), l_default_0 (copy), v6 (copy), l_NotificationTypeEnum_0 (copy), v8 (copy), l_LifecycleEvents_0 (copy), l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), l_NotificationGroups_0 (copy), l_HttpService_0 (copy), v9 (copy)
    local v30 = l_useDispatch_0();
    local v31 = v11.useContext(v7);
    local v32 = tonumber(l_useLocalUserId_0()) or 0;
    local v33 = v31.useIsChatEnabled();
    local v34 = v31.useIsLoadingChatSettings();
    local v35 = l_useLocalization_0({
        YouJoinedFriendParty = "Feature.Squads.Label.YouJoinedFriendParty", 
        FriendJoinedYourParty = "Feature.Squads.Label.FriendJoinedYourParty", 
        snoozeTitle = "Feature.Chat.Label.SnoozePartyNotifications", 
        snoozeDescription = "Feature.Chat.Description.SnoozeDescription"
    });
    local v36 = v11.useRef({});
    local v43 = v11.useCallback(function(v37, v38) --[[ Line: 62 ]]
        -- upvalues: v32 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), l_UserProfileStore_0 (ref), l_GuiService_0 (ref), v35 (copy)
        if v37 == 0 or v38 == 0 then
            return;
        else
            local v39 = nil;
            if v37 == v32 then
                v39 = v38;
            elseif v38 == v32 then
                v39 = v37;
            end;
            if v39 then
                local v40 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v39)));
                l_UserProfileStore_0.get().fetchNamesByUserIds({
                    (tostring(v39))
                }, function(v41) --[[ Line: 76 ]]
                    -- upvalues: v37 (copy), v32 (ref), l_GuiService_0 (ref), v35 (ref), v40 (copy)
                    if #v41.data > 0 and v41.data[1] and v41.data[1].names then
                        local v42 = v41.data[1].names.getCombinedName(false);
                        if v37 == v32 then
                            l_GuiService_0:SendNotification({
                                Title = v35.FriendJoinedYourParty:gsub("{(.-)}", {
                                    combinedName = v42
                                }), 
                                Icon = v40
                            });
                            return;
                        else
                            l_GuiService_0:SendNotification({
                                Title = v35.YouJoinedFriendParty:gsub("{(.-)}", {
                                    combinedName = v42
                                }), 
                                Icon = v40
                            });
                        end;
                    end;
                end);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32, 
        v35.FriendJoinedYourParty, 
        v35.YouJoinedFriendParty
    } else l_dependencyArray_0(v32, v35.FriendJoinedYourParty, v35.YouJoinedFriendParty));
    v15.useRealtimeNamespace(v4.PARTY_NUDGE_RTN_NAMESPACE, function(v44) --[[ Line: 102 ]]
        -- upvalues: v4 (ref), v32 (copy), v29 (copy), v43 (copy)
        if v44.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v44.status == v4.PARTY_INVITE_ACCEPTED_STATUS and v44.inviterId == v32 and v29.currentSquadId ~= "" and v44.groupUpId == v29.currentSquadId then
            v43(v44.inviterId, v44.inviteeId);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32, 
        v29.currentSquadId, 
        v43
    } else l_dependencyArray_0(v32, v29.currentSquadId, v43));
    local v47 = v11.useCallback(function(v45, v46) --[[ Line: 120 ]]
        -- upvalues: v31 (copy), v5 (ref), v36 (copy)
        v31.fireSquadAnalytics(v5.SquadToastActions, {
            toastAction = v46, 
            toastType = if v36.current[v45] then v36.current[v45].toastType else nil, 
            nudgeId = if v36.current[v45] then v36.current[v45].nudgeId else nil, 
            nudgeType = if v36.current[v45] then v36.current[v45].nudgeType else nil, 
            partyAttemptId = if v36.current[v45] then v36.current[v45].partyAttemptId else nil, 
            squadLocation = v31.squadLocation
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v31.fireSquadAnalytics, 
        v31.squadLocation
    } else l_dependencyArray_0(v31.fireSquadAnalytics, v31.squadLocation));
    v11.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: l_default_0 (ref), v36 (copy), v47 (copy), v6 (ref), v4 (ref), l_NotificationTypeEnum_0 (ref), v30 (copy), v8 (ref), v31 (copy), v33 (copy)
        local v53 = l_default_0:listenToDismissNotification(function(v48) --[[ Line: 146 ]]
            -- upvalues: v36 (ref), v47 (ref), v6 (ref), v4 (ref), l_NotificationTypeEnum_0 (ref), v30 (ref), v8 (ref), v31 (ref), v33 (ref)
            if v48.notificationId and v36.current[v48.notificationId] then
                v47(v48.notificationId, v6.PartyNudgeGeneralDismiss);
                if v36.current[v48.notificationId].shouldActWhenDismiss then
                    local v49 = v36.current[v48.notificationId];
                    local l_nudgeType_0 = v49.nudgeType;
                    local l_toastType_0 = v49.toastType;
                    if l_nudgeType_0 == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                        local v52 = nil;
                        if l_toastType_0 == l_NotificationTypeEnum_0.SquadNudgeInvite then
                            v52 = v4.REJECT_PARTY_INVITE_ACTION;
                        elseif l_toastType_0 == l_NotificationTypeEnum_0.SquadStartPartyPrompt then
                            v52 = v4.REJECT_START_PARTY_REQUEST_ACTION;
                        end;
                        if v52 then
                            v30(v8(v52, v49.nudgeId, false, v31.setSquadPrompt, v31.fireSquadAnalytics, v31.squadLocation, v33));
                        end;
                    end;
                end;
            end;
            v36.current[v48.notificationId] = nil;
        end);
        return function() --[[ Line: 184 ]]
            -- upvalues: v53 (copy)
            if v53 then
                v53:Disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v47, 
        v33, 
        v31.setSquadPrompt, 
        v31.fireSquadAnalytics, 
        v31.squadLocation
    } else l_dependencyArray_0(v47, v33, v31.setSquadPrompt, v31.fireSquadAnalytics, v31.squadLocation));
    v11.useEffect(function() --[[ Line: 208 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v35 (copy), l_NotificationGroups_0 (ref), v4 (ref), v36 (copy), v34 (copy), v33 (copy), l_default_0 (ref), l_HttpService_0 (ref), v47 (copy), v6 (ref), v30 (copy), v9 (ref), v31 (copy), v8 (ref), v29 (copy), v43 (copy)
        local v63 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadStartPartyPrompt, function(v54) --[[ Line: 212 ]]
            -- upvalues: l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v35 (ref), l_NotificationGroups_0 (ref), v4 (ref), v36 (ref), v34 (ref), v33 (ref), l_default_0 (ref), l_HttpService_0 (ref), v47 (ref), v6 (ref), v30 (ref), v9 (ref), v31 (ref), v8 (ref), v29 (ref)
            if l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 and v54 and v54.userActionType == "click" and v54.notificationData and v54.visualItem and v54.visualItem.visualItemName == "SnoozeSingleMetaAction" then
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "Toast", 
                    description = v35.snoozeDescription, 
                    notificationType = l_NotificationGroups_0.SquadStartPartyPromptGroup, 
                    title = v35.snoozeTitle
                });
            end;
            if v54 and v54.userActionType == "click" and v54.notificationData and v54.visualItem and v54.visualItem.actionEventParams and v54.visualItem.visualItemName and (not l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 or v54.visualItem.visualItemName == v4.START_PARTY_FROM_PROMPT_BUTTON_TYPE or v54.visualItem.visualItemName == v4.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE) then
                local l_id_0 = v54.notificationData.id;
                if v36.current[l_id_0] then
                    v36.current[l_id_0].shouldActWhenDismiss = false;
                end;
                if not v34 and not v33 then
                    l_default_0:dismissNotification(l_id_0);
                    return;
                else
                    local v56 = l_HttpService_0:JSONDecode(v54.visualItem.actionEventParams);
                    if v56.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and game.JobId ~= "" and v56.gameInstanceId == game.JobId then
                        if v54.visualItem.visualItemName == v4.START_PARTY_FROM_PROMPT_BUTTON_TYPE then
                            l_default_0:dismissNotification(l_id_0);
                            v47(l_id_0, v6.PartyNudgeAccept);
                            v30(v9({
                                conversationType = "one_to_one", 
                                userIds = {
                                    (tostring(v56.inviteeUserId))
                                }, 
                                source = v4.START_PARTY_FROM_PROMPT_BUTTON_TYPE, 
                                squadContext = v31, 
                                onSuccessCallback = function(v57) --[[ Line: 265 ]] --[[ Name: onSuccessCallback ]]
                                    -- upvalues: v30 (ref), v8 (ref), v4 (ref), v56 (copy), v29 (ref), v31 (ref), v33 (ref), v36 (ref), l_id_0 (copy)
                                    local l_v30_0 = v30;
                                    local l_v8_0 = v8;
                                    local l_ACCEPT_START_PARTY_REQUEST_ACTION_0 = v4.ACCEPT_START_PARTY_REQUEST_ACTION;
                                    local l_nudgeId_0 = v56.nudgeId;
                                    local v62 = false;
                                    if v29.currentParentChannelId ~= "" then
                                        v62 = v29.currentParentChannelId ~= v57;
                                    end;
                                    l_v30_0(l_v8_0(l_ACCEPT_START_PARTY_REQUEST_ACTION_0, l_nudgeId_0, v62, v31.setSquadPrompt, v31.fireSquadAnalytics, v31.squadLocation, v33, if v36.current[l_id_0] then v36.current[l_id_0].partyAttemptId else nil, v57));
                                end, 
                                onErrorCallback = function() --[[ Line: 283 ]] --[[ Name: onErrorCallback ]]
                                    -- upvalues: v30 (ref), v8 (ref), v4 (ref), v56 (copy), v31 (ref), v33 (ref)
                                    v30(v8(v4.REJECT_START_PARTY_REQUEST_ACTION, v56.nudgeId, false, v31.setSquadPrompt, v31.fireSquadAnalytics, v31.squadLocation, v33));
                                end
                            }));
                            return;
                        elseif v54.visualItem.visualItemName == v4.DISMISS_START_PARTY_PROMPT_BUTTON_TYPE then
                            v47(l_id_0, v6.PartyNudgeButtonDismiss);
                            v30(v8(v4.REJECT_START_PARTY_REQUEST_ACTION, v56.nudgeId, false, v31.setSquadPrompt, v31.fireSquadAnalytics, v31.squadLocation, v33));
                        end;
                    end;
                end;
            end;
        end);
        local v71 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v64) --[[ Line: 325 ]]
            -- upvalues: l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 (ref), l_ShowNotificationSnoozeMenuSignal_0 (ref), v35 (ref), l_NotificationGroups_0 (ref), v4 (ref), v36 (ref), v34 (ref), v33 (ref), l_default_0 (ref), l_HttpService_0 (ref), v47 (ref), v6 (ref), v29 (ref), v30 (ref), v8 (ref), v31 (ref), v43 (ref)
            if l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 and v64 and v64.userActionType == "click" and v64.notificationData and v64.visualItem and v64.visualItem.visualItemName == "SnoozeSingleMetaAction" then
                l_ShowNotificationSnoozeMenuSignal_0:fire({
                    context = "Toast", 
                    description = v35.snoozeDescription, 
                    notificationType = l_NotificationGroups_0.SquadNudgeInviteGroup, 
                    title = v35.snoozeTitle
                });
            end;
            if v64 and v64.userActionType == "click" and v64.notificationData and v64.visualItem and v64.visualItem.actionEventParams and v64.visualItem.visualItemName and (not l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 or v64.visualItem.visualItemName == v4.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE or v64.visualItem.visualItemName == v4.DISMISS_SQUAD_NUDGE_BUTTON_TYPE) then
                local l_id_1 = v64.notificationData.id;
                if v36.current[l_id_1] then
                    v36.current[l_id_1].shouldActWhenDismiss = false;
                end;
                if not v34 and not v33 then
                    l_default_0:dismissNotification(l_id_1);
                    return;
                else
                    local v66 = l_HttpService_0:JSONDecode(v64.visualItem.actionEventParams);
                    if v66.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                        local v67 = nil;
                        local v68 = false;
                        if v64.visualItem.visualItemName == v4.JOIN_SQUAD_FROM_NUDGE_BUTTON_TYPE then
                            v67 = v4.ACCEPT_PARTY_INVITE_ACTION;
                            l_default_0:dismissNotification(l_id_1);
                            v47(l_id_1, v6.PartyNudgeAccept);
                            local v69 = false;
                            if v29.currentSquadId ~= "" then
                                v69 = v66.squadId ~= v29.currentSquadId;
                            end;
                            v68 = v69;
                        elseif v64.visualItem.visualItemName == v4.DISMISS_SQUAD_NUDGE_BUTTON_TYPE then
                            v67 = v4.REJECT_PARTY_INVITE_ACTION;
                            v47(l_id_1, v6.PartyNudgeButtonDismiss);
                        end;
                        do
                            local l_v67_0 = v67;
                            if l_v67_0 then
                                v30(v8(l_v67_0, v66.nudgeId, v68, v31.setSquadPrompt, v31.fireSquadAnalytics, v31.squadLocation, v33, if v36.current[l_id_1] then v36.current[l_id_1].partyAttemptId else nil)):andThen(function() --[[ Line: 396 ]]
                                    -- upvalues: l_v67_0 (ref), v4 (ref), v43 (ref), v66 (copy)
                                    if l_v67_0 == v4.ACCEPT_PARTY_INVITE_ACTION then
                                        v43(tonumber(v66.inviterUserId) or 0, tonumber(v66.inviteeUserId) or 0);
                                    end;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 410 ]]
            -- upvalues: v63 (copy), v71 (copy)
            if v63 then
                v63();
            end;
            if v71 then
                v71();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v47, 
        v33, 
        v31, 
        v34, 
        v31.setSquadPrompt, 
        v31.fireSquadAnalytics, 
        v31.squadLocation, 
        v29.currentSquadId, 
        v29.currentParentChannelId, 
        v43, 
        if l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 then v35.snoozeTitle else nil, 
        if l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 then v35.snoozeDescription else nil
    } else l_dependencyArray_0(v47, v33, v31, v34, v31.setSquadPrompt, v31.fireSquadAnalytics, v31.squadLocation, v29.currentSquadId, v29.currentParentChannelId, v43, if l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 then v35.snoozeTitle else nil, if l_FFlagAddSnoozeSupportForSquadNudgeToasts_0 then v35.snoozeDescription else nil));
    v11.useEffect(function() --[[ Line: 452 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v34 (copy), v33 (copy), l_default_0 (ref), l_HttpService_0 (ref), v4 (ref), v29 (copy), v36 (copy), v47 (copy), v6 (ref)
        local v79 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadStartPartyPrompt, function(v72) --[[ Line: 456 ]]
            -- upvalues: v34 (ref), v33 (ref), l_default_0 (ref), l_HttpService_0 (ref), v4 (ref), v29 (ref), v36 (ref), v47 (ref), v6 (ref)
            local l_actionEventParams_0 = v72.state.visualItems.button[1].actionEventParams;
            local l_id_2 = v72.id;
            if not v34 and not v33 then
                l_default_0:dismissNotification(l_id_2);
                return;
            else
                local v75 = false;
                local v76 = true;
                local v77 = true;
                local v78 = l_HttpService_0:JSONDecode(l_actionEventParams_0);
                if v78.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE then
                    if v29.currentSquadId ~= "" then
                        v75 = true;
                    elseif game.JobId == "" or v78.gameInstanceId ~= game.JobId then
                        v75 = true;
                        v76 = false;
                        v77 = false;
                    end;
                end;
                if v76 then
                    v36.current[l_id_2] = {
                        toastType = v72.notificationType, 
                        partyAttemptId = l_HttpService_0:GenerateGUID(false), 
                        shouldActWhenDismiss = v77, 
                        nudgeId = v78.nudgeId, 
                        nudgeType = v78.nudgeType
                    };
                    v47(l_id_2, v6.PartyNudgeDisplay);
                end;
                if v75 then
                    l_default_0:dismissNotification(l_id_2);
                end;
                return;
            end;
        end);
        local v84 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadNudgeInvite, function(v80) --[[ Line: 505 ]]
            -- upvalues: v34 (ref), v33 (ref), l_default_0 (ref), l_HttpService_0 (ref), v4 (ref), v29 (ref), v36 (ref), v47 (ref), v6 (ref)
            local l_actionEventParams_1 = v80.state.visualItems.button[1].actionEventParams;
            local l_id_3 = v80.id;
            if not v34 and not v33 then
                l_default_0:dismissNotification(l_id_3);
                return;
            else
                local v83 = l_HttpService_0:JSONDecode(l_actionEventParams_1);
                if v83.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v29.currentSquadId ~= "" and v29.currentSquadId == v83.squadId then
                    l_default_0:dismissNotification(l_id_3);
                    return;
                else
                    v36.current[l_id_3] = {
                        toastType = v80.notificationType, 
                        partyAttemptId = l_HttpService_0:GenerateGUID(false), 
                        shouldActWhenDismiss = true, 
                        nudgeId = v83.nudgeId, 
                        nudgeType = v83.nudgeType
                    };
                    v47(l_id_3, v6.PartyNudgeDisplay);
                    return;
                end;
            end;
        end);
        return function() --[[ Line: 533 ]]
            -- upvalues: v79 (copy), v84 (copy)
            if v79 then
                v79();
            end;
            if v84 then
                v84();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33, 
        v47, 
        v34, 
        v29.currentSquadId
    } else l_dependencyArray_0(v33, v47, v34, v29.currentSquadId));
    v11.useEffect(function() --[[ Line: 548 ]]
        -- upvalues: v29 (copy), v36 (copy), v4 (ref), l_NotificationTypeEnum_0 (ref), l_default_0 (ref)
        if v29.currentSquadId ~= "" then
            for v85, v86 in v36.current do
                if v86 and v86.nudgeType == v4.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v86.toastType == l_NotificationTypeEnum_0.SquadStartPartyPrompt then
                    l_default_0:dismissNotification(v85);
                end;
            end;
        end;
    end, {
        v29.currentSquadId
    });
    return nil;
end;