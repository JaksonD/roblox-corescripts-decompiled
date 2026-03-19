local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
game:DefineFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent", 0);
return {
    eventName = "avatarChatSubsessionStats", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent"), 
    lastUpdated = {
        22, 
        10, 
        17
    }, 
    description = "Report FACS sending/receiving time per Avatar Chat session to EventIngest.", 
    links = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics"
};