local l_Parent_0 = script:FindFirstAncestor("SocialStopwatch").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v2 = game:DefineFastInt("SocialStopwatchTelementyThrottleHundrethsPercent", 10000);
return {
    eventName = "SocialStopwatchTelementy", 
    backends = {
        l_default_0.TelemetryBackends.Points
    }, 
    throttlingPercentage = v2, 
    lastUpdated = {
        24, 
        5, 
        6
    }, 
    description = "Report errors with using the Social Time Stopwatch Library.", 
    links = ""
};