local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    ProductPurchasePromptCounter = {
        eventName = "ProductPurchaseErrorPromptShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            8, 
            26
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all product purchase error prompt shown", 
        links = ""
    }
};