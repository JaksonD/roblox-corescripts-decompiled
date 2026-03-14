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
local l_default_0 = v36.ToastNotificationProtocol.default;
local l_LifecycleEvents_0 = v35.LifecycleEvents;
local l_NotificationTypeEnum_0 = v35.ToastNotificationTypeModule.NotificationTypeEnum;
local l_default_1 = v35.ToastNotificationSnoozeManager.default;
local v61 = game:DefineFastFlag("LeaveSquadIfChatDisabled", false);
return function() --[[ Line: 78 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v31 (copy), v16 (copy), l_useCurrentSquadSelector_0 (copy), l_FFlagEnableSquadCoplayAnalytic_0 (copy), l_useEffectOnce_0 (copy), v24 (copy), v17 (copy), l_LifecycleEvents_0 (copy), l_NotificationTypeEnum_0 (copy), v15 (copy), v20 (copy), v21 (copy), l_HttpService_0 (copy), l_default_0 (copy), v22 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadCoplayDependencyArray_0 (copy), l_default_1 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_FFlagPartyVoiceBlockSync_0 (copy), l_useSelector_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_FIntPartyVoiceJoinRequestPulseCheckTimeout_0 (copy), l_useCrossExperienceVoice_0 (copy), v26 (copy), v25 (copy), l_FFlagReadAppChatFetchingVariable_0 (copy), v61 (copy), v23 (copy), l_CurrentSquadUpdated_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), v18 (copy), l_ExperienceService_0 (copy), v27 (copy), v6 (copy), v8 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), v19 (copy), v4 (copy), v5 (copy), v7 (copy), v10 (copy), l_FFlagEnablePartyNudgeV1_DEV_0 (copy), v12 (copy), v11 (copy), l_FFlagEnableScheduledSquads_0 (copy), v9 (copy), v13 (copy)
    local v62 = l_useDispatch_0();
    local v63 = tonumber(l_useLocalUserId_0()) or 0;
    local v64 = v31.useContext(v16);
    local v65 = v64.useSquadRootView();
    local v66 = v64.useIsChatEnabled();
    local v67 = v64.useIsLoadingChatSettings();
    local v68 = l_useCurrentSquadSelector_0();
    local v69 = if v68 and v68.squadId then v68.squadId else "";
    local v70 = if v68 and v68.parentChannelId then v68.parentChannelId else "";
    if l_FFlagEnableSquadCoplayAnalytic_0 then
        l_useEffectOnce_0(function() --[[ Line: 95 ]]
            -- upvalues: v68 (copy), v24 (ref), v69 (copy), v64 (copy), v17 (ref)
            if v68 then
                v24(v69, v68.members, v64.squadLocation, v17.ExperienceJoin, v64.fireSquadAnalytics);
            end;
        end, {});
    end;
    v31.useEffect(function() --[[ Line: 116 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v64 (copy), v15 (ref), v70 (copy), v20 (ref), v21 (ref), l_HttpService_0 (ref), l_default_0 (ref), v62 (copy), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v66 (copy)
        local v73 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadInvitation, function(v71) --[[ Line: 120 ]]
            -- upvalues: v64 (ref), v15 (ref), v70 (ref), v20 (ref), v21 (ref), l_HttpService_0 (ref), l_default_0 (ref), v62 (ref), v22 (ref), l_FFlagEnableSquadCoplayAnalytic_0 (ref), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v66 (ref)
            if v71 and v71.userActionType == "click" and v71.notificationData and v71.visualItem and v71.visualItem.eventName == "JoinSquad" and v71.visualItem.actionEventParams then
                v64.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v70, 
                    toastAction = v20.SquadInviteAccept, 
                    toastType = v21.SquadInvite
                });
                local v72 = l_HttpService_0:JSONDecode(v71.visualItem.actionEventParams);
                l_default_0:dismissNotification(v71.notificationData.id);
                v62(v22(v72.squadId, v64.setSquadPrompt, if l_FFlagEnableSquadCoplayAnalytic_0 then v64.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayAnalytic_0 then v64.squadLocation else nil, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v66));
            end;
        end);
        return function() --[[ Line: 150 ]]
            -- upvalues: v73 (copy)
            v73();
        end;
    end, l_dependencyArray_0(if l_FFlagEnableSquadCoplayDependencyArray_0 then v70 else nil, v62, if l_FFlagEnableSquadCoplayDependencyArray_0 then v22 else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v64.fireSquadAnalytics else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v64.setSquadPrompt else nil, if l_FFlagEnableSquadCoplayDependencyArray_0 then v64.squadLocation else nil, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v66 else nil));
    v31.useEffect(function() --[[ Line: 166 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v66 (copy), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
        local v75 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.Display, l_NotificationTypeEnum_0.SquadInvitation, function(v74) --[[ Line: 170 ]]
            -- upvalues: v66 (ref), l_default_1 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref)
            if v66 and not l_default_1:isSnoozedNotificationType(v74.notificationType) then
                l_SoundManager_0:PlaySound(l_Sounds_0.PartyToast.Name);
            end;
        end);
        return function() --[[ Line: 180 ]]
            -- upvalues: v75 (copy)
            if v75 then
                v75();
            end;
        end;
    end, {
        v66
    });
    v31.useEffect(function() --[[ Line: 188 ]]
        -- upvalues: l_default_0 (ref), l_NotificationTypeEnum_0 (ref), v66 (copy), v63 (copy), l_HttpService_0 (ref), v69 (copy)
        local v78 = l_default_0:listenToDisplayNotification(function(v76) --[[ Line: 190 ]]
            -- upvalues: l_NotificationTypeEnum_0 (ref), v66 (ref), l_default_0 (ref), v63 (ref), l_HttpService_0 (ref), v69 (ref)
            if not v76 then
                return;
            elseif (v76.notificationType == l_NotificationTypeEnum_0.SquadInvitation or v76.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation or v76.notificationType == l_NotificationTypeEnum_0.SquadJoinRequestPrompt or v76.notificationType == l_NotificationTypeEnum_0.SquadAcceptJoinRequest) and not v66 then
                l_default_0:dismissNotification(v76.notificationId);
                return;
            elseif v63 <= 0 then
                if v76.notificationId and (v76.notificationType == l_NotificationTypeEnum_0.SquadInvitation or v76.notificationType == l_NotificationTypeEnum_0.SquadExperienceInvitation) then
                    l_default_0:dismissNotification(v76.notificationId);
                end;
                return;
            else
                if v76.notificationType == l_NotificationTypeEnum_0.SquadInvitation then
                    local v77 = l_HttpService_0:JSONDecode(v76.lifecycleData);
                    if v69 == v77.squadId then
                        l_default_0:dismissNotification(v76.notificationId);
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 235 ]]
            -- upvalues: v78 (copy)
            v78:Disconnect();
        end;
    end, {
        v69, 
        v63, 
        v66
    });
    v31.useEffect(function() --[[ Line: 241 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v64 (copy), v15 (ref), v70 (copy), v20 (ref), v21 (ref), l_default_0 (ref)
        local v80 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadJoinRequestPrompt, function(v79) --[[ Line: 245 ]]
            -- upvalues: v64 (ref), v15 (ref), v70 (ref), v20 (ref), v21 (ref), l_default_0 (ref)
            if v79 and v79.userActionType == "click" and v79.notificationData and v79.visualItem and v79.visualItem.eventName == "RequestToJoinParty" and v79.visualItem.actionEventParams then
                v64.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v70, 
                    toastAction = v20.RequestToJoinPartyAccept, 
                    toastType = v21.RequestToJoinParty
                });
                l_default_0:dismissNotification(v79.notificationData.id);
            end;
        end);
        return function() --[[ Line: 269 ]]
            -- upvalues: v80 (copy)
            v80();
        end;
    end, l_dependencyArray_0(v70, v64.fireSquadAnalytics));
    v31.useEffect(function() --[[ Line: 275 ]]
        -- upvalues: l_LifecycleEvents_0 (ref), l_NotificationTypeEnum_0 (ref), v64 (copy), v15 (ref), v70 (copy), v20 (ref), v21 (ref), l_default_0 (ref)
        local v82 = l_LifecycleEvents_0:RegisterCallback(l_LifecycleEvents_0.ToastEvents.UserAction, l_NotificationTypeEnum_0.SquadAcceptJoinRequest, function(v81) --[[ Line: 279 ]]
            -- upvalues: v64 (ref), v15 (ref), v70 (ref), v20 (ref), v21 (ref), l_default_0 (ref)
            if v81 and v81.userActionType == "click" and v81.notificationData and v81.visualItem and v81.visualItem.eventName == "AcceptPartyJoinRequest" and v81.visualItem.actionEventParams then
                v64.fireSquadAnalytics(v15.SquadToastActions, {
                    parentChannelId = v70, 
                    toastAction = v20.AcceptPartyJoinRequestAccept, 
                    toastType = v21.AcceptPartyJoinRequest
                });
                l_default_0:dismissNotification(v81.notificationData.id);
            end;
        end);
        return function() --[[ Line: 303 ]]
            -- upvalues: v82 (copy)
            v82();
        end;
    end, l_dependencyArray_0(v70, v64.fireSquadAnalytics));
    if l_GetFFlagEnableCrossExpVoice_0() and l_FFlagPartyVoiceBlockSync_0 then
        local v84 = v31.useCallback(function(v83) --[[ Line: 311 ]]
            return v83.Squad.UserBlocking.isBlockedByMe;
        end, {});
        local v85 = l_useSelector_0(v84);
        local v86 = v31.useRef({});
        local l_v85_0 = v85 --[[ copy: 10 -> 13 ]];
        v31.useEffect(function() --[[ Line: 318 ]]
            -- upvalues: v86 (copy), l_v85_0 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v86.current == l_v85_0 then
                return;
            else
                for v88, v89 in pairs(l_v85_0) do
                    local v90 = v86.current[v88] or false;
                    if v89 and not v90 then
                        l_CrossExperienceVoiceManager_0.default:blockVoiceParticipant(v88);
                    elseif not v89 and v90 then
                        l_CrossExperienceVoiceManager_0.default:unblockVoiceParticipant(v88);
                    end;
                end;
                v86.current = l_v85_0;
                return;
            end;
        end, {
            v85
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
        local v91 = v26();
        local l_v91_0 = v91 --[[ copy: 9 -> 12 ]];
        v25(function() --[[ Line: 347 ]]
            -- upvalues: l_v91_0 (copy)
            l_v91_0();
        end);
    end;
    v31.useEffect(function() --[[ Line: 353 ]]
        -- upvalues: l_FFlagReadAppChatFetchingVariable_0 (ref), v67 (copy), v66 (copy), v69 (copy), v61 (ref), v62 (copy), v23 (ref), v64 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), l_CurrentSquadUpdated_0 (ref)
        if (not l_FFlagReadAppChatFetchingVariable_0 or not v67) and not v66 and v69 ~= "" then
            if v61 then
                v62(v23(nil, v64.setSquadPrompt, nil, v64.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v66));
                return;
            else
                v62(l_CurrentSquadUpdated_0(nil));
            end;
        end;
    end, l_dependencyArray_0(v66, v69, if l_FFlagReadAppChatFetchingVariable_0 then v67 else nil, if v61 then v64.setSquadPrompt else nil, if v61 then v64.squadLocation else nil));
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then
        local v93 = v64.useGetConversationFromId(v70);
        local v94 = v64.shouldShowOSAForConversation(v93);
        v31.useEffect(function() --[[ Line: 391 ]]
            -- upvalues: v94 (copy), v69 (copy), v62 (copy), v23 (ref), v64 (copy)
            if v94 and v69 ~= "" then
                v62(v23(nil, v64.setSquadPrompt, nil, v64.squadLocation, true));
            end;
        end, l_dependencyArray_0(v94, v69, v64.setSquadPrompt, v64.squadLocation));
    end;
    local v95 = l_FFlagEnableSquadRegroupExperimentation_0 and v64.squadLocation == v18.InExperience and v68 and v68.selfPermissions and v68.selfPermissions.canSeeRegroupPromptToast and #v68.members > 1;
    v31.useEffect(function() --[[ Line: 407 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_ExperienceService_0 (ref), v27 (ref)
        if not l_FFlagEnableSquadRegroupExperimentation_0 then
            return function() --[[ Line: 409 ]]

            end;
        else
            local v97 = l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 412 ]]
                -- upvalues: v27 (ref)
                local v96 = v27.getActiveNotifId();
                v27.dismissNotification(v96);
            end);
            return function() --[[ Line: 417 ]]
                -- upvalues: v97 (copy)
                if v97 and v97.Disconnect then
                    v97:Disconnect();
                end;
            end;
        end;
    end, {});
    v31.useEffect(function() --[[ Line: 424 ]]
        -- upvalues: l_FFlagEnableSquadRegroupExperimentation_0 (ref), v27 (ref), v69 (copy)
        if l_FFlagEnableSquadRegroupExperimentation_0 then
            local v98 = v27.getActiveNotifId();
            local v99 = v27.getActiveSquadId();
            if v98 ~= nil and v69 ~= v99 then
                v27.dismissNotification(v98);
            end;
        end;
    end, {
        v69
    });
    return v31.createElement(v31.Fragment, nil, {
        SquadLifecycleEventReceiver = v31.createElement(v6, {
            currentSquadId = v69
        }), 
        SquadParentChannelEventReceiver = if v68 then v31.createElement(v8, {
            currentParentChannelId = v68.parentChannelId
        }) else nil, 
        SquadAppChatEventReceiver = if not l_FFlagSquadAppChatRTNFix_0 and v65 ~= v19.None then v31.createElement(v4, {
            conversationId = if v68 then v68.parentChannelId else nil
        }) else nil, 
        SquadExperienceInviteEventReceiver = v31.createElement(v5, {
            currentSquadId = v69
        }), 
        SquadRccEventReceiver = if v64.squadLocation == v18.InExperience then v31.createElement(v7, {
            currentSquadId = v69
        }) else nil, 
        SquadStorageEventReceiver = v31.createElement(v10), 
        SquadNudgeEventReceiver = v31.createElement(if l_FFlagEnablePartyNudgeV1_DEV_0 then v12 else v11, {
            currentSquadId = v69, 
            currentParentChannelId = v70
        }), 
        ScheduledSquadEventReceiver = if l_FFlagEnableScheduledSquads_0 then v31.createElement(v9) else nil, 
        SquadRegroupPromptEventReceiver = if v95 then v31.createElement(v13, {
            currentSquadMembers = v68 and v68.members or {}, 
            currentSquadId = v69
        }) else nil
    });
end;