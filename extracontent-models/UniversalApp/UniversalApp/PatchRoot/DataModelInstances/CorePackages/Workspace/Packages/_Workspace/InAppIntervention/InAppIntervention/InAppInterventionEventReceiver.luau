local l_script_FirstAncestor_0 = script:FindFirstAncestor("InAppIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_script_FirstAncestor_0.InterventionTreatmentConfigs.InterventionTreatmentConfigList);
local l_chatInputBoxDisabledPressedSignal_0 = require(l_Parent_0.InterventionShared).Signals.chatInputBoxDisabledPressedSignal;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local l_useIsUserInExperience_0 = require(l_Parent_0.RobloxAppHooks).useIsUserInExperience;
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
InAppInterventionEventReceiver = function() --[[ Line: 16 ]] --[[ Name: InAppInterventionEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_useIsUserInExperience_0 (copy), v7 (copy), v3 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy), l_Constants_0 (copy)
    local v12 = l_useDispatch_0();
    local v14 = v2.useCallback(function(v13) --[[ Line: 19 ]]
        -- upvalues: v12 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v12(l_SetCentralOverlay_0(l_CentralOverlayType_0.InAppIntervention, {
            uiState = v13
        }));
    end, {
        v12
    });
    local v15 = l_useIsUserInExperience_0();
    local v16 = v2.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v15 (copy)
        return {
            isUserInExperience = v15
        };
    end, {
        v15
    });
    local v20 = v2.useCallback(function(v17) --[[ Line: 30 ]]
        -- upvalues: v7 (ref), v16 (copy), v12 (copy), v14 (copy)
        for _, v19 in v7 do
            if v19.shouldTriggerEventReceived(v17, v16) then
                v19.onTriggerEventReceived(v17);
            end;
            if v19.shouldTriggerVisualTreatment(v17, v16) then
                v19.onTriggerVisualTreatment(v12, v14, v17);
            end;
            if v19.shouldTriggerBehavioralTreatment(v17, v16) then
                v19.onTriggerBehavioralTreatment(v17);
            end;
        end;
    end, {
        v7, 
        v14, 
        v16
    });
    v3.useRealtimeNamespace("FeatureIntervention", function(v21) --[[ Line: 44 ]]
        -- upvalues: v20 (copy)
        v20(v21);
    end, {
        v20
    });
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: l_getFFlagAppChatEnableIntervention_0 (ref), l_chatInputBoxDisabledPressedSignal_0 (ref), v14 (copy), l_Constants_0 (ref)
        local v22 = nil;
        if l_getFFlagAppChatEnableIntervention_0() then
            v22 = l_chatInputBoxDisabledPressedSignal_0:connect(function(v23) --[[ Line: 51 ]]
                -- upvalues: v14 (ref), l_Constants_0 (ref)
                v14({
                    interventionDetail = {
                        decisionEventId = v23.decisionEventId, 
                        timeoutDurationSeconds = v23.duration
                    }, 
                    type = l_Constants_0.UIStateActions.ToggleNotificationDialog, 
                    treatmentType = l_Constants_0.TreatmentType.PartyChatTimeoutDialog, 
                    endTime = v23.endTimestamp, 
                    isShown = true
                });
            end);
        end;
        return function() --[[ Line: 65 ]]
            -- upvalues: v22 (ref), l_getFFlagAppChatEnableIntervention_0 (ref)
            if v22 and l_getFFlagAppChatEnableIntervention_0() then
                v22:disconnect();
            end;
        end;
    end, {});
    return nil;
end;
return InAppInterventionEventReceiver;