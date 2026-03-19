local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local _ = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v4 = require(l_Parent_0.Http);
local _ = require(l_Parent_0.ArgCheck);
local v6 = require(l_script_FirstAncestor_0.Promise);
local v7 = require(l_Parent_0.IAPExperience);
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local _ = v4.Url;
local _ = v4.PerformFetch;
local l_isEconomicRestrictionResponse_0 = v7.Utility.isEconomicRestrictionResponse;
local _ = require(l_script_FirstAncestor_0.types);
local v13 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Failure = "Failure", 
    PartialSuccess = "PartialSuccess"
};
return function(v14, v15, v16) --[[ Line: 24 ]] --[[ Name: performLookPurchase ]]
    -- upvalues: l_Logging_0 (copy), v6 (copy), v3 (copy), l_isEconomicRestrictionResponse_0 (copy), v13 (copy)
    return v14.performLookPurchase(v15, v16):andThen(function(v17) --[[ Line: 25 ]]
        -- upvalues: l_Logging_0 (ref), v6 (ref), v3 (ref), l_isEconomicRestrictionResponse_0 (ref), v13 (ref)
        if type(v17) ~= "table" then
            l_Logging_0.warn("Response from performLookPurchase is malformed!");
            return v6.reject(v3.UnknownFailure);
        elseif l_isEconomicRestrictionResponse_0(v17) then
            return v6.reject(v17);
        elseif v17.purchaseLookStatus == v13.Success or v17.purchaseLookStatus == v13.PartialSuccess then
            return v6.resolve(v17);
        else
            return v6.reject(v3.UnknownFailure);
        end;
    end, function(v18) --[[ Line: 43 ]]
        -- upvalues: v6 (ref)
        return v6.reject(v18);
    end);
end;