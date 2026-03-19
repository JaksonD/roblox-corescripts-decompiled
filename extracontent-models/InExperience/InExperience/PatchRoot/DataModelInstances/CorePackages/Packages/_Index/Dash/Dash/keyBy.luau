local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.collect);
return function(v2, v3) --[[ Line: 15 ]] --[[ Name: keyBy ]]
    -- upvalues: v1 (copy)
    return v1(v2, function(v4, v5) --[[ Line: 16 ]]
        -- upvalues: v3 (copy)
        local _ = nil;
        return if typeof(v3) == "function" then v3(v5, v4) else v5[v3], v5;
    end);
end;