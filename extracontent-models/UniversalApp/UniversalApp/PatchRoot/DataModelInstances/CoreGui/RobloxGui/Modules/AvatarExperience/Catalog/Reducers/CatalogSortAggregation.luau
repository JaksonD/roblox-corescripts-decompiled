local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogSort);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
return v3.createReducer(v9.DefaultFilters.CatalogSortAggregation, {
    [v5.name] = function(_, v12) --[[ Line: 24 ]]
        return v12.sortAggregation;
    end, 
    [v6.name] = function(_, _) --[[ Line: 27 ]]
        -- upvalues: v9 (copy)
        return v9.DefaultFilters.CatalogSortAggregation;
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 30 ]]
        return v16.CatalogSortAggregation or v15;
    end, 
    [v10.name] = function(v17, v18) --[[ Line: 33 ]]
        return v18.sortAggregation or v17;
    end
});