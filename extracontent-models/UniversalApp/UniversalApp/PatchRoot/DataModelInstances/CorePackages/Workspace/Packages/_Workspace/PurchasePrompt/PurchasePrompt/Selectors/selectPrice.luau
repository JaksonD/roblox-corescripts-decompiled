local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local _ = require(l_Parent_0.IAPExperience);
return function(v2) --[[ Line: 17 ]] --[[ Name: selectPrice ]]
    local l_productInfo_0 = v2.productInfo;
    local v4 = l_productInfo_0.price or 0;
    local v5 = l_productInfo_0.basePrice or v4;
    local v6 = l_productInfo_0.priceDiscountDetails or {};
    return {
        priceInRobux = v4, 
        basePriceInRobux = v5, 
        discounts = v6
    };
end;