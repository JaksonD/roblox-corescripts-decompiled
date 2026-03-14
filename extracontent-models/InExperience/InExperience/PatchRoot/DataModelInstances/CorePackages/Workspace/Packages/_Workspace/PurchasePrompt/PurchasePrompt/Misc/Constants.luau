local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.strict);
return v1({
    ABTests = v1({
        PRODUCT_PURCHASE = "AllUsers.Payments.ProductPurchaseABTest", 
        PRODUCT_PURCHASE_UPSELL = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTest", 
        PRODUCT_PURCHASE_UPSELL_UWP = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestUWP", 
        PRODUCT_PURCHASE_UPSELL_AMAZON = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestAmazon", 
        PRODUCT_PURCHASE_UPSELL_XBOX = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestXbox"
    }, "Constants.ABTests"), 
    PlatformPurchaseResult = v1({
        PurchaseResult_Error = -1, 
        PurchaseResult_Success = 0, 
        PurchaseResult_UserCancelled = 1, 
        PurchaseResult_ConsumeRequestFail = 2, 
        PurchaseResult_RobuxUpdated = 3, 
        PurcahseResult_NoActionNeeded = 4
    }, "Constants.PlatformPurchaseResult"), 
    PurchaseFailureReason = v1({
        TwoStepVerificationRequired = "TwoStepVerificationRequired", 
        EconomyDisabled = "EconomyDisabled"
    }, "Constants.TransactionStatus"), 
    ProductType = v1({
        CollectibleItem = "Collectible Item", 
        DeveloperProduct = "Developer Product", 
        Asset = "Asset", 
        Bundle = "Bundle"
    }, "Constants.ProductType"), 
    Currency = v1({
        Robux = 1
    }, "Constants.Currency"), 
    TermsOfUse = v1({
        DMCCAUrl = "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use#robux-and-premium-membership"
    }, "Constants.TermsOfUse"), 
    PerformanceMetrics = v1({
        Prefix = v1({
            UnifiedPurchaseModal = "UnifiedPurchaseModal", 
            PurchaseModal = "PurchaseModal", 
            RobuxUpsellModal = "RobuxUpsellModal"
        }, "Constants.PerformanceMetrics.Prefix"), 
        IntervalName = v1({
            ProductPurchaseContainerShown = "ProductPurchaseContainerShown", 
            RobuxUpsellModalShown = "RobuxUpsellModalShown"
        }, "Constants.PerformanceMetrics.IntervalName")
    }, "Constants.PerformanceMetrics")
}, "Constants");