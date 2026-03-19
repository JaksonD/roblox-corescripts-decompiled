local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_InterventionAnalytics_0 = require(l_Parent_0.InterventionShared).InterventionAnalytics;
local l_partyChatTimeoutReceivedSignal_0 = require(l_Parent_0.InterventionShared).Signals.partyChatTimeoutReceivedSignal;
return {
    configName = "PartyChatDialogNudge", 
    shouldTriggerVisualTreatment = function(v6) --[[ Line: 11 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        local v7 = false;
        if v6.type == l_Constants_0.NotificationDialogType.ChatTimeout then
            v7 = v6.abuseVector == l_Constants_0.AbuseVectorType.PartyChat;
        end;
        return v7;
    end, 
    shouldTriggerBehavioralTreatment = function(v8) --[[ Line: 15 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        local v9 = false;
        if v8.type == l_Constants_0.NotificationDialogType.ChatTimeout then
            v9 = v8.abuseVector == l_Constants_0.AbuseVectorType.PartyChat;
        end;
        return v9;
    end, 
    shouldTriggerEventReceived = function(v10) --[[ Line: 19 ]] --[[ Name: shouldTriggerEventReceived ]]
        -- upvalues: l_Constants_0 (copy)
        local v11 = false;
        if v10.type == l_Constants_0.NotificationDialogType.ChatTimeout then
            v11 = v10.abuseVector == l_Constants_0.AbuseVectorType.PartyChat;
        end;
        return v11;
    end, 
    onTriggerVisualTreatment = function(v12, v13) --[[ Line: 23 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        v12({
            type = l_Constants_0.UIStateActions.ToggleNotificationDialog, 
            treatmentType = l_Constants_0.TreatmentType.PartyChatTimeoutDialog, 
            isShown = true, 
            endTime = DateTime.now().UnixTimestamp + v13.timeoutDurationSeconds, 
            detail = v13
        });
    end, 
    onTriggerBehavioralTreatment = function(v14) --[[ Line: 32 ]] --[[ Name: onTriggerBehavioralTreatment ]]
        -- upvalues: l_partyChatTimeoutReceivedSignal_0 (copy)
        l_partyChatTimeoutReceivedSignal_0:fire(v14.vectorTargetId);
    end, 
    onTriggerEventReceived = function(v15) --[[ Line: 35 ]] --[[ Name: onTriggerEventReceived ]]
        -- upvalues: l_InterventionAnalytics_0 (copy), l_Constants_0 (copy)
        l_InterventionAnalytics_0.sendAnalyticsEvent(l_InterventionAnalytics_0.TelemetryConfigs.MessageReceived, {
            eventType = l_InterventionAnalytics_0.Constants.EventTypes.ModalMessageReceived, 
            counterNamespace = l_InterventionAnalytics_0.Constants.CounterNamespaceTypes.PartyChat, 
            interventionType = l_InterventionAnalytics_0.Constants.InterventionTypes.PartyChatTimeout, 
            renderedTimestamp = DateTime.now().UnixTimestampMillis, 
            eventId = v15.decisionEventId, 
            duration = v15.timeoutDurationSeconds, 
            placement = l_Constants_0.InterventionPlacementType.InExperience
        });
    end
};