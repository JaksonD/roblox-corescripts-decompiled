local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
return function(v2) --[[ Line: 4 ]] --[[ Name: getPremiumUpsellPrecheck ]]
    -- upvalues: v1 (copy)
    return v2.getPremiumUpsellPrecheck():andThen(function(_) --[[ Line: 7 ]]
        -- upvalues: v1 (ref)
        return v1.resolve(true);
    end):catch(function(_) --[[ Line: 10 ]]
        -- upvalues: v1 (ref)
        return v1.resolve(false);
    end);
end;