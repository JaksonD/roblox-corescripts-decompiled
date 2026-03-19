local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v4 = require(l_Modules_0.AvatarExperience.Common.withMappedProps);
local function v6(v5) --[[ Line: 10 ]] --[[ Name: filterAvatarRoute ]]
    -- upvalues: v2 (copy)
    return v2.Dictionary.join(v5, {
        avatarRoute = v2.None, 
        opaqueRoute = v5.avatarRoute.opaque
    });
end;
return function(v7) --[[ Line: 25 ]]
    -- upvalues: v3 (copy), v4 (copy), v6 (copy)
    return v3(v4(v7, v6));
end;