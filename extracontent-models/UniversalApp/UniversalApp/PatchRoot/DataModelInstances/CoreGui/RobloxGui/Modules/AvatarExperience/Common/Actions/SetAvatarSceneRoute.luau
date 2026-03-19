local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
return v1.makeActionCreator(script.Name, function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    v2.isType(v4, "table", "avatarRoute");
    return {
        avatarRoute = v4
    };
end);