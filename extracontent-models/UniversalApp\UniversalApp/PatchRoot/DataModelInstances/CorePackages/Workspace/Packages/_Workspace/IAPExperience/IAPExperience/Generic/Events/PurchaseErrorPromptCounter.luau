local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    PurchaseErrorPromptShownCounter = {
        eventName = "PurchaseErrorPromptShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            20
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all purchase error prompt shown", 
        links = ""
    }, 
    EconomicRestrictionsPromptShownCounter = {
        eventName = "EconomicRestrictionsPromptShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            20
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all economic restrictions prompt shown", 
        links = ""
    }
};