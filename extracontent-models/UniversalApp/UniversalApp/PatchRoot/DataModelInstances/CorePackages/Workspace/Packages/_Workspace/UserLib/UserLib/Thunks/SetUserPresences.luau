local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local v1 = require(l_script_FirstAncestor_0.Utils.receiveUsersPresence);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 5 ]]
        -- upvalues: v1 (ref), v2 (copy)
        v1(v2, v3);
    end;
end;