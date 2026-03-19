local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local v1 = require(l_script_FirstAncestor_0.Utils.Constants);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local v3 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
return {
    configName = "ChatToastNudge", 
    shouldTriggerVisualTreatment = function(v4) --[[ Line: 8 ]] --[[ Name: shouldTriggerVisualTreatment ]]
        -- upvalues: v1 (copy)
        local v5 = false;
        if v4.type == v1.NotificationDialogType.ChatNudge then
            v5 = false;
            if v4.modalType == v1.NotificationModalType.Toast then
                v5 = v4.abuseVector == v1.AbuseVectorType.ExperienceChat;
            end;
        end;
        return v5;
    end, 
    shouldTriggerBehavioralTreatment = function(_) --[[ Line: 13 ]] --[[ Name: shouldTriggerBehavioralTreatment ]]
        return false;
    end, 
    shouldTriggerEventReceived = function(v7) --[[ Line: 16 ]] --[[ Name: shouldTriggerEventReceived ]]
        -- upvalues: v1 (copy)
        local v8 = false;
        if v7.type == v1.NotificationDialogType.ChatNudge then
            v8 = false;
            if v7.modalType == v1.NotificationModalType.Toast then
                v8 = v7.abuseVector == v1.AbuseVectorType.ExperienceChat;
            end;
        end;
        return v8;
    end, 
    onTriggerVisualTreatment = function(v9, v10) --[[ Line: 21 ]] --[[ Name: onTriggerVisualTreatment ]]
        -- upvalues: v1 (copy)
        v9({
            type = v1.UIStateActions.ToggleNotificationDialog, 
            treatmentType = v1.TreatmentType.ChatNudgeToast, 
            isShown = true, 
            detail = v10
        });
    end, 
    onTriggerBehavioralTreatment = function(_) --[[ Line: 29 ]] --[[ Name: onTriggerBehavioralTreatment ]]

    end, 
    onTriggerEventReceived = function(v12) --[[ Line: 30 ]] --[[ Name: onTriggerEventReceived ]]
        -- upvalues: v3 (copy)
        v3.sendAnalyticsEvent(v3.Constants.EventTypes.ToastMessageReceived, v3.Constants.InterventionTypes.Nudge, DateTime.now().UnixTimestampMillis, v12.decisionEventId, v12.evidence, v12.timeoutDurationSeconds);
    end
};