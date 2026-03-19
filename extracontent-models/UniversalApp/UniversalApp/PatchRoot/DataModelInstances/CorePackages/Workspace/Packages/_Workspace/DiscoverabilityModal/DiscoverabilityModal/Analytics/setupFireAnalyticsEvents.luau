local l_Parent_0 = script.Parent.Parent;
local l_SocialLuaAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics;
local v2 = require(script.Parent.DiagEvents);
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local v5 = require(script.Parent.AnalyticsEvents);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: l_fireEventStream_0 (copy), v5 (copy), l_fireDiagCounter_0 (copy), v2 (copy)
    local v7 = l_fireEventStream_0({
        eventStreamImpl = if v6.analytics then v6.analytics.EventStream else v6.eventStreamImpl, 
        eventList = v5, 
        infoForAllEvents = v6.defaultAnalyticsInfo
    });
    local v8 = l_fireDiagCounter_0({
        diagImpl = if v6.analytics then v6.analytics.Diag else v6.diag, 
        eventList = v2
    });
    return function(v9, v10) --[[ Line: 28 ]]
        -- upvalues: v8 (copy), v7 (copy)
        v8(v9);
        v7(v9, v10);
    end;
end;