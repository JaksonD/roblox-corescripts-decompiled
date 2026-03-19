local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearSelectedTopics);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSelectedTopics);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSortAndFilters);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
return v3.createReducer(v9.DefaultFilters.SelectedTopics, {
    [v6.name] = function(_, v12) --[[ Line: 23 ]]
        return v12.selectedTopics;
    end, 
    [v5.name] = function(_, _) --[[ Line: 27 ]]
        -- upvalues: v9 (copy)
        return v9.DefaultFilters.SelectedTopics;
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 31 ]]
        return v16.SelectedTopics or v15;
    end, 
    [v8.name] = function(_, _) --[[ Line: 35 ]]
        -- upvalues: v9 (copy)
        return v9.DefaultFilters.SelectedTopics;
    end, 
    [v10.name] = function(v19, v20) --[[ Line: 38 ]]
        return v20.topics or v19;
    end
});