local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_DefaultAnalyticsService_0 = v1.Analytics.DefaultAnalyticsService;
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local v4 = require(script.Parent.TelemetryActionList);
return l_AnalyticsFactory_0.setUpAnalyticsFactory({
    eventLists = {
        Telemetry = v4
    }, 
    analyticsImpl = {
        Telemetry = l_DefaultAnalyticsService_0.Telemetry
    }
});