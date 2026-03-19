local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
game:DefineFastInt("ToCPopupOccuranceThrottleHundrethsPercent", 0);
return {
    eventName = "ToCPopupOccurance", 
    backends = {
        v1.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("ToCPopupOccuranceThrottleHundrethsPercent"), 
    lastUpdated = {
        23, 
        3, 
        8
    }, 
    description = "Report ocurrance of ToC popup"
};