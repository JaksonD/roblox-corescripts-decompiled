local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceNavigation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Navigation);
local v3 = require(l_script_FirstAncestor_0.Enums.AvatarRootNavigationAction);
local _ = require(l_script_FirstAncestor_0.Enums.CustomGetStateForAction);
return function(v5, v6) --[[ Line: 14 ]] --[[ Name: RegisterCustomGetStateForAction ]]
    -- upvalues: v3 (copy)
    return {
        type = v3.RegisterCustomGetStateForAction, 
        handlerId = v5, 
        handler = v6
    };
end;