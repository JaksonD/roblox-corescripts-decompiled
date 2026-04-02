local l_Parent_0 = script:FindFirstAncestor("CurrencyTransfers").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    CurrencyTransferFlowOpenedCounter = {
        eventName = "CurrencyTransferFlowOpenedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the currency transfer flow is opened."
    }, 
    CurrencyTransferInitiateSucceededCounter = {
        eventName = "CurrencyTransferInitiateSucceededCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when initiate transfer API succeeds and the send flow reaches input."
    }, 
    CurrencyTransferInitiateFailedCounter = {
        eventName = "CurrencyTransferInitiateFailedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when initiate transfer API fails."
    }, 
    CurrencyTransferProcessAttemptedCounter = {
        eventName = "CurrencyTransferProcessAttemptedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when process transfer is attempted (send)."
    }, 
    CurrencyTransferProcessSucceededCounter = {
        eventName = "CurrencyTransferProcessSucceededCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when process transfer API reports success."
    }, 
    CurrencyTransferProcessFailedCounter = {
        eventName = "CurrencyTransferProcessFailedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when process transfer fails or is invalid (send)."
    }, 
    CurrencyTransferAcceptAttemptedCounter = {
        eventName = "CurrencyTransferAcceptAttemptedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when accept transfer API is invoked (receive)."
    }, 
    CurrencyTransferAcceptSucceededCounter = {
        eventName = "CurrencyTransferAcceptSucceededCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when accept transfer API succeeds."
    }, 
    CurrencyTransferAcceptFailedCounter = {
        eventName = "CurrencyTransferAcceptFailedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when accept transfer fails or is invalid (receive)."
    }, 
    CurrencyTransferAmpRecourseRequiredCounter = {
        eventName = "CurrencyTransferAmpRecourseRequiredCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when AMP recourse blocks the transfer flow."
    }, 
    CurrencyTransferInputSheetShownCounter = {
        eventName = "CurrencyTransferInputSheetShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the send transfer input sheet is shown."
    }, 
    CurrencyTransferConfirmSheetShownCounter = {
        eventName = "CurrencyTransferConfirmSheetShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the send transfer confirm sheet is shown."
    }, 
    CurrencyTransferFAEBlockSheetShownCounter = {
        eventName = "CurrencyTransferFAEBlockSheetShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the FAE (age verification) block sheet is shown."
    }, 
    CurrencyTransferFAEBlockContinueClickedCounter = {
        eventName = "CurrencyTransferFAEBlockContinueClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the user taps Continue on the FAE block sheet."
    }, 
    CurrencyTransferVPCBlockDialogShownCounter = {
        eventName = "CurrencyTransferVPCBlockDialogShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the VPC (parent consent) block dialog is shown."
    }, 
    CurrencyTransferVPCBlockAskClickedCounter = {
        eventName = "CurrencyTransferVPCBlockAskClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the user taps Ask on the VPC block dialog."
    }, 
    CurrencyTransferVPCBlockCancelClickedCounter = {
        eventName = "CurrencyTransferVPCBlockCancelClickedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the user taps Cancel on the VPC block dialog."
    }, 
    CurrencyTransferSubscriptionUpsellWizardOpenedCounter = {
        eventName = "CurrencyTransferSubscriptionUpsellWizardOpenedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the Plus subscription upsell AMP wizard is opened from the transfer flow."
    }, 
    CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter = {
        eventName = "CurrencyTransferSubscriptionUpsellWizardResultGrantedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the subscription upsell wizard completes with access granted."
    }, 
    CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter = {
        eventName = "CurrencyTransferSubscriptionUpsellWizardResultDeniedCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2026, 
            3, 
            19
        }, 
        throttlingPercentage = 100, 
        description = "Counter fired when the subscription upsell wizard completes without access granted."
    }
};