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
local v12 = require(script.Parent.SquadNudgeEventReceiver_NudgeV1Exp);
local v13 = require(script.Parent.SquadRegroupPromptEventReceiver);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.RoduxSquads).Actions.CurrentSquadUpdated;
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v16 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v17 = require(l_script_FirstAncestor_0.Enums.SquadCoplayJoin);
local v18 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v19 = require(l_script_FirstAncestor_0.Enums.SquadRootViewType);
local v20 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v21 = require(l_script_FirstAncestor_0.Enums.SquadToastType);
local v22 = require(l_script_FirstAncestor_0.Thunks.joinSquad);
local v23 = require(l_script_FirstAncestor_0.Thunks.leaveSquad);
local v24 = require(l_script_FirstAncestor_0.Analytics.logInExpCoplayTelemetry);
local v25 = require(l_script_FirstAncestor_0.Hooks.useOnSquadEnded);
local v26 = require(l_script_FirstAncestor_0.Hooks.useCrossExperienceVoiceConnector);
local v27 = require(l_script_FirstAncestor_0.Utils.RegroupPromptNotificationState);
local v28 = require(l_Parent_0.CrossExperienceVoice);
local l_CrossExperienceVoiceManager_0 = v28.CrossExperienceVoiceManager;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v31 = require(l_Parent_0.React);
local v32 = require(l_Parent_0.RoduxSquads);
local v33 = require(l_Parent_0.SharedFlags);
local v34 = require(l_Parent_0.SoundManager);
local v35 = require(l_Parent_0.ToastNotification);
local v36 = require(l_Parent_0.ToastNotificationsProtocol);
local l_useCrossExperienceVoice_0 = v28.Hooks.useCrossExperienceVoice;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useCurrentSquadSelector_0 = v32.Hooks.useCurrentSquadSelector;
local l_Sounds_0 = v34.Sounds;
local l_SoundManager_0 = v34.SoundManager;
local l_GetFFlagEnableCrossExpVoice_0 = v33.GetFFlagEnableCrossExpVoice;
local l_FFlagPartyVoiceBlockSync_0 = v33.FFlagPartyVoiceBlockSync;
local l_FFlagSquadAppChatRTNFix_0 = v33.FFlagSquadAppChatRTNFix;
local l_FFlagEnableSquadCoplayAnalytic_0 = v33.FFlagEnableSquadCoplayAnalytic;
local l_FFlagEnableSquadCoplayDependencyArray_0 = v33.FFlagEnableSquadCoplayDependencyArray;
local l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 = v33.FIntPartyVoiceJoinRequestPulseCheckTimeout;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v33.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local l_FFlagReadAppChatFetchingVariable_0 = v33.FFlagReadAppChatFetchingVariable;
local l_FFlagEnablePartyNudgeV1_DEV_0 = v33.FFlagEnablePartyNudgeV1_DEV;
local l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 = v33.FFlagAppChatNavigateBackIfOSAUnacknowledged;
local l_FFlagEnableSquadRegroupExperimentation_0 = v33.FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnableScheduledSquads_0 = v33.FFlagEnableScheduledSquads;
local l_FFlagEnableDialogAfterSquadJoin_0 = v33.FFlagEnableDialogAfterSquadJoin;
local l_default_0 = v36.ToastNotificationProtocol.default;
local l_LifecycleEvents_0 = v35.LifecycleEvents;
local l_NotificationTypeEnum_0 = v35.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_1 = v35.ToastNotificationSnoozeManager.default;
local v62 = game:DefineFastFlag("LeaveSquadIfChatDisabled", false);
return function() --[[ Line: 79 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v31 (copy), v16 (copy), l_useCurrentSquadSelector_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_useEffectOnce_0 (copy), v24 (copy), v17 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), v15 (copy), v20 (copy), v21 (copy), l_HttpService_0 (copy), l_default_0 (copy), v22 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_FFlagEnableDialogAfterSquadJoin_0 (copy), l_default_1 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), l_useSelector_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_useCrossExperienceVoice_0 (copy), v26 (copy), v25 (copy), l_FFlagReadAppChatFetchingVariable_0 (copy), v62 (copy), v23 (copy), l_CurrentSquadUpdated_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v18 (copy), l_ExperienceService_0 (copy), v27 (copy), v6 (copy), v8 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), v19 (copy), v4 (copy), v5 (copy), v7 (copy), v10 (copy), l_FFlagEnablePartyNudgeV1_DEV_0 (copy), v12 (copy), v11 (copy), l_FFlagEnableScheduledSquads_0 (copy), v9 (copy), v13 (copy)
    local v63 = l_useDispatch_0();
    local v64 = tonumber(l_useLocalUserId_0()) or 0;
    local v65 = v31.useContext(v16);
    local v66 = v65.useSquadRootView();
    local v67 = v65.useIsChatEnabled();
    local v68 = v65.useIsLoadingChatSettings();
    local v69 = l_useCurrentSquadSelector_0();
    local v70 = if v69 and v69.squadId then v69.squadId else "";
    local v71 = if v69 and v69.parentChannelId then v69.parentChannelId else "";
    if l_FFlagEnableSquadCoplayAnalytic_0 then
        l_useEffectOnce_0(function() --[[ Line: 96 ]]
            -- upvalues: v69 (copy), v24 (ref), v70 (copy), v65 (copy), v17 (ref)
            if v69 then
                v24(v70, v69.members, v65.squadLocation, v17.ExperienceJoin, v65.fireSquadAnalytics);
            end;
        end, {});
    end;
    v31.useEffect(function() --[[ Line: 117 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v65 (copy), v15 (ref), v71 (copy), v20 (ref), v21 (ref), l_HttpService_0 (ref), l_default_0 (ref), v63 (copy), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v67 (copy)
        local v74 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitation, function(v72) --[[ Line: 121 ]]
            -- upvalues: v65 (ref), v15 (ref), v71 (ref), v20 (ref), v21 (ref), l_HttpService_0 (ref), l_default_0 (ref), v63 (ref), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v67 (ref)
            if v72 and v72.userActionType == "click" and v72.notificationData and v72.visualItem and v72.visualItem.eventName == "JoinSquad" and v72.visualItem.actionEventParams then
                v65.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v71, 
                    toastAction = v20.SquadInviteAccept, 
                    toastType = v21.SquadInvite
                });
                local v73 = l_HttpService_0:JSONDecode(v72.visualItem.actionEventParams);
                l_default_0:dismissNotification(v72.notificationData.id);
                v63(v22(v73.squadId, v65.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v65.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v65.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v67));
            end;
        end);
        return function() --[[ Line: 151 ]]
            -- upvalues: v74 (copy)
            v74();
        end;
    end, l_dependencyArray_0(if l_FFlagEnableSquadCoplayDependencyArray_0 then v71 else nil, v63, if l_FFlagEnableSquadCoplayDependencyArray_0 then v22 else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v65.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v65.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v65.squadLocation else nil, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v67 else nil));
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v31.useEffect(function() --[[ Line: 169 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v65 (copy), l_default_0 (ref), v15 (ref), v71 (copy), v20 (ref), v21 (ref), v63 (copy), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v67 (copy)
            local v77 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitationV2, function(v75) --[[ Line: 173 ]]
                -- upvalues: l_HttpService_0 (ref), v65 (ref), l_default_0 (ref), v15 (ref), v71 (ref), v20 (ref), v21 (ref), v63 (ref), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v67 (ref)
                if v75 and v75.userActionType == "click" and v75.notificationData and v75.visualItem and v75.visualItem.actionEventParams then
                    local v76 = l_HttpService_0:JSONDecode(v75.visualItem.actionEventParams);
                    if v75.visualItem.visualItemName == "view" and v65.showGroupOSADialog then
                        l_default_0:dismissNotification(v75.notificationData.id);
                        v65.fireSquadAnalytics(v15.SquadToastActions, {
                            parentChannelId = v71, 
                            toastAction = v20.SquadInviteViewOsa, 
                            toastType = v21.SquadInviteV2
                        });
                        v65.showGroupOSADialog(v76.chatId, function() --[[ Line: 191 ]]
                            -- upvalues: v63 (ref), v22 (ref), v76 (copy), v65 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v67 (ref)
                            v63(v22(v76.squadId, v65.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v65.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v65.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v67));
                        end, function() --[[ Line: 207 ]]

                        end);
                        return;
                    elseif v75.visualItem.visualItemName == "join" then
                        l_default_0:dismissNotification(v75.notificationData.id);
                        v65.fireSquadAnalytics(v15.SquadToastActions, {
                            parentChannelId = v71, 
                            toastAction = v20.SquadInviteAccept, 
                            toastType = v21.SquadInviteV2
                        });
                        v63(v22(v76.squadId, v65.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v65.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v65.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v67));
                    end;
                end;
            end);
            return function() --[[ Line: 236 ]]
                -- upvalues: v77 (copy)
                v77();
            end;
        end, l_dependencyArray_0(v71, v63, v22, v65.fireSquadAnalytics, v65.setSquadPrompt, v65.showGroupOSADialog, v65.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v67 else nil));
    end;
    v31.useEffect(function() --[[ Line: 254 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v67 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
        local v79 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitation, function(v78) --[[ Line: 258 ]]
            -- upvalues: v67 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v67 and not l_default_1:isSnoozedNotificationType(v78.notificationType) then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end);
        return function() --[[ Line: 268 ]]
            -- upvalues: v79 (copy)
            if v79 then
                v79();
            end;
        end;
    end, {
        v67
    });
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v31.useEffect(function() --[[ Line: 277 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v67 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            local v81 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitationV2, function(v80) --[[ Line: 281 ]]
                -- upvalues: v67 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
                if v67 and not l_default_1:isSnoozedNotificationType(v80.notificationType) then
                    l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
                end;
            end);
            return function() --[[ Line: 291 ]]
                -- upvalues: v81 (copy)
                if v81 then
                    v81();
                end;
            end;
        end, {
            v67
        });
    end;
    v31.useEffect(function() --[[ Line: 300 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v67 (copy), v64 (copy), l_HttpService_0 (ref), v70 (copy)
        local v84 = l_default_0:listenToDisplayNotification(function(v82) --[[ Line: 302 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v67 (ref), l_default_0 (ref), v64 (ref), l_HttpService_0 (ref), v70 (ref)
            if not v82 then
                return;
            elseif (v82.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v82.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v82.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation or v82.notificationType == l_NotificationTypeEnum_0.SquadJoinRequestPrompt or v82.notificationType == l_NotificationTypeEnum_0.SquadAcceptJoinRequest) and not v67 then
                l_default_0:dismissNotification(v82.notificationId);
                return;
            elseif v64 <= 0 then
                if v82.notificationId and (v82.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v82.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v82.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation) then
                    l_default_0:dismissNotification(v82.notificationId);
                end;
                return;
            else
                if v82.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v82.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 then
                    local v83 = l_HttpService_0:JSONDecode(v82.lifecycleData);
                    if v70 == v83.squadId then
                        l_default_0:dismissNotification(v82.notificationId);
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 355 ]]
            -- upvalues: v84 (copy)
            v84:Disconnect();
        end;
    end, {
        v70, 
        v64, 
        v67
    });
    v31.useEffect(function() --[[ Line: 361 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v65 (copy), v15 (ref), v71 (copy), v20 (ref), v21 (ref), l_default_0 (ref)
        local v86 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadJoinRequestPrompt, function(v85) --[[ Line: 365 ]]
            -- upvalues: v65 (ref), v15 (ref), v71 (ref), v20 (ref), v21 (ref), l_default_0 (ref)
            if v85 and v85.userActionType == "click" and v85.notificationData and v85.visualItem and v85.visualItem.eventName == "RequestToJoinParty" and v85.visualItem.actionEventParams then
                v65.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v71, 
                    toastAction = v20.RequestToJoinPartyAccept, 
                    toastType = v21.RequestToJoinParty
                });
                l_default_0:dismissNotification(v85.notificationData.id);
            end;
        end);
        return function() --[[ Line: 389 ]]
            -- upvalues: v86 (copy)
            v86();
        end;
    end, l_dependencyArray_0(v71, v65.fireSquadAnalytics));
    v31.useEffect(function() --[[ Line: 395 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v65 (copy), v15 (ref), v71 (copy), v20 (ref), v21 (ref), l_default_0 (ref)
        local v88 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadAcceptJoinRequest, function(v87) --[[ Line: 399 ]]
            -- upvalues: v65 (ref), v15 (ref), v71 (ref), v20 (ref), v21 (ref), l_default_0 (ref)
            if v87 and v87.userActionType == "click" and v87.notificationData and v87.visualItem and v87.visualItem.eventName == "AcceptPartyJoinRequest" and v87.visualItem.actionEventParams then
                v65.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v71, 
                    toastAction = v20.AcceptPartyJoinRequestAccept, 
                    toastType = v21.AcceptPartyJoinRequest
                });
                l_default_0:dismissNotification(v87.notificationData.id);
            end;
        end);
        return function() --[[ Line: 423 ]]
            -- upvalues: v88 (copy)
            v88();
        end;
    end, l_dependencyArray_0(v71, v65.fireSquadAnalytics));
    if l_GetFFlagEnableCrossExpVoice_0() and l_FFlagPartyVoiceBlockSync_0 then
        local v90 = v31.useCallback(function(v89) --[[ Line: 431 ]]
            return v89.Squad.UserBlocking.isBlockedByMe;
        end, {});
        local v91 = l_useSelector_0(v90);
        local v92 = v31.useRef({});
        local l_v91_0 = v91 --[[ copy: 10 -> 13 ]];
        v31.useEffect(function() --[[ Line: 438 ]]
            -- upvalues: v92 (copy), l_v91_0 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v92.current == l_v91_0 then
                return;
            else
                for v94, v95 in pairs(l_v91_0) do
                    local v96 = v92.current[v94] or false;
                    if v95 and not v96 then
                        l_CrossExperienceVoiceManager_0.default:blockVoiceParticipant(v94);
                    elseif not v95 and v96 then
                        l_CrossExperienceVoiceManager_0.default:unblockVoiceParticipant(v94);
                    end;
                end;
                v92.current = l_v91_0;
                return;
            end;
        end, {
            v91
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
        local v97 = v26();
        local l_v97_0 = v97 --[[ copy: 9 -> 12 ]];
        v25(function() --[[ Line: 467 ]]
            -- upvalues: l_v97_0 (copy)
            l_v97_0();
        end);
    end;
    v31.useEffect(function() --[[ Line: 473 ]]
        -- upvalues: l_FFlagReadAppChatFetchingVariable_0 (ref), v68 (copy), v67 (copy), v70 (copy), v62 (ref), v63 (copy), v23 (ref), v65 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), l_CurrentSquadUpdated_0 (ref)
        if (not l_FFlagReadAppChatFetchingVariable_0 or not v68) and not v67 and v70 ~= "" then
            if v62 then
                v63(v23(nil, v65.setSquadPrompt, nil, v65.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v67));
                return;
            else
                v63(l_CurrentSquadUpdated_0(nil));
            end;
        end;
    end, l_dependencyArray_0(v67, v70, if l_FFlagReadAppChatFetchingVariable_0 then v68 else nil, if v62 then v65.setSquadPrompt else nil, if v62 then v65.squadLocation else nil));
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then
        local v99 = v65.useGetConversationFromId(v71);
        local v100 = v65.shouldShowOSAForConversation(v99);
        v31.useEffect(function() --[[ Line: 511 ]]
            -- upvalues: v100 (copy), v70 (copy), v63 (copy), v23 (ref), v65 (copy)
            if v100 and v70 ~= "" then
                v63(v23(nil, v65.setSquadPrompt, nil, v65.squadLocation, true));
            end;
        end, l_dependencyArray_0(v100, v70, v65.setSquadPrompt, v65.squadLocation));
    end;
    local v101 = l_FFlagEnableSquadRegroupExperimentation_0 and v65.squadLocation == v18.InExperience and v69 and v69.selfPermissions and v69.selfPermissions.canSeeRegroupPromptToast and #v69.members > 1;
    v31.useEffect(function() --[[ Line: 527 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_ExperienceService_0 (ref), v27 (ref)
        if not l_FFlagEnableSquadRegroupExperimentation_0 then
            return function() --[[ Line: 529 ]]

            end;
        else
            local v103 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 532 ]]
                -- upvalues: v27 (ref)
                local v102 = v27.getActiveNotifId();
                v27.dismissNotification(v102);
            end);
            return function() --[[ Line: 537 ]]
                -- upvalues: v103 (copy)
                if v103 and v103.Disconnect then
                    v103:Disconnect();
                end;
            end;
        end;
    end, {});
    v31.useEffect(function() --[[ Line: 544 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), v27 (ref), v70 (copy)
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            local v104 = v27.getActiveNotifId();
            local v105 = v27.getActiveSquadId();
            if v104 ~= nil and v70 ~= v105 then
                v27.dismissNotification(v104);
            end;
        end;
    end, {
        v70
    });
    return v31.createElement(v31.Fragment, nil, {
        SquadLifecycleEventReceiver = v31.createElement(v6, {
            currentSquadId = v70
        }), 
        SquadParentChannelEventReceiver = if v69 then v31.createElement(v8, {
            currentParentChannelId = v69.parentChannelId
        }) else nil, 
        SquadAppChatEventReceiver = if not l_FFlagSquadAppChatRTNFix_0 and v66 ~= v19.None then v31.createElement(v4, {
            conversationId = if v69 then v69.parentChannelId else nil
        }) else nil, 
        SquadExperienceInviteEventReceiver = v31.createElement(v5, {
            currentSquadId = v70
        }), 
        SquadRccEventReceiver = if v65.squadLocation == v18.InExperience then v31.createElement(v7, {
            currentSquadId = v70
        }) else nil, 
        SquadStorageEventReceiver = v31.createElement(v10), 
        SquadNudgeEventReceiver = v31.createElement(if l_FFlagEnablePartyNudgeV1_DEV_0 then v12 else v11, {
            currentSquadId = v70, 
            currentParentChannelId = v71
        }), 
        ScheduledSquadEventReceiver = if l_FFlagEnableScheduledSquads_0 then v31.createElement(v9) else nil, 
        SquadRegroupPromptEventReceiver = if v101 then v31.createElement(v13, {
            currentSquadMembers = v69 and v69.members or {}, 
            currentSquadId = v70
        }) else nil
    });
end;