local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType);
local v5 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
return v2.createReducer(v5.Position, {
    [v4.name] = function(_, v7) --[[ Line: 20 ]]
        return v7.adjustmentType;
    end
});