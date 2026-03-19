local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
game:DefineFastInt("LuaAppChallengeDeviceAccessEventThrottlingPercent", 10000);
return {
    eventName = "accountSecurityChallengeDeviceAccessTokenEvent", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("LuaAppChallengeDeviceAccessEventThrottlingPercent"), 
    lastUpdated = {
        24, 
        1, 
        22
    }, 
    description = "Tracks lifecycle events for the Device Access GCS challenge", 
    links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/2184872709/Bypassing+Challenges+for+Xbox+PS+Quest+etc+Requests#Event-Tracking"
};