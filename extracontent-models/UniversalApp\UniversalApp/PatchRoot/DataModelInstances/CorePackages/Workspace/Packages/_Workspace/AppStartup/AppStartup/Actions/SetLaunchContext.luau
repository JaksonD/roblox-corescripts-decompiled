local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppStartup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_script_FirstAncestor_0.Enums);
return l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 6 ]]
    return {
        launchContext = v4
    };
end);