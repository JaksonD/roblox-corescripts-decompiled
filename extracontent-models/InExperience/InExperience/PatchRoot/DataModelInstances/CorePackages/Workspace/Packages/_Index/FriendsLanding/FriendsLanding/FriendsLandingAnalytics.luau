local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Context_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Context;
local v2 = require(script.ButtonClickEvents);
local v3 = require(script.ImpressionEvents);
local v4 = require(script.AnalyticsContext);
return {
    Class = require(script.FriendsLandingAnalytics), 
    Context = v4, 
    connect = l_Context_0.getConnect(v4), 
    with = l_Context_0.getWith(v4), 
    ButtonClickEvents = v2, 
    AddFriendsPageLoadAnalytics = require(script.AddFriendsPageLoadAnalytics), 
    ImpressionEvents = v3
};