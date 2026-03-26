local l_script_FirstAncestor_0 = script:FindFirstAncestor("InAppIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.InterventionTreatmentConfigList);
local l_chatInputBoxDisabledPressedSignal_0 = require(l_Parent_0.InterventionShared).Signals.chatInputBoxDisabledPressedSignal;
local l_featureRestrictionDisplaySignal_0 = require(l_Parent_0.UniversalFeatureRestrictions).Signals.featureRestrictionDisplaySignal;
local l_GetModerationDetail_0 = require(l_Parent_0.InterventionShared).Http.GetModerationDetail;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local l_useIsUserInExperience_0 = require(l_Parent_0.RobloxAppHooks).useIsUserInExperience;
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_FFlagUniversalFeatureRestrictionReceivers_0 = require(l_Parent_0.SharedFlags).FFlagUniversalFeatureRestrictionReceivers;
InAppInterventionEventReceiver = function() --[[ Line: 21 ]] --[[ Name: InAppInterventionEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_useIsUserInExperience_0 (copy), v7 (copy), v3 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy), l_Constants_0 (copy), l_FFlagUniversalFeatureRestrictionReceivers_0 (copy), l_featureRestrictionDisplaySignal_0 (copy), l_GetModerationDetail_0 (copy)
    local v15 = l_useDispatch_0();
    local v17 = v2.useCallback(function(v16) --[[ Line: 24 ]]
        -- upvalues: v15 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v15(l_SetCentralOverlay_0(l_CentralOverlayType_0.InAppIntervention, {
            uiState = v16
        }));
    end, {
        v15
    });
    local v18 = l_useIsUserInExperience_0();
    local v19 = v2.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v18 (copy)
        return {
            isUserInExperience = v18
        };
    end, {
        v18
    });
    local v23 = v2.useCallback(function(v20) --[[ Line: 35 ]]
        -- upvalues: v7 (ref), v19 (copy), v15 (copy), v17 (copy)
        for _, v22 in v7 do
            if v22.shouldTriggerEventReceived(v20, v19) then
                v22.onTriggerEventReceived(v20);
            end;
            if v22.shouldTriggerVisualTreatment(v20, v19) then
                v22.onTriggerVisualTreatment(v15, v17, v20);
            end;
            if v22.shouldTriggerBehavioralTreatment(v20, v19) then
                v22.onTriggerBehavioralTreatment(v20);
            end;
        end;
    end, {
        v7, 
        v17, 
        v19
    });
    v3.useRealtimeNamespace("FeatureIntervention", function(v24) --[[ Line: 49 ]]
        -- upvalues: v23 (copy)
        v23(v24);
    end, {
        v23
    });
    v2.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_getFFlagAppChatEnableIntervention_0 (ref), l_chatInputBoxDisabledPressedSignal_0 (ref), v17 (copy), l_Constants_0 (ref), l_FFlagUniversalFeatureRestrictionReceivers_0 (ref), l_featureRestrictionDisplaySignal_0 (ref), l_GetModerationDetail_0 (ref)
        local v25 = nil;
        if l_getFFlagAppChatEnableIntervention_0() then
            v25 = l_chatInputBoxDisabledPressedSignal_0:connect(function(v26) --[[ Line: 56 ]]
                -- upvalues: v17 (ref), l_Constants_0 (ref)
                v17({
                    interventionDetail = {
                        decisionEventId = v26.decisionEventId, 
                        timeoutDurationSeconds = v26.duration
                    }, 
                    type = l_Constants_0.UIStateActions.ToggleNotificationDialog, 
                    treatmentType = l_Constants_0.TreatmentType.PartyChatTimeoutDialog, 
                    endTime = v26.endTimestamp, 
                    isShown = true
                });
            end);
        end;
        local v27 = nil;
        if l_FFlagUniversalFeatureRestrictionReceivers_0 then
            v27 = l_featureRestrictionDisplaySignal_0:connect(function(v28) --[[ Line: 73 ]]
                -- upvalues: l_GetModerationDetail_0 (ref), v17 (ref), l_Constants_0 (ref)
                local l_abuseVector_0 = v28.abuseVector;
                local l_options_0 = v28.options;
                local v31 = nil;
                l_GetModerationDetail_0({
                    abuseVector = l_abuseVector_0
                }):andThen(function(v32) --[[ Line: 79 ]]
                    -- upvalues: v31 (ref)
                    v31 = v32;
                end):catch(function(_) --[[ Line: 82 ]]

                end):await();
                if not v31 then
                    return;
                elseif not v31.acknowledgeable then
                    return;
                else
                    v17({
                        interventionDetail = {
                            moderationDetail = v31, 
                            options = l_options_0
                        }, 
                        type = l_Constants_0.UIStateActions.ToggleNotificationDialog, 
                        treatmentType = l_Constants_0.TreatmentType.UniversalFeatureRestriction, 
                        isShown = true
                    });
                    return;
                end;
            end);
        end;
        return function() --[[ Line: 110 ]]
            -- upvalues: v25 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), l_FFlagUniversalFeatureRestrictionReceivers_0 (ref), v27 (ref)
            if v25 and l_getFFlagAppChatEnableIntervention_0() then
                v25:disconnect();
            end;
            if l_FFlagUniversalFeatureRestrictionReceivers_0 and v27 then
                v27:disconnect();
            end;
        end;
    end, {});
    return nil;
end;
return InAppInterventionEventReceiver;