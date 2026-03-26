local l_script_FirstAncestor_0 = script:FindFirstAncestor("IAPExperience");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_IconName_0 = v3.Enums.IconName;
local v6 = require(l_script_FirstAncestor_0.Utility.formatNumber);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v8 = require(l_script_FirstAncestor_0.Generic.Hooks.usePlaceholderLocalization);
local v9 = require(l_script_FirstAncestor_0.Generic.PriceLineItem);
local l_DiscountType_0 = require(l_script_FirstAncestor_0.ProductPurchase.PricingTypes).DiscountType;
local v11 = l_getIconRichText_0(l_IconName_0.Robux);
local function v18(v12) --[[ Line: 27 ]] --[[ Name: RobloxSubscriptionDiscountRow ]]
    -- upvalues: l_LocalizationService_0 (copy), v2 (copy), v11 (copy), v6 (copy), v8 (copy), v9 (copy)
    local l_discount_0 = v12.discount;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v15 = v2.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v11 (ref), v6 (ref), l_RobloxLocaleId_0 (copy), l_discount_0 (copy)
        return string.format("- %s %s", v11, v6(l_RobloxLocaleId_0, l_discount_0.amountInRobux));
    end, {
        l_RobloxLocaleId_0, 
        l_discount_0.amountInRobux
    });
    local v16 = l_discount_0.percent > 0;
    local v17 = v8({
        discountLabel = if v16 then {
            "IAPExperience.PurchasePrompt.Label.BlackbirdDiscount"; 
            discountPercentage = l_discount_0.percent
        } else "IAPExperience.PurchasePrompt.Label.BlackbirdDiscountNoPercent"
    });
    return v2.createElement(v9, {
        label = v17.discountLabel, 
        amount = v15, 
        LayoutOrder = v12.LayoutOrder
    });
end;
local function v25(v19) --[[ Line: 51 ]] --[[ Name: GenericDiscountRow ]]
    -- upvalues: l_LocalizationService_0 (copy), v2 (copy), v11 (copy), v6 (copy), v8 (copy), v9 (copy)
    local l_discount_1 = v19.discount;
    local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
    local v22 = v2.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: v11 (ref), v6 (ref), l_RobloxLocaleId_1 (copy), l_discount_1 (copy)
        return string.format("- %s %s", v11, v6(l_RobloxLocaleId_1, l_discount_1.amountInRobux));
    end, {
        l_RobloxLocaleId_1, 
        l_discount_1.amountInRobux
    });
    local v23 = l_discount_1.percent > 0;
    local v24 = v8({
        discountLabel = if v23 then {
            "IAPExperience.PurchasePrompt.Label.GenericDiscount"; 
            discountPercentage = l_discount_1.percent
        } else "IAPExperience.PurchasePrompt.Label.GenericDiscountNoPercent"
    });
    return v2.createElement(v9, {
        label = v24.discountLabel, 
        amount = v22, 
        LayoutOrder = v19.LayoutOrder
    });
end;
local v26 = {
    [l_DiscountType_0.BlackbirdSubscription] = v18
};
return function(v27) --[[ Line: 79 ]] --[[ Name: DiscountRow ]]
    -- upvalues: v26 (copy), v25 (copy), v2 (copy)
    local v28 = v26[v27.discount.type] or v25;
    return v2.createElement(v28, v27);
end;