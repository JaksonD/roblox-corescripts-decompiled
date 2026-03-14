local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntMenuButtonsThrottleHundredthsPercent);
return {
    eventName = "experienceMenuLeaveGame", 
    backends = {
        v2.TelemetryBackends.Counter
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        25, 
        4, 
        23
    }, 
    description = "Report when leave button in experience menu is activated"
};