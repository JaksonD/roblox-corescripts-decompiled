local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AvatarRouteContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Context.AvatarRouteContext;
local v3 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
return function(v4, v5) --[[ Line: 18 ]]
    -- upvalues: v3 (copy), l_AvatarRouteContext_0 (copy)
    return v3(v4, l_AvatarRouteContext_0.Consumer, "avatarRoute", v5);
end;