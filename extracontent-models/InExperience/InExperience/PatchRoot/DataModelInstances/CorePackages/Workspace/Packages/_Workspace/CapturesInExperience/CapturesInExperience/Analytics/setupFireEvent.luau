local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_fireDiagCounter_0 = v1.Analytics.FireEvent.fireDiagCounter;
local l_fireEventStream_0 = v1.Analytics.FireEvent.fireEventStream;
local l_fireTelemetry_0 = v1.Analytics.FireEvent.fireTelemetry;
local v5 = require(script.Parent.DiagActionList);
local _ = require(script.Parent.EventNames);
local v7 = require(script.Parent.EventStreamActionList);
local v8 = require(script.Parent.TelemetryActionList);
return function(v9) --[[ Line: 15 ]]
    -- upvalues: l_fireEventStream_0 (copy), v7 (copy), l_fireDiagCounter_0 (copy), v5 (copy), l_fireTelemetry_0 (copy), v8 (copy)
    local v10 = l_fireEventStream_0({
        eventStreamImpl = v9.analytics.EventStream, 
        eventList = v7, 
        infoForAllEvents = v9.infoForAllEvents
    });
    local v11 = l_fireDiagCounter_0({
        diagImpl = v9.analytics.Diag, 
        eventList = v5
    });
    local v12 = l_fireTelemetry_0({
        telemetryImpl = v9.analytics.Telemetry, 
        eventList = v8
    });
    return function(v13, v14) --[[ Line: 35 ]]
        -- upvalues: v5 (ref), v11 (copy), v8 (ref), v12 (copy), v7 (ref), v10 (copy)
        if v5[v13] then
            v11(v13);
        end;
        if v8[v13] then
            v12(v13, v14);
        end;
        if v7[v13] then
            v10(v13, v14);
        end;
    end;
end;