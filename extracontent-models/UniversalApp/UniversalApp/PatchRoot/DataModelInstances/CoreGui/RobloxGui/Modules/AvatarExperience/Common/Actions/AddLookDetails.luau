local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.makeActionCreator(script.Name, function(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 32 ]]
    return {
        lookAssetInfos = v8, 
        lookBundleInfos = v9, 
        lookId = v5, 
        lookType = v10, 
        totalValue = v11, 
        totalPrice = v6, 
        totalPremiumPrice = v7, 
        curator = v12, 
        description = v13, 
        moderationStatus = v14, 
        name = v15, 
        displayProperties = v16, 
        favoriteCount = v17, 
        isFavorited = v18
    };
end);