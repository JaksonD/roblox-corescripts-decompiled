local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    PurchaseModalV1ShownCounter = {
        eventName = "PurchaseModalV1ShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            8, 
            4
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when In Experience Purchase Modal v1 is shown", 
        links = ""
    }, 
    PurchaseModalV2ShownCounter = {
        eventName = "PurchaseModalV2ShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            8, 
            4
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when In Experience Purchase Modal v2 is shown", 
        links = ""
    }
};