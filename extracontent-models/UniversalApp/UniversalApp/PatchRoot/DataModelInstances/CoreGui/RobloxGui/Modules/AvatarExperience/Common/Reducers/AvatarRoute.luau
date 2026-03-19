local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAvatarSceneRoute);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute.new({});
return v3.createReducer(v5, {
    [v4.name] = function(_, v7) --[[ Line: 20 ]]
        return v7.avatarRoute;
    end
});