local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(...) --[[ Line: 9 ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (ref)
        local v4 = {
            type = v2
        };
        local v5 = v3(...);
        return (v1.Dictionary.union(v5, v4));
    end;
end;