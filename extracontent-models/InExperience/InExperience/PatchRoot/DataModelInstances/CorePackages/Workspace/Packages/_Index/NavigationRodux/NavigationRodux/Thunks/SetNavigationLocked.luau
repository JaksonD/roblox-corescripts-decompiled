local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.ApplySetNavigationLocked);
local v3 = require(l_Parent_0.ArgCheck);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v2 (copy)
    v3.isType(v4, "boolean", "locked");
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v4 (copy)
        v5:dispatch(v2(v4));
    end;
end;