local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v1.Analytics.DefaultAnalyticsService;
local v4 = require(script.Parent.EventStreamActionList);
local v5 = require(script.Parent.DiagActionList);
return l_AnalyticsFactory_0.setUpAnalyticsFactory({
    eventLists = {
        EventStream = v4, 
        Diag = v5
    }, 
    analyticsImpl = {
        EventStream = l_DefaultAnalyticsService_0.EventStream, 
        Diag = l_DefaultAnalyticsService_0.Diag
    }
});