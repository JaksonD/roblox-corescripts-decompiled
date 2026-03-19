local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxPresence");
local v1 = require(l_script_FirstAncestor_0.getDeepValue);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local l_keyPath_0 = v2.keyPath;
    return function(v4, v5) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), l_keyPath_0 (copy)
        return v1(v4, l_keyPath_0 .. ".byUserId")[v5];
    end;
end;