local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = game:DefineFastInt("FIntCrossExperienceEventThrottleHunderedthsPercent", 10000);
logEvent = function(v2, v3) --[[ Line: 7 ]] --[[ Name: logEvent ]]
    -- upvalues: v1 (copy), l_TelemetryService_0 (copy)
    local v4 = {
        eventName = v2, 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            2025, 
            6, 
            30
        }, 
        description = "Cross Experience Analytics Events"
    };
    l_TelemetryService_0:LogEvent(v4, {
        customFields = v3
    });
end;
return {
    logEvent = logEvent
};