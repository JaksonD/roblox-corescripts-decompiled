local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v3, v4, v5) --[[ Line: 16 ]]
    return {
        bundleId = v3, 
        bundleTypeId = v4, 
        recommendedItems = v5
    };
end);