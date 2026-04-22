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
local v42 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ResetSortAndFiltersThunk);
local v43 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v44 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_getAXMarketplaceWidgetStore_0 = v22.Stores.getAXMarketplaceWidgetStore;
local v46 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v47 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXRemoveDupSearchCall);
local v48 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXResetAnalyticsMetadataOnFilterReset);
local v49 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v50 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v51 = v3.PureComponent:extend("NavigationItemsView");
local v52 = require(l_Modules_0.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink);
local l_FFlagAXEditorSubcategoryFilters_0 = v21.FFlagAXEditorSubcategoryFilters;
local l_AXPrefetchMarketplaceIXP_0 = v23.AXPrefetchMarketplaceIXP;
local v55 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useMarketplaceResultsFetcher);
local l_FFlagAXUnifiedMarketplaceResultsFetcher_0 = v21.FFlagAXUnifiedMarketplaceResultsFetcher;
local l_FFlagAXPrefetchOnlyWithinTTL_0 = v21.FFlagAXPrefetchOnlyWithinTTL;
local l_FIntAXPrefetchTTL_0 = v21.FIntAXPrefetchTTL;
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v17.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_AXCatalogRealTimeRecommendationsIXP_0 = v23.AXCatalogRealTimeRecommendationsIXP;
local v61 = game:DefineFastInt("AXCatalogExitReEnterRefreshInterval", 60);
local l_FFlagAXCatalogCategoriesStore_0 = v21.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCatalogCategoriesSDUI_0 = v21.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXPassScreenSizeToWidgetApi_0 = v21.FFlagAXPassScreenSizeToWidgetApi;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v21.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXDefaultCatalogCategoryId_0 = v21.FFlagAXDefaultCatalogCategoryId;
local l_FFlagAXEnableTTIViaModule_0 = v21.FFlagAXEnableTTIViaModule;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v21.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v70 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance);
local l_TTIPerformanceManager_0 = v70.TTIPerformanceManager;
local l_OrganicTTIMilestoneManager_0 = v70.OrganicTTIMilestoneManager;
local l_CatalogCategories_0 = v17.Enums.CatalogCategories;
local v74 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v75 = require(l_CorePackages_0.Packages.SignalsReact);
local l_useSignalState_0 = v75.useSignalState;
local v77 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_getShouldPageUseWidgetOnlyFetcher_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Utils.getShouldPageUseWidgetOnlyFetcher;
local v79 = {
    [l_AvatarScreen_0.AvatarEditor] = true, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = true, 
    [l_AvatarScreen_0.MySharedAvatars] = true, 
    [l_AvatarScreen_0.SearchLandingFocusedWidgetPage] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and true or nil
};
v51.validateProps = v9.strictInterface({
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
    wearTimeFilter = v9.optional(v9.string), 
    widgetFetchTime = v9.optional(v9.number), 
    externalNavigationRequest = if v52 then v9.table else nil, 
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
    dispatchCatalogTilesLatencyStartTracker = if v50() then v9.callback else nil, 
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
local function _(v80) --[[ Line: 171 ]] --[[ Name: isCatalogPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v80.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog;
end;
local function _(v82) --[[ Line: 175 ]] --[[ Name: isCatalogSearchPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v82.avatarRoute.opaque.name == l_AvatarScreen_0.CatalogSearch;
end;
local v86 = l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() and function(v84) --[[ Line: 180 ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v46 (copy), l_CatalogCategories_0 (copy)
    if not (v84.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        return false;
    else
        local l_categoryInfo_0 = v84.categoryInfo;
        if not l_categoryInfo_0 then
            return false;
        else
            return l_categoryInfo_0.Id == if l_FFlagAXDefaultCatalogCategoryId_0 then v46.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
        end;
    end;
end or nil;
v51.init = function(v87) --[[ Line: 202 ]] --[[ Name: init ]]
    -- upvalues: l_AvatarScreen_0 (copy), v14 (copy), v3 (copy), l_Signal_0 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), v13 (copy), v12 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy)
    v87.itemsListRef = v87.props.namedRefs[l_AvatarScreen_0.Catalog .. v14.ItemsList];
    v87.scrollingFrameRef = v3.createRef();
    v87.navBarRef = v3.createRef();
    v87.backToTopSignal = l_Signal_0.new();
    v87:setState({
        restorePreviousChildFocus = true, 
        isInitialPrefetch = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v87.props.isInitialPrefetch else nil, 
        hasEnteredAvatarExperience = not l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() and nil
    });
    if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
        v87.lastMarketplaceFetchTime = 0;
    end;
    v87.dispatchInitialSearch = function() --[[ Line: 219 ]]
        -- upvalues: v87 (copy), v13 (ref)
        local l_dispatchSearch_0 = v87.props.dispatchSearch;
        local l_setSearchParameters_0 = v87.props.setSearchParameters;
        local l_categoryInfo_1 = v87.props.categoryInfo;
        local l_searchUuid_0 = v87.props.searchUuid;
        v87.props.setSearchType(l_searchUuid_0, v13.SearchTypes.Catalog);
        l_setSearchParameters_0(l_searchUuid_0, l_categoryInfo_1, v87.props.catalogSort, v87.props.catalogSortAggregation, v87.props.minPrice, v87.props.maxPrice, v87.props.selectedTopics);
        return l_dispatchSearch_0(v87.props.networking, l_searchUuid_0, l_categoryInfo_1);
    end;
    v87.fetchWidgetInfo = function(v92, v93) --[[ Line: 239 ]]
        -- upvalues: v12 (ref), v87 (copy)
        local v94 = nil;
        if v92 then
            v94 = v12.getContextForWidgetsById(v87.props.avatarRoute.opaque.name, v92, v93);
        end;
        return v87.props.fetchWidgetInfo(v87.props.networking, nil, v94);
    end;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v87.initialSearch = function() --[[ Line: 253 ]]
            -- upvalues: l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (ref), v87 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (ref)
            if l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then
                v87.props.fetchMarketplace();
                if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                    v87.lastMarketplaceFetchTime = os.time();
                    return;
                end;
            else
                v87.dispatchInitialSearch();
            end;
        end;
    end;
end;
if l_AXPrefetchMarketplaceIXP_0.isEnabled() then
    v51.hasPrefetchedMarketplace = function(v95) --[[ Line: 270 ]] --[[ Name: hasPrefetchedMarketplace ]]
        -- upvalues: v24 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_sendAXCounterV2_0 (copy), v44 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FIntAXPrefetchTTL_0 (copy), v50 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy)
        local v96 = v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser);
        local v97 = v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.UserIsInExperiment);
        if not v95.props.isRecentMarketplaceUser then
            return false;
        else
            l_sendAXCounterV2_0(v44.Counter.PrefetchMarketplace.enteredMarketplaceAndIsRecentUser);
            if v97 then
                local v98 = not l_FFlagAXPrefetchOnlyWithinTTL_0 or not v95.props.fetchedMarketplaceTimestamp or os.time() - v95.props.fetchedMarketplaceTimestamp <= l_FIntAXPrefetchTTL_0;
                if not v98 then
                    return false;
                else
                    l_sendAXCounterV2_0(v44.Counter.PrefetchMarketplace.inExperimentAndIsRecentUserAndEnteredMarketplace);
                    v24.logExperimentExposure(l_AXPrefetchMarketplaceIXP_0);
                    if v96 and v98 then
                        if v50() then
                            if l_FFlagAXEnableTTIViaModule_0 then
                                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                                    l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                                else
                                    l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Organic.Tiles);
                                    l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Organic.Thumbnails);
                                    l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Widget.Tiles);
                                    l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Widget.Thumbnails);
                                end;
                            end;
                            v95.props.dispatchCatalogTilesLatencyStartTracker(v95.props.searchUuid);
                        end;
                        if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                            v95.lastMarketplaceFetchTime = os.time();
                        end;
                        v95:setState({
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
v51.didMount = function(v99) --[[ Line: 356 ]] --[[ Name: didMount ]]
    -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy)
    if l_AXPrefetchMarketplaceIXP_0.isEnabled() and v99:hasPrefetchedMarketplace() then
        return;
    else
        if l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then
            v99.props.fetchMarketplace();
            if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                v99.lastMarketplaceFetchTime = os.time();
                return;
            end;
        else
            v99.dispatchInitialSearch();
            v99.fetchWidgetInfo(v99.props.categoryId, v99.props.subcategoryId);
        end;
        return;
    end;
end;
v51.searchResultsAreOld = function(v100, _, v102, v103) --[[ Line: 381 ]] --[[ Name: searchResultsAreOld ]]
    local v104 = if v103 then v103.searchTime else v100.props.searchTime;
    if not v102.TimeToRefresh or v102.TimeToRefresh < 0 or not v104 then
        return false;
    else
        return tick() - v104 > v102.TimeToRefresh;
    end;
end;
v51.updateSearchParams = function(v105, v106) --[[ Line: 391 ]] --[[ Name: updateSearchParams ]]
    -- upvalues: v50 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_OrganicTTIMilestoneManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v44 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy)
    local l_categoryInfo_2 = v106.categoryInfo;
    local l_searchUuid_1 = v106.searchUuid;
    local l_dispatchSearch_1 = v105.props.dispatchSearch;
    local l_setSearchParameters_1 = v105.props.setSearchParameters;
    local l_fetchWidgetInfo_0 = v105.fetchWidgetInfo;
    local v112 = true;
    if v106.categoryId == v105.props.categoryId then
        v112 = v106.subcategoryId ~= v105.props.subcategoryId;
    end;
    local v113 = v106.wearTimeFilter ~= v105.props.wearTimeFilter;
    if v112 or v106.catalogSort ~= v105.props.catalogSort or v106.catalogSortAggregation ~= v105.props.catalogSortAggregation or v106.minPrice ~= v105.props.minPrice or v106.maxPrice ~= v105.props.maxPrice or v106.selectedTopics ~= v105.props.selectedTopics or v106.creatorFilter ~= v105.props.creatorFilter or v106.salesTypeFilter ~= v105.props.salesTypeFilter or v106.unavailableItemFilter ~= v105.props.unavailableItemFilter or v113 then
        if v112 then
            v105.props.clearSelectedTopics();
            local v114 = v105.props.searchParameters[l_searchUuid_1];
            if v114 == nil then
                l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v106.catalogSort, v106.catalogSortAggregation, v106.minPrice, v106.maxPrice, v106.selectedTopics, v106.creatorFilter, v106.salesTypeFilter, v106.unavailableItemFilter, v106.wearTimeFilter);
                if v50() then
                    if l_FFlagAXEnableTTIViaModule_0 then
                        if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                            l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                            if l_OrganicTTIMilestoneManager_0 then
                                l_OrganicTTIMilestoneManager_0.L2.primaryDataStarted();
                                l_OrganicTTIMilestoneManager_0.L3.networkFetch();
                            end;
                        else
                            l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Organic.Tiles);
                            l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Organic.Thumbnails);
                            l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Widget.Tiles);
                            l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Widget.Thumbnails);
                        end;
                    end;
                    v105.props.dispatchCatalogTilesLatencyStartTracker(l_searchUuid_1);
                end;
                l_dispatchSearch_1(v105.props.networking, l_searchUuid_1, l_categoryInfo_2);
                l_fetchWidgetInfo_0(v106.categoryId, v106.subcategoryId);
            else
                local v115 = v105:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_2, v106) or v114.catalogSort and v114.catalogSort ~= v106.catalogSort or v114.catalogSortAggregation and v114.catalogSortAggregation ~= v106.catalogSortAggregation or v114.minPrice and v114.minPrice ~= v106.minPrice or v114.maxPrice and v114.maxPrice ~= v106.maxPrice or v114.selectedTopics and v114.selectedTopics ~= v106.selectedTopics or v114.creatorFilter and v114.creatorFilter ~= v106.creatorFilter or v114.salesTypeFilter and v114.salesTypeFilter ~= v106.salesTypeFilter or v114.unavailableItemFilter and v114.unavailableItemFilter ~= v106.unavailableItemFilter;
                local v116 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_getShouldPageUseWidgetOnlyFetcher_0(v106.categoryInfo, v106.filterCount, v114 and v114.searchKeyword) else nil;
                if l_FFlagAXPassScreenSizeToWidgetApi_0 and v116 then
                    v115 = false;
                end;
                if v115 then
                    if v105:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_2, v106) then
                        v105.props.catalogAnalytics.sendAXCounter(v44.Counter.CatalogRefresh.StaleResults);
                    end;
                    v105.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
                    v105.props.dispatchRemoveSearch(l_searchUuid_1);
                    if v50() then
                        if l_FFlagAXEnableTTIViaModule_0 then
                            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                                l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                                if l_OrganicTTIMilestoneManager_0 then
                                    l_OrganicTTIMilestoneManager_0.L2.primaryDataStarted();
                                    l_OrganicTTIMilestoneManager_0.L3.networkFetch();
                                end;
                            else
                                l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Organic.Tiles);
                                l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Organic.Thumbnails);
                                l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Widget.Tiles);
                                l_TimeToInteractiveTracker_0.trackStart(v44.Counter.PREFIX .. v44.Counter.Latency.Widget.Thumbnails);
                            end;
                        end;
                        v105.props.dispatchCatalogTilesLatencyStartTracker(l_searchUuid_1);
                    end;
                    l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v106.catalogSort, v106.catalogSortAggregation, v106.minPrice, v106.maxPrice, v106.selectedTopics, v106.creatorFilter, v106.salesTypeFilter, v106.unavailableItemFilter, v106.wearTimeFilter);
                    l_dispatchSearch_1(v105.props.networking, l_searchUuid_1, l_categoryInfo_2);
                    l_fetchWidgetInfo_0(v106.categoryId, v106.subcategoryId);
                end;
            end;
        else
            v105.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
            v105.props.dispatchRemoveSearch(l_searchUuid_1);
            l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v106.catalogSort, v106.catalogSortAggregation, v106.minPrice, v106.maxPrice, v106.selectedTopics, v106.creatorFilter, v106.salesTypeFilter, v106.unavailableItemFilter, v106.wearTimeFilter);
            l_dispatchSearch_1(v105.props.networking, l_searchUuid_1, l_categoryInfo_2);
        end;
        if v105.scrollingFrameRef.current then
            v105.scrollingFrameRef.current.CanvasPosition = Vector2.new();
        end;
    end;
end;
v51.willUpdate = function(v117, v118) --[[ Line: 599 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v47 (copy)
    if v117.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog and not (v118.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        v117.props.clearSelectedTopics();
        v117.props.resetSortAndFilters();
    end;
    if not (v117.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) and v118.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then
        v117.props.clearSelectedTopics();
    end;
    if v47 and not (v118.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        return;
    else
        v117:updateSearchParams(v118);
        return;
    end;
end;
v51.renderWithStyle = function(v119, v120) --[[ Line: 623 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), v26 (copy), v11 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy)
    local l_Theme_0 = v120.Theme;
    local l_defaultChildRef_0 = v119.props.defaultChildRef;
    local l_NextSelectionUp_0 = v119.props.NextSelectionUp;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = l_defaultChildRef_0, 
        restorePreviousChildFocus = v119.state.restorePreviousChildFocus, 
        defaultChild = v119.navBarRef, 
        NextSelectionRight = v119.props.NextSelectionRight
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        ResultsList = v3.createElement(v26, {
            frameRef = v119.itemsListRef, 
            navBarRef = v119.navBarRef, 
            analyticsContext = v11.AnalyticsContext.Catalog, 
            fromSearch = false, 
            searchUuid = v119.props.searchUuid, 
            layoutOrder = 2, 
            scrollingFrameRef = v119.scrollingFrameRef, 
            onRetry = if l_FFlagAXCatalogCategoriesSDUI_0 then v119.initialSearch else v119.dispatchInitialSearch, 
            NextSelectionUp = l_NextSelectionUp_0, 
            backToTopSignal = v119.backToTopSignal, 
            multiTryOnBottomBarRef = v119.props.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v119.props.itemDetailsPeekViewRefs, 
            categoryInfo = if l_FFlagAXCatalogCategoriesStore_0 then nil else if l_FFlagAXMoveAllTabToWidgetOnly_0 then v119.props.categoryInfo else nil
        })
    });
end;
v51.render = function(v124) --[[ Line: 666 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v125) --[[ Line: 667 ]]
        -- upvalues: v124 (copy)
        return v124:renderWithStyle(v125);
    end);
end;
if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
    v51.handleExitAndReEnterAvatarExperience = function(v126, v127) --[[ Line: 673 ]] --[[ Name: handleExitAndReEnterAvatarExperience ]]
        -- upvalues: v86 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v61 (copy), v24 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), l_sendAXCounterV2_0 (copy), v44 (copy)
        local l_isVisible_0 = v126.props.avatarRoute.isVisible;
        local l_isVisible_1 = v127.avatarRoute.isVisible;
        if l_isVisible_0 and not v126.state.hasEnteredAvatarExperience then
            v126:setState({
                hasEnteredAvatarExperience = true
            });
        end;
        if l_isVisible_0 and not l_isVisible_1 and v126.state.hasEnteredAvatarExperience and v86(v126.props) and l_FFlagAXUnifiedMarketplaceResultsFetcher_0 and v126.props.fetchMarketplace then
            local v130 = os.time();
            if v130 - v126.lastMarketplaceFetchTime >= v61 then
                if v24.readTestVariable(l_AXCatalogRealTimeRecommendationsIXP_0.UserIsInExperiment) then
                    v24.logExperimentExposure(l_AXCatalogRealTimeRecommendationsIXP_0);
                end;
                l_sendAXCounterV2_0(v44.Counter.FetchMarketplace.ExitAndReEnterRefreshCounter);
                if v24.readTestVariable(l_AXCatalogRealTimeRecommendationsIXP_0.EnabledForUser) then
                    l_sendAXCounterV2_0(v44.Counter.FetchMarketplace.ExitAndReEnterRefreshTreatment);
                    v126.props.fetchMarketplace();
                    v126.lastMarketplaceFetchTime = v130;
                    return;
                end;
            end;
        end;
    end;
end;
v51.didUpdate = function(v131, v132) --[[ Line: 723 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v79 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), v52 (copy), v34 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), v24 (copy), l_sendAXCounterV2_0 (copy), v44 (copy)
    local l_name_0 = v131.props.avatarRoute.current.name;
    local l_name_1 = v132.avatarRoute.current.name;
    if l_name_0 == l_AvatarScreen_0.Catalog then
        if not v131.state.restorePreviousChildFocus then
            v131:setState({
                restorePreviousChildFocus = true
            });
        end;
    elseif v79[l_name_0] and l_name_1 == l_AvatarScreen_0.Catalog and v131.state.restorePreviousChildFocus then
        v131:setState({
            restorePreviousChildFocus = false
        });
    end;
    if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
        v131:handleExitAndReEnterAvatarExperience(v132);
    end;
    local v135 = if l_FFlagAXPassScreenSizeToWidgetApi_0 and v131.props.searchParameters then v131.props.searchParameters[v131.props.searchUuid] else nil;
    local v136 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_getShouldPageUseWidgetOnlyFetcher_0(v131.props.categoryInfo, v131.props.filterCount, v135 and v135.searchKeyword) else nil;
    if l_FFlagAXPassScreenSizeToWidgetApi_0 and v131.props.screenSize and v132.screenSize and v131.props.screenSize ~= v132.screenSize and v136 then
        v131.props.fetchMarketplace();
    end;
    if v132.avatarRoute.opaque.name == l_AvatarScreen_0.CatalogSearch and v131.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then
        if v52 then
            if v131.props.externalNavigationRequest == v132.externalNavigationRequest and not v34.catalogDeepLinkExists(v131.props.externalNavigationRequest) then
                v131.props.resetSortAndFilters();
            end;
        else
            v131.props.resetSortAndFilters();
        end;
    end;
    local v137 = v131.props.categoryInfo and v131.props.categoryInfo.ShowWidgets;
    local v138 = v132.categoryInfo and v132.categoryInfo.ShowWidgets;
    local v139 = v137 and not v138;
    local v140 = false;
    if l_name_0 == l_AvatarScreen_0.Catalog then
        v140 = l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    if v139 or v140 then
        if l_FFlagAXPassScreenSizeToWidgetApi_0 and v136 then
            v131.props.fetchMarketplace();
        else
            v131.fetchWidgetInfo(v131.props.categoryId, v131.props.subcategoryId);
        end;
    end;
    local v141 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    local v142 = if v141 then v132.isPrefetchingMarketplace and not v132.hasPrefetchedMarketplace else nil;
    local v143 = if v141 then not v131.props.isPrefetchingMarketplace and not v131.props.hasPrefetchedMarketplace else nil;
    if v141 then
        if v131.props.hasPrefetchedMarketplace and v131.state.isInitialPrefetch then
            l_sendAXCounterV2_0(v44.Counter.PrefetchMarketplace.inTreatmentAndHasPrefetchedMarketplace);
            v131:setState({
                isInitialPrefetch = false
            });
        end;
        if v142 and v143 and v131.state.isInitialPrefetch then
            l_sendAXCounterV2_0(v44.Counter.PrefetchMarketplace.enteredMarketplaceButPrefetchFailed);
            v131.dispatchInitialSearch();
            v131.fetchWidgetInfo(v131.props.categoryId, v131.props.subcategoryId);
            v131:setState({
                isInitialPrefetch = false
            });
        end;
    end;
end;
v51 = v40((v32((v30(v5.connect(function(v144, v145) --[[ Line: 843 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v39 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v33 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), v52 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), v77 (copy)
    local v146 = nil;
    local v147 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v146 = v145.categoryId;
        v147 = v145.subcategoryId;
    else
        v146 = v144.AvatarExperience.Catalog.Categories.categoryId;
        v147 = v144.AvatarExperience.Catalog.Categories.subcategoryId;
    end;
    local v148 = nil;
    v148 = if l_FFlagAXCatalogCategoriesStore_0 then v145.categoryInfo else v39.getCatalogCategoryInfoFromState(v144);
    local l_subButton_0 = v144.AvatarExperience.AvatarEditor.Categories.subButton;
    local v150 = if l_FFlagAXEditorSubcategoryFilters_0 then v144.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil;
    local v151, _ = v33.getSearchUuidAndAssetTypes(v148, l_subButton_0, if l_FFlagAXEditorSubcategoryFilters_0 then v150 else nil);
    local v153 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v144.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser else nil;
    return {
        categoryInfo = v148, 
        categoryId = v146, 
        subcategoryId = v147, 
        minPrice = v144.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice, 
        maxPrice = v144.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice, 
        selectedTopics = if (not l_FFlagAXCatalogCategoriesStore_0 or v148 ~= nil) and v148.ShowTopics then v144.AvatarExperience.Catalog.SortAndFilters.SelectedTopics else nil, 
        catalogSort = v144.AvatarExperience.Catalog.SortAndFilters.CatalogSort, 
        catalogSortAggregation = v144.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation, 
        creatorFilter = v144.AvatarExperience.Catalog.SortAndFilters.CreatorFilter, 
        salesTypeFilter = v144.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter, 
        unavailableItemFilter = v144.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter, 
        wearTimeFilter = v144.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter, 
        searchParameters = v144.SearchesParameters, 
        searchTime = v144.SearchTimes and v144.SearchTimes[v151] or nil, 
        searchUuid = v151, 
        widgetFetchTime = v144.AvatarExperience.Common.Widgets.WidgetInfo.FetchTime, 
        externalNavigationRequest = if v52 then v144.AvatarExperience.ExternalNavigationRequest else nil, 
        isRecentMarketplaceUser = v153, 
        filterCount = if l_FFlagAXPassScreenSizeToWidgetApi_0 then v77(v144) else nil
    };
end, function(v154) --[[ Line: 903 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v29 (copy), v28 (copy), v37 (copy), v38 (copy), v27 (copy), v35 (copy), v48 (copy), v42 (copy), v41 (copy), v50 (copy), v49 (copy)
    return {
        setSearchType = function(v155, v156) --[[ Line: 905 ]] --[[ Name: setSearchType ]]
            -- upvalues: v154 (copy), v29 (ref)
            return v154(v29(v155, v156));
        end, 
        setSearchParameters = function(v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167) --[[ Line: 909 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v154 (copy), v28 (ref)
            return v154(v28(v157, {
                categoryInfo = v158, 
                catalogSort = v159, 
                catalogSortAggregation = v160, 
                minPrice = v161, 
                maxPrice = v162, 
                selectedTopics = v163, 
                creatorFilter = v164, 
                salesTypeFilter = v165, 
                unavailableItemFilter = v166, 
                wearTimeFilter = v167
            }));
        end, 
        dispatchSearch = function(v168, v169, v170) --[[ Line: 936 ]] --[[ Name: dispatchSearch ]]
            -- upvalues: v154 (copy), v37 (ref)
            return v154(v37(v168, {
                searchUuid = v169, 
                categoryInfo = v170, 
                recordSearchTime = true
            }));
        end, 
        fetchWidgetInfo = function(v171, v172, v173) --[[ Line: 944 ]] --[[ Name: fetchWidgetInfo ]]
            -- upvalues: v154 (copy), v38 (ref)
            return v154(v38(v171, v172, v173));
        end, 
        dispatchRemoveSearch = function(v174) --[[ Line: 948 ]] --[[ Name: dispatchRemoveSearch ]]
            -- upvalues: v154 (copy), v27 (ref)
            v154(v27(v174));
        end, 
        clearSelectedTopics = function() --[[ Line: 952 ]] --[[ Name: clearSelectedTopics ]]
            -- upvalues: v154 (copy), v35 (ref)
            v154(v35());
        end, 
        resetSortAndFilters = function() --[[ Line: 956 ]] --[[ Name: resetSortAndFilters ]]
            -- upvalues: v48 (ref), v154 (copy), v42 (ref), v41 (ref)
            if v48 then
                v154(v42());
                return;
            else
                v154(v41());
                return;
            end;
        end, 
        dispatchCatalogTilesLatencyStartTracker = v50() and function(v175) --[[ Line: 965 ]]
            -- upvalues: v154 (copy), v49 (ref)
            v154(v49.StartTracking(v175));
        end or nil
    };
end)(v51), v31.Consumer, "pageObjectManager")))));
v51 = l_RoactServices_0.connect({
    networking = v7, 
    catalogAnalytics = v43
})(v51);
if l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 or l_FFlagAXCatalogCategoriesStore_0 or l_FFlagAXPassScreenSizeToWidgetApi_0 then
    return function(v176) --[[ Line: 988 ]] --[[ Name: NavigationItemsViewWrapper ]]
        -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), v24 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v55 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v74 (copy), l_useSignalState_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), v75 (copy), v3 (copy), v51 (ref)
        local v177 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
        local v178 = if not not l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then v55() else nil;
        local v179 = table.clone(v176);
        if (v177 or l_FFlagAXUnifiedMarketplaceResultsFetcher_0) and v178 then
            v179.hasPrefetchedMarketplace = v178.hasFetched;
            v179.isPrefetchingMarketplace = v178.isFetching;
            v179.fetchMarketplace = v178.fetchMarketplace;
            v179.fetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v178.fetchedMarketplaceTimestamp else nil;
        end;
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v180 = v74.getCatalogSelectionStore();
            local v181 = l_useSignalState_0(v180.selectedCategoryId);
            local v182 = l_useSignalState_0(v180.selectedSubcategoryId);
            local v183 = l_useSignalState_0(v180.selectedCategoryInfo);
            v179.categoryId = v181;
            v179.subcategoryId = v182;
            v179.categoryInfo = v183;
        end;
        if l_FFlagAXPassScreenSizeToWidgetApi_0 then
            local v184 = l_getAXMarketplaceWidgetStore_0(false);
            v179.screenSize = v75.useSignalState(v184.getDebouncedScreenSize);
        end;
        return v3.createElement(v51, v179);
    end;
else
    return v51;
end;