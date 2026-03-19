local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
game:DefineFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent", 0);
return {
    eventName = "avatarChatSubsessionInput", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent"), 
    lastUpdated = {
        22, 
        10, 
        17
    }, 
    description = "Report user camera/mic settings for Avatar Chat to EventIngest.", 
    links = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics"
};