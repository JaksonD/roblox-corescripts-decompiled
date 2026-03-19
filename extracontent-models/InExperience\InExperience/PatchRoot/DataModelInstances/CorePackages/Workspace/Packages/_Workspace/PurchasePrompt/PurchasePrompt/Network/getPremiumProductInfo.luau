local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3) --[[ Line: 5 ]] --[[ Name: getPremiumProductInfo ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v3.getPremiumProductInfo():catch(function(_) --[[ Line: 6 ]]
        -- upvalues: v2 (ref), v1 (ref)
        return v2.reject(v1.UnknownFailureNoItemName);
    end);
end;