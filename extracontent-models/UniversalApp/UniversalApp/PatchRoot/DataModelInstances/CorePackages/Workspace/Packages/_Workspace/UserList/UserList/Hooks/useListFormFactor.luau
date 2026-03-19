local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_script_FirstAncestor_0.Common.Enums);
return function() --[[ Line: 11 ]]
    -- upvalues: l_useSelector_0 (copy)
    return {
        formFactor = l_useSelector_0(function(v4) --[[ Line: 12 ]]
            return v4.FormFactor;
        end)
    };
end;