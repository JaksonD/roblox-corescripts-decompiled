local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v1.makeActionCreator(script.Name, function(v4, v5) --[[ Line: 13 ]]
    return {
        outfitId = v4, 
        name = v5
    };
end);