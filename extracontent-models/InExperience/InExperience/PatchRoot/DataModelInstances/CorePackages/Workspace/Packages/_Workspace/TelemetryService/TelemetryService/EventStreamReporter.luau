local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {
        _reporter = v1, 
        _isEnabled = true
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.setEnabled = function(v3, v4) --[[ Line: 19 ]] --[[ Name: setEnabled ]]
    v3._isEnabled = v4;
end;
v0.sendTelemetryEvent = function(v5, v6, v7, v8) --[[ Line: 26 ]] --[[ Name: sendTelemetryEvent ]]
    v8 = v8 or {};
    assert(type(v6) == "string", "Expected eventContext to be a string");
    assert(type(v7) == "string", "Expected eventName to be a string");
    assert(type(v8) == "table", "Expected additionalArgs to be a table");
    assert(v5._isEnabled, "This reporting service is disabled");
    v5._reporter:logRobloxTelemetryEvent({
        eventName = v7, 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = 10000
    }, {
        "addSessionId", 
        "addSessionInfo"
    }, v8, v6);
end;
return v0;