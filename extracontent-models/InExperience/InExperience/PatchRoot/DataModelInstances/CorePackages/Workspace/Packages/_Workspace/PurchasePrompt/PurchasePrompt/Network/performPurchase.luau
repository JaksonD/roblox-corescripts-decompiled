local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local v1 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v2 = require(l_script_FirstAncestor_0.Misc.Constants);
local v3 = require(l_script_FirstAncestor_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Utils.isGenericChallengeResponse);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_isEconomicRestrictionResponse_0 = require(l_Parent_0.IAPExperience).Utility.isEconomicRestrictionResponse;
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
return function(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 16 ]] --[[ Name: performPurchase ]]
    -- upvalues: l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), v3 (copy), v2 (copy), v1 (copy), v4 (copy), l_isEconomicRestrictionResponse_0 (copy)
    return v8.performPurchase(v9, v10, v11, v12, v13, v14, v15, v16, v17, if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then v18 else nil):andThen(function(v19) --[[ Line: 42 ]]
        -- upvalues: v3 (ref), v2 (ref), v1 (ref), v4 (ref), l_isEconomicRestrictionResponse_0 (ref)
        if v19.purchased or v19.reason == "AlreadyOwned" then
            return v3.resolve(v19);
        elseif v19.reason == v2.PurchaseFailureReason.EconomyDisabled then
            return v3.reject(v1.PurchaseDisabled);
        elseif v19.reason == v2.PurchaseFailureReason.TwoStepVerificationRequired then
            return v3.reject(v1.TwoFactorNeeded);
        elseif v19.transactionStatus == 24 then
            return v3.reject(v1.TwoFactorNeeded);
        elseif v4(v19) then
            return v3.reject(v19);
        elseif l_isEconomicRestrictionResponse_0(v19) then
            return v3.reject(v19);
        else
            return v3.reject(v1.UnknownFailure);
        end;
    end, function(_) --[[ Line: 65 ]]
        -- upvalues: v3 (ref), v1 (ref)
        return v3.reject(v1.UnknownFailure);
    end);
end;