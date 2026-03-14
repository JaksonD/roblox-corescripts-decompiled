local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v14 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local l_withStyle_0 = v8.Style.withStyle;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v18.Enums.AvatarScreen;
local l_AvatarRoute_0 = v18.AvatarRoute.AvatarRoute;
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v23 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments);
local v24 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsList);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog);
local v28 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v29 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v30 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
local v31 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v34 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearSelectedTopics);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchWidgetInfo);
local v39 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v40 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v41 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ResetSortAndFilters);
local v42 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v43 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_getAXMarketplaceWidgetStore_0 = v22.Stores.getAXMarketplaceWidgetStore;
local v45 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v46 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXRemoveDupSearchCall);
local v47 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v48 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v50 = v3.PureComponent:extend("NavigationItemsView");
local v51 = require(l_Modules_0.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink);
local l_FFlagAXEditorSubcategoryFilters_0 = v21.FFlagAXEditorSubcategoryFilters;
local l_AXPrefetchMarketplaceIXP_0 = v23.AXPrefetchMarketplaceIXP;
local v54 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useMarketplaceResultsFetcher);
local l_FFlagAXUnifiedMarketplaceResultsFetcher_0 = v21.FFlagAXUnifiedMarketplaceResultsFetcher;
local l_FFlagAXPrefetchOnlyWithinTTL_0 = v21.FFlagAXPrefetchOnlyWithinTTL;
local l_FIntAXPrefetchTTL_0 = v21.FIntAXPrefetchTTL;
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v17.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_AXCatalogRealTimeRecommendationsIXP_0 = v23.AXCatalogRealTimeRecommendationsIXP;
local v60 = game:DefineFastInt("AXCatalogExitReEnterRefreshInterval", 60);
local l_FFlagAXCatalogCategoriesStore_0 = v21.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCatalogCategoriesSDUI_0 = v21.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXPassScreenSizeToWidgetApi_0 = v21.FFlagAXPassScreenSizeToWidgetApi;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v21.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXDefaultCatalogCategoryId_0 = v21.FFlagAXDefaultCatalogCategoryId;
local l_FFlagAXEnableTTIViaModule_0 = v21.FFlagAXEnableTTIViaModule;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_CatalogCategories_0 = v17.Enums.CatalogCategories;
local v69 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v70 = require(l_CorePackages_0.Packages.SignalsReact);
local l_useSignalState_0 = v70.useSignalState;
local v72 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_getShouldPageUseWidgetOnlyFetcher_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Utils.getShouldPageUseWidgetOnlyFetcher;
local v74 = {
    [l_AvatarScreen_0.AvatarEditor] = true, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = true, 
    [l_AvatarScreen_0.MySharedAvatars] = true, 
    [l_AvatarScreen_0.SearchLandingFocusedWidgetPage] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and true or nil
};
v50.validateProps = v9.strictInterface({
    defaultChildRef = v9.optional(v9.table), 
    NextSelectionUp = v9.optional(v9.table), 
    NextSelectionRight = v9.optional(v9.table), 
    multiTryOnBottomBarRef = v9.optional(v9.table), 
    itemDetailsPeekViewRefs = v9.table, 
    categoryId = v9.string, 
    subcategoryId = v9.optional(v9.string), 
    minPrice = v9.number, 
    maxPrice = v9.number, 
    selectedTopics = v9.optional(v9.table), 
    catalogSort = v9.string, 
    catalogSortAggregation = v9.string, 
    searchParameters = v9.optional(v9.table), 
    searchTime = v9.optional(v9.number), 
    searchUuid = v9.string, 
    categoryInfo = v9.table, 
    creatorFilter = v9.string, 
    salesTypeFilter = v9.string, 
    unavailableItemFilter = v9.string, 
    wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v9.optional(v9.string) else nil, 
    widgetFetchTime = v9.optional(v9.number), 
    externalNavigationRequest = if v51 then v9.table else nil, 
    isRecentMarketplaceUser = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v9.optional(v9.boolean) else nil, 
    screenSize = if l_FFlagAXPassScreenSizeToWidgetApi_0 then v9.string else nil, 
    filterCount = if l_FFlagAXPassScreenSizeToWidgetApi_0 then v9.number else nil, 
    setSearchType = v9.callback, 
    setSearchParameters = v9.callback, 
    dispatchSearch = v9.callback, 
    fetchWidgetInfo = v9.callback, 
    dispatchRemoveSearch = v9.callback, 
    clearSelectedTopics = v9.callback, 
    resetSortAndFilters = v9.callback, 
    dispatchCatalogTilesLatencyStartTracker = if v48() then v9.callback else nil, 
    pageObjectManager = v9.optional(v9.table), 
    avatarRoute = l_AvatarRoute_0.Interface, 
    namedRefs = v9.table, 
    networking = v9.callback, 
    catalogAnalytics = v9.table, 
    hasPrefetchedMarketplace = if not not l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then v9.optional(v9.boolean) else nil, 
    isPrefetchingMarketplace = if not not l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then v9.optional(v9.boolean) else nil, 
    fetchMarketplace = if not not l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then v9.optional(v9.callback) else nil, 
    fetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v9.optional(v9.number) else nil
});
local function _(v75) --[[ Line: 164 ]] --[[ Name: isCatalogPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v75.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog;
end;
local function _(v77) --[[ Line: 168 ]] --[[ Name: isCatalogSearchPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v77.avatarRoute.opaque.name == l_AvatarScreen_0.CatalogSearch;
end;
local v81 = l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() and function(v79) --[[ Line: 173 ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v45 (copy), l_CatalogCategories_0 (copy)
    if not (v79.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        return false;
    else
        local l_categoryInfo_0 = v79.categoryInfo;
        if not l_categoryInfo_0 then
            return false;
        else
            return l_categoryInfo_0.Id == if l_FFlagAXDefaultCatalogCategoryId_0 then v45.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
        end;
    end;
end or nil;
v50.init = function(v82) --[[ Line: 195 ]] --[[ Name: init ]]
    -- upvalues: l_AvatarScreen_0 (copy), v14 (copy), v3 (copy), l_Signal_0 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), v13 (copy), v12 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy)
    v82.itemsListRef = v82.props.namedRefs[l_AvatarScreen_0.Catalog .. v14.ItemsList];
    v82.scrollingFrameRef = v3.createRef();
    v82.navBarRef = v3.createRef();
    v82.backToTopSignal = l_Signal_0.new();
    v82:setState({
        restorePreviousChildFocus = true, 
        isInitialPrefetch = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v82.props.isInitialPrefetch else nil, 
        hasEnteredAvatarExperience = not l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() and nil
    });
    if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
        v82.lastMarketplaceFetchTime = 0;
    end;
    v82.dispatchInitialSearch = function() --[[ Line: 212 ]]
        -- upvalues: v82 (copy), v13 (ref)
        local l_dispatchSearch_0 = v82.props.dispatchSearch;
        local l_setSearchParameters_0 = v82.props.setSearchParameters;
        local l_categoryInfo_1 = v82.props.categoryInfo;
        local l_searchUuid_0 = v82.props.searchUuid;
        v82.props.setSearchType(l_searchUuid_0, v13.SearchTypes.Catalog);
        l_setSearchParameters_0(l_searchUuid_0, l_categoryInfo_1, v82.props.catalogSort, v82.props.catalogSortAggregation, v82.props.minPrice, v82.props.maxPrice, v82.props.selectedTopics);
        return l_dispatchSearch_0(v82.props.networking, l_searchUuid_0, l_categoryInfo_1);
    end;
    v82.fetchWidgetInfo = function(v87, v88) --[[ Line: 232 ]]
        -- upvalues: v12 (ref), v82 (copy)
        local v89 = nil;
        if v87 then
            v89 = v12.getContextForWidgetsById(v82.props.avatarRoute.opaque.name, v87, v88);
        end;
        return v82.props.fetchWidgetInfo(v82.props.networking, nil, v89);
    end;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v82.initialSearch = function() --[[ Line: 246 ]]
            -- upvalues: l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (ref), v82 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (ref)
            if l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then
                v82.props.fetchMarketplace();
                if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                    v82.lastMarketplaceFetchTime = os.time();
                    return;
                end;
            else
                v82.dispatchInitialSearch();
            end;
        end;
    end;
end;
if l_AXPrefetchMarketplaceIXP_0.isEnabled() then
    v50.hasPrefetchedMarketplace = function(v90) --[[ Line: 263 ]] --[[ Name: hasPrefetchedMarketplace ]]
        -- upvalues: v24 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_sendAXCounterV2_0 (copy), v43 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FIntAXPrefetchTTL_0 (copy), v48 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy)
        local v91 = v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser);
        local v92 = v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.UserIsInExperiment);
        if not v90.props.isRecentMarketplaceUser then
            return false;
        else
            l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.enteredMarketplaceAndIsRecentUser);
            if v92 then
                local v93 = not l_FFlagAXPrefetchOnlyWithinTTL_0 or not v90.props.fetchedMarketplaceTimestamp or os.time() - v90.props.fetchedMarketplaceTimestamp <= l_FIntAXPrefetchTTL_0;
                if not v93 then
                    return false;
                else
                    l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.inExperimentAndIsRecentUserAndEnteredMarketplace);
                    v24.logExperimentExposure(l_AXPrefetchMarketplaceIXP_0);
                    if v91 and v93 then
                        if v48() then
                            if l_FFlagAXEnableTTIViaModule_0 then
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Tiles);
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Thumbnails);
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Tiles);
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Thumbnails);
                            end;
                            v90.props.dispatchCatalogTilesLatencyStartTracker(v90.props.searchUuid);
                        end;
                        if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                            v90.lastMarketplaceFetchTime = os.time();
                        end;
                        v90:setState({
                            isInitialPrefetch = true
                        });
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end;
end;
v50.didMount = function(v94) --[[ Line: 345 ]] --[[ Name: didMount ]]
    -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy)
    if l_AXPrefetchMarketplaceIXP_0.isEnabled() and v94:hasPrefetchedMarketplace() then
        return;
    else
        if l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then
            v94.props.fetchMarketplace();
            if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                v94.lastMarketplaceFetchTime = os.time();
                return;
            end;
        else
            v94.dispatchInitialSearch();
            v94.fetchWidgetInfo(v94.props.categoryId, v94.props.subcategoryId);
        end;
        return;
    end;
end;
v50.searchResultsAreOld = function(v95, _, v97, v98) --[[ Line: 370 ]] --[[ Name: searchResultsAreOld ]]
    local v99 = if v98 then v98.searchTime else v95.props.searchTime;
    if not v97.TimeToRefresh or v97.TimeToRefresh < 0 or not v99 then
        return false;
    else
        return tick() - v99 > v97.TimeToRefresh;
    end;
end;
v50.updateSearchParams = function(v100, v101) --[[ Line: 380 ]] --[[ Name: updateSearchParams ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v48 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), v43 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy)
    local l_categoryInfo_2 = v101.categoryInfo;
    local l_searchUuid_1 = v101.searchUuid;
    local l_dispatchSearch_1 = v100.props.dispatchSearch;
    local l_setSearchParameters_1 = v100.props.setSearchParameters;
    local l_fetchWidgetInfo_0 = v100.fetchWidgetInfo;
    local v107 = true;
    if v101.categoryId == v100.props.categoryId then
        v107 = v101.subcategoryId ~= v100.props.subcategoryId;
    end;
    local v108 = false;
    if l_FFlagAXDurablesSupport_0 then
        v108 = v101.wearTimeFilter ~= v100.props.wearTimeFilter;
    end;
    if v107 or v101.catalogSort ~= v100.props.catalogSort or v101.catalogSortAggregation ~= v100.props.catalogSortAggregation or v101.minPrice ~= v100.props.minPrice or v101.maxPrice ~= v100.props.maxPrice or v101.selectedTopics ~= v100.props.selectedTopics or v101.creatorFilter ~= v100.props.creatorFilter or v101.salesTypeFilter ~= v100.props.salesTypeFilter or v101.unavailableItemFilter ~= v100.props.unavailableItemFilter or v108 then
        if v107 then
            v100.props.clearSelectedTopics();
            local v109 = v100.props.searchParameters[l_searchUuid_1];
            if v109 == nil then
                l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v101.catalogSort, v101.catalogSortAggregation, v101.minPrice, v101.maxPrice, v101.selectedTopics, v101.creatorFilter, v101.salesTypeFilter, v101.unavailableItemFilter, if l_FFlagAXDurablesSupport_0 then v101.wearTimeFilter else nil);
                if v48() then
                    if l_FFlagAXEnableTTIViaModule_0 then
                        l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Thumbnails);
                        l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Thumbnails);
                    end;
                    v100.props.dispatchCatalogTilesLatencyStartTracker(l_searchUuid_1);
                end;
                l_dispatchSearch_1(v100.props.networking, l_searchUuid_1, l_categoryInfo_2);
                l_fetchWidgetInfo_0(v101.categoryId, v101.subcategoryId);
            else
                local v110 = v100:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_2, v101) or v109.catalogSort and v109.catalogSort ~= v101.catalogSort or v109.catalogSortAggregation and v109.catalogSortAggregation ~= v101.catalogSortAggregation or v109.minPrice and v109.minPrice ~= v101.minPrice or v109.maxPrice and v109.maxPrice ~= v101.maxPrice or v109.selectedTopics and v109.selectedTopics ~= v101.selectedTopics or v109.creatorFilter and v109.creatorFilter ~= v101.creatorFilter or v109.salesTypeFilter and v109.salesTypeFilter ~= v101.salesTypeFilter or v109.unavailableItemFilter and v109.unavailableItemFilter ~= v101.unavailableItemFilter;
                local v111 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_getShouldPageUseWidgetOnlyFetcher_0(v101.categoryInfo, v101.filterCount, v109 and v109.searchKeyword) else nil;
                if l_FFlagAXPassScreenSizeToWidgetApi_0 and v111 then
                    v110 = false;
                end;
                if v110 then
                    if v100:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_2, v101) then
                        v100.props.catalogAnalytics.sendAXCounter(v43.Counter.CatalogRefresh.StaleResults);
                    end;
                    v100.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
                    v100.props.dispatchRemoveSearch(l_searchUuid_1);
                    if v48() then
                        if l_FFlagAXEnableTTIViaModule_0 then
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Tiles);
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Thumbnails);
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Tiles);
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Thumbnails);
                        end;
                        v100.props.dispatchCatalogTilesLatencyStartTracker(l_searchUuid_1);
                    end;
                    l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v101.catalogSort, v101.catalogSortAggregation, v101.minPrice, v101.maxPrice, v101.selectedTopics, v101.creatorFilter, v101.salesTypeFilter, v101.unavailableItemFilter, if l_FFlagAXDurablesSupport_0 then v101.wearTimeFilter else nil);
                    l_dispatchSearch_1(v100.props.networking, l_searchUuid_1, l_categoryInfo_2);
                    l_fetchWidgetInfo_0(v101.categoryId, v101.subcategoryId);
                end;
            end;
        else
            v100.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
            v100.props.dispatchRemoveSearch(l_searchUuid_1);
            l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v101.catalogSort, v101.catalogSortAggregation, v101.minPrice, v101.maxPrice, v101.selectedTopics, v101.creatorFilter, v101.salesTypeFilter, v101.unavailableItemFilter, if l_FFlagAXDurablesSupport_0 then v101.wearTimeFilter else nil);
            l_dispatchSearch_1(v100.props.networking, l_searchUuid_1, l_categoryInfo_2);
        end;
        if v100.scrollingFrameRef.current then
            v100.scrollingFrameRef.current.CanvasPosition = Vector2.new();
        end;
    end;
end;
v50.willUpdate = function(v112, v113) --[[ Line: 575 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v46 (copy)
    if v112.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog and not (v113.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        v112.props.clearSelectedTopics();
        v112.props.resetSortAndFilters();
    end;
    if not (v112.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) and v113.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then
        v112.props.clearSelectedTopics();
    end;
    if v46 and not (v113.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        return;
    else
        v112:updateSearchParams(v113);
        return;
    end;
end;
v50.renderWithStyle = function(v114, v115) --[[ Line: 599 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), v26 (copy), v11 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy)
    local l_Theme_0 = v115.Theme;
    local l_defaultChildRef_0 = v114.props.defaultChildRef;
    local l_NextSelectionUp_0 = v114.props.NextSelectionUp;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = l_defaultChildRef_0, 
        restorePreviousChildFocus = v114.state.restorePreviousChildFocus, 
        defaultChild = v114.navBarRef, 
        NextSelectionRight = v114.props.NextSelectionRight
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        ResultsList = v3.createElement(v26, {
            frameRef = v114.itemsListRef, 
            navBarRef = v114.navBarRef, 
            analyticsContext = v11.AnalyticsContext.Catalog, 
            fromSearch = false, 
            searchUuid = v114.props.searchUuid, 
            layoutOrder = 2, 
            scrollingFrameRef = v114.scrollingFrameRef, 
            onRetry = if l_FFlagAXCatalogCategoriesSDUI_0 then v114.initialSearch else v114.dispatchInitialSearch, 
            NextSelectionUp = l_NextSelectionUp_0, 
            backToTopSignal = v114.backToTopSignal, 
            multiTryOnBottomBarRef = v114.props.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v114.props.itemDetailsPeekViewRefs, 
            categoryInfo = if l_FFlagAXCatalogCategoriesStore_0 then nil else if l_FFlagAXMoveAllTabToWidgetOnly_0 then v114.props.categoryInfo else nil
        })
    });
end;
v50.render = function(v119) --[[ Line: 642 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v120) --[[ Line: 643 ]]
        -- upvalues: v119 (copy)
        return v119:renderWithStyle(v120);
    end);
end;
if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
    v50.handleExitAndReEnterAvatarExperience = function(v121, v122) --[[ Line: 649 ]] --[[ Name: handleExitAndReEnterAvatarExperience ]]
        -- upvalues: v81 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v60 (copy), v24 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), l_sendAXCounterV2_0 (copy), v43 (copy)
        local l_isVisible_0 = v121.props.avatarRoute.isVisible;
        local l_isVisible_1 = v122.avatarRoute.isVisible;
        if l_isVisible_0 and not v121.state.hasEnteredAvatarExperience then
            v121:setState({
                hasEnteredAvatarExperience = true
            });
        end;
        if l_isVisible_0 and not l_isVisible_1 and v121.state.hasEnteredAvatarExperience and v81(v121.props) and l_FFlagAXUnifiedMarketplaceResultsFetcher_0 and v121.props.fetchMarketplace then
            local v125 = os.time();
            if v125 - v121.lastMarketplaceFetchTime >= v60 then
                if v24.readTestVariable(l_AXCatalogRealTimeRecommendationsIXP_0.UserIsInExperiment) then
                    v24.logExperimentExposure(l_AXCatalogRealTimeRecommendationsIXP_0);
                end;
                l_sendAXCounterV2_0(v43.Counter.FetchMarketplace.ExitAndReEnterRefreshCounter);
                if v24.readTestVariable(l_AXCatalogRealTimeRecommendationsIXP_0.EnabledForUser) then
                    l_sendAXCounterV2_0(v43.Counter.FetchMarketplace.ExitAndReEnterRefreshTreatment);
                    v121.props.fetchMarketplace();
                    v121.lastMarketplaceFetchTime = v125;
                    return;
                end;
            end;
        end;
    end;
end;
v50.didUpdate = function(v126, v127) --[[ Line: 699 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v74 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), v51 (copy), v34 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), v24 (copy), l_sendAXCounterV2_0 (copy), v43 (copy)
    local l_name_0 = v126.props.avatarRoute.current.name;
    local l_name_1 = v127.avatarRoute.current.name;
    if l_name_0 == l_AvatarScreen_0.Catalog then
        if not v126.state.restorePreviousChildFocus then
            v126:setState({
                restorePreviousChildFocus = true
            });
        end;
    elseif v74[l_name_0] and l_name_1 == l_AvatarScreen_0.Catalog and v126.state.restorePreviousChildFocus then
        v126:setState({
            restorePreviousChildFocus = false
        });
    end;
    if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
        v126:handleExitAndReEnterAvatarExperience(v127);
    end;
    local v130 = if l_FFlagAXPassScreenSizeToWidgetApi_0 and v126.props.searchParameters then v126.props.searchParameters[v126.props.searchUuid] else nil;
    local v131 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_getShouldPageUseWidgetOnlyFetcher_0(v126.props.categoryInfo, v126.props.filterCount, v130 and v130.searchKeyword) else nil;
    if l_FFlagAXPassScreenSizeToWidgetApi_0 and v126.props.screenSize and v127.screenSize and v126.props.screenSize ~= v127.screenSize and v131 then
        v126.props.fetchMarketplace();
    end;
    if v127.avatarRoute.opaque.name == l_AvatarScreen_0.CatalogSearch and v126.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then
        if v51 then
            if v126.props.externalNavigationRequest == v127.externalNavigationRequest and not v34.catalogDeepLinkExists(v126.props.externalNavigationRequest) then
                v126.props.resetSortAndFilters();
            end;
        else
            v126.props.resetSortAndFilters();
        end;
    end;
    local v132 = v126.props.categoryInfo and v126.props.categoryInfo.ShowWidgets;
    local v133 = v127.categoryInfo and v127.categoryInfo.ShowWidgets;
    local v134 = v132 and not v133;
    local v135 = false;
    if l_name_0 == l_AvatarScreen_0.Catalog then
        v135 = l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    if v134 or v135 then
        if l_FFlagAXPassScreenSizeToWidgetApi_0 and v131 then
            v126.props.fetchMarketplace();
        else
            v126.fetchWidgetInfo(v126.props.categoryId, v126.props.subcategoryId);
        end;
    end;
    local v136 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    local v137 = if v136 then v127.isPrefetchingMarketplace and not v127.hasPrefetchedMarketplace else nil;
    local v138 = if v136 then not v126.props.isPrefetchingMarketplace and not v126.props.hasPrefetchedMarketplace else nil;
    if v136 then
        if v126.props.hasPrefetchedMarketplace and v126.state.isInitialPrefetch then
            l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.inTreatmentAndHasPrefetchedMarketplace);
            v126:setState({
                isInitialPrefetch = false
            });
        end;
        if v137 and v138 and v126.state.isInitialPrefetch then
            l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.enteredMarketplaceButPrefetchFailed);
            v126.dispatchInitialSearch();
            v126.fetchWidgetInfo(v126.props.categoryId, v126.props.subcategoryId);
            v126:setState({
                isInitialPrefetch = false
            });
        end;
    end;
end;
v50 = v40((v32((v30(v5.connect(function(v139, v140) --[[ Line: 819 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v39 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v33 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_FFlagAXDurablesSupport_0 (copy), v51 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), v72 (copy)
    local v141 = nil;
    local v142 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v141 = v140.categoryId;
        v142 = v140.subcategoryId;
    else
        v141 = v139.AvatarExperience.Catalog.Categories.categoryId;
        v142 = v139.AvatarExperience.Catalog.Categories.subcategoryId;
    end;
    local v143 = nil;
    v143 = if l_FFlagAXCatalogCategoriesStore_0 then v140.categoryInfo else v39.getCatalogCategoryInfoFromState(v139);
    local l_subButton_0 = v139.AvatarExperience.AvatarEditor.Categories.subButton;
    local v145 = if l_FFlagAXEditorSubcategoryFilters_0 then v139.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil;
    local v146, _ = v33.getSearchUuidAndAssetTypes(v143, l_subButton_0, if l_FFlagAXEditorSubcategoryFilters_0 then v145 else nil);
    local v148 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v139.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser else nil;
    return {
        categoryInfo = v143, 
        categoryId = v141, 
        subcategoryId = v142, 
        minPrice = v139.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice, 
        maxPrice = v139.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice, 
        selectedTopics = if (not l_FFlagAXCatalogCategoriesStore_0 or v143 ~= nil) and v143.ShowTopics then v139.AvatarExperience.Catalog.SortAndFilters.SelectedTopics else nil, 
        catalogSort = v139.AvatarExperience.Catalog.SortAndFilters.CatalogSort, 
        catalogSortAggregation = v139.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation, 
        creatorFilter = v139.AvatarExperience.Catalog.SortAndFilters.CreatorFilter, 
        salesTypeFilter = v139.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter, 
        unavailableItemFilter = v139.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter, 
        wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v139.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter else nil, 
        searchParameters = v139.SearchesParameters, 
        searchTime = v139.SearchTimes and v139.SearchTimes[v146] or nil, 
        searchUuid = v146, 
        widgetFetchTime = v139.AvatarExperience.Common.Widgets.WidgetInfo.FetchTime, 
        externalNavigationRequest = if v51 then v139.AvatarExperience.ExternalNavigationRequest else nil, 
        isRecentMarketplaceUser = v148, 
        filterCount = if l_FFlagAXPassScreenSizeToWidgetApi_0 then v72(v139) else nil
    };
end, function(v149) --[[ Line: 881 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v29 (copy), v28 (copy), l_FFlagAXDurablesSupport_0 (copy), v37 (copy), v38 (copy), v27 (copy), v35 (copy), v41 (copy), v48 (copy), v47 (copy)
    return {
        setSearchType = function(v150, v151) --[[ Line: 883 ]] --[[ Name: setSearchType ]]
            -- upvalues: v149 (copy), v29 (ref)
            return v149(v29(v150, v151));
        end, 
        setSearchParameters = function(v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162) --[[ Line: 887 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v149 (copy), v28 (ref), l_FFlagAXDurablesSupport_0 (ref)
            return v149(v28(v152, {
                categoryInfo = v153, 
                catalogSort = v154, 
                catalogSortAggregation = v155, 
                minPrice = v156, 
                maxPrice = v157, 
                selectedTopics = v158, 
                creatorFilter = v159, 
                salesTypeFilter = v160, 
                unavailableItemFilter = v161, 
                wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v162 else nil
            }));
        end, 
        dispatchSearch = function(v163, v164, v165) --[[ Line: 914 ]] --[[ Name: dispatchSearch ]]
            -- upvalues: v149 (copy), v37 (ref)
            return v149(v37(v163, {
                searchUuid = v164, 
                categoryInfo = v165, 
                recordSearchTime = true
            }));
        end, 
        fetchWidgetInfo = function(v166, v167, v168) --[[ Line: 922 ]] --[[ Name: fetchWidgetInfo ]]
            -- upvalues: v149 (copy), v38 (ref)
            return v149(v38(v166, v167, v168));
        end, 
        dispatchRemoveSearch = function(v169) --[[ Line: 926 ]] --[[ Name: dispatchRemoveSearch ]]
            -- upvalues: v149 (copy), v27 (ref)
            v149(v27(v169));
        end, 
        clearSelectedTopics = function() --[[ Line: 930 ]] --[[ Name: clearSelectedTopics ]]
            -- upvalues: v149 (copy), v35 (ref)
            v149(v35());
        end, 
        resetSortAndFilters = function() --[[ Line: 934 ]] --[[ Name: resetSortAndFilters ]]
            -- upvalues: v149 (copy), v41 (ref)
            v149(v41());
        end, 
        dispatchCatalogTilesLatencyStartTracker = v48() and function(v170) --[[ Line: 939 ]]
            -- upvalues: v149 (copy), v47 (ref)
            v149(v47.StartTracking(v170));
        end or nil
    };
end)(v50), v31.Consumer, "pageObjectManager")))));
v50 = l_RoactServices_0.connect({
    networking = v7, 
    catalogAnalytics = v42
})(v50);
if l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 or l_FFlagAXCatalogCategoriesStore_0 or l_FFlagAXPassScreenSizeToWidgetApi_0 then
    return function(v171) --[[ Line: 962 ]] --[[ Name: NavigationItemsViewWrapper ]]
        -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), v24 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v54 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v69 (copy), l_useSignalState_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), v70 (copy), v3 (copy), v50 (ref)
        local v172 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
        local v173 = if not not l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then v54() else nil;
        local v174 = table.clone(v171);
        if (v172 or l_FFlagAXUnifiedMarketplaceResultsFetcher_0) and v173 then
            v174.hasPrefetchedMarketplace = v173.hasFetched;
            v174.isPrefetchingMarketplace = v173.isFetching;
            v174.fetchMarketplace = v173.fetchMarketplace;
            v174.fetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v173.fetchedMarketplaceTimestamp else nil;
        end;
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v175 = v69.getCatalogSelectionStore();
            local v176 = l_useSignalState_0(v175.selectedCategoryId);
            local v177 = l_useSignalState_0(v175.selectedSubcategoryId);
            local v178 = l_useSignalState_0(v175.selectedCategoryInfo);
            v174.categoryId = v176;
            v174.subcategoryId = v177;
            v174.categoryInfo = v178;
        end;
        if l_FFlagAXPassScreenSizeToWidgetApi_0 then
            local v179 = l_getAXMarketplaceWidgetStore_0(false);
            v174.screenSize = v70.useSignalState(v179.getDebouncedScreenSize);
        end;
        return v3.createElement(v50, v174);
    end;
else
    return v50;
end;