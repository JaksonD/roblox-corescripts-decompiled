local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_Focusable_0 = v8.Focusable;
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_EmptyState_0 = v12.App.Indicator.EmptyState;
local l_withStyle_0 = v12.Style.withStyle;
local v15 = require(l_CorePackages_0.Packages.Promise);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v17 = require(l_CorePackages_0.Packages.t);
local l_FitTextLabel_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v20 = require(l_CorePackages_0.Packages.Cryo);
local v21 = require(l_Modules_0.LuaApp.mutedError);
local v22 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v23 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_getTryOnItemReducerKey_0 = v24.Utils.getTryOnItemReducerKey;
local l_FFlagAXCatalogCategoriesStore_0 = v23.FFlagAXCatalogCategoriesStore;
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v29 = require(l_CorePackages_0.Packages.SignalsReact);
local l_useSignalState_0 = v29.useSignalState;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SearchCategories);
local v36 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v36.Enums.AvatarScreen;
local l_AvatarRoute_0 = v36.AvatarRoute.AvatarRoute;
local v39 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v43 = require(l_CorePackages_0.Packages.tutils);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v46 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v47 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v48 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v49 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v50 = require(l_Modules_0.LuaApp.Constants);
local v51 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v52 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v53 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v54 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v55 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v56 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v57 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v58 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v59 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v60 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList);
local v61 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v62 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_getUseSelectorDeepEquals_0 = v24.Utils.getUseSelectorDeepEquals;
local v64 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v66 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v67 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsListTopPanel);
local v68 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.CatalogResultListNavigation.CatalogResultListNavigationContainer);
local l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 = v23.FFlagAXMigrateCatalogResultListNavigationToMVVM;
local v70 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsListListHeader);
local v71 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v72 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Stores);
local l_AvatarExperienceScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector;
local l_CatalogCategories_0 = v24.Enums.CatalogCategories;
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local l_useUnifiedEventImpressionsReporter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter;
local l_useAnimatedVisibility_0 = v24.Stores.AnimatedVisibilityStore.useAnimatedVisibility;
local l_getShouldPageUseWidgetOnlyFetcher_0 = v25.Utils.getShouldPageUseWidgetOnlyFetcher;
local l_getAXMarketplaceWidgetStore_0 = v25.Stores.getAXMarketplaceWidgetStore;
local v80 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v81 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget);
local v82 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget);
local v83 = require(l_Modules_0.AvatarExperience.Catalog.Actions.EquippedDeepLinkCatalogItem);
local v84 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v85 = game:DefineFastFlag("AXFixResultListCrash", false);
local v86 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v87 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v88 = game:DefineFastFlag("AXFixFlashingNoItemsFound", false);
local l_FFlagAXMISEnableMultiShopping_0 = v23.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateMainNavigationInputBindings_0 = v23.FFlagAXMigrateMainNavigationInputBindings;
local l_FFlagAXItemDetailsIxpExposure_0 = v23.FFlagAXItemDetailsIxpExposure;
local v92 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v94 = require(script.Parent.useResultsListFocusNavigationBindings);
local l_FFlagAXFixCatalogRefreshRendering_0 = v23.FFlagAXFixCatalogRefreshRendering;
local v96 = v5.PureComponent:extend("ResultsList");
local l_FFlagUpdateNoInternetConnectionText_0 = v23.FFlagUpdateNoInternetConnectionText;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXAdaptiveScrollingFixForward_0 = v23.FFlagAXAdaptiveScrollingFixForward;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v23.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXHandleLooksWidgetCategories_0 = v23.FFlagAXHandleLooksWidgetCategories;
local l_FFlagAXLooksWidgetContextForOrganicContent_0 = v23.FFlagAXLooksWidgetContextForOrganicContent;
local v103 = l_FFlagAXCatalogCategoriesStore_0 and game:DefineFastFlag("AXHidePillBarCheckSubcategory", false);
local l_FFlagAXHideMenuOnScroll_0 = v23.FFlagAXHideMenuOnScroll;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v23.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXCatalogCategoriesSDUI_0 = v23.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXReduceResultsListRerendersOnItemInfos_0 = v23.FFlagAXReduceResultsListRerendersOnItemInfos;
local l_FFlagAXEnableTTIViaModule_0 = v23.FFlagAXEnableTTIViaModule;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 = v23.FFlagAXFixWidgetOnlyTabNoItemsFound;
local l_FFlagAXShowCategoriesWhenNetworkFails_0 = v23.FFlagAXShowCategoriesWhenNetworkFails;
local v112 = game:DefineFastFlag("AXSkipTryOnHoistForLooks", false);
v96.defaultProps = {
    navBarSizeY = 0
};
v96.validateProps = v17.strictInterface({
    analyticsContext = v17.string, 
    layoutOrder = v17.optional(v17.number), 
    fromSearch = v17.boolean, 
    itemsHeader = v17.optional(v17.table), 
    frameRef = v17.optional(v17.table), 
    scrollingFrameRef = v17.optional(v17.table), 
    onRetry = v17.callback, 
    searchUuid = v17.string, 
    navBarSizeY = v17.optional(v17.number), 
    navBarRef = v17.optional(v17.table), 
    backToTopSignal = v17.optional(v17.table), 
    multiTryOnBottomBarRef = v17.optional(v17.table), 
    categoryInfo = v17.optional(v17.table), 
    onCategoryOrSubcategoryChange = v17.optional(v17.callback), 
    onCategoryOrSubcategoryChangeById = v17.optional(v17.callback), 
    itemDetailsPeekViewRefs = v17.table, 
    showCloseIcon = v17.optional(v17.boolean), 
    onCloseFocusedWidget = v17.optional(v17.callback), 
    NextSelectionUp = v17.optional(v17.table), 
    NextSelectionRight = v17.optional(v17.table), 
    searchParameters = v17.optional(v17.table), 
    searchInCatalog = v17.optional(v17.table), 
    dataStatus = v17.string, 
    currentPage = v17.optional(v17.table), 
    tryOnItems = v17.optional(v17.table), 
    tryOnLookId = if v112 then v17.optional(v17.string) else nil, 
    fullView = v17.optional(v17.userdata), 
    focusedWidget = v17.optional(v17.table), 
    hideTopBar = v17.optional(v17.boolean), 
    widgetRequestId = v17.optional(v17.string), 
    selectedCategoryId = v17.optional(v17.string), 
    selectedSubcategoryId = v17.optional(v17.string), 
    selectedSearchCategoryId = v17.optional(v17.string), 
    selectedSearchSubcategoryId = v17.optional(v17.string), 
    selectedCategory = if l_FFlagAXCatalogCategoriesStore_0 then v17.optional(v17.table) else nil, 
    selectedSearchCategory = if l_FFlagAXCatalogCategoriesStore_0 then v17.optional(v17.table) else nil, 
    selectedSearchSubcategory = if v103 then v17.optional(v17.table) else nil, 
    widgetDataStatus = v17.optional(v17.string), 
    hasWidgets = v17.boolean, 
    sortAndFilters = v17.optional(v17.table), 
    externalNavigationRequestParams = v17.table, 
    itemInfos = v17.table, 
    analyticsMetadata = v17.optional(v17.table), 
    filterCount = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v17.number else nil, 
    dispatchLoadMore = v17.callback, 
    dispatchSetResultsListFocusedWidget = v17.callback, 
    dispatchClearResultsListFocusedWidget = v17.callback, 
    dispatchCatalogTilesLatencyStartTracker = if v87() then v17.callback else nil, 
    fetchItemData = v17.callback, 
    handleDeepLinkEquipError = v17.callback, 
    equipCatalogDeepLinkItem = v17.callback, 
    catalogAnalytics = v17.table, 
    axAnalytics = v17.table, 
    networking = v17.callback, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    namedRefs = v17.table, 
    navigation = v17.table, 
    adaptiveScrolling = v17.optional(v17.any), 
    visibilityRatioBinding = if l_FFlagAXHideMenuOnScroll_0 then v17.optional(v17.table) else nil, 
    focusNavigationBindingsRef = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v17.callback else nil, 
    tagBasedImpressionsDetectorExtensions = if l_FFlagAXItemDetailsIxpExposure_0 then v17.table else nil, 
    hasProcessedMarketplaceFetcher = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v17.boolean else nil, 
    isFetchingMarketplaceError = if not not l_FFlagAXMoveAllTabToWidgetOnly_0 or l_FFlagAXCatalogCategoriesSDUI_0 then v17.boolean else nil, 
    shouldPageUseWidgetOnly = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v17.boolean else nil
});
v96.init = function(v113) --[[ Line: 257 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_Signal_0 (copy), v39 (copy), v15 (copy), v85 (copy), v21 (copy), v66 (copy), v87 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), v86 (copy)
    v113.state = {
        restorePreviousChildFocus = true, 
        numItemsPerRow = 0, 
        navBarSizeY = 0, 
        showFailedState = false
    };
    v113.lastYPosition = 0;
    v113.scrollingFrameRef = v113.props.scrollingFrameRef or v5.createRef();
    v113.navBarRef = v5.createRef();
    v113.topPanelRef = v5.createRef();
    v113.gridRef = v5.createRef();
    v113.pillBarRef = v5.createRef();
    v113.emptyStateRef = v5.createRef();
    v113.widgetFlatListRef = v5.createRef();
    local v114 = nil;
    local v115 = nil;
    v113.topPanelHeightBinding = v114;
    v113.updateTopPanelHeightBinding = v115;
    v114, v115 = v5.createBinding(0);
    v113.topPanelHeightBinding = v114;
    v113.updateTopPanelHeightBinding = v115;
    v113.impressionsReported = {};
    v113.itemDetailsPeekViewRefs = v113.props.itemDetailsPeekViewRefs;
    v113.onNumItemsPerRowChanged = function(v116) --[[ Line: 281 ]]
        -- upvalues: v113 (copy)
        v113:setState({
            numItemsPerRow = v116
        });
    end;
    v113.onNavBarSizeChanged = function(v117) --[[ Line: 287 ]]
        -- upvalues: v113 (copy)
        if v117.Y ~= v113.state.navBarSizeY then
            v113:setState({
                navBarSizeY = v117.Y
            });
        end;
    end;
    v113.requestImpressionsSignal = l_Signal_0.new();
    v113.onItemsListScroll = function(v118) --[[ Line: 297 ]]
        -- upvalues: v113 (copy)
        v113.requestImpressionsSignal:fire();
        local v119 = v113.props.adaptiveScrolling or {};
        if v119.onCanvasYChanged then
            v119.onCanvasYChanged(v118);
        end;
    end;
    v113.loadMore = function() --[[ Line: 306 ]]
        -- upvalues: v113 (copy), v39 (ref), v15 (ref), v85 (ref), v21 (ref)
        if v113.props.dataStatus == v39.Fetching then
            v113.retryLoadMore = true;
            return v15.resolve("Currently fetching");
        else
            local l_catalogAnalytics_0 = v113.props.catalogAnalytics;
            local l_searchUuid_0 = v113.props.searchUuid;
            local l_searchInCatalog_0 = v113.props.searchInCatalog;
            local l_searchParameters_0 = v113.props.searchParameters;
            local l_dispatchLoadMore_0 = v113.props.dispatchLoadMore;
            if v85 and not l_searchInCatalog_0 then
                l_searchInCatalog_0 = {};
                v21(string.format("ResultsList: searchInCatalog is nil; searchUuid: %s", (tostring(l_searchUuid_0))));
            end;
            local v125 = l_searchParameters_0 and l_searchParameters_0.categoryInfo or nil;
            return l_dispatchLoadMore_0(l_catalogAnalytics_0, l_searchInCatalog_0.keyword, l_searchUuid_0, v125, v113.props.networking);
        end;
    end;
    v113.onFocusGained = function() --[[ Line: 338 ]]
        -- upvalues: v113 (copy)
        v113:setState({
            restorePreviousChildFocus = true
        });
    end;
    v113.scrollBackToTop = function() --[[ Line: 344 ]]
        -- upvalues: v113 (copy)
        local l_current_0 = v113.props.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
    v113.setFocusedWidget = function(v127) --[[ Line: 351 ]]
        -- upvalues: v113 (copy)
        local v128 = if v127 and v127.template then v127.template.title else nil;
        local v129 = if v127 and v127.template then v127.template.localizedTitle else "";
        local v130 = if v127 and v127.template then v127.template.localizedDescription else "";
        local v131 = if v127 and v127.template then v127.template.description else nil;
        local v132 = if v127 and v127.template then v127.template.tooltip else nil;
        local v133 = if v127 and v127.template then v127.template.localizedTooltip else "";
        local v134 = nil;
        v134 = {
            title = v128, 
            localizedTitle = v129, 
            description = v131, 
            localizedDescription = v130, 
            tooltip = v132, 
            localizedTooltip = v133
        };
        v113.props.dispatchSetResultsListFocusedWidget(v113.props.searchUuid, v127.id, v134);
    end;
    v113.clearFocusedWidget = function() --[[ Line: 376 ]]
        -- upvalues: v113 (copy)
        v113.props.dispatchClearResultsListFocusedWidget(v113.props.searchUuid);
    end;
    v113.shouldScrollBackToTopOfList = function(v135) --[[ Line: 380 ]]
        -- upvalues: v66 (ref)
        local l_searchChanged_0 = v135.searchChanged;
        local l_oldSortsAndFilter_0 = v135.oldSortsAndFilter;
        local l_newSortsAndFilter_0 = v135.newSortsAndFilter;
        return l_searchChanged_0 or not v66.areSortAndFiltersEqual(l_oldSortsAndFilter_0, l_newSortsAndFilter_0);
    end;
    if v87() then
        if l_FFlagAXEnableTTIViaModule_0 then
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Tiles);
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Thumbnails);
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Tiles);
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Thumbnails);
        end;
        v113.props.dispatchCatalogTilesLatencyStartTracker(v113.props.searchUuid);
    end;
end;
v96.getNextSelectionRight = function(v139, v140, v141) --[[ Line: 411 ]] --[[ Name: getNextSelectionRight ]]
    -- upvalues: l_AvatarScreen_0 (copy), v20 (copy)
    local l_NextSelectionRight_0 = v139.props.NextSelectionRight;
    if v140 == l_AvatarScreen_0.ItemDetails and v141 then
        return v139.itemDetailsPeekViewRefs[v141];
    elseif v140 == l_AvatarScreen_0.LookDetails then
        return v139.props.namedRefs[l_AvatarScreen_0.LookDetails];
    else
        if v139.props.tryOnItems and not v20.isEmpty(v139.props.tryOnItems) and v140 ~= l_AvatarScreen_0.SortAndFilters and v139.props.multiTryOnBottomBarRef and v139.props.multiTryOnBottomBarRef:getValue() ~= nil then
            l_NextSelectionRight_0 = v139.props.multiTryOnBottomBarRef;
        end;
        return l_NextSelectionRight_0;
    end;
end;
v96.renderResultsList = function(v143, v144, v145) --[[ Line: 433 ]] --[[ Name: renderResultsList ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v39 (copy), v53 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), l_AvatarScreen_0 (copy), v50 (copy), v88 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v64 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_CatalogCategories_0 (copy), l_FFlagAXHandleLooksWidgetCategories_0 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_withLocalization_0 (copy), l_ImpressionEnums_0 (copy), v5 (copy), v92 (copy), v80 (copy), v87 (copy), l_AvatarExperienceScreenSizeImpressionsDetector_0 (copy), v71 (copy), l_IXPService_0 (copy), l_CollectionService_0 (copy), v103 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v8 (copy), v58 (copy), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (copy), v68 (copy), v67 (copy), l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_EmptyState_0 (copy), v60 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), v70 (copy), l_FitTextLabel_0 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local l_searchInCatalog_1 = v143.props.searchInCatalog;
    local l_dataStatus_0 = v143.props.dataStatus;
    local v148 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v143.props.shouldPageUseWidgetOnly else nil;
    local v149 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v148 and v143.props.hasProcessedMarketplaceFetcher else nil;
    local l_key_0 = v143.props.navigation.state.key;
    local l_avatarRoute_0 = v143.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local l_key_1 = l_avatarRoute_0.current.key;
    local l_entries_0 = v143.state.entries;
    local v155 = l_entries_0 and #l_entries_0 ~= 0;
    local l_hasWidgets_0 = v143.props.hasWidgets;
    local l_widgetDataStatus_0 = v143.props.widgetDataStatus;
    local v158 = false;
    if l_dataStatus_0 == v39.Done then
        v158 = not l_widgetDataStatus_0 or l_widgetDataStatus_0 == v39.Done;
    end;
    local v159 = l_entries_0 and #l_entries_0 or v53.PageFetchLimit;
    local v160 = not v158 or v155 or v143.props.hasWidgets or l_FFlagAXMoveAllTabToWidgetOnly_0 and v149 and v143.props.hasProcessedMarketplaceFetcher;
    local v161 = nil;
    if l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 then
        if v149 then
            v158 = v143.props.hasProcessedMarketplaceFetcher;
        end;
        v161 = v149 and v143.props.hasProcessedMarketplaceFetcher and l_hasWidgets_0;
        v160 = not v158 or v155 or v143.props.hasWidgets or v161;
    end;
    local v162 = l_searchInCatalog_1 and l_searchInCatalog_1.hasMoreEntries or nil;
    local v163 = v155 and v162;
    local v164 = v155 and not v163 or l_FFlagAXMoveAllTabToWidgetOnly_0 and v149 or l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and v161;
    local l_Font_0 = v144.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v167 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local l_Theme_0 = v144.Theme;
    local l_Color_0 = l_Theme_0.TextMuted.Color;
    local l_Transparency_0 = l_Theme_0.TextMuted.Transparency;
    local v171 = false;
    if l_name_0 ~= l_AvatarScreen_0.ItemDetails then
        v171 = v145 ~= nil;
    end;
    local v172 = nil;
    local v173 = v50.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v174 = not v160 and not l_hasWidgets_0;
    if v88 and (not l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 or not v149) then
        v174 = v174 and l_entries_0 and #l_entries_0 == 0;
    end;
    local v175 = nil;
    local v176 = nil;
    local v177 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v176 = v143.props.selectedCategory;
        v177 = v143.props.selectedSearchCategory;
    else
        v176 = v64.getCategoryId(v143.props.selectedCategoryId);
        v177 = v64.getCategoryId(v143.props.selectedSearchCategoryId);
    end;
    local v178 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v176.Id == l_CatalogCategories_0.Avatars:rawValue() else v176.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog;
    local v179 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v177.Id == l_CatalogCategories_0.Avatars:rawValue() else v177.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch;
    local v180 = nil;
    local v181 = nil;
    if l_FFlagAXHandleLooksWidgetCategories_0 then
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v176.LooksWidgetContextForOrganicContent ~= nil then
                    v180 = true;
                end;
            elseif v176.ShowLooksAsOrganicContent ~= nil then
                v180 = true;
            end;
        end;
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v177.LooksWidgetContextForOrganicContent ~= nil then
                    v181 = true;
                end;
            elseif v177.ShowLooksAsOrganicContent ~= nil then
                v181 = true;
            end;
        end;
    end;
    if (l_FFlagAXHandleLooksWidgetCategories_0 and (v180 or v181) or not l_FFlagAXHandleLooksWidgetCategories_0 and (v178 or v179)) and l_entries_0 and #l_entries_0 == 0 and v162 then
        v175 = true;
        v174 = false;
        v159 = 0;
    end;
    local l_active_0 = v143.props.focusedWidget.active;
    local l_title_0 = v143.props.focusedWidget.title;
    local l_id_0 = v143.props.focusedWidget.id;
    local v185 = if l_active_0 then l_title_0 else nil;
    local v186 = {};
    v164 = v164 or l_active_0;
    return l_withLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound", 
        focusedWidgetTitle = if v185 ~= "" then v185 else nil, 
        emptyText = "Feature.DisplayName.ErrorMessage.SomethingWentWrong"
    })(function(v187) --[[ Line: 581 ]]
        -- upvalues: v143 (copy), l_name_0 (copy), l_key_1 (copy), l_ImpressionEnums_0 (ref), v172 (ref), v5 (ref), v92 (ref), l_key_0 (copy), v80 (ref), v173 (copy), v87 (ref), l_AvatarExperienceScreenSizeImpressionsDetector_0 (ref), v71 (ref), v186 (copy), l_IXPService_0 (ref), l_CollectionService_0 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), v64 (ref), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_CatalogCategories_0 (ref), l_FFlagAXHandleLooksWidgetCategories_0 (ref), v103 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), l_FFlagAXHideMenuOnScroll_0 (ref), l_Focusable_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v171 (copy), v8 (ref), v145 (copy), v58 (ref), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (ref), v68 (ref), v67 (ref), v155 (copy), l_FFlagAXShowCategoriesWhenNetworkFails_0 (ref), l_EmptyState_0 (ref), v60 (ref), l_entries_0 (copy), v160 (ref), v163 (copy), v164 (ref), l_active_0 (copy), l_id_0 (copy), v159 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v70 (ref), v174 (ref), l_FitTextLabel_0 (ref), v144 (copy), v167 (copy), l_Color_0 (copy), l_Transparency_0 (copy), l_Font_1 (copy), v175 (ref), l_TagBasedImpressionsDetector_0 (ref)
        local v188 = v143:getNextSelectionRight(l_name_0, l_key_1);
        local v189 = if v143.props.fromSearch then l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH else l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE;
        v172 = v5.createElement(v92, {
            parentRef = v143.gridRef, 
            pageFilter = function() --[[ Line: 588 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v143.requestImpressionsSignal, 
            eventContext = v80(), 
            eventName = "marketplaceOrganicFELog", 
            requestId = v143.props.widgetRequestId, 
            impressionsTag = v173, 
            impressionsSchema = "defaultItem", 
            searchUuid = if v87() then v143.props.searchUuid else nil, 
            surface = v189, 
            analyticsMetadata = v143.props.analyticsMetadata
        });
        local v198 = v5.createElement(l_AvatarExperienceScreenSizeImpressionsDetector_0, {
            parentRef = v143.gridRef, 
            pageFilter = function() --[[ Line: 604 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v143.requestImpressionsSignal, 
            filterImpressionFunc = function(v190) --[[ Line: 608 ]] --[[ Name: filterImpressionFunc ]]
                -- upvalues: v71 (ref), v186 (ref)
                local l_v190_Attribute_0 = v190:GetAttribute(v71.WidgetExposureMetadata.AttributeKey);
                return l_v190_Attribute_0 and not v186[l_v190_Attribute_0];
            end, 
            onImpressionsDetected = function(v192) --[[ Line: 612 ]] --[[ Name: onImpressionsDetected ]]
                -- upvalues: v71 (ref), v186 (ref), l_IXPService_0 (ref), v143 (ref)
                for _, v194 in v192 do
                    local l_v194_Attribute_0 = v194:GetAttribute(v71.WidgetExposureMetadata.AttributeKey);
                    v186[l_v194_Attribute_0] = true;
                    l_IXPService_0:LogUserLayerExposure(l_v194_Attribute_0);
                    local l_impressionsReported_0 = v143.impressionsReported;
                    if not l_impressionsReported_0[v194.Name] then
                        v143.props.catalogAnalytics.widgetInteractionV2({}, v71.ActionType.IMPRESSION);
                        l_impressionsReported_0[v194.Name] = true;
                    end;
                end;
            end, 
            collectObjectsFunc = function(_) --[[ Line: 627 ]] --[[ Name: collectObjectsFunc ]]
                -- upvalues: l_CollectionService_0 (ref), v71 (ref)
                return l_CollectionService_0:GetTagged(v71.WidgetExposureMetadata.TagName);
            end
        });
        local l_frameRef_0 = v143.props.frameRef;
        local l_backToTopSignal_0 = v143.props.backToTopSignal;
        local v201 = v143.props.adaptiveScrolling or {};
        local v202 = 0;
        if v143.props.multiTryOnBottomBarRef then
            local v203 = v143.props.multiTryOnBottomBarRef:getValue();
            v202 = if v203 then v203.AbsoluteSize.Y else 0;
        end;
        local l_routeName_0 = v143.props.navigation.state.routeName;
        local v205 = v143.props.namedRefs[l_routeName_0 .. "TopPanel"];
        local v206 = nil;
        v206 = if l_FFlagAXCatalogCategoriesStore_0 then v143.props.selectedSearchCategory else v64.getCategoryId(v143.props.selectedSearchCategoryId);
        local v207 = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v206.Id == l_CatalogCategories_0.Avatars:rawValue() else v206.NavigationKey == l_CatalogCategories_0.Avatars;
        if l_FFlagAXHandleLooksWidgetCategories_0 then
            if v103 then
                local v208 = if v143.props.selectedSearchSubcategory then v143.props.selectedSearchSubcategory else v206;
                v207 = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v208.LooksWidgetContextForOrganicContent ~= nil else v208.ShowLooksAsOrganicContent ~= nil;
            else
                v207 = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v206.LooksWidgetContextForOrganicContent ~= nil else v206.ShowLooksAsOrganicContent ~= nil;
            end;
        end;
        local v211 = if l_FFlagAXHideMenuOnScroll_0 and v143.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v143.props.visibilityRatioBinding, 
            height = v143.topPanelHeightBinding
        }):map(function(v209) --[[ Line: 684 ]]
            local v210 = math.floor((1 - v209.visibility) * -v209.height);
            return UDim2.fromOffset(0, v210);
        end) else nil;
        local v214 = if l_FFlagAXHideMenuOnScroll_0 and v143.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v143.props.visibilityRatioBinding, 
            height = v143.topPanelHeightBinding
        }):map(function(v212) --[[ Line: 694 ]]
            local v213 = v212.height * v212.visibility;
            return UDim2.new(1, 0, 1, -v213);
        end) else nil;
        local v217 = if l_FFlagAXHideMenuOnScroll_0 and v143.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v143.props.visibilityRatioBinding, 
            height = v143.topPanelHeightBinding
        }):map(function(v215) --[[ Line: 704 ]]
            local v216 = v215.height * v215.visibility;
            return UDim2.fromOffset(0, v216);
        end) else nil;
        return v5.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ClipsDescendants = true, 
            LayoutOrder = v143.props.layoutOrder, 
            [v5.Ref] = l_frameRef_0, 
            defaultChild = v143.topPanelRef, 
            NextSelectionUp = v143.props.NextSelectionUp, 
            restorePreviousChildFocus = v143.state.restorePreviousChildFocus, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v171 and {
                NavUp = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 723 ]]
                    -- upvalues: v145 (ref), v143 (ref)
                    v145.moveFocusTo(v143.props.NextSelectionUp);
                end)
            } or nil
        }, {
            BackToTopSignal = if l_backToTopSignal_0 then v5.createElement(v58, {
                signal = l_backToTopSignal_0, 
                callback = v143.scrollBackToTop
            }) else nil, 
            ScrollPanel = v5.createElement(l_FFlagAXMigrateMainNavigationInputBindings_0 and "Frame" or l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ClipsDescendants = true, 
                [v5.Ref] = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v143.props.focusNavigationBindingsRef else nil
            }, {
                TopPanel = v5.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ZIndex = 2, 
                    ref = v205, 
                    Position = if l_FFlagAXHideMenuOnScroll_0 then v211 else nil
                }, v5.createElement(if l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 then v68 else v67, {
                    fromSearch = v143.props.fromSearch, 
                    catalogAnalytics = v143.props.catalogAnalytics, 
                    axAnalytics = v143.props.axAnalytics, 
                    searchUuid = v143.props.searchUuid, 
                    searchInCatalog = v143.props.searchInCatalog, 
                    hideTopBar = v143.props.hideTopBar, 
                    focusedWidget = v143.props.focusedWidget, 
                    showCloseIcon = v143.props.showCloseIcon, 
                    restorePreviousChildFocus = v143.state.restorePreviousChildFocus, 
                    topPanelRef = v143.topPanelRef, 
                    gridRef = v143.gridRef, 
                    hasEntries = v155, 
                    backToTopSignal = v143.props.backToTopSignal, 
                    onCategoryOrSubcategoryChange = v143.props.onCategoryOrSubcategoryChange, 
                    onCategoryOrSubcategoryChangeById = v143.props.onCategoryOrSubcategoryChangeById, 
                    updateHeightBinding = v143.updateTopPanelHeightBinding, 
                    onCloseFocusedWidget = v143.props.onCloseFocusedWidget, 
                    hidePillBar = v207
                })), 
                ListFrame = v5.createElement("Frame", {
                    Size = l_FFlagAXHideMenuOnScroll_0 and v214 or v143.topPanelHeightBinding:map(function(v218) --[[ Line: 786 ]]
                        return UDim2.new(1, 0, 1, -v218);
                    end), 
                    Position = l_FFlagAXHideMenuOnScroll_0 and v217 or v143.topPanelHeightBinding:map(function(v219) --[[ Line: 791 ]]
                        return UDim2.fromOffset(0, v219);
                    end), 
                    BackgroundTransparency = 1
                }, if l_FFlagAXShowCategoriesWhenNetworkFails_0 and v143.state.showFailedState then {
                    EmptyState = v5.createElement(l_EmptyState_0, {
                        onActivated = v143.props.onRetry, 
                        text = v187.emptyText, 
                        [v5.Ref] = v143.emptyStateRef
                    })
                } else {
                    WidgetList = v5.createElement(v60.WidgetList, {
                        entries = l_entries_0, 
                        fromSearch = v143.props.fromSearch, 
                        bottomBarHeight = v202, 
                        showingEntries = v160, 
                        searchUuid = v143.props.searchUuid, 
                        loadMore = v163 and v143.loadMore or nil, 
                        hasMoreRows = v163, 
                        shouldCreateEndOfScrollElement = v164, 
                        itemDetailsPeekViewRefs = v143.itemDetailsPeekViewRefs, 
                        gridRef = v143.gridRef, 
                        flatListRef = v143.widgetFlatListRef, 
                        onScroll = v143.onItemsListScroll, 
                        focusedWidget = if l_active_0 then l_id_0 else nil, 
                        onWidgetFocusAcquired = v143.setFocusedWidget, 
                        onWidgetFocusReleased = v143.clearFocusedWidget, 
                        requestImpressionsSignal = v143.requestImpressionsSignal, 
                        onNumItemsPerRowChanged = v143.onNumItemsPerRowChanged, 
                        NextSelectionRight = v188, 
                        NextSelectionUp = v143.topPanelRef, 
                        restorePreviousChildFocus = v143.state.restorePreviousChildFocus, 
                        onFocusGained = not v143.state.restorePreviousChildFocus and v143.onFocusGained or nil, 
                        numItemsExpected = v159, 
                        scrollingEnabled = if v201.scrollingEnabledBinding then v201.scrollingEnabledBinding:map(function(v220) --[[ Line: 830 ]]
                            return v220;
                        end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v201.scrollingEnabled, 
                        selectedCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedCategoryIndex, 
                        selectedSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedSubcategoryIndex, 
                        selectedSearchCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedSearchCategoryIndex, 
                        selectedSearchSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedSearchSubcategoryIndex, 
                        selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedCategoryId, 
                        selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedSubcategoryId, 
                        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedSearchCategoryId, 
                        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v143.props.selectedSearchSubcategoryId, 
                        listHeaderComponent = v5.createElement(v70), 
                        pillBarVisible = not v207
                    }), 
                    NoItemsFound = v174 and v5.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0, v144.Tokens.Global.Space_400), 
                        Text = v187.noItemsFound, 
                        TextSize = v167, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        Font = l_Font_1
                    }), 
                    AvatarsTabError = v175 and v5.createElement("Frame", {
                        LayoutOrder = v143.props.layoutOrder, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1
                    }, {
                        EmptyState = v5.createElement(l_EmptyState_0, {
                            onActivated = v143.loadMore, 
                            text = v187.emptyText, 
                            [v5.Ref] = v143.emptyStateRef
                        })
                    })
                })
            }), 
            ImpressionsReporter = v172, 
            WidgetImpressionsReporter = v198, 
            UnifiedImpressionsReporter = v5.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v143.gridRef, 
                pageFilter = function() --[[ Line: 896 ]] --[[ Name: pageFilter ]]
                    -- upvalues: l_key_0 (ref), l_key_1 (ref)
                    return l_key_0 == l_key_1;
                end, 
                requestImpressionsSignal = v143.requestImpressionsSignal, 
                extensions = v143.props.tagBasedImpressionsDetectorExtensions
            })
        });
    end);
end;
v96.render = function(v221) --[[ Line: 906 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v5 (copy), l_EmptyState_0 (copy), l_withStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy)
    local l_showFailedState_0 = v221.state.showFailedState;
    if not l_FFlagAXShowCategoriesWhenNetworkFails_0 and l_showFailedState_0 then
        return l_withLocalization_0({
            emptyText = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v223) --[[ Line: 914 ]]
            -- upvalues: v5 (ref), v221 (copy), l_EmptyState_0 (ref)
            return v5.createElement("Frame", {
                LayoutOrder = v221.props.layoutOrder, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                EmptyState = v5.createElement(l_EmptyState_0, {
                    onActivated = v221.props.onRetry, 
                    text = v223.emptyText, 
                    [v5.Ref] = v221.emptyStateRef
                })
            });
        end);
    else
        return l_withStyle_0(function(v224) --[[ Line: 930 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v221 (copy), v8 (ref)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                return v221:renderResultsList(v224);
            else
                return v8.withFocusController(function(v225) --[[ Line: 934 ]]
                    -- upvalues: v221 (ref), v224 (copy)
                    return v221:renderResultsList(v224, v225);
                end);
            end;
        end);
    end;
end;
v96.updateItems = function(v226, v227) --[[ Line: 947 ]] --[[ Name: updateItems ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v48 (copy), v49 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v5 (copy), v20 (copy), v112 (copy), v46 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_getTryOnItemReducerKey_0 (copy)
    local l_searchInCatalog_2 = v226.props.searchInCatalog;
    local v229 = l_searchInCatalog_2 and l_searchInCatalog_2.items or nil;
    local v230 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v226.props.shouldPageUseWidgetOnly else false;
    local v231 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v230 and v226.props.hasProcessedMarketplaceFetcher else nil;
    local v232 = nil;
    v232 = if l_FFlagAXMoveAllTabToWidgetOnly_0 and v231 then {} else v229;
    if v226.props.externalNavigationRequestParams then
        if v48.newValidEquipDeepLinkExists(v226.props.externalNavigationRequestParams) then
            local v233, v234 = v48.parseItemIdAndItemType(v226.props.externalNavigationRequestParams);
            local v235 = v49(v226.props.itemInfos, v233, v234);
            if v235 then
                local v236 = v48.parseItemSubType(v234, v235);
                v226.props.equipCatalogDeepLinkItem(v226.props.networking, v226.props.catalogAnalytics, v234, v236, v233, true, v226.props.avatarRoute, v226.props.navigation, v226.props.widgetAnalyticsInfo);
            elseif not v226.props.externalNavigationRequestParams.wasItemEquipped then
                local l_v233_0 = v233 --[[ copy: 7 -> 17 ]];
                local l_v234_0 = v234 --[[ copy: 8 -> 18 ]];
                v226.props.fetchItemData(v226.props.networking, v226.props.catalogAnalytics, v233, v234):catch(function() --[[ Line: 986 ]]
                    -- upvalues: v226 (copy), l_v233_0 (copy), l_v234_0 (copy), v48 (ref), v232 (ref)
                    v226.props.handleDeepLinkEquipError(l_v233_0, l_v234_0);
                    v48.removeDeepLinkEntries(v232);
                end);
            end;
        end;
        if v226.props.externalNavigationRequestParams.wasItemEquipped then
            local l_tryOnItems_0 = v226.props.tryOnItems;
            local v240 = if l_FFlagAXFixCatalogRefreshRendering_0 and v226.props.categoryInfo then v226.props.categoryInfo else nil;
            local v241 = v226.props.searchParameters and v226.props.searchParameters.categoryInfo or v240 or {};
            v48.addEquippedItemToCatalogEntries(v226.props.externalNavigationRequestParams, l_tryOnItems_0, v241, v232);
        end;
    end;
    if not v232 then
        v226:setState({
            entries = v5.None
        });
        return;
    else
        local l_tryOnItems_1 = v226.props.tryOnItems;
        if v227 and not v20.isEmpty(l_tryOnItems_1) and (not l_FFlagAXMoveAllTabToWidgetOnly_0 or not v231) and (not v112 or v226.props.tryOnLookId == nil) then
            local v243 = v226.props.searchParameters and v226.props.searchParameters.categoryInfo or {};
            local v244 = {};
            local v245 = 0;
            if v243.AssetTypeIdStrings then
                for _, v247 in v243.AssetTypeIdStrings do
                    v244 = v20.Dictionary.join(v244, {
                        [v247] = v46.ItemType.Asset
                    });
                end;
                v245 = v245 + #v243.AssetTypeIdStrings;
            end;
            if v243.BundleTypes then
                for _, v249 in v243.BundleTypes do
                    v244 = v20.Dictionary.join(v244, {
                        [v249] = v46.ItemType.Bundle
                    });
                end;
                v245 = v245 + #v243.BundleTypes;
            end;
            local v250 = table.create(#v232);
            if v245 > 0 then
                for _, v252 in l_tryOnItems_1 do
                    if (not l_FFlagAXMISEnableMultiShopping_0 or not v252.lookId) and v252.itemSubType and v244[v252.itemSubType] == v252.itemType then
                        table.insert(v250, {
                            id = tostring(v252.itemId), 
                            type = tostring(v252.itemType), 
                            encryptedAdTrackingData = nil
                        });
                    end;
                end;
            end;
            for _, v254 in v232 do
                if not l_tryOnItems_1[l_getTryOnItemReducerKey_0(v254.id, v254.type)] then
                    table.insert(v250, v254);
                end;
            end;
            v226:setState({
                entries = v250
            });
        elseif not v20.List.equals(v226.state.entries, v232) then
            v226:setState({
                entries = v232
            });
        end;
        return;
    end;
end;
v96.didMount = function(v255) --[[ Line: 1087 ]] --[[ Name: didMount ]]
    v255:updateItems(true);
end;
v96.didUpdate = function(v256, v257, v258) --[[ Line: 1092 ]] --[[ Name: didUpdate ]]
    -- upvalues: v39 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v20 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_AvatarScreen_0 (copy), v86 (copy)
    local v259 = v256.props.searchUuid ~= v257.searchUuid;
    if v256.props.fromSearch then
        v259 = v259 or v257.categoryInfo ~= v256.props.categoryInfo or not v256.props.searchInCatalog;
    end;
    if v259 and v256.state.restorePreviousChildFocus ~= false then
        v256:setState({
            restorePreviousChildFocus = false
        });
    end;
    if v259 or v256.state.numItemsPerRow ~= v258.numItemsPerRow then
        v256.requestImpressionsSignal:fire();
    end;
    local v260 = false;
    if v256.props.dataStatus == v39.Done then
        v260 = v257.dataStatus ~= v39.Done;
    end;
    local v261 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v256.props.hasProcessedMarketplaceFetcher else nil;
    local v262 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v256.props.shouldPageUseWidgetOnly else false;
    local v263 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v262 and v261 else nil;
    local l_searchInCatalog_3 = v256.props.searchInCatalog;
    local v265 = l_searchInCatalog_3 and l_searchInCatalog_3.items or nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 and v263 and not v265 then
        v265 = {};
    end;
    if l_FFlagAXFixCatalogRefreshRendering_0 then
        local v266 = false;
        if v256.props.externalNavigationRequestParams and v257.externalNavigationRequestParams then
            v266 = v256.props.externalNavigationRequestParams.wasItemEquipped ~= v257.externalNavigationRequestParams.wasItemEquipped;
        elseif v256.props.externalNavigationRequestParams ~= v257.externalNavigationRequestParams then
            v266 = true;
        end;
        local v267 = v256.props.itemInfos ~= v257.itemInfos;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v268 = not v20.List.equals(v256.state.entries, v265);
            local v269 = v257.hasProcessedMarketplaceFetcher ~= v256.props.hasProcessedMarketplaceFetcher;
            local v270 = v259 or v260;
            if v266 or v267 or v270 and v268 or v269 and v268 then
                v256:updateItems(v259);
            end;
        elseif v266 or v267 or (v259 or v260) and not v20.List.equals(v256.state.entries, v265) then
            v256:updateItems(v259);
        end;
    else
        v256:updateItems(v259);
    end;
    if v256.props.dataStatus == v39.Done and v257.dataStatus == v39.Fetching and v256.retryLoadMore then
        v256.retryLoadMore = false;
        v256.loadMore();
    end;
    if v256.shouldScrollBackToTopOfList({
        searchChanged = v259, 
        oldSortsAndFilter = v257.sortAndFilters, 
        newSortsAndFilter = v256.props.sortAndFilters
    }) and v256.widgetFlatListRef and v256.widgetFlatListRef.current then
        v256.widgetFlatListRef.current:scrollToOffset({
            offset = 0, 
            animated = false
        });
    end;
    local v271 = v256.props.dataStatus == v39.Failed;
    local l_entries_1 = v256.state.entries;
    local v273 = l_entries_1 and #l_entries_1 ~= 0;
    v271 = v271 and not v273;
    if l_FFlagAXCatalogCategoriesSDUI_0 and v256.props.isFetchingMarketplaceError then
        v271 = v256.props.isFetchingMarketplaceError;
    elseif l_FFlagAXMoveAllTabToWidgetOnly_0 and v256.props.shouldPageUseWidgetOnly then
        v271 = v256.props.isFetchingMarketplaceError;
    end;
    if v271 ~= v258.showFailedState and v271 ~= v256.state.showFailedState then
        v256:setState({
            showFailedState = v271
        });
        if v271 then
            local l_catalogAnalytics_1 = v256.props.catalogAnalytics;
            if v256.props.navigation.state.routeName == l_AvatarScreen_0.CatalogSearch then
                l_catalogAnalytics_1.sendAXCounter(v86.Counter.Errors.NoInternetConnectionErrorSearchView);
                return;
            else
                l_catalogAnalytics_1.sendAXCounter(v86.Counter.Errors.NoInternetConnectionErrorCatalogView);
            end;
        end;
    end;
end;
v96 = v59((v45((v7.connect(function(v275, v276) --[[ Line: 1244 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v47 (copy), v64 (copy), v20 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), l_PerformFetch_0 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), v61 (copy), l_AvatarScreen_0 (copy), v62 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v112 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy)
    local l_searchUuid_1 = v276.searchUuid;
    local l_categoryInfo_0 = v276.categoryInfo;
    local v279 = v47.getSearchKey(v275, l_searchUuid_1);
    local v280 = false;
    local v281 = nil;
    local l_fromSearch_0 = v276.fromSearch;
    if l_searchUuid_1 and l_fromSearch_0 then
        local v283 = v275.SearchesParameters[l_searchUuid_1];
        local v284 = v64.getQueryStringForSearchWidgets(v283);
        local v285 = v275.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v284];
        if v285 then
            local l_Details_0 = v285.Details;
            local v287 = false;
            if typeof(l_Details_0) == "table" then
                v287 = next(l_Details_0) ~= nil;
            end;
            v280 = v287 and (v20.isEmpty(l_categoryInfo_0) or l_categoryInfo_0.ShowWidgets) or false;
        end;
        local v288 = nil;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v289 = l_getAXMarketplaceWidgetStore_0(false).getDebouncedScreenSize(false);
            v288 = v64.getFetchWidgetInfoFetchKey(v284, nil, v289);
        else
            v288 = v64.getFetchWidgetInfoFetchKey(v284);
        end;
        v281 = l_PerformFetch_0.GetStatus(v275, v288);
    elseif l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and l_categoryInfo_0 and v276.shouldPageUseWidgetOnly then
        local l_WidgetContext_0 = l_categoryInfo_0.WidgetContext;
        if l_WidgetContext_0 then
            local v291 = v275.AvatarExperience.Common.Widgets.ContextWidgetInfo[l_WidgetContext_0];
            if v291 then
                local v292 = false;
                if typeof(v291.Details) == "table" then
                    v292 = next(v291.Details) ~= nil;
                end;
                v280 = v292;
            end;
        end;
    end;
    local v293 = v275.AvatarExperience.ExternalNavigationRequest.params or {};
    return {
        fullView = v61(v275, l_AvatarScreen_0.Catalog), 
        searchParameters = v275.SearchesParameters[v276.searchUuid], 
        sortAndFilters = v275.AvatarExperience.Catalog.SortAndFilters, 
        filterCount = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v62(v275) else nil, 
        selectedCategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v275.AvatarExperience.Catalog.Categories.categoryId else nil, 
        selectedSubcategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v275.AvatarExperience.Catalog.Categories.subcategoryId else nil, 
        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v275.AvatarExperience.Catalog.SearchCategories then v275.AvatarExperience.Catalog.SearchCategories.categoryId else nil, 
        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v275.AvatarExperience.Catalog.SearchCategories then v275.AvatarExperience.Catalog.SearchCategories.subcategoryId else nil, 
        searchInCatalog = v275.Search.SearchesInCatalog[v276.searchUuid], 
        dataStatus = l_PerformFetch_0.GetStatus(v275, v279), 
        tryOnItems = v275.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        tryOnLookId = if v112 then v275.AvatarExperience.AvatarScene.OutfitTryOn.LookId else nil, 
        focusedWidget = v275.AvatarExperience.Catalog.ResultsList[v276.searchUuid] and v275.AvatarExperience.Catalog.ResultsList[v276.searchUuid].focusedWidget or {}, 
        hideTopBar = v275.AvatarExperience.Catalog.ResultsList[v276.searchUuid] and v275.AvatarExperience.Catalog.ResultsList[v276.searchUuid].hideTopBar or false, 
        widgetRequestId = v275.AvatarExperience.Common.Widgets.WidgetInfo.RequestId, 
        widgetDataStatus = v281, 
        hasWidgets = v280, 
        externalNavigationRequestParams = v293, 
        itemInfos = if not l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then {
            AssetInfos = v275.AvatarExperience.Common.AssetInfos, 
            BundleInfos = v275.AvatarExperience.Common.BundleInfos
        } else nil, 
        analyticsMetadata = v275.AvatarExperience.AnalyticsMetadata
    };
end, function(v294) --[[ Line: 1336 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v57 (copy), v54 (copy), v81 (copy), v82 (copy), v87 (copy), v34 (copy), v55 (copy), v56 (copy), v83 (copy), v10 (copy), v84 (copy)
    local function v300(_, v296, v297, v298, v299) --[[ Line: 1337 ]]
        -- upvalues: v294 (copy), v57 (ref), v54 (ref)
        return v294(v57(v54({
            searchKeyword = v296, 
            searchUuid = v297, 
            categoryInfo = v298
        }, v299)));
    end;
    local function v309(v301, v302, v303, v304, v305, v306, v307, v308) --[[ Line: 1344 ]]
        -- upvalues: v294 (copy), v81 (ref)
        return v294(v81(v301, v302, v303, v304, v305, v306, v307, v308));
    end;
    v309 = function(v310, v311, v312) --[[ Line: 1368 ]]
        -- upvalues: v294 (copy), v81 (ref)
        return v294(v81(v310, v311, v312));
    end;
    local function v314(v313) --[[ Line: 1372 ]]
        -- upvalues: v294 (copy), v82 (ref)
        return v294(v82(v313));
    end;
    local v316 = v87() and function(v315) --[[ Line: 1376 ]]
        -- upvalues: v294 (copy), v34 (ref)
        return v294(v34.StartTracking(v315));
    end or nil;
    local function v321(v317, v318, v319, v320) --[[ Line: 1381 ]]
        -- upvalues: v294 (copy), v55 (ref)
        return v294(v55(v317, v318, v319, v320));
    end;
    local function v331(v322, v323, v324, v325, v326, v327, v328, v329, v330) --[[ Line: 1385 ]]
        -- upvalues: v294 (copy), v56 (ref), v83 (ref)
        v294(v56(v322, v323, v324, v325, v326, v327, v328, v329, v330, true));
        v294(v83({
            itemId = v326, 
            itemType = v324, 
            wasItemEquipped = true, 
            fetchItemFailed = false
        }));
    end;
    local function v334(v332, v333) --[[ Line: 1418 ]]
        -- upvalues: v294 (copy), v10 (ref), v83 (ref), v84 (ref)
        v294(v10({
            toastMessage = "Feature.Avatar.Message.DeepLinkEquipFailed"
        }));
        v294(v83({
            itemId = v332, 
            itemType = v333, 
            wasItemEquipped = false, 
            fetchItemFailed = true
        }));
        v294(v84());
    end;
    return {
        dispatchLoadMore = v300, 
        dispatchSetResultsListFocusedWidget = v309, 
        dispatchClearResultsListFocusedWidget = v314, 
        dispatchCatalogTilesLatencyStartTracker = v316, 
        fetchItemData = v321, 
        handleDeepLinkEquipError = v334, 
        equipCatalogDeepLinkItem = v331
    };
end)(v96)))));
v96 = v22((l_withNavigation_0((l_RoactServices_0.connect({
    axAnalytics = v51, 
    catalogAnalytics = v52, 
    networking = v9
})(v96)))));
local function v338(v335) --[[ Line: 1457 ]] --[[ Name: selectItemInfos ]]
    local l_AssetInfos_0 = v335.AvatarExperience.Common.AssetInfos;
    local l_BundleInfos_0 = v335.AvatarExperience.Common.BundleInfos;
    return {
        AssetInfos = l_AssetInfos_0, 
        BundleInfos = l_BundleInfos_0
    };
end;
return function(v339) --[[ Line: 1504 ]] --[[ Name: ResultsListWrapper ]]
    -- upvalues: l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_useFocusGuiObject_0 (copy), l_useSelector_0 (copy), v6 (copy), v82 (copy), v94 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v28 (copy), l_useSignalState_0 (copy), v103 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v29 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v72 (copy), l_getUseSelectorDeepEquals_0 (copy), v62 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy), v338 (copy), v43 (copy), v96 (ref)
    local v340 = table.clone(v339);
    if l_FFlagAXMigrateMainNavigationInputBindings_0 then
        local v341 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v341 = function(v342) --[[ Line: 1511 ]]
                return v342.AvatarExperience.Catalog.ResultsList;
            end;
        end;
        local v343 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v343 = l_useDispatch_0();
        end;
        local v344 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.useFocusController();
        local v345 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v346 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            local v347 = l_useSelector_0(v341);
            local v348 = v347[v339.searchUuid] and v347[v339.searchUuid].focusedWidget;
            v346 = if v348 then v348.active else false;
        end;
        local l_v345_0 = v345 --[[ copy: 5 -> 11 ]];
        local l_v344_0 = v344 --[[ copy: 4 -> 12 ]];
        do
            local l_v343_0, l_v346_0 = v343, v346;
            local v354 = v6.useCallback(function(v353) --[[ Line: 1530 ]]
                -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_v346_0 (ref), l_v343_0 (ref), v82 (ref), v339 (copy), l_v345_0 (copy), l_v344_0 (copy)
                v353.cancelled = true;
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if l_v346_0 then
                        l_v343_0(v82(v339.searchUuid));
                        if type(v339.onCloseFocusedWidget) == "function" then
                            v339.onCloseFocusedWidget();
                            return;
                        end;
                    elseif l_v345_0 and v339.NextSelectionUp and v339.NextSelectionUp.current then
                        l_v345_0(v339.NextSelectionUp.current);
                        return;
                    end;
                else
                    l_v344_0.moveFocusTo(v339.NextSelectionUp);
                end;
            end, {
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v345 else v344, 
                v339.NextSelectionUp, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v346_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v339.searchUuid else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v343_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v339.onCloseFocusedWidget else nil
            });
            v340.focusNavigationBindingsRef = v94({
                onNavigateBack = v354
            }, v339.frameRef);
        end;
    end;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v355 = l_useUnifiedEventImpressionsReporter_0();
        local l_v355_0 = v355 --[[ copy: 2 -> 10 ]];
        v340.tagBasedImpressionsDetectorExtensions = v6.useMemo(function() --[[ Line: 1562 ]]
            -- upvalues: l_v355_0 (copy)
            return {
                l_v355_0
            };
        end, {
            v355
        });
    end;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v357 = v28.getCatalogSelectionStore();
        local v358 = l_useSignalState_0(v357.selectedCategoryId);
        local v359 = l_useSignalState_0(v357.selectedSubcategoryId);
        v340.selectedCategoryId = v358;
        v340.selectedSubcategoryId = v359;
        local v360 = v28.getCatalogSearchSelectionStore();
        local v361 = l_useSignalState_0(v360.selectedCategoryId);
        local v362 = l_useSignalState_0(v360.selectedSubcategoryId);
        v340.selectedSearchCategoryId = v361;
        v340.selectedSearchSubcategoryId = v362;
        local v363 = l_useSignalState_0(v357.selectedCategory);
        v340.selectedCategory = v363;
        local v364 = l_useSignalState_0(v360.selectedCategory);
        v340.selectedSearchCategory = v364;
        if v103 then
            v340.selectedSearchSubcategory = l_useSignalState_0(v360.selectedSubcategory);
        end;
        v340.categoryInfo = if v339.fromSearch then v364 else v363;
    end;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v365 = l_useAnimatedVisibility_0();
        v340.visibilityRatioBinding = if v365 then v29.useSignalBinding(v365.animatedMenusStore.getVisibilityRatio) else v6.createBinding(1);
    end;
    if l_FFlagAXCatalogCategoriesSDUI_0 or l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v366 = v72.getFetchMarketplaceStore(false);
        local v367 = l_useSignalState_0(v366.getFetchingMarketplaceError);
        local v368 = if l_FFlagAXCatalogCategoriesSDUI_0 then l_useSignalState_0(v366.getCatalogCategoriesError) else nil;
        v340.isFetchingMarketplaceError = v367;
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            v340.isFetchingMarketplaceError = v367 or v368;
        end;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            v340.hasProcessedMarketplaceFetcher = l_useSignalState_0(v366.getFetchingMarketplaceProcessed);
            local v370 = v6.useCallback(function(v369) --[[ Line: 1630 ]]
                -- upvalues: v339 (copy)
                return v369.SearchesParameters[v339.searchUuid];
            end, {
                v339.searchUuid
            });
            local v371 = l_useSelector_0(v370, l_getUseSelectorDeepEquals_0());
            local v372 = l_useSelector_0(v62);
            v340.shouldPageUseWidgetOnly = l_getShouldPageUseWidgetOnlyFetcher_0(v340.categoryInfo, v372, v371 and v371.searchKeyword);
        end;
    end;
    if l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then
        v340.itemInfos = l_useSelector_0(v338, v43.shallowEqual);
    end;
    return v6.createElement(v96, v340);
end;