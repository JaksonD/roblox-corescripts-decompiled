local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Reducers.Aliases.byUserId);
local _ = require(l_Parent_0.RoduxAliasesTypes);
local v3 = {};
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v1 (copy)
    return function(v5, v6) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v1 (ref), v4 (copy)
        local v7 = v5 or v3;
        return {
            byUserId = v1(v4)(v7.byUserId, v6)
        };
    end;
end;