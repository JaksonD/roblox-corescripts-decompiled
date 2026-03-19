local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_Parent_0 = script:FindFirstAncestor("ProfileShareLinks").Parent;
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v2.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v2.Analytics.DefaultAnalyticsService;
local v5 = require(script.Parent.EventStreamActionList);
local v6 = require(script.Parent.TelemetryActionList);
local v7 = require(script.Parent.setupSendEventDeferred);
local v8 = require(script.Parent.setupSetRbxEventStream);
return l_AnalyticsFactory_0.setUpAnalyticsFactory({
    eventLists = {
        EventStream = v5, 
        Telemetry = v6
    }, 
    analyticsImpl = {
        EventStream = {
            sendEventDeferred = v7(l_EventIngestService_0), 
            setRBXEventStream = v8(l_EventIngestService_0)
        }, 
        Telemetry = l_DefaultAnalyticsService_0.Telemetry
    }
});