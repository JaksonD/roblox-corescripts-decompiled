local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local v1 = require(l_script_FirstAncestor_0.Actions.SetLocalUserId);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if v3.type == v1.name then
        return v3.userId;
    else
        return v2 or "";
    end;
end;