local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    TooExpensiveUpsellShownCounter = {
        eventName = "TooExpensiveUpsellShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            7, 
            29
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Robux too expensive upsell modal shown", 
        links = ""
    }, 
    TooExpensiveUpsellFallbackShownCounter = {
        eventName = "TooExpensiveUpsellFallbackShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            7, 
            29
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Robux too expensive fallback modal shown", 
        links = ""
    }, 
    TooExpensiveUnifiedUpsellShownCounter = {
        eventName = "TooExpensiveUnifiedUpsellShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            9, 
            29
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Robux too expensive unified upsell modal shown", 
        links = ""
    }
};