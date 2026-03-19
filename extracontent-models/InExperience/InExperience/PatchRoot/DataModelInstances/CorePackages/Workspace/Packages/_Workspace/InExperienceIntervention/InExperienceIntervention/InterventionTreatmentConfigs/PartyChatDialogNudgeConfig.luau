local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_InterventionAnalytics_0 = require(l_Parent_0.InterventionShared).InterventionAnalytics;
return {
    configName = "PartyChatDialogNudge", 
    shouldTriggerVisualTreatment = function(v5) --[[ Line: 10 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        local v6 = false;
        if v5.type == l_Constants_0.NotificationDialogType.ChatNudge then
            v6 = false;
            if v5.modalType == l_Constants_0.NotificationModalType.Dialog then
                v6 = v5.abuseVector == l_Constants_0.AbuseVectorType.PartyChat;
            end;
        end;
        return v6;
    end, 
    shouldTriggerBehavioralTreatment = function(_) --[[ Line: 15 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        return false;
    end, 
    shouldTriggerEventReceived = function(v8) --[[ Line: 18 ]] --[[ Name: shouldTriggerEventReceived ]]
        -- upvalues: l_Constants_0 (copy)
        local v9 = false;
        if v8.type == l_Constants_0.NotificationDialogType.ChatNudge then
            v9 = false;
            if v8.modalType == l_Constants_0.NotificationModalType.Dialog then
                v9 = v8.abuseVector == l_Constants_0.AbuseVectorType.PartyChat;
            end;
        end;
        return v9;
    end, 
    onTriggerVisualTreatment = function(v10, v11) --[[ Line: 23 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        v10({
            type = l_Constants_0.UIStateActions.ToggleNotificationDialog, 
            treatmentType = l_Constants_0.TreatmentType.PartyChatNudgeDialog, 
            isShown = true, 
            detail = v11
        });
    end, 
    onTriggerBehavioralTreatment = function(_) --[[ Line: 31 ]] --[[ Name: onTriggerBehavioralTreatment ]]

    end, 
    onTriggerEventReceived = function(v13) --[[ Line: 32 ]] --[[ Name: onTriggerEventReceived ]]
        -- upvalues: l_InterventionAnalytics_0 (copy), l_Constants_0 (copy)
        l_InterventionAnalytics_0.sendAnalyticsEvent(l_InterventionAnalytics_0.TelemetryConfigs.MessageReceived, {
            eventType = l_InterventionAnalytics_0.Constants.EventTypes.ModalMessageReceived, 
            counterNamespace = l_InterventionAnalytics_0.Constants.CounterNamespaceTypes.PartyChat, 
            interventionType = l_InterventionAnalytics_0.Constants.InterventionTypes.PartyChatNudge, 
            renderedTimestamp = DateTime.now().UnixTimestampMillis, 
            eventId = v13.decisionEventId, 
            duration = v13.timeoutDurationSeconds, 
            placement = l_Constants_0.InterventionPlacementType.InExperience
        });
    end
};