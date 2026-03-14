local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v3, v4) --[[ Line: 13 ]]
    return {
        bundleId = v3, 
        isOwned = v4
    };
end);