local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
return v2.makeActionCreator(script.Name, function(v7, v8, v9, v10) --[[ Line: 22 ]]
    return {
        assetTypeId = v7, 
        assetId = v8, 
        overrideOrder = v9, 
        overrideAdjustments = v10
    };
end);