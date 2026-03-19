local l_EventIngestService_0 = game:GetService("EventIngestService");
return {
    EventStream = {
        sendEventDeferred = require(script.Parent.sendEventDeferred)(l_EventIngestService_0)
    }
};