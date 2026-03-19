local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v3 = require(l_script_FirstAncestor_0.Promise);
local l_isEconomicRestrictionResponse_0 = require(l_Parent_0.IAPExperience).Utility.isEconomicRestrictionResponse;
local v5 = require(l_script_FirstAncestor_0.Utils.parseSubscriptionError);
return function(v6, v7) --[[ Line: 11 ]] --[[ Name: performDeveloperSubscriptionFiatPurchase ]]
    -- upvalues: l_isEconomicRestrictionResponse_0 (copy), v3 (copy), v5 (copy), v2 (copy)
    return v6.performSubscriptionPurchase(v7, ""):andThen(function(v8) --[[ Line: 12 ]]
        -- upvalues: l_isEconomicRestrictionResponse_0 (ref), v3 (ref)
        if l_isEconomicRestrictionResponse_0(v8) then
            return v3.reject(v8);
        else
            return v3.resolve(v8);
        end;
    end, function(v9) --[[ Line: 18 ]]
        -- upvalues: v3 (ref), v5 (ref), v2 (ref)
        if type(v9) == "string" then
            return v3.reject(v5(v9));
        else
            return v3.reject(v2.UnknownFailure);
        end;
    end);
end;