local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v3 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
return function(v4, v5) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), l_AvatarScreen_0 (copy)
    return function(v6) --[[ Line: 15 ]]
        -- upvalues: v3 (ref), v5 (copy), l_AvatarScreen_0 (ref), v4 (copy)
        for _, v8 in v6:getState().AvatarExperience.Common.FullView do
            if v8 == v3.SceneFullView then
                return;
            end;
        end;
        v5.navigate(l_AvatarScreen_0.AvatarExperienceQuickMenu, {
            onOverlayClosed = v4
        });
    end;
end;