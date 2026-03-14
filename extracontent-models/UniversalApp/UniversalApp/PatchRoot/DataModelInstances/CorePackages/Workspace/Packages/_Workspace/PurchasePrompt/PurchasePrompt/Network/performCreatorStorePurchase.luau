local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local _ = require(l_Parent_0.Misc.Constants);
local v3 = require(l_Parent_0.Promise);
return function(v4, v5, v6) --[[ Line: 7 ]] --[[ Name: performCreatorStorePurchase ]]
    -- upvalues: v3 (copy), v1 (copy)
    return v4.performCreatorStorePurchase(v5, v6):andThen(function(v7) --[[ Line: 8 ]]
        -- upvalues: v3 (ref), v1 (ref)
        if v7.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_ALREADY_OWNED" or v7.purchaseTransactionStatus == "PURCHASE_TRANSACTION_STATUS_SUCCESS" then
            return v3.resolve(v7);
        else
            return v3.reject(v1.UnknownFailure);
        end;
    end, function(_) --[[ Line: 17 ]]
        -- upvalues: v3 (ref), v1 (ref)
        return v3.reject(v1.UnknownFailure);
    end);
end;