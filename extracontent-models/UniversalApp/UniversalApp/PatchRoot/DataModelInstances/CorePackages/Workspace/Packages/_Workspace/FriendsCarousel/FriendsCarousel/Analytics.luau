local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local _ = l_script_FirstAncestor_0.Parent;
local l_Context_0 = v1.SocialLibraries.Context;
local v4 = require(script.FriendsCarouselAnalyticsContext);
local v5 = require(script.setupFireEvent);
local v6 = require(script.useAnalytics);
local v7 = require(script.AnalyticsSetup);
return {
    EventNames = require(script.EventNames), 
    Analytics = v7, 
    setupFireEvent = v5, 
    Context = v4, 
    connect = l_Context_0.getConnect(v4), 
    with = l_Context_0.getWith(v4), 
    useAnalytics = v6
};