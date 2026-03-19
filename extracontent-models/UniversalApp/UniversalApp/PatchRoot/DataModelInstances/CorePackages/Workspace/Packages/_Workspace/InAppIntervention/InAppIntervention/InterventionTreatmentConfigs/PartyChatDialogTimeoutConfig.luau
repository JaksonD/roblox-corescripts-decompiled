local l_script_FirstAncestor_0 = script:FindFirstAncestor("InAppIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_InterventionAnalytics_0 = require(l_Parent_0.InterventionShared).InterventionAnalytics;
local l_partyChatTimeoutReceivedSignal_0 = require(l_Parent_0.InterventionShared).Signals.partyChatTimeoutReceivedSignal;
return {
    configName = "PartyChatDialogNudge", 
    shouldTriggerVisualTreatment = function(v6, v7) --[[ Line: 11 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        local v8 = false;
        if v6.type == l_Constants_0.NotificationDialogType.ChatTimeout then
            v8 = false;
            if v6.abuseVector == l_Constants_0.AbuseVectorType.PartyChat then
                v8 = not v7.isUserInExperience;
            end;
        end;
        return v8;
    end, 
    shouldTriggerBehavioralTreatment = function(v9) --[[ Line: 16 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        local v10 = false;
        if v9.type == l_Constants_0.NotificationDialogType.ChatTimeout then
            v10 = v9.abuseVector == l_Constants_0.AbuseVectorType.PartyChat;
        end;
        return v10;
    end, 
    shouldTriggerEventReceived = function(v11, v12) --[[ Line: 20 ]] --[[ Name: shouldTriggerEventReceived ]]
        -- upvalues: l_Constants_0 (copy)
        local v13 = false;
        if v11.type == l_Constants_0.NotificationDialogType.ChatTimeout then
            v13 = false;
            if v11.abuseVector == l_Constants_0.AbuseVectorType.PartyChat then
                v13 = not v12.isUserInExperience;
            end;
        end;
        return v13;
    end, 
    onTriggerVisualTreatment = function(_, v15, v16) --[[ Line: 25 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        v15({
            type = l_Constants_0.UIStateActions.ToggleNotificationDialog, 
            treatmentType = l_Constants_0.TreatmentType.PartyChatTimeoutDialog, 
            isShown = true, 
            endTime = DateTime.now().UnixTimestamp + v16.timeoutDurationSeconds, 
            interventionDetail = v16
        });
    end, 
    onTriggerBehavioralTreatment = function(v17) --[[ Line: 38 ]] --[[ Name: onTriggerBehavioralTreatment ]]
        -- upvalues: l_partyChatTimeoutReceivedSignal_0 (copy)
        l_partyChatTimeoutReceivedSignal_0:fire(v17.vectorTargetId);
    end, 
    onTriggerEventReceived = function(v18) --[[ Line: 41 ]] --[[ Name: onTriggerEventReceived ]]
        -- upvalues: l_InterventionAnalytics_0 (copy), l_Constants_0 (copy)
        l_InterventionAnalytics_0.sendAnalyticsEvent(l_InterventionAnalytics_0.TelemetryConfigs.MessageReceived, {
            eventType = l_InterventionAnalytics_0.Constants.EventTypes.ModalMessageReceived, 
            counterNamespace = l_InterventionAnalytics_0.Constants.CounterNamespaceTypes.PartyChat, 
            interventionType = l_InterventionAnalytics_0.Constants.InterventionTypes.PartyChatTimeout, 
            renderedTimestamp = DateTime.now().UnixTimestampMillis, 
            eventId = v18.decisionEventId, 
            duration = v18.timeoutDurationSeconds, 
            placement = l_Constants_0.InterventionPlacementType.InApp
        });
    end
};