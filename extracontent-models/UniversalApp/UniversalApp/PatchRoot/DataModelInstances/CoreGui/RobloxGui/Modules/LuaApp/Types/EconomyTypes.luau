local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
return {
    PurchaseDetail = v1.strictInterface({
        expectedCurrency = v1.optional(v1.integer), 
        expectedPrice = v1.optional(v1.integer), 
        expectedSellerId = v1.optional(v1.integer), 
        expectedPromoId = v1.optional(v1.integer), 
        userAssetId = v1.optional(v1.integer), 
        saleLocationType = v1.optional(v1.union(v1.literal("Website"), v1.literal("Game"))), 
        saleLocationId = v1.optional(v1.string)
    })
};