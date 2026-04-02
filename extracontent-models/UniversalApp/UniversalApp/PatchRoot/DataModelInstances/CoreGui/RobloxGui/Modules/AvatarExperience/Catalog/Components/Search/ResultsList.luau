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
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v23.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_TTIPerformanceManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).TTIPerformanceManager;
local l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 = v23.FFlagAXFixWidgetOnlyTabNoItemsFound;
local l_FFlagAXShowCategoriesWhenNetworkFails_0 = v23.FFlagAXShowCategoriesWhenNetworkFails;
local v114 = game:DefineFastFlag("AXSkipTryOnHoistForLooks", false);
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
    tryOnLookId = if v114 then v17.optional(v17.string) else nil, 
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
v96.init = function(v115) --[[ Line: 261 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_Signal_0 (copy), v39 (copy), v15 (copy), v85 (copy), v21 (copy), v66 (copy), v87 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v86 (copy)
    v115.state = {
        restorePreviousChildFocus = true, 
        numItemsPerRow = 0, 
        navBarSizeY = 0, 
        showFailedState = false
    };
    v115.lastYPosition = 0;
    v115.scrollingFrameRef = v115.props.scrollingFrameRef or v5.createRef();
    v115.navBarRef = v5.createRef();
    v115.topPanelRef = v5.createRef();
    v115.gridRef = v5.createRef();
    v115.pillBarRef = v5.createRef();
    v115.emptyStateRef = v5.createRef();
    v115.widgetFlatListRef = v5.createRef();
    local v116 = nil;
    local v117 = nil;
    v115.topPanelHeightBinding = v116;
    v115.updateTopPanelHeightBinding = v117;
    v116, v117 = v5.createBinding(0);
    v115.topPanelHeightBinding = v116;
    v115.updateTopPanelHeightBinding = v117;
    v115.impressionsReported = {};
    v115.itemDetailsPeekViewRefs = v115.props.itemDetailsPeekViewRefs;
    v115.onNumItemsPerRowChanged = function(v118) --[[ Line: 285 ]]
        -- upvalues: v115 (copy)
        v115:setState({
            numItemsPerRow = v118
        });
    end;
    v115.onNavBarSizeChanged = function(v119) --[[ Line: 291 ]]
        -- upvalues: v115 (copy)
        if v119.Y ~= v115.state.navBarSizeY then
            v115:setState({
                navBarSizeY = v119.Y
            });
        end;
    end;
    v115.requestImpressionsSignal = l_Signal_0.new();
    v115.onItemsListScroll = function(v120) --[[ Line: 301 ]]
        -- upvalues: v115 (copy)
        v115.requestImpressionsSignal:fire();
        local v121 = v115.props.adaptiveScrolling or {};
        if v121.onCanvasYChanged then
            v121.onCanvasYChanged(v120);
        end;
    end;
    v115.loadMore = function() --[[ Line: 310 ]]
        -- upvalues: v115 (copy), v39 (ref), v15 (ref), v85 (ref), v21 (ref)
        if v115.props.dataStatus == v39.Fetching then
            v115.retryLoadMore = true;
            return v15.resolve("Currently fetching");
        else
            local l_catalogAnalytics_0 = v115.props.catalogAnalytics;
            local l_searchUuid_0 = v115.props.searchUuid;
            local l_searchInCatalog_0 = v115.props.searchInCatalog;
            local l_searchParameters_0 = v115.props.searchParameters;
            local l_dispatchLoadMore_0 = v115.props.dispatchLoadMore;
            if v85 and not l_searchInCatalog_0 then
                l_searchInCatalog_0 = {};
                v21(string.format("ResultsList: searchInCatalog is nil; searchUuid: %s", (tostring(l_searchUuid_0))));
            end;
            local v127 = l_searchParameters_0 and l_searchParameters_0.categoryInfo or nil;
            return l_dispatchLoadMore_0(l_catalogAnalytics_0, l_searchInCatalog_0.keyword, l_searchUuid_0, v127, v115.props.networking);
        end;
    end;
    v115.onFocusGained = function() --[[ Line: 342 ]]
        -- upvalues: v115 (copy)
        v115:setState({
            restorePreviousChildFocus = true
        });
    end;
    v115.scrollBackToTop = function() --[[ Line: 348 ]]
        -- upvalues: v115 (copy)
        local l_current_0 = v115.props.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
    v115.setFocusedWidget = function(v129) --[[ Line: 355 ]]
        -- upvalues: v115 (copy)
        local v130 = if v129 and v129.template then v129.template.title else nil;
        local v131 = if v129 and v129.template then v129.template.localizedTitle else "";
        local v132 = if v129 and v129.template then v129.template.localizedDescription else "";
        local v133 = if v129 and v129.template then v129.template.description else nil;
        local v134 = if v129 and v129.template then v129.template.tooltip else nil;
        local v135 = if v129 and v129.template then v129.template.localizedTooltip else "";
        local v136 = nil;
        v136 = {
            title = v130, 
            localizedTitle = v131, 
            description = v133, 
            localizedDescription = v132, 
            tooltip = v134, 
            localizedTooltip = v135
        };
        v115.props.dispatchSetResultsListFocusedWidget(v115.props.searchUuid, v129.id, v136);
    end;
    v115.clearFocusedWidget = function() --[[ Line: 380 ]]
        -- upvalues: v115 (copy)
        v115.props.dispatchClearResultsListFocusedWidget(v115.props.searchUuid);
    end;
    v115.shouldScrollBackToTopOfList = function(v137) --[[ Line: 384 ]]
        -- upvalues: v66 (ref)
        local l_searchChanged_0 = v137.searchChanged;
        local l_oldSortsAndFilter_0 = v137.oldSortsAndFilter;
        local l_newSortsAndFilter_0 = v137.newSortsAndFilter;
        return l_searchChanged_0 or not v66.areSortAndFiltersEqual(l_oldSortsAndFilter_0, l_newSortsAndFilter_0);
    end;
    if v87() then
        if l_FFlagAXEnableTTIViaModule_0 then
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
            else
                l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Tiles);
                l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Thumbnails);
                l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Tiles);
                l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Thumbnails);
            end;
        end;
        v115.props.dispatchCatalogTilesLatencyStartTracker(v115.props.searchUuid);
    end;
end;
v96.getNextSelectionRight = function(v141, v142, v143) --[[ Line: 421 ]] --[[ Name: getNextSelectionRight ]]
    -- upvalues: l_AvatarScreen_0 (copy), v20 (copy)
    local l_NextSelectionRight_0 = v141.props.NextSelectionRight;
    if v142 == l_AvatarScreen_0.ItemDetails and v143 then
        return v141.itemDetailsPeekViewRefs[v143];
    elseif v142 == l_AvatarScreen_0.LookDetails then
        return v141.props.namedRefs[l_AvatarScreen_0.LookDetails];
    else
        if v141.props.tryOnItems and not v20.isEmpty(v141.props.tryOnItems) and v142 ~= l_AvatarScreen_0.SortAndFilters and v141.props.multiTryOnBottomBarRef and v141.props.multiTryOnBottomBarRef:getValue() ~= nil then
            l_NextSelectionRight_0 = v141.props.multiTryOnBottomBarRef;
        end;
        return l_NextSelectionRight_0;
    end;
end;
v96.renderResultsList = function(v145, v146, v147) --[[ Line: 443 ]] --[[ Name: renderResultsList ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v39 (copy), v53 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), l_AvatarScreen_0 (copy), v50 (copy), v88 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v64 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_CatalogCategories_0 (copy), l_FFlagAXHandleLooksWidgetCategories_0 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_withLocalization_0 (copy), l_ImpressionEnums_0 (copy), v5 (copy), v92 (copy), v80 (copy), v87 (copy), l_AvatarExperienceScreenSizeImpressionsDetector_0 (copy), v71 (copy), l_IXPService_0 (copy), l_CollectionService_0 (copy), v103 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v8 (copy), v58 (copy), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (copy), v68 (copy), v67 (copy), l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_EmptyState_0 (copy), v60 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), v70 (copy), l_FitTextLabel_0 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local l_searchInCatalog_1 = v145.props.searchInCatalog;
    local l_dataStatus_0 = v145.props.dataStatus;
    local v150 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v145.props.shouldPageUseWidgetOnly else nil;
    local v151 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v150 and v145.props.hasProcessedMarketplaceFetcher else nil;
    local l_key_0 = v145.props.navigation.state.key;
    local l_avatarRoute_0 = v145.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local l_key_1 = l_avatarRoute_0.current.key;
    local l_entries_0 = v145.state.entries;
    local v157 = l_entries_0 and #l_entries_0 ~= 0;
    local l_hasWidgets_0 = v145.props.hasWidgets;
    local l_widgetDataStatus_0 = v145.props.widgetDataStatus;
    local v160 = false;
    if l_dataStatus_0 == v39.Done then
        v160 = not l_widgetDataStatus_0 or l_widgetDataStatus_0 == v39.Done;
    end;
    local v161 = l_entries_0 and #l_entries_0 or v53.PageFetchLimit;
    local v162 = not v160 or v157 or v145.props.hasWidgets or l_FFlagAXMoveAllTabToWidgetOnly_0 and v151 and v145.props.hasProcessedMarketplaceFetcher;
    local v163 = nil;
    if l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 then
        if v151 then
            v160 = v145.props.hasProcessedMarketplaceFetcher;
        end;
        v163 = v151 and v145.props.hasProcessedMarketplaceFetcher and l_hasWidgets_0;
        v162 = not v160 or v157 or v145.props.hasWidgets or v163;
    end;
    local v164 = l_searchInCatalog_1 and l_searchInCatalog_1.hasMoreEntries or nil;
    local v165 = v157 and v164;
    local v166 = v157 and not v165 or l_FFlagAXMoveAllTabToWidgetOnly_0 and v151 or l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and v163;
    local l_Font_0 = v146.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v169 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local l_Theme_0 = v146.Theme;
    local l_Color_0 = l_Theme_0.TextMuted.Color;
    local l_Transparency_0 = l_Theme_0.TextMuted.Transparency;
    local v173 = false;
    if l_name_0 ~= l_AvatarScreen_0.ItemDetails then
        v173 = v147 ~= nil;
    end;
    local v174 = nil;
    local v175 = v50.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v176 = not v162 and not l_hasWidgets_0;
    if v88 and (not l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 or not v151) then
        v176 = v176 and l_entries_0 and #l_entries_0 == 0;
    end;
    local v177 = nil;
    local v178 = nil;
    local v179 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v178 = v145.props.selectedCategory;
        v179 = v145.props.selectedSearchCategory;
    else
        v178 = v64.getCategoryId(v145.props.selectedCategoryId);
        v179 = v64.getCategoryId(v145.props.selectedSearchCategoryId);
    end;
    local v180 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v178.Id == l_CatalogCategories_0.Avatars:rawValue() else v178.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog;
    local v181 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v179.Id == l_CatalogCategories_0.Avatars:rawValue() else v179.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch;
    local v182 = nil;
    local v183 = nil;
    if l_FFlagAXHandleLooksWidgetCategories_0 then
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v178.LooksWidgetContextForOrganicContent ~= nil then
                    v182 = true;
                end;
            elseif v178.ShowLooksAsOrganicContent ~= nil then
                v182 = true;
            end;
        end;
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v179.LooksWidgetContextForOrganicContent ~= nil then
                    v183 = true;
                end;
            elseif v179.ShowLooksAsOrganicContent ~= nil then
                v183 = true;
            end;
        end;
    end;
    if (l_FFlagAXHandleLooksWidgetCategories_0 and (v182 or v183) or not l_FFlagAXHandleLooksWidgetCategories_0 and (v180 or v181)) and l_entries_0 and #l_entries_0 == 0 and v164 then
        v177 = true;
        v176 = false;
        v161 = 0;
    end;
    local l_active_0 = v145.props.focusedWidget.active;
    local l_title_0 = v145.props.focusedWidget.title;
    local l_id_0 = v145.props.focusedWidget.id;
    local v187 = if l_active_0 then l_title_0 else nil;
    local v188 = {};
    v166 = v166 or l_active_0;
    return l_withLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound", 
        focusedWidgetTitle = if v187 ~= "" then v187 else nil, 
        emptyText = "Feature.DisplayName.ErrorMessage.SomethingWentWrong"
    })(function(v189) --[[ Line: 591 ]]
        -- upvalues: v145 (copy), l_name_0 (copy), l_key_1 (copy), l_ImpressionEnums_0 (ref), v174 (ref), v5 (ref), v92 (ref), l_key_0 (copy), v80 (ref), v175 (copy), v87 (ref), l_AvatarExperienceScreenSizeImpressionsDetector_0 (ref), v71 (ref), v188 (copy), l_IXPService_0 (ref), l_CollectionService_0 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), v64 (ref), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_CatalogCategories_0 (ref), l_FFlagAXHandleLooksWidgetCategories_0 (ref), v103 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), l_FFlagAXHideMenuOnScroll_0 (ref), l_Focusable_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v173 (copy), v8 (ref), v147 (copy), v58 (ref), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (ref), v68 (ref), v67 (ref), v157 (copy), l_FFlagAXShowCategoriesWhenNetworkFails_0 (ref), l_EmptyState_0 (ref), v60 (ref), l_entries_0 (copy), v162 (ref), v165 (copy), v166 (ref), l_active_0 (copy), l_id_0 (copy), v161 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v70 (ref), v176 (ref), l_FitTextLabel_0 (ref), v146 (copy), v169 (copy), l_Color_0 (copy), l_Transparency_0 (copy), l_Font_1 (copy), v177 (ref), l_TagBasedImpressionsDetector_0 (ref)
        local v190 = v145:getNextSelectionRight(l_name_0, l_key_1);
        local v191 = if v145.props.fromSearch then l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH else l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE;
        v174 = v5.createElement(v92, {
            parentRef = v145.gridRef, 
            pageFilter = function() --[[ Line: 598 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v145.requestImpressionsSignal, 
            eventContext = v80(), 
            eventName = "marketplaceOrganicFELog", 
            requestId = v145.props.widgetRequestId, 
            impressionsTag = v175, 
            impressionsSchema = "defaultItem", 
            searchUuid = if v87() then v145.props.searchUuid else nil, 
            surface = v191, 
            analyticsMetadata = v145.props.analyticsMetadata
        });
        local v200 = v5.createElement(l_AvatarExperienceScreenSizeImpressionsDetector_0, {
            parentRef = v145.gridRef, 
            pageFilter = function() --[[ Line: 614 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v145.requestImpressionsSignal, 
            filterImpressionFunc = function(v192) --[[ Line: 618 ]] --[[ Name: filterImpressionFunc ]]
                -- upvalues: v71 (ref), v188 (ref)
                local l_v192_Attribute_0 = v192:GetAttribute(v71.WidgetExposureMetadata.AttributeKey);
                return l_v192_Attribute_0 and not v188[l_v192_Attribute_0];
            end, 
            onImpressionsDetected = function(v194) --[[ Line: 622 ]] --[[ Name: onImpressionsDetected ]]
                -- upvalues: v71 (ref), v188 (ref), l_IXPService_0 (ref), v145 (ref)
                for _, v196 in v194 do
                    local l_v196_Attribute_0 = v196:GetAttribute(v71.WidgetExposureMetadata.AttributeKey);
                    v188[l_v196_Attribute_0] = true;
                    l_IXPService_0:LogUserLayerExposure(l_v196_Attribute_0);
                    local l_impressionsReported_0 = v145.impressionsReported;
                    if not l_impressionsReported_0[v196.Name] then
                        v145.props.catalogAnalytics.widgetInteractionV2({}, v71.ActionType.IMPRESSION);
                        l_impressionsReported_0[v196.Name] = true;
                    end;
                end;
            end, 
            collectObjectsFunc = function(_) --[[ Line: 637 ]] --[[ Name: collectObjectsFunc ]]
                -- upvalues: l_CollectionService_0 (ref), v71 (ref)
                return l_CollectionService_0:GetTagged(v71.WidgetExposureMetadata.TagName);
            end
        });
        local l_frameRef_0 = v145.props.frameRef;
        local l_backToTopSignal_0 = v145.props.backToTopSignal;
        local v203 = v145.props.adaptiveScrolling or {};
        local v204 = 0;
        if v145.props.multiTryOnBottomBarRef then
            local v205 = v145.props.multiTryOnBottomBarRef:getValue();
            v204 = if v205 then v205.AbsoluteSize.Y else 0;
        end;
        local l_routeName_0 = v145.props.navigation.state.routeName;
        local v207 = v145.props.namedRefs[l_routeName_0 .. "TopPanel"];
        local v208 = nil;
        v208 = if l_FFlagAXCatalogCategoriesStore_0 then v145.props.selectedSearchCategory else v64.getCategoryId(v145.props.selectedSearchCategoryId);
        local v209 = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v208.Id == l_CatalogCategories_0.Avatars:rawValue() else v208.NavigationKey == l_CatalogCategories_0.Avatars;
        if l_FFlagAXHandleLooksWidgetCategories_0 then
            if v103 then
                local v210 = if v145.props.selectedSearchSubcategory then v145.props.selectedSearchSubcategory else v208;
                v209 = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v210.LooksWidgetContextForOrganicContent ~= nil else v210.ShowLooksAsOrganicContent ~= nil;
            else
                v209 = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v208.LooksWidgetContextForOrganicContent ~= nil else v208.ShowLooksAsOrganicContent ~= nil;
            end;
        end;
        local v213 = if l_FFlagAXHideMenuOnScroll_0 and v145.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v145.props.visibilityRatioBinding, 
            height = v145.topPanelHeightBinding
        }):map(function(v211) --[[ Line: 694 ]]
            local v212 = math.floor((1 - v211.visibility) * -v211.height);
            return UDim2.fromOffset(0, v212);
        end) else nil;
        local v216 = if l_FFlagAXHideMenuOnScroll_0 and v145.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v145.props.visibilityRatioBinding, 
            height = v145.topPanelHeightBinding
        }):map(function(v214) --[[ Line: 704 ]]
            local v215 = v214.height * v214.visibility;
            return UDim2.new(1, 0, 1, -v215);
        end) else nil;
        local v219 = if l_FFlagAXHideMenuOnScroll_0 and v145.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v145.props.visibilityRatioBinding, 
            height = v145.topPanelHeightBinding
        }):map(function(v217) --[[ Line: 714 ]]
            local v218 = v217.height * v217.visibility;
            return UDim2.fromOffset(0, v218);
        end) else nil;
        return v5.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ClipsDescendants = true, 
            LayoutOrder = v145.props.layoutOrder, 
            [v5.Ref] = l_frameRef_0, 
            defaultChild = v145.topPanelRef, 
            NextSelectionUp = v145.props.NextSelectionUp, 
            restorePreviousChildFocus = v145.state.restorePreviousChildFocus, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v173 and {
                NavUp = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 733 ]]
                    -- upvalues: v147 (ref), v145 (ref)
                    v147.moveFocusTo(v145.props.NextSelectionUp);
                end)
            } or nil
        }, {
            BackToTopSignal = if l_backToTopSignal_0 then v5.createElement(v58, {
                signal = l_backToTopSignal_0, 
                callback = v145.scrollBackToTop
            }) else nil, 
            ScrollPanel = v5.createElement(l_FFlagAXMigrateMainNavigationInputBindings_0 and "Frame" or l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ClipsDescendants = true, 
                [v5.Ref] = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v145.props.focusNavigationBindingsRef else nil
            }, {
                TopPanel = v5.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ZIndex = 2, 
                    ref = v207, 
                    Position = if l_FFlagAXHideMenuOnScroll_0 then v213 else nil
                }, v5.createElement(if l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 then v68 else v67, {
                    fromSearch = v145.props.fromSearch, 
                    catalogAnalytics = v145.props.catalogAnalytics, 
                    axAnalytics = v145.props.axAnalytics, 
                    searchUuid = v145.props.searchUuid, 
                    searchInCatalog = v145.props.searchInCatalog, 
                    hideTopBar = v145.props.hideTopBar, 
                    focusedWidget = v145.props.focusedWidget, 
                    showCloseIcon = v145.props.showCloseIcon, 
                    restorePreviousChildFocus = v145.state.restorePreviousChildFocus, 
                    topPanelRef = v145.topPanelRef, 
                    gridRef = v145.gridRef, 
                    hasEntries = v157, 
                    backToTopSignal = v145.props.backToTopSignal, 
                    onCategoryOrSubcategoryChange = v145.props.onCategoryOrSubcategoryChange, 
                    onCategoryOrSubcategoryChangeById = v145.props.onCategoryOrSubcategoryChangeById, 
                    updateHeightBinding = v145.updateTopPanelHeightBinding, 
                    onCloseFocusedWidget = v145.props.onCloseFocusedWidget, 
                    hidePillBar = v209
                })), 
                ListFrame = v5.createElement("Frame", {
                    Size = l_FFlagAXHideMenuOnScroll_0 and v216 or v145.topPanelHeightBinding:map(function(v220) --[[ Line: 796 ]]
                        return UDim2.new(1, 0, 1, -v220);
                    end), 
                    Position = l_FFlagAXHideMenuOnScroll_0 and v219 or v145.topPanelHeightBinding:map(function(v221) --[[ Line: 801 ]]
                        return UDim2.fromOffset(0, v221);
                    end), 
                    BackgroundTransparency = 1
                }, if l_FFlagAXShowCategoriesWhenNetworkFails_0 and v145.state.showFailedState then {
                    EmptyState = v5.createElement(l_EmptyState_0, {
                        onActivated = v145.props.onRetry, 
                        text = v189.emptyText, 
                        [v5.Ref] = v145.emptyStateRef
                    })
                } else {
                    WidgetList = v5.createElement(v60.WidgetList, {
                        entries = l_entries_0, 
                        fromSearch = v145.props.fromSearch, 
                        bottomBarHeight = v204, 
                        showingEntries = v162, 
                        searchUuid = v145.props.searchUuid, 
                        loadMore = v165 and v145.loadMore or nil, 
                        hasMoreRows = v165, 
                        shouldCreateEndOfScrollElement = v166, 
                        itemDetailsPeekViewRefs = v145.itemDetailsPeekViewRefs, 
                        gridRef = v145.gridRef, 
                        flatListRef = v145.widgetFlatListRef, 
                        onScroll = v145.onItemsListScroll, 
                        focusedWidget = if l_active_0 then l_id_0 else nil, 
                        onWidgetFocusAcquired = v145.setFocusedWidget, 
                        onWidgetFocusReleased = v145.clearFocusedWidget, 
                        requestImpressionsSignal = v145.requestImpressionsSignal, 
                        onNumItemsPerRowChanged = v145.onNumItemsPerRowChanged, 
                        NextSelectionRight = v190, 
                        NextSelectionUp = v145.topPanelRef, 
                        restorePreviousChildFocus = v145.state.restorePreviousChildFocus, 
                        onFocusGained = not v145.state.restorePreviousChildFocus and v145.onFocusGained or nil, 
                        numItemsExpected = v161, 
                        scrollingEnabled = if v203.scrollingEnabledBinding then v203.scrollingEnabledBinding:map(function(v222) --[[ Line: 840 ]]
                            return v222;
                        end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v203.scrollingEnabled, 
                        selectedCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedCategoryIndex, 
                        selectedSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedSubcategoryIndex, 
                        selectedSearchCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedSearchCategoryIndex, 
                        selectedSearchSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedSearchSubcategoryIndex, 
                        selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedCategoryId, 
                        selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedSubcategoryId, 
                        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedSearchCategoryId, 
                        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v145.props.selectedSearchSubcategoryId, 
                        listHeaderComponent = v5.createElement(v70), 
                        pillBarVisible = not v209
                    }), 
                    NoItemsFound = v176 and v5.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0, v146.Tokens.Global.Space_400), 
                        Text = v189.noItemsFound, 
                        TextSize = v169, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        Font = l_Font_1
                    }), 
                    AvatarsTabError = v177 and v5.createElement("Frame", {
                        LayoutOrder = v145.props.layoutOrder, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1
                    }, {
                        EmptyState = v5.createElement(l_EmptyState_0, {
                            onActivated = v145.loadMore, 
                            text = v189.emptyText, 
                            [v5.Ref] = v145.emptyStateRef
                        })
                    })
                })
            }), 
            ImpressionsReporter = v174, 
            WidgetImpressionsReporter = v200, 
            UnifiedImpressionsReporter = v5.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v145.gridRef, 
                pageFilter = function() --[[ Line: 906 ]] --[[ Name: pageFilter ]]
                    -- upvalues: l_key_0 (ref), l_key_1 (ref)
                    return l_key_0 == l_key_1;
                end, 
                requestImpressionsSignal = v145.requestImpressionsSignal, 
                extensions = v145.props.tagBasedImpressionsDetectorExtensions
            })
        });
    end);
end;
v96.render = function(v223) --[[ Line: 916 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v5 (copy), l_EmptyState_0 (copy), l_withStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy)
    local l_showFailedState_0 = v223.state.showFailedState;
    if not l_FFlagAXShowCategoriesWhenNetworkFails_0 and l_showFailedState_0 then
        return l_withLocalization_0({
            emptyText = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v225) --[[ Line: 924 ]]
            -- upvalues: v5 (ref), v223 (copy), l_EmptyState_0 (ref)
            return v5.createElement("Frame", {
                LayoutOrder = v223.props.layoutOrder, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                EmptyState = v5.createElement(l_EmptyState_0, {
                    onActivated = v223.props.onRetry, 
                    text = v225.emptyText, 
                    [v5.Ref] = v223.emptyStateRef
                })
            });
        end);
    else
        return l_withStyle_0(function(v226) --[[ Line: 940 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v223 (copy), v8 (ref)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                return v223:renderResultsList(v226);
            else
                return v8.withFocusController(function(v227) --[[ Line: 944 ]]
                    -- upvalues: v223 (ref), v226 (copy)
                    return v223:renderResultsList(v226, v227);
                end);
            end;
        end);
    end;
end;
v96.updateItems = function(v228, v229) --[[ Line: 957 ]] --[[ Name: updateItems ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v48 (copy), v49 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v5 (copy), v20 (copy), v114 (copy), v46 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_getTryOnItemReducerKey_0 (copy)
    local l_searchInCatalog_2 = v228.props.searchInCatalog;
    local v231 = l_searchInCatalog_2 and l_searchInCatalog_2.items or nil;
    local v232 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v228.props.shouldPageUseWidgetOnly else false;
    local v233 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v232 and v228.props.hasProcessedMarketplaceFetcher else nil;
    local v234 = nil;
    v234 = if l_FFlagAXMoveAllTabToWidgetOnly_0 and v233 then {} else v231;
    if v228.props.externalNavigationRequestParams then
        if v48.newValidEquipDeepLinkExists(v228.props.externalNavigationRequestParams) then
            local v235, v236 = v48.parseItemIdAndItemType(v228.props.externalNavigationRequestParams);
            local v237 = v49(v228.props.itemInfos, v235, v236);
            if v237 then
                local v238 = v48.parseItemSubType(v236, v237);
                v228.props.equipCatalogDeepLinkItem(v228.props.networking, v228.props.catalogAnalytics, v236, v238, v235, true, v228.props.avatarRoute, v228.props.navigation, v228.props.widgetAnalyticsInfo);
            elseif not v228.props.externalNavigationRequestParams.wasItemEquipped then
                local l_v235_0 = v235 --[[ copy: 7 -> 17 ]];
                local l_v236_0 = v236 --[[ copy: 8 -> 18 ]];
                v228.props.fetchItemData(v228.props.networking, v228.props.catalogAnalytics, v235, v236):catch(function() --[[ Line: 996 ]]
                    -- upvalues: v228 (copy), l_v235_0 (copy), l_v236_0 (copy), v48 (ref), v234 (ref)
                    v228.props.handleDeepLinkEquipError(l_v235_0, l_v236_0);
                    v48.removeDeepLinkEntries(v234);
                end);
            end;
        end;
        if v228.props.externalNavigationRequestParams.wasItemEquipped then
            local l_tryOnItems_0 = v228.props.tryOnItems;
            local v242 = if l_FFlagAXFixCatalogRefreshRendering_0 and v228.props.categoryInfo then v228.props.categoryInfo else nil;
            local v243 = v228.props.searchParameters and v228.props.searchParameters.categoryInfo or v242 or {};
            v48.addEquippedItemToCatalogEntries(v228.props.externalNavigationRequestParams, l_tryOnItems_0, v243, v234);
        end;
    end;
    if not v234 then
        v228:setState({
            entries = v5.None
        });
        return;
    else
        local l_tryOnItems_1 = v228.props.tryOnItems;
        if v229 and not v20.isEmpty(l_tryOnItems_1) and (not l_FFlagAXMoveAllTabToWidgetOnly_0 or not v233) and (not v114 or v228.props.tryOnLookId == nil) then
            local v245 = v228.props.searchParameters and v228.props.searchParameters.categoryInfo or {};
            local v246 = {};
            local v247 = 0;
            if v245.AssetTypeIdStrings then
                for _, v249 in v245.AssetTypeIdStrings do
                    v246 = v20.Dictionary.join(v246, {
                        [v249] = v46.ItemType.Asset
                    });
                end;
                v247 = v247 + #v245.AssetTypeIdStrings;
            end;
            if v245.BundleTypes then
                for _, v251 in v245.BundleTypes do
                    v246 = v20.Dictionary.join(v246, {
                        [v251] = v46.ItemType.Bundle
                    });
                end;
                v247 = v247 + #v245.BundleTypes;
            end;
            local v252 = table.create(#v234);
            if v247 > 0 then
                for _, v254 in l_tryOnItems_1 do
                    if (not l_FFlagAXMISEnableMultiShopping_0 or not v254.lookId) and v254.itemSubType and v246[v254.itemSubType] == v254.itemType then
                        table.insert(v252, {
                            id = tostring(v254.itemId), 
                            type = tostring(v254.itemType), 
                            encryptedAdTrackingData = nil
                        });
                    end;
                end;
            end;
            for _, v256 in v234 do
                if not l_tryOnItems_1[l_getTryOnItemReducerKey_0(v256.id, v256.type)] then
                    table.insert(v252, v256);
                end;
            end;
            v228:setState({
                entries = v252
            });
        elseif not v20.List.equals(v228.state.entries, v234) then
            v228:setState({
                entries = v234
            });
        end;
        return;
    end;
end;
v96.didMount = function(v257) --[[ Line: 1097 ]] --[[ Name: didMount ]]
    v257:updateItems(true);
end;
v96.didUpdate = function(v258, v259, v260) --[[ Line: 1102 ]] --[[ Name: didUpdate ]]
    -- upvalues: v39 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v20 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_AvatarScreen_0 (copy), v86 (copy)
    local v261 = v258.props.searchUuid ~= v259.searchUuid;
    if v258.props.fromSearch then
        v261 = v261 or v259.categoryInfo ~= v258.props.categoryInfo or not v258.props.searchInCatalog;
    end;
    if v261 and v258.state.restorePreviousChildFocus ~= false then
        v258:setState({
            restorePreviousChildFocus = false
        });
    end;
    if v261 or v258.state.numItemsPerRow ~= v260.numItemsPerRow then
        v258.requestImpressionsSignal:fire();
    end;
    local v262 = false;
    if v258.props.dataStatus == v39.Done then
        v262 = v259.dataStatus ~= v39.Done;
    end;
    local v263 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v258.props.hasProcessedMarketplaceFetcher else nil;
    local v264 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v258.props.shouldPageUseWidgetOnly else false;
    local v265 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v264 and v263 else nil;
    local l_searchInCatalog_3 = v258.props.searchInCatalog;
    local v267 = l_searchInCatalog_3 and l_searchInCatalog_3.items or nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 and v265 and not v267 then
        v267 = {};
    end;
    if l_FFlagAXFixCatalogRefreshRendering_0 then
        local v268 = false;
        if v258.props.externalNavigationRequestParams and v259.externalNavigationRequestParams then
            v268 = v258.props.externalNavigationRequestParams.wasItemEquipped ~= v259.externalNavigationRequestParams.wasItemEquipped;
        elseif v258.props.externalNavigationRequestParams ~= v259.externalNavigationRequestParams then
            v268 = true;
        end;
        local v269 = v258.props.itemInfos ~= v259.itemInfos;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v270 = not v20.List.equals(v258.state.entries, v267);
            local v271 = v259.hasProcessedMarketplaceFetcher ~= v258.props.hasProcessedMarketplaceFetcher;
            local v272 = v261 or v262;
            if v268 or v269 or v272 and v270 or v271 and v270 then
                v258:updateItems(v261);
            end;
        elseif v268 or v269 or (v261 or v262) and not v20.List.equals(v258.state.entries, v267) then
            v258:updateItems(v261);
        end;
    else
        v258:updateItems(v261);
    end;
    if v258.props.dataStatus == v39.Done and v259.dataStatus == v39.Fetching and v258.retryLoadMore then
        v258.retryLoadMore = false;
        v258.loadMore();
    end;
    if v258.shouldScrollBackToTopOfList({
        searchChanged = v261, 
        oldSortsAndFilter = v259.sortAndFilters, 
        newSortsAndFilter = v258.props.sortAndFilters
    }) and v258.widgetFlatListRef and v258.widgetFlatListRef.current then
        v258.widgetFlatListRef.current:scrollToOffset({
            offset = 0, 
            animated = false
        });
    end;
    local v273 = v258.props.dataStatus == v39.Failed;
    local l_entries_1 = v258.state.entries;
    local v275 = l_entries_1 and #l_entries_1 ~= 0;
    v273 = v273 and not v275;
    if l_FFlagAXCatalogCategoriesSDUI_0 and v258.props.isFetchingMarketplaceError then
        v273 = v258.props.isFetchingMarketplaceError;
    elseif l_FFlagAXMoveAllTabToWidgetOnly_0 and v258.props.shouldPageUseWidgetOnly then
        v273 = v258.props.isFetchingMarketplaceError;
    end;
    if v273 ~= v260.showFailedState and v273 ~= v258.state.showFailedState then
        v258:setState({
            showFailedState = v273
        });
        if v273 then
            local l_catalogAnalytics_1 = v258.props.catalogAnalytics;
            if v258.props.navigation.state.routeName == l_AvatarScreen_0.CatalogSearch then
                l_catalogAnalytics_1.sendAXCounter(v86.Counter.Errors.NoInternetConnectionErrorSearchView);
                return;
            else
                l_catalogAnalytics_1.sendAXCounter(v86.Counter.Errors.NoInternetConnectionErrorCatalogView);
            end;
        end;
    end;
end;
v96 = v59((v45((v7.connect(function(v277, v278) --[[ Line: 1254 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v47 (copy), v64 (copy), v20 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), l_PerformFetch_0 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), v61 (copy), l_AvatarScreen_0 (copy), v62 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v114 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy)
    local l_searchUuid_1 = v278.searchUuid;
    local l_categoryInfo_0 = v278.categoryInfo;
    local v281 = v47.getSearchKey(v277, l_searchUuid_1);
    local v282 = false;
    local v283 = nil;
    local l_fromSearch_0 = v278.fromSearch;
    if l_searchUuid_1 and l_fromSearch_0 then
        local v285 = v277.SearchesParameters[l_searchUuid_1];
        local v286 = v64.getQueryStringForSearchWidgets(v285);
        local v287 = v277.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v286];
        if v287 then
            local l_Details_0 = v287.Details;
            local v289 = false;
            if typeof(l_Details_0) == "table" then
                v289 = next(l_Details_0) ~= nil;
            end;
            v282 = v289 and (v20.isEmpty(l_categoryInfo_0) or l_categoryInfo_0.ShowWidgets) or false;
        end;
        local v290 = nil;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v291 = l_getAXMarketplaceWidgetStore_0(false).getDebouncedScreenSize(false);
            v290 = v64.getFetchWidgetInfoFetchKey(v286, nil, v291);
        else
            v290 = v64.getFetchWidgetInfoFetchKey(v286);
        end;
        v283 = l_PerformFetch_0.GetStatus(v277, v290);
    elseif l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and l_categoryInfo_0 and v278.shouldPageUseWidgetOnly then
        local l_WidgetContext_0 = l_categoryInfo_0.WidgetContext;
        if l_WidgetContext_0 then
            local v293 = v277.AvatarExperience.Common.Widgets.ContextWidgetInfo[l_WidgetContext_0];
            if v293 then
                local v294 = false;
                if typeof(v293.Details) == "table" then
                    v294 = next(v293.Details) ~= nil;
                end;
                v282 = v294;
            end;
        end;
    end;
    local v295 = v277.AvatarExperience.ExternalNavigationRequest.params or {};
    return {
        fullView = v61(v277, l_AvatarScreen_0.Catalog), 
        searchParameters = v277.SearchesParameters[v278.searchUuid], 
        sortAndFilters = v277.AvatarExperience.Catalog.SortAndFilters, 
        filterCount = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v62(v277) else nil, 
        selectedCategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v277.AvatarExperience.Catalog.Categories.categoryId else nil, 
        selectedSubcategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v277.AvatarExperience.Catalog.Categories.subcategoryId else nil, 
        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v277.AvatarExperience.Catalog.SearchCategories then v277.AvatarExperience.Catalog.SearchCategories.categoryId else nil, 
        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v277.AvatarExperience.Catalog.SearchCategories then v277.AvatarExperience.Catalog.SearchCategories.subcategoryId else nil, 
        searchInCatalog = v277.Search.SearchesInCatalog[v278.searchUuid], 
        dataStatus = l_PerformFetch_0.GetStatus(v277, v281), 
        tryOnItems = v277.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        tryOnLookId = if v114 then v277.AvatarExperience.AvatarScene.OutfitTryOn.LookId else nil, 
        focusedWidget = v277.AvatarExperience.Catalog.ResultsList[v278.searchUuid] and v277.AvatarExperience.Catalog.ResultsList[v278.searchUuid].focusedWidget or {}, 
        hideTopBar = v277.AvatarExperience.Catalog.ResultsList[v278.searchUuid] and v277.AvatarExperience.Catalog.ResultsList[v278.searchUuid].hideTopBar or false, 
        widgetRequestId = v277.AvatarExperience.Common.Widgets.WidgetInfo.RequestId, 
        widgetDataStatus = v283, 
        hasWidgets = v282, 
        externalNavigationRequestParams = v295, 
        itemInfos = if not l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then {
            AssetInfos = v277.AvatarExperience.Common.AssetInfos, 
            BundleInfos = v277.AvatarExperience.Common.BundleInfos
        } else nil, 
        analyticsMetadata = v277.AvatarExperience.AnalyticsMetadata
    };
end, function(v296) --[[ Line: 1346 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v57 (copy), v54 (copy), v81 (copy), v82 (copy), v87 (copy), v34 (copy), v55 (copy), v56 (copy), v83 (copy), v10 (copy), v84 (copy)
    local function v302(_, v298, v299, v300, v301) --[[ Line: 1347 ]]
        -- upvalues: v296 (copy), v57 (ref), v54 (ref)
        return v296(v57(v54({
            searchKeyword = v298, 
            searchUuid = v299, 
            categoryInfo = v300
        }, v301)));
    end;
    local function v311(v303, v304, v305, v306, v307, v308, v309, v310) --[[ Line: 1354 ]]
        -- upvalues: v296 (copy), v81 (ref)
        return v296(v81(v303, v304, v305, v306, v307, v308, v309, v310));
    end;
    v311 = function(v312, v313, v314) --[[ Line: 1378 ]]
        -- upvalues: v296 (copy), v81 (ref)
        return v296(v81(v312, v313, v314));
    end;
    local function v316(v315) --[[ Line: 1382 ]]
        -- upvalues: v296 (copy), v82 (ref)
        return v296(v82(v315));
    end;
    local v318 = v87() and function(v317) --[[ Line: 1386 ]]
        -- upvalues: v296 (copy), v34 (ref)
        return v296(v34.StartTracking(v317));
    end or nil;
    local function v323(v319, v320, v321, v322) --[[ Line: 1391 ]]
        -- upvalues: v296 (copy), v55 (ref)
        return v296(v55(v319, v320, v321, v322));
    end;
    local function v333(v324, v325, v326, v327, v328, v329, v330, v331, v332) --[[ Line: 1395 ]]
        -- upvalues: v296 (copy), v56 (ref), v83 (ref)
        v296(v56(v324, v325, v326, v327, v328, v329, v330, v331, v332, true));
        v296(v83({
            itemId = v328, 
            itemType = v326, 
            wasItemEquipped = true, 
            fetchItemFailed = false
        }));
    end;
    local function v336(v334, v335) --[[ Line: 1428 ]]
        -- upvalues: v296 (copy), v10 (ref), v83 (ref), v84 (ref)
        v296(v10({
            toastMessage = "Feature.Avatar.Message.DeepLinkEquipFailed"
        }));
        v296(v83({
            itemId = v334, 
            itemType = v335, 
            wasItemEquipped = false, 
            fetchItemFailed = true
        }));
        v296(v84());
    end;
    return {
        dispatchLoadMore = v302, 
        dispatchSetResultsListFocusedWidget = v311, 
        dispatchClearResultsListFocusedWidget = v316, 
        dispatchCatalogTilesLatencyStartTracker = v318, 
        fetchItemData = v323, 
        handleDeepLinkEquipError = v336, 
        equipCatalogDeepLinkItem = v333
    };
end)(v96)))));
v96 = v22((l_withNavigation_0((l_RoactServices_0.connect({
    axAnalytics = v51, 
    catalogAnalytics = v52, 
    networking = v9
})(v96)))));
local function v340(v337) --[[ Line: 1467 ]] --[[ Name: selectItemInfos ]]
    local l_AssetInfos_0 = v337.AvatarExperience.Common.AssetInfos;
    local l_BundleInfos_0 = v337.AvatarExperience.Common.BundleInfos;
    return {
        AssetInfos = l_AssetInfos_0, 
        BundleInfos = l_BundleInfos_0
    };
end;
return function(v341) --[[ Line: 1514 ]] --[[ Name: ResultsListWrapper ]]
    -- upvalues: l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_useFocusGuiObject_0 (copy), l_useSelector_0 (copy), v6 (copy), v82 (copy), v94 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v28 (copy), l_useSignalState_0 (copy), v103 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v29 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v72 (copy), l_getUseSelectorDeepEquals_0 (copy), v62 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy), v340 (copy), v43 (copy), v96 (ref)
    local v342 = table.clone(v341);
    if l_FFlagAXMigrateMainNavigationInputBindings_0 then
        local v343 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v343 = function(v344) --[[ Line: 1521 ]]
                return v344.AvatarExperience.Catalog.ResultsList;
            end;
        end;
        local v345 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v345 = l_useDispatch_0();
        end;
        local v346 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.useFocusController();
        local v347 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v348 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            local v349 = l_useSelector_0(v343);
            local v350 = v349[v341.searchUuid] and v349[v341.searchUuid].focusedWidget;
            v348 = if v350 then v350.active else false;
        end;
        local l_v347_0 = v347 --[[ copy: 5 -> 11 ]];
        local l_v346_0 = v346 --[[ copy: 4 -> 12 ]];
        do
            local l_v345_0, l_v348_0 = v345, v348;
            local v356 = v6.useCallback(function(v355) --[[ Line: 1540 ]]
                -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_v348_0 (ref), l_v345_0 (ref), v82 (ref), v341 (copy), l_v347_0 (copy), l_v346_0 (copy)
                v355.cancelled = true;
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if l_v348_0 then
                        l_v345_0(v82(v341.searchUuid));
                        if type(v341.onCloseFocusedWidget) == "function" then
                            v341.onCloseFocusedWidget();
                            return;
                        end;
                    elseif l_v347_0 and v341.NextSelectionUp and v341.NextSelectionUp.current then
                        l_v347_0(v341.NextSelectionUp.current);
                        return;
                    end;
                else
                    l_v346_0.moveFocusTo(v341.NextSelectionUp);
                end;
            end, {
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v347 else v346, 
                v341.NextSelectionUp, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v348_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v341.searchUuid else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v345_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v341.onCloseFocusedWidget else nil
            });
            v342.focusNavigationBindingsRef = v94({
                onNavigateBack = v356
            }, v341.frameRef);
        end;
    end;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v357 = l_useUnifiedEventImpressionsReporter_0();
        local l_v357_0 = v357 --[[ copy: 2 -> 10 ]];
        v342.tagBasedImpressionsDetectorExtensions = v6.useMemo(function() --[[ Line: 1572 ]]
            -- upvalues: l_v357_0 (copy)
            return {
                l_v357_0
            };
        end, {
            v357
        });
    end;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v359 = v28.getCatalogSelectionStore();
        local v360 = l_useSignalState_0(v359.selectedCategoryId);
        local v361 = l_useSignalState_0(v359.selectedSubcategoryId);
        v342.selectedCategoryId = v360;
        v342.selectedSubcategoryId = v361;
        local v362 = v28.getCatalogSearchSelectionStore();
        local v363 = l_useSignalState_0(v362.selectedCategoryId);
        local v364 = l_useSignalState_0(v362.selectedSubcategoryId);
        v342.selectedSearchCategoryId = v363;
        v342.selectedSearchSubcategoryId = v364;
        local v365 = l_useSignalState_0(v359.selectedCategory);
        v342.selectedCategory = v365;
        local v366 = l_useSignalState_0(v362.selectedCategory);
        v342.selectedSearchCategory = v366;
        if v103 then
            v342.selectedSearchSubcategory = l_useSignalState_0(v362.selectedSubcategory);
        end;
        v342.categoryInfo = if v341.fromSearch then v366 else v365;
    end;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v367 = l_useAnimatedVisibility_0();
        v342.visibilityRatioBinding = if v367 then v29.useSignalBinding(v367.animatedMenusStore.getVisibilityRatio) else v6.createBinding(1);
    end;
    if l_FFlagAXCatalogCategoriesSDUI_0 or l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v368 = v72.getFetchMarketplaceStore(false);
        local v369 = l_useSignalState_0(v368.getFetchingMarketplaceError);
        local v370 = if l_FFlagAXCatalogCategoriesSDUI_0 then l_useSignalState_0(v368.getCatalogCategoriesError) else nil;
        v342.isFetchingMarketplaceError = v369;
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            v342.isFetchingMarketplaceError = v369 or v370;
        end;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            v342.hasProcessedMarketplaceFetcher = l_useSignalState_0(v368.getFetchingMarketplaceProcessed);
            local v372 = v6.useCallback(function(v371) --[[ Line: 1640 ]]
                -- upvalues: v341 (copy)
                return v371.SearchesParameters[v341.searchUuid];
            end, {
                v341.searchUuid
            });
            local v373 = l_useSelector_0(v372, l_getUseSelectorDeepEquals_0());
            local v374 = l_useSelector_0(v62);
            v342.shouldPageUseWidgetOnly = l_getShouldPageUseWidgetOnlyFetcher_0(v342.categoryInfo, v374, v373 and v373.searchKeyword);
        end;
    end;
    if l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then
        v342.itemInfos = l_useSelector_0(v340, v43.shallowEqual);
    end;
    return v6.createElement(v96, v342);
end;