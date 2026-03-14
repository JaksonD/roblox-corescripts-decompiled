local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v2 = game:DefineFastInt("LuaErrorV2ThrottleHundredthPercentage", 0);
return {
    eventName = "LuaAppsError", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    throttlingPercentage = v2, 
    lastUpdated = {
        24, 
        11, 
        2
    }, 
    description = "V2 Counter to for Lua App Error."
};