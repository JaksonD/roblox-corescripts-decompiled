local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWearTimeFilter);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
return (v3.createReducer(v8.DefaultFilters.WearTimeFilter, {
    [v5.name] = function(_, v12) --[[ Line: 26 ]]
        return v12.wearTimeFilter;
    end, 
    [v6.name] = function(_, _) --[[ Line: 29 ]]
        -- upvalues: v8 (copy)
        return v8.DefaultFilters.WearTimeFilter;
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 32 ]]
        return v16.WearTimeFilter or v15;
    end, 
    [v10.name] = function(v17, v18) --[[ Line: 35 ]]
        return v18.wearTimeFilter or v17;
    end
}));