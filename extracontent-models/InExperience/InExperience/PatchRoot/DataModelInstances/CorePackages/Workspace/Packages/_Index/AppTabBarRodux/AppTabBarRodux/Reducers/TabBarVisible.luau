local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppTabBarRodux");
local v1 = require(l_script_FirstAncestor_0.Actions.SetTabBarVisible);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if v2 == nil then
        v2 = false;
    end;
    if v3.type == v1.name then
        v2 = v3.isVisible;
    end;
    return v2;
end;