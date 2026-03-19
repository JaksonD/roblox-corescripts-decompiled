local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
game:DefineFastInt("SortDeeplinkFailureEventThrottleHundrethsPercent", 10000);
return {
    eventName = "SortDeeplinkFailedCounter", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    throttlingPercentage = game:GetFastInt("SortDeeplinkFailureEventThrottleHundrethsPercent"), 
    lastUpdated = {
        24, 
        10, 
        18
    }, 
    description = "Tracks failures to resolve sort deeplinks"
};