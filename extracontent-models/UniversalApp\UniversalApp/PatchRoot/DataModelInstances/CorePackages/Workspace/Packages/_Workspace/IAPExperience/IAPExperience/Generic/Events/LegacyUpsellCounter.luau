local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    LegacyUpsellShownCounter = {
        eventName = "LegacyUpsellShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            7, 
            15
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all legacy upsell shown", 
        links = ""
    }
};