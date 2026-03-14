local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExternalAttribution");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFIntLuaAppsAppsflyerIdCounterThrottle_0 = require(l_script_FirstAncestor_0.Flags).GetFIntLuaAppsAppsflyerIdCounterThrottle;
local v3 = require(l_Parent_0.LoggingProtocol);
return {
    eventName = "luaAppsAppsflyerIdFailure", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = l_GetFIntLuaAppsAppsflyerIdCounterThrottle_0(), 
    lastUpdated = {
        24, 
        7, 
        30
    }, 
    description = "Counter to track failed Appsflyer ID generation on Lua Apps."
};