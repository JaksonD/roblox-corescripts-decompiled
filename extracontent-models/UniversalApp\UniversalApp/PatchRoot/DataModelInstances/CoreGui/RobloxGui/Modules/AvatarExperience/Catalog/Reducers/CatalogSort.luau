local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogSort);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
return v3.createReducer(v8.DefaultFilters.CatalogSort, {
    [v4.name] = function(_, v11) --[[ Line: 21 ]]
        return v11.sort;
    end, 
    [v5.name] = function(_, _) --[[ Line: 24 ]]
        -- upvalues: v8 (copy)
        return v8.DefaultFilters.CatalogSort;
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 27 ]]
        return v15.CatalogSort or v14;
    end, 
    [v9.name] = function(v16, v17) --[[ Line: 30 ]]
        return v17.sortType or v16;
    end
});