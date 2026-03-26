local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local l_AddAnalyticsMetadata_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.AddAnalyticsMetadata;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local v9 = game:DefineFastFlag("AXUpdateAnalyticsFiltersEnums", false);
local v10 = game:DefineFastFlag("AXDeprecateAnalyticsFiltersEnums", false);
local v11 = {
    Relevance = l_UnifiedEventLogEnums_0.Sort.RELEVANCE, 
    PriceLowToHigh = l_UnifiedEventLogEnums_0.Sort.PRICE_LOW_TO_HIGH, 
    PriceHighToLow = l_UnifiedEventLogEnums_0.Sort.PRICE_HIGH_TO_LOW, 
    RecentlyCreated = l_UnifiedEventLogEnums_0.Sort.RECENTLY_CREATED, 
    BestsellingAllTime = l_UnifiedEventLogEnums_0.Sort.BEST_SELLING_ALL_TIME, 
    BestsellingPastWeek = l_UnifiedEventLogEnums_0.Sort.BEST_SELLING_PAST_WEEK, 
    BestsellingPastDay = l_UnifiedEventLogEnums_0.Sort.BEST_SELLING_PAST_DAY, 
    MostFavoritedAllTime = l_UnifiedEventLogEnums_0.Sort.MOST_FAVORITED_ALL_TIME, 
    MostFavoritedPastWeek = l_UnifiedEventLogEnums_0.Sort.MOST_FAVORITED_PAST_WEEK, 
    MostFavoritedPastDay = l_UnifiedEventLogEnums_0.Sort.MOST_FAVORITED_PAST_DAY
};
local function _(v12, v13) --[[ Line: 36 ]] --[[ Name: getEnumValue ]]
    -- upvalues: v11 (copy)
    if not v13 then
        v13 = "";
    end;
    return v11[v12 .. v13];
end;
return function(v15) --[[ Line: 44 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), l_AddAnalyticsMetadata_0 (copy), v10 (copy), v11 (copy), v9 (copy), l_UnifiedEventLogEnums_0 (copy)
    return function(v16) --[[ Line: 45 ]]
        -- upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), l_AddAnalyticsMetadata_0 (ref), v10 (ref), v11 (ref), v9 (ref), l_UnifiedEventLogEnums_0 (ref), v15 (copy)
        local v17 = v16:getState();
        local v18 = v2.selectMinPrice(v17);
        if v18 == v3.MinPriceFilter then
            v18 = nil;
        end;
        local v19 = v2.selectMaxPrice(v17);
        if v19 == v3.MaxPriceFilter then
            v19 = nil;
        end;
        local v20 = v2.selectCatalogSort(v17);
        local v21 = if not (v20 ~= v4.MostFavorited) or v20 == v4.Bestselling then v2.selectCatalogSortAggregation(v17) else nil;
        local v22 = v2.selectSalesTypeFilter(v17);
        if v22 == v5.All then
            v22 = nil;
        end;
        local v23 = v2.selectCreatorFilter(v17);
        if v23 == "" then
            v23 = nil;
        end;
        local v24 = v2.selectUnavailableItemFilter(v17) == v6.Show or nil;
        if v20 then
            v16:dispatch(l_AddAnalyticsMetadata_0({
                sortEnumValue = if v10 then nil else v11[v20 .. (v21 or "")], 
                sort = if v9 then v11[v20 .. (v21 or "")] else nil
            }));
        end;
        v16:dispatch(l_AddAnalyticsMetadata_0({
            filterSalesTypeEnumValue = if v10 then nil else if v22 == v5.Collectibles then l_UnifiedEventLogEnums_0.FiltersSalesType.SALES_TYPE_LIMITED else l_UnifiedEventLogEnums_0.FiltersSalesType.SALES_TYPE_ALL, 
            filterCreatorsTypeEnumValue = if v10 then nil else if v23 then l_UnifiedEventLogEnums_0.FiltersCreators.CREATORS_BY_USERNAME else l_UnifiedEventLogEnums_0.FiltersCreators.CREATORS_ALL, 
            filterPriceEnumValue = if v10 then nil else if v18 or v19 then l_UnifiedEventLogEnums_0.FiltersPrice.PRICE_RANGE else l_UnifiedEventLogEnums_0.FiltersPrice.PRICE_ANY, 
            filterUnavailableItemsEnumValue = if v10 then nil else if v24 then l_UnifiedEventLogEnums_0.FiltersUnavailableItems.UNAVAILABLE_ITEMS_SHOW else l_UnifiedEventLogEnums_0.FiltersUnavailableItems.UNAVAILABLE_ITEMS_HIDE, 
            filterSalesType = if v9 then if v22 == v5.Collectibles then l_UnifiedEventLogEnums_0.FiltersSalesType.SALES_TYPE_LIMITED else l_UnifiedEventLogEnums_0.FiltersSalesType.SALES_TYPE_ALL else nil, 
            filterCreatorsType = if v9 then if v23 then l_UnifiedEventLogEnums_0.FiltersCreators.CREATORS_BY_USERNAME else l_UnifiedEventLogEnums_0.FiltersCreators.CREATORS_ALL else nil, 
            filterPrice = if v9 then if v18 or v19 then l_UnifiedEventLogEnums_0.FiltersPrice.PRICE_RANGE else l_UnifiedEventLogEnums_0.FiltersPrice.PRICE_ANY else nil, 
            filterUnavailableItems = if v9 then if v24 then l_UnifiedEventLogEnums_0.FiltersUnavailableItems.UNAVAILABLE_ITEMS_SHOW else l_UnifiedEventLogEnums_0.FiltersUnavailableItems.UNAVAILABLE_ITEMS_HIDE else nil, 
            filterCreatorsName = v23 or "", 
            filterPriceMin = if v18 then tostring(v18) else "", 
            filterPriceMax = if v19 then tostring(v19) else ""
        }));
        v15.applySortAndFilters({
            minPrice = v18, 
            maxPrice = v19, 
            sortType = v20, 
            sortAggregation = v21, 
            salesTypeFilter = v22, 
            creatorFilter = v23, 
            includeOffSale = v24
        });
    end;
end;