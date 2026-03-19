local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_CoreGui_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.CoreGui;
local l_status_0, _ = pcall(function() --[[ Line: 4 ]]
    -- upvalues: l_CoreGui_0 (copy)
    local _ = l_CoreGui_0.Name;
end);
return function() --[[ Line: 8 ]] --[[ Name: isPluginSecurity ]]
    -- upvalues: l_status_0 (copy)
    return l_status_0;
end;