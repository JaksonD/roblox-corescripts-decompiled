local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PurchaseError);
local v2 = require(l_Parent_0.Promise);
return function(v3, v4, v5) --[[ Line: 6 ]] --[[ Name: getCatalogItemDetails ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v3.getCatalogItemDetails(v4, v5):andThen(function(v6) --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v2.resolve(v6);
    end):catch(function(_) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v1 (ref)
        return v2.reject(v1.UnknownFailure);
    end);
end;