local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v3 = require(l_script_FirstAncestor_0.Promise);
local v4 = require(l_Parent_0.IAPExperience);
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local l_isEconomicRestrictionResponse_0 = v4.Utility.isEconomicRestrictionResponse;
local v7 = require(l_script_FirstAncestor_0.Utils.parseSubscriptionError);
return function(v8, v9, v10) --[[ Line: 12 ]] --[[ Name: performDeveloperSubscriptionRobuxPurchase ]]
    -- upvalues: l_Logging_0 (copy), v3 (copy), v2 (copy), l_isEconomicRestrictionResponse_0 (copy), v7 (copy)
    return v8.performDeveloperSubscriptionRobuxPurchase(v9, v10):andThen(function(v11) --[[ Line: 13 ]]
        -- upvalues: l_Logging_0 (ref), v3 (ref), v2 (ref), l_isEconomicRestrictionResponse_0 (ref), v7 (ref)
        if type(v11) ~= "table" then
            l_Logging_0.warn("Response from performDeveloperSubscriptionRobuxPurchase is malformed!");
            return v3.reject(v2.UnknownFailure);
        elseif l_isEconomicRestrictionResponse_0(v11) then
            return v3.reject(v11);
        elseif v11.errors then
            local v12 = v11.errors[1];
            local v13 = v12 and v12.message or nil;
            if v13 then
                return v3.reject(v7(v13));
            else
                return v3.reject(v2.UnknownFailure);
            end;
        else
            return v3.resolve(v11);
        end;
    end, function(v14) --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v7 (ref)
        return v3.reject(v7(v14));
    end);
end;