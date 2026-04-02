local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local v1 = require(l_Parent_0.IAPExperience);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_DiscountType_0 = v1.DiscountType;
local l_isRequestTypeHiddenFromBlackbirdUpsell_0 = require(script.Parent.Parent.Utils.BlackbirdUpsellRequestTypeGating).isRequestTypeHiddenFromBlackbirdUpsell;
return function(v5, v6) --[[ Line: 16 ]] --[[ Name: shouldShowBlackbirdUpsell ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), l_isRequestTypeHiddenFromBlackbirdUpsell_0 (copy), l_DiscountType_0 (copy)
    if l_getAppFeaturePolicies_0().getDisableBlackbirdEntrypoints() then
        return false;
    elseif v6 and l_isRequestTypeHiddenFromBlackbirdUpsell_0(v6) then
        return false;
    else
        if v5 then
            local l_discounts_0 = v5.discounts;
            if l_discounts_0 then
                for _, v9 in l_discounts_0 do
                    if v9.type == l_DiscountType_0.BlackbirdSubscription then
                        return false;
                    end;
                end;
            end;
        end;
        return true;
    end;
end;