local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local l_AddAnalyticsMetadata_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.AddAnalyticsMetadata;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local v5 = {
    sort = l_UnifiedEventLogEnums_0.Sort.RELEVANCE, 
    filterSalesType = l_UnifiedEventLogEnums_0.FiltersSalesType.SALES_TYPE_ALL, 
    filterCreatorsType = l_UnifiedEventLogEnums_0.FiltersCreators.CREATORS_ALL, 
    filterPrice = l_UnifiedEventLogEnums_0.FiltersPrice.PRICE_ANY, 
    filterUnavailableItems = l_UnifiedEventLogEnums_0.FiltersUnavailableItems.UNAVAILABLE_ITEMS_HIDE, 
    filterPriceMin = "", 
    filterPriceMax = "", 
    filterCreatorsName = ""
};
return function() --[[ Line: 21 ]]
    -- upvalues: v2 (copy), l_AddAnalyticsMetadata_0 (copy), v5 (copy)
    return function(v6) --[[ Line: 22 ]]
        -- upvalues: v2 (ref), l_AddAnalyticsMetadata_0 (ref), v5 (ref)
        v6:dispatch(v2());
        v6:dispatch(l_AddAnalyticsMetadata_0(v5));
    end;
end;