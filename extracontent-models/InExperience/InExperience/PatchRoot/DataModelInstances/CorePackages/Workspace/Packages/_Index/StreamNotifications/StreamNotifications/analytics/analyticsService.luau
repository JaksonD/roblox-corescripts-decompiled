local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
return {
    EventStream = {
        sendEventDeferred = require(l_script_FirstAncestor_0.analytics.sendEventDeferred)(l_EventIngestService_0)
    }
};