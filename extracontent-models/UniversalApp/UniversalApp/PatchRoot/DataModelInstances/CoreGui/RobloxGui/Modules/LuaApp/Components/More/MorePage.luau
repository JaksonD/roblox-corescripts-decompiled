local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v6 = require(l_Modules_0.LuaApp.Components.More.MorePageGridLayout);
return function() --[[ Line: 10 ]]
    -- upvalues: v4 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v3 (copy), v6 (copy)
    v4.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
        l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.MorePageExposureLayer);
    end, {});
    return v3.createElement(v6);
end;