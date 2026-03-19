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
local l_FFlagAXHideMenuOnScroll_0 = v23.FFlagAXHideMenuOnScroll;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v23.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXCatalogCategoriesSDUI_0 = v23.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXReduceResultsListRerendersOnItemInfos_0 = v23.FFlagAXReduceResultsListRerendersOnItemInfos;
local l_FFlagAXEnableTTIViaModule_0 = v23.FFlagAXEnableTTIViaModule;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 = v23.FFlagAXFixWidgetOnlyTabNoItemsFound;
local l_FFlagAXShowCategoriesWhenNetworkFails_0 = v23.FFlagAXShowCategoriesWhenNetworkFails;
local v111 = game:DefineFastFlag("AXSkipTryOnHoistForLooks", false);
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
    tryOnLookId = if v111 then v17.optional(v17.string) else nil, 
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
v96.init = function(v112) --[[ Line: 254 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_Signal_0 (copy), v39 (copy), v15 (copy), v85 (copy), v21 (copy), v66 (copy), v87 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), v86 (copy)
    v112.state = {
        restorePreviousChildFocus = true, 
        numItemsPerRow = 0, 
        navBarSizeY = 0, 
        showFailedState = false
    };
    v112.lastYPosition = 0;
    v112.scrollingFrameRef = v112.props.scrollingFrameRef or v5.createRef();
    v112.navBarRef = v5.createRef();
    v112.topPanelRef = v5.createRef();
    v112.gridRef = v5.createRef();
    v112.pillBarRef = v5.createRef();
    v112.emptyStateRef = v5.createRef();
    v112.widgetFlatListRef = v5.createRef();
    local v113 = nil;
    local v114 = nil;
    v112.topPanelHeightBinding = v113;
    v112.updateTopPanelHeightBinding = v114;
    v113, v114 = v5.createBinding(0);
    v112.topPanelHeightBinding = v113;
    v112.updateTopPanelHeightBinding = v114;
    v112.impressionsReported = {};
    v112.itemDetailsPeekViewRefs = v112.props.itemDetailsPeekViewRefs;
    v112.onNumItemsPerRowChanged = function(v115) --[[ Line: 278 ]]
        -- upvalues: v112 (copy)
        v112:setState({
            numItemsPerRow = v115
        });
    end;
    v112.onNavBarSizeChanged = function(v116) --[[ Line: 284 ]]
        -- upvalues: v112 (copy)
        if v116.Y ~= v112.state.navBarSizeY then
            v112:setState({
                navBarSizeY = v116.Y
            });
        end;
    end;
    v112.requestImpressionsSignal = l_Signal_0.new();
    v112.onItemsListScroll = function(v117) --[[ Line: 294 ]]
        -- upvalues: v112 (copy)
        v112.requestImpressionsSignal:fire();
        local v118 = v112.props.adaptiveScrolling or {};
        if v118.onCanvasYChanged then
            v118.onCanvasYChanged(v117);
        end;
    end;
    v112.loadMore = function() --[[ Line: 303 ]]
        -- upvalues: v112 (copy), v39 (ref), v15 (ref), v85 (ref), v21 (ref)
        if v112.props.dataStatus == v39.Fetching then
            v112.retryLoadMore = true;
            return v15.resolve("Currently fetching");
        else
            local l_catalogAnalytics_0 = v112.props.catalogAnalytics;
            local l_searchUuid_0 = v112.props.searchUuid;
            local l_searchInCatalog_0 = v112.props.searchInCatalog;
            local l_searchParameters_0 = v112.props.searchParameters;
            local l_dispatchLoadMore_0 = v112.props.dispatchLoadMore;
            if v85 and not l_searchInCatalog_0 then
                l_searchInCatalog_0 = {};
                v21(string.format("ResultsList: searchInCatalog is nil; searchUuid: %s", (tostring(l_searchUuid_0))));
            end;
            local v124 = l_searchParameters_0 and l_searchParameters_0.categoryInfo or nil;
            return l_dispatchLoadMore_0(l_catalogAnalytics_0, l_searchInCatalog_0.keyword, l_searchUuid_0, v124, v112.props.networking);
        end;
    end;
    v112.onFocusGained = function() --[[ Line: 335 ]]
        -- upvalues: v112 (copy)
        v112:setState({
            restorePreviousChildFocus = true
        });
    end;
    v112.scrollBackToTop = function() --[[ Line: 341 ]]
        -- upvalues: v112 (copy)
        local l_current_0 = v112.props.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
    v112.setFocusedWidget = function(v126) --[[ Line: 348 ]]
        -- upvalues: v112 (copy)
        local v127 = if v126 and v126.template then v126.template.title else nil;
        local v128 = if v126 and v126.template then v126.template.localizedTitle else "";
        local v129 = if v126 and v126.template then v126.template.localizedDescription else "";
        local v130 = if v126 and v126.template then v126.template.description else nil;
        local v131 = if v126 and v126.template then v126.template.tooltip else nil;
        local v132 = if v126 and v126.template then v126.template.localizedTooltip else "";
        local v133 = nil;
        v133 = {
            title = v127, 
            localizedTitle = v128, 
            description = v130, 
            localizedDescription = v129, 
            tooltip = v131, 
            localizedTooltip = v132
        };
        v112.props.dispatchSetResultsListFocusedWidget(v112.props.searchUuid, v126.id, v133);
    end;
    v112.clearFocusedWidget = function() --[[ Line: 373 ]]
        -- upvalues: v112 (copy)
        v112.props.dispatchClearResultsListFocusedWidget(v112.props.searchUuid);
    end;
    v112.shouldScrollBackToTopOfList = function(v134) --[[ Line: 377 ]]
        -- upvalues: v66 (ref)
        local l_searchChanged_0 = v134.searchChanged;
        local l_oldSortsAndFilter_0 = v134.oldSortsAndFilter;
        local l_newSortsAndFilter_0 = v134.newSortsAndFilter;
        return l_searchChanged_0 or not v66.areSortAndFiltersEqual(l_oldSortsAndFilter_0, l_newSortsAndFilter_0);
    end;
    if v87() then
        if l_FFlagAXEnableTTIViaModule_0 then
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Tiles);
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Thumbnails);
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Tiles);
            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Thumbnails);
        end;
        v112.props.dispatchCatalogTilesLatencyStartTracker(v112.props.searchUuid);
    end;
end;
v96.getNextSelectionRight = function(v138, v139, v140) --[[ Line: 408 ]] --[[ Name: getNextSelectionRight ]]
    -- upvalues: l_AvatarScreen_0 (copy), v20 (copy)
    local l_NextSelectionRight_0 = v138.props.NextSelectionRight;
    if v139 == l_AvatarScreen_0.ItemDetails and v140 then
        return v138.itemDetailsPeekViewRefs[v140];
    elseif v139 == l_AvatarScreen_0.LookDetails then
        return v138.props.namedRefs[l_AvatarScreen_0.LookDetails];
    else
        if v138.props.tryOnItems and not v20.isEmpty(v138.props.tryOnItems) and v139 ~= l_AvatarScreen_0.SortAndFilters and v138.props.multiTryOnBottomBarRef and v138.props.multiTryOnBottomBarRef:getValue() ~= nil then
            l_NextSelectionRight_0 = v138.props.multiTryOnBottomBarRef;
        end;
        return l_NextSelectionRight_0;
    end;
end;
v96.renderResultsList = function(v142, v143, v144) --[[ Line: 430 ]] --[[ Name: renderResultsList ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v39 (copy), v53 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), l_AvatarScreen_0 (copy), v50 (copy), v88 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v64 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_CatalogCategories_0 (copy), l_FFlagAXHandleLooksWidgetCategories_0 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_withLocalization_0 (copy), l_ImpressionEnums_0 (copy), v5 (copy), v92 (copy), v80 (copy), v87 (copy), l_AvatarExperienceScreenSizeImpressionsDetector_0 (copy), v71 (copy), l_IXPService_0 (copy), l_CollectionService_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v8 (copy), v58 (copy), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (copy), v68 (copy), v67 (copy), l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_EmptyState_0 (copy), v60 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), v70 (copy), l_FitTextLabel_0 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local l_searchInCatalog_1 = v142.props.searchInCatalog;
    local l_dataStatus_0 = v142.props.dataStatus;
    local v147 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v142.props.shouldPageUseWidgetOnly else nil;
    local v148 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v147 and v142.props.hasProcessedMarketplaceFetcher else nil;
    local l_key_0 = v142.props.navigation.state.key;
    local l_avatarRoute_0 = v142.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local l_key_1 = l_avatarRoute_0.current.key;
    local l_entries_0 = v142.state.entries;
    local v154 = l_entries_0 and #l_entries_0 ~= 0;
    local l_hasWidgets_0 = v142.props.hasWidgets;
    local l_widgetDataStatus_0 = v142.props.widgetDataStatus;
    local v157 = false;
    if l_dataStatus_0 == v39.Done then
        v157 = not l_widgetDataStatus_0 or l_widgetDataStatus_0 == v39.Done;
    end;
    local v158 = l_entries_0 and #l_entries_0 or v53.PageFetchLimit;
    local v159 = not v157 or v154 or v142.props.hasWidgets or l_FFlagAXMoveAllTabToWidgetOnly_0 and v148 and v142.props.hasProcessedMarketplaceFetcher;
    local v160 = nil;
    if l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 then
        if v148 then
            v157 = v142.props.hasProcessedMarketplaceFetcher;
        end;
        v160 = v148 and v142.props.hasProcessedMarketplaceFetcher and l_hasWidgets_0;
        v159 = not v157 or v154 or v142.props.hasWidgets or v160;
    end;
    local v161 = l_searchInCatalog_1 and l_searchInCatalog_1.hasMoreEntries or nil;
    local v162 = v154 and v161;
    local v163 = v154 and not v162 or l_FFlagAXMoveAllTabToWidgetOnly_0 and v148 or l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and v160;
    local l_Font_0 = v143.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v166 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local l_Theme_0 = v143.Theme;
    local l_Color_0 = l_Theme_0.TextMuted.Color;
    local l_Transparency_0 = l_Theme_0.TextMuted.Transparency;
    local v170 = false;
    if l_name_0 ~= l_AvatarScreen_0.ItemDetails then
        v170 = v144 ~= nil;
    end;
    local v171 = nil;
    local v172 = v50.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v173 = not v159 and not l_hasWidgets_0;
    if v88 and (not l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 or not v148) then
        v173 = v173 and l_entries_0 and #l_entries_0 == 0;
    end;
    local v174 = nil;
    local v175 = nil;
    local v176 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v175 = v142.props.selectedCategory;
        v176 = v142.props.selectedSearchCategory;
    else
        v175 = v64.getCategoryId(v142.props.selectedCategoryId);
        v176 = v64.getCategoryId(v142.props.selectedSearchCategoryId);
    end;
    local v177 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v175.Id == l_CatalogCategories_0.Avatars:rawValue() else v175.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog;
    local v178 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v176.Id == l_CatalogCategories_0.Avatars:rawValue() else v176.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch;
    local v179 = nil;
    local v180 = nil;
    if l_FFlagAXHandleLooksWidgetCategories_0 then
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v175.LooksWidgetContextForOrganicContent ~= nil then
                    v179 = true;
                end;
            elseif v175.ShowLooksAsOrganicContent ~= nil then
                v179 = true;
            end;
        end;
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v176.LooksWidgetContextForOrganicContent ~= nil then
                    v180 = true;
                end;
            elseif v176.ShowLooksAsOrganicContent ~= nil then
                v180 = true;
            end;
        end;
    end;
    if (l_FFlagAXHandleLooksWidgetCategories_0 and (v179 or v180) or not l_FFlagAXHandleLooksWidgetCategories_0 and (v177 or v178)) and l_entries_0 and #l_entries_0 == 0 and v161 then
        v174 = true;
        v173 = false;
        v158 = 0;
    end;
    local l_active_0 = v142.props.focusedWidget.active;
    local l_title_0 = v142.props.focusedWidget.title;
    local l_id_0 = v142.props.focusedWidget.id;
    local v184 = if l_active_0 then l_title_0 else nil;
    local v185 = {};
    v163 = v163 or l_active_0;
    return l_withLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound", 
        focusedWidgetTitle = if v184 ~= "" then v184 else nil, 
        emptyText = "Feature.DisplayName.ErrorMessage.SomethingWentWrong"
    })(function(v186) --[[ Line: 578 ]]
        -- upvalues: v142 (copy), l_name_0 (copy), l_key_1 (copy), l_ImpressionEnums_0 (ref), v171 (ref), v5 (ref), v92 (ref), l_key_0 (copy), v80 (ref), v172 (copy), v87 (ref), l_AvatarExperienceScreenSizeImpressionsDetector_0 (ref), v71 (ref), v185 (copy), l_IXPService_0 (ref), l_CollectionService_0 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), v64 (ref), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_CatalogCategories_0 (ref), l_FFlagAXHandleLooksWidgetCategories_0 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), l_FFlagAXHideMenuOnScroll_0 (ref), l_Focusable_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v170 (copy), v8 (ref), v144 (copy), v58 (ref), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (ref), v68 (ref), v67 (ref), v154 (copy), l_FFlagAXShowCategoriesWhenNetworkFails_0 (ref), l_EmptyState_0 (ref), v60 (ref), l_entries_0 (copy), v159 (ref), v162 (copy), v163 (ref), l_active_0 (copy), l_id_0 (copy), v158 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v70 (ref), v173 (ref), l_FitTextLabel_0 (ref), v143 (copy), v166 (copy), l_Color_0 (copy), l_Transparency_0 (copy), l_Font_1 (copy), v174 (ref), l_TagBasedImpressionsDetector_0 (ref)
        local v187 = v142:getNextSelectionRight(l_name_0, l_key_1);
        local v188 = if v142.props.fromSearch then l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH else l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE;
        v171 = v5.createElement(v92, {
            parentRef = v142.gridRef, 
            pageFilter = function() --[[ Line: 585 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v142.requestImpressionsSignal, 
            eventContext = v80(), 
            eventName = "marketplaceOrganicFELog", 
            requestId = v142.props.widgetRequestId, 
            impressionsTag = v172, 
            impressionsSchema = "defaultItem", 
            searchUuid = if v87() then v142.props.searchUuid else nil, 
            surface = v188, 
            analyticsMetadata = v142.props.analyticsMetadata
        });
        local v197 = v5.createElement(l_AvatarExperienceScreenSizeImpressionsDetector_0, {
            parentRef = v142.gridRef, 
            pageFilter = function() --[[ Line: 601 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v142.requestImpressionsSignal, 
            filterImpressionFunc = function(v189) --[[ Line: 605 ]] --[[ Name: filterImpressionFunc ]]
                -- upvalues: v71 (ref), v185 (ref)
                local l_v189_Attribute_0 = v189:GetAttribute(v71.WidgetExposureMetadata.AttributeKey);
                return l_v189_Attribute_0 and not v185[l_v189_Attribute_0];
            end, 
            onImpressionsDetected = function(v191) --[[ Line: 609 ]] --[[ Name: onImpressionsDetected ]]
                -- upvalues: v71 (ref), v185 (ref), l_IXPService_0 (ref), v142 (ref)
                for _, v193 in v191 do
                    local l_v193_Attribute_0 = v193:GetAttribute(v71.WidgetExposureMetadata.AttributeKey);
                    v185[l_v193_Attribute_0] = true;
                    l_IXPService_0:LogUserLayerExposure(l_v193_Attribute_0);
                    local l_impressionsReported_0 = v142.impressionsReported;
                    if not l_impressionsReported_0[v193.Name] then
                        v142.props.catalogAnalytics.widgetInteractionV2({}, v71.ActionType.IMPRESSION);
                        l_impressionsReported_0[v193.Name] = true;
                    end;
                end;
            end, 
            collectObjectsFunc = function(_) --[[ Line: 624 ]] --[[ Name: collectObjectsFunc ]]
                -- upvalues: l_CollectionService_0 (ref), v71 (ref)
                return l_CollectionService_0:GetTagged(v71.WidgetExposureMetadata.TagName);
            end
        });
        local l_frameRef_0 = v142.props.frameRef;
        local l_backToTopSignal_0 = v142.props.backToTopSignal;
        local v200 = v142.props.adaptiveScrolling or {};
        local v201 = 0;
        if v142.props.multiTryOnBottomBarRef then
            local v202 = v142.props.multiTryOnBottomBarRef:getValue();
            v201 = if v202 then v202.AbsoluteSize.Y else 0;
        end;
        local l_routeName_0 = v142.props.navigation.state.routeName;
        local v204 = v142.props.namedRefs[l_routeName_0 .. "TopPanel"];
        local v205 = nil;
        v205 = if l_FFlagAXCatalogCategoriesStore_0 then v142.props.selectedSearchCategory else v64.getCategoryId(v142.props.selectedSearchCategoryId);
        local v206 = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v205.Id == l_CatalogCategories_0.Avatars:rawValue() else v205.NavigationKey == l_CatalogCategories_0.Avatars;
        if l_FFlagAXHandleLooksWidgetCategories_0 then
            v206 = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v205.LooksWidgetContextForOrganicContent ~= nil else v205.ShowLooksAsOrganicContent ~= nil;
        end;
        local v209 = if l_FFlagAXHideMenuOnScroll_0 and v142.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v142.props.visibilityRatioBinding, 
            height = v142.topPanelHeightBinding
        }):map(function(v207) --[[ Line: 670 ]]
            local v208 = math.floor((1 - v207.visibility) * -v207.height);
            return UDim2.fromOffset(0, v208);
        end) else nil;
        local v212 = if l_FFlagAXHideMenuOnScroll_0 and v142.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v142.props.visibilityRatioBinding, 
            height = v142.topPanelHeightBinding
        }):map(function(v210) --[[ Line: 680 ]]
            local v211 = v210.height * v210.visibility;
            return UDim2.new(1, 0, 1, -v211);
        end) else nil;
        local v215 = if l_FFlagAXHideMenuOnScroll_0 and v142.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v142.props.visibilityRatioBinding, 
            height = v142.topPanelHeightBinding
        }):map(function(v213) --[[ Line: 690 ]]
            local v214 = v213.height * v213.visibility;
            return UDim2.fromOffset(0, v214);
        end) else nil;
        return v5.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ClipsDescendants = true, 
            LayoutOrder = v142.props.layoutOrder, 
            [v5.Ref] = l_frameRef_0, 
            defaultChild = v142.topPanelRef, 
            NextSelectionUp = v142.props.NextSelectionUp, 
            restorePreviousChildFocus = v142.state.restorePreviousChildFocus, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v170 and {
                NavUp = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 709 ]]
                    -- upvalues: v144 (ref), v142 (ref)
                    v144.moveFocusTo(v142.props.NextSelectionUp);
                end)
            } or nil
        }, {
            BackToTopSignal = if l_backToTopSignal_0 then v5.createElement(v58, {
                signal = l_backToTopSignal_0, 
                callback = v142.scrollBackToTop
            }) else nil, 
            ScrollPanel = v5.createElement(l_FFlagAXMigrateMainNavigationInputBindings_0 and "Frame" or l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ClipsDescendants = true, 
                [v5.Ref] = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v142.props.focusNavigationBindingsRef else nil
            }, {
                TopPanel = v5.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ZIndex = 2, 
                    ref = v204, 
                    Position = if l_FFlagAXHideMenuOnScroll_0 then v209 else nil
                }, v5.createElement(if l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 then v68 else v67, {
                    fromSearch = v142.props.fromSearch, 
                    catalogAnalytics = v142.props.catalogAnalytics, 
                    axAnalytics = v142.props.axAnalytics, 
                    searchUuid = v142.props.searchUuid, 
                    searchInCatalog = v142.props.searchInCatalog, 
                    hideTopBar = v142.props.hideTopBar, 
                    focusedWidget = v142.props.focusedWidget, 
                    showCloseIcon = v142.props.showCloseIcon, 
                    restorePreviousChildFocus = v142.state.restorePreviousChildFocus, 
                    topPanelRef = v142.topPanelRef, 
                    gridRef = v142.gridRef, 
                    hasEntries = v154, 
                    backToTopSignal = v142.props.backToTopSignal, 
                    onCategoryOrSubcategoryChange = v142.props.onCategoryOrSubcategoryChange, 
                    onCategoryOrSubcategoryChangeById = v142.props.onCategoryOrSubcategoryChangeById, 
                    updateHeightBinding = v142.updateTopPanelHeightBinding, 
                    onCloseFocusedWidget = v142.props.onCloseFocusedWidget, 
                    hidePillBar = v206
                })), 
                ListFrame = v5.createElement("Frame", {
                    Size = l_FFlagAXHideMenuOnScroll_0 and v212 or v142.topPanelHeightBinding:map(function(v216) --[[ Line: 772 ]]
                        return UDim2.new(1, 0, 1, -v216);
                    end), 
                    Position = l_FFlagAXHideMenuOnScroll_0 and v215 or v142.topPanelHeightBinding:map(function(v217) --[[ Line: 777 ]]
                        return UDim2.fromOffset(0, v217);
                    end), 
                    BackgroundTransparency = 1
                }, if l_FFlagAXShowCategoriesWhenNetworkFails_0 and v142.state.showFailedState then {
                    EmptyState = v5.createElement(l_EmptyState_0, {
                        onActivated = v142.props.onRetry, 
                        text = v186.emptyText, 
                        [v5.Ref] = v142.emptyStateRef
                    })
                } else {
                    WidgetList = v5.createElement(v60.WidgetList, {
                        entries = l_entries_0, 
                        fromSearch = v142.props.fromSearch, 
                        bottomBarHeight = v201, 
                        showingEntries = v159, 
                        searchUuid = v142.props.searchUuid, 
                        loadMore = v162 and v142.loadMore or nil, 
                        hasMoreRows = v162, 
                        shouldCreateEndOfScrollElement = v163, 
                        itemDetailsPeekViewRefs = v142.itemDetailsPeekViewRefs, 
                        gridRef = v142.gridRef, 
                        flatListRef = v142.widgetFlatListRef, 
                        onScroll = v142.onItemsListScroll, 
                        focusedWidget = if l_active_0 then l_id_0 else nil, 
                        onWidgetFocusAcquired = v142.setFocusedWidget, 
                        onWidgetFocusReleased = v142.clearFocusedWidget, 
                        requestImpressionsSignal = v142.requestImpressionsSignal, 
                        onNumItemsPerRowChanged = v142.onNumItemsPerRowChanged, 
                        NextSelectionRight = v187, 
                        NextSelectionUp = v142.topPanelRef, 
                        restorePreviousChildFocus = v142.state.restorePreviousChildFocus, 
                        onFocusGained = not v142.state.restorePreviousChildFocus and v142.onFocusGained or nil, 
                        numItemsExpected = v158, 
                        scrollingEnabled = if v200.scrollingEnabledBinding then v200.scrollingEnabledBinding:map(function(v218) --[[ Line: 816 ]]
                            return v218;
                        end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v200.scrollingEnabled, 
                        selectedCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedCategoryIndex, 
                        selectedSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedSubcategoryIndex, 
                        selectedSearchCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedSearchCategoryIndex, 
                        selectedSearchSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedSearchSubcategoryIndex, 
                        selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedCategoryId, 
                        selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedSubcategoryId, 
                        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedSearchCategoryId, 
                        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v142.props.selectedSearchSubcategoryId, 
                        listHeaderComponent = v5.createElement(v70), 
                        pillBarVisible = not v206
                    }), 
                    NoItemsFound = v173 and v5.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0, v143.Tokens.Global.Space_400), 
                        Text = v186.noItemsFound, 
                        TextSize = v166, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        Font = l_Font_1
                    }), 
                    AvatarsTabError = v174 and v5.createElement("Frame", {
                        LayoutOrder = v142.props.layoutOrder, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1
                    }, {
                        EmptyState = v5.createElement(l_EmptyState_0, {
                            onActivated = v142.loadMore, 
                            text = v186.emptyText, 
                            [v5.Ref] = v142.emptyStateRef
                        })
                    })
                })
            }), 
            ImpressionsReporter = v171, 
            WidgetImpressionsReporter = v197, 
            UnifiedImpressionsReporter = v5.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v142.gridRef, 
                pageFilter = function() --[[ Line: 882 ]] --[[ Name: pageFilter ]]
                    -- upvalues: l_key_0 (ref), l_key_1 (ref)
                    return l_key_0 == l_key_1;
                end, 
                requestImpressionsSignal = v142.requestImpressionsSignal, 
                extensions = v142.props.tagBasedImpressionsDetectorExtensions
            })
        });
    end);
end;
v96.render = function(v219) --[[ Line: 892 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v5 (copy), l_EmptyState_0 (copy), l_withStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy)
    local l_showFailedState_0 = v219.state.showFailedState;
    if not l_FFlagAXShowCategoriesWhenNetworkFails_0 and l_showFailedState_0 then
        return l_withLocalization_0({
            emptyText = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v221) --[[ Line: 900 ]]
            -- upvalues: v5 (ref), v219 (copy), l_EmptyState_0 (ref)
            return v5.createElement("Frame", {
                LayoutOrder = v219.props.layoutOrder, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                EmptyState = v5.createElement(l_EmptyState_0, {
                    onActivated = v219.props.onRetry, 
                    text = v221.emptyText, 
                    [v5.Ref] = v219.emptyStateRef
                })
            });
        end);
    else
        return l_withStyle_0(function(v222) --[[ Line: 916 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v219 (copy), v8 (ref)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                return v219:renderResultsList(v222);
            else
                return v8.withFocusController(function(v223) --[[ Line: 920 ]]
                    -- upvalues: v219 (ref), v222 (copy)
                    return v219:renderResultsList(v222, v223);
                end);
            end;
        end);
    end;
end;
v96.updateItems = function(v224, v225) --[[ Line: 933 ]] --[[ Name: updateItems ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v48 (copy), v49 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v5 (copy), v20 (copy), v111 (copy), v46 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_getTryOnItemReducerKey_0 (copy)
    local l_searchInCatalog_2 = v224.props.searchInCatalog;
    local v227 = l_searchInCatalog_2 and l_searchInCatalog_2.items or nil;
    local v228 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v224.props.shouldPageUseWidgetOnly else false;
    local v229 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v228 and v224.props.hasProcessedMarketplaceFetcher else nil;
    local v230 = nil;
    v230 = if l_FFlagAXMoveAllTabToWidgetOnly_0 and v229 then {} else v227;
    if v224.props.externalNavigationRequestParams then
        if v48.newValidEquipDeepLinkExists(v224.props.externalNavigationRequestParams) then
            local v231, v232 = v48.parseItemIdAndItemType(v224.props.externalNavigationRequestParams);
            local v233 = v49(v224.props.itemInfos, v231, v232);
            if v233 then
                local v234 = v48.parseItemSubType(v232, v233);
                v224.props.equipCatalogDeepLinkItem(v224.props.networking, v224.props.catalogAnalytics, v232, v234, v231, true, v224.props.avatarRoute, v224.props.navigation, v224.props.widgetAnalyticsInfo);
            elseif not v224.props.externalNavigationRequestParams.wasItemEquipped then
                local l_v231_0 = v231 --[[ copy: 7 -> 17 ]];
                local l_v232_0 = v232 --[[ copy: 8 -> 18 ]];
                v224.props.fetchItemData(v224.props.networking, v224.props.catalogAnalytics, v231, v232):catch(function() --[[ Line: 972 ]]
                    -- upvalues: v224 (copy), l_v231_0 (copy), l_v232_0 (copy), v48 (ref), v230 (ref)
                    v224.props.handleDeepLinkEquipError(l_v231_0, l_v232_0);
                    v48.removeDeepLinkEntries(v230);
                end);
            end;
        end;
        if v224.props.externalNavigationRequestParams.wasItemEquipped then
            local l_tryOnItems_0 = v224.props.tryOnItems;
            local v238 = if l_FFlagAXFixCatalogRefreshRendering_0 and v224.props.categoryInfo then v224.props.categoryInfo else nil;
            local v239 = v224.props.searchParameters and v224.props.searchParameters.categoryInfo or v238 or {};
            v48.addEquippedItemToCatalogEntries(v224.props.externalNavigationRequestParams, l_tryOnItems_0, v239, v230);
        end;
    end;
    if not v230 then
        v224:setState({
            entries = v5.None
        });
        return;
    else
        local l_tryOnItems_1 = v224.props.tryOnItems;
        if v225 and not v20.isEmpty(l_tryOnItems_1) and (not l_FFlagAXMoveAllTabToWidgetOnly_0 or not v229) and (not v111 or v224.props.tryOnLookId == nil) then
            local v241 = v224.props.searchParameters and v224.props.searchParameters.categoryInfo or {};
            local v242 = {};
            local v243 = 0;
            if v241.AssetTypeIdStrings then
                for _, v245 in v241.AssetTypeIdStrings do
                    v242 = v20.Dictionary.join(v242, {
                        [v245] = v46.ItemType.Asset
                    });
                end;
                v243 = v243 + #v241.AssetTypeIdStrings;
            end;
            if v241.BundleTypes then
                for _, v247 in v241.BundleTypes do
                    v242 = v20.Dictionary.join(v242, {
                        [v247] = v46.ItemType.Bundle
                    });
                end;
                v243 = v243 + #v241.BundleTypes;
            end;
            local v248 = table.create(#v230);
            if v243 > 0 then
                for _, v250 in l_tryOnItems_1 do
                    if (not l_FFlagAXMISEnableMultiShopping_0 or not v250.lookId) and v250.itemSubType and v242[v250.itemSubType] == v250.itemType then
                        table.insert(v248, {
                            id = tostring(v250.itemId), 
                            type = tostring(v250.itemType), 
                            encryptedAdTrackingData = nil
                        });
                    end;
                end;
            end;
            for _, v252 in v230 do
                if not l_tryOnItems_1[l_getTryOnItemReducerKey_0(v252.id, v252.type)] then
                    table.insert(v248, v252);
                end;
            end;
            v224:setState({
                entries = v248
            });
        elseif not v20.List.equals(v224.state.entries, v230) then
            v224:setState({
                entries = v230
            });
        end;
        return;
    end;
end;
v96.didMount = function(v253) --[[ Line: 1073 ]] --[[ Name: didMount ]]
    v253:updateItems(true);
end;
v96.didUpdate = function(v254, v255, v256) --[[ Line: 1078 ]] --[[ Name: didUpdate ]]
    -- upvalues: v39 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v20 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_AvatarScreen_0 (copy), v86 (copy)
    local v257 = v254.props.searchUuid ~= v255.searchUuid;
    if v254.props.fromSearch then
        v257 = v257 or v255.categoryInfo ~= v254.props.categoryInfo or not v254.props.searchInCatalog;
    end;
    if v257 and v254.state.restorePreviousChildFocus ~= false then
        v254:setState({
            restorePreviousChildFocus = false
        });
    end;
    if v257 or v254.state.numItemsPerRow ~= v256.numItemsPerRow then
        v254.requestImpressionsSignal:fire();
    end;
    local v258 = false;
    if v254.props.dataStatus == v39.Done then
        v258 = v255.dataStatus ~= v39.Done;
    end;
    local v259 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v254.props.hasProcessedMarketplaceFetcher else nil;
    local v260 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v254.props.shouldPageUseWidgetOnly else false;
    local v261 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v260 and v259 else nil;
    local l_searchInCatalog_3 = v254.props.searchInCatalog;
    local v263 = l_searchInCatalog_3 and l_searchInCatalog_3.items or nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 and v261 and not v263 then
        v263 = {};
    end;
    if l_FFlagAXFixCatalogRefreshRendering_0 then
        local v264 = false;
        if v254.props.externalNavigationRequestParams and v255.externalNavigationRequestParams then
            v264 = v254.props.externalNavigationRequestParams.wasItemEquipped ~= v255.externalNavigationRequestParams.wasItemEquipped;
        elseif v254.props.externalNavigationRequestParams ~= v255.externalNavigationRequestParams then
            v264 = true;
        end;
        local v265 = v254.props.itemInfos ~= v255.itemInfos;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v266 = not v20.List.equals(v254.state.entries, v263);
            local v267 = v255.hasProcessedMarketplaceFetcher ~= v254.props.hasProcessedMarketplaceFetcher;
            local v268 = v257 or v258;
            if v264 or v265 or v268 and v266 or v267 and v266 then
                v254:updateItems(v257);
            end;
        elseif v264 or v265 or (v257 or v258) and not v20.List.equals(v254.state.entries, v263) then
            v254:updateItems(v257);
        end;
    else
        v254:updateItems(v257);
    end;
    if v254.props.dataStatus == v39.Done and v255.dataStatus == v39.Fetching and v254.retryLoadMore then
        v254.retryLoadMore = false;
        v254.loadMore();
    end;
    if v254.shouldScrollBackToTopOfList({
        searchChanged = v257, 
        oldSortsAndFilter = v255.sortAndFilters, 
        newSortsAndFilter = v254.props.sortAndFilters
    }) and v254.widgetFlatListRef and v254.widgetFlatListRef.current then
        v254.widgetFlatListRef.current:scrollToOffset({
            offset = 0, 
            animated = false
        });
    end;
    local v269 = v254.props.dataStatus == v39.Failed;
    local l_entries_1 = v254.state.entries;
    local v271 = l_entries_1 and #l_entries_1 ~= 0;
    v269 = v269 and not v271;
    if l_FFlagAXCatalogCategoriesSDUI_0 and v254.props.isFetchingMarketplaceError then
        v269 = v254.props.isFetchingMarketplaceError;
    elseif l_FFlagAXMoveAllTabToWidgetOnly_0 and v254.props.shouldPageUseWidgetOnly then
        v269 = v254.props.isFetchingMarketplaceError;
    end;
    if v269 ~= v256.showFailedState and v269 ~= v254.state.showFailedState then
        v254:setState({
            showFailedState = v269
        });
        if v269 then
            local l_catalogAnalytics_1 = v254.props.catalogAnalytics;
            if v254.props.navigation.state.routeName == l_AvatarScreen_0.CatalogSearch then
                l_catalogAnalytics_1.sendAXCounter(v86.Counter.Errors.NoInternetConnectionErrorSearchView);
                return;
            else
                l_catalogAnalytics_1.sendAXCounter(v86.Counter.Errors.NoInternetConnectionErrorCatalogView);
            end;
        end;
    end;
end;
v96 = v59((v45((v7.connect(function(v273, v274) --[[ Line: 1230 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v47 (copy), v64 (copy), v20 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), l_PerformFetch_0 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), v61 (copy), l_AvatarScreen_0 (copy), v62 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v111 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy)
    local l_searchUuid_1 = v274.searchUuid;
    local l_categoryInfo_0 = v274.categoryInfo;
    local v277 = v47.getSearchKey(v273, l_searchUuid_1);
    local v278 = false;
    local v279 = nil;
    local l_fromSearch_0 = v274.fromSearch;
    if l_searchUuid_1 and l_fromSearch_0 then
        local v281 = v273.SearchesParameters[l_searchUuid_1];
        local v282 = v64.getQueryStringForSearchWidgets(v281);
        local v283 = v273.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v282];
        if v283 then
            local l_Details_0 = v283.Details;
            local v285 = false;
            if typeof(l_Details_0) == "table" then
                v285 = next(l_Details_0) ~= nil;
            end;
            v278 = v285 and (v20.isEmpty(l_categoryInfo_0) or l_categoryInfo_0.ShowWidgets) or false;
        end;
        local v286 = nil;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v287 = l_getAXMarketplaceWidgetStore_0(false).getDebouncedScreenSize(false);
            v286 = v64.getFetchWidgetInfoFetchKey(v282, nil, v287);
        else
            v286 = v64.getFetchWidgetInfoFetchKey(v282);
        end;
        v279 = l_PerformFetch_0.GetStatus(v273, v286);
    elseif l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and l_categoryInfo_0 and v274.shouldPageUseWidgetOnly then
        local l_WidgetContext_0 = l_categoryInfo_0.WidgetContext;
        if l_WidgetContext_0 then
            local v289 = v273.AvatarExperience.Common.Widgets.ContextWidgetInfo[l_WidgetContext_0];
            if v289 then
                local v290 = false;
                if typeof(v289.Details) == "table" then
                    v290 = next(v289.Details) ~= nil;
                end;
                v278 = v290;
            end;
        end;
    end;
    local v291 = v273.AvatarExperience.ExternalNavigationRequest.params or {};
    return {
        fullView = v61(v273, l_AvatarScreen_0.Catalog), 
        searchParameters = v273.SearchesParameters[v274.searchUuid], 
        sortAndFilters = v273.AvatarExperience.Catalog.SortAndFilters, 
        filterCount = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v62(v273) else nil, 
        selectedCategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v273.AvatarExperience.Catalog.Categories.categoryId else nil, 
        selectedSubcategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v273.AvatarExperience.Catalog.Categories.subcategoryId else nil, 
        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v273.AvatarExperience.Catalog.SearchCategories then v273.AvatarExperience.Catalog.SearchCategories.categoryId else nil, 
        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v273.AvatarExperience.Catalog.SearchCategories then v273.AvatarExperience.Catalog.SearchCategories.subcategoryId else nil, 
        searchInCatalog = v273.Search.SearchesInCatalog[v274.searchUuid], 
        dataStatus = l_PerformFetch_0.GetStatus(v273, v277), 
        tryOnItems = v273.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        tryOnLookId = if v111 then v273.AvatarExperience.AvatarScene.OutfitTryOn.LookId else nil, 
        focusedWidget = v273.AvatarExperience.Catalog.ResultsList[v274.searchUuid] and v273.AvatarExperience.Catalog.ResultsList[v274.searchUuid].focusedWidget or {}, 
        hideTopBar = v273.AvatarExperience.Catalog.ResultsList[v274.searchUuid] and v273.AvatarExperience.Catalog.ResultsList[v274.searchUuid].hideTopBar or false, 
        widgetRequestId = v273.AvatarExperience.Common.Widgets.WidgetInfo.RequestId, 
        widgetDataStatus = v279, 
        hasWidgets = v278, 
        externalNavigationRequestParams = v291, 
        itemInfos = if not l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then {
            AssetInfos = v273.AvatarExperience.Common.AssetInfos, 
            BundleInfos = v273.AvatarExperience.Common.BundleInfos
        } else nil, 
        analyticsMetadata = v273.AvatarExperience.AnalyticsMetadata
    };
end, function(v292) --[[ Line: 1322 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v57 (copy), v54 (copy), v81 (copy), v82 (copy), v87 (copy), v34 (copy), v55 (copy), v56 (copy), v83 (copy), v10 (copy), v84 (copy)
    local function v298(_, v294, v295, v296, v297) --[[ Line: 1323 ]]
        -- upvalues: v292 (copy), v57 (ref), v54 (ref)
        return v292(v57(v54({
            searchKeyword = v294, 
            searchUuid = v295, 
            categoryInfo = v296
        }, v297)));
    end;
    local function v307(v299, v300, v301, v302, v303, v304, v305, v306) --[[ Line: 1330 ]]
        -- upvalues: v292 (copy), v81 (ref)
        return v292(v81(v299, v300, v301, v302, v303, v304, v305, v306));
    end;
    v307 = function(v308, v309, v310) --[[ Line: 1354 ]]
        -- upvalues: v292 (copy), v81 (ref)
        return v292(v81(v308, v309, v310));
    end;
    local function v312(v311) --[[ Line: 1358 ]]
        -- upvalues: v292 (copy), v82 (ref)
        return v292(v82(v311));
    end;
    local v314 = v87() and function(v313) --[[ Line: 1362 ]]
        -- upvalues: v292 (copy), v34 (ref)
        return v292(v34.StartTracking(v313));
    end or nil;
    local function v319(v315, v316, v317, v318) --[[ Line: 1367 ]]
        -- upvalues: v292 (copy), v55 (ref)
        return v292(v55(v315, v316, v317, v318));
    end;
    local function v329(v320, v321, v322, v323, v324, v325, v326, v327, v328) --[[ Line: 1371 ]]
        -- upvalues: v292 (copy), v56 (ref), v83 (ref)
        v292(v56(v320, v321, v322, v323, v324, v325, v326, v327, v328, true));
        v292(v83({
            itemId = v324, 
            itemType = v322, 
            wasItemEquipped = true, 
            fetchItemFailed = false
        }));
    end;
    local function v332(v330, v331) --[[ Line: 1404 ]]
        -- upvalues: v292 (copy), v10 (ref), v83 (ref), v84 (ref)
        v292(v10({
            toastMessage = "Feature.Avatar.Message.DeepLinkEquipFailed"
        }));
        v292(v83({
            itemId = v330, 
            itemType = v331, 
            wasItemEquipped = false, 
            fetchItemFailed = true
        }));
        v292(v84());
    end;
    return {
        dispatchLoadMore = v298, 
        dispatchSetResultsListFocusedWidget = v307, 
        dispatchClearResultsListFocusedWidget = v312, 
        dispatchCatalogTilesLatencyStartTracker = v314, 
        fetchItemData = v319, 
        handleDeepLinkEquipError = v332, 
        equipCatalogDeepLinkItem = v329
    };
end)(v96)))));
v96 = v22((l_withNavigation_0((l_RoactServices_0.connect({
    axAnalytics = v51, 
    catalogAnalytics = v52, 
    networking = v9
})(v96)))));
local function v336(v333) --[[ Line: 1443 ]] --[[ Name: selectItemInfos ]]
    local l_AssetInfos_0 = v333.AvatarExperience.Common.AssetInfos;
    local l_BundleInfos_0 = v333.AvatarExperience.Common.BundleInfos;
    return {
        AssetInfos = l_AssetInfos_0, 
        BundleInfos = l_BundleInfos_0
    };
end;
return function(v337) --[[ Line: 1489 ]] --[[ Name: ResultsListWrapper ]]
    -- upvalues: l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_useFocusGuiObject_0 (copy), l_useSelector_0 (copy), v6 (copy), v82 (copy), v94 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v28 (copy), l_useSignalState_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v29 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v72 (copy), l_getUseSelectorDeepEquals_0 (copy), v62 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy), v336 (copy), v43 (copy), v96 (ref)
    local v338 = table.clone(v337);
    if l_FFlagAXMigrateMainNavigationInputBindings_0 then
        local v339 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v339 = function(v340) --[[ Line: 1496 ]]
                return v340.AvatarExperience.Catalog.ResultsList;
            end;
        end;
        local v341 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v341 = l_useDispatch_0();
        end;
        local v342 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.useFocusController();
        local v343 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v344 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            local v345 = l_useSelector_0(v339);
            local v346 = v345[v337.searchUuid] and v345[v337.searchUuid].focusedWidget;
            v344 = if v346 then v346.active else false;
        end;
        local l_v343_0 = v343 --[[ copy: 5 -> 11 ]];
        local l_v342_0 = v342 --[[ copy: 4 -> 12 ]];
        do
            local l_v341_0, l_v344_0 = v341, v344;
            local v352 = v6.useCallback(function(v351) --[[ Line: 1515 ]]
                -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_v344_0 (ref), l_v341_0 (ref), v82 (ref), v337 (copy), l_v343_0 (copy), l_v342_0 (copy)
                v351.cancelled = true;
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if l_v344_0 then
                        l_v341_0(v82(v337.searchUuid));
                        if type(v337.onCloseFocusedWidget) == "function" then
                            v337.onCloseFocusedWidget();
                            return;
                        end;
                    elseif l_v343_0 and v337.NextSelectionUp and v337.NextSelectionUp.current then
                        l_v343_0(v337.NextSelectionUp.current);
                        return;
                    end;
                else
                    l_v342_0.moveFocusTo(v337.NextSelectionUp);
                end;
            end, {
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v343 else v342, 
                v337.NextSelectionUp, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v344_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v337.searchUuid else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v341_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v337.onCloseFocusedWidget else nil
            });
            v338.focusNavigationBindingsRef = v94({
                onNavigateBack = v352
            }, v337.frameRef);
        end;
    end;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v353 = l_useUnifiedEventImpressionsReporter_0();
        local l_v353_0 = v353 --[[ copy: 2 -> 10 ]];
        v338.tagBasedImpressionsDetectorExtensions = v6.useMemo(function() --[[ Line: 1547 ]]
            -- upvalues: l_v353_0 (copy)
            return {
                l_v353_0
            };
        end, {
            v353
        });
    end;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v355 = v28.getCatalogSelectionStore();
        local v356 = l_useSignalState_0(v355.selectedCategoryId);
        local v357 = l_useSignalState_0(v355.selectedSubcategoryId);
        v338.selectedCategoryId = v356;
        v338.selectedSubcategoryId = v357;
        local v358 = v28.getCatalogSearchSelectionStore();
        local v359 = l_useSignalState_0(v358.selectedCategoryId);
        local v360 = l_useSignalState_0(v358.selectedSubcategoryId);
        v338.selectedSearchCategoryId = v359;
        v338.selectedSearchSubcategoryId = v360;
        local v361 = l_useSignalState_0(v355.selectedCategory);
        v338.selectedCategory = v361;
        local v362 = l_useSignalState_0(v358.selectedCategory);
        v338.selectedSearchCategory = v362;
        v338.categoryInfo = if v337.fromSearch then v362 else v361;
    end;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v363 = l_useAnimatedVisibility_0();
        v338.visibilityRatioBinding = if v363 then v29.useSignalBinding(v363.animatedMenusStore.getVisibilityRatio) else v6.createBinding(1);
    end;
    if l_FFlagAXCatalogCategoriesSDUI_0 or l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v364 = v72.getFetchMarketplaceStore(false);
        local v365 = l_useSignalState_0(v364.getFetchingMarketplaceError);
        local v366 = if l_FFlagAXCatalogCategoriesSDUI_0 then l_useSignalState_0(v364.getCatalogCategoriesError) else nil;
        v338.isFetchingMarketplaceError = v365;
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            v338.isFetchingMarketplaceError = v365 or v366;
        end;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            v338.hasProcessedMarketplaceFetcher = l_useSignalState_0(v364.getFetchingMarketplaceProcessed);
            local v368 = v6.useCallback(function(v367) --[[ Line: 1610 ]]
                -- upvalues: v337 (copy)
                return v367.SearchesParameters[v337.searchUuid];
            end, {
                v337.searchUuid
            });
            local v369 = l_useSelector_0(v368, l_getUseSelectorDeepEquals_0());
            local v370 = l_useSelector_0(v62);
            v338.shouldPageUseWidgetOnly = l_getShouldPageUseWidgetOnlyFetcher_0(v338.categoryInfo, v370, v369 and v369.searchKeyword);
        end;
    end;
    if l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then
        v338.itemInfos = l_useSelector_0(v336, v43.shallowEqual);
    end;
    return v6.createElement(v96, v338);
end;