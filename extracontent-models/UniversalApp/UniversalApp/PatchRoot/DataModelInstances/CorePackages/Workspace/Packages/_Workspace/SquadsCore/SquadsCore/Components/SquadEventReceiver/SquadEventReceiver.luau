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
local l_FFlagAppChatShowOSAOnPageEntry_0 = v33.FFlagAppChatShowOSAOnPageEntry;
local l_FFlagEnableSquadRegroupExperimentation_0 = v33.FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnableScheduledSquads_0 = v33.FFlagEnableScheduledSquads;
local l_FFlagEnableDialogAfterSquadJoin_0 = v33.FFlagEnableDialogAfterSquadJoin;
local l_default_0 = v36.ToastNotificationProtocol.default;
local l_LifecycleEvents_0 = v35.LifecycleEvents;
local l_NotificationTypeEnum_0 = v35.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_1 = v35.ToastNotificationSnoozeManager.default;
local v63 = game:DefineFastFlag("LeaveSquadIfChatDisabled", false);
return function() --[[ Line: 80 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v31 (copy), v16 (copy), l_useCurrentSquadSelector_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_useEffectOnce_0 (copy), v24 (copy), v17 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), v15 (copy), v20 (copy), v21 (copy), l_HttpService_0 (copy), l_default_0 (copy), v22 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_FFlagEnableDialogAfterSquadJoin_0 (copy), l_default_1 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), l_useSelector_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_useCrossExperienceVoice_0 (copy), v26 (copy), v25 (copy), l_FFlagReadAppChatFetchingVariable_0 (copy), v63 (copy), v23 (copy), l_CurrentSquadUpdated_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v18 (copy), l_ExperienceService_0 (copy), v27 (copy), v6 (copy), v8 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), v19 (copy), v4 (copy), v5 (copy), v7 (copy), v10 (copy), l_FFlagEnablePartyNudgeV1_DEV_0 (copy), v12 (copy), v11 (copy), l_FFlagEnableScheduledSquads_0 (copy), v9 (copy), v13 (copy)
    local v64 = l_useDispatch_0();
    local v65 = tonumber(l_useLocalUserId_0()) or 0;
    local v66 = v31.useContext(v16);
    local v67 = v66.useSquadRootView();
    local v68 = v66.useIsChatEnabled();
    local v69 = v66.useIsLoadingChatSettings();
    local v70 = l_useCurrentSquadSelector_0();
    local v71 = if v70 and v70.squadId then v70.squadId else "";
    local v72 = if v70 and v70.parentChannelId then v70.parentChannelId else "";
    if l_FFlagEnableSquadCoplayAnalytic_0 then
        l_useEffectOnce_0(function() --[[ Line: 97 ]]
            -- upvalues: v70 (copy), v24 (ref), v71 (copy), v66 (copy), v17 (ref)
            if v70 then
                v24(v71, v70.members, v66.squadLocation, v17.ExperienceJoin, v66.fireSquadAnalytics);
            end;
        end, {});
    end;
    v31.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v66 (copy), v15 (ref), v72 (copy), v20 (ref), v21 (ref), l_HttpService_0 (ref), l_default_0 (ref), v64 (copy), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v68 (copy)
        local v75 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitation, function(v73) --[[ Line: 122 ]]
            -- upvalues: v66 (ref), v15 (ref), v72 (ref), v20 (ref), v21 (ref), l_HttpService_0 (ref), l_default_0 (ref), v64 (ref), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v68 (ref)
            if v73 and v73.userActionType == "click" and v73.notificationData and v73.visualItem and v73.visualItem.eventName == "JoinSquad" and v73.visualItem.actionEventParams then
                v66.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v72, 
                    toastAction = v20.SquadInviteAccept, 
                    toastType = v21.SquadInvite
                });
                local v74 = l_HttpService_0:JSONDecode(v73.visualItem.actionEventParams);
                l_default_0:dismissNotification(v73.notificationData.id);
                v64(v22(v74.squadId, v66.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v66.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v66.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v68));
            end;
        end);
        return function() --[[ Line: 152 ]]
            -- upvalues: v75 (copy)
            v75();
        end;
    end, l_dependencyArray_0(if l_FFlagEnableSquadCoplayDependencyArray_0 then v72 else nil, v64, if l_FFlagEnableSquadCoplayDependencyArray_0 then v22 else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v66.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v66.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v66.squadLocation else nil, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v68 else nil));
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v31.useEffect(function() --[[ Line: 170 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), l_HttpService_0 (ref), v66 (copy), l_default_0 (ref), v15 (ref), v72 (copy), v20 (ref), v21 (ref), v64 (copy), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v68 (copy)
            local v78 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitationV2, function(v76) --[[ Line: 174 ]]
                -- upvalues: l_HttpService_0 (ref), v66 (ref), l_default_0 (ref), v15 (ref), v72 (ref), v20 (ref), v21 (ref), v64 (ref), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v68 (ref)
                if v76 and v76.userActionType == "click" and v76.notificationData and v76.visualItem and v76.visualItem.actionEventParams then
                    local v77 = l_HttpService_0:JSONDecode(v76.visualItem.actionEventParams);
                    if v76.visualItem.visualItemName == "view" and v66.showGroupOSADialog then
                        l_default_0:dismissNotification(v76.notificationData.id);
                        v66.fireSquadAnalytics(v15.SquadToastActions, {
                            parentChannelId = v72, 
                            toastAction = v20.SquadInviteViewOsa, 
                            toastType = v21.SquadInviteV2
                        });
                        v66.showGroupOSADialog(v77.chatId, function() --[[ Line: 192 ]]
                            -- upvalues: v64 (ref), v22 (ref), v77 (copy), v66 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v68 (ref)
                            v64(v22(v77.squadId, v66.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v66.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v66.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v68));
                        end, function() --[[ Line: 208 ]]

                        end);
                        return;
                    elseif v76.visualItem.visualItemName == "join" then
                        l_default_0:dismissNotification(v76.notificationData.id);
                        v66.fireSquadAnalytics(v15.SquadToastActions, {
                            parentChannelId = v72, 
                            toastAction = v20.SquadInviteAccept, 
                            toastType = v21.SquadInviteV2
                        });
                        v64(v22(v77.squadId, v66.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v66.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v66.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v68));
                    end;
                end;
            end);
            return function() --[[ Line: 237 ]]
                -- upvalues: v78 (copy)
                v78();
            end;
        end, l_dependencyArray_0(v72, v64, v22, v66.fireSquadAnalytics, v66.setSquadPrompt, v66.showGroupOSADialog, v66.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v68 else nil));
    end;
    v31.useEffect(function() --[[ Line: 255 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v68 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
        local v80 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitation, function(v79) --[[ Line: 259 ]]
            -- upvalues: v68 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v68 and not l_default_1:isSnoozedNotificationType(v79.notificationType) then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end);
        return function() --[[ Line: 269 ]]
            -- upvalues: v80 (copy)
            if v80 then
                v80();
            end;
        end;
    end, {
        v68
    });
    if l_FFlagEnableDialogAfterSquadJoin_0 then
        v31.useEffect(function() --[[ Line: 278 ]]
            -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v68 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            local v82 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitationV2, function(v81) --[[ Line: 282 ]]
                -- upvalues: v68 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
                if v68 and not l_default_1:isSnoozedNotificationType(v81.notificationType) then
                    l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
                end;
            end);
            return function() --[[ Line: 292 ]]
                -- upvalues: v82 (copy)
                if v82 then
                    v82();
                end;
            end;
        end, {
            v68
        });
    end;
    v31.useEffect(function() --[[ Line: 301 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v68 (copy), v65 (copy), l_HttpService_0 (ref), v71 (copy)
        local v85 = l_default_0:listenToDisplayNotification(function(v83) --[[ Line: 303 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), l_FFlagEnableDialogAfterSquadJoin_0 (ref), v68 (ref), l_default_0 (ref), v65 (ref), l_HttpService_0 (ref), v71 (ref)
            if not v83 then
                return;
            elseif (v83.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v83.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v83.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation or v83.notificationType == l_NotificationTypeEnum_0.SquadJoinRequestPrompt or v83.notificationType == l_NotificationTypeEnum_0.SquadAcceptJoinRequest) and not v68 then
                l_default_0:dismissNotification(v83.notificationId);
                return;
            elseif v65 <= 0 then
                if v83.notificationId and (v83.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v83.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 or v83.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation) then
                    l_default_0:dismissNotification(v83.notificationId);
                end;
                return;
            else
                if v83.notificationType == l_NotificationTypeEnum_0.SquadInvitation or l_FFlagEnableDialogAfterSquadJoin_0 and v83.notificationType == l_NotificationTypeEnum_0.SquadInvitationV2 then
                    local v84 = l_HttpService_0:JSONDecode(v83.lifecycleData);
                    if v71 == v84.squadId then
                        l_default_0:dismissNotification(v83.notificationId);
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 356 ]]
            -- upvalues: v85 (copy)
            v85:Disconnect();
        end;
    end, {
        v71, 
        v65, 
        v68
    });
    v31.useEffect(function() --[[ Line: 362 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v66 (copy), v15 (ref), v72 (copy), v20 (ref), v21 (ref), l_default_0 (ref)
        local v87 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadJoinRequestPrompt, function(v86) --[[ Line: 366 ]]
            -- upvalues: v66 (ref), v15 (ref), v72 (ref), v20 (ref), v21 (ref), l_default_0 (ref)
            if v86 and v86.userActionType == "click" and v86.notificationData and v86.visualItem and v86.visualItem.eventName == "RequestToJoinParty" and v86.visualItem.actionEventParams then
                v66.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v72, 
                    toastAction = v20.RequestToJoinPartyAccept, 
                    toastType = v21.RequestToJoinParty
                });
                l_default_0:dismissNotification(v86.notificationData.id);
            end;
        end);
        return function() --[[ Line: 390 ]]
            -- upvalues: v87 (copy)
            v87();
        end;
    end, l_dependencyArray_0(v72, v66.fireSquadAnalytics));
    v31.useEffect(function() --[[ Line: 396 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v66 (copy), v15 (ref), v72 (copy), v20 (ref), v21 (ref), l_default_0 (ref)
        local v89 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadAcceptJoinRequest, function(v88) --[[ Line: 400 ]]
            -- upvalues: v66 (ref), v15 (ref), v72 (ref), v20 (ref), v21 (ref), l_default_0 (ref)
            if v88 and v88.userActionType == "click" and v88.notificationData and v88.visualItem and v88.visualItem.eventName == "AcceptPartyJoinRequest" and v88.visualItem.actionEventParams then
                v66.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v72, 
                    toastAction = v20.AcceptPartyJoinRequestAccept, 
                    toastType = v21.AcceptPartyJoinRequest
                });
                l_default_0:dismissNotification(v88.notificationData.id);
            end;
        end);
        return function() --[[ Line: 424 ]]
            -- upvalues: v89 (copy)
            v89();
        end;
    end, l_dependencyArray_0(v72, v66.fireSquadAnalytics));
    if l_GetFFlagEnableCrossExpVoice_0() and l_FFlagPartyVoiceBlockSync_0 then
        local v91 = v31.useCallback(function(v90) --[[ Line: 432 ]]
            return v90.Squad.UserBlocking.isBlockedByMe;
        end, {});
        local v92 = l_useSelector_0(v91);
        local v93 = v31.useRef({});
        local l_v92_0 = v92 --[[ copy: 10 -> 13 ]];
        v31.useEffect(function() --[[ Line: 439 ]]
            -- upvalues: v93 (copy), l_v92_0 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v93.current == l_v92_0 then
                return;
            else
                for v95, v96 in pairs(l_v92_0) do
                    local v97 = v93.current[v95] or false;
                    if v96 and not v97 then
                        l_CrossExperienceVoiceManager_0.default:blockVoiceParticipant(v95);
                    elseif not v96 and v97 then
                        l_CrossExperienceVoiceManager_0.default:unblockVoiceParticipant(v95);
                    end;
                end;
                v93.current = l_v92_0;
                return;
            end;
        end, {
            v92
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
        local v98 = v26();
        local l_v98_0 = v98 --[[ copy: 9 -> 12 ]];
        v25(function() --[[ Line: 468 ]]
            -- upvalues: l_v98_0 (copy)
            l_v98_0();
        end);
    end;
    v31.useEffect(function() --[[ Line: 474 ]]
        -- upvalues: l_FFlagReadAppChatFetchingVariable_0 (ref), v69 (copy), v68 (copy), v71 (copy), v63 (ref), v64 (copy), v23 (ref), v66 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), l_CurrentSquadUpdated_0 (ref)
        if (not l_FFlagReadAppChatFetchingVariable_0 or not v69) and not v68 and v71 ~= "" then
            if v63 then
                v64(v23(nil, v66.setSquadPrompt, nil, v66.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v68));
                return;
            else
                v64(l_CurrentSquadUpdated_0(nil));
            end;
        end;
    end, l_dependencyArray_0(v68, v71, if l_FFlagReadAppChatFetchingVariable_0 then v69 else nil, if v63 then v66.setSquadPrompt else nil, if v63 then v66.squadLocation else nil));
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 and not l_FFlagAppChatShowOSAOnPageEntry_0 then
        local v100 = v66.useGetConversationFromId(v72);
        local v101 = v66.shouldShowOSAForConversation(v100);
        v31.useEffect(function() --[[ Line: 512 ]]
            -- upvalues: v101 (copy), v71 (copy), v64 (copy), v23 (ref), v66 (copy)
            if v101 and v71 ~= "" then
                v64(v23(nil, v66.setSquadPrompt, nil, v66.squadLocation, true));
            end;
        end, l_dependencyArray_0(v101, v71, v66.setSquadPrompt, v66.squadLocation));
    end;
    local v102 = l_FFlagEnableSquadRegroupExperimentation_0 and v66.squadLocation == v18.InExperience and v70 and v70.selfPermissions and v70.selfPermissions.canSeeRegroupPromptToast and #v70.members > 1;
    v31.useEffect(function() --[[ Line: 528 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_ExperienceService_0 (ref), v27 (ref)
        if not l_FFlagEnableSquadRegroupExperimentation_0 then
            return function() --[[ Line: 530 ]]

            end;
        else
            local v104 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 533 ]]
                -- upvalues: v27 (ref)
                local v103 = v27.getActiveNotifId();
                v27.dismissNotification(v103);
            end);
            return function() --[[ Line: 538 ]]
                -- upvalues: v104 (copy)
                if v104 and v104.Disconnect then
                    v104:Disconnect();
                end;
            end;
        end;
    end, {});
    v31.useEffect(function() --[[ Line: 545 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), v27 (ref), v71 (copy)
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            local v105 = v27.getActiveNotifId();
            local v106 = v27.getActiveSquadId();
            if v105 ~= nil and v71 ~= v106 then
                v27.dismissNotification(v105);
            end;
        end;
    end, {
        v71
    });
    return v31.createElement(v31.Fragment, nil, {
        SquadLifecycleEventReceiver = v31.createElement(v6, {
            currentSquadId = v71
        }), 
        SquadParentChannelEventReceiver = if v70 then v31.createElement(v8, {
            currentParentChannelId = v70.parentChannelId
        }) else nil, 
        SquadAppChatEventReceiver = if not l_FFlagSquadAppChatRTNFix_0 and v67 ~= v19.None then v31.createElement(v4, {
            conversationId = if v70 then v70.parentChannelId else nil
        }) else nil, 
        SquadExperienceInviteEventReceiver = v31.createElement(v5, {
            currentSquadId = v71
        }), 
        SquadRccEventReceiver = if v66.squadLocation == v18.InExperience then v31.createElement(v7, {
            currentSquadId = v71
        }) else nil, 
        SquadStorageEventReceiver = v31.createElement(v10), 
        SquadNudgeEventReceiver = v31.createElement(if l_FFlagEnablePartyNudgeV1_DEV_0 then v12 else v11, {
            currentSquadId = v71, 
            currentParentChannelId = v72
        }), 
        ScheduledSquadEventReceiver = if l_FFlagEnableScheduledSquads_0 then v31.createElement(v9) else nil, 
        SquadRegroupPromptEventReceiver = if v102 then v31.createElement(v13, {
            currentSquadMembers = v70 and v70.members or {}, 
            currentSquadId = v71
        }) else nil
    });
end;