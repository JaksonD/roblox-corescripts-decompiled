local v0 = game:DefineFastInt("LuaAppSessionWithErrorThrottlePercentage", 100);
return {
    eventName = "LuaAppSessionWithError", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    throttlingPercentage = v0, 
    lastUpdated = {
        26, 
        2, 
        23
    }, 
    description = "Counting Lua App Session with Error."
};