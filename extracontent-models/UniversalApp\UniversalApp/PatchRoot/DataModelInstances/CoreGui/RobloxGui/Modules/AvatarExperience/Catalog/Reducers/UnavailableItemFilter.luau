local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetUnavailableItemFilter);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
return v3.createReducer(v9.DefaultFilters.UnavailableItemFilter, {
    [v5.name] = function(_, v12) --[[ Line: 25 ]]
        return v12.unavailableItemFilter;
    end, 
    [v6.name] = function(_, _) --[[ Line: 28 ]]
        -- upvalues: v9 (copy)
        return v9.DefaultFilters.UnavailableItemFilter;
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 31 ]]
        return v16.UnavailableItemFilter or v15;
    end, 
    [v10.name] = function(v17, v18) --[[ Line: 34 ]]
        return v18.unavailableItemFilter or v17;
    end
});