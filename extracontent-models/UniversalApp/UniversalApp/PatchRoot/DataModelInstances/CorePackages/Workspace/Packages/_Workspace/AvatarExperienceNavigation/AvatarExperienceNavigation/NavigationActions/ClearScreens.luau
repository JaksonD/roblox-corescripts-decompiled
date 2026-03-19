local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceNavigation");
local v1 = require(l_script_FirstAncestor_0.Enums.AvatarMainStackNavigationAction);
return function(v2) --[[ Line: 5 ]] --[[ Name: ClearScreens ]]
    -- upvalues: v1 (copy)
    return {
        type = v1.ClearScreens, 
        routeNames = v2
    };
end;