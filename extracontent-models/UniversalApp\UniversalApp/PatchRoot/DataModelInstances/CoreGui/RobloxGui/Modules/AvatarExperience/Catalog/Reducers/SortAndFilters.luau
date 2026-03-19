local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.CatalogSort);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.CatalogSortAggregation);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.PriceRange);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SalesTypeFilter);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.CreatorFilter);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.UnavailableItemFilter);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SelectedTopics);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.WearTimeFilter);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
return v2.combineReducers({
    CatalogSort = v3, 
    CatalogSortAggregation = v4, 
    PriceRange = v5, 
    SalesTypeFilter = v6, 
    CreatorFilter = v7, 
    UnavailableItemFilter = v8, 
    SelectedTopics = v9, 
    WearTimeFilter = if l_FFlagAXDurablesSupport_0 then v10 else nil
});