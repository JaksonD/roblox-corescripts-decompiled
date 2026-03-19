local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
return v1.makeActionCreator(script.Name, function(v3, v4, v5, v6) --[[ Line: 22 ]]
    return {
        assetId = tostring(v3), 
        moderationStatus = v4, 
        assetName = v5, 
        universeId = v6
    };
end);