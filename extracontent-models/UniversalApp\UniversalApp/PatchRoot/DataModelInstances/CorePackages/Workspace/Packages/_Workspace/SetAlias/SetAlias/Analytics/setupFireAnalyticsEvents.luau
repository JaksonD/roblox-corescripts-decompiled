local l_Parent_0 = script.Parent.Parent;
local l_SocialLuaAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics;
local v2 = require(script.Parent.TelemetryActionList);
local v3 = require(script.Parent.DiagActionList);
local v4 = require(script.Parent.EventStreamActionList);
local l_AnalyticsFactory_0 = l_SocialLuaAnalytics_0.Analytics.AnalyticsFactory;
return function(v6) --[[ Line: 11 ]]
    -- upvalues: l_AnalyticsFactory_0 (copy), v4 (copy), v3 (copy), v2 (copy)
    return l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v4, 
            Diag = v3, 
            Telemetry = v2
        }, 
        analyticsImpl = v6.analytics
    })(v6).fireAnalyticsEvent;
end;