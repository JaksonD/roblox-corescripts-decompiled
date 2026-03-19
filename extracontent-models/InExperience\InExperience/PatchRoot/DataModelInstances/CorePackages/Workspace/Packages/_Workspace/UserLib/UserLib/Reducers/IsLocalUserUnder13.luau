local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local v1 = require(l_script_FirstAncestor_0.Actions.SetLocalUserUnder13);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v4 = true;
    if v2 ~= true then
        v4 = false;
    end;
    v2 = v4;
    if v3.type == v1.name then
        return v3.isUnder13;
    else
        return v2;
    end;
end;