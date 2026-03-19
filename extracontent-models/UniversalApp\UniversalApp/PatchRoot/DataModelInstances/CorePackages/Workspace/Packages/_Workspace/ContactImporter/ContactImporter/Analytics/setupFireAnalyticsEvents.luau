local l_Parent_0 = script.Parent.Parent;
local l_SocialLuaAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics;
local v2 = require(script.Parent.Enums.EventNames);
local v3 = require(script.Parent.fireReportStats);
local l_fireEventStream_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireEventStream;
local l_fireDiagCounter_0 = l_SocialLuaAnalytics_0.Analytics.FireEvent.fireDiagCounter;
local v6 = require(script.Parent.AnalyticsEvents);
local v7 = require(script.Parent.DiagEvents);
return function(v8) --[[ Line: 12 ]]
    -- upvalues: l_fireEventStream_0 (copy), v6 (copy), l_fireDiagCounter_0 (copy), v7 (copy), v3 (copy), v2 (copy)
    local v9 = l_fireEventStream_0({
        eventStreamImpl = if v8.analytics then v8.analytics.EventStream else v8.eventStreamImpl, 
        eventList = v6, 
        infoForAllEvents = v8.defaultAnalyticsInfo
    });
    local v10 = l_fireDiagCounter_0({
        diagImpl = if v8.analytics then v8.analytics.Diag else v8.diag, 
        eventList = v7
    });
    local v11 = v3({
        diagImpl = if v8.analytics then v8.analytics.Diag else v8.diag, 
        eventList = v7
    });
    return function(v12, v13) --[[ Line: 35 ]]
        -- upvalues: v7 (ref), v2 (ref), v11 (copy), v10 (copy), v6 (ref), v9 (copy)
        if v7[v12] then
            if v12 == v2.ContactImportingTime then
                v11(v2.ContactImportingTime, v13);
            else
                v10(v12);
            end;
        end;
        if v6[v12] then
            v9(v12, v13);
        end;
    end;
end;