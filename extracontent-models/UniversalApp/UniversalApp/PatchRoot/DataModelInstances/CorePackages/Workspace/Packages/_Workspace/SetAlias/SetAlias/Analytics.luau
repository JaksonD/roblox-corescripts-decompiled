local l_Parent_0 = script.Parent;
local v1 = require(script.SetAliasAnalyticsContext);
local l_Context_0 = require(l_Parent_0.dependencies).SocialLibraries.Context;
return {
    AnalyticsService = require(script.AnalyticsService), 
    Context = v1, 
    connect = l_Context_0.getConnect(v1), 
    EventNames = require(script.Enums.EventNames), 
    EntryPoints = require(script.Enums.EntryPoints), 
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    useAnalytics = require(script.useAnalytics)
};