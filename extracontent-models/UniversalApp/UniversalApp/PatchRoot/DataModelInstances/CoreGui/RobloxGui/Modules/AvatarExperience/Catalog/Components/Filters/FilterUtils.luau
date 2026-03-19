local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v22 = {
    mapHeightToSize = function(v12) --[[ Line: 19 ]] --[[ Name: mapHeightToSize ]]
        return UDim2.new(1, 0, 0, v12);
    end, 
    selectCatalogSort = function(v13) --[[ Line: 23 ]] --[[ Name: selectCatalogSort ]]
        return v13.AvatarExperience.Catalog.SortAndFilters.CatalogSort;
    end, 
    selectCatalogSortAggregation = function(v14) --[[ Line: 27 ]] --[[ Name: selectCatalogSortAggregation ]]
        return v14.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation;
    end, 
    selectSalesTypeFilter = function(v15) --[[ Line: 31 ]] --[[ Name: selectSalesTypeFilter ]]
        return v15.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter;
    end, 
    selectCreatorFilter = function(v16) --[[ Line: 35 ]] --[[ Name: selectCreatorFilter ]]
        return v16.AvatarExperience.Catalog.SortAndFilters.CreatorFilter;
    end, 
    selectWearTimeFilter = function(v17) --[[ Line: 39 ]] --[[ Name: selectWearTimeFilter ]]
        return v17.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter;
    end, 
    selectUnavailableItemFilter = function(v18) --[[ Line: 43 ]] --[[ Name: selectUnavailableItemFilter ]]
        return v18.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter;
    end, 
    selectMinPrice = function(v19) --[[ Line: 47 ]] --[[ Name: selectMinPrice ]]
        return v19.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice;
    end, 
    selectMaxPrice = function(v20) --[[ Line: 51 ]] --[[ Name: selectMaxPrice ]]
        return v20.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice;
    end, 
    selectSortAndFilters = function(v21) --[[ Line: 55 ]] --[[ Name: selectSortAndFilters ]]
        return v21.AvatarExperience.Catalog.SortAndFilters;
    end
};
local v32 = l_memoize_0(function(v23, v24, v25, v26, v27, v28, v29, v30) --[[ Line: 60 ]]
    -- upvalues: v6 (copy)
    local v31 = true;
    if v23 ~= v6.MostFavorited then
        v31 = v23 == v6.Bestselling;
    end;
    return v23 .. "," .. (if v31 then v24 else "") .. "," .. v25.minPrice .. "," .. v25.maxPrice .. "," .. v26 .. "," .. v27 .. "," .. v28 .. "," .. table.concat(v29, "-") .. "," .. (v30 or "");
end);
v22.selectSortAndFiltersKey = function(v33) --[[ Line: 93 ]] --[[ Name: selectSortAndFiltersKey ]]
    -- upvalues: v22 (copy)
    local l_SortAndFilters_0 = v33.AvatarExperience.Catalog.SortAndFilters;
    return v22.buildSortAndFiltersKeyFromSortAndFilters(l_SortAndFilters_0);
end;
v22.buildSortAndFiltersKeyFromSortAndFilters = function(v35) --[[ Line: 99 ]] --[[ Name: buildSortAndFiltersKeyFromSortAndFilters ]]
    -- upvalues: v32 (copy), l_FFlagAXDurablesSupport_0 (copy)
    local l_CatalogSort_0 = v35.CatalogSort;
    local l_CatalogSortAggregation_0 = v35.CatalogSortAggregation;
    local l_PriceRange_0 = v35.PriceRange;
    local l_SalesTypeFilter_0 = v35.SalesTypeFilter;
    local l_CreatorFilter_0 = v35.CreatorFilter;
    local l_UnavailableItemFilter_0 = v35.UnavailableItemFilter;
    local l_SelectedTopics_0 = v35.SelectedTopics;
    local l_WearTimeFilter_0 = v35.WearTimeFilter;
    return v32(l_CatalogSort_0, l_CatalogSortAggregation_0, l_PriceRange_0, l_SalesTypeFilter_0, l_CreatorFilter_0, l_UnavailableItemFilter_0, l_SelectedTopics_0, if l_FFlagAXDurablesSupport_0 then l_WearTimeFilter_0 else nil);
end;
v22.areSortAndFiltersEqual = function(v44, v45) --[[ Line: 120 ]] --[[ Name: areSortAndFiltersEqual ]]
    -- upvalues: v22 (copy)
    return v22.buildSortAndFiltersKeyFromSortAndFilters(v44) == v22.buildSortAndFiltersKeyFromSortAndFilters(v45);
end;
return v22;