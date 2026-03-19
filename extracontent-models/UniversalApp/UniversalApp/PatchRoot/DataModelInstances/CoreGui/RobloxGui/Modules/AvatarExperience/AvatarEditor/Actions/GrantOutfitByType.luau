local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
return v1.makeActionCreator(script.Name, function(v3, v4) --[[ Line: 13 ]]
    return {
        outfitTypeId = v3, 
        outfitId = v4
    };
end);