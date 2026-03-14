local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
return v2.makeActionCreator(script.Name, function(v5, v6, v7) --[[ Line: 14 ]]
    return {
        collectibleItemId = v5, 
        collectibleInstanceId = v6, 
        collectibleInstanceData = v7
    };
end);