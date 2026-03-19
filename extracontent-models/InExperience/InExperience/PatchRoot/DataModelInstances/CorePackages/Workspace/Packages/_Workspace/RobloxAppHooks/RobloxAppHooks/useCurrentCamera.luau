local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
return function() --[[ Line: 5 ]] --[[ Name: useCurrentCamera ]]
    -- upvalues: l_useProperty_0 (copy)
    return l_useProperty_0(workspace, "CurrentCamera");
end;