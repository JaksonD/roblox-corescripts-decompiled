local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
return v1.makeActionCreator(script.Name, function(v3) --[[ Line: 21 ]]
    return {
        assetData = v3.assetData, 
        bundleData = v3.bundleData, 
        widget = v3.widget
    };
end);