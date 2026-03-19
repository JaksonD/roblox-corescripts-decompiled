local l_Parent_0 = script:FindFirstAncestor("ServerTriggeredModals").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v1.default;
local v3 = {
    eventName = "ServerTriggeredModals_HttpStatusCode", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        25, 
        8, 
        29
    }, 
    description = "Response status code from server triggered modals request"
};
return function(v4, v5, v6) --[[ Line: 18 ]]
    -- upvalues: l_default_0 (copy), v3 (copy)
    if v6 == nil then
        v6 = l_default_0;
    end;
    assert(v6, "loggingProtocol must exists");
    v6:logRobloxTelemetryCounter(v3, 1, {
        endpoint_name = v4, 
        status_code = v5 or "unknown"
    });
end;