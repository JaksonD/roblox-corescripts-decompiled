local l_script_FirstAncestor_0 = script:FindFirstAncestor("InAppIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local l_InterventionAnalytics_0 = require(l_Parent_0.InterventionShared).InterventionAnalytics;
return {
    configName = "PartyChatDialogNudge", 
    shouldTriggerVisualTreatment = function(v5, v6) --[[ Line: 10 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        local v7 = false;
        if v5.type == l_Constants_0.NotificationDialogType.ChatNudge then
            v7 = false;
            if v5.modalType == l_Constants_0.NotificationModalType.Dialog then
                v7 = false;
                if v5.abuseVector == l_Constants_0.AbuseVectorType.PartyChat then
                    v7 = not v6.isUserInExperience;
                end;
            end;
        end;
        return v7;
    end, 
    shouldTriggerBehavioralTreatment = function(_) --[[ Line: 16 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        return false;
    end, 
    shouldTriggerEventReceived = function(v9, v10) --[[ Line: 19 ]] --[[ Name: shouldTriggerEventReceived ]]
        -- upvalues: l_Constants_0 (copy)
        local v11 = false;
        if v9.type == l_Constants_0.NotificationDialogType.ChatNudge then
            v11 = false;
            if v9.modalType == l_Constants_0.NotificationModalType.Dialog then
                v11 = false;
                if v9.abuseVector == l_Constants_0.AbuseVectorType.PartyChat then
                    v11 = not v10.isUserInExperience;
                end;
            end;
        end;
        return v11;
    end, 
    onTriggerVisualTreatment = function(_, v13, v14) --[[ Line: 25 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: l_Constants_0 (copy)
        v13({
            type = l_Constants_0.UIStateActions.ToggleNotificationDialog, 
            treatmentType = l_Constants_0.TreatmentType.PartyChatNudgeDialog, 
            isShown = true, 
            interventionDetail = v14
        });
    end, 
    onTriggerBehavioralTreatment = function(_) --[[ Line: 37 ]] --[[ Name: onTriggerBehavioralTreatment ]]

    end, 
    onTriggerEventReceived = function(v16) --[[ Line: 38 ]] --[[ Name: onTriggerEventReceived ]]
        -- upvalues: l_InterventionAnalytics_0 (copy), l_Constants_0 (copy)
        l_InterventionAnalytics_0.sendAnalyticsEvent(l_InterventionAnalytics_0.TelemetryConfigs.MessageReceived, {
            eventType = l_InterventionAnalytics_0.Constants.EventTypes.ModalMessageReceived, 
            counterNamespace = l_InterventionAnalytics_0.Constants.CounterNamespaceTypes.PartyChat, 
            interventionType = l_InterventionAnalytics_0.Constants.InterventionTypes.PartyChatNudge, 
            renderedTimestamp = DateTime.now().UnixTimestampMillis, 
            eventId = v16.decisionEventId, 
            duration = v16.timeoutDurationSeconds, 
            placement = l_Constants_0.InterventionPlacementType.InApp
        });
    end
};