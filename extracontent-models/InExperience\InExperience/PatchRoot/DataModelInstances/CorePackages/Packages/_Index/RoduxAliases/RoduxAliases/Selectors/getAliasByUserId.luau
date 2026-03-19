local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.getDeepValue);
local _ = require(l_Parent_0.RoduxAliasesTypes);
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    local l_keyPath_0 = v3.keyPath;
    return function(v5, v6) --[[ Line: 10 ]]
        -- upvalues: v1 (ref), l_keyPath_0 (copy)
        return v1(v5, l_keyPath_0 .. ".byUserId")[v6];
    end;
end;