local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.Dash);
local v6 = require(l_script_FirstAncestor_0.Enums.AbuseEntrypoint);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v8 = {
    Abandoned = "EVENT_ABANDONED", 
    Error = "EVENT_ERROR", 
    Rendered = "EVENT_RENDERED", 
    Submitted = "EVENT_SUBMITTED"
};
local v9 = {
    eventName = "DynamicAbuseReportEvent", 
    description = "Event to track dynamic abuse report", 
    lastUpdated = {
        2024, 
        6, 
        18
    }, 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("DynamicAbuseReportThrottleHundredthsPercent", 0), 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/6068"
};
local function v12(v10) --[[ Line: 60 ]] --[[ Name: buildCustomFields ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v6 (copy)
    local v11 = nil;
    if v10.meta then
        v11 = v5.pretty(v10.meta, {
            depth = 10, 
            multiline = false
        });
    end;
    return {
        abuse_vector = v10.context.abuseVector, 
        user_id = if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else 0, 
        event_type = v10.eventType, 
        entry_point = v6.APP, 
        meta = v11
    };
end;
return {
    sendAnalyticsEvent = function(v13) --[[ Line: 76 ]] --[[ Name: sendAnalyticsEvent ]]
        -- upvalues: v4 (copy), l_TelemetryService_0 (copy), v9 (copy), v12 (copy)
        v4.assert(v13.context, "customFields must be provided");
        v4.assert(v13.context.abuseVector, "customFields.abuse_vector must be provided");
        l_TelemetryService_0:LogEvent(v9, {
            customFields = v12(v13)
        });
    end, 
    TelemetryEventType = v8
};