local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local v5 = require(l_Parent_0.Cryo);
local v6 = l_EventIngest_0.new(l_EventIngestService_0);
local v7 = {
    InterventionTypes = {
        Nudge = "INTERVENTION_CHAT_NUDGE", 
        Timeout = "INTERVENTION_CHAT_TIMEOUT", 
        PartyChatNudge = "INTERVENTION_PARTY_CHAT_NUDGE", 
        PartyChatTimeout = "INTERVENTION_PARTY_CHAT_TIMEOUT"
    }, 
    EventTypes = {
        AppealClicked = "EVENT_APPEAL_CLICKED", 
        CtaClicked = "EVENT_CTA_CLICKED", 
        ModalAppeared = "EVENT_MODAL_APPEARED", 
        ModalMessageReceived = "EVENT_MODAL_MESSAGE_RECEIVED", 
        ToastMessageReceived = "EVENT_TOAST_MESSAGE_RECEIVED", 
        NudgeToastAppeared = "EVENT_NUDGE_TOAST_APPEARED", 
        NudgeToastDismissed = "EVENT_NUDGE_TOAST_DISMISSED", 
        ChatAttemptToastAppeared = "EVENT_CHAT_ATTEMPT_TOAST_APPEARED", 
        ChatAttemptToastDismissed = "EVENT_CHAT_ATTEMPT_TOAST_DISMISSED", 
        GetModerationDetailFailed = "EVENT_GET_MODERATION_DETAIL_FAILED"
    }, 
    EventContext = "InExperienceInterventionEvent", 
    EventName = "InExperienceInterventionEvent"
};
local v8 = 0;
if l_LocalPlayer_0 then
    v8 = l_LocalPlayer_0.UserId;
end;
local function v19(v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 43 ]]
    -- upvalues: v8 (ref), v7 (copy), v5 (copy)
    local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
    local v18 = {
        user_id = v8, 
        timestamp_milliseconds = l_UnixTimestampMillis_0, 
        event_type = v9, 
        intervention_type = v10, 
        event_id = v12, 
        evidence = v13, 
        timeout_duration_seconds = v14, 
        acknowledgeable = v16
    };
    if v9 == v7.EventTypes.CtaClicked or v9 == v7.EventTypes.AppealClicked or v9 == v7.EventTypes.NudgeToastDismissed or v9 == v7.EventTypes.ChatAttemptToastDismissed then
        v18 = v5.Dictionary.join({
            time_to_interact_seconds = (l_UnixTimestampMillis_0 - v11) / 1000
        }, v18);
    end;
    if v9 == v7.EventTypes.GetModerationDetailFailed then
        v18 = v5.Dictionary.join({
            error = v15
        }, v18);
    end;
    return v18;
end;
return {
    sendAnalyticsEvent = function(v20, v21, v22, v23, v24, v25, v26, v27) --[[ Line: 85 ]]
        -- upvalues: v6 (copy), v7 (copy), v19 (copy)
        v6:sendEventDeferred(v7.EventContext, v7.EventName, (v19(v20, v21, v22, v23, v24, v25, v26, v27)));
    end, 
    Constants = v7
};