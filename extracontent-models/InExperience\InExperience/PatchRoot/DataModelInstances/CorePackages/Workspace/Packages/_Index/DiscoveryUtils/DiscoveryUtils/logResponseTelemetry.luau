local l_Parent_0 = script:FindFirstAncestor("DiscoveryUtils").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v2 = game:DefineFastInt("DiscoveryResponseSizeEventHundredthsPercent", 0);
local v3 = {
    eventName = "DiscoveryResponseSize", 
    backends = {
        l_default_0.TelemetryBackends.Stats
    }, 
    throttlingPercentage = v2, 
    lastUpdated = {
        24, 
        8, 
        2
    }, 
    description = "Response body size for discovery network requests", 
    links = ""
};
return function(v4, v5, v6) --[[ Line: 23 ]] --[[ Name: logResponseTelemetry ]]
    -- upvalues: l_default_0 (copy), v3 (copy)
    if v6 == nil then
        v6 = l_default_0;
    end;
    assert(v6, "LoggingProtocol must exist");
    v6:logRobloxTelemetryStat(v3, v5.responseSize, {
        endpoint_name = v4
    });
end;