local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(script.Parent.DiagActionList);
local l_fireEventStream_0 = v1.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = v1.Analytics.FireEvent.fireDiagCounter;
local v5 = require(script.Parent.EventStreamActionList);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: l_fireEventStream_0 (copy), v5 (copy), l_fireDiagCounter_0 (copy), v2 (copy)
    local v7 = l_fireEventStream_0({
        eventStreamImpl = v6.analytics.EventStream, 
        eventList = v5, 
        infoForAllEvents = v6.infoForAllEvents
    });
    local v8 = l_fireDiagCounter_0({
        diagImpl = v6.analytics.Diag, 
        eventList = v2
    });
    return function(v9, v10) --[[ Line: 26 ]]
        -- upvalues: v2 (ref), v8 (copy), v7 (copy)
        if v2[v9] then
            v8(v9);
        end;
        return v7(v9, v10);
    end;
end;