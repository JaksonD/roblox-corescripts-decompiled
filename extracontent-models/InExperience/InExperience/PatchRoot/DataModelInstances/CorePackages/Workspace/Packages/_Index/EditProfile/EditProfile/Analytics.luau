local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(script.EditProfileAnalyticsContext);
local l_Context_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Context;
return {
    AnalyticsService = require(script.AnalyticsService), 
    Context = v1, 
    connect = l_Context_0.getConnect(v1), 
    EventNames = require(script.Enums.EventNames), 
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    useAnalytics = require(script.useAnalytics), 
    AnalyticsServiceV2 = require(script.AnalyticsServiceV2)
};