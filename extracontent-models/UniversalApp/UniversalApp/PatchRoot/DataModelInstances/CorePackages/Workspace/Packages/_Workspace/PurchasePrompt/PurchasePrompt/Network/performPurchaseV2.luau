local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Misc.Constants);
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.Utils.isGenericChallengeResponse);
local l_Parent_1 = l_Parent_0.Parent;
local l_isEconomicRestrictionResponse_0 = require(l_Parent_1.IAPExperience).Utility.isEconomicRestrictionResponse;
return function(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 15 ]] --[[ Name: performPurchaseV2 ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy), v4 (copy), l_isEconomicRestrictionResponse_0 (copy)
    return v7.performPurchaseV2(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17):andThen(function(v18) --[[ Line: 41 ]]
        -- upvalues: v3 (ref), v2 (ref), v1 (ref), v4 (ref), l_isEconomicRestrictionResponse_0 (ref)
        if v18.purchased or v18.reason == "AlreadyOwned" then
            return v3.resolve(v18);
        elseif v18.reason == v2.PurchaseFailureReason.EconomyDisabled then
            return v3.reject(v1.PurchaseDisabled);
        elseif v18.reason == v2.PurchaseFailureReason.TwoStepVerificationRequired then
            return v3.reject(v1.TwoFactorNeeded);
        elseif v18.transactionStatus == 24 then
            return v3.reject(v1.TwoFactorNeeded);
        elseif v4(v18) then
            return v3.reject(v18);
        elseif l_isEconomicRestrictionResponse_0(v18) then
            return v3.reject(v18);
        else
            return v3.reject(v1.UnknownFailure);
        end;
    end, function(_) --[[ Line: 64 ]]
        -- upvalues: v3 (ref), v1 (ref)
        return v3.reject(v1.UnknownFailure);
    end);
end;