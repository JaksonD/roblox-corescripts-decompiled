local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage);
return v2.createReducer(l_AvatarScreen_0.None, {
    [v5.name] = function(_, v7) --[[ Line: 16 ]]
        return v7.entryPage;
    end
});