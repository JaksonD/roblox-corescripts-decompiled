local l_Parent_0 = script:FindFirstAncestor("ServerTriggeredModals").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v1.default;
local v3 = {
    eventName = "ServerTriggeredModals_NetworkLatency", 
    backends = {
        v1.TelemetryBackends.Stats
    }, 
    lastUpdated = {
        25, 
        8, 
        29
    }, 
    description = "Response latency from server triggered modals request"
};
return function(v4, v5, v6, v7) --[[ Line: 18 ]]
    -- upvalues: l_default_0 (copy), v3 (copy)
    if v7 == nil then
        v7 = l_default_0;
    end;
    assert(v7, "loggingProtocol must exists");
    v7:logRobloxTelemetryStat(v3, v5, {
        endpoint_name = v4, 
        status_code = v6
    });
end;