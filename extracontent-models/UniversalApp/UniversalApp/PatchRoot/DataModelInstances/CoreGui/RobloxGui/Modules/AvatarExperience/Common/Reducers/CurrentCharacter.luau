local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCurrentCharacter);
return v3.createReducer(nil, {
    [v4.name] = function(_, v6) --[[ Line: 16 ]]
        return v6.currentCharacter;
    end
});