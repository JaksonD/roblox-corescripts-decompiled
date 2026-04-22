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
local v21 = {
    mapHeightToSize = function(v11) --[[ Line: 17 ]] --[[ Name: mapHeightToSize ]]
        return UDim2.new(1, 0, 0, v11);
    end, 
    selectCatalogSort = function(v12) --[[ Line: 21 ]] --[[ Name: selectCatalogSort ]]
        return v12.AvatarExperience.Catalog.SortAndFilters.CatalogSort;
    end, 
    selectCatalogSortAggregation = function(v13) --[[ Line: 25 ]] --[[ Name: selectCatalogSortAggregation ]]
        return v13.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation;
    end, 
    selectSalesTypeFilter = function(v14) --[[ Line: 29 ]] --[[ Name: selectSalesTypeFilter ]]
        return v14.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter;
    end, 
    selectCreatorFilter = function(v15) --[[ Line: 33 ]] --[[ Name: selectCreatorFilter ]]
        return v15.AvatarExperience.Catalog.SortAndFilters.CreatorFilter;
    end, 
    selectWearTimeFilter = function(v16) --[[ Line: 37 ]] --[[ Name: selectWearTimeFilter ]]
        return v16.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter;
    end, 
    selectUnavailableItemFilter = function(v17) --[[ Line: 41 ]] --[[ Name: selectUnavailableItemFilter ]]
        return v17.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter;
    end, 
    selectMinPrice = function(v18) --[[ Line: 45 ]] --[[ Name: selectMinPrice ]]
        return v18.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice;
    end, 
    selectMaxPrice = function(v19) --[[ Line: 49 ]] --[[ Name: selectMaxPrice ]]
        return v19.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice;
    end, 
    selectSortAndFilters = function(v20) --[[ Line: 53 ]] --[[ Name: selectSortAndFilters ]]
        return v20.AvatarExperience.Catalog.SortAndFilters;
    end
};
local v31 = l_memoize_0(function(v22, v23, v24, v25, v26, v27, v28, v29) --[[ Line: 58 ]]
    -- upvalues: v6 (copy)
    local v30 = true;
    if v22 ~= v6.MostFavorited then
        v30 = v22 == v6.Bestselling;
    end;
    return v22 .. "," .. (if v30 then v23 else "") .. "," .. v24.minPrice .. "," .. v24.maxPrice .. "," .. v25 .. "," .. v26 .. "," .. v27 .. "," .. table.concat(v28, "-") .. "," .. (v29 or "");
end);
v21.selectSortAndFiltersKey = function(v32) --[[ Line: 91 ]] --[[ Name: selectSortAndFiltersKey ]]
    -- upvalues: v21 (copy)
    local l_SortAndFilters_0 = v32.AvatarExperience.Catalog.SortAndFilters;
    return v21.buildSortAndFiltersKeyFromSortAndFilters(l_SortAndFilters_0);
end;
v21.buildSortAndFiltersKeyFromSortAndFilters = function(v34) --[[ Line: 97 ]] --[[ Name: buildSortAndFiltersKeyFromSortAndFilters ]]
    -- upvalues: v31 (copy)
    local l_CatalogSort_0 = v34.CatalogSort;
    local l_CatalogSortAggregation_0 = v34.CatalogSortAggregation;
    local l_PriceRange_0 = v34.PriceRange;
    local l_SalesTypeFilter_0 = v34.SalesTypeFilter;
    local l_CreatorFilter_0 = v34.CreatorFilter;
    local l_UnavailableItemFilter_0 = v34.UnavailableItemFilter;
    local l_SelectedTopics_0 = v34.SelectedTopics;
    local l_WearTimeFilter_0 = v34.WearTimeFilter;
    return v31(l_CatalogSort_0, l_CatalogSortAggregation_0, l_PriceRange_0, l_SalesTypeFilter_0, l_CreatorFilter_0, l_UnavailableItemFilter_0, l_SelectedTopics_0, l_WearTimeFilter_0);
end;
v21.areSortAndFiltersEqual = function(v43, v44) --[[ Line: 118 ]] --[[ Name: areSortAndFiltersEqual ]]
    -- upvalues: v21 (copy)
    return v21.buildSortAndFiltersKeyFromSortAndFilters(v43) == v21.buildSortAndFiltersKeyFromSortAndFilters(v44);
end;
return v21;