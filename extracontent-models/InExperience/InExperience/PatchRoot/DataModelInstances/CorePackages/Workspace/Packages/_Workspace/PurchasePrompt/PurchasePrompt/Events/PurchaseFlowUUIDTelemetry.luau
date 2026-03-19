local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    ProductPurchaseContainerMigrationCounter = {
        eventName = "ProductPurchaseContainerPurchaseFlowUUID", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            1, 
            21
        }, 
        throttlingPercentage = 100, 
        description = "Counter for PurchaseFlowUUID generation in ProductPurchaseContainer init method"
    }, 
    InitiatePurchaseCounter = {
        eventName = "InitiatePurchasePurchaseFlowUUID", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            1, 
            21
        }, 
        throttlingPercentage = 100, 
        description = "Counter for PurchaseFlowUUID generation in initiatePurchase thunk"
    }
};