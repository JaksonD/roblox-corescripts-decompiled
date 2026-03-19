local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCreatorFilter);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
return (v3.createReducer(v8.DefaultFilters.CreatorFilter, {
    [v5.name] = function(_, v11) --[[ Line: 26 ]]
        return v11.creatorFilter;
    end, 
    [v6.name] = function(_, _) --[[ Line: 29 ]]
        -- upvalues: v8 (copy)
        return v8.DefaultFilters.CreatorFilter;
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 32 ]]
        return v15.CreatorFilter or v14;
    end, 
    [v9.name] = function(v16, v17) --[[ Line: 35 ]]
        return v17.creatorFilter or v16;
    end
}));