local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.AvatarExperienceLoaded);
return v2.createReducer(false, {
    [v3.name] = function(_, _) --[[ Line: 10 ]]
        return true;
    end
});