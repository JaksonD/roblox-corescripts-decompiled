local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
return v2.makeActionCreator(script.Name, function(v4, v5, v6, v7) --[[ Line: 18 ]]
    return {
        position = v4, 
        rotation = v5, 
        scale = v6, 
        itemId = v7
    };
end);