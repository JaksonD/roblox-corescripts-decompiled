local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Context_0 = v1.SocialLibraries.Context;
local v3 = require(script.PYMKCarouselAnalyticsContext);
local v4 = require(script.setupFireEvent);
local v5 = require(script.useAnalytics);
local v6 = require(script.useUserSeenEvent);
local l_getFFlagPYMKAddFriendsEntry_0 = v1.getFFlagPYMKAddFriendsEntry;
return {
    setupFireEvent = v4, 
    Context = v3, 
    connect = l_Context_0.getConnect(v3), 
    with = l_Context_0.getWith(v3), 
    EventNames = require(script.EventNames), 
    BtnValues = if l_getFFlagPYMKAddFriendsEntry_0() then require(script.BtnValues) else nil, 
    useAnalytics = v5, 
    useUserSeenEvent = v6
};