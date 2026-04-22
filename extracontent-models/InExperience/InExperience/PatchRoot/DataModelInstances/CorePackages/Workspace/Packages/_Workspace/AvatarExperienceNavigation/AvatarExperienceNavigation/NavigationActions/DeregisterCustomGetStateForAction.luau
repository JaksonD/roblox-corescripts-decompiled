local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceNavigation");
local v1 = require(l_script_FirstAncestor_0.Enums.AvatarRootNavigationAction);
local _ = require(l_script_FirstAncestor_0.Enums.CustomGetStateForAction);
return function(v3) --[[ Line: 6 ]] --[[ Name: DeregisterCustomGetStateForAction ]]
    -- upvalues: v1 (copy)
    return {
        type = v1.DeregisterCustomGetStateForAction, 
        handlerId = v3
    };
end;