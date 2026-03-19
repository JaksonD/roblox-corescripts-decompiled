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
local v13 = {
    new = function() --[[ Line: 29 ]] --[[ Name: new ]]
        return {
            price = 0, 
            productId = 0, 
            purchased = false, 
            receipt = "", 
            success = false, 
            transactionStatus = ""
        };
    end
};
v13.fromJsonData = function(v14) --[[ Line: 40 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v13 (copy), v5 (copy)
    local v15 = v13.new();
    v5.isType(v14, "table", "PurchaseDeveloperProductModel.fromJsonData's jsonData");
    v5.isType(v14.price, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.price");
    v5.isType(v14.productId, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.productId");
    v5.isType(v14.purchased, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.purchased");
    v5.isTypeOrNil(v14.receipt, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.receipt");
    v5.isTypeOrNil(v14.success, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.success");
    v5.isTypeOrNil(v14.transactionStatus, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.transactionStatus");
    v15.price = v14.price;
    v15.productId = v14.productId;
    v15.purchased = v14.purchased == true;
    v15.receipt = v14.receipt;
    v15.success = v14.success == true;
    v15.transactionStatus = v14.transactionStatus;
    return v15;
end;
return function(v16, v17, v18) --[[ Line: 65 ]] --[[ Name: performDevProductEdpPurchase ]]
    -- upvalues: l_Logging_0 (copy), v6 (copy), v3 (copy), l_isEconomicRestrictionResponse_0 (copy), v13 (copy)
    return v16.performDevProductEdpPurchase(v17, v18):andThen(function(v19) --[[ Line: 66 ]]
        -- upvalues: l_Logging_0 (ref), v6 (ref), v3 (ref), l_isEconomicRestrictionResponse_0 (ref), v13 (ref)
        if type(v19) ~= "table" then
            l_Logging_0.warn("Response from PurchaseDeveloperProduct is malformed!");
            return v6.reject(v3.UnknownFailure);
        elseif l_isEconomicRestrictionResponse_0(v19) then
            return v6.reject(v19);
        else
            local v20 = v13.fromJsonData(v19);
            if v20.purchased then
                return v6.resolve(v20);
            else
                return v6.reject(v3.UnknownFailure);
            end;
        end;
    end, function(v21) --[[ Line: 84 ]]
        -- upvalues: v6 (ref)
        return v6.reject(v21);
    end);
end;