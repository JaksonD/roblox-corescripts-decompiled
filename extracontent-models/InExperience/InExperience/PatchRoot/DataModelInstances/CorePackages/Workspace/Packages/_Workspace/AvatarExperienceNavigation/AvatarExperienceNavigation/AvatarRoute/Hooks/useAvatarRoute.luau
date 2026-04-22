local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceNavigation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_script_FirstAncestor_0.AvatarRoute.Context.AvatarRouteContext);
local _ = require(l_script_FirstAncestor_0.AvatarRoute.Types);
return function() --[[ Line: 16 ]] --[[ Name: useAvatarRoute ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v6 = v2.useContext(v4);
    return v3.isNotNil(v6, "AvatarRouteContext");
end;