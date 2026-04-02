local l_Parent_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    RobloxSubscriptionUpsellModalInitiatedCounter = {
        eventName = "RobloxSubscriptionUpsellModalInitiatedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            3
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Roblox Subscription Upsell Modal is initiated."
    }, 
    RobloxSubscriptionUpsellModalShownCounter = {
        eventName = "RobloxSubscriptionUpsellModalShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            3
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Roblox Subscription Upsell Modal is shown."
    }, 
    RobloxSubscriptionUpsellModalBuyButtonClickedCounter = {
        eventName = "RobloxSubscriptionUpsellModalBuyButtonClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            3
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Roblox Subscription Upsell Modal buy button is clicked."
    }, 
    RobloxSubscriptionUpsellFlowCompletedCounter = {
        eventName = "RobloxSubscriptionUpsellFlowCompletedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            3
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when purchase was succesful."
    }, 
    RobloxSubscriptionUpsellNativePurchaseCompletedCounter = {
        eventName = "RobloxSubscriptionUpsellNativePurchaseCompletedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            3
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when purchase was succesful."
    }, 
    RobloxSubscriptionUpsellDismissedCounter = {
        eventName = "RobloxSubscriptionUpsellDismissedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            3
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when modal is dismissed."
    }, 
    RobloxSubscriptionUpsellPurchaseFailedCounter = {
        eventName = "RobloxSubscriptionUpsellPurchaseFailedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            3
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when purchase failed."
    }, 
    RobloxSubscriptionUpsellPurchaseSucceededCounter = {
        eventName = "RobloxSubscriptionUpsellPurchaseSucceededCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            9
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when purchase succeeded."
    }, 
    RobloxSubscriptionUpsellNativePurchasePollingTimeoutCounter = {
        eventName = "RobloxSubscriptionUpsellNativePurchasePollingTimeoutCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            9
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when native purchase polling timeout occurs after native purchase attempt."
    }, 
    RobloxSubscriptionPurchaseAttemptedCounter = {
        eventName = "RobloxSubscriptionPurchaseAttemptedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            9
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when purchase attempt is made."
    }, 
    RobloxSubscriptionPurchaseErrorShownCounter = {
        eventName = "RobloxSubscriptionPurchaseErrorShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            24
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when purchase error is shown."
    }, 
    RobloxSubscriptionCreatePaymentSessionFailedCounter = {
        eventName = "RobloxSubscriptionCreatePaymentSessionFailedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            25
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when create payment session fails."
    }
};