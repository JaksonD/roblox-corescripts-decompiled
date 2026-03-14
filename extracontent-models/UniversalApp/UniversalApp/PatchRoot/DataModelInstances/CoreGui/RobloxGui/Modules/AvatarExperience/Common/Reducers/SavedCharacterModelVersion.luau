local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.IncrementSavedCharacterModelVersion);
return v2.createReducer(0, {
    [v3.name] = function(v4, _) --[[ Line: 12 ]]
        return v4 + 1;
    end
});