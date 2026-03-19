local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.IncrementCharacterVersion);
return v3.createReducer(0, {
    [v4.name] = function(v5, _) --[[ Line: 37 ]]
        return v5 + 1;
    end
});