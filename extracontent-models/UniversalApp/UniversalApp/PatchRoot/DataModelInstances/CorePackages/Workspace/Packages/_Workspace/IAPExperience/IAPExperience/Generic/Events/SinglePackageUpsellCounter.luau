local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    SinglePackageUpsellShownCounter = {
        eventName = "SinglePackageUpsellShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            1
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all multiple package upsell shown", 
        links = ""
    }, 
    SinglePackageUpsellModalClosedCounter = {
        eventName = "SinglePackageUpsellModalClosedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            1
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all single package upsell modal closed"
    }, 
    SinglePackageUpsellModalBuyClickedCounter = {
        eventName = "SinglePackageUpsellModalBuyClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            1
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all single package upsell modal buy clicked"
    }
};