local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v3.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v3.Analytics.DefaultAnalyticsService;
local v6 = require(script.EventNames);
local v7 = require(script.EventStreamActionList);
local v8 = require(script.DiagActionList);
local v9 = require(script.TelemetryActionList);
local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
local v11 = {
    playSessionId = if l_l_RbxAnalyticsService_0_PlaySessionId_0 ~= "" then l_l_RbxAnalyticsService_0_PlaySessionId_0 else nil, 
    placeId = if game.PlaceId > 0 then tostring(game.PlaceId) else nil, 
    universeId = if game.GameId > 0 then tostring(game.GameId) else nil
};
return {
    Analytics = l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v7, 
            Diag = v8, 
            Telemetry = v9
        }, 
        analyticsImpl = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Diag = l_DefaultAnalyticsService_0.Diag, 
            Telemetry = l_DefaultAnalyticsService_0.Telemetry
        }, 
        staticInfoForAllEvents = v11
    }), 
    EventNames = v6
};