local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    MultiplePackageUpsellShownCounter = {
        eventName = "MultiplePackageUpsellShownCounter", 
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
    MultiplePackageUpsellSelectedCounter = {
        eventName = "MultiplePackageUpsellSelectedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            1
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all multiple package upsell selections"
    }, 
    MultiplePackageUpsellModalClosedCounter = {
        eventName = "MultiplePackageUpsellModalClosedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            1
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all multiple package upsell modal closed"
    }, 
    MultiplePackageUpsellModalBuyClickedCounter = {
        eventName = "MultiplePackageUpsellModalBuyClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            1
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all multiple package upsell modal buy clicked"
    }
};