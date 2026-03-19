local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v3 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseMatchingScreens);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), l_AvatarScreen_0 (copy)
    return v3(v4, {
        l_AvatarScreen_0.ItemDetails
    });
end;