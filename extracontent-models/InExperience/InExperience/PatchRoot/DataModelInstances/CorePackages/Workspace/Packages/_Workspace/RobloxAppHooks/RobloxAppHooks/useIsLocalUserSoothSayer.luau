local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 6 ]]
    -- upvalues: l_useSelector_0 (copy)
    return l_useSelector_0(function(v2) --[[ Line: 7 ]]
        return v2.IsLocalUserSoothsayer;
    end);
end;