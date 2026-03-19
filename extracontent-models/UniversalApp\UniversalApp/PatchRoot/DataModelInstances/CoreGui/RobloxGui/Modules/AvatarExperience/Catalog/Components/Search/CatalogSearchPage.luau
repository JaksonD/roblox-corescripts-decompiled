local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.CatalogSearch);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
return (require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((v6((v3.connect(function(v7, v8) --[[ Line: 40 ]]
    return {
        searchParameters = v7.SearchesParameters[v8.detail]
    };
end)(function(v9) --[[ Line: 24 ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy)
    local l_detail_0 = v9.detail;
    local l_searchParameters_0 = v9.searchParameters;
    return v2.createFragment({
        SearchPage = v2.createElement(v4, {
            searchUuid = l_detail_0, 
            searchParameters = l_searchParameters_0
        }), 
        OnFocusExperimentExposureLogger = v2.createElement(v5, {
            ixpTests = {}
        })
    });
end))))));