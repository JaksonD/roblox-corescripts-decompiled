local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStartup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactUtils);
local _ = require(l_script_FirstAncestor_0.Enums);
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
return function() --[[ Line: 7 ]]
    -- upvalues: l_useSelector_0 (copy)
    return l_useSelector_0(function(v5) --[[ Line: 8 ]]
        return v5.LaunchContext;
    end);
end;