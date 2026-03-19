local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local v1 = require(l_script_FirstAncestor_0.Utils.Constants);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local v3 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
return {
    configName = "ChatTimeout", 
    shouldTriggerVisualTreatment = function(v4) --[[ Line: 9 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: v1 (copy)
        local v5 = false;
        if v4.type == v1.NotificationDialogType.ChatTimeout then
            v5 = false;
            if v4.abuseVector == v1.AbuseVectorType.ExperienceChat then
                v5 = not v4.acknowledgeable;
            end;
        end;
        return v5;
    end, 
    shouldTriggerBehavioralTreatment = function(v6) --[[ Line: 14 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        -- upvalues: v1 (copy)
        local v7 = false;
        if v6.type == v1.NotificationDialogType.ChatTimeout then
            v7 = v6.abuseVector == v1.AbuseVectorType.ExperienceChat;
        end;
        return v7;
    end, 
    shouldTriggerEventReceived = function(v8) --[[ Line: 18 ]] --[[ Name: shouldTriggerEventReceived ]]
        -- upvalues: v1 (copy)
        local v9 = false;
        if v8.type == v1.NotificationDialogType.ChatTimeout then
            v9 = v8.abuseVector == v1.AbuseVectorType.ExperienceChat;
        end;
        return v9;
    end, 
    onTriggerVisualTreatment = function(v10, v11) --[[ Line: 22 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: v1 (copy)
        v10({
            type = v1.UIStateActions.ToggleNotificationDialog, 
            treatmentType = v1.TreatmentType.ChatTimeoutDialog, 
            isShown = true, 
            detail = v11
        });
    end, 
    onTriggerBehavioralTreatment = function(_) --[[ Line: 30 ]] --[[ Name: onTriggerBehavioralTreatment ]]

    end, 
    onTriggerEventReceived = function(v13) --[[ Line: 33 ]] --[[ Name: onTriggerEventReceived ]]
        -- upvalues: v3 (copy)
        v3.sendAnalyticsEvent(v3.Constants.EventTypes.ModalMessageReceived, v3.Constants.InterventionTypes.Timeout, DateTime.now().UnixTimestampMillis, v13.decisionEventId, v13.evidence, v13.timeoutDurationSeconds);
    end
};