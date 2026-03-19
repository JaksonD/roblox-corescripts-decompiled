local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_fireEventStream_0 = v1.Analytics.FireEvent.fireEventStream;
local l_fireTelemetry_0 = v1.Analytics.FireEvent.fireTelemetry;
local _ = require(script.Parent.EventNames);
local v5 = require(script.Parent.EventStreamActionList);
local v6 = require(script.Parent.TelemetryActionList);
return function(v7) --[[ Line: 13 ]]
    -- upvalues: l_fireEventStream_0 (copy), v5 (copy), l_fireTelemetry_0 (copy), v6 (copy)
    local v8 = l_fireEventStream_0({
        eventStreamImpl = v7.analytics.EventStream, 
        eventList = v5, 
        infoForAllEvents = v7.infoForAllEvents
    });
    local v9 = l_fireTelemetry_0({
        telemetryImpl = v7.analytics.Telemetry, 
        eventList = v6
    });
    return function(v10, v11) --[[ Line: 28 ]]
        -- upvalues: v6 (ref), v9 (copy), v5 (ref), v8 (copy)
        if v6[v10] then
            v9(v10, v11);
        end;
        if v5[v10] then
            v8(v10, v11);
        end;
    end;
end;