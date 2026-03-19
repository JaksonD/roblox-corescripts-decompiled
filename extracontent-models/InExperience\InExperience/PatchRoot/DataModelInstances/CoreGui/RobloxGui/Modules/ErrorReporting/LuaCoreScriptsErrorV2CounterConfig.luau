local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v2 = game:DefineFastInt("LuaCoreScriptsErrorV2ThrottleHundredthPercentage", 0);
return {
    eventName = "LuaCoreScriptsError", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    throttlingPercentage = v2, 
    lastUpdated = {
        25, 
        1, 
        29
    }, 
    description = "V2 Counter to for Lua CoreScripts Error."
};