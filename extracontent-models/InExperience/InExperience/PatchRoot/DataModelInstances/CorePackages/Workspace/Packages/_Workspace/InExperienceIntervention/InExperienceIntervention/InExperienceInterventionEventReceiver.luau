local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Chat_0 = game:GetService("Chat");
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local v7 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.InterventionTreatmentConfigList);
local l_chatInputBoxDisabledPressedSignal_0 = require(l_Parent_0.InterventionShared).Signals.chatInputBoxDisabledPressedSignal;
local l_featureRestrictionDisplaySignal_0 = require(l_Parent_0.UniversalFeatureRestrictions).Signals.featureRestrictionDisplaySignal;
local l_GetModerationDetail_0 = require(l_Parent_0.InterventionShared).Http.GetModerationDetail;
local v11 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagGameJoinTimeoutChatAttemptEnabled;
local l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0 = require(l_Parent_0.SharedFlags).GetFFlagCleanInExperienceInterventionReceiverTypeCast;
local l_FFlagUniversalFeatureRestrictionReceivers_0 = require(l_Parent_0.SharedFlags).FFlagUniversalFeatureRestrictionReceivers;
local v16 = nil;
if l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() or game:GetEngineFeature("EnableFeatureRestrictionManagerEvents") then
    v16 = game:GetService("FeatureRestrictionManager");
end;
InExperienceInterventionEventReceiver = function(v17) --[[ Line: 37 ]] --[[ Name: InExperienceInterventionEventReceiver ]]
    -- upvalues: v5 (copy), l_NotificationService_0 (copy), v11 (copy), l_HttpService_0 (copy), v7 (copy), l_Chat_0 (copy), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (copy), v16 (ref), l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0 (copy), l_GetModerationDetail_0 (copy), v6 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy), l_FFlagUniversalFeatureRestrictionReceivers_0 (copy), l_featureRestrictionDisplaySignal_0 (copy)
    v5.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: l_NotificationService_0 (ref), v11 (ref), l_HttpService_0 (ref), v7 (ref), v17 (copy), l_Chat_0 (ref), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (ref), v16 (ref), l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0 (ref), l_GetModerationDetail_0 (ref), v6 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), l_chatInputBoxDisabledPressedSignal_0 (ref), l_FFlagUniversalFeatureRestrictionReceivers_0 (ref), l_featureRestrictionDisplaySignal_0 (ref)
        local v23 = l_NotificationService_0.RobloxEventReceived:Connect(function(v18) --[[ Line: 39 ]]
            -- upvalues: v11 (ref), l_HttpService_0 (ref), v7 (ref), v17 (ref)
            if v18.namespace == v11.FEATURE_INTERV_SIGNAL_NAMESPACE then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
                    -- upvalues: l_HttpService_0 (ref), v18 (copy)
                    return l_HttpService_0:JSONDecode(v18.detail);
                end);
                if not l_status_0 then
                    return;
                else
                    for _, v22 in v7 do
                        if v22.shouldTriggerEventReceived(l_result_0) then
                            v22.onTriggerEventReceived(l_result_0);
                        end;
                        if v22.shouldTriggerVisualTreatment(l_result_0) then
                            v22.onTriggerVisualTreatment(v17.uiStateDispatch, l_result_0);
                        end;
                        if v22.shouldTriggerBehavioralTreatment(l_result_0) then
                            v22.onTriggerBehavioralTreatment(l_result_0);
                        end;
                    end;
                end;
            end;
        end);
        local v26 = l_Chat_0.TimeoutChatAttempt:Connect(function(_, v25) --[[ Line: 63 ]]
            -- upvalues: v17 (ref), v11 (ref)
            v17.uiStateDispatch({
                type = v11.UIStateActions.ToggleNotificationDialog, 
                treatmentType = v11.TreatmentType.ChatTimeoutChatAttempt, 
                endTime = v25, 
                isShown = true
            });
        end);
        local v27 = nil;
        if l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() then
            v27 = v16.TimeoutChatAttempt:Connect(function(_, v29) --[[ Line: 75 ]]
                -- upvalues: v17 (ref), v11 (ref)
                v17.uiStateDispatch({
                    type = v11.UIStateActions.ToggleNotificationDialog, 
                    treatmentType = v11.TreatmentType.ChatTimeoutGameJoin, 
                    endTime = v29, 
                    isShown = true
                });
            end);
        end;
        local v30 = nil;
        local v31 = nil;
        local v32 = nil;
        if game:GetEngineFeature("EnableFeatureRestrictionManagerEvents") then
            v30 = if l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0() then v16.FeatureTimeoutAttempt:Connect(function(_, v34, v35, v36) --[[ Line: 92 ]]
                -- upvalues: v17 (ref), v11 (ref)
                if v36 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    v17.uiStateDispatch({
                        type = v11.UIStateActions.ToggleNotificationDialog, 
                        treatmentType = v11.TreatmentType.ChatTimeoutChatAttempt, 
                        endTime = v34 + v35, 
                        isShown = true
                    });
                end;
            end) else v16.FeatureTimeoutAttempt:Connect(function(_, v38, v39, v40) --[[ Line: 105 ]]
                -- upvalues: v17 (ref), v11 (ref)
                if v40 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    v17.uiStateDispatch({
                        type = v11.UIStateActions.ToggleNotificationDialog, 
                        treatmentType = v11.TreatmentType.ChatTimeoutChatAttempt, 
                        endTime = v38 + v39, 
                        isShown = true
                    });
                end;
            end);
            v31 = if l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0() then v16.ShowFeatureInterventionDetails:Connect(function(v41) --[[ Line: 120 ]]
                -- upvalues: l_GetModerationDetail_0 (ref), v11 (ref), v6 (ref), v17 (ref)
                if v41 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    local v42 = nil;
                    l_GetModerationDetail_0({
                        abuseVector = v11.AbuseVectorType.ExperienceChat
                    }):andThen(function(v43) --[[ Line: 125 ]]
                        -- upvalues: v42 (ref)
                        v42 = v43;
                    end):catch(function(v44) --[[ Line: 128 ]]
                        -- upvalues: v6 (ref)
                        v6.sendAnalyticsEvent(v6.Constants.EventTypes.GetModerationDetailFailed, nil, DateTime.now().UnixTimestampMillis, nil, nil, nil, v44.error);
                    end):await();
                    if not v42 then
                        return;
                    elseif not v42.acknowledgeable then
                        return;
                    else
                        local l_punishmentTypeDescription_0 = v42.punishmentTypeDescription;
                        if l_punishmentTypeDescription_0 == v11.PunishmentTypeDescription.ChatTimeout then
                            v17.uiStateDispatch({
                                type = v11.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v11.TreatmentType.ChatTimeoutDialogV2, 
                                detail = {
                                    moderationDetail = v42
                                }, 
                                isShown = true
                            });
                        elseif l_punishmentTypeDescription_0 == v11.PunishmentTypeDescription.ChatNudge then
                            v17.uiStateDispatch({
                                type = v11.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v11.TreatmentType.ChatNudgeDialogV2, 
                                detail = {
                                    moderationDetail = v42
                                }, 
                                isShown = true
                            });
                        end;
                        --[[ close >= 1 ]]
                    end;
                end;
            end) else v16.ShowFeatureInterventionDetails:Connect(function(v46) --[[ Line: 177 ]]
                -- upvalues: l_GetModerationDetail_0 (ref), v11 (ref), v6 (ref), v17 (ref)
                if v46 == Enum.FeatureRestrictionAbuseVector.ExperienceChat then
                    local v47 = nil;
                    l_GetModerationDetail_0({
                        abuseVector = v11.AbuseVectorType.ExperienceChat
                    }):andThen(function(v48) --[[ Line: 182 ]]
                        -- upvalues: v47 (ref)
                        v47 = v48;
                    end):catch(function(v49) --[[ Line: 185 ]]
                        -- upvalues: v6 (ref)
                        v6.sendAnalyticsEvent(v6.Constants.EventTypes.GetModerationDetailFailed, nil, DateTime.now().UnixTimestampMillis, nil, nil, nil, v49.error);
                    end):await();
                    if not v47 then
                        return;
                    elseif not v47.acknowledgeable then
                        return;
                    else
                        local l_punishmentTypeDescription_1 = v47.punishmentTypeDescription;
                        if l_punishmentTypeDescription_1 == v11.PunishmentTypeDescription.ChatTimeout then
                            v17.uiStateDispatch({
                                type = v11.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v11.TreatmentType.ChatTimeoutDialogV2, 
                                detail = {
                                    moderationDetail = v47
                                }, 
                                isShown = true
                            });
                        elseif l_punishmentTypeDescription_1 == v11.PunishmentTypeDescription.ChatNudge then
                            v17.uiStateDispatch({
                                type = v11.UIStateActions.ToggleNotificationDialog, 
                                treatmentType = v11.TreatmentType.ChatNudgeDialogV2, 
                                detail = {
                                    moderationDetail = v47
                                }, 
                                isShown = true
                            });
                        end;
                        --[[ close >= 1 ]]
                    end;
                end;
            end);
            v32 = if l_GetFFlagCleanInExperienceInterventionReceiverTypeCast_0() then v16.FeatureTimeoutRestored:Connect(function(v51) --[[ Line: 236 ]]
                print("FeatureTimeoutRestored - Abuse Vector: ", v51);
            end) else v16.FeatureTimeoutRestored:Connect(function(v52) --[[ Line: 243 ]]
                print("FeatureTimeoutRestored - Abuse Vector: ", v52);
            end);
        end;
        local v53 = nil;
        if l_getFFlagAppChatEnableIntervention_0() then
            v53 = l_chatInputBoxDisabledPressedSignal_0:connect(function(v54) --[[ Line: 253 ]]
                -- upvalues: v17 (ref), v11 (ref)
                v17.uiStateDispatch({
                    detail = {
                        decisionEventId = v54.decisionEventId, 
                        timeoutDurationSeconds = v54.duration
                    }, 
                    type = v11.UIStateActions.ToggleNotificationDialog, 
                    treatmentType = v11.TreatmentType.PartyChatTimeoutDialog, 
                    endTime = v54.endTimestamp, 
                    isShown = true
                });
            end);
        end;
        local v55 = nil;
        if l_FFlagUniversalFeatureRestrictionReceivers_0 then
            v55 = l_featureRestrictionDisplaySignal_0:connect(function(v56) --[[ Line: 270 ]]
                -- upvalues: l_GetModerationDetail_0 (ref), v17 (ref), v11 (ref)
                local l_abuseVector_0 = v56.abuseVector;
                local l_options_0 = v56.options;
                local v59 = nil;
                l_GetModerationDetail_0({
                    abuseVector = l_abuseVector_0
                }):andThen(function(v60) --[[ Line: 276 ]]
                    -- upvalues: v59 (ref)
                    v59 = v60;
                end):catch(function(_) --[[ Line: 279 ]]

                end):await();
                if not v59 then
                    return;
                elseif not v59.acknowledgeable then
                    return;
                else
                    v17.uiStateDispatch({
                        type = v11.UIStateActions.ToggleNotificationDialog, 
                        treatmentType = v11.TreatmentType.UniversalFeatureRestriction, 
                        detail = {
                            moderationDetail = v59, 
                            options = l_options_0
                        }, 
                        isShown = true
                    });
                    return;
                end;
            end);
        end;
        return function() --[[ Line: 306 ]]
            -- upvalues: v23 (copy), v26 (copy), l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0 (ref), v27 (ref), v30 (ref), v31 (ref), v32 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), v53 (ref), l_FFlagUniversalFeatureRestrictionReceivers_0 (ref), v55 (ref)
            v23:Disconnect();
            v26:Disconnect();
            if l_GetFFlagGameJoinTimeoutChatAttemptEnabled_0() then
                v27:Disconnect();
            end;
            if game:GetEngineFeature("EnableFeatureRestrictionManagerEvents") then
                v30:Disconnect();
                v31:Disconnect();
                v32:Disconnect();
            end;
            if l_getFFlagAppChatEnableIntervention_0() and v53 then
                v53:disconnect();
            end;
            if l_FFlagUniversalFeatureRestrictionReceivers_0 and v55 then
                v55:disconnect();
            end;
        end;
    end, {});
    return v5.createElement("Frame", {});
end;
return InExperienceInterventionEventReceiver;