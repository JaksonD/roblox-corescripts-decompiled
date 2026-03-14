local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.makeActionCreator(script.Name, function(v4) --[[ Line: 11 ]]
    return {
        assetIdToOrderAndAssetTypeId = v4
    };
end);