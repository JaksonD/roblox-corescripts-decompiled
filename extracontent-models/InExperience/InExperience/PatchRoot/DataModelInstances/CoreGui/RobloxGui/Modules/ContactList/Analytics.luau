local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v1.Analytics.DefaultAnalyticsService;
local v4 = require(script.EventStreamActionList);
return {
    Analytics = l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v4, 
            Diag = nil
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = nil
        }
    }), 
    useAnalytics = require(script.useAnalytics)
};