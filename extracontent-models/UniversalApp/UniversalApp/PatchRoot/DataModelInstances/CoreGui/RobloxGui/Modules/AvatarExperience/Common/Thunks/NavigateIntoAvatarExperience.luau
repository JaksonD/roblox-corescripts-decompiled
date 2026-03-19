local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.ApplyNavigateIntoAvatarExperience);
local v5 = {
    {
        name = l_AvatarScreen_0.AvatarExperienceRoot
    }
};
return function(v6, v7, v8) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: v4 (ref), v6 (copy), v7 (copy), v3 (ref), v5 (ref), v8 (copy)
        v9:dispatch(v4(v6, v7));
        v9:dispatch(v3(v5, v8));
    end;
end;