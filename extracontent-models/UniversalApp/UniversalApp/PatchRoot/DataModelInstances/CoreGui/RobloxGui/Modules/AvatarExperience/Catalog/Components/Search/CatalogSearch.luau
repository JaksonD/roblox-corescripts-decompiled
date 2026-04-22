local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = v5.Focusable;
local v8 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_withNavigation_0 = v8.withNavigation;
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Packages.Cryo);
local v13 = require(l_CorePackages_0.Packages.Dash);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v21 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v22 = require(l_Modules_0.LuaApp.mutedError);
local v23 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v24 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v25 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v23.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v28 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v30 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v31 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v32 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v33 = require(l_Modules_0.LuaApp.SearchUuid);
local l_DeviceOrientationMode_0 = v32.DeviceOrientationMode;
local v35 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v36 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_FFlagAXEnableTTIViaModule_0 = v35.FFlagAXEnableTTIViaModule;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v35.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v40 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance);
local l_TTIPerformanceManager_0 = v40.TTIPerformanceManager;
local l_OrganicTTIMilestoneManager_0 = v40.OrganicTTIMilestoneManager;
local v43 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch);
local v44 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v44.Enums.AvatarScreen;
local l_AvatarRoute_0 = v44.AvatarRoute.AvatarRoute;
local l_useAvatarRoute_0 = v44.AvatarRoute.Hooks.useAvatarRoute;
local v48 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v49 = require(l_Modules_0.LuaApp.Components.SearchBar);
local v50 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v51 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v52 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v53 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local l_HorizontalPageMargin_0 = require(l_CorePackages_0.Packages.UIBlox).App.Container.HorizontalPageMargin;
local v55 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local _ = require(l_Common_0.AvatarExperienceState);
local v58 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v59 = require(l_Common_0.withContextValue);
local v60 = require(l_Common_0.Context.PageObjectManagerContext);
local v61 = require(l_Common_0.Utils);
local v62 = require(l_Common_0.NamedRefConstants);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v64 = require(l_Common_0.Components.RoactNavigation.withAvatarRoute);
local v65 = require(l_Common_0.Context.withNamedRefs);
local v66 = require(l_Common_0.Services.Analytics);
local v67 = require(l_Common_0.Components.AvatarExperienceView);
local v68 = require(l_Common_0.Components.BoundInputsUpdater);
local v69 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v70 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v71 = require(l_Common_0.Selectors.selectIsFullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v73 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_SetItemDetailsPeekViewState_0 = v73.Actions.SetItemDetailsPeekViewState;
local v75 = require(l_Common_0.Thunks.OpenItemPrompt);
local v76 = require(l_Common_0.Thunks.OpenQuickMenu);
local v77 = require(l_Common_0.Thunks.SetFullView);
local l_FullView_0 = v55.Enums.FullView;
local v79 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v80 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v82 = require(l_Catalog_0.Services.Analytics);
local v83 = require(l_Catalog_0.CatalogConstants);
local v84 = require(l_Catalog_0.Components.Search.ResultsList);
local v85 = require(l_Catalog_0.CatalogUtils);
local v86 = require(l_Catalog_0.Actions.RemoveSearchInCatalog);
local v87 = require(l_Catalog_0.Actions.SetSortAndFilters);
local v88 = require(l_Catalog_0.Actions.ResetSortAndFilters);
local v89 = require(l_Catalog_0.Thunks.ResetSortAndFiltersThunk);
local l_SetTryOnManagerPeekViewState_0 = v73.Actions.SetTryOnManagerPeekViewState;
local v91 = require(l_Catalog_0.Thunks.FetchWidgetInfo);
local v92 = require(l_Catalog_0.Thunks.ApiFetchCatalogSearch);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v94 = require(l_Flags_0.GetFFlagAvatarAutocompleteEnabledForAll);
local v95 = require(l_Flags_0.FFlagAXResetAnalyticsMetadataOnFilterReset);
local v96 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v97 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXEnableManualSaving_0 = v35.FFlagAXEnableManualSaving;
local l_FFlagAXMISEnableMultiShopping_0 = v35.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogSearchToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = v35.FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXHideMenuOnScroll_0 = v35.FFlagAXHideMenuOnScroll;
local l_FFlagAXCatalogCategoriesStore_0 = v35.FFlagAXCatalogCategoriesStore;
local v105 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_RecentSearchTermsAppStorage_0 = v43.Utils.RecentSearchTermsAppStorage;
local v108 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ToggleTryOn
};
local function v110(v109) --[[ Line: 156 ]]
    return v109.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v112(v111) --[[ Line: 160 ]]
    return v111.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v118(v113, v114, v115) --[[ Line: 164 ]] --[[ Name: useCatalogSearchFocusNavigationBindings ]]
    -- upvalues: v24 (copy), v108 (copy), v6 (copy), l_FocusNavigationEventNameEnum_0 (copy), v25 (copy)
    local v116 = v24.useEventMap(v108, v113);
    local v117 = v6.useMemo(function() --[[ Line: 170 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v114 (copy), v25 (ref), v115 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if v114 then {
                handler = v25.onRelease(v114)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ToggleTryOn] = if v115 then {
                handler = v25.onRelease(v115)
            } else nil
        };
    end, {
        v114, 
        v115
    });
    return v24.useEventHandlerMap(v117, v116);
end;
local v119 = v4.PureComponent:extend("CatalogSearch");
v119.validateProps = v11.strictInterface({
    searchUuid = v11.string, 
    searchParameters = v11.table, 
    isVisible = v11.optional(v11.boolean), 
    fullView = v11.optional(v11.userdata), 
    topBarHeight = v11.number, 
    dataStatus = v11.string, 
    hasEntries = v11.boolean, 
    itemDetailsExpanded = v11.optional(v11.boolean), 
    isPortrait = v11.boolean, 
    tryOnManagerPeekViewState = v11.optional(v11.valueOf(l_PeekViewState_0)), 
    tryOnItems = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v11.optional(v11.table), 
    categoryInfo = v11.optional(v11.table), 
    dispatchSearch = v11.callback, 
    dispatchRemoveSearch = v11.callback, 
    setSearchType = v11.callback, 
    setSearchParameters = v11.callback, 
    setSortAndFilters = v11.callback, 
    openItemPrompt = v11.callback, 
    setItemDetailsPeekViewState = v11.callback, 
    setFullView = v11.callback, 
    navigateIntoQuickMenu = v11.callback, 
    resetSortAndFilters = v11.callback, 
    setTryOnManagerPeekViewState = v11.callback, 
    fetchWidgetInfo = v11.callback, 
    dispatchCatalogTilesLatencyStartTracker = if v96() then v11.callback else nil, 
    dispatchSearchWithParameters = v11.callback, 
    pageObjectManager = v11.optional(v11.table), 
    namedRefs = v11.table, 
    navigation = v11.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    analytics = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v11.table, 
    avatarExperienceAnalytics = v11.table, 
    catalogAnalytics = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v11.table, 
    networking = v11.callback, 
    eventIngest = v11.table, 
    overlayClosedCallback = v11.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.table, 
    localized = v11.table, 
    designTokens = v11.table, 
    focusNavigationRef = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v11.table else nil
});
v119.init = function(v120) --[[ Line: 245 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_AvatarScreen_0 (copy), v62 (copy), v5 (copy), l_FullView_0 (copy), v85 (copy), v13 (copy), v33 (copy), v32 (copy), v94 (copy), v53 (copy), l_RecentSearchTermsAppStorage_0 (copy), v58 (copy), v61 (copy), v96 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_OrganicTTIMilestoneManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v36 (copy)
    local v121, v122 = v4.createBinding(0);
    v120.pillBarScrollOffset = v121;
    v120.updatePillBarScrollOffset = v122;
    v120.searchBarRef = v4.createRef();
    v120.sceneUIContainerRef = v4.createRef();
    v120.resultsListRef = v120.props.namedRefs[l_AvatarScreen_0.CatalogSearch .. v62.ItemsList];
    v120.refinementButtonsRef = v4.createRef();
    v120.multiTryOnBottomBarRef = v4.createRef();
    v120.isMounted = false;
    v120.itemDetailsPeekViewRefs = v5.createRefCache();
    v120:setState({
        isSearching = false
    });
    v120.onNavBarSizeChanged = function(v123) --[[ Line: 261 ]]
        -- upvalues: v120 (copy)
        if v120.resultsListRef.current then
            v120.resultsListRef.current.Size = UDim2.new(1, 0, 1, -v123.Y);
        end;
    end;
    v120.dispatchInitialSearch = function() --[[ Line: 267 ]]
        -- upvalues: v120 (copy), l_FullView_0 (ref), v85 (ref), v13 (ref)
        local l_searchUuid_0 = v120.props.searchUuid;
        local l_searchParameters_0 = v120.props.searchParameters;
        local l_dispatchSearchWithParameters_0 = v120.props.dispatchSearchWithParameters;
        local v127 = v120.props.fullView == l_FullView_0.SceneFullView;
        local l_avatarExperienceAnalytics_0 = v120.props.avatarExperienceAnalytics;
        if v127 then
            v120.props.setFullView(l_avatarExperienceAnalytics_0, v120.props.avatarRoute.opaque.name, l_FullView_0.None);
        end;
        local l_fetchWidgetInfo_0 = v120.props.fetchWidgetInfo;
        local l_networking_0 = v120.props.networking;
        local v131 = v85.getQueryStringForSearchWidgets(l_searchParameters_0);
        if v131 then
            l_fetchWidgetInfo_0(l_networking_0, v131);
        end;
        local l_categoryInfo_0 = v120.props.categoryInfo;
        if not l_searchParameters_0.categoryInfo then
            l_searchParameters_0 = v13.join(l_searchParameters_0, {
                categoryInfo = l_categoryInfo_0
            });
            v120.props.setSearchParameters(l_searchUuid_0, l_searchParameters_0);
        end;
        return l_dispatchSearchWithParameters_0(l_searchParameters_0, l_searchUuid_0, l_categoryInfo_0, v120.props.networking);
    end;
    v120.setUIFullView = function() --[[ Line: 298 ]]
        -- upvalues: v120 (copy), l_FullView_0 (ref)
        local l_avatarExperienceAnalytics_1 = v120.props.avatarExperienceAnalytics;
        v120.props.setFullView(l_avatarExperienceAnalytics_1, v120.props.avatarRoute.opaque.name, l_FullView_0.UIFullView);
    end;
    v120.confirmSearchCallback = function(v134, v135, v136) --[[ Line: 303 ]]
        -- upvalues: v33 (ref), v120 (copy), v13 (ref), v32 (ref), v94 (ref), l_AvatarScreen_0 (ref), v53 (ref), l_RecentSearchTermsAppStorage_0 (ref), v58 (ref)
        local v137 = v33();
        local l_categoryInfo_1 = v120.props.categoryInfo;
        local v139 = nil;
        local v140 = v120.props.navigation.getParam("searchParams") or {};
        v139 = v13.join(v140, {
            searchKeyword = v134, 
            isKeywordSuggestionEnabled = true, 
            categoryInfo = l_categoryInfo_1
        });
        v120.props.setSearchType(v137, v32.SearchTypes.Catalog);
        v120.props.setSearchParameters(v137, v139);
        if v94() then
            if v120.props.isPortrait then
                v120.setUIFullView();
            end;
            local l_CatalogSearch_0 = l_AvatarScreen_0.CatalogSearch;
            v53(v120.props.eventIngest, "catalog", v134, v135, l_CatalogSearch_0, v136);
        end;
        l_RecentSearchTermsAppStorage_0.addTerm(v134);
        v58.navigateToSearch(v120.props.navigation, v137, v139);
    end;
    v120.cancelSearchCallback = function() --[[ Line: 345 ]]
        -- upvalues: v120 (copy), l_AvatarScreen_0 (ref)
        v120.props.navigation.navigate(l_AvatarScreen_0.Catalog);
        if v120.isMounted then
            v120:setState({
                isSearching = false
            });
        end;
    end;
    v120.onSearchBarFocused = function() --[[ Line: 355 ]]
        -- upvalues: v120 (copy)
        if not v120.isMounted then
            return;
        else
            v120:setState({
                isSearching = true
            });
            return;
        end;
    end;
    v120.changeView = function() --[[ Line: 365 ]]
        -- upvalues: v120 (copy), v61 (ref)
        local l_avatarExperienceAnalytics_2 = v120.props.avatarExperienceAnalytics;
        local v143 = v61.getNewFullViewEnum(v120.props.fullView);
        v120.props.setFullView(l_avatarExperienceAnalytics_2, v120.props.avatarRoute.opaque.name, v143);
    end;
    v120.onSameTermConfirmSearch = function() --[[ Line: 372 ]]
        -- upvalues: v120 (copy)
        if v120.isMounted then
            v120:setState({
                isSearching = false
            });
        end;
    end;
    v120.clearSearchState = function(v144) --[[ Line: 380 ]]
        -- upvalues: v120 (copy)
        v120.props.dispatchRemoveSearch(v144);
        v120.props.pageObjectManager:storePageObject(v144, nil);
    end;
    v120.dispatchWidgetSearch = function() --[[ Line: 385 ]]
        -- upvalues: v120 (copy), v85 (ref)
        local l_searchParameters_1 = v120.props.searchParameters;
        local l_fetchWidgetInfo_1 = v120.props.fetchWidgetInfo;
        local l_networking_1 = v120.props.networking;
        local v148 = v85.getQueryStringForSearchWidgets(l_searchParameters_1);
        if v148 then
            l_fetchWidgetInfo_1(l_networking_1, v148);
        end;
    end;
    v120.onCategoryOrSubcategoryChangeById = function(v149, v150) --[[ Line: 395 ]]
        -- upvalues: v61 (ref), v120 (copy), v96 (ref), l_FFlagAXEnableTTIViaModule_0 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_TTIPerformanceManager_0 (ref), l_OrganicTTIMilestoneManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v36 (ref)
        local v151 = v61.getCatalogCategoryInfoById(v149, v150);
        if v151 ~= v120.props.categoryInfo then
            v120.dispatchSearchOnCategoryOrSubcategoryChange(v151);
            if v96() then
                if l_FFlagAXEnableTTIViaModule_0 then
                    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                        l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                        if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_OrganicTTIMilestoneManager_0 then
                            l_OrganicTTIMilestoneManager_0.L2.primaryDataStarted();
                            l_OrganicTTIMilestoneManager_0.L3.networkFetch();
                        end;
                    else
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Organic.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Organic.Thumbnails);
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Widget.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Widget.Thumbnails);
                    end;
                end;
                v120.props.dispatchCatalogTilesLatencyStartTracker(v120.props.searchUuid);
            end;
        end;
    end;
    v120.dispatchSearchOnCategoryOrSubcategoryChange = function(v152) --[[ Line: 436 ]]
        -- upvalues: v120 (copy), v13 (ref)
        local l_searchUuid_1 = v120.props.searchUuid;
        local l_searchParameters_2 = v120.props.searchParameters;
        local l_dispatchSearch_0 = v120.props.dispatchSearch;
        local v156 = v13.join(l_searchParameters_2, {
            categoryInfo = v13.join({}, v152)
        });
        v120.props.setSearchParameters(l_searchUuid_1, v156);
        v120.clearSearchState(l_searchUuid_1);
        if v152 and v152.ShowWidgets then
            v120.dispatchWidgetSearch();
        end;
        return l_dispatchSearch_0(l_searchParameters_2.searchKeyword, l_searchUuid_1, v152, v120.props.networking);
    end;
end;
if not l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    v119.getInputBindings = function(v157) --[[ Line: 457 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreenProperties_0 (copy), v12 (copy), v5 (copy), v58 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_PeekViewState_0 (copy)
        local l_avatarRoute_0 = v157.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local l_isMultiTryOn_0 = l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
        local v161 = #v12.Dictionary.values(v157.props.tryOnItems) > 1;
        local v162 = {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 465 ]]
                -- upvalues: v58 (ref), v157 (copy)
                v58.closeFocusedScreen(v157.props.navigation);
            end), 
            OpenTryOnManager = if l_name_0 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_0 or l_FFlagAXMISEnableMultiShopping_0) and v161 then v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 471 ]]
                -- upvalues: v58 (ref), v157 (copy), l_AvatarScreen_0 (ref)
                v58.closeFiltersAndItemDetails(v157.props.navigation);
                v157.props.navigation.navigate(l_AvatarScreen_0.TryOnManager);
            end, {
                key = "Feature.Catalog.Label.TryOns"
            }) else nil
        };
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            return (v12.Dictionary.join(v162, {
                OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 482 ]]
                    -- upvalues: v157 (copy), l_avatarRoute_0 (copy)
                    v157.props.openItemPrompt(v157.props.networking, v157.props.catalogAnalytics, v157.props.overlayClosedCallback, v157.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 493 ]]
                    -- upvalues: v157 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                    v157.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_avatarRoute_0.current.params.itemId, 
                        itemType = l_avatarRoute_0.current.params.itemType, 
                        onOverlayClosed = v157.props.overlayClosedCallback
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            }));
        elseif l_name_0 == l_AvatarScreen_0.TryOnManager then
            return (v12.Dictionary.join(v162, {
                OpenCloseTryOnManager = v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 505 ]]
                    -- upvalues: v157 (copy), l_PeekViewState_0 (ref)
                    local l_tryOnManagerPeekViewState_0 = v157.props.tryOnManagerPeekViewState;
                    if l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v157.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v157.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }));
        else
            if l_name_0 == l_AvatarScreen_0.LookDetails then
                v162 = v12.Dictionary.join(v162, {
                    OpenCloseTryOnManager = v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 518 ]]
                        -- upvalues: v157 (copy), l_PeekViewState_0 (ref)
                        local l_tryOnManagerPeekViewState_1 = v157.props.tryOnManagerPeekViewState;
                        if l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Extended then
                            v157.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                            return;
                        else
                            v157.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                            return;
                        end;
                    end, {
                        key = "Feature.Catalog.Label.TryOns"
                    })
                });
            end;
            return v162;
        end;
    end;
end;
v119.renderSearchBar = function(v165) --[[ Line: 535 ]] --[[ Name: renderSearchBar ]]
    -- upvalues: v4 (copy), v94 (copy), l_HorizontalPageMargin_0 (copy), v49 (copy), v32 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local l_searchKeyword_0 = v165.props.searchParameters.searchKeyword;
    local l_topBarHeight_0 = v165.props.topBarHeight;
    local v168 = 20;
    if v165.props.designTokens then
        v168 = v165.props.designTokens.Global.Space_600;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = v94() and 3 or nil
    }, {
        PaddedFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            SearchBarPadding = if v165.props.isPortrait then v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v168)
            }) else nil, 
            SearchBar = v4.createElement(l_HorizontalPageMargin_0, {
                backgroundTransparency = 1, 
                backgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, {
                v4.createElement(v49, {
                    cancelSearch = v165.cancelSearchCallback, 
                    confirmSearch = v165.confirmSearchCallback, 
                    onFocused = v165.onSearchBarFocused, 
                    placeholderText = v165.props.localized.searchPlaceholder, 
                    isCompactView = true, 
                    modernUI = true, 
                    autocomplete = v94(), 
                    isSearching = v165.state.isSearching, 
                    searchType = v32.SearchTypes.Catalog, 
                    initialSearchText = l_searchKeyword_0, 
                    [v4.Ref] = v165.searchBarRef, 
                    NextSelectionDown = v165.resultsListRef, 
                    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v165.props.focusController, 
                    forceShowCancelButton = v94(), 
                    onSameTermConfirmSearch = v165.onSameTermConfirmSearch, 
                    shouldShowRecentSearchTerms = true
                })
            })
        })
    });
end;
v119.render = function(v169) --[[ Line: 590 ]] --[[ Name: render ]]
    -- upvalues: l_FullView_0 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 (copy), v68 (copy), v8 (copy), v70 (copy), v67 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v97 (copy), l_FFlagAXEnableManualSaving_0 (copy), v69 (copy), v84 (copy), v83 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy)
    local l_hasEntries_0 = v169.props.hasEntries;
    local v171 = v169.props.fullView == l_FullView_0.SceneFullView;
    local v172 = v169.props.fullView == l_FullView_0.UIFullView;
    local l_searchUuid_2 = v169.props.searchUuid;
    local l_refinementButtonsRef_0 = v169.refinementButtonsRef;
    if v169.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
        l_refinementButtonsRef_0 = v169.props.namedRefs[l_AvatarScreen_0.TryOnManager];
    elseif v169.props.avatarRoute.current.name == l_AvatarScreen_0.LookDetails then
        l_refinementButtonsRef_0 = v169.props.namedRefs[l_AvatarScreen_0.LookDetails];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v169.props.focusController, 
        defaultChild = l_hasEntries_0 and v169.resultsListRef or v169.searchBarRef, 
        inputBindings = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v169:getInputBindings(), 
        [v4.Ref] = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v169.props.focusNavigationRef else nil
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v68), 
        NavigationEvents = v4.createElement(v8.NavigationEvents, {
            onDidFocus = function() --[[ Line: 614 ]] --[[ Name: onDidFocus ]]
                -- upvalues: v169 (copy)
                local l_sortAndFilters_0 = (v169.props.navigation.getParam("searchParams") or {}).sortAndFilters;
                if l_sortAndFilters_0 then
                    v169.props.setSortAndFilters(l_sortAndFilters_0);
                    return;
                else
                    v169.props.resetSortAndFilters();
                    return;
                end;
            end
        }), 
        NavigationEventsLogger = v4.createElement(v70, {
            pageName = "CatalogSearch"
        }), 
        AvatarExperienceView = v4.createElement(v67, {
            changeViewFunction = v169.changeView, 
            allowAdaptiveScrolling = true, 
            adaptiveScrollingProps = if not not l_FFlagAXHideMenuOnScroll_0 or l_FFlagAXExpandPeekViewOnFirstScroll_0 then {
                enableExpandPeekViewOnUpwardScroll = l_FFlagAXExpandPeekViewOnFirstScroll_0 and true or nil, 
                enableAnimatedVisibility = l_FFlagAXHideMenuOnScroll_0 and true or nil
            } else nil, 
            isSceneFullView = v171, 
            isUIFullView = v172, 
            topBar = v169:renderSearchBar(), 
            [v4.Ref] = v169.sceneUIContainerRef, 
            NextSelectionLeft = v169.searchBarRef, 
            refinementButtonsRef = v169.refinementButtonsRef, 
            defaultChildRef = l_hasEntries_0 and v169.resultsListRef or v169.searchBarRef, 
            multiTryOnBottomBarRef = v169.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v169.itemDetailsPeekViewRefs, 
            showUndoRedo = v97() and true or nil, 
            showSaveButton = v97() and l_FFlagAXEnableManualSaving_0 and true or nil
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v69, {
                focusController = v169.props.focusController
            }), 
            ResultsList = v4.createElement(v84, {
                analyticsContext = v83.AnalyticsContext.CatalogSearch, 
                fromSearch = true, 
                searchUuid = l_searchUuid_2, 
                onRetry = v169.dispatchInitialSearch, 
                frameRef = v169.resultsListRef, 
                NextSelectionUp = v169.searchBarRef, 
                NextSelectionRight = l_refinementButtonsRef_0, 
                multiTryOnBottomBarRef = v169.multiTryOnBottomBarRef, 
                onCategoryOrSubcategoryChange = v169.onCategoryOrSubcategoryChange, 
                onCategoryOrSubcategoryChangeById = v169.onCategoryOrSubcategoryChangeById, 
                categoryInfo = if l_FFlagAXCatalogCategoriesStore_0 then nil else v169.props.categoryInfo, 
                itemDetailsPeekViewRefs = v169.itemDetailsPeekViewRefs
            })
        })
    });
end;
v119.didMount = function(v176) --[[ Line: 674 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v176.isMounted = true;
    v176.dispatchInitialSearch():catch(function(v177) --[[ Line: 676 ]]
        if not _G.__TESTEZ_RUNNING_TEST__ then
            warn("Error fetching CatalogSearch results:\n" .. tostring(v177));
        end;
    end);
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v179 = l_l_UserInputService_0_LastInputType_0 and l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v179 then
        v176.props.focusController.captureFocus();
    end;
end;
v119.willUnmount = function(v180) --[[ Line: 691 ]] --[[ Name: willUnmount ]]
    v180.isMounted = false;
    local l_searchUuid_3 = v180.props.searchUuid;
    v180.props.dispatchRemoveSearch(l_searchUuid_3);
    v180.props.pageObjectManager:storePageObject(l_searchUuid_3, nil);
    v180.props.resetSortAndFilters();
end;
v119.didUpdate = function(v182, v183) --[[ Line: 702 ]] --[[ Name: didUpdate ]]
    if v183.searchUuid ~= v182.props.searchUuid then
        if v183.searchUuid ~= nil then
            v182.props.dispatchRemoveSearch(v183.searchUuid);
            v182.props.pageObjectManager:storePageObject(v183.searchUuid, nil);
        end;
        v182.dispatchInitialSearch();
    end;
end;
v119 = v10.connect(function(v184, v185) --[[ Line: 713 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v61 (copy), l_DeviceOrientationMode_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v22 (copy), v71 (copy), l_AvatarScreen_0 (copy), l_PerformFetch_0 (copy), v48 (copy), l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 (copy)
    local v186 = v184.Search.SearchesInCatalog[v185.searchUuid];
    local v187 = v186 and v186.items or nil;
    local v188 = v187 and #v187 ~= 0 or false;
    local v189 = v61.getSearchKey(v184, v185.searchUuid);
    local v190 = v184.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v191 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v191 = v185.categoryInfo;
    else
        local l_SearchCategories_0 = v184.AvatarExperience.Catalog.SearchCategories;
        if l_SearchCategories_0 then
            local l_categoryId_0 = l_SearchCategories_0.categoryId;
            local l_subcategoryId_0 = l_SearchCategories_0.subcategoryId;
            if l_categoryId_0 == nil then
                v22("[CatalogSearch] categoryId is nil");
            else
                v191 = v61.getCatalogCategoryInfoById(l_categoryId_0, l_subcategoryId_0);
            end;
        end;
    end;
    return {
        categoryInfo = v191, 
        fullView = v71(v184, l_AvatarScreen_0.CatalogSearch), 
        hasEntries = v188, 
        dataStatus = l_PerformFetch_0.GetStatus(v184, v189), 
        topBarHeight = v48.selectTopBarHeightNoBanners(v184), 
        itemDetailsExpanded = v184.AvatarExperience.Common.ItemDetailsExpanded, 
        isPortrait = v190, 
        tryOnManagerPeekViewState = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v184.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v184.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v195) --[[ Line: 757 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v92 (copy), v86 (copy), v52 (copy), v51 (copy), v87 (copy), v75 (copy), l_SetItemDetailsPeekViewState_0 (copy), v77 (copy), v76 (copy), v95 (copy), v89 (copy), v88 (copy), l_SetTryOnManagerPeekViewState_0 (copy), v91 (copy), v96 (copy), v50 (copy)
    return {
        dispatchSearch = function(v196, v197, v198, v199) --[[ Line: 759 ]] --[[ Name: dispatchSearch ]]
            -- upvalues: v195 (copy), v92 (ref)
            return v195(v92({
                searchKeyword = v196, 
                searchUuid = v197, 
                categoryInfo = v198
            }, v199));
        end, 
        dispatchSearchWithParameters = function(v200, v201, v202, v203) --[[ Line: 766 ]] --[[ Name: dispatchSearchWithParameters ]]
            -- upvalues: v195 (copy), v92 (ref)
            local v204 = {};
            if v200.sortAndFilters then
                v204 = v200.sortAndFilters.SelectedTopics or {};
            end;
            return v195(v92({
                searchKeyword = v200.searchKeyword, 
                searchUuid = v201, 
                categoryInfo = v202, 
                topics = v204
            }, v203));
        end, 
        dispatchRemoveSearch = function(v205) --[[ Line: 779 ]] --[[ Name: dispatchRemoveSearch ]]
            -- upvalues: v195 (copy), v86 (ref)
            v195(v86(v205));
        end, 
        setSearchType = function(v206, v207) --[[ Line: 783 ]] --[[ Name: setSearchType ]]
            -- upvalues: v195 (copy), v52 (ref)
            return v195(v52(v206, v207));
        end, 
        setSearchParameters = function(v208, v209) --[[ Line: 787 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v195 (copy), v51 (ref)
            return v195(v51(v208, v209));
        end, 
        setSortAndFilters = function(v210) --[[ Line: 791 ]] --[[ Name: setSortAndFilters ]]
            -- upvalues: v195 (copy), v87 (ref)
            return v195(v87(v210));
        end, 
        openItemPrompt = function(v211, v212, v213, v214, v215) --[[ Line: 795 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v195 (copy), v75 (ref)
            v195(v75(v211, v212, v213, v214, v215));
        end, 
        setItemDetailsPeekViewState = function(v216) --[[ Line: 799 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v195 (copy), l_SetItemDetailsPeekViewState_0 (ref)
            v195(l_SetItemDetailsPeekViewState_0(v216));
        end, 
        setFullView = function(v217, v218, v219) --[[ Line: 803 ]] --[[ Name: setFullView ]]
            -- upvalues: v195 (copy), v77 (ref)
            v195(v77(v217, v218, v219));
        end, 
        navigateIntoQuickMenu = function(v220, v221) --[[ Line: 807 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v195 (copy), v76 (ref)
            v195(v76(v220, v221));
        end, 
        resetSortAndFilters = function() --[[ Line: 811 ]] --[[ Name: resetSortAndFilters ]]
            -- upvalues: v95 (ref), v195 (copy), v89 (ref), v88 (ref)
            if v95 then
                v195(v89());
                return;
            else
                v195(v88());
                return;
            end;
        end, 
        setTryOnManagerPeekViewState = function(v222) --[[ Line: 819 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v195 (copy), l_SetTryOnManagerPeekViewState_0 (ref)
            v195(l_SetTryOnManagerPeekViewState_0(v222));
        end, 
        fetchWidgetInfo = function(v223, v224) --[[ Line: 823 ]] --[[ Name: fetchWidgetInfo ]]
            -- upvalues: v195 (copy), v91 (ref)
            v195(v91(v223, v224));
        end, 
        dispatchCatalogTilesLatencyStartTracker = v96() and function(v225) --[[ Line: 828 ]]
            -- upvalues: v195 (copy), v50 (ref)
            v195((v50.StartTracking(v225)));
        end or nil
    };
end)(v119);
if not l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    v119 = v64((l_withNavigation_0(v119)));
end;
v119 = v59(v65(v119), v60.Consumer, "pageObjectManager");
v119 = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then l_RoactServices_0.connect({
    avatarExperienceAnalytics = v66, 
    eventIngest = v31
})(v119) else l_RoactServices_0.connect({
    analytics = v28, 
    catalogAnalytics = v82, 
    avatarExperienceAnalytics = v66, 
    networking = v30, 
    eventIngest = v31
})(v119);
if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    return function(v226) --[[ Line: 860 ]] --[[ Name: CatalogSearchContainer ]]
        -- upvalues: l_useDispatch_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v21 (copy), v82 (copy), v30 (copy), l_useSelector_0 (copy), v110 (copy), v112 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v5 (copy), v80 (copy), v79 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v75 (copy), v58 (copy), l_AvatarScreen_0 (copy), l_PeekViewState_0 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_AvatarScreenProperties_0 (copy), v12 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v118 (copy), l_useTableWrappedCallbackRef_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v105 (copy), l_useSignalState_0 (copy), v119 (ref)
        local v227 = l_useDispatch_0();
        local v228 = l_useAvatarRoute_0();
        local v229 = l_useNavigation_0();
        local v230 = v21(v82);
        local v231 = v21(v30);
        local v232 = l_useSelector_0(v110);
        local v233 = l_useSelector_0(v112);
        local l_name_1 = v228.current.name;
        local v235 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
        local v236 = v80(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v235);
        local v237 = v79({
            overlayClosedCallback = v236
        });
        local v238 = l_useLocalization_0({
            searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
        });
        local v239 = l_useDesignTokens_0();
        local v240 = nil;
        local v241 = v6.useCallback(function() --[[ Line: 887 ]]
            -- upvalues: v227 (copy), v75 (ref), v231 (copy), v230 (copy), v236 (copy), v229 (copy), v228 (copy)
            v227(v75(v231, v230, v236, v229, v228));
        end, {
            v227, 
            v236, 
            v228, 
            v229, 
            v231, 
            v230
        });
        local v242 = v6.useCallback(function() --[[ Line: 891 ]]
            -- upvalues: v58 (ref), v229 (copy), l_AvatarScreen_0 (ref)
            v58.closeFiltersAndItemDetails(v229);
            v229.navigate(l_AvatarScreen_0.TryOnManager);
        end, {
            v229
        });
        local v243 = v6.useCallback(function() --[[ Line: 896 ]]
            -- upvalues: v232 (copy), l_PeekViewState_0 (ref), v227 (copy), l_SetTryOnManagerPeekViewState_0 (ref)
            if v232 == l_PeekViewState_0.Full or v232 == l_PeekViewState_0.Extended then
                v227(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Brief));
                return;
            else
                v227(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Full));
                return;
            end;
        end, {
            v232, 
            v227
        });
        local l_isMultiTryOn_1 = l_AvatarScreenProperties_0[v228.opaque.name].isMultiTryOn;
        local v245 = #v12.Dictionary.values(v233) > 1;
        local v246 = nil;
        if l_name_1 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_1 or l_FFlagAXMISEnableMultiShopping_0) and v245 then
            v246 = v242;
        end;
        if l_name_1 == l_AvatarScreen_0.TryOnManager or l_name_1 == l_AvatarScreen_0.LookDetails then
            v246 = v243;
        end;
        local v247 = v118(nil, if l_name_1 == l_AvatarScreen_0.ItemDetails then v241 else nil, v246);
        v240 = l_useTableWrappedCallbackRef_0(v247);
        local v248 = v12.Dictionary.join(v226, {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v235, 
            overlayClosedCallback = v236, 
            localized = v238, 
            designTokens = v239, 
            focusNavigationRef = v240, 
            avatarRoute = v228, 
            navigation = v229, 
            networking = v231, 
            tryOnManagerPeekViewState = v232
        });
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v249 = v105.getCatalogSearchSelectionStore();
            v248.categoryInfo = l_useSignalState_0(v249.selectedCategoryInfo);
        end;
        return v6.createElement("Frame", {
            ref = v237, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v6.createElement(v119, v248));
    end;
else
    return function(v250) --[[ Line: 956 ]] --[[ Name: CatalogSearchContainer ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v5 (copy), v80 (copy), v79 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v12 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v105 (copy), l_useSignalState_0 (copy), v119 (ref)
        local v251 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
        local v252 = v80(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v251);
        local v253 = v79({
            overlayClosedCallback = v252
        });
        local v254 = l_useLocalization_0({
            searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
        });
        local v255 = l_useDesignTokens_0();
        local v256 = v12.Dictionary.join(v250, {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v251, 
            overlayClosedCallback = v252, 
            localized = v254, 
            designTokens = v255
        });
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v257 = v105.getCatalogSearchSelectionStore();
            v256.categoryInfo = l_useSignalState_0(v257.selectedCategoryInfo);
        end;
        return v6.createElement("Frame", {
            ref = v253, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v6.createElement(v119, v256));
    end;
end;