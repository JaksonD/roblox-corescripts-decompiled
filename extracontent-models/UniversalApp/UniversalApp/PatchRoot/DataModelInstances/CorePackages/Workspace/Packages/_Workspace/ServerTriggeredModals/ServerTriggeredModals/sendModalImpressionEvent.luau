local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("ServerTriggeredModals").Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = {
    eventName = "ModalImpression", 
    backends = {
        v2.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:DefineFastInt("ModalImpressionThrottleHundrethsPercent", 10000), 
    lastUpdated = {
        25, 
        9, 
        9
    }, 
    description = "Sent when a modal is shown", 
    links = ""
};
return function(v4, v5) --[[ Line: 19 ]]
    -- upvalues: l_TelemetryService_0 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v3, {
        customFields = {
            modalId = v4, 
            modalType = v5
        }
    });
end;