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
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v23 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_withAdaptiveScrolling_0 = v23.Hooks.withAdaptiveScrolling;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_getTryOnItemReducerKey_0 = v23.Utils.getTryOnItemReducerKey;
local l_FFlagAXCatalogCategoriesStore_0 = v22.FFlagAXCatalogCategoriesStore;
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
local l_useAvatarRoute_0 = v36.AvatarRoute.Hooks.useAvatarRoute;
local v40 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v44 = require(l_CorePackages_0.Packages.tutils);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v47 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v48 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v49 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v50 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v51 = require(l_Modules_0.LuaApp.Constants);
local v52 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v53 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v54 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v55 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v56 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v57 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v58 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v59 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local v60 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v61 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList);
local v62 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v63 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_getUseSelectorDeepEquals_0 = v23.Utils.getUseSelectorDeepEquals;
local l_CatalogSduiFeedEntryPoint_0 = v25.Components.CatalogSduiFeedEntryPoint;
local v66 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v68 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v69 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsListTopPanel);
local v70 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.CatalogResultListNavigation.CatalogResultListNavigationContainer);
local l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 = v22.FFlagAXMigrateCatalogResultListNavigationToMVVM;
local v72 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsListListHeader);
local l_WidgetConstants_0 = v25.WidgetConstants;
local v74 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Stores);
local l_AvatarExperienceScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector;
local l_CatalogCategories_0 = v23.Enums.CatalogCategories;
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local l_useUnifiedEventImpressionsReporter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter;
local l_sendUnifiedEventLog_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLog;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_useAnimatedVisibility_0 = v23.Stores.AnimatedVisibilityStore.useAnimatedVisibility;
local l_getShouldPageUseWidgetOnlyFetcher_0 = v25.Utils.getShouldPageUseWidgetOnlyFetcher;
local l_getAXMarketplaceWidgetStore_0 = v25.Stores.getAXMarketplaceWidgetStore;
local l_CartIdService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService;
local v85 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v86 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget);
local v87 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget);
local v88 = require(l_Modules_0.AvatarExperience.Catalog.Actions.EquippedDeepLinkCatalogItem);
local v89 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v90 = game:DefineFastFlag("AXFixResultListCrash", false);
local v91 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v92 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v93 = game:DefineFastFlag("AXFixFlashingNoItemsFound", false);
local l_FFlagAXMISEnableMultiShopping_0 = v22.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v22.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXMigrateMainNavigationInputBindings_0 = v22.FFlagAXMigrateMainNavigationInputBindings;
local l_FFlagAXItemDetailsIxpExposure_0 = v22.FFlagAXItemDetailsIxpExposure;
local v98 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v100 = require(script.Parent.useResultsListFocusNavigationBindings);
local l_FFlagAXFixCatalogRefreshRendering_0 = v22.FFlagAXFixCatalogRefreshRendering;
local l_FFlagUpdateNoInternetConnectionText_0 = v22.FFlagUpdateNoInternetConnectionText;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXAdaptiveScrollingFixForward_0 = v22.FFlagAXAdaptiveScrollingFixForward;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v22.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXHandleLooksWidgetCategories_0 = v22.FFlagAXHandleLooksWidgetCategories;
local l_FFlagAXLooksWidgetContextForOrganicContent_0 = v22.FFlagAXLooksWidgetContextForOrganicContent;
local v108 = l_FFlagAXCatalogCategoriesStore_0 and game:DefineFastFlag("AXHidePillBarCheckSubcategory", false);
local l_FFlagAXHideMenuOnScroll_0 = v22.FFlagAXHideMenuOnScroll;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v22.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXCatalogCategoriesSDUI_0 = v22.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXReduceResultsListRerendersOnItemInfos_0 = v22.FFlagAXReduceResultsListRerendersOnItemInfos;
local l_FFlagAXEnableTTIViaModule_0 = v22.FFlagAXEnableTTIViaModule;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v22.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v116 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance);
local l_TTIPerformanceManager_0 = v116.TTIPerformanceManager;
local l_OrganicTTIMilestoneManager_0 = v116.OrganicTTIMilestoneManager;
local l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 = v22.FFlagAXFixWidgetOnlyTabNoItemsFound;
local l_FFlagAXShowCategoriesWhenNetworkFails_0 = v22.FFlagAXShowCategoriesWhenNetworkFails;
local l_FFlagAXMigrateAllTabToSduiDev_0 = v22.FFlagAXMigrateAllTabToSduiDev;
local v122 = game:DefineFastFlag("AXSkipTryOnHoistForLooks", false);
local function v124(v123) --[[ Line: 168 ]] --[[ Name: getTopMenuHeight ]]
    return UDim2.fromOffset(0, v123);
end;
local function v126(v125) --[[ Line: 172 ]] --[[ Name: getFeedSize ]]
    return UDim2.new(1, 0, 1, -v125);
end;
local v127 = v5.PureComponent:extend("ResultsList");
v127.defaultProps = {
    navBarSizeY = 0
};
v127.validateProps = v17.strictInterface({
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
    tryOnLookId = if v122 then v17.optional(v17.string) else nil, 
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
    selectedSearchSubcategory = if v108 then v17.optional(v17.table) else nil, 
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
    dispatchCatalogTilesLatencyStartTracker = if v92() then v17.callback else nil, 
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
    shouldPageUseWidgetOnly = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v17.boolean else nil, 
    showSduiResults = if l_FFlagAXMigrateAllTabToSduiDev_0 then v17.boolean else nil, 
    context = if l_FFlagAXMigrateAllTabToSduiDev_0 then v17.optional(v17.string) else nil
});
v127.init = function(v128) --[[ Line: 278 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_Signal_0 (copy), v40 (copy), v15 (copy), v90 (copy), v21 (copy), v68 (copy), v92 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_OrganicTTIMilestoneManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v91 (copy)
    v128.state = {
        restorePreviousChildFocus = true, 
        numItemsPerRow = 0, 
        navBarSizeY = 0, 
        showFailedState = false
    };
    v128.lastYPosition = 0;
    v128.scrollingFrameRef = v128.props.scrollingFrameRef or v5.createRef();
    v128.navBarRef = v5.createRef();
    v128.topPanelRef = v5.createRef();
    v128.gridRef = v5.createRef();
    v128.pillBarRef = v5.createRef();
    v128.emptyStateRef = v5.createRef();
    v128.widgetFlatListRef = v5.createRef();
    local v129 = nil;
    local v130 = nil;
    v128.topPanelHeightBinding = v129;
    v128.updateTopPanelHeightBinding = v130;
    v129, v130 = v5.createBinding(0);
    v128.topPanelHeightBinding = v129;
    v128.updateTopPanelHeightBinding = v130;
    v128.impressionsReported = {};
    v128.itemDetailsPeekViewRefs = v128.props.itemDetailsPeekViewRefs;
    v128.onNumItemsPerRowChanged = function(v131) --[[ Line: 302 ]]
        -- upvalues: v128 (copy)
        v128:setState({
            numItemsPerRow = v131
        });
    end;
    v128.onNavBarSizeChanged = function(v132) --[[ Line: 308 ]]
        -- upvalues: v128 (copy)
        if v132.Y ~= v128.state.navBarSizeY then
            v128:setState({
                navBarSizeY = v132.Y
            });
        end;
    end;
    v128.requestImpressionsSignal = l_Signal_0.new();
    v128.onItemsListScroll = function(v133) --[[ Line: 318 ]]
        -- upvalues: v128 (copy)
        v128.requestImpressionsSignal:fire();
        local v134 = v128.props.adaptiveScrolling or {};
        if v134.onCanvasYChanged then
            v134.onCanvasYChanged(v133);
        end;
    end;
    v128.loadMore = function() --[[ Line: 327 ]]
        -- upvalues: v128 (copy), v40 (ref), v15 (ref), v90 (ref), v21 (ref)
        if v128.props.dataStatus == v40.Fetching then
            v128.retryLoadMore = true;
            return v15.resolve("Currently fetching");
        else
            local l_catalogAnalytics_0 = v128.props.catalogAnalytics;
            local l_searchUuid_0 = v128.props.searchUuid;
            local l_searchInCatalog_0 = v128.props.searchInCatalog;
            local l_searchParameters_0 = v128.props.searchParameters;
            local l_dispatchLoadMore_0 = v128.props.dispatchLoadMore;
            if v90 and not l_searchInCatalog_0 then
                l_searchInCatalog_0 = {};
                v21(string.format("ResultsList: searchInCatalog is nil; searchUuid: %s", (tostring(l_searchUuid_0))));
            end;
            local v140 = l_searchParameters_0 and l_searchParameters_0.categoryInfo or nil;
            return l_dispatchLoadMore_0(l_catalogAnalytics_0, l_searchInCatalog_0.keyword, l_searchUuid_0, v140, v128.props.networking);
        end;
    end;
    v128.onFocusGained = function() --[[ Line: 359 ]]
        -- upvalues: v128 (copy)
        v128:setState({
            restorePreviousChildFocus = true
        });
    end;
    v128.scrollBackToTop = function() --[[ Line: 365 ]]
        -- upvalues: v128 (copy)
        local l_current_0 = v128.props.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
    v128.setFocusedWidget = function(v142) --[[ Line: 372 ]]
        -- upvalues: v128 (copy)
        local v143 = if v142 and v142.template then v142.template.title else nil;
        local v144 = if v142 and v142.template then v142.template.localizedTitle else "";
        local v145 = if v142 and v142.template then v142.template.localizedDescription else "";
        local v146 = if v142 and v142.template then v142.template.description else nil;
        local v147 = if v142 and v142.template then v142.template.tooltip else nil;
        local v148 = if v142 and v142.template then v142.template.localizedTooltip else "";
        local v149 = nil;
        v149 = {
            title = v143, 
            localizedTitle = v144, 
            description = v146, 
            localizedDescription = v145, 
            tooltip = v147, 
            localizedTooltip = v148
        };
        v128.props.dispatchSetResultsListFocusedWidget(v128.props.searchUuid, v142.id, v149);
    end;
    v128.clearFocusedWidget = function() --[[ Line: 397 ]]
        -- upvalues: v128 (copy)
        v128.props.dispatchClearResultsListFocusedWidget(v128.props.searchUuid);
    end;
    v128.shouldScrollBackToTopOfList = function(v150) --[[ Line: 401 ]]
        -- upvalues: v68 (ref)
        local l_searchChanged_0 = v150.searchChanged;
        local l_oldSortsAndFilter_0 = v150.oldSortsAndFilter;
        local l_newSortsAndFilter_0 = v150.newSortsAndFilter;
        return l_searchChanged_0 or not v68.areSortAndFiltersEqual(l_oldSortsAndFilter_0, l_newSortsAndFilter_0);
    end;
    if v92() then
        if l_FFlagAXEnableTTIViaModule_0 then
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_OrganicTTIMilestoneManager_0 then
                    l_OrganicTTIMilestoneManager_0.L2.primaryDataStarted();
                    l_OrganicTTIMilestoneManager_0.L3.networkFetch();
                end;
            else
                l_TimeToInteractiveTracker_0.trackStart(v91.Counter.PREFIX .. v91.Counter.Latency.Organic.Tiles);
                l_TimeToInteractiveTracker_0.trackStart(v91.Counter.PREFIX .. v91.Counter.Latency.Organic.Thumbnails);
                l_TimeToInteractiveTracker_0.trackStart(v91.Counter.PREFIX .. v91.Counter.Latency.Widget.Tiles);
                l_TimeToInteractiveTracker_0.trackStart(v91.Counter.PREFIX .. v91.Counter.Latency.Widget.Thumbnails);
            end;
        end;
        v128.props.dispatchCatalogTilesLatencyStartTracker(v128.props.searchUuid);
    end;
end;
v127.getNextSelectionRight = function(v154, v155, v156) --[[ Line: 442 ]] --[[ Name: getNextSelectionRight ]]
    -- upvalues: l_AvatarScreen_0 (copy), v20 (copy)
    local l_NextSelectionRight_0 = v154.props.NextSelectionRight;
    if v155 == l_AvatarScreen_0.ItemDetails and v156 then
        return v154.itemDetailsPeekViewRefs[v156];
    elseif v155 == l_AvatarScreen_0.LookDetails then
        return v154.props.namedRefs[l_AvatarScreen_0.LookDetails];
    else
        if v154.props.tryOnItems and not v20.isEmpty(v154.props.tryOnItems) and v155 ~= l_AvatarScreen_0.SortAndFilters and v154.props.multiTryOnBottomBarRef and v154.props.multiTryOnBottomBarRef:getValue() ~= nil then
            l_NextSelectionRight_0 = v154.props.multiTryOnBottomBarRef;
        end;
        return l_NextSelectionRight_0;
    end;
end;
v127.renderResultsList = function(v158, v159, v160) --[[ Line: 464 ]] --[[ Name: renderResultsList ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v40 (copy), v54 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), l_AvatarScreen_0 (copy), v51 (copy), v93 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v66 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_CatalogCategories_0 (copy), l_FFlagAXHandleLooksWidgetCategories_0 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_withLocalization_0 (copy), l_ImpressionEnums_0 (copy), v5 (copy), v98 (copy), v85 (copy), v92 (copy), l_AvatarExperienceScreenSizeImpressionsDetector_0 (copy), l_WidgetConstants_0 (copy), l_IXPService_0 (copy), l_CollectionService_0 (copy), v108 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v8 (copy), v59 (copy), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (copy), v70 (copy), v69 (copy), l_FFlagAXMigrateAllTabToSduiDev_0 (copy), v6 (copy), l_CatalogSduiFeedEntryPoint_0 (copy), v126 (copy), v124 (copy), l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_EmptyState_0 (copy), v61 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), v72 (copy), l_FitTextLabel_0 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local l_searchInCatalog_1 = v158.props.searchInCatalog;
    local l_dataStatus_0 = v158.props.dataStatus;
    local v163 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v158.props.shouldPageUseWidgetOnly else nil;
    local v164 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v163 and v158.props.hasProcessedMarketplaceFetcher else nil;
    local l_key_0 = v158.props.navigation.state.key;
    local l_avatarRoute_0 = v158.props.avatarRoute;
    local l_name_0 = l_avatarRoute_0.current.name;
    local l_key_1 = l_avatarRoute_0.current.key;
    local l_entries_0 = v158.state.entries;
    local v170 = l_entries_0 and #l_entries_0 ~= 0;
    local l_hasWidgets_0 = v158.props.hasWidgets;
    local l_widgetDataStatus_0 = v158.props.widgetDataStatus;
    local v173 = false;
    if l_dataStatus_0 == v40.Done then
        v173 = not l_widgetDataStatus_0 or l_widgetDataStatus_0 == v40.Done;
    end;
    local v174 = l_entries_0 and #l_entries_0 or v54.PageFetchLimit;
    local v175 = not v173 or v170 or v158.props.hasWidgets or l_FFlagAXMoveAllTabToWidgetOnly_0 and v164 and v158.props.hasProcessedMarketplaceFetcher;
    local v176 = nil;
    if l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 then
        if v164 then
            v173 = v158.props.hasProcessedMarketplaceFetcher;
        end;
        v176 = v164 and v158.props.hasProcessedMarketplaceFetcher and l_hasWidgets_0;
        v175 = not v173 or v170 or v158.props.hasWidgets or v176;
    end;
    local v177 = l_searchInCatalog_1 and l_searchInCatalog_1.hasMoreEntries or nil;
    local v178 = v170 and v177;
    local v179 = v170 and not v178 or l_FFlagAXMoveAllTabToWidgetOnly_0 and v164 or l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and v176;
    local l_Font_0 = v159.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v182 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local l_Theme_0 = v159.Theme;
    local l_Color_0 = l_Theme_0.TextMuted.Color;
    local l_Transparency_0 = l_Theme_0.TextMuted.Transparency;
    local v186 = false;
    if l_name_0 ~= l_AvatarScreen_0.ItemDetails then
        v186 = v160 ~= nil;
    end;
    local v187 = nil;
    local v188 = v51.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v189 = not v175 and not l_hasWidgets_0;
    if v93 and (not l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 or not v164) then
        v189 = v189 and l_entries_0 and #l_entries_0 == 0;
    end;
    local v190 = nil;
    local v191 = nil;
    local v192 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v191 = v158.props.selectedCategory;
        v192 = v158.props.selectedSearchCategory;
    else
        v191 = v66.getCategoryId(v158.props.selectedCategoryId);
        v192 = v66.getCategoryId(v158.props.selectedSearchCategoryId);
    end;
    local v193 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v191.Id == l_CatalogCategories_0.Avatars:rawValue() else v191.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog;
    local v194 = (if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v192.Id == l_CatalogCategories_0.Avatars:rawValue() else v192.NavigationKey == l_CatalogCategories_0.Avatars) and l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch;
    local v195 = nil;
    local v196 = nil;
    if l_FFlagAXHandleLooksWidgetCategories_0 then
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.Catalog then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v191.LooksWidgetContextForOrganicContent ~= nil then
                    v195 = true;
                end;
            elseif v191.ShowLooksAsOrganicContent ~= nil then
                v195 = true;
            end;
        end;
        if l_avatarRoute_0.opaque.name == l_AvatarScreen_0.CatalogSearch then
            if l_FFlagAXLooksWidgetContextForOrganicContent_0 then
                if v192.LooksWidgetContextForOrganicContent ~= nil then
                    v196 = true;
                end;
            elseif v192.ShowLooksAsOrganicContent ~= nil then
                v196 = true;
            end;
        end;
    end;
    if (l_FFlagAXHandleLooksWidgetCategories_0 and (v195 or v196) or not l_FFlagAXHandleLooksWidgetCategories_0 and (v193 or v194)) and l_entries_0 and #l_entries_0 == 0 and v177 then
        v190 = true;
        v189 = false;
        v174 = 0;
    end;
    local l_active_0 = v158.props.focusedWidget.active;
    local l_title_0 = v158.props.focusedWidget.title;
    local l_id_0 = v158.props.focusedWidget.id;
    local v200 = if l_active_0 then l_title_0 else nil;
    local v201 = {};
    v179 = v179 or l_active_0;
    return l_withLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound", 
        focusedWidgetTitle = if v200 ~= "" then v200 else nil, 
        emptyText = "Feature.DisplayName.ErrorMessage.SomethingWentWrong"
    })(function(v202) --[[ Line: 612 ]]
        -- upvalues: v158 (copy), l_name_0 (copy), l_key_1 (copy), l_ImpressionEnums_0 (ref), v187 (ref), v5 (ref), v98 (ref), l_key_0 (copy), v85 (ref), v188 (copy), v92 (ref), l_AvatarExperienceScreenSizeImpressionsDetector_0 (ref), l_WidgetConstants_0 (ref), v201 (copy), l_IXPService_0 (ref), l_CollectionService_0 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), v66 (ref), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), l_CatalogCategories_0 (ref), l_FFlagAXHandleLooksWidgetCategories_0 (ref), v108 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), l_FFlagAXHideMenuOnScroll_0 (ref), l_Focusable_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v186 (copy), v8 (ref), v160 (copy), v59 (ref), l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 (ref), v70 (ref), v69 (ref), v170 (copy), l_FFlagAXMigrateAllTabToSduiDev_0 (ref), v6 (ref), l_CatalogSduiFeedEntryPoint_0 (ref), v126 (ref), v124 (ref), l_FFlagAXShowCategoriesWhenNetworkFails_0 (ref), l_EmptyState_0 (ref), v61 (ref), l_entries_0 (copy), v175 (ref), v178 (copy), v179 (ref), l_active_0 (copy), l_id_0 (copy), v174 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v72 (ref), v189 (ref), l_FitTextLabel_0 (ref), v159 (copy), v182 (copy), l_Color_0 (copy), l_Transparency_0 (copy), l_Font_1 (copy), v190 (ref), l_TagBasedImpressionsDetector_0 (ref)
        local v203 = v158:getNextSelectionRight(l_name_0, l_key_1);
        local v204 = if v158.props.fromSearch then l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH else l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE;
        v187 = v5.createElement(v98, {
            parentRef = v158.gridRef, 
            pageFilter = function() --[[ Line: 619 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v158.requestImpressionsSignal, 
            eventContext = v85(), 
            eventName = "marketplaceOrganicFELog", 
            requestId = v158.props.widgetRequestId, 
            impressionsTag = v188, 
            impressionsSchema = "defaultItem", 
            searchUuid = if v92() then v158.props.searchUuid else nil, 
            surface = v204, 
            analyticsMetadata = v158.props.analyticsMetadata
        });
        local v213 = v5.createElement(l_AvatarExperienceScreenSizeImpressionsDetector_0, {
            parentRef = v158.gridRef, 
            pageFilter = function() --[[ Line: 635 ]] --[[ Name: pageFilter ]]
                -- upvalues: l_key_0 (ref), l_key_1 (ref)
                return l_key_0 == l_key_1;
            end, 
            onRequestImpressionsSignal = v158.requestImpressionsSignal, 
            filterImpressionFunc = function(v205) --[[ Line: 639 ]] --[[ Name: filterImpressionFunc ]]
                -- upvalues: l_WidgetConstants_0 (ref), v201 (ref)
                local l_v205_Attribute_0 = v205:GetAttribute(l_WidgetConstants_0.WidgetExposureMetadata.AttributeKey);
                return l_v205_Attribute_0 and not v201[l_v205_Attribute_0];
            end, 
            onImpressionsDetected = function(v207) --[[ Line: 643 ]] --[[ Name: onImpressionsDetected ]]
                -- upvalues: l_WidgetConstants_0 (ref), v201 (ref), l_IXPService_0 (ref), v158 (ref)
                for _, v209 in v207 do
                    local l_v209_Attribute_0 = v209:GetAttribute(l_WidgetConstants_0.WidgetExposureMetadata.AttributeKey);
                    v201[l_v209_Attribute_0] = true;
                    l_IXPService_0:LogUserLayerExposure(l_v209_Attribute_0);
                    local l_impressionsReported_0 = v158.impressionsReported;
                    if not l_impressionsReported_0[v209.Name] then
                        v158.props.catalogAnalytics.widgetInteractionV2({}, l_WidgetConstants_0.ActionType.IMPRESSION);
                        l_impressionsReported_0[v209.Name] = true;
                    end;
                end;
            end, 
            collectObjectsFunc = function(_) --[[ Line: 658 ]] --[[ Name: collectObjectsFunc ]]
                -- upvalues: l_CollectionService_0 (ref), l_WidgetConstants_0 (ref)
                return l_CollectionService_0:GetTagged(l_WidgetConstants_0.WidgetExposureMetadata.TagName);
            end
        });
        local l_frameRef_0 = v158.props.frameRef;
        local l_backToTopSignal_0 = v158.props.backToTopSignal;
        local v216 = v158.props.adaptiveScrolling or {};
        local v217 = 0;
        if v158.props.multiTryOnBottomBarRef then
            local v218 = v158.props.multiTryOnBottomBarRef:getValue();
            v217 = if v218 then v218.AbsoluteSize.Y else 0;
        end;
        local l_routeName_0 = v158.props.navigation.state.routeName;
        local v220 = v158.props.namedRefs[l_routeName_0 .. "TopPanel"];
        local v221 = nil;
        v221 = if l_FFlagAXCatalogCategoriesStore_0 then v158.props.selectedSearchCategory else v66.getCategoryId(v158.props.selectedSearchCategoryId);
        local v222 = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v221.Id == l_CatalogCategories_0.Avatars:rawValue() else v221.NavigationKey == l_CatalogCategories_0.Avatars;
        if l_FFlagAXHandleLooksWidgetCategories_0 then
            if v108 then
                local v223 = if v158.props.selectedSearchSubcategory then v158.props.selectedSearchSubcategory else v221;
                v222 = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v223.LooksWidgetContextForOrganicContent ~= nil else v223.ShowLooksAsOrganicContent ~= nil;
            else
                v222 = if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v221.LooksWidgetContextForOrganicContent ~= nil else v221.ShowLooksAsOrganicContent ~= nil;
            end;
        end;
        local v226 = if l_FFlagAXHideMenuOnScroll_0 and v158.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v158.props.visibilityRatioBinding, 
            height = v158.topPanelHeightBinding
        }):map(function(v224) --[[ Line: 714 ]]
            local v225 = math.floor((1 - v224.visibility) * -v224.height);
            return UDim2.fromOffset(0, v225);
        end) else nil;
        local v229 = if l_FFlagAXHideMenuOnScroll_0 and v158.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v158.props.visibilityRatioBinding, 
            height = v158.topPanelHeightBinding
        }):map(function(v227) --[[ Line: 724 ]]
            local v228 = v227.height * v227.visibility;
            return UDim2.new(1, 0, 1, -v228);
        end) else nil;
        local v232 = if l_FFlagAXHideMenuOnScroll_0 and v158.props.visibilityRatioBinding then v5.joinBindings({
            visibility = v158.props.visibilityRatioBinding, 
            height = v158.topPanelHeightBinding
        }):map(function(v230) --[[ Line: 734 ]]
            local v231 = v230.height * v230.visibility;
            return UDim2.fromOffset(0, v231);
        end) else nil;
        return v5.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ClipsDescendants = true, 
            LayoutOrder = v158.props.layoutOrder, 
            [v5.Ref] = l_frameRef_0, 
            defaultChild = v158.topPanelRef, 
            NextSelectionUp = v158.props.NextSelectionUp, 
            restorePreviousChildFocus = v158.state.restorePreviousChildFocus, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v186 and {
                NavUp = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 753 ]]
                    -- upvalues: v160 (ref), v158 (ref)
                    v160.moveFocusTo(v158.props.NextSelectionUp);
                end)
            } or nil
        }, {
            BackToTopSignal = if l_backToTopSignal_0 then v5.createElement(v59, {
                signal = l_backToTopSignal_0, 
                callback = v158.scrollBackToTop
            }) else nil, 
            ScrollPanel = v5.createElement(l_FFlagAXMigrateMainNavigationInputBindings_0 and "Frame" or l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ClipsDescendants = true, 
                [v5.Ref] = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v158.props.focusNavigationBindingsRef else nil
            }, {
                TopPanel = v5.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ZIndex = 2, 
                    ref = v220, 
                    Position = if l_FFlagAXHideMenuOnScroll_0 then v226 else nil
                }, v5.createElement(if l_FFlagAXMigrateCatalogResultListNavigationToMVVM_0 then v70 else v69, {
                    fromSearch = v158.props.fromSearch, 
                    catalogAnalytics = v158.props.catalogAnalytics, 
                    axAnalytics = v158.props.axAnalytics, 
                    searchUuid = v158.props.searchUuid, 
                    searchInCatalog = v158.props.searchInCatalog, 
                    hideTopBar = v158.props.hideTopBar, 
                    focusedWidget = v158.props.focusedWidget, 
                    showCloseIcon = v158.props.showCloseIcon, 
                    restorePreviousChildFocus = v158.state.restorePreviousChildFocus, 
                    topPanelRef = v158.topPanelRef, 
                    gridRef = v158.gridRef, 
                    hasEntries = v170, 
                    backToTopSignal = v158.props.backToTopSignal, 
                    onCategoryOrSubcategoryChange = v158.props.onCategoryOrSubcategoryChange, 
                    onCategoryOrSubcategoryChangeById = v158.props.onCategoryOrSubcategoryChangeById, 
                    updateHeightBinding = v158.updateTopPanelHeightBinding, 
                    onCloseFocusedWidget = v158.props.onCloseFocusedWidget, 
                    hidePillBar = v222
                })), 
                ListFrame = v5.createElement("Frame", {
                    Size = l_FFlagAXHideMenuOnScroll_0 and v229 or v158.topPanelHeightBinding:map(function(v233) --[[ Line: 816 ]]
                        return UDim2.new(1, 0, 1, -v233);
                    end), 
                    Position = l_FFlagAXHideMenuOnScroll_0 and v232 or v158.topPanelHeightBinding:map(function(v234) --[[ Line: 821 ]]
                        return UDim2.fromOffset(0, v234);
                    end), 
                    BackgroundTransparency = 1
                }, if l_FFlagAXMigrateAllTabToSduiDev_0 and v158.props.showSduiResults then {
                    SduiResults = v6.createElement(l_CatalogSduiFeedEntryPoint_0, {
                        context = v158.props.context or "", 
                        Size = l_FFlagAXHideMenuOnScroll_0 and v229 or v158.topPanelHeightBinding:map(v126), 
                        Position = l_FFlagAXHideMenuOnScroll_0 and v232 or v158.topPanelHeightBinding:map(v124)
                    })
                } else if l_FFlagAXShowCategoriesWhenNetworkFails_0 and v158.state.showFailedState then {
                    EmptyState = v5.createElement(l_EmptyState_0, {
                        onActivated = v158.props.onRetry, 
                        text = v202.emptyText, 
                        [v5.Ref] = v158.emptyStateRef
                    })
                } else {
                    WidgetList = v5.createElement(v61.WidgetList, {
                        entries = l_entries_0, 
                        fromSearch = v158.props.fromSearch, 
                        bottomBarHeight = v217, 
                        showingEntries = v175, 
                        searchUuid = v158.props.searchUuid, 
                        loadMore = v178 and v158.loadMore or nil, 
                        hasMoreRows = v178, 
                        shouldCreateEndOfScrollElement = v179, 
                        itemDetailsPeekViewRefs = v158.itemDetailsPeekViewRefs, 
                        gridRef = v158.gridRef, 
                        flatListRef = v158.widgetFlatListRef, 
                        onScroll = v158.onItemsListScroll, 
                        focusedWidget = if l_active_0 then l_id_0 else nil, 
                        onWidgetFocusAcquired = v158.setFocusedWidget, 
                        onWidgetFocusReleased = v158.clearFocusedWidget, 
                        requestImpressionsSignal = v158.requestImpressionsSignal, 
                        onNumItemsPerRowChanged = v158.onNumItemsPerRowChanged, 
                        NextSelectionRight = v203, 
                        NextSelectionUp = v158.topPanelRef, 
                        restorePreviousChildFocus = v158.state.restorePreviousChildFocus, 
                        onFocusGained = not v158.state.restorePreviousChildFocus and v158.onFocusGained or nil, 
                        numItemsExpected = v174, 
                        scrollingEnabled = if v216.scrollingEnabledBinding then v216.scrollingEnabledBinding:map(function(v235) --[[ Line: 871 ]]
                            return v235;
                        end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v216.scrollingEnabled, 
                        selectedCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedCategoryIndex, 
                        selectedSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedSubcategoryIndex, 
                        selectedSearchCategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedSearchCategoryIndex, 
                        selectedSearchSubcategoryIndex = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedSearchSubcategoryIndex, 
                        selectedCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedCategoryId, 
                        selectedSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedSubcategoryId, 
                        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedSearchCategoryId, 
                        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else v158.props.selectedSearchSubcategoryId, 
                        listHeaderComponent = v5.createElement(v72), 
                        pillBarVisible = not v222
                    }), 
                    NoItemsFound = v189 and v5.createElement(l_FitTextLabel_0, {
                        width = UDim.new(1, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0, v159.Tokens.Global.Space_400), 
                        Text = v202.noItemsFound, 
                        TextSize = v182, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        Font = l_Font_1
                    }), 
                    AvatarsTabError = v190 and v5.createElement("Frame", {
                        LayoutOrder = v158.props.layoutOrder, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1
                    }, {
                        EmptyState = v5.createElement(l_EmptyState_0, {
                            onActivated = v158.loadMore, 
                            text = v202.emptyText, 
                            [v5.Ref] = v158.emptyStateRef
                        })
                    })
                })
            }), 
            ImpressionsReporter = v187, 
            WidgetImpressionsReporter = v213, 
            UnifiedImpressionsReporter = v5.createElement(l_TagBasedImpressionsDetector_0, {
                parentRef = v158.gridRef, 
                pageFilter = function() --[[ Line: 937 ]] --[[ Name: pageFilter ]]
                    -- upvalues: l_key_0 (ref), l_key_1 (ref)
                    return l_key_0 == l_key_1;
                end, 
                requestImpressionsSignal = v158.requestImpressionsSignal, 
                extensions = v158.props.tagBasedImpressionsDetectorExtensions
            })
        });
    end);
end;
v127.render = function(v236) --[[ Line: 947 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXShowCategoriesWhenNetworkFails_0 (copy), l_withLocalization_0 (copy), l_FFlagUpdateNoInternetConnectionText_0 (copy), v5 (copy), l_EmptyState_0 (copy), l_withStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy)
    local l_showFailedState_0 = v236.state.showFailedState;
    if not l_FFlagAXShowCategoriesWhenNetworkFails_0 and l_showFailedState_0 then
        return l_withLocalization_0({
            emptyText = l_FFlagUpdateNoInternetConnectionText_0 and "Feature.DisplayName.ErrorMessage.SomethingWentWrong" or "Feature.EmptyStatePage.Message.NoInternet"
        })(function(v238) --[[ Line: 955 ]]
            -- upvalues: v5 (ref), v236 (copy), l_EmptyState_0 (ref)
            return v5.createElement("Frame", {
                LayoutOrder = v236.props.layoutOrder, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                EmptyState = v5.createElement(l_EmptyState_0, {
                    onActivated = v236.props.onRetry, 
                    text = v238.emptyText, 
                    [v5.Ref] = v236.emptyStateRef
                })
            });
        end);
    else
        return l_withStyle_0(function(v239) --[[ Line: 971 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v236 (copy), v8 (ref)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                return v236:renderResultsList(v239);
            else
                return v8.withFocusController(function(v240) --[[ Line: 975 ]]
                    -- upvalues: v236 (ref), v239 (copy)
                    return v236:renderResultsList(v239, v240);
                end);
            end;
        end);
    end;
end;
v127.updateItems = function(v241, v242) --[[ Line: 988 ]] --[[ Name: updateItems ]]
    -- upvalues: l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v49 (copy), v50 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_sendUnifiedEventLog_0 (copy), l_CartIdService_0 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v5 (copy), v20 (copy), v122 (copy), v47 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_getTryOnItemReducerKey_0 (copy)
    local l_searchInCatalog_2 = v241.props.searchInCatalog;
    local v244 = l_searchInCatalog_2 and l_searchInCatalog_2.items or nil;
    local v245 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v241.props.shouldPageUseWidgetOnly else false;
    local v246 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v245 and v241.props.hasProcessedMarketplaceFetcher else nil;
    local v247 = nil;
    v247 = if l_FFlagAXMoveAllTabToWidgetOnly_0 and v246 then {} else v244;
    if v241.props.externalNavigationRequestParams then
        if v49.newValidEquipDeepLinkExists(v241.props.externalNavigationRequestParams) then
            local v248, v249 = v49.parseItemIdAndItemType(v241.props.externalNavigationRequestParams);
            local v250 = v50(v241.props.itemInfos, v248, v249);
            if v250 then
                local v251 = v49.parseItemSubType(v249, v250);
                if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                    local v252 = nil;
                    if v249 == "Asset" then
                        v252 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET;
                    elseif v249 == "Bundle" then
                        v252 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
                    end;
                    l_sendUnifiedEventLog_0({
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                        cartId = l_CartIdService_0.getCartId(), 
                        itemId = v248, 
                        itemType = v252, 
                        assetType = if v249 == "Asset" then v251 else nil, 
                        bundleType = if v249 == "Asset" then nil else v251, 
                        organicItemPrice = v250.priceInRobux
                    });
                end;
                v241.props.equipCatalogDeepLinkItem(v241.props.networking, v241.props.catalogAnalytics, v249, v251, v248, true, v241.props.avatarRoute, v241.props.navigation, v241.props.widgetAnalyticsInfo);
            elseif not v241.props.externalNavigationRequestParams.wasItemEquipped then
                local l_v248_0 = v248 --[[ copy: 7 -> 17 ]];
                local l_v249_0 = v249 --[[ copy: 8 -> 18 ]];
                v241.props.fetchItemData(v241.props.networking, v241.props.catalogAnalytics, v248, v249):catch(function() --[[ Line: 1046 ]]
                    -- upvalues: v241 (copy), l_v248_0 (copy), l_v249_0 (copy), v49 (ref), v247 (ref)
                    v241.props.handleDeepLinkEquipError(l_v248_0, l_v249_0);
                    v49.removeDeepLinkEntries(v247);
                end);
            end;
        end;
        if v241.props.externalNavigationRequestParams.wasItemEquipped then
            local l_tryOnItems_0 = v241.props.tryOnItems;
            local v256 = if l_FFlagAXFixCatalogRefreshRendering_0 and v241.props.categoryInfo then v241.props.categoryInfo else nil;
            local v257 = v241.props.searchParameters and v241.props.searchParameters.categoryInfo or v256 or {};
            v49.addEquippedItemToCatalogEntries(v241.props.externalNavigationRequestParams, l_tryOnItems_0, v257, v247);
        end;
    end;
    if not v247 then
        v241:setState({
            entries = v5.None
        });
        return;
    else
        local l_tryOnItems_1 = v241.props.tryOnItems;
        if v242 and not v20.isEmpty(l_tryOnItems_1) and (not l_FFlagAXMoveAllTabToWidgetOnly_0 or not v246) and (not v122 or v241.props.tryOnLookId == nil) then
            local v259 = v241.props.searchParameters and v241.props.searchParameters.categoryInfo or {};
            local v260 = {};
            local v261 = 0;
            if v259.AssetTypeIdStrings then
                for _, v263 in v259.AssetTypeIdStrings do
                    v260 = v20.Dictionary.join(v260, {
                        [v263] = v47.ItemType.Asset
                    });
                end;
                v261 = v261 + #v259.AssetTypeIdStrings;
            end;
            if v259.BundleTypes then
                for _, v265 in v259.BundleTypes do
                    v260 = v20.Dictionary.join(v260, {
                        [v265] = v47.ItemType.Bundle
                    });
                end;
                v261 = v261 + #v259.BundleTypes;
            end;
            local v266 = table.create(#v247);
            if v261 > 0 then
                for _, v268 in l_tryOnItems_1 do
                    if (not l_FFlagAXMISEnableMultiShopping_0 or not v268.lookId) and v268.itemSubType and v260[v268.itemSubType] == v268.itemType then
                        table.insert(v266, {
                            id = tostring(v268.itemId), 
                            type = tostring(v268.itemType), 
                            encryptedAdTrackingData = nil
                        });
                    end;
                end;
            end;
            for _, v270 in v247 do
                if not l_tryOnItems_1[l_getTryOnItemReducerKey_0(v270.id, v270.type)] then
                    table.insert(v266, v270);
                end;
            end;
            v241:setState({
                entries = v266
            });
        elseif not v20.List.equals(v241.state.entries, v247) then
            v241:setState({
                entries = v247
            });
        end;
        return;
    end;
end;
v127.didMount = function(v271) --[[ Line: 1147 ]] --[[ Name: didMount ]]
    v271:updateItems(true);
end;
v127.didUpdate = function(v272, v273, v274) --[[ Line: 1152 ]] --[[ Name: didUpdate ]]
    -- upvalues: v40 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXFixCatalogRefreshRendering_0 (copy), v20 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_AvatarScreen_0 (copy), v91 (copy)
    local v275 = v272.props.searchUuid ~= v273.searchUuid;
    if v272.props.fromSearch then
        v275 = v275 or v273.categoryInfo ~= v272.props.categoryInfo or not v272.props.searchInCatalog;
    end;
    if v275 and v272.state.restorePreviousChildFocus ~= false then
        v272:setState({
            restorePreviousChildFocus = false
        });
    end;
    if v275 or v272.state.numItemsPerRow ~= v274.numItemsPerRow then
        v272.requestImpressionsSignal:fire();
    end;
    local v276 = false;
    if v272.props.dataStatus == v40.Done then
        v276 = v273.dataStatus ~= v40.Done;
    end;
    local v277 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v272.props.hasProcessedMarketplaceFetcher else nil;
    local v278 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v272.props.shouldPageUseWidgetOnly else false;
    local v279 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v278 and v277 else nil;
    local l_searchInCatalog_3 = v272.props.searchInCatalog;
    local v281 = l_searchInCatalog_3 and l_searchInCatalog_3.items or nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 and v279 and not v281 then
        v281 = {};
    end;
    if l_FFlagAXFixCatalogRefreshRendering_0 then
        local v282 = false;
        if v272.props.externalNavigationRequestParams and v273.externalNavigationRequestParams then
            v282 = v272.props.externalNavigationRequestParams.wasItemEquipped ~= v273.externalNavigationRequestParams.wasItemEquipped;
        elseif v272.props.externalNavigationRequestParams ~= v273.externalNavigationRequestParams then
            v282 = true;
        end;
        local v283 = v272.props.itemInfos ~= v273.itemInfos;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v284 = not v20.List.equals(v272.state.entries, v281);
            local v285 = v273.hasProcessedMarketplaceFetcher ~= v272.props.hasProcessedMarketplaceFetcher;
            local v286 = v275 or v276;
            if v282 or v283 or v286 and v284 or v285 and v284 then
                v272:updateItems(v275);
            end;
        elseif v282 or v283 or (v275 or v276) and not v20.List.equals(v272.state.entries, v281) then
            v272:updateItems(v275);
        end;
    else
        v272:updateItems(v275);
    end;
    if v272.props.dataStatus == v40.Done and v273.dataStatus == v40.Fetching and v272.retryLoadMore then
        v272.retryLoadMore = false;
        v272.loadMore();
    end;
    if v272.shouldScrollBackToTopOfList({
        searchChanged = v275, 
        oldSortsAndFilter = v273.sortAndFilters, 
        newSortsAndFilter = v272.props.sortAndFilters
    }) and v272.widgetFlatListRef and v272.widgetFlatListRef.current then
        v272.widgetFlatListRef.current:scrollToOffset({
            offset = 0, 
            animated = false
        });
    end;
    local v287 = v272.props.dataStatus == v40.Failed;
    local l_entries_1 = v272.state.entries;
    local v289 = l_entries_1 and #l_entries_1 ~= 0;
    v287 = v287 and not v289;
    if l_FFlagAXCatalogCategoriesSDUI_0 and v272.props.isFetchingMarketplaceError then
        v287 = v272.props.isFetchingMarketplaceError;
    elseif l_FFlagAXMoveAllTabToWidgetOnly_0 and v272.props.shouldPageUseWidgetOnly then
        v287 = v272.props.isFetchingMarketplaceError;
    end;
    if v287 ~= v274.showFailedState and v287 ~= v272.state.showFailedState then
        v272:setState({
            showFailedState = v287
        });
        if v287 then
            local l_catalogAnalytics_1 = v272.props.catalogAnalytics;
            if v272.props.navigation.state.routeName == l_AvatarScreen_0.CatalogSearch then
                l_catalogAnalytics_1.sendAXCounter(v91.Counter.Errors.NoInternetConnectionErrorSearchView);
                return;
            else
                l_catalogAnalytics_1.sendAXCounter(v91.Counter.Errors.NoInternetConnectionErrorCatalogView);
            end;
        end;
    end;
end;
v127 = v60((v46((v7.connect(function(v291, v292) --[[ Line: 1304 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v48 (copy), v66 (copy), v20 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), l_PerformFetch_0 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), v62 (copy), l_AvatarScreen_0 (copy), v63 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v122 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy)
    local l_searchUuid_1 = v292.searchUuid;
    local l_categoryInfo_0 = v292.categoryInfo;
    local v295 = v48.getSearchKey(v291, l_searchUuid_1);
    local v296 = false;
    local v297 = nil;
    local l_fromSearch_0 = v292.fromSearch;
    if l_searchUuid_1 and l_fromSearch_0 then
        local v299 = v291.SearchesParameters[l_searchUuid_1];
        local v300 = v66.getQueryStringForSearchWidgets(v299);
        local v301 = v291.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v300];
        if v301 then
            local l_Details_0 = v301.Details;
            local v303 = false;
            if typeof(l_Details_0) == "table" then
                v303 = next(l_Details_0) ~= nil;
            end;
            v296 = v303 and (v20.isEmpty(l_categoryInfo_0) or l_categoryInfo_0.ShowWidgets) or false;
        end;
        local v304 = nil;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            local v305 = l_getAXMarketplaceWidgetStore_0(false).getDebouncedScreenSize(false);
            v304 = v66.getFetchWidgetInfoFetchKey(v300, nil, v305);
        else
            v304 = v66.getFetchWidgetInfoFetchKey(v300);
        end;
        v297 = l_PerformFetch_0.GetStatus(v291, v304);
    elseif l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 and l_categoryInfo_0 and v292.shouldPageUseWidgetOnly then
        local l_WidgetContext_0 = l_categoryInfo_0.WidgetContext;
        if l_WidgetContext_0 then
            local v307 = v291.AvatarExperience.Common.Widgets.ContextWidgetInfo[l_WidgetContext_0];
            if v307 then
                local v308 = false;
                if typeof(v307.Details) == "table" then
                    v308 = next(v307.Details) ~= nil;
                end;
                v296 = v308;
            end;
        end;
    end;
    local v309 = v291.AvatarExperience.ExternalNavigationRequest.params or {};
    return {
        fullView = v62(v291, l_AvatarScreen_0.Catalog), 
        searchParameters = v291.SearchesParameters[v292.searchUuid], 
        sortAndFilters = v291.AvatarExperience.Catalog.SortAndFilters, 
        filterCount = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v63(v291) else nil, 
        selectedCategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v291.AvatarExperience.Catalog.Categories.categoryId else nil, 
        selectedSubcategoryId = if not l_FFlagAXCatalogCategoriesStore_0 then v291.AvatarExperience.Catalog.Categories.subcategoryId else nil, 
        selectedSearchCategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v291.AvatarExperience.Catalog.SearchCategories then v291.AvatarExperience.Catalog.SearchCategories.categoryId else nil, 
        selectedSearchSubcategoryId = if l_FFlagAXCatalogCategoriesStore_0 then nil else if v291.AvatarExperience.Catalog.SearchCategories then v291.AvatarExperience.Catalog.SearchCategories.subcategoryId else nil, 
        searchInCatalog = v291.Search.SearchesInCatalog[v292.searchUuid], 
        dataStatus = l_PerformFetch_0.GetStatus(v291, v295), 
        tryOnItems = v291.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        tryOnLookId = if v122 then v291.AvatarExperience.AvatarScene.OutfitTryOn.LookId else nil, 
        focusedWidget = v291.AvatarExperience.Catalog.ResultsList[v292.searchUuid] and v291.AvatarExperience.Catalog.ResultsList[v292.searchUuid].focusedWidget or {}, 
        hideTopBar = v291.AvatarExperience.Catalog.ResultsList[v292.searchUuid] and v291.AvatarExperience.Catalog.ResultsList[v292.searchUuid].hideTopBar or false, 
        widgetRequestId = v291.AvatarExperience.Common.Widgets.WidgetInfo.RequestId, 
        widgetDataStatus = v297, 
        hasWidgets = v296, 
        externalNavigationRequestParams = v309, 
        itemInfos = if not l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then {
            AssetInfos = v291.AvatarExperience.Common.AssetInfos, 
            BundleInfos = v291.AvatarExperience.Common.BundleInfos
        } else nil, 
        analyticsMetadata = v291.AvatarExperience.AnalyticsMetadata
    };
end, function(v310) --[[ Line: 1396 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v58 (copy), v55 (copy), v86 (copy), v87 (copy), v92 (copy), v34 (copy), v56 (copy), v57 (copy), v88 (copy), v10 (copy), v89 (copy)
    local function v316(_, v312, v313, v314, v315) --[[ Line: 1397 ]]
        -- upvalues: v310 (copy), v58 (ref), v55 (ref)
        return v310(v58(v55({
            searchKeyword = v312, 
            searchUuid = v313, 
            categoryInfo = v314
        }, v315)));
    end;
    local function v325(v317, v318, v319, v320, v321, v322, v323, v324) --[[ Line: 1404 ]]
        -- upvalues: v310 (copy), v86 (ref)
        return v310(v86(v317, v318, v319, v320, v321, v322, v323, v324));
    end;
    v325 = function(v326, v327, v328) --[[ Line: 1428 ]]
        -- upvalues: v310 (copy), v86 (ref)
        return v310(v86(v326, v327, v328));
    end;
    local function v330(v329) --[[ Line: 1432 ]]
        -- upvalues: v310 (copy), v87 (ref)
        return v310(v87(v329));
    end;
    local v332 = v92() and function(v331) --[[ Line: 1436 ]]
        -- upvalues: v310 (copy), v34 (ref)
        return v310(v34.StartTracking(v331));
    end or nil;
    local function v337(v333, v334, v335, v336) --[[ Line: 1441 ]]
        -- upvalues: v310 (copy), v56 (ref)
        return v310(v56(v333, v334, v335, v336));
    end;
    local function v347(v338, v339, v340, v341, v342, v343, v344, v345, v346) --[[ Line: 1445 ]]
        -- upvalues: v310 (copy), v57 (ref), v88 (ref)
        v310(v57(v338, v339, v340, v341, v342, v343, v344, v345, v346, true));
        v310(v88({
            itemId = v342, 
            itemType = v340, 
            wasItemEquipped = true, 
            fetchItemFailed = false
        }));
    end;
    local function v350(v348, v349) --[[ Line: 1478 ]]
        -- upvalues: v310 (copy), v10 (ref), v88 (ref), v89 (ref)
        v310(v10({
            toastMessage = "Feature.Avatar.Message.DeepLinkEquipFailed"
        }));
        v310(v88({
            itemId = v348, 
            itemType = v349, 
            wasItemEquipped = false, 
            fetchItemFailed = true
        }));
        v310(v89());
    end;
    return {
        dispatchLoadMore = v316, 
        dispatchSetResultsListFocusedWidget = v325, 
        dispatchClearResultsListFocusedWidget = v330, 
        dispatchCatalogTilesLatencyStartTracker = v332, 
        fetchItemData = v337, 
        handleDeepLinkEquipError = v350, 
        equipCatalogDeepLinkItem = v347
    };
end)(v127)))));
v127 = l_withAdaptiveScrolling_0((l_withNavigation_0((l_RoactServices_0.connect({
    axAnalytics = v52, 
    catalogAnalytics = v53, 
    networking = v9
})(v127)))));
local function v354(v351) --[[ Line: 1516 ]] --[[ Name: selectItemInfos ]]
    local l_AssetInfos_0 = v351.AvatarExperience.Common.AssetInfos;
    local l_BundleInfos_0 = v351.AvatarExperience.Common.BundleInfos;
    return {
        AssetInfos = l_AssetInfos_0, 
        BundleInfos = l_BundleInfos_0
    };
end;
return function(v355) --[[ Line: 1565 ]] --[[ Name: ResultsListWrapper ]]
    -- upvalues: l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_useFocusGuiObject_0 (copy), l_useSelector_0 (copy), v6 (copy), v87 (copy), v100 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v28 (copy), l_useSignalState_0 (copy), v108 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v29 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v74 (copy), l_getUseSelectorDeepEquals_0 (copy), v63 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), l_FFlagAXReduceResultsListRerendersOnItemInfos_0 (copy), v354 (copy), v44 (copy), l_FFlagAXMigrateAllTabToSduiDev_0 (copy), l_CatalogCategories_0 (copy), l_useAvatarRoute_0 (copy), v66 (copy), v127 (ref)
    local v356 = table.clone(v355);
    if l_FFlagAXMigrateMainNavigationInputBindings_0 then
        local v357 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v357 = function(v358) --[[ Line: 1572 ]]
                return v358.AvatarExperience.Catalog.ResultsList;
            end;
        end;
        local v359 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            v359 = l_useDispatch_0();
        end;
        local v360 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.useFocusController();
        local v361 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v362 = nil;
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            local v363 = l_useSelector_0(v357);
            local v364 = v363[v355.searchUuid] and v363[v355.searchUuid].focusedWidget;
            v362 = if v364 then v364.active else false;
        end;
        local l_v361_0 = v361 --[[ copy: 5 -> 13 ]];
        local l_v360_0 = v360 --[[ copy: 4 -> 14 ]];
        do
            local l_v359_0, l_v362_0 = v359, v362;
            local v370 = v6.useCallback(function(v369) --[[ Line: 1591 ]]
                -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_v362_0 (ref), l_v359_0 (ref), v87 (ref), v355 (copy), l_v361_0 (copy), l_v360_0 (copy)
                v369.cancelled = true;
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if l_v362_0 then
                        l_v359_0(v87(v355.searchUuid));
                        if type(v355.onCloseFocusedWidget) == "function" then
                            v355.onCloseFocusedWidget();
                            return;
                        end;
                    elseif l_v361_0 and v355.NextSelectionUp and v355.NextSelectionUp.current then
                        l_v361_0(v355.NextSelectionUp.current);
                        return;
                    end;
                else
                    l_v360_0.moveFocusTo(v355.NextSelectionUp);
                end;
            end, {
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v361 else v360, 
                v355.NextSelectionUp, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v362_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v355.searchUuid else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_v359_0 else nil, 
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v355.onCloseFocusedWidget else nil
            });
            v356.focusNavigationBindingsRef = v100({
                onNavigateBack = v370
            }, v355.frameRef);
        end;
    end;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v371 = l_useUnifiedEventImpressionsReporter_0();
        local l_v371_0 = v371 --[[ copy: 2 -> 12 ]];
        v356.tagBasedImpressionsDetectorExtensions = v6.useMemo(function() --[[ Line: 1623 ]]
            -- upvalues: l_v371_0 (copy)
            return {
                l_v371_0
            };
        end, {
            v371
        });
    end;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v373 = v28.getCatalogSelectionStore();
        local v374 = l_useSignalState_0(v373.selectedCategoryId);
        local v375 = l_useSignalState_0(v373.selectedSubcategoryId);
        v356.selectedCategoryId = v374;
        v356.selectedSubcategoryId = v375;
        local v376 = v28.getCatalogSearchSelectionStore();
        local v377 = l_useSignalState_0(v376.selectedCategoryId);
        local v378 = l_useSignalState_0(v376.selectedSubcategoryId);
        v356.selectedSearchCategoryId = v377;
        v356.selectedSearchSubcategoryId = v378;
        local v379 = l_useSignalState_0(v373.selectedCategory);
        v356.selectedCategory = v379;
        local v380 = l_useSignalState_0(v376.selectedCategory);
        v356.selectedSearchCategory = v380;
        if v108 then
            v356.selectedSearchSubcategory = l_useSignalState_0(v376.selectedSubcategory);
        end;
        v356.categoryInfo = if v355.fromSearch then v380 else v379;
    end;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v381 = l_useAnimatedVisibility_0();
        v356.visibilityRatioBinding = if v381 then v29.useSignalBinding(v381.animatedMenusStore.getVisibilityRatio) else v6.createBinding(1);
    end;
    if l_FFlagAXCatalogCategoriesSDUI_0 or l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v382 = v74.getFetchMarketplaceStore(false);
        local v383 = l_useSignalState_0(v382.getFetchingMarketplaceError);
        local v384 = if l_FFlagAXCatalogCategoriesSDUI_0 then l_useSignalState_0(v382.getCatalogCategoriesError) else nil;
        v356.isFetchingMarketplaceError = v383;
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            v356.isFetchingMarketplaceError = v383 or v384;
        end;
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then
            v356.hasProcessedMarketplaceFetcher = l_useSignalState_0(v382.getFetchingMarketplaceProcessed);
            local v386 = v6.useCallback(function(v385) --[[ Line: 1691 ]]
                -- upvalues: v355 (copy)
                return v385.SearchesParameters[v355.searchUuid];
            end, {
                v355.searchUuid
            });
            local v387 = l_useSelector_0(v386, l_getUseSelectorDeepEquals_0());
            local v388 = l_useSelector_0(v63);
            v356.shouldPageUseWidgetOnly = l_getShouldPageUseWidgetOnlyFetcher_0(v356.categoryInfo, v388, v387 and v387.searchKeyword);
        end;
    end;
    if l_FFlagAXReduceResultsListRerendersOnItemInfos_0 then
        v356.itemInfos = l_useSelector_0(v354, v44.shallowEqual);
    end;
    if l_FFlagAXMigrateAllTabToSduiDev_0 and l_FFlagAXCatalogCategoriesStore_0 then
        local v389 = l_useSelector_0(v63);
        local v390 = v28.getCatalogSelectionStore();
        local v391 = l_useSignalState_0(v390.selectedCategoryId);
        local v392 = l_useSignalState_0(v390.selectedSubcategoryId);
        local v393 = v391 == l_CatalogCategories_0.Recommended:rawValue();
        local v395 = v6.useCallback(function(v394) --[[ Line: 1721 ]]
            -- upvalues: v355 (copy)
            return v394.SearchesParameters[v355.searchUuid];
        end, {
            v355.searchUuid
        });
        local v396 = l_useSelector_0(v395, v44.deepEqual);
        local v397 = v393 and v389 == 0 and not (v396 and v396.searchKeyword);
        local v398 = l_useAvatarRoute_0();
        local v399 = v66.getContextForWidgetsById(v398.opaque.name, v391, v392);
        v356.showSduiResults = v397;
        v356.context = v399;
    end;
    return v6.createElement(v127, v356);
end;