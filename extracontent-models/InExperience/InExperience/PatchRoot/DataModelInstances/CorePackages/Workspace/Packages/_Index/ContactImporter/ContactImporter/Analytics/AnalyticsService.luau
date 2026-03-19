local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v2 = require(l_Parent_0.Analytics).Analytics.new(game:GetService("RbxAnalyticsService"));
return {
    EventStream = {
        setRBXEventStream = require(script.Parent.setupSetRbxEventStream)(l_EventIngestService_0)
    }, 
    Diag = v2.Diag
};