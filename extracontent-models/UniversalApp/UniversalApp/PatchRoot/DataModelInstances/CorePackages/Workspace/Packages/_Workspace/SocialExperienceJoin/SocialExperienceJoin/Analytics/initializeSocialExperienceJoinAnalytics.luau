local l_Parent_0 = script:FindFirstAncestor("SocialExperienceJoin").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v1.Analytics.DefaultAnalyticsService;
local v4 = require(script.Parent.getEventStreamActionList);
local v5 = require(script.Parent.TelemetryActionList);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), l_AnalyticsFactory_0 (copy), v5 (copy), l_DefaultAnalyticsService_0 (copy)
    local v7 = v4(v6);
    return l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v7, 
            Telemetry = v5
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Telemetry = l_DefaultAnalyticsService_0.Telemetry
        }
    })();
end;