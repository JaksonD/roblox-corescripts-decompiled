local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local _ = require(l_script_FirstAncestor_0.Types);
return v1.Rodux.makeActionCreator(script.Name, function(v3) --[[ Line: 7 ]]
    return {
        payload = v3
    };
end);