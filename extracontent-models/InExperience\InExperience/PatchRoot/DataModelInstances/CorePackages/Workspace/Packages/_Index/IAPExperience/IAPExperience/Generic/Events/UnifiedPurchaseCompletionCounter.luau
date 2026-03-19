local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    UnifiedProductPurchaseCompletionModalShownCounter = {
        eventName = "UnifiedProductPurchaseCompletionModalShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            10, 
            8
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Purchase Completion Modal is shown."
    }
};