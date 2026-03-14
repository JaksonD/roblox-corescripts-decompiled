local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Chat_0 = game:GetService("Chat");
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local v7 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.InterventionTreatmentConfigList);
local l_chatInputBoxDisabledPressedSignal_0 = require(l_Parent_0.InterventionShared).Signals.chatInputBoxDisabledPressedSignal;
local l_GetModerationDetail_0 = require(l_Parent_0.InterventionShared).Http.GetModerationDetail;
local v10 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled;
local l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0 = require(l_Parent_0.SharedFlags).GetFFlagCleanInExperienceInterventionReceiverTypeCast;
local v14 = nil;
if l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() or game:GetEngineFeature("EnableFeatureRestrictionManagerEvents") then
    v14 = game:GetService("FeatureRestrictionManager");
end;
InExperienceInterventionEventReceiver = function(v15) --[[ Line: 33 ]] --[[ Name: InExperienceInterventionEventReceiver ]]
    -- upvalues: v5 (copy), l_NotificationService_0 (copy), v10 (copy), l_HttpService_0 (copy), v7 (copy), l_Chat_0 (copy), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (copy), v14 (ref), l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0 (copy), l_GetModerationDetail_0 (copy), v6 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy)
    v5.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: l_NotificationService_0 (ref), v10 (ref), l_HttpService_0 (ref), v7 (ref), v15 (copy), l_Chat_0 (ref), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (ref), v14 (ref), l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0 (ref), l_GetModerationDetail_0 (ref), v6 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), l_chatInputBoxDisabledPressedSignal_0 (ref)
        local v21 = l_NotificationService_0.RobloxEventReceived:Connect(function(v16) --[[ Line: 35 ]]
            -- upvalues: v10 (ref), l_HttpService_0 (ref), v7 (ref), v15 (ref)
            if v16.namespace == v10.FEATURE_INTERV_SIGNAL_NAMESPACE then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 37 ]]
                    -- upvalues: l_HttpService_0 (ref), v16 (copy)
                    return l_HttpService_0:JSONDecode(v16.detail);
                end);
                if not l_status_0 then
                    return;
                else
                    for _, v20 in v7 do
                        if v20.shouldTriggerEventReceived(l_result_0) then
                            v20.onTriggerEventReceived(l_result_0);
                        end;
                        if v20.shouldTriggerVisualTreatment(l_result_0) then
                            v20.onTriggerVisualTreatment(v15.uiStateDispatch, l_result_0);
                        end;
                        if v20.shouldTriggerBehavioralTreatment(l_result_0) then
                            v20.onTriggerBehavioralTreatment(l_result_0);
                        end;
                    end;
                end;
            end;
        end);
        local v24 = l_Chat_0.TimeoutChatAttempt:Connect(function(_, v23) --[[ Line: 59 ]]
            -- upvalues: v15 (ref), v10 (ref)
            v15.uiStateDispatch({
                type = v10.UIStateActions.ToggleNotificationDialog, 
                treatmentType = v10.TreatmentType.ChatTimeoutChatAttempt, 
                endTime = v23, 
                isShown = true
            });
        end);
        local v25 = nil;
        if l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() then
            v25 = v14.TimeoutChatAttempt:Connect(function(_, v27) --[[ Line: 71 ]]
                -- upvalues: v15 (ref), v10 (ref)
                v15.uiStateDispatch({
                    type = v10.UIStateActions.ToggleNotificationDialog, 
                    treatmentType = v10.TreatmentType.ChatTimeoutGameJoin, 
                    endTime = v27, 
                    isShown = true
                });
            end);
        end;
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        if game:GetEngineFeature("EnableFeatureRestrictionManagerEvents") then
            v28 = if l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0() then v14.FeatureTimeoutAttempt:Connect(function(_, v32, v33, v34) --[[ Line: 88 ]]
                -- upvalues: v15 (ref), v10 (ref)
                if v34 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    v15.uiStateDispatch({
                        type = v10.UIStateActions.ToggleNotificationDialog, 
                        treatmentType = v10.TreatmentType.ChatTimeoutChatAttempt, 
                        endTime = v32 + v33, 
                        isShown = true
                    });
                end;
            end) else v14.FeatureTimeoutAttempt:Connect(function(_, v36, v37, v38) --[[ Line: 101 ]]
                -- upvalues: v15 (ref), v10 (ref)
                if v38 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    v15.uiStateDispatch({
                        type = v10.UIStateActions.ToggleNotificationDialog, 
                        treatmentType = v10.TreatmentType.ChatTimeoutChatAttempt, 
                        endTime = v36 + v37, 
                        isShown = true
                    });
                end;
            end);
            v29 = if l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0() then v14.ShowFeatureInterventionDetails:Connect(function(v39) --[[ Line: 116 ]]
                -- upvalues: l_GetModerationDetail_0 (ref), v10 (ref), v6 (ref), v15 (ref)
                if v39 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    local v40 = nil;
                    l_GetModerationDetail_0({
                        abuseVector = v10.AbuseVectorType.ExperienceChat
                    }):andThen(function(v41) --[[ Line: 121 ]]
                        -- upvalues: v40 (ref)
                        v40 = v41;
                    end):catch(function(v42) --[[ Line: 124 ]]
                        -- upvalues: v6 (ref)
                        v6.sendAnalyticsEvent(v6.Constants.EventTypes.GetModerationDetailFailed, nil, DateTime.now().UnixTimestampMillis, nil, nil, nil, v42.error);
                    end):await();
                    if not v40 then
                        return;
                    elseif not v40.acknowledgeable then
                        return;
                    else
                        local l_punishmentTypeDescription_0 = v40.punishmentTypeDescription;
                        if l_punishmentTypeDescription_0 == v10.PunishmentTypeDescription.ChatTimeout then
                            v15.uiStateDispatch({
                                type = v10.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v10.TreatmentType.ChatTimeoutDialogV2, 
                                detail = {
                                    moderationDetail = v40
                                }, 
                                isShown = true
                            });
                        elseif l_punishmentTypeDescription_0 == v10.PunishmentTypeDescription.ChatNudge then
                            v15.uiStateDispatch({
                                type = v10.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v10.TreatmentType.ChatNudgeDialogV2, 
                                detail = {
                                    moderationDetail = v40
                                }, 
                                isShown = true
                            });
                        end;
                        --[[ close >= 1 ]]
                    end;
                end;
            end) else v14.ShowFeatureInterventionDetails:Connect(function(v44) --[[ Line: 173 ]]
                -- upvalues: l_GetModerationDetail_0 (ref), v10 (ref), v6 (ref), v15 (ref)
                if v44 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    local v45 = nil;
                    l_GetModerationDetail_0({
                        abuseVector = v10.AbuseVectorType.ExperienceChat
                    }):andThen(function(v46) --[[ Line: 178 ]]
                        -- upvalues: v45 (ref)
                        v45 = v46;
                    end):catch(function(v47) --[[ Line: 181 ]]
                        -- upvalues: v6 (ref)
                        v6.sendAnalyticsEvent(v6.Constants.EventTypes.GetModerationDetailFailed, nil, DateTime.now().UnixTimestampMillis, nil, nil, nil, v47.error);
                    end):await();
                    if not v45 then
                        return;
                    elseif not v45.acknowledgeable then
                        return;
                    else
                        local l_punishmentTypeDescription_1 = v45.punishmentTypeDescription;
                        if l_punishmentTypeDescription_1 == v10.PunishmentTypeDescription.ChatTimeout then
                            v15.uiStateDispatch({
                                type = v10.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v10.TreatmentType.ChatTimeoutDialogV2, 
                                detail = {
                                    moderationDetail = v45
                                }, 
                                isShown = true
                            });
                        elseif l_punishmentTypeDescription_1 == v10.PunishmentTypeDescription.ChatNudge then
                            v15.uiStateDispatch({
                                type = v10.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v10.TreatmentType.ChatNudgeDialogV2, 
                                detail = {
                                    moderationDetail = v45
                                }, 
                                isShown = true
                            });
                        end;
                        --[[ close >= 1 ]]
                    end;
                end;
            end);
            v30 = if l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0() then v14.FeatureTimeoutRestored:Connect(function(v49) --[[ Line: 232 ]]
                print("FeatureTimeoutRestored - Abuse Vector: ", v49);
            end) else v14.FeatureTimeoutRestored:Connect(function(v50) --[[ Line: 239 ]]
                print("FeatureTimeoutRestored - Abuse Vector: ", v50);
            end);
        end;
        local v51 = nil;
        if l_getFFlagAppChatEnableIntervention_0() then
            v51 = l_chatInputBoxDisabledPressedSignal_0:connect(function(v52) --[[ Line: 249 ]]
                -- upvalues: v15 (ref), v10 (ref)
                v15.uiStateDispatch({
                    detail = {
                        decisionEventId = v52.decisionEventId, 
                        timeoutDurationSeconds = v52.duration
                    }, 
                    type = v10.UIStateActions.ToggleNotificationDialog, 
                    treatmentType = v10.TreatmentType.PartyChatTimeoutDialog, 
                    endTime = v52.endTimestamp, 
                    isShown = true
                });
            end);
        end;
        return function() --[[ Line: 263 ]]
            -- upvalues: v21 (copy), v24 (copy), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (ref), v25 (ref), v28 (ref), v29 (ref), v30 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), v51 (ref)
            v21:Disconnect();
            v24:Disconnect();
            if l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() then
                v25:Disconnect();
            end;
            if game:GetEngineFeature("EnableFeatureRestrictionManagerEvents") then
                v28:Disconnect();
                v29:Disconnect();
                v30:Disconnect();
            end;
            if l_getFFlagAppChatEnableIntervention_0() and v51 then
                v51:disconnect();
            end;
        end;
    end, {});
    return v5.createElement("Frame", {});
end;
return InExperienceInterventionEventReceiver;