local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetPriceRange);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
return v3.createReducer(v7.DefaultFilters.PriceRange, {
    [v4.name] = function(_, v11) --[[ Line: 21 ]]
        return v11.priceRange;
    end, 
    [v5.name] = function(_, _) --[[ Line: 24 ]]
        -- upvalues: v7 (copy)
        return v7.DefaultFilters.PriceRange;
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 27 ]]
        return v15.PriceRange or v14;
    end, 
    [v9.name] = function(v16, v17) --[[ Line: 30 ]]
        return v17.priceRange or v16;
    end
});