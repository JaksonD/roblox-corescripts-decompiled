local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v6) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), l_useAvatarRoute_0 (copy), v5 (copy)
    local v7, v8 = v2.useState(false);
    local v9 = l_useAvatarRoute_0();
    v2.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: v5 (ref), v9 (copy), v6 (copy), v8 (copy)
        local v10 = v5.isWithinViewContext(v9, v6);
        v8(v10);
    end, {
        v9
    });
    return v7;
end;