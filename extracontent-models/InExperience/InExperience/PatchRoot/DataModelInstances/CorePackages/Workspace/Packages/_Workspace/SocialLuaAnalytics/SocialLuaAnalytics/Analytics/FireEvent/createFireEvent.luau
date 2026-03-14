local v0 = require(script.Parent.fireEventStream);
local v1 = require(script.Parent.fireDiag);
local v2 = require(script.Parent.fireTelemetry);
local _ = require(script.Parent.Parent.Types);
local function v11(v4, v5) --[[ Line: 23 ]] --[[ Name: setupFireEvent ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy)
    local v6 = if v4.analytics.EventStream and v5.EventStream then v0({
        eventStreamImpl = v4.analytics.EventStream, 
        eventList = v5.EventStream, 
        infoForAllEvents = v4.infoForAllEvents, 
        getInfoForAllEvents = v4.getInfoForAllEvents, 
        loggerImpl = v4.loggerImpl
    }) else nil;
    local v7 = if v4.analytics.Diag and v5.Diag then v1({
        diagImpl = v4.analytics.Diag, 
        eventList = v5.Diag, 
        loggerImpl = v4.loggerImpl
    }) else nil;
    local v8 = if v4.analytics.Telemetry and v5.Telemetry then v2({
        telemetryImpl = v4.analytics.Telemetry, 
        eventList = v5.Telemetry, 
        getInfoForAllEvents = v4.getInfoForAllEvents, 
        loggerImpl = v4.loggerImpl
    }) else nil;
    return function(v9, v10) --[[ Line: 51 ]]
        -- upvalues: v7 (copy), v5 (copy), v6 (copy), v8 (copy)
        if v7 and v5.Diag and v5.Diag[v9] then
            v7(v9, v10);
        end;
        if v6 and v5.EventStream and v5.EventStream[v9] then
            v6(v9, v10);
        end;
        if v8 and v5.Telemetry and v5.Telemetry[v9] then
            v8(v9, v10);
        end;
        return v9, v10;
    end;
end;
return function(v12) --[[ Line: 72 ]] --[[ Name: createFireEvent ]]
    -- upvalues: v11 (copy)
    return function(v13) --[[ Line: 73 ]]
        -- upvalues: v11 (ref), v12 (copy)
        return (v11(v13, v12));
    end;
end;