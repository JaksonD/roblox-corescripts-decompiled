local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3) --[[ Line: 7 ]] --[[ Name: checkUserPurchaseSettings ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v3.checkUserPurchaseSettings():andThen(function(v4) --[[ Line: 10 ]]
        -- upvalues: v2 (ref)
        return v2.resolve(v4);
    end):catch(function(_) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v1 (ref)
        return v2.reject(v1.UnknownFailure);
    end);
end;