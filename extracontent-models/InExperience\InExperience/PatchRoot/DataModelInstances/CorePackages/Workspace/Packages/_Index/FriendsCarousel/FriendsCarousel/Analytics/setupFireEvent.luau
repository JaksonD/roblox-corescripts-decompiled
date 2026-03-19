local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_SocialLuaAnalytics_0 = v1.SocialLuaAnalytics;
local v3 = require(script.Parent.DiagActionList);
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local v6 = require(script.Parent.EventStreamActionList);
local l_AnalyticsService_0 = v1.AnalyticsService;
return function(v8) --[[ Line: 11 ]]
    -- upvalues: l_fireEventStream_0 (copy), v6 (copy), l_fireDiagCounter_0 (copy), l_AnalyticsService_0 (copy), v3 (copy)
    local v9 = l_fireEventStream_0({
        eventStreamImpl = v8.analytics.EventStream, 
        eventList = v6, 
        infoForAllEvents = v8.infoForAllEvents
    });
    local v10 = l_fireDiagCounter_0({
        diagImpl = if not v8.analytics.Diag then l_AnalyticsService_0.Diag else v8.analytics.Diag, 
        eventList = v3
    });
    return function(v11, v12) --[[ Line: 27 ]]
        -- upvalues: v10 (copy), v3 (ref), v9 (copy)
        if v10 and v3[v11] then
            v10(v11);
        end;
        return v9(v11, v12);
    end;
end;