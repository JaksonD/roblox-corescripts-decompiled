local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v3 = require(l_Parent_0.Analytics).Analytics.new(game:GetService("RbxAnalyticsService"));
local v4 = require(script.Parent.setupSetRbxEventStream);
local v5 = require(script.Parent.setupSendEventDeferred);
local l_default_0 = v1.default;
return {
    EventStream = {
        setRBXEventStream = v4(l_EventIngestService_0), 
        sendEventDeferred = v5(l_EventIngestService_0)
    }, 
    Diag = v3.Diag, 
    Telemetry = l_default_0
};