local l_Parent_0 = script.Parent;
local l_Context_0 = require(l_Parent_0.dependencies).SocialLibraries.Context;
local v2 = require(script.DiscoverabilityModalAnalyticsContext);
return {
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    Context = v2, 
    connect = l_Context_0.getConnect(v2), 
    EventNames = require(script.Enums.EventNames), 
    useAnalytics = require(script.useAnalytics), 
    EntryPoints = require(script.Enums.EntryPoints), 
    AnalyticsService = require(script.AnalyticsService)
};