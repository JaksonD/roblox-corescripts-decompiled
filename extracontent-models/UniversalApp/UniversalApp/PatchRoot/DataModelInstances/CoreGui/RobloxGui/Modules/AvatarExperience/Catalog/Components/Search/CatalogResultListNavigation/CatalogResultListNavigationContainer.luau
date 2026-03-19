local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.CatalogResultListNavigationView);
local v3 = require(script.Parent.useCatalogResultListNavigationViewModel);
return function(v4) --[[ Line: 9 ]] --[[ Name: CatalogResultListNavigationContainer ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v5 = v3(v4);
    return v1.createElement(v2, v5);
end;