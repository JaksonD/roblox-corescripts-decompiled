local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.reduce);
return function(v2) --[[ Line: 16 ]] --[[ Name: sum ]]
    -- upvalues: v1 (copy)
    return v1(v2, function(v3, v4) --[[ Line: 17 ]]
        return v3 + v4;
    end, 0);
end;