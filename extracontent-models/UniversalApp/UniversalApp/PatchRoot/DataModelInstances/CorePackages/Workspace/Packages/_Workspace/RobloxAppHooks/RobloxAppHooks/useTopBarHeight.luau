local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 8 ]]
    -- upvalues: l_useSelector_0 (copy)
    return l_useSelector_0(function(v2) --[[ Line: 9 ]]
        if not v2.TopBar then
            return 0;
        elseif v2.TopBar.topBarHeight then
            return v2.TopBar.topBarHeight;
        else
            return 0;
        end;
    end);
end;