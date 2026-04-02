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
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v21.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_TTIPerformanceManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).TTIPerformanceManager;
local l_CatalogCategories_0 = v17.Enums.CatalogCategories;
local v71 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v72 = require(l_CorePackages_0.Packages.SignalsReact);
local l_useSignalState_0 = v72.useSignalState;
local v74 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_getShouldPageUseWidgetOnlyFetcher_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Utils.getShouldPageUseWidgetOnlyFetcher;
local v76 = {
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
local function _(v77) --[[ Line: 168 ]] --[[ Name: isCatalogPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v77.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog;
end;
local function _(v79) --[[ Line: 172 ]] --[[ Name: isCatalogSearchPage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v79.avatarRoute.opaque.name == l_AvatarScreen_0.CatalogSearch;
end;
local v83 = l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() and function(v81) --[[ Line: 177 ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v45 (copy), l_CatalogCategories_0 (copy)
    if not (v81.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        return false;
    else
        local l_categoryInfo_0 = v81.categoryInfo;
        if not l_categoryInfo_0 then
            return false;
        else
            return l_categoryInfo_0.Id == if l_FFlagAXDefaultCatalogCategoryId_0 then v45.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
        end;
    end;
end or nil;
v50.init = function(v84) --[[ Line: 199 ]] --[[ Name: init ]]
    -- upvalues: l_AvatarScreen_0 (copy), v14 (copy), v3 (copy), l_Signal_0 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), v13 (copy), v12 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy)
    v84.itemsListRef = v84.props.namedRefs[l_AvatarScreen_0.Catalog .. v14.ItemsList];
    v84.scrollingFrameRef = v3.createRef();
    v84.navBarRef = v3.createRef();
    v84.backToTopSignal = l_Signal_0.new();
    v84:setState({
        restorePreviousChildFocus = true, 
        isInitialPrefetch = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v84.props.isInitialPrefetch else nil, 
        hasEnteredAvatarExperience = not l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() and nil
    });
    if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
        v84.lastMarketplaceFetchTime = 0;
    end;
    v84.dispatchInitialSearch = function() --[[ Line: 216 ]]
        -- upvalues: v84 (copy), v13 (ref)
        local l_dispatchSearch_0 = v84.props.dispatchSearch;
        local l_setSearchParameters_0 = v84.props.setSearchParameters;
        local l_categoryInfo_1 = v84.props.categoryInfo;
        local l_searchUuid_0 = v84.props.searchUuid;
        v84.props.setSearchType(l_searchUuid_0, v13.SearchTypes.Catalog);
        l_setSearchParameters_0(l_searchUuid_0, l_categoryInfo_1, v84.props.catalogSort, v84.props.catalogSortAggregation, v84.props.minPrice, v84.props.maxPrice, v84.props.selectedTopics);
        return l_dispatchSearch_0(v84.props.networking, l_searchUuid_0, l_categoryInfo_1);
    end;
    v84.fetchWidgetInfo = function(v89, v90) --[[ Line: 236 ]]
        -- upvalues: v12 (ref), v84 (copy)
        local v91 = nil;
        if v89 then
            v91 = v12.getContextForWidgetsById(v84.props.avatarRoute.opaque.name, v89, v90);
        end;
        return v84.props.fetchWidgetInfo(v84.props.networking, nil, v91);
    end;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v84.initialSearch = function() --[[ Line: 250 ]]
            -- upvalues: l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (ref), v84 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (ref)
            if l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then
                v84.props.fetchMarketplace();
                if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                    v84.lastMarketplaceFetchTime = os.time();
                    return;
                end;
            else
                v84.dispatchInitialSearch();
            end;
        end;
    end;
end;
if l_AXPrefetchMarketplaceIXP_0.isEnabled() then
    v50.hasPrefetchedMarketplace = function(v92) --[[ Line: 267 ]] --[[ Name: hasPrefetchedMarketplace ]]
        -- upvalues: v24 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_sendAXCounterV2_0 (copy), v43 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FIntAXPrefetchTTL_0 (copy), v48 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy)
        local v93 = v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser);
        local v94 = v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.UserIsInExperiment);
        if not v92.props.isRecentMarketplaceUser then
            return false;
        else
            l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.enteredMarketplaceAndIsRecentUser);
            if v94 then
                local v95 = not l_FFlagAXPrefetchOnlyWithinTTL_0 or not v92.props.fetchedMarketplaceTimestamp or os.time() - v92.props.fetchedMarketplaceTimestamp <= l_FIntAXPrefetchTTL_0;
                if not v95 then
                    return false;
                else
                    l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.inExperimentAndIsRecentUserAndEnteredMarketplace);
                    v24.logExperimentExposure(l_AXPrefetchMarketplaceIXP_0);
                    if v93 and v95 then
                        if v48() then
                            if l_FFlagAXEnableTTIViaModule_0 then
                                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                                    l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                                else
                                    l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Tiles);
                                    l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Thumbnails);
                                    l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Tiles);
                                    l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Thumbnails);
                                end;
                            end;
                            v92.props.dispatchCatalogTilesLatencyStartTracker(v92.props.searchUuid);
                        end;
                        if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                            v92.lastMarketplaceFetchTime = os.time();
                        end;
                        v92:setState({
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
v50.didMount = function(v96) --[[ Line: 353 ]] --[[ Name: didMount ]]
    -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy)
    if l_AXPrefetchMarketplaceIXP_0.isEnabled() and v96:hasPrefetchedMarketplace() then
        return;
    else
        if l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then
            v96.props.fetchMarketplace();
            if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
                v96.lastMarketplaceFetchTime = os.time();
                return;
            end;
        else
            v96.dispatchInitialSearch();
            v96.fetchWidgetInfo(v96.props.categoryId, v96.props.subcategoryId);
        end;
        return;
    end;
end;
v50.searchResultsAreOld = function(v97, _, v99, v100) --[[ Line: 378 ]] --[[ Name: searchResultsAreOld ]]
    local v101 = if v100 then v100.searchTime else v97.props.searchTime;
    if not v99.TimeToRefresh or v99.TimeToRefresh < 0 or not v101 then
        return false;
    else
        return tick() - v101 > v99.TimeToRefresh;
    end;
end;
v50.updateSearchParams = function(v102, v103) --[[ Line: 388 ]] --[[ Name: updateSearchParams ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v48 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v43 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy)
    local l_categoryInfo_2 = v103.categoryInfo;
    local l_searchUuid_1 = v103.searchUuid;
    local l_dispatchSearch_1 = v102.props.dispatchSearch;
    local l_setSearchParameters_1 = v102.props.setSearchParameters;
    local l_fetchWidgetInfo_0 = v102.fetchWidgetInfo;
    local v109 = true;
    if v103.categoryId == v102.props.categoryId then
        v109 = v103.subcategoryId ~= v102.props.subcategoryId;
    end;
    local v110 = false;
    if l_FFlagAXDurablesSupport_0 then
        v110 = v103.wearTimeFilter ~= v102.props.wearTimeFilter;
    end;
    if v109 or v103.catalogSort ~= v102.props.catalogSort or v103.catalogSortAggregation ~= v102.props.catalogSortAggregation or v103.minPrice ~= v102.props.minPrice or v103.maxPrice ~= v102.props.maxPrice or v103.selectedTopics ~= v102.props.selectedTopics or v103.creatorFilter ~= v102.props.creatorFilter or v103.salesTypeFilter ~= v102.props.salesTypeFilter or v103.unavailableItemFilter ~= v102.props.unavailableItemFilter or v110 then
        if v109 then
            v102.props.clearSelectedTopics();
            local v111 = v102.props.searchParameters[l_searchUuid_1];
            if v111 == nil then
                l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v103.catalogSort, v103.catalogSortAggregation, v103.minPrice, v103.maxPrice, v103.selectedTopics, v103.creatorFilter, v103.salesTypeFilter, v103.unavailableItemFilter, if l_FFlagAXDurablesSupport_0 then v103.wearTimeFilter else nil);
                if v48() then
                    if l_FFlagAXEnableTTIViaModule_0 then
                        if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                            l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                        else
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Tiles);
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Thumbnails);
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Tiles);
                            l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Thumbnails);
                        end;
                    end;
                    v102.props.dispatchCatalogTilesLatencyStartTracker(l_searchUuid_1);
                end;
                l_dispatchSearch_1(v102.props.networking, l_searchUuid_1, l_categoryInfo_2);
                l_fetchWidgetInfo_0(v103.categoryId, v103.subcategoryId);
            else
                local v112 = v102:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_2, v103) or v111.catalogSort and v111.catalogSort ~= v103.catalogSort or v111.catalogSortAggregation and v111.catalogSortAggregation ~= v103.catalogSortAggregation or v111.minPrice and v111.minPrice ~= v103.minPrice or v111.maxPrice and v111.maxPrice ~= v103.maxPrice or v111.selectedTopics and v111.selectedTopics ~= v103.selectedTopics or v111.creatorFilter and v111.creatorFilter ~= v103.creatorFilter or v111.salesTypeFilter and v111.salesTypeFilter ~= v103.salesTypeFilter or v111.unavailableItemFilter and v111.unavailableItemFilter ~= v103.unavailableItemFilter;
                local v113 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_getShouldPageUseWidgetOnlyFetcher_0(v103.categoryInfo, v103.filterCount, v111 and v111.searchKeyword) else nil;
                if l_FFlagAXPassScreenSizeToWidgetApi_0 and v113 then
                    v112 = false;
                end;
                if v112 then
                    if v102:searchResultsAreOld(l_searchUuid_1, l_categoryInfo_2, v103) then
                        v102.props.catalogAnalytics.sendAXCounter(v43.Counter.CatalogRefresh.StaleResults);
                    end;
                    v102.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
                    v102.props.dispatchRemoveSearch(l_searchUuid_1);
                    if v48() then
                        if l_FFlagAXEnableTTIViaModule_0 then
                            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                                l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                            else
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Tiles);
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Organic.Thumbnails);
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Tiles);
                                l_TimeToInteractiveTracker_0.trackStart(v43.Counter.PREFIX .. v43.Counter.Latency.Widget.Thumbnails);
                            end;
                        end;
                        v102.props.dispatchCatalogTilesLatencyStartTracker(l_searchUuid_1);
                    end;
                    l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v103.catalogSort, v103.catalogSortAggregation, v103.minPrice, v103.maxPrice, v103.selectedTopics, v103.creatorFilter, v103.salesTypeFilter, v103.unavailableItemFilter, if l_FFlagAXDurablesSupport_0 then v103.wearTimeFilter else nil);
                    l_dispatchSearch_1(v102.props.networking, l_searchUuid_1, l_categoryInfo_2);
                    l_fetchWidgetInfo_0(v103.categoryId, v103.subcategoryId);
                end;
            end;
        else
            v102.props.pageObjectManager:storePageObject(l_searchUuid_1, nil);
            v102.props.dispatchRemoveSearch(l_searchUuid_1);
            l_setSearchParameters_1(l_searchUuid_1, l_categoryInfo_2, v103.catalogSort, v103.catalogSortAggregation, v103.minPrice, v103.maxPrice, v103.selectedTopics, v103.creatorFilter, v103.salesTypeFilter, v103.unavailableItemFilter, if l_FFlagAXDurablesSupport_0 then v103.wearTimeFilter else nil);
            l_dispatchSearch_1(v102.props.networking, l_searchUuid_1, l_categoryInfo_2);
        end;
        if v102.scrollingFrameRef.current then
            v102.scrollingFrameRef.current.CanvasPosition = Vector2.new();
        end;
    end;
end;
v50.willUpdate = function(v114, v115) --[[ Line: 591 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v46 (copy)
    if v114.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog and not (v115.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        v114.props.clearSelectedTopics();
        v114.props.resetSortAndFilters();
    end;
    if not (v114.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) and v115.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then
        v114.props.clearSelectedTopics();
    end;
    if v46 and not (v115.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) then
        return;
    else
        v114:updateSearchParams(v115);
        return;
    end;
end;
v50.renderWithStyle = function(v116, v117) --[[ Line: 615 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v3 (copy), l_Focusable_0 (copy), v26 (copy), v11 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy)
    local l_Theme_0 = v117.Theme;
    local l_defaultChildRef_0 = v116.props.defaultChildRef;
    local l_NextSelectionUp_0 = v116.props.NextSelectionUp;
    return v3.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency or 1, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Ref] = l_defaultChildRef_0, 
        restorePreviousChildFocus = v116.state.restorePreviousChildFocus, 
        defaultChild = v116.navBarRef, 
        NextSelectionRight = v116.props.NextSelectionRight
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        ResultsList = v3.createElement(v26, {
            frameRef = v116.itemsListRef, 
            navBarRef = v116.navBarRef, 
            analyticsContext = v11.AnalyticsContext.Catalog, 
            fromSearch = false, 
            searchUuid = v116.props.searchUuid, 
            layoutOrder = 2, 
            scrollingFrameRef = v116.scrollingFrameRef, 
            onRetry = if l_FFlagAXCatalogCategoriesSDUI_0 then v116.initialSearch else v116.dispatchInitialSearch, 
            NextSelectionUp = l_NextSelectionUp_0, 
            backToTopSignal = v116.backToTopSignal, 
            multiTryOnBottomBarRef = v116.props.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v116.props.itemDetailsPeekViewRefs, 
            categoryInfo = if l_FFlagAXCatalogCategoriesStore_0 then nil else if l_FFlagAXMoveAllTabToWidgetOnly_0 then v116.props.categoryInfo else nil
        })
    });
end;
v50.render = function(v121) --[[ Line: 658 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v122) --[[ Line: 659 ]]
        -- upvalues: v121 (copy)
        return v121:renderWithStyle(v122);
    end);
end;
if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
    v50.handleExitAndReEnterAvatarExperience = function(v123, v124) --[[ Line: 665 ]] --[[ Name: handleExitAndReEnterAvatarExperience ]]
        -- upvalues: v83 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v60 (copy), v24 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), l_sendAXCounterV2_0 (copy), v43 (copy)
        local l_isVisible_0 = v123.props.avatarRoute.isVisible;
        local l_isVisible_1 = v124.avatarRoute.isVisible;
        if l_isVisible_0 and not v123.state.hasEnteredAvatarExperience then
            v123:setState({
                hasEnteredAvatarExperience = true
            });
        end;
        if l_isVisible_0 and not l_isVisible_1 and v123.state.hasEnteredAvatarExperience and v83(v123.props) and l_FFlagAXUnifiedMarketplaceResultsFetcher_0 and v123.props.fetchMarketplace then
            local v127 = os.time();
            if v127 - v123.lastMarketplaceFetchTime >= v60 then
                if v24.readTestVariable(l_AXCatalogRealTimeRecommendationsIXP_0.UserIsInExperiment) then
                    v24.logExperimentExposure(l_AXCatalogRealTimeRecommendationsIXP_0);
                end;
                l_sendAXCounterV2_0(v43.Counter.FetchMarketplace.ExitAndReEnterRefreshCounter);
                if v24.readTestVariable(l_AXCatalogRealTimeRecommendationsIXP_0.EnabledForUser) then
                    l_sendAXCounterV2_0(v43.Counter.FetchMarketplace.ExitAndReEnterRefreshTreatment);
                    v123.props.fetchMarketplace();
                    v123.lastMarketplaceFetchTime = v127;
                    return;
                end;
            end;
        end;
    end;
end;
v50.didUpdate = function(v128, v129) --[[ Line: 715 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v76 (copy), l_AXCatalogRealTimeRecommendationsIXP_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), v51 (copy), v34 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), v24 (copy), l_sendAXCounterV2_0 (copy), v43 (copy)
    local l_name_0 = v128.props.avatarRoute.current.name;
    local l_name_1 = v129.avatarRoute.current.name;
    if l_name_0 == l_AvatarScreen_0.Catalog then
        if not v128.state.restorePreviousChildFocus then
            v128:setState({
                restorePreviousChildFocus = true
            });
        end;
    elseif v76[l_name_0] and l_name_1 == l_AvatarScreen_0.Catalog and v128.state.restorePreviousChildFocus then
        v128:setState({
            restorePreviousChildFocus = false
        });
    end;
    if l_AXCatalogRealTimeRecommendationsIXP_0.isEnabled() then
        v128:handleExitAndReEnterAvatarExperience(v129);
    end;
    local v132 = if l_FFlagAXPassScreenSizeToWidgetApi_0 and v128.props.searchParameters then v128.props.searchParameters[v128.props.searchUuid] else nil;
    local v133 = if l_FFlagAXPassScreenSizeToWidgetApi_0 then l_getShouldPageUseWidgetOnlyFetcher_0(v128.props.categoryInfo, v128.props.filterCount, v132 and v132.searchKeyword) else nil;
    if l_FFlagAXPassScreenSizeToWidgetApi_0 and v128.props.screenSize and v129.screenSize and v128.props.screenSize ~= v129.screenSize and v133 then
        v128.props.fetchMarketplace();
    end;
    if v129.avatarRoute.opaque.name == l_AvatarScreen_0.CatalogSearch and v128.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then
        if v51 then
            if v128.props.externalNavigationRequest == v129.externalNavigationRequest and not v34.catalogDeepLinkExists(v128.props.externalNavigationRequest) then
                v128.props.resetSortAndFilters();
            end;
        else
            v128.props.resetSortAndFilters();
        end;
    end;
    local v134 = v128.props.categoryInfo and v128.props.categoryInfo.ShowWidgets;
    local v135 = v129.categoryInfo and v129.categoryInfo.ShowWidgets;
    local v136 = v134 and not v135;
    local v137 = false;
    if l_name_0 == l_AvatarScreen_0.Catalog then
        v137 = l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage;
    end;
    if v136 or v137 then
        if l_FFlagAXPassScreenSizeToWidgetApi_0 and v133 then
            v128.props.fetchMarketplace();
        else
            v128.fetchWidgetInfo(v128.props.categoryId, v128.props.subcategoryId);
        end;
    end;
    local v138 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    local v139 = if v138 then v129.isPrefetchingMarketplace and not v129.hasPrefetchedMarketplace else nil;
    local v140 = if v138 then not v128.props.isPrefetchingMarketplace and not v128.props.hasPrefetchedMarketplace else nil;
    if v138 then
        if v128.props.hasPrefetchedMarketplace and v128.state.isInitialPrefetch then
            l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.inTreatmentAndHasPrefetchedMarketplace);
            v128:setState({
                isInitialPrefetch = false
            });
        end;
        if v139 and v140 and v128.state.isInitialPrefetch then
            l_sendAXCounterV2_0(v43.Counter.PrefetchMarketplace.enteredMarketplaceButPrefetchFailed);
            v128.dispatchInitialSearch();
            v128.fetchWidgetInfo(v128.props.categoryId, v128.props.subcategoryId);
            v128:setState({
                isInitialPrefetch = false
            });
        end;
    end;
end;
v50 = v40((v32((v30(v5.connect(function(v141, v142) --[[ Line: 835 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v39 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v33 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), l_FFlagAXDurablesSupport_0 (copy), v51 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), v74 (copy)
    local v143 = nil;
    local v144 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v143 = v142.categoryId;
        v144 = v142.subcategoryId;
    else
        v143 = v141.AvatarExperience.Catalog.Categories.categoryId;
        v144 = v141.AvatarExperience.Catalog.Categories.subcategoryId;
    end;
    local v145 = nil;
    v145 = if l_FFlagAXCatalogCategoriesStore_0 then v142.categoryInfo else v39.getCatalogCategoryInfoFromState(v141);
    local l_subButton_0 = v141.AvatarExperience.AvatarEditor.Categories.subButton;
    local v147 = if l_FFlagAXEditorSubcategoryFilters_0 then v141.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil;
    local v148, _ = v33.getSearchUuidAndAssetTypes(v145, l_subButton_0, if l_FFlagAXEditorSubcategoryFilters_0 then v147 else nil);
    local v150 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v141.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser else nil;
    return {
        categoryInfo = v145, 
        categoryId = v143, 
        subcategoryId = v144, 
        minPrice = v141.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice, 
        maxPrice = v141.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice, 
        selectedTopics = if (not l_FFlagAXCatalogCategoriesStore_0 or v145 ~= nil) and v145.ShowTopics then v141.AvatarExperience.Catalog.SortAndFilters.SelectedTopics else nil, 
        catalogSort = v141.AvatarExperience.Catalog.SortAndFilters.CatalogSort, 
        catalogSortAggregation = v141.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation, 
        creatorFilter = v141.AvatarExperience.Catalog.SortAndFilters.CreatorFilter, 
        salesTypeFilter = v141.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter, 
        unavailableItemFilter = v141.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter, 
        wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v141.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter else nil, 
        searchParameters = v141.SearchesParameters, 
        searchTime = v141.SearchTimes and v141.SearchTimes[v148] or nil, 
        searchUuid = v148, 
        widgetFetchTime = v141.AvatarExperience.Common.Widgets.WidgetInfo.FetchTime, 
        externalNavigationRequest = if v51 then v141.AvatarExperience.ExternalNavigationRequest else nil, 
        isRecentMarketplaceUser = v150, 
        filterCount = if l_FFlagAXPassScreenSizeToWidgetApi_0 then v74(v141) else nil
    };
end, function(v151) --[[ Line: 897 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v29 (copy), v28 (copy), l_FFlagAXDurablesSupport_0 (copy), v37 (copy), v38 (copy), v27 (copy), v35 (copy), v41 (copy), v48 (copy), v47 (copy)
    return {
        setSearchType = function(v152, v153) --[[ Line: 899 ]] --[[ Name: setSearchType ]]
            -- upvalues: v151 (copy), v29 (ref)
            return v151(v29(v152, v153));
        end, 
        setSearchParameters = function(v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164) --[[ Line: 903 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v151 (copy), v28 (ref), l_FFlagAXDurablesSupport_0 (ref)
            return v151(v28(v154, {
                categoryInfo = v155, 
                catalogSort = v156, 
                catalogSortAggregation = v157, 
                minPrice = v158, 
                maxPrice = v159, 
                selectedTopics = v160, 
                creatorFilter = v161, 
                salesTypeFilter = v162, 
                unavailableItemFilter = v163, 
                wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v164 else nil
            }));
        end, 
        dispatchSearch = function(v165, v166, v167) --[[ Line: 930 ]] --[[ Name: dispatchSearch ]]
            -- upvalues: v151 (copy), v37 (ref)
            return v151(v37(v165, {
                searchUuid = v166, 
                categoryInfo = v167, 
                recordSearchTime = true
            }));
        end, 
        fetchWidgetInfo = function(v168, v169, v170) --[[ Line: 938 ]] --[[ Name: fetchWidgetInfo ]]
            -- upvalues: v151 (copy), v38 (ref)
            return v151(v38(v168, v169, v170));
        end, 
        dispatchRemoveSearch = function(v171) --[[ Line: 942 ]] --[[ Name: dispatchRemoveSearch ]]
            -- upvalues: v151 (copy), v27 (ref)
            v151(v27(v171));
        end, 
        clearSelectedTopics = function() --[[ Line: 946 ]] --[[ Name: clearSelectedTopics ]]
            -- upvalues: v151 (copy), v35 (ref)
            v151(v35());
        end, 
        resetSortAndFilters = function() --[[ Line: 950 ]] --[[ Name: resetSortAndFilters ]]
            -- upvalues: v151 (copy), v41 (ref)
            v151(v41());
        end, 
        dispatchCatalogTilesLatencyStartTracker = v48() and function(v172) --[[ Line: 955 ]]
            -- upvalues: v151 (copy), v47 (ref)
            v151(v47.StartTracking(v172));
        end or nil
    };
end)(v50), v31.Consumer, "pageObjectManager")))));
v50 = l_RoactServices_0.connect({
    networking = v7, 
    catalogAnalytics = v42
})(v50);
if l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 or l_FFlagAXCatalogCategoriesStore_0 or l_FFlagAXPassScreenSizeToWidgetApi_0 then
    return function(v173) --[[ Line: 978 ]] --[[ Name: NavigationItemsViewWrapper ]]
        -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), v24 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v54 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v71 (copy), l_useSignalState_0 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), v72 (copy), v3 (copy), v50 (ref)
        local v174 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v24.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
        local v175 = if not not l_AXPrefetchMarketplaceIXP_0.isEnabled() or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then v54() else nil;
        local v176 = table.clone(v173);
        if (v174 or l_FFlagAXUnifiedMarketplaceResultsFetcher_0) and v175 then
            v176.hasPrefetchedMarketplace = v175.hasFetched;
            v176.isPrefetchingMarketplace = v175.isFetching;
            v176.fetchMarketplace = v175.fetchMarketplace;
            v176.fetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v175.fetchedMarketplaceTimestamp else nil;
        end;
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v177 = v71.getCatalogSelectionStore();
            local v178 = l_useSignalState_0(v177.selectedCategoryId);
            local v179 = l_useSignalState_0(v177.selectedSubcategoryId);
            local v180 = l_useSignalState_0(v177.selectedCategoryInfo);
            v176.categoryId = v178;
            v176.subcategoryId = v179;
            v176.categoryInfo = v180;
        end;
        if l_FFlagAXPassScreenSizeToWidgetApi_0 then
            local v181 = l_getAXMarketplaceWidgetStore_0(false);
            v176.screenSize = v72.useSignalState(v181.getDebouncedScreenSize);
        end;
        return v3.createElement(v50, v176);
    end;
else
    return v50;
end;