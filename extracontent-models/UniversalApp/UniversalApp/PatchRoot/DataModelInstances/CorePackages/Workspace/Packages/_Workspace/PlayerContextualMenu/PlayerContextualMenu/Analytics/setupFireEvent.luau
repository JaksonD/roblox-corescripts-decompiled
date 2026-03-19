local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_fireDiagCounter_0 = v1.Analytics.FireEvent.fireDiagCounter;
local l_fireEventStream_0 = v1.Analytics.FireEvent.fireEventStream;
local v4 = require(script.Parent.EventStreamActionList);
local v5 = require(script.Parent.DiagActionList);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: l_fireEventStream_0 (copy), v4 (copy), l_fireDiagCounter_0 (copy), v5 (copy)
    local v7 = l_fireEventStream_0({
        eventStreamImpl = v6.analytics.EventStream, 
        eventList = v4, 
        infoForAllEvents = v6.infoForAllEvents
    });
    local v8 = l_fireDiagCounter_0({
        diagImpl = v6.analytics.Diag, 
        eventList = v5
    });
    return function(v9, v10) --[[ Line: 26 ]]
        -- upvalues: v8 (copy), v5 (ref), v7 (copy)
        if v8 and v5[v9] then
            v8(v9);
        end;
        return v7(v9, v10);
    end;
end;