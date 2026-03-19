local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_useSelector_0 (copy)
    return l_useSelector_0(function(v3) --[[ Line: 7 ]]
        -- upvalues: v2 (copy)
        if v2 then
            return v3.Users[v2];
        else
            return nil;
        end;
    end);
end;