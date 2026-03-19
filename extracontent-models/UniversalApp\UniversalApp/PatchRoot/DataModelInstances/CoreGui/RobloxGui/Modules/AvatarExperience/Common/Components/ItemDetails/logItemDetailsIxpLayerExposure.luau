local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
return function(_) --[[ Line: 5 ]] --[[ Name: logItemDetailsIxpLayerExposure ]]
    -- upvalues: l_IXPService_0 (copy), l_AppUserLayers_0 (copy)
    l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.AvatarMarketplaceItemDetailsPage);
end;