local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local v5 = require(script.Parent.SquadAppChatEventReceiver);
local v6 = require(script.Parent.SquadExperienceInviteEventReceiver);
local v7 = require(script.Parent.SquadLifecycleEventReceiver);
local v8 = require(script.Parent.SquadRccEventReceiver);
local v9 = require(script.Parent.SquadParentChannelEventReceiver);
local v10 = require(script.Parent.ScheduledSquadEventReceiver);
local v11 = require(script.Parent.SquadStorageEventReceiver);
local v12 = require(script.Parent.SquadNudgeEventReceiver);
local v13 = require(script.Parent.SquadMemberStatusEventReceiver);
local v14 = require(script.Parent.SquadNudgeEventReceiver_NudgeV1Exp);
local v15 = require(script.Parent.SquadRegroupPromptEventReceiver);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.RoduxSquads).Actions.CurrentSquadUpdated;
local v17 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v18 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v19 = require(l_script_FirstAncestor_0.Enums.SquadCoplayJoin);
local v20 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v21 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local v22 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v23 = require(l_script_FirstAncestor_0.Enums.SquadToastType);
local v24 = require(l_script_FirstAncestor_0.Thunks.joinSquad);
local v25 = require(l_script_FirstAncestor_0.Thunks.leaveSquad);
local v26 = require(l_script_FirstAncestor_0.Analytics.logInExpCoplayTelemetry);
local v27 = require(l_script_FirstAncestor_0.Hooks.useOnSquadEnded);
local v28 = require(l_script_FirstAncestor_0.Hooks.useCrossExperienceVoiceConnector);
local v29 = require(l_script_FirstAncestor_0.Utils.RegroupPromptNotificationState);
local v30 = require(l_Parent_0.CrossExperienceVoice);
local l_CrossExperienceVoiceManager_0 = v30.CrossExperienceVoiceManager;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v33 = require(l_Parent_0.React);
local v34 = require(l_Parent_0.RoduxSquads);
local v35 = require(l_Parent_0.SharedFlags);
local v36 = require(l_Parent_0.SoundManager);
local v37 = require(l_Parent_0.ToastNotification);
local v38 = require(l_Parent_0.ToastNotificationsProtocol);
local l_useCrossExperienceVoice_0 = v30.Hooks.useCrossExperienceVoice;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useCurrentSquadSelector_0 = v34.Hooks.useCurrentSquadSelector;
local l_Sounds_0 = v36.Sounds;
local l_SoundManager_0 = v36.SoundManager;
local l_GetFFlagEnableCrossExpVoice_0 = v35.GetFFlagEnableCrossExpVoice;
local l_FFlagPartyVoiceBlockSync_0 = v35.FFlagPartyVoiceBlockSync;
local l_FFlagSquadAppChatRTNFix_0 = v35.FFlagSquadAppChatRTNFix;
local l_FFlagEnableSquadCoplayAnalytic_0 = v35.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableSquadCoplayDependencyArray_0 = v35.FFlagEnableSquadCoplayDependencyArray;
local l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 = v35.FIntPartyVoiceJoinRequestPulseCheckTimeout;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v35.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local l_FFlagReadAppChatFetchingVariable_0 = v35.FFlagReadAppChatFetchingVariable;
local l_FFlagEnablePartyNudgeV1_DEV_0 = v35.FFlagEnablePartyNudgeV1_DEV;
local l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 = v35.FFlagAppChatNavigateBackIfOSAUnacknowledged;
local l_FFlagAppChatShowOSAOnPageEntry_0 = v35.FFlagAppChatShowOSAOnPageEntry;
local l_FFlagEnableSquadRegroupExperimentation_0 = v35.FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnableSquadRegroupServerCapacityCheck_0 = v35.FFlagEnableSquadRegroupServerCapacityCheck;
local l_FFlagEnableScheduledSquads_0 = v35.FFlagEnableScheduledSquads;
local l_FFlagEnableDialogAfterSquadJoin_0 = v35.FFlagEnableDialogAfterSquadJoin;
local l_default_0 = v38.ToastNotificationProtocol.default;
local l_LifecycleEvents_0 = v37.LifecycleEvents;
local l_NotificationTypeEnum_0 = v37.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_1 = v37.ToastNotificationSnoozeManager.default;
local l_SquadUnifyCoplayExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadUnifyCoplayExperimentation;
local v67 = game:DefineFastFlag("LeaveSquadIfChatDisabled", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v35.FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 85 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v33 (copy), v18 (copy), l_useCurrentSquadSelector_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_useEffectOnce_0 (copy), v26 (copy), v19 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), v17 (copy), v22 (copy), v23 (copy), l_HttpService_0 (copy), l_default_0 (copy), v24 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableDialogAfterSquadJoin_0 (copy), l_default_1 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), l_useSelector_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_useCrossExperienceVoice_0 (copy), v28 (copy), v27 (copy), l_FFlagReadAppChatFetchingVariable_0 (copy), v67 (copy), v25 (copy), l_CurrentSquadUpdated_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), l_FFlagEnableSquadRegroupServerCapacityCheck_0 (copy), l_Players_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v20 (copy), l_ExperienceService_0 (copy), v29 (copy), v7 (copy), v9 (copy), l_SquadUnifyCoplayExperimentation_0 (copy), v13 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), v21 (copy), v5 (copy), v6 (copy), v8 (copy), v11 (copy), l_FFlagEnablePartyNudgeV1_DEV_0 (copy), v14 (copy), v12 (copy), l_FFlagEnableScheduledSquads_0 (copy), v10 (copy), v15 (copy)
    local v69 = l_useDispatch_0();
    local v70 = tonumber(l_useLocalUserId_0()) or 0;
    local v71 = v33.useContext(v18);
    local v72 = v71.useSquadRootView();
    local v73 = v71.useIsChatEnabled();
    local v74 = v71.useIsLoadingChatSettings();
    local v75 = l_useCurrentSquadSelector_0();
    local v76 = if v75 and v75.squadId then v75.squadId else "";
    local v77 = if v75 and v75.parentChannelId then v75.parentChannelId else "";
    if l_FFlagEnableSquadCoplayAnalytic_0 then
        l_useEffectOnce_0(function() --[[ Line: 102 ]]
            -- upvalues: v75 (copy), v26 (ref), v76 (copy), v71 (copy), v19 (ref)
            if v75 then
                v26(v76, v75.members, v71.squadLocation, v19.ExperienceJoin, v71.fireSquadAnalytics);
            end;
        end, {});
    end;
    v33.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v71 (copy), v17 (ref), v77 (copy), v22 (ref), v23 (ref), l_HttpService_0 (ref), l_default_0 (ref), v69 (copy), v24 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v73 (copy)
        local v80 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitation, function(v78) --[[ Line: 127 ]]
            -- upvalues: v71 (ref), v17 (ref), v77 (ref), v22 (ref), v23 (ref), l_HttpService_0 (ref), l_default_0 (ref), v69 (ref), v24 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v73 (ref)
            if v78 and v78.userActionType == "click" and v78.notificationData and v78.visualItem and v78.visualItem.eventName == "JoinSquad" and v78.visualItem.actionEventParams then
                v71.fireSquadAnalytics(v17.SquadToastActions, {
                    parentChannelId = v77, 
                    toastAction = v22.SquadInviteAccept, 
                    toastType = v23.SquadInvite
                });
                local v79 = l_HttpService_0:JSONDecode(v78.visualItem.actionEventParams);
                l_default_0:dismissNotification(v78.notificationData.id);
                v69(v24(v79.squadId, v71.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v71.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v71.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v73));
            end;
        end);
        return function() --[[ Line: 157 ]]
            -- upvalues: v80 (copy)
            v80();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v77 else nil, 
        v69, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v24 else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v71.fireSquadAnalytics else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v71.setSquadPrompt else nil, 
        if l_FFlagEnableSquadCoplayDependencyArray_0 then v71.squadLocation else nil, 
        if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v73 else nil
    } else l_dependencyArray_0(if l_FFlagEnableSquadCoplayDependencyArray_0 then v77 else nil, v69, if l_FFlagEnableSquadCoplayDependencyArray_0 then v24 else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v71.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v71.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v71.squadLocation else nil, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v73 else nil));
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v33.useEffect(function() --[[ Line: 185 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v71 (copy), l_default_0 (ref), v17 (ref), v77 (copy), v22 (ref), v23 (ref), v69 (copy), v24 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v73 (copy)
            local v83 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitationV2, function(v81) --[[ Line: 189 ]]
                -- upvalues: l_HttpService_0 (ref), v71 (ref), l_default_0 (ref), v17 (ref), v77 (ref), v22 (ref), v23 (ref), v69 (ref), v24 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v73 (ref)
                if v81 and v81.userActionType == "click" and v81.notificationData and v81.visualItem and v81.visualItem.actionEventParams then
                    local v82 = l_HttpService_0:JSONDecode(v81.visualItem.actionEventParams);
                    if v81.visualItem.visualItemName == "view" and v71.showGroupOSADialog then
                        l_default_0:dismissNotification(v81.notificationData.id);
                        v71.fireSquadAnalytics(v17.SquadToastActions, {
                            parentChannelId = v77, 
                            toastAction = v22.SquadInviteViewOsa, 
                            toastType = v23.SquadInviteV2
                        });
                        v71.showGroupOSADialog(v82.chatId, function() --[[ Line: 207 ]]
                            -- upvalues: v69 (ref), v24 (ref), v82 (copy), v71 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v73 (ref)
                            v69(v24(v82.squadId, v71.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v71.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v71.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v73));
                        end, function() --[[ Line: 223 ]]

                        end);
                        return;
                    elseif v81.visualItem.visualItemName == "join" then
                        l_default_0:dismissNotification(v81.notificationData.id);
                        v71.fireSquadAnalytics(v17.SquadToastActions, {
                            parentChannelId = v77, 
                            toastAction = v22.SquadInviteAccept, 
                            toastType = v23.SquadInviteV2
                        });
                        v69(v24(v82.squadId, v71.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v71.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v71.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v73));
                    end;
                end;
            end);
            return function() --[[ Line: 252 ]]
                -- upvalues: v83 (copy)
                v83();
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v77, 
            v69, 
            v24, 
            v71.fireSquadAnalytics, 
            v71.setSquadPrompt, 
            v71.showGroupOSADialog, 
            v71.squadLocation, 
            if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v73 else nil
        } else l_dependencyArray_0(v77, v69, v24, v71.fireSquadAnalytics, v71.setSquadPrompt, v71.showGroupOSADialog, v71.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v73 else nil));
    end;
    v33.useEffect(function() --[[ Line: 281 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v73 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
        local v85 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitation, function(v84) --[[ Line: 285 ]]
            -- upvalues: v73 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v73 and not l_default_1:isSnoozedNotificationType(v84.notificationType) then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end);
        return function() --[[ Line: 295 ]]
            -- upvalues: v85 (copy)
            if v85 then
                v85();
            end;
        end;
    end, {
        v73
    });
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v33.useEffect(function() --[[ Line: 304 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v73 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            local v87 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitationV2, function(v86) --[[ Line: 308 ]]
                -- upvalues: v73 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
                if v73 and not l_default_1:isSnoozedNotificationType(v86.notificationType) then
                    l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
                end;
            end);
            return function() --[[ Line: 318 ]]
                -- upvalues: v87 (copy)
                if v87 then
                    v87();
                end;
            end;
        end, {
            v73
        });
    end;
    v33.useEffect(function() --[[ Line: 327 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v73 (copy), v70 (copy), l_HttpService_0 (ref), v76 (copy)
        local v90 = l_default_0:listenToDisplayNotification(function(v88) --[[ Line: 329 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v73 (ref), l_default_0 (ref), v70 (ref), l_HttpService_0 (ref), v76 (ref)
            if not v88 then
                return;
            elseif (v88.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v88.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v88.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation or v88.notificationType == l_NotificationTypeEnum_0.SquadJoinRequestPrompt or v88.notificationType == l_NotificationTypeEnum_0.SquadAcceptJoinRequest) and not v73 then
                l_default_0:dismissNotification(v88.notificationId);
                return;
            elseif v70 <= 0 then
                if v88.notificationId and (v88.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v88.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v88.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation) then
                    l_default_0:dismissNotification(v88.notificationId);
                end;
                return;
            else
                if v88.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v88.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 then
                    local v89 = l_HttpService_0:JSONDecode(v88.lifecycleData);
                    if v76 == v89.squadId then
                        l_default_0:dismissNotification(v88.notificationId);
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 382 ]]
            -- upvalues: v90 (copy)
            v90:Disconnect();
        end;
    end, {
        v76, 
        v70, 
        v73
    });
    v33.useEffect(function() --[[ Line: 389 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v71 (copy), v17 (ref), v77 (copy), v22 (ref), v23 (ref), l_default_0 (ref)
        local v92 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadJoinRequestPrompt, function(v91) --[[ Line: 393 ]]
            -- upvalues: v71 (ref), v17 (ref), v77 (ref), v22 (ref), v23 (ref), l_default_0 (ref)
            if v91 and v91.userActionType == "click" and v91.notificationData and v91.visualItem and v91.visualItem.eventName == "RequestToJoinParty" and v91.visualItem.actionEventParams then
                v71.fireSquadAnalytics(v17.SquadToastActions, {
                    parentChannelId = v77, 
                    toastAction = v22.RequestToJoinPartyAccept, 
                    toastType = v23.RequestToJoinParty
                });
                l_default_0:dismissNotification(v91.notificationData.id);
            end;
        end);
        return function() --[[ Line: 417 ]]
            -- upvalues: v92 (copy)
            v92();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v77, 
        v71.fireSquadAnalytics
    } else l_dependencyArray_0(v77, v71.fireSquadAnalytics));
    v33.useEffect(function() --[[ Line: 428 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v71 (copy), v17 (ref), v77 (copy), v22 (ref), v23 (ref), l_default_0 (ref)
        local v94 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadAcceptJoinRequest, function(v93) --[[ Line: 432 ]]
            -- upvalues: v71 (ref), v17 (ref), v77 (ref), v22 (ref), v23 (ref), l_default_0 (ref)
            if v93 and v93.userActionType == "click" and v93.notificationData and v93.visualItem and v93.visualItem.eventName == "AcceptPartyJoinRequest" and v93.visualItem.actionEventParams then
                v71.fireSquadAnalytics(v17.SquadToastActions, {
                    parentChannelId = v77, 
                    toastAction = v22.AcceptPartyJoinRequestAccept, 
                    toastType = v23.AcceptPartyJoinRequest
                });
                l_default_0:dismissNotification(v93.notificationData.id);
            end;
        end);
        return function() --[[ Line: 456 ]]
            -- upvalues: v94 (copy)
            v94();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v77, 
        v71.fireSquadAnalytics
    } else l_dependencyArray_0(v77, v71.fireSquadAnalytics));
    if l_GetFFlagEnableCrossExpVoice_0() and l_FFlagPartyVoiceBlockSync_0 then
        local v96 = v33.useCallback(function(v95) --[[ Line: 468 ]]
            return v95.Squad.UserBlocking.isBlockedByMe;
        end, {});
        local v97 = l_useSelector_0(v96);
        local v98 = v33.useRef({});
        local l_v97_0 = v97 --[[ copy: 10 -> 14 ]];
        v33.useEffect(function() --[[ Line: 475 ]]
            -- upvalues: v98 (copy), l_v97_0 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v98.current == l_v97_0 then
                return;
            else
                for v100, v101 in pairs(l_v97_0) do
                    local v102 = v98.current[v100] or false;
                    if v101 and not v102 then
                        l_CrossExperienceVoiceManager_0.default:blockVoiceParticipant(v100);
                    elseif not v101 and v102 then
                        l_CrossExperienceVoiceManager_0.default:unblockVoiceParticipant(v100);
                    end;
                end;
                v98.current = l_v97_0;
                return;
            end;
        end, {
            v97
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
        local v103 = v28();
        local l_v103_0 = v103 --[[ copy: 9 -> 13 ]];
        v27(function() --[[ Line: 504 ]]
            -- upvalues: l_v103_0 (copy)
            l_v103_0();
        end);
    end;
    v33.useEffect(function() --[[ Line: 510 ]]
        -- upvalues: l_FFlagReadAppChatFetchingVariable_0 (ref), v74 (copy), v73 (copy), v76 (copy), v67 (ref), v69 (copy), v25 (ref), v71 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), l_CurrentSquadUpdated_0 (ref)
        if (not l_FFlagReadAppChatFetchingVariable_0 or not v74) and not v73 and v76 ~= "" then
            if v67 then
                v69(v25(nil, v71.setSquadPrompt, nil, v71.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v73));
                return;
            else
                v69(l_CurrentSquadUpdated_0(nil));
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v73, 
        v76, 
        if l_FFlagReadAppChatFetchingVariable_0 then v74 else nil, 
        if v67 then v71.setSquadPrompt else nil, 
        if v67 then v71.squadLocation else nil
    } else l_dependencyArray_0(v73, v76, if l_FFlagReadAppChatFetchingVariable_0 then v74 else nil, if v67 then v71.setSquadPrompt else nil, if v67 then v71.squadLocation else nil));
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 and not l_FFlagAppChatShowOSAOnPageEntry_0 then
        local v105 = v71.useGetConversationFromId(v77);
        local v106 = v71.shouldShowOSAForConversation(v105);
        local l_v106_0 = v106 --[[ copy: 10 -> 12 ]];
        v33.useEffect(function() --[[ Line: 556 ]]
            -- upvalues: l_v106_0 (copy), v76 (copy), v69 (copy), v25 (ref), v71 (copy)
            if l_v106_0 and v76 ~= "" then
                v69(v25(nil, v71.setSquadPrompt, nil, v71.squadLocation, true));
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v106, 
            v76, 
            v71.setSquadPrompt, 
            v71.squadLocation
        } else l_dependencyArray_0(v106, v76, v71.setSquadPrompt, v71.squadLocation));
    end;
    local v108 = not l_FFlagEnableSquadRegroupServerCapacityCheck_0 or l_Players_0.MaxPlayers > 1;
    local v109 = l_FFlagEnableSquadRegroupExperimentation_0 and v71.squadLocation == v20.InExperience and v108 and v75 and v75.selfPermissions and v75.selfPermissions.canSeeRegroupPromptToast and #v75.members > 1;
    v33.useEffect(function() --[[ Line: 589 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_ExperienceService_0 (ref), v29 (ref)
        if not l_FFlagEnableSquadRegroupExperimentation_0 then
            return function() --[[ Line: 591 ]]

            end;
        else
            local v111 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 594 ]]
                -- upvalues: v29 (ref)
                local v110 = v29.getActiveNotifId();
                v29.dismissNotification(v110);
            end);
            return function() --[[ Line: 599 ]]
                -- upvalues: v111 (copy)
                if v111 and v111.Disconnect then
                    v111:Disconnect();
                end;
            end;
        end;
    end, {});
    v33.useEffect(function() --[[ Line: 606 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), v29 (ref), v76 (copy)
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            local v112 = v29.getActiveNotifId();
            local v113 = v29.getActiveSquadId();
            if v112 ~= nil and v76 ~= v113 then
                v29.dismissNotification(v112);
            end;
        end;
    end, {
        v76
    });
    return v33.createElement(v33.Fragment, nil, {
        SquadLifecycleEventReceiver = v33.createElement(v7, {
            currentSquadId = v76
        }), 
        SquadParentChannelEventReceiver = if v75 then v33.createElement(v9, {
            currentParentChannelId = v75.parentChannelId
        }) else nil, 
        SquadMemberStatusEventReceiver = if (not not l_SquadUnifyCoplayExperimentation_0.getOneOnOnePartyCreationEnabled() or l_SquadUnifyCoplayExperimentation_0.getMultiInvitePartyCreationEnabled()) and v71.squadLocation == v20.InExperience then v33.createElement(v13) else nil, 
        SquadAppChatEventReceiver = if not l_FFlagSquadAppChatRTNFix_0 and v72 ~= v21.None then v33.createElement(v5, {
            conversationId = if v75 then v75.parentChannelId else nil
        }) else nil, 
        SquadExperienceInviteEventReceiver = v33.createElement(v6, {
            currentSquadId = v76
        }), 
        SquadRccEventReceiver = if v71.squadLocation == v20.InExperience then v33.createElement(v8, {
            currentSquadId = v76
        }) else nil, 
        SquadStorageEventReceiver = v33.createElement(v11), 
        SquadNudgeEventReceiver = v33.createElement(if l_FFlagEnablePartyNudgeV1_DEV_0 then v14 else v12, {
            currentSquadId = v76, 
            currentParentChannelId = v77
        }), 
        ScheduledSquadEventReceiver = if l_FFlagEnableScheduledSquads_0 then v33.createElement(v10) else nil, 
        SquadRegroupPromptEventReceiver = if v109 then v33.createElement(v15, {
            currentSquadMembers = v75 and v75.members or {}, 
            currentSquadId = v76
        }) else nil
    });
end;