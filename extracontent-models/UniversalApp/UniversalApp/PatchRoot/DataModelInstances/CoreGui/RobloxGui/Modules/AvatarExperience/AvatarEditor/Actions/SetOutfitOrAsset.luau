local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
return v2.makeActionCreator(script.Name, function(v5, v6) --[[ Line: 19 ]]
    return {
        ids = v5, 
        itemType = v6
    };
end);