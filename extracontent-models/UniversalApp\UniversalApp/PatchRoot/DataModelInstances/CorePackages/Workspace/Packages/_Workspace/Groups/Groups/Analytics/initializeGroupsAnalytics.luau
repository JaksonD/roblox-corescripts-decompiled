local l_Parent_0 = script:FindFirstAncestor("Groups").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v1.Analytics.DefaultAnalyticsService;
local v4 = require(script.Parent.EventStreamActionList);
return l_AnalyticsFactory_0.setUpAnalyticsFactory({
    eventLists = {
        EventStream = v4
    }, 
    analyticsImpl = {
        EventStream = l_DefaultAnalyticsService_0.EventStream
    }
});