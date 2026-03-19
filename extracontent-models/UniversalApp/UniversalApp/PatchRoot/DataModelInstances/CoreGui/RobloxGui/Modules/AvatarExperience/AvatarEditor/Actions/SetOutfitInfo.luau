local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v3) --[[ Line: 12 ]]
    return {
        outfit = v3
    };
end);