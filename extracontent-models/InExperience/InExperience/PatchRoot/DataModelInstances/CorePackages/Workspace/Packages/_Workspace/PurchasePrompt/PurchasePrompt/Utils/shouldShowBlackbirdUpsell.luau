local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local v1 = require(l_Parent_0.IAPExperience);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_DiscountType_0 = v1.DiscountType;
local l_isRequestTypeHiddenFromBlackbirdUpsell_0 = require(script.Parent.Parent.Utils.BlackbirdUpsellRequestTypeGating).isRequestTypeHiddenFromBlackbirdUpsell;
local v5 = require(script.Parent.BlackbirdUpsellImpressionTracker);
local l_FFlagEnableBlackbirdUpsellImpressionGating_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdUpsellImpressionGating;
local v7 = game:DefineFastInt("FIntBlackbirdUpsellMinPriceForDiscountInclusive", 10);
local v8 = game:DefineFastInt("FIntBlackbirdUpsellMaxPriceForDiscountInclusive", 1000000);
return function(v9, v10, v11) --[[ Line: 25 ]] --[[ Name: shouldShowBlackbirdUpsell ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), l_isRequestTypeHiddenFromBlackbirdUpsell_0 (copy), v8 (copy), v7 (copy), l_DiscountType_0 (copy), l_FFlagEnableBlackbirdUpsellImpressionGating_0 (copy), v5 (copy)
    if v11 then
        return false;
    elseif l_getAppFeaturePolicies_0().getDisableBlackbirdEntrypoints() then
        return false;
    elseif v10 and l_isRequestTypeHiddenFromBlackbirdUpsell_0(v10) then
        return false;
    else
        if v9 then
            local l_basePriceInRobux_0 = v9.basePriceInRobux;
            local l_v8_0 = v8;
            if l_basePriceInRobux_0 <= v7 or l_v8_0 ~= 0 and l_v8_0 <= l_basePriceInRobux_0 then
                return false;
            end;
        end;
        if v9 then
            local l_discounts_0 = v9.discounts;
            if l_discounts_0 then
                for _, v16 in l_discounts_0 do
                    if v16.type == l_DiscountType_0.BlackbirdSubscription or v16.type == l_DiscountType_0.RobloxPlusSubscription then
                        return false;
                    end;
                end;
            end;
        end;
        if l_FFlagEnableBlackbirdUpsellImpressionGating_0 and v5.hasReachedMaxImpressions() then
            return false;
        else
            return true;
        end;
    end;
end;