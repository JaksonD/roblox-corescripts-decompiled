local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    UnifiedProductPurchaseModalShownCounter = {
        eventName = "UnifiedProductPurchaseModalShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            9, 
            22
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Purchase Modal is shown."
    }, 
    UnifiedProductPurchaseModalBuyItemButtonClickedCounter = {
        eventName = "UnifiedProductPurchaseModalBuyItemButtonClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            9, 
            22
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Purchase Modal buy item button is clicked."
    }, 
    UnifiedProductPurchaseModalCancelButtonClickedCounter = {
        eventName = "UnifiedProductPurchaseModalCancelButtonClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            9, 
            22
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Purchase Modal cancel button is clicked."
    }, 
    UnifiedProductPurchaseModalPurchaseAttemptedCounter = {
        eventName = "UnifiedProductPurchaseModalPurchaseAttemptedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            9, 
            22
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Purchase Modal purchase attempt is made."
    }, 
    UnifiedProductPurchaseModalPurchaseSuccessCounter = {
        eventName = "UnifiedProductPurchaseModalPurchaseSuccessCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            9, 
            22
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Purchase Modal purchase success occurs."
    }, 
    UnifiedProductPurchaseCompletionModalShownCounter = {
        eventName = "UnifiedProductPurchaseCompletionModalShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            9, 
            22
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Purchase Modal purchase success occurs."
    }, 
    UnifiedRobuxUpsellModalShownCounter = {
        eventName = "UnifiedRobuxUpsellModalShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            10, 
            4
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Robux Upsell Modal is shown."
    }, 
    UnifiedRobuxUpsellModalBuyButtonClickedCounter = {
        eventName = "UnifiedRobuxUpsellModalBuyButtonClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            10, 
            4
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Unified Robux Upsell Modal buy button is clicked."
    }, 
    UnifiedRobuxUpsellRobuxPurchaseCompletedCounter = {
        eventName = "UnifiedRobuxUpsellRobuxPurchaseCompletedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            2, 
            9
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Robux was successfully purchased during the Unified Robux Upsell Flow.  Doesn't include successful item purchase after upsell."
    }, 
    UnifiedRobuxUpsellRobuxPurchaseFailedCounter = {
        eventName = "UnifiedRobuxUpsellRobuxPurchaseFailedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            2, 
            9
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when Robux upsell flow failed during balance polling retries in the Unified Robux Upsell Flow."
    }, 
    UnifiedProductPurchaseFlowEvent = {
        eventName = "UnifiedProductPurchaseFlow", 
        backends = {
            v1.TelemetryBackends.EventIngest
        }, 
        throttlingPercentage = game:DefineFastInt("EnableUnifiedProductPurchaseFlowThrottleHundredthsPercent", 0), 
        lastUpdated = {
            2025, 
            10, 
            4
        }, 
        description = "Data points on all Unified Product Purchase Flow events."
    }
};