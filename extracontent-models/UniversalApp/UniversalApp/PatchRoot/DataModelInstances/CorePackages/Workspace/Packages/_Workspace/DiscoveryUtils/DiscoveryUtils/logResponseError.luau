local l_Parent_0 = script:FindFirstAncestor("DiscoveryUtils").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v1.default;
local v3 = game:DefineFastInt("DiscoveryResponseErrorEventHundredthsPercent", 0);
local v4 = {
    eventName = "DiscoveryResponse_Error", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    throttlingPercentage = v3, 
    lastUpdated = {
        24, 
        12, 
        2
    }, 
    description = "Response errors for discovery network requests"
};
local function _(v5) --[[ Line: 19 ]] --[[ Name: getStatusCode ]]
    local v6 = nil;
    if typeof(v5) == "table" then
        v6 = tostring(v5.StatusCode);
    end;
    return v6 or "unknown";
end;
return function(v8, v9, v10) --[[ Line: 28 ]] --[[ Name: logResponseError ]]
    -- upvalues: l_default_0 (copy), v4 (copy)
    if v10 == nil then
        v10 = l_default_0;
    end;
    assert(v10, "LoggingProtocol must exist");
    local l_v4_0 = v4;
    local v12 = 1;
    local v13 = {
        endpoint_name = v8
    };
    local v14 = nil;
    if typeof(v9) == "table" then
        v14 = tostring(v9.StatusCode);
    end;
    v13.status_code = v14 or "unknown";
    v10:logRobloxTelemetryCounter(l_v4_0, v12, v13);
end;