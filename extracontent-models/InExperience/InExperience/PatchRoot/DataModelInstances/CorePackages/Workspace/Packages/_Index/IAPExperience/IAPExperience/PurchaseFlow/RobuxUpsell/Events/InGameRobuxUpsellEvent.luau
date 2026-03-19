local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
game:DefineFastInt("InGameRobuxUpsellEventThrottleHundredthsPercent", 0);
return {
    eventName = "InGameRobuxUpsellEvent", 
    backends = {
        v1.TelemetryBackends.Points, 
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("InGameRobuxUpsellEventThrottleHundredthsPercent"), 
    lastUpdated = {
        2024, 
        8, 
        22
    }, 
    description = "Data points on all InGameRobuxUpsell events.", 
    links = "https://roblox.atlassian.net/wiki/spaces/PAY/pages/1823605171/Robux+Upsell+InGame"
};