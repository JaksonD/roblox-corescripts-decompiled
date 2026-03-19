local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Utils.parseSubscriptionError);
return function(v3, v4, v5) --[[ Line: 5 ]] --[[ Name: performSubscriptionPurchase ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v3.performSubscriptionPurchase(v4, v5):catch(function(v6) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v2 (ref)
        return v1.reject(v2(v6));
    end);
end;