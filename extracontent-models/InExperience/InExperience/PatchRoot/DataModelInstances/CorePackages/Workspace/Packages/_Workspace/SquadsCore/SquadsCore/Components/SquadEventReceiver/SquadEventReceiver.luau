local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local v4 = require(script.Parent.SquadAppChatEventReceiver);
local v5 = require(script.Parent.SquadExperienceInviteEventReceiver);
local v6 = require(script.Parent.SquadLifecycleEventReceiver);
local v7 = require(script.Parent.SquadRccEventReceiver);
local v8 = require(script.Parent.SquadParentChannelEventReceiver);
local v9 = require(script.Parent.ScheduledSquadEventReceiver);
local v10 = require(script.Parent.SquadStorageEventReceiver);
local v11 = require(script.Parent.SquadNudgeEventReceiver);
local v12 = require(script.Parent.SquadMemberStatusEventReceiver);
local v13 = require(script.Parent.SquadNudgeEventReceiver_NudgeV1Exp);
local v14 = require(script.Parent.SquadRegroupPromptEventReceiver);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.RoduxSquads).Actions.CurrentSquadUpdated;
local v16 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v17 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v18 = require(l_script_FirstAncestor_0.Enums.SquadCoplayJoin);
local v19 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v20 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local v21 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v22 = require(l_script_FirstAncestor_0.Enums.SquadToastType);
local v23 = require(l_script_FirstAncestor_0.Thunks.joinSquad);
local v24 = require(l_script_FirstAncestor_0.Thunks.leaveSquad);
local v25 = require(l_script_FirstAncestor_0.Analytics.logInExpCoplayTelemetry);
local v26 = require(l_script_FirstAncestor_0.Hooks.useOnSquadEnded);
local v27 = require(l_script_FirstAncestor_0.Hooks.useCrossExperienceVoiceConnector);
local v28 = require(l_script_FirstAncestor_0.Utils.RegroupPromptNotificationState);
local v29 = require(l_Parent_0.CrossExperienceVoice);
local l_CrossExperienceVoiceManager_0 = v29.CrossExperienceVoiceManager;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v32 = require(l_Parent_0.React);
local v33 = require(l_Parent_0.RoduxSquads);
local v34 = require(l_Parent_0.SharedFlags);
local v35 = require(l_Parent_0.SoundManager);
local v36 = require(l_Parent_0.ToastNotification);
local v37 = require(l_Parent_0.ToastNotificationsProtocol);
local l_useCrossExperienceVoice_0 = v29.Hooks.useCrossExperienceVoice;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useCurrentSquadSelector_0 = v33.Hooks.useCurrentSquadSelector;
local l_Sounds_0 = v35.Sounds;
local l_SoundManager_0 = v35.SoundManager;
local l_GetFFlagEnableCrossExpVoice_0 = v34.GetFFlagEnableCrossExpVoice;
local l_FFlagPartyVoiceBlockSync_0 = v34.FFlagPartyVoiceBlockSync;
local l_FFlagSquadAppChatRTNFix_0 = v34.FFlagSquadAppChatRTNFix;
local l_FFlagEnableSquadCoplayAnalytic_0 = v34.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableSquadCoplayDependencyArray_0 = v34.FFlagEnableSquadCoplayDependencyArray;
local l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 = v34.FIntPartyVoiceJoinRequestPulseCheckTimeout;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v34.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local l_FFlagReadAppChatFetchingVariable_0 = v34.FFlagReadAppChatFetchingVariable;
local l_FFlagEnablePartyNudgeV1_DEV_0 = v34.FFlagEnablePartyNudgeV1_DEV;
local l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 = v34.FFlagAppChatNavigateBackIfOSAUnacknowledged;
local l_FFlagAppChatShowOSAOnPageEntry_0 = v34.FFlagAppChatShowOSAOnPageEntry;
local l_FFlagEnableSquadRegroupExperimentation_0 = v34.FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnableScheduledSquads_0 = v34.FFlagEnableScheduledSquads;
local l_FFlagEnableDialogAfterSquadJoin_0 = v34.FFlagEnableDialogAfterSquadJoin;
local l_default_0 = v37.ToastNotificationProtocol.default;
local l_LifecycleEvents_0 = v36.LifecycleEvents;
local l_NotificationTypeEnum_0 = v36.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_1 = v36.ToastNotificationSnoozeManager.default;
local l_SquadUnifyCoplayExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadUnifyCoplayExperimentation;
local v65 = game:DefineFastFlag("LeaveSquadIfChatDisabled", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v34.FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 84 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v32 (copy), v17 (copy), l_useCurrentSquadSelector_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_useEffectOnce_0 (copy), v25 (copy), v18 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), v16 (copy), v21 (copy), v22 (copy), l_HttpService_0 (copy), l_default_0 (copy), v23 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableDialogAfterSquadJoin_0 (copy), l_default_1 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), l_useSelector_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_useCrossExperienceVoice_0 (copy), v27 (copy), v26 (copy), l_FFlagReadAppChatFetchingVariable_0 (copy), v65 (copy), v24 (copy), l_CurrentSquadUpdated_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v19 (copy), l_ExperienceService_0 (copy), v28 (copy), v6 (copy), v8 (copy), l_SquadUnifyCoplayExperimentation_0 (copy), v12 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), v20 (copy), v4 (copy), v5 (copy), v7 (copy), v10 (copy), l_FFlagEnablePartyNudgeV1_DEV_0 (copy), v13 (copy), v11 (copy), l_FFlagEnableScheduledSquads_0 (copy), v9 (copy), v14 (copy)
    local v67 = l_useDispatch_0();
    local v68 = tonumber(l_useLocalUserId_0()) or 0;
    local v69 = v32.useContext(v17);
    local v70 = v69.useSquadRootView();
    local v71 = v69.useIsChatEnabled();
    local v72 = v69.useIsLoadingChatSettings();
    local v73 = l_useCurrentSquadSelector_0();
    local v74 = if v73 and v73.squadId then v73.squadId else "";
    local v75 = if v73 and v73.parentChannelId then v73.parentChannelId else "";
    if l_FFlagEnableSquadCoplayAnalytic_0 then
        l_useEffectOnce_0(function() --[[ Line: 101 ]]
            -- upvalues: v73 (copy), v25 (ref), v74 (copy), v69 (copy), v18 (ref)
            if v73 then
                v25(v74, v73.members, v69.squadLocation, v18.ExperienceJoin, v69.fireSquadAnalytics);
            end;
        end, {});
    end;
    v32.useEffect(function() --[[ Line: 122 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v69 (copy), v16 (ref), v75 (copy), v21 (ref), v22 (ref), l_HttpService_0 (ref), l_default_0 (ref), v67 (copy), v23 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v71 (copy)
        local v78 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitation, function(v76) --[[ Line: 126 ]]
            -- upvalues: v69 (ref), v16 (ref), v75 (ref), v21 (ref), v22 (ref), l_HttpService_0 (ref), l_default_0 (ref), v67 (ref), v23 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v71 (ref)
            if v76 and v76.userActionType == "click" and v76.notificationData and v76.visualItem and v76.visualItem.eventName == "JoinSquad" and v76.visualItem.actionEventParams then
                v69.fireSquadAnalytics(v16.SquadToastActions, {
                    parentChannelId = v75, 
                    toastAction = v21.SquadInviteAccept, 
                    toastType = v22.SquadInvite
                });
                local v77 = l_HttpService_0:JSONDecode(v76.visualItem.actionEventParams);
                l_default_0:dismissNotification(v76.notificationData.id);
                v67(v23(v77.squadId, v69.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v69.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v69.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v71));
            end;
        end);
        return function() --[[ Line: 156 ]]
            -- upvalues: v78 (copy)
            v78();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v75 else nil, 
        v67, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v23 else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v69.fireSquadAnalytics else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v69.setSquadPrompt else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v69.squadLocation else nil, 
        if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v71 else nil
    } else l_dependencyArray_0(if l_FFlagEnableSquadCoplayDependencyArray_0 then v75 else nil, v67, if l_FFlagEnableSquadCoplayDependencyArray_0 then v23 else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v69.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v69.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v69.squadLocation else nil, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v71 else nil));
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v32.useEffect(function() --[[ Line: 184 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v69 (copy), l_default_0 (ref), v16 (ref), v75 (copy), v21 (ref), v22 (ref), v67 (copy), v23 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v71 (copy)
            local v81 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitationV2, function(v79) --[[ Line: 188 ]]
                -- upvalues: l_HttpService_0 (ref), v69 (ref), l_default_0 (ref), v16 (ref), v75 (ref), v21 (ref), v22 (ref), v67 (ref), v23 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v71 (ref)
                if v79 and v79.userActionType == "click" and v79.notificationData and v79.visualItem and v79.visualItem.actionEventParams then
                    local v80 = l_HttpService_0:JSONDecode(v79.visualItem.actionEventParams);
                    if v79.visualItem.visualItemName == "view" and v69.showGroupOSADialog then
                        l_default_0:dismissNotification(v79.notificationData.id);
                        v69.fireSquadAnalytics(v16.SquadToastActions, {
                            parentChannelId = v75, 
                            toastAction = v21.SquadInviteViewOsa, 
                            toastType = v22.SquadInviteV2
                        });
                        v69.showGroupOSADialog(v80.chatId, function() --[[ Line: 206 ]]
                            -- upvalues: v67 (ref), v23 (ref), v80 (copy), v69 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v71 (ref)
                            v67(v23(v80.squadId, v69.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v69.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v69.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v71));
                        end, function() --[[ Line: 222 ]]

                        end);
                        return;
                    elseif v79.visualItem.visualItemName == "join" then
                        l_default_0:dismissNotification(v79.notificationData.id);
                        v69.fireSquadAnalytics(v16.SquadToastActions, {
                            parentChannelId = v75, 
                            toastAction = v21.SquadInviteAccept, 
                            toastType = v22.SquadInviteV2
                        });
                        v67(v23(v80.squadId, v69.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v69.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v69.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v71));
                    end;
                end;
            end);
            return function() --[[ Line: 251 ]]
                -- upvalues: v81 (copy)
                v81();
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v75, 
            v67, 
            v23, 
            v69.fireSquadAnalytics, 
            v69.setSquadPrompt, 
            v69.showGroupOSADialog, 
            v69.squadLocation, 
            if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v71 else nil
        } else l_dependencyArray_0(v75, v67, v23, v69.fireSquadAnalytics, v69.setSquadPrompt, v69.showGroupOSADialog, v69.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v71 else nil));
    end;
    v32.useEffect(function() --[[ Line: 280 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v71 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
        local v83 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitation, function(v82) --[[ Line: 284 ]]
            -- upvalues: v71 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v71 and not l_default_1:isSnoozedNotificationType(v82.notificationType) then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end);
        return function() --[[ Line: 294 ]]
            -- upvalues: v83 (copy)
            if v83 then
                v83();
            end;
        end;
    end, {
        v71
    });
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v32.useEffect(function() --[[ Line: 303 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v71 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            local v85 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitationV2, function(v84) --[[ Line: 307 ]]
                -- upvalues: v71 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
                if v71 and not l_default_1:isSnoozedNotificationType(v84.notificationType) then
                    l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
                end;
            end);
            return function() --[[ Line: 317 ]]
                -- upvalues: v85 (copy)
                if v85 then
                    v85();
                end;
            end;
        end, {
            v71
        });
    end;
    v32.useEffect(function() --[[ Line: 326 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v71 (copy), v68 (copy), l_HttpService_0 (ref), v74 (copy)
        local v88 = l_default_0:listenToDisplayNotification(function(v86) --[[ Line: 328 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v71 (ref), l_default_0 (ref), v68 (ref), l_HttpService_0 (ref), v74 (ref)
            if not v86 then
                return;
            elseif (v86.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v86.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v86.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation or v86.notificationType == l_NotificationTypeEnum_0.SquadJoinRequestPrompt or v86.notificationType == l_NotificationTypeEnum_0.SquadAcceptJoinRequest) and not v71 then
                l_default_0:dismissNotification(v86.notificationId);
                return;
            elseif v68 <= 0 then
                if v86.notificationId and (v86.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v86.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v86.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation) then
                    l_default_0:dismissNotification(v86.notificationId);
                end;
                return;
            else
                if v86.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v86.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 then
                    local v87 = l_HttpService_0:JSONDecode(v86.lifecycleData);
                    if v74 == v87.squadId then
                        l_default_0:dismissNotification(v86.notificationId);
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 381 ]]
            -- upvalues: v88 (copy)
            v88:Disconnect();
        end;
    end, {
        v74, 
        v68, 
        v71
    });
    v32.useEffect(function() --[[ Line: 388 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v69 (copy), v16 (ref), v75 (copy), v21 (ref), v22 (ref), l_default_0 (ref)
        local v90 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadJoinRequestPrompt, function(v89) --[[ Line: 392 ]]
            -- upvalues: v69 (ref), v16 (ref), v75 (ref), v21 (ref), v22 (ref), l_default_0 (ref)
            if v89 and v89.userActionType == "click" and v89.notificationData and v89.visualItem and v89.visualItem.eventName == "RequestToJoinParty" and v89.visualItem.actionEventParams then
                v69.fireSquadAnalytics(v16.SquadToastActions, {
                    parentChannelId = v75, 
                    toastAction = v21.RequestToJoinPartyAccept, 
                    toastType = v22.RequestToJoinParty
                });
                l_default_0:dismissNotification(v89.notificationData.id);
            end;
        end);
        return function() --[[ Line: 416 ]]
            -- upvalues: v90 (copy)
            v90();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v75, 
        v69.fireSquadAnalytics
    } else l_dependencyArray_0(v75, v69.fireSquadAnalytics));
    v32.useEffect(function() --[[ Line: 427 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v69 (copy), v16 (ref), v75 (copy), v21 (ref), v22 (ref), l_default_0 (ref)
        local v92 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadAcceptJoinRequest, function(v91) --[[ Line: 431 ]]
            -- upvalues: v69 (ref), v16 (ref), v75 (ref), v21 (ref), v22 (ref), l_default_0 (ref)
            if v91 and v91.userActionType == "click" and v91.notificationData and v91.visualItem and v91.visualItem.eventName == "AcceptPartyJoinRequest" and v91.visualItem.actionEventParams then
                v69.fireSquadAnalytics(v16.SquadToastActions, {
                    parentChannelId = v75, 
                    toastAction = v21.AcceptPartyJoinRequestAccept, 
                    toastType = v22.AcceptPartyJoinRequest
                });
                l_default_0:dismissNotification(v91.notificationData.id);
            end;
        end);
        return function() --[[ Line: 455 ]]
            -- upvalues: v92 (copy)
            v92();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v75, 
        v69.fireSquadAnalytics
    } else l_dependencyArray_0(v75, v69.fireSquadAnalytics));
    if l_GetFFlagEnableCrossExpVoice_0() and l_FFlagPartyVoiceBlockSync_0 then
        local v94 = v32.useCallback(function(v93) --[[ Line: 467 ]]
            return v93.Squad.UserBlocking.isBlockedByMe;
        end, {});
        local v95 = l_useSelector_0(v94);
        local v96 = v32.useRef({});
        local l_v95_0 = v95 --[[ copy: 10 -> 13 ]];
        v32.useEffect(function() --[[ Line: 474 ]]
            -- upvalues: v96 (copy), l_v95_0 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v96.current == l_v95_0 then
                return;
            else
                for v98, v99 in pairs(l_v95_0) do
                    local v100 = v96.current[v98] or false;
                    if v99 and not v100 then
                        l_CrossExperienceVoiceManager_0.default:blockVoiceParticipant(v98);
                    elseif not v99 and v100 then
                        l_CrossExperienceVoiceManager_0.default:unblockVoiceParticipant(v98);
                    end;
                end;
                v96.current = l_v95_0;
                return;
            end;
        end, {
            v95
        });
    end;
    if l_GetFFlagEnableCrossExpVoice_0() then
        if l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 > 0 then
            l_useCrossExperienceVoice_0({
                handleRCCConnectionTimeout = true
            });
        else
            l_useCrossExperienceVoice_0();
        end;
        local v101 = v27();
        local l_v101_0 = v101 --[[ copy: 9 -> 12 ]];
        v26(function() --[[ Line: 503 ]]
            -- upvalues: l_v101_0 (copy)
            l_v101_0();
        end);
    end;
    v32.useEffect(function() --[[ Line: 509 ]]
        -- upvalues: l_FFlagReadAppChatFetchingVariable_0 (ref), v72 (copy), v71 (copy), v74 (copy), v65 (ref), v67 (copy), v24 (ref), v69 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), l_CurrentSquadUpdated_0 (ref)
        if (not l_FFlagReadAppChatFetchingVariable_0 or not v72) and not v71 and v74 ~= "" then
            if v65 then
                v67(v24(nil, v69.setSquadPrompt, nil, v69.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v71));
                return;
            else
                v67(l_CurrentSquadUpdated_0(nil));
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71, 
        v74, 
        if l_FFlagReadAppChatFetchingVariable_0 then v72 else nil, 
        if v65 then v69.setSquadPrompt else nil, 
        if v65 then v69.squadLocation else nil
    } else l_dependencyArray_0(v71, v74, if l_FFlagReadAppChatFetchingVariable_0 then v72 else nil, if v65 then v69.setSquadPrompt else nil, if v65 then v69.squadLocation else nil));
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 and not l_FFlagAppChatShowOSAOnPageEntry_0 then
        local v103 = v69.useGetConversationFromId(v75);
        local v104 = v69.shouldShowOSAForConversation(v103);
        v32.useEffect(function() --[[ Line: 555 ]]
            -- upvalues: v104 (copy), v74 (copy), v67 (copy), v24 (ref), v69 (copy)
            if v104 and v74 ~= "" then
                v67(v24(nil, v69.setSquadPrompt, nil, v69.squadLocation, true));
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v104, 
            v74, 
            v69.setSquadPrompt, 
            v69.squadLocation
        } else l_dependencyArray_0(v104, v74, v69.setSquadPrompt, v69.squadLocation));
    end;
    local v105 = l_FFlagEnableSquadRegroupExperimentation_0 and v69.squadLocation == v19.InExperience and v73 and v73.selfPermissions and v73.selfPermissions.canSeeRegroupPromptToast and #v73.members > 1;
    v32.useEffect(function() --[[ Line: 583 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_ExperienceService_0 (ref), v28 (ref)
        if not l_FFlagEnableSquadRegroupExperimentation_0 then
            return function() --[[ Line: 585 ]]

            end;
        else
            local v107 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 588 ]]
                -- upvalues: v28 (ref)
                local v106 = v28.getActiveNotifId();
                v28.dismissNotification(v106);
            end);
            return function() --[[ Line: 593 ]]
                -- upvalues: v107 (copy)
                if v107 and v107.Disconnect then
                    v107:Disconnect();
                end;
            end;
        end;
    end, {});
    v32.useEffect(function() --[[ Line: 600 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), v28 (ref), v74 (copy)
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            local v108 = v28.getActiveNotifId();
            local v109 = v28.getActiveSquadId();
            if v108 ~= nil and v74 ~= v109 then
                v28.dismissNotification(v108);
            end;
        end;
    end, {
        v74
    });
    return v32.createElement(v32.Fragment, nil, {
        SquadLifecycleEventReceiver = v32.createElement(v6, {
            currentSquadId = v74
        }), 
        SquadParentChannelEventReceiver = if v73 then v32.createElement(v8, {
            currentParentChannelId = v73.parentChannelId
        }) else nil, 
        SquadMemberStatusEventReceiver = if (not not l_SquadUnifyCoplayExperimentation_0.getOneOnOnePartyCreationEnabled() or l_SquadUnifyCoplayExperimentation_0.getMultiInvitePartyCreationEnabled()) and v69.squadLocation == v19.InExperience then v32.createElement(v12) else nil, 
        SquadAppChatEventReceiver = if not l_FFlagSquadAppChatRTNFix_0 and v70 ~= v20.None then v32.createElement(v4, {
            conversationId = if v73 then v73.parentChannelId else nil
        }) else nil, 
        SquadExperienceInviteEventReceiver = v32.createElement(v5, {
            currentSquadId = v74
        }), 
        SquadRccEventReceiver = if v69.squadLocation == v19.InExperience then v32.createElement(v7, {
            currentSquadId = v74
        }) else nil, 
        SquadStorageEventReceiver = v32.createElement(v10), 
        SquadNudgeEventReceiver = v32.createElement(if l_FFlagEnablePartyNudgeV1_DEV_0 then v13 else v11, {
            currentSquadId = v74, 
            currentParentChannelId = v75
        }), 
        ScheduledSquadEventReceiver = if l_FFlagEnableScheduledSquads_0 then v32.createElement(v9) else nil, 
        SquadRegroupPromptEventReceiver = if v105 then v32.createElement(v14, {
            currentSquadMembers = v73 and v73.members or {}, 
            currentSquadId = v74
        }) else nil
    });
end;