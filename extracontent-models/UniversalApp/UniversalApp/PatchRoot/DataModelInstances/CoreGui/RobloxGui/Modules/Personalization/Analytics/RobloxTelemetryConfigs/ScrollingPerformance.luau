local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
return {
    eventName = "ScrollingPerformance", 
    backends = {
        v1.TelemetryBackends.Points
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        23, 
        10, 
        18
    }, 
    description = "Reporting the scrolling performance of ScrollingFrames", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/2276295974/Scrolling+Performance+Tracker"
};