local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v2 = require(l_Parent_0.SharedFlags);
local v3 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v3.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v3.Analytics.DefaultAnalyticsService;
local v6 = require(script.EventNames);
local v7 = require(script.EventStreamActionList);
local l_FFlagEnableSquadCoplayAnalytic_0 = v2.FFlagEnableSquadCoplayAnalytic;
local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
local v10 = {
    playSessionId = if l_l_RbxAnalyticsService_0_PlaySessionId_0 ~= "" then l_l_RbxAnalyticsService_0_PlaySessionId_0 else nil, 
    placeId = if game.PlaceId > 0 then tostring(game.PlaceId) else nil, 
    universeId = if game.GameId > 0 then tostring(game.GameId) else nil, 
    placeInstanceId = if game.JobId ~= "" then tostring(game.JobId) else nil
};
return {
    Analytics = l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v7, 
            Diag = nil
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = nil
        }, 
        staticInfoForAllEvents = v10
    }), 
    EventNames = v6, 
    logInExpCoplayTelemetry = if l_FFlagEnableSquadCoplayAnalytic_0 then require(script.logInExpCoplayTelemetry) else nil
};