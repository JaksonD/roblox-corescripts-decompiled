local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v2 = require(script.Parent.useLocalUserId);
return function() --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_useSelector_0 (copy)
    local v3 = v2();
    return l_useSelector_0(function(v4) --[[ Line: 9 ]]
        -- upvalues: v3 (copy)
        return v4.UserRobux[v3];
    end);
end;