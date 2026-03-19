local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageLoaded);
return v3.createReducer(false, {
    [v4.name] = function(_, v6) --[[ Line: 13 ]]
        return v6.value;
    end
});