local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
game:DefineFastInt("LuaAppChallengeNativeWrapperEventThrottleHundredthsPercent", 10000);
return {
    eventName = "accountSecurityChallengeNativeWrapperEvent", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("LuaAppChallengeNativeWrapperEventThrottleHundredthsPercent"), 
    lastUpdated = {
        24, 
        4, 
        17
    }, 
    description = "Tracks lifecycle events for Lua GCS challenges", 
    links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/2184872709/Bypassing+Challenges+for+Xbox+PS+Quest+etc+Requests#Event-Tracking"
};