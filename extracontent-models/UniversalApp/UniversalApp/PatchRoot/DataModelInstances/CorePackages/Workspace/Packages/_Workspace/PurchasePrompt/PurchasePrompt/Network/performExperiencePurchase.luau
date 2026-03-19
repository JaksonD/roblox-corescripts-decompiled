local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local _ = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v4 = require(l_Parent_0.Http);
local v5 = require(l_Parent_0.ArgCheck);
local v6 = require(l_script_FirstAncestor_0.Promise);
local v7 = require(l_Parent_0.IAPExperience);
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local _ = v4.Url;
local _ = v4.PerformFetch;
local l_isEconomicRestrictionResponse_0 = v7.Utility.isEconomicRestrictionResponse;
local _ = require(l_script_FirstAncestor_0.types);
local v13 = {};
local v14 = {
    InsufficientFunds = "InsufficientFunds"
};
v13.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    return {
        purchased = false, 
        productId = 0, 
        reason = "", 
        title = "", 
        showDivId = "", 
        shortfallPrice = 0, 
        statusCode = 0
    };
end;
v13.fromJsonData = function(v15) --[[ Line: 46 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v13 (copy), v5 (copy)
    local v16 = v13.new();
    v5.isType(v15, "table", "PurchaseExperienceProduct.fromJsonData's jsonData");
    v5.isType(v15.purchased, "boolean", "PurchaseExperienceProduct.fromJsonData's jsonData.purchased");
    v5.isType(v15.productId, "number", "PurchaseExperienceProduct.fromJsonData's jsonData.productId");
    v5.isTypeOrNil(v15.reason, "string", "PurchaseExperienceProduct.fromJsonData's jsonData.reason");
    v5.isTypeOrNil(v15.title, "string", "PurchaseProduct.fromJsonData's jsonData.title");
    v5.isTypeOrNil(v15.showDivId, "string", "PurchaseProduct.fromJsonData's jsonData.showDivId");
    v5.isTypeOrNil(v15.shortfallPrice, "number", "PurchaseProduct.fromJsonData's jsonData.shortfallPrice");
    v5.isTypeOrNil(v15.statusCode, "number", "PurchaseProduct.fromJsonData's jsonData.statusCode");
    v16.purchased = v15.purchased == true;
    v16.productId = tonumber(v15.productId);
    v16.reason = v15.reason;
    v16.title = v15.title;
    v16.showDivId = v15.showDivId;
    v16.shortfallPrice = v15.shortfallPrice;
    v16.statusCode = v15.statusCode;
    return v16;
end;
return function(v17, v18, v19) --[[ Line: 69 ]] --[[ Name: performExperiencePurchase ]]
    -- upvalues: l_Logging_0 (copy), v6 (copy), v3 (copy), l_isEconomicRestrictionResponse_0 (copy), v13 (copy), v14 (copy)
    return v17.performExperiencePurchase(v18, v19):andThen(function(v20) --[[ Line: 70 ]]
        -- upvalues: l_Logging_0 (ref), v6 (ref), v3 (ref), l_isEconomicRestrictionResponse_0 (ref), v13 (ref), v14 (ref)
        if type(v20) ~= "table" then
            l_Logging_0.warn("Response from performExperiencePurchase is malformed!");
            return v6.reject(v3.UnknownFailure);
        elseif l_isEconomicRestrictionResponse_0(v20) then
            return v6.reject(v20);
        else
            local v21 = v13.fromJsonData(v20);
            if v21.purchased then
                return v6.resolve(v21);
            elseif v21.reason and v21.reason == v14.InsufficientFunds then
                return v6.reject(v3.NotEnoughRobux);
            else
                return v6.reject(v3.UnknownFailure);
            end;
        end;
    end, function(v22) --[[ Line: 93 ]]
        -- upvalues: v6 (ref)
        return v6.reject(v22);
    end);
end;