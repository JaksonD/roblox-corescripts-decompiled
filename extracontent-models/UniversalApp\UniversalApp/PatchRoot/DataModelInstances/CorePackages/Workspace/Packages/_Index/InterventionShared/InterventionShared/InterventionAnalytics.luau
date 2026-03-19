local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v4.default;
local v6 = {
    InterventionTypes = {
        Nudge = "INTERVENTION_CHAT_NUDGE", 
        Timeout = "INTERVENTION_CHAT_TIMEOUT", 
        PartyChatNudge = "INTERVENTION_PARTY_CHAT_NUDGE", 
        PartyChatTimeout = "INTERVENTION_PARTY_CHAT_TIMEOUT"
    }, 
    CounterNamespaceTypes = {
        PartyChat = "PartyChat"
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
        DialogInterventionDismissSuccess = "EVENT_DIALOG_INTERVENTION_DISMISS_SUCCESS", 
        DialogInterventionDismissFailed = "EVENT_DIALOG_INTERVENTION_DISMISS_FAILED"
    }, 
    EventContext = "InExperienceInterventionEvent", 
    EventName = "InExperienceInterventionEvent"
};
local v18 = {
    eventName = v6.EventName, 
    backends = {
        v4.TelemetryBackends.EventIngest
    }, 
    formatCustomFields = function(v7) --[[ Line: 70 ]]
        -- upvalues: l_Players_0 (copy), v3 (copy), v6 (copy)
        local l_eventType_0 = v7.eventType;
        local l_interventionType_0 = v7.interventionType;
        local l_renderedTimestamp_0 = v7.renderedTimestamp;
        local l_eventId_0 = v7.eventId;
        local l_evidence_0 = v7.evidence;
        local l_duration_0 = v7.duration;
        local l_acknowledgeable_0 = v7.acknowledgeable;
        local v15 = l_Players_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        local v17 = {
            user_id = tostring(v15), 
            timestamp_milliseconds = tostring(l_UnixTimestampMillis_0), 
            event_type = l_eventType_0, 
            intervention_type = l_interventionType_0, 
            event_id = l_eventId_0, 
            evidence = l_evidence_0, 
            timeout_duration_seconds = if l_duration_0 ~= nil then tostring(l_duration_0) else nil, 
            placement = v7.placement
        };
        if l_acknowledgeable_0 ~= nil then
            v17 = v3.Dictionary.join({
                acknowledgeable = tostring(l_acknowledgeable_0)
            }, v17);
        end;
        if l_eventType_0 == v6.EventTypes.CtaClicked or l_eventType_0 == v6.EventTypes.AppealClicked or l_eventType_0 == v6.EventTypes.NudgeToastDismissed or l_eventType_0 == v6.EventTypes.ChatAttemptToastDismissed then
            v17 = v3.Dictionary.join({
                time_to_interact_seconds = tostring((l_UnixTimestampMillis_0 - l_renderedTimestamp_0) / 1000)
            }, v17);
        end;
        if l_eventType_0 == v6.EventTypes.DialogInterventionDismissFailed then
            v17 = v3.Dictionary.join({
                error = v7.error
            }, v17);
        end;
        return v17;
    end
};
local function v21(v19) --[[ Line: 124 ]]
    -- upvalues: v4 (copy)
    return {
        counterSuffix = v19, 
        backends = {
            v4.TelemetryBackends.Counter
        }, 
        formatCustomFields = function(v20) --[[ Line: 128 ]] --[[ Name: formatCustomFields ]]
            return {
                eventType = v20.eventType, 
                interventionType = v20.interventionType, 
                placement = v20.placement
            };
        end
    };
end;
local v22 = {
    MessageReceived = {
        loggingTypes = {
            Event = v18, 
            Counter = v21("Message.Received")
        }, 
        throttlingPercentage = 10000, 
        lastUpdated = {
            2025, 
            3, 
            25
        }, 
        description = "Intervention RTN message Received"
    }, 
    DialogRendered = {
        loggingTypes = {
            Event = v18, 
            Counter = v21("Dialog.Rendered")
        }, 
        throttlingPercentage = 10000, 
        lastUpdated = {
            2025, 
            3, 
            25
        }, 
        description = "Intervention Dialog Rendered"
    }, 
    DialogCtaClicked = {
        loggingTypes = {
            Event = v18, 
            Counter = v21("Dialog.Button.Cta")
        }, 
        throttlingPercentage = 10000, 
        lastUpdated = {
            2025, 
            3, 
            25
        }, 
        description = "Intervention Dialog CTA Clicked"
    }, 
    DialogAppealClicked = {
        loggingTypes = {
            Event = v18, 
            Counter = v21("Dialog.Button.Appeal")
        }, 
        throttlingPercentage = 10000, 
        lastUpdated = {
            2025, 
            3, 
            25
        }, 
        description = "Intervention Dialog Appeal Clicked"
    }, 
    DialogInterventionDismissSuccess = {
        loggingTypes = {
            Event = v18
        }, 
        throttlingPercentage = 10000, 
        lastUpdated = {
            2025, 
            10, 
            20
        }, 
        description = "Intervention Dialog Intervention Dismiss Success"
    }, 
    DialogInterventionDismissFailed = {
        loggingTypes = {
            Event = v18
        }, 
        throttlingPercentage = 10000, 
        lastUpdated = {
            2025, 
            10, 
            20
        }, 
        description = "Intervention Dialog Intervention Dismiss Failed"
    }
};
return {
    sendAnalyticsEvent = function(v23, v24) --[[ Line: 193 ]]
        -- upvalues: l_default_0 (copy)
        local l_loggingTypes_0 = v23.loggingTypes;
        if l_loggingTypes_0.Event then
            local l_Event_0 = l_loggingTypes_0.Event;
            local v27 = l_Event_0.formatCustomFields(v24);
            l_default_0:logRobloxTelemetryEvent({
                eventName = l_Event_0.eventName, 
                backends = l_Event_0.backends, 
                throttlingPercentage = v23.throttlingPercentage, 
                lastUpdated = v23.lastUpdated, 
                description = v23.description, 
                links = v23.links
            }, l_Event_0.standardizedFields or {}, v27);
        end;
        if l_loggingTypes_0.Counter then
            local l_Counter_0 = l_loggingTypes_0.Counter;
            local v29 = l_Counter_0.formatCustomFields(v24);
            local v30 = v24.counterNamespace or "Unknown";
            l_default_0:logRobloxTelemetryCounter({
                eventName = ("Intervention.%*.%*"):format(v30, l_Counter_0.counterSuffix), 
                backends = l_Counter_0.backends, 
                throttlingPercentage = v23.throttlingPercentage, 
                lastUpdated = v23.lastUpdated, 
                description = v23.description, 
                links = v23.links
            }, 1, v29);
        end;
    end, 
    Constants = v6, 
    TelemetryConfigs = v22
};