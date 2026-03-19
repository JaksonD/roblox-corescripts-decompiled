local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
return v1.makeActionCreator(script.Name, function(v4, v5, v6) --[[ Line: 18 ]]
    return {
        assetId = v4, 
        assetTypeId = v5, 
        recommendedItems = v6
    };
end);