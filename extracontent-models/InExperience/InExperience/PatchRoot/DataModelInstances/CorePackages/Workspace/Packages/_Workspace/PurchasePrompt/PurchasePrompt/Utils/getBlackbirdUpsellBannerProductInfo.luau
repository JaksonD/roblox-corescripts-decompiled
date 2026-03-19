local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local _ = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
return function(v2) --[[ Line: 11 ]] --[[ Name: getBlackbirdUpsellBannerProductInfo ]]
    local v3 = v2[1];
    local v4 = false;
    if v3.EligibleOffers and v3.EligibleOffers[1] then
        v4 = v3.EligibleOffers[1].OfferType == "FreeTrial";
    end;
    local v5 = nil;
    local v6 = v3.ProductTypeDetails and v3.ProductTypeDetails.RobloxSubscriptionProductDetails and v3.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig;
    if v6 and v6.VirtualTransactionDiscounts then
        local v7 = v6.VirtualTransactionDiscounts[1];
        if v7 then
            v5 = v7.DiscountPercent;
        end;
    end;
    return {
        isFreeTrial = v4, 
        initialDiscountPercentage = v5
    };
end;