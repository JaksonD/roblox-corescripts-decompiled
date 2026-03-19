local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort);
return v2.createReducer({}, {
    [v4.name] = function(_, v6) --[[ Line: 21 ]]
        return v6.savedAccessories;
    end
});