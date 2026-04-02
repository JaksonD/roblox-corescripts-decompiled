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
local l_TTIPerformanceManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).TTIPerformanceManager;
local v41 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch);
local v42 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v42.Enums.AvatarScreen;
local l_AvatarRoute_0 = v42.AvatarRoute.AvatarRoute;
local l_useAvatarRoute_0 = v42.AvatarRoute.Hooks.useAvatarRoute;
local v46 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v47 = require(l_Modules_0.LuaApp.Components.SearchBar);
local v48 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v49 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v50 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v51 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local l_HorizontalPageMargin_0 = require(l_CorePackages_0.Packages.UIBlox).App.Container.HorizontalPageMargin;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local _ = require(l_Common_0.AvatarExperienceState);
local v56 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v57 = require(l_Common_0.withContextValue);
local v58 = require(l_Common_0.Context.PageObjectManagerContext);
local v59 = require(l_Common_0.Utils);
local v60 = require(l_Common_0.NamedRefConstants);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v62 = require(l_Common_0.Components.RoactNavigation.withAvatarRoute);
local v63 = require(l_Common_0.Context.withNamedRefs);
local v64 = require(l_Common_0.Services.Analytics);
local v65 = require(l_Common_0.Components.AvatarExperienceView);
local v66 = require(l_Common_0.Components.BoundInputsUpdater);
local v67 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v68 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v69 = require(l_Common_0.Selectors.selectIsFullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v71 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v72 = require(l_Common_0.Thunks.OpenItemPrompt);
local v73 = require(l_Common_0.Thunks.OpenQuickMenu);
local v74 = require(l_Common_0.Thunks.SetFullView);
local v75 = require(l_Common_0.Enum.FullView);
local v76 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v77 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v79 = require(l_Catalog_0.Services.Analytics);
local v80 = require(l_Catalog_0.CatalogConstants);
local v81 = require(l_Catalog_0.Components.Search.ResultsList);
local v82 = require(l_Catalog_0.CatalogUtils);
local v83 = require(l_Catalog_0.Actions.RemoveSearchInCatalog);
local v84 = require(l_Catalog_0.Actions.SetSortAndFilters);
local v85 = require(l_Catalog_0.Actions.ResetSortAndFilters);
local v86 = require(l_Catalog_0.Actions.SetTryOnManagerPeekViewState);
local v87 = require(l_Catalog_0.Thunks.FetchWidgetInfo);
local v88 = require(l_Catalog_0.Thunks.ApiFetchCatalogSearch);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v90 = require(l_Flags_0.GetFFlagAvatarAutocompleteEnabledForAll);
local v91 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v92 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXEnableManualSaving_0 = v35.FFlagAXEnableManualSaving;
local l_FFlagAXMISEnableMultiShopping_0 = v35.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogSearchToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = v35.FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXHideMenuOnScroll_0 = v35.FFlagAXHideMenuOnScroll;
local l_FFlagAXCatalogCategoriesStore_0 = v35.FFlagAXCatalogCategoriesStore;
local v100 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_RecentSearchTermsAppStorage_0 = v41.Utils.RecentSearchTermsAppStorage;
local v103 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ToggleTryOn
};
local function v105(v104) --[[ Line: 152 ]]
    return v104.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v107(v106) --[[ Line: 156 ]]
    return v106.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v113(v108, v109, v110) --[[ Line: 160 ]] --[[ Name: useCatalogSearchFocusNavigationBindings ]]
    -- upvalues: v24 (copy), v103 (copy), v6 (copy), l_FocusNavigationEventNameEnum_0 (copy), v25 (copy)
    local v111 = v24.useEventMap(v103, v108);
    local v112 = v6.useMemo(function() --[[ Line: 166 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v109 (copy), v25 (ref), v110 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if v109 then {
                handler = v25.onRelease(v109)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ToggleTryOn] = if v110 then {
                handler = v25.onRelease(v110)
            } else nil
        };
    end, {
        v109, 
        v110
    });
    return v24.useEventHandlerMap(v112, v111);
end;
local v114 = v4.PureComponent:extend("CatalogSearch");
v114.validateProps = v11.strictInterface({
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
    dispatchCatalogTilesLatencyStartTracker = if v91() then v11.callback else nil, 
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
v114.init = function(v115) --[[ Line: 241 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_AvatarScreen_0 (copy), v60 (copy), v5 (copy), v75 (copy), v82 (copy), v13 (copy), v33 (copy), v32 (copy), v90 (copy), v51 (copy), l_RecentSearchTermsAppStorage_0 (copy), v56 (copy), v59 (copy), v91 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v36 (copy)
    local v116, v117 = v4.createBinding(0);
    v115.pillBarScrollOffset = v116;
    v115.updatePillBarScrollOffset = v117;
    v115.searchBarRef = v4.createRef();
    v115.sceneUIContainerRef = v4.createRef();
    v115.resultsListRef = v115.props.namedRefs[l_AvatarScreen_0.CatalogSearch .. v60.ItemsList];
    v115.refinementButtonsRef = v4.createRef();
    v115.multiTryOnBottomBarRef = v4.createRef();
    v115.isMounted = false;
    v115.itemDetailsPeekViewRefs = v5.createRefCache();
    v115:setState({
        isSearching = false
    });
    v115.onNavBarSizeChanged = function(v118) --[[ Line: 257 ]]
        -- upvalues: v115 (copy)
        if v115.resultsListRef.current then
            v115.resultsListRef.current.Size = UDim2.new(1, 0, 1, -v118.Y);
        end;
    end;
    v115.dispatchInitialSearch = function() --[[ Line: 263 ]]
        -- upvalues: v115 (copy), v75 (ref), v82 (ref), v13 (ref)
        local l_searchUuid_0 = v115.props.searchUuid;
        local l_searchParameters_0 = v115.props.searchParameters;
        local l_dispatchSearchWithParameters_0 = v115.props.dispatchSearchWithParameters;
        local v122 = v115.props.fullView == v75.SceneFullView;
        local l_avatarExperienceAnalytics_0 = v115.props.avatarExperienceAnalytics;
        if v122 then
            v115.props.setFullView(l_avatarExperienceAnalytics_0, v115.props.avatarRoute.opaque.name, v75.None);
        end;
        local l_fetchWidgetInfo_0 = v115.props.fetchWidgetInfo;
        local l_networking_0 = v115.props.networking;
        local v126 = v82.getQueryStringForSearchWidgets(l_searchParameters_0);
        if v126 then
            l_fetchWidgetInfo_0(l_networking_0, v126);
        end;
        local l_categoryInfo_0 = v115.props.categoryInfo;
        if not l_searchParameters_0.categoryInfo then
            l_searchParameters_0 = v13.join(l_searchParameters_0, {
                categoryInfo = l_categoryInfo_0
            });
            v115.props.setSearchParameters(l_searchUuid_0, l_searchParameters_0);
        end;
        return l_dispatchSearchWithParameters_0(l_searchParameters_0, l_searchUuid_0, l_categoryInfo_0, v115.props.networking);
    end;
    v115.setUIFullView = function() --[[ Line: 294 ]]
        -- upvalues: v115 (copy), v75 (ref)
        local l_avatarExperienceAnalytics_1 = v115.props.avatarExperienceAnalytics;
        v115.props.setFullView(l_avatarExperienceAnalytics_1, v115.props.avatarRoute.opaque.name, v75.UIFullView);
    end;
    v115.confirmSearchCallback = function(v129, v130, v131) --[[ Line: 299 ]]
        -- upvalues: v33 (ref), v115 (copy), v13 (ref), v32 (ref), v90 (ref), l_AvatarScreen_0 (ref), v51 (ref), l_RecentSearchTermsAppStorage_0 (ref), v56 (ref)
        local v132 = v33();
        local l_categoryInfo_1 = v115.props.categoryInfo;
        local v134 = nil;
        local v135 = v115.props.navigation.getParam("searchParams") or {};
        v134 = v13.join(v135, {
            searchKeyword = v129, 
            isKeywordSuggestionEnabled = true, 
            categoryInfo = l_categoryInfo_1
        });
        v115.props.setSearchType(v132, v32.SearchTypes.Catalog);
        v115.props.setSearchParameters(v132, v134);
        if v90() then
            if v115.props.isPortrait then
                v115.setUIFullView();
            end;
            local l_CatalogSearch_0 = l_AvatarScreen_0.CatalogSearch;
            v51(v115.props.eventIngest, "catalog", v129, v130, l_CatalogSearch_0, v131);
        end;
        l_RecentSearchTermsAppStorage_0.addTerm(v129);
        v56.navigateToSearch(v115.props.navigation, v132, v134);
    end;
    v115.cancelSearchCallback = function() --[[ Line: 341 ]]
        -- upvalues: v115 (copy), l_AvatarScreen_0 (ref)
        v115.props.navigation.navigate(l_AvatarScreen_0.Catalog);
        if v115.isMounted then
            v115:setState({
                isSearching = false
            });
        end;
    end;
    v115.onSearchBarFocused = function() --[[ Line: 351 ]]
        -- upvalues: v115 (copy)
        if not v115.isMounted then
            return;
        else
            v115:setState({
                isSearching = true
            });
            return;
        end;
    end;
    v115.changeView = function() --[[ Line: 361 ]]
        -- upvalues: v115 (copy), v59 (ref)
        local l_avatarExperienceAnalytics_2 = v115.props.avatarExperienceAnalytics;
        local v138 = v59.getNewFullViewEnum(v115.props.fullView);
        v115.props.setFullView(l_avatarExperienceAnalytics_2, v115.props.avatarRoute.opaque.name, v138);
    end;
    v115.onSameTermConfirmSearch = function() --[[ Line: 368 ]]
        -- upvalues: v115 (copy)
        if v115.isMounted then
            v115:setState({
                isSearching = false
            });
        end;
    end;
    v115.clearSearchState = function(v139) --[[ Line: 376 ]]
        -- upvalues: v115 (copy)
        v115.props.dispatchRemoveSearch(v139);
        v115.props.pageObjectManager:storePageObject(v139, nil);
    end;
    v115.dispatchWidgetSearch = function() --[[ Line: 381 ]]
        -- upvalues: v115 (copy), v82 (ref)
        local l_searchParameters_1 = v115.props.searchParameters;
        local l_fetchWidgetInfo_1 = v115.props.fetchWidgetInfo;
        local l_networking_1 = v115.props.networking;
        local v143 = v82.getQueryStringForSearchWidgets(l_searchParameters_1);
        if v143 then
            l_fetchWidgetInfo_1(l_networking_1, v143);
        end;
    end;
    v115.onCategoryOrSubcategoryChangeById = function(v144, v145) --[[ Line: 391 ]]
        -- upvalues: v59 (ref), v115 (copy), v91 (ref), l_FFlagAXEnableTTIViaModule_0 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_TTIPerformanceManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v36 (ref)
        local v146 = v59.getCatalogCategoryInfoById(v144, v145);
        if v146 ~= v115.props.categoryInfo then
            v115.dispatchSearchOnCategoryOrSubcategoryChange(v146);
            if v91() then
                if l_FFlagAXEnableTTIViaModule_0 then
                    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                        l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                    else
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Organic.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Organic.Thumbnails);
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Widget.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Widget.Thumbnails);
                    end;
                end;
                v115.props.dispatchCatalogTilesLatencyStartTracker(v115.props.searchUuid);
            end;
        end;
    end;
    v115.dispatchSearchOnCategoryOrSubcategoryChange = function(v147) --[[ Line: 428 ]]
        -- upvalues: v115 (copy), v13 (ref)
        local l_searchUuid_1 = v115.props.searchUuid;
        local l_searchParameters_2 = v115.props.searchParameters;
        local l_dispatchSearch_0 = v115.props.dispatchSearch;
        local v151 = v13.join(l_searchParameters_2, {
            categoryInfo = v13.join({}, v147)
        });
        v115.props.setSearchParameters(l_searchUuid_1, v151);
        v115.clearSearchState(l_searchUuid_1);
        if v147 and v147.ShowWidgets then
            v115.dispatchWidgetSearch();
        end;
        return l_dispatchSearch_0(l_searchParameters_2.searchKeyword, l_searchUuid_1, v147, v115.props.networking);
    end;
end;
if not l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    v114.getInputBindings = function(v152) --[[ Line: 449 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreenProperties_0 (copy), v12 (copy), v5 (copy), v56 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_PeekViewState_0 (copy)
        local l_avatarRoute_0 = v152.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local l_isMultiTryOn_0 = l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
        local v156 = #v12.Dictionary.values(v152.props.tryOnItems) > 1;
        local v157 = {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 457 ]]
                -- upvalues: v56 (ref), v152 (copy)
                v56.closeFocusedScreen(v152.props.navigation);
            end), 
            OpenTryOnManager = if l_name_0 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_0 or l_FFlagAXMISEnableMultiShopping_0) and v156 then v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 463 ]]
                -- upvalues: v56 (ref), v152 (copy), l_AvatarScreen_0 (ref)
                v56.closeFiltersAndItemDetails(v152.props.navigation);
                v152.props.navigation.navigate(l_AvatarScreen_0.TryOnManager);
            end, {
                key = "Feature.Catalog.Label.TryOns"
            }) else nil
        };
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            return (v12.Dictionary.join(v157, {
                OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 474 ]]
                    -- upvalues: v152 (copy), l_avatarRoute_0 (copy)
                    v152.props.openItemPrompt(v152.props.networking, v152.props.catalogAnalytics, v152.props.overlayClosedCallback, v152.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 485 ]]
                    -- upvalues: v152 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                    v152.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_avatarRoute_0.current.params.itemId, 
                        itemType = l_avatarRoute_0.current.params.itemType, 
                        onOverlayClosed = v152.props.overlayClosedCallback
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            }));
        elseif l_name_0 == l_AvatarScreen_0.TryOnManager then
            return (v12.Dictionary.join(v157, {
                OpenCloseTryOnManager = v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 497 ]]
                    -- upvalues: v152 (copy), l_PeekViewState_0 (ref)
                    local l_tryOnManagerPeekViewState_0 = v152.props.tryOnManagerPeekViewState;
                    if l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v152.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v152.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }));
        else
            if l_name_0 == l_AvatarScreen_0.LookDetails then
                v157 = v12.Dictionary.join(v157, {
                    OpenCloseTryOnManager = v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 510 ]]
                        -- upvalues: v152 (copy), l_PeekViewState_0 (ref)
                        local l_tryOnManagerPeekViewState_1 = v152.props.tryOnManagerPeekViewState;
                        if l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Extended then
                            v152.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                            return;
                        else
                            v152.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                            return;
                        end;
                    end, {
                        key = "Feature.Catalog.Label.TryOns"
                    })
                });
            end;
            return v157;
        end;
    end;
end;
v114.renderSearchBar = function(v160) --[[ Line: 527 ]] --[[ Name: renderSearchBar ]]
    -- upvalues: v4 (copy), v90 (copy), l_HorizontalPageMargin_0 (copy), v47 (copy), v32 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local l_searchKeyword_0 = v160.props.searchParameters.searchKeyword;
    local l_topBarHeight_0 = v160.props.topBarHeight;
    local v163 = 20;
    if v160.props.designTokens then
        v163 = v160.props.designTokens.Global.Space_600;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = v90() and 3 or nil
    }, {
        PaddedFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            SearchBarPadding = if v160.props.isPortrait then v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v163)
            }) else nil, 
            SearchBar = v4.createElement(l_HorizontalPageMargin_0, {
                backgroundTransparency = 1, 
                backgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, {
                v4.createElement(v47, {
                    cancelSearch = v160.cancelSearchCallback, 
                    confirmSearch = v160.confirmSearchCallback, 
                    onFocused = v160.onSearchBarFocused, 
                    placeholderText = v160.props.localized.searchPlaceholder, 
                    isCompactView = true, 
                    modernUI = true, 
                    autocomplete = v90(), 
                    isSearching = v160.state.isSearching, 
                    searchType = v32.SearchTypes.Catalog, 
                    initialSearchText = l_searchKeyword_0, 
                    [v4.Ref] = v160.searchBarRef, 
                    NextSelectionDown = v160.resultsListRef, 
                    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v160.props.focusController, 
                    forceShowCancelButton = v90(), 
                    onSameTermConfirmSearch = v160.onSameTermConfirmSearch, 
                    shouldShowRecentSearchTerms = true
                })
            })
        })
    });
end;
v114.render = function(v164) --[[ Line: 582 ]] --[[ Name: render ]]
    -- upvalues: v75 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 (copy), v66 (copy), v8 (copy), v68 (copy), v65 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v92 (copy), l_FFlagAXEnableManualSaving_0 (copy), v67 (copy), v81 (copy), v80 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy)
    local l_hasEntries_0 = v164.props.hasEntries;
    local v166 = v164.props.fullView == v75.SceneFullView;
    local v167 = v164.props.fullView == v75.UIFullView;
    local l_searchUuid_2 = v164.props.searchUuid;
    local l_refinementButtonsRef_0 = v164.refinementButtonsRef;
    if v164.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
        l_refinementButtonsRef_0 = v164.props.namedRefs[l_AvatarScreen_0.TryOnManager];
    elseif v164.props.avatarRoute.current.name == l_AvatarScreen_0.LookDetails then
        l_refinementButtonsRef_0 = v164.props.namedRefs[l_AvatarScreen_0.LookDetails];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v164.props.focusController, 
        defaultChild = l_hasEntries_0 and v164.resultsListRef or v164.searchBarRef, 
        inputBindings = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v164:getInputBindings(), 
        [v4.Ref] = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v164.props.focusNavigationRef else nil
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v66), 
        NavigationEvents = v4.createElement(v8.NavigationEvents, {
            onDidFocus = function() --[[ Line: 606 ]] --[[ Name: onDidFocus ]]
                -- upvalues: v164 (copy)
                local l_sortAndFilters_0 = (v164.props.navigation.getParam("searchParams") or {}).sortAndFilters;
                if l_sortAndFilters_0 then
                    v164.props.setSortAndFilters(l_sortAndFilters_0);
                    return;
                else
                    v164.props.resetSortAndFilters();
                    return;
                end;
            end
        }), 
        NavigationEventsLogger = v4.createElement(v68, {
            pageName = "CatalogSearch"
        }), 
        AvatarExperienceView = v4.createElement(v65, {
            changeViewFunction = v164.changeView, 
            allowAdaptiveScrolling = true, 
            adaptiveScrollingProps = if not not l_FFlagAXHideMenuOnScroll_0 or l_FFlagAXExpandPeekViewOnFirstScroll_0 then {
                enableExpandPeekViewOnUpwardScroll = l_FFlagAXExpandPeekViewOnFirstScroll_0 and true or nil, 
                enableAnimatedVisibility = l_FFlagAXHideMenuOnScroll_0 and true or nil
            } else nil, 
            isSceneFullView = v166, 
            isUIFullView = v167, 
            topBar = v164:renderSearchBar(), 
            [v4.Ref] = v164.sceneUIContainerRef, 
            NextSelectionLeft = v164.searchBarRef, 
            refinementButtonsRef = v164.refinementButtonsRef, 
            defaultChildRef = l_hasEntries_0 and v164.resultsListRef or v164.searchBarRef, 
            multiTryOnBottomBarRef = v164.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v164.itemDetailsPeekViewRefs, 
            showUndoRedo = v92() and true or nil, 
            showSaveButton = v92() and l_FFlagAXEnableManualSaving_0 and true or nil
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v67, {
                focusController = v164.props.focusController
            }), 
            ResultsList = v4.createElement(v81, {
                analyticsContext = v80.AnalyticsContext.CatalogSearch, 
                fromSearch = true, 
                searchUuid = l_searchUuid_2, 
                onRetry = v164.dispatchInitialSearch, 
                frameRef = v164.resultsListRef, 
                NextSelectionUp = v164.searchBarRef, 
                NextSelectionRight = l_refinementButtonsRef_0, 
                multiTryOnBottomBarRef = v164.multiTryOnBottomBarRef, 
                onCategoryOrSubcategoryChange = v164.onCategoryOrSubcategoryChange, 
                onCategoryOrSubcategoryChangeById = v164.onCategoryOrSubcategoryChangeById, 
                categoryInfo = if l_FFlagAXCatalogCategoriesStore_0 then nil else v164.props.categoryInfo, 
                itemDetailsPeekViewRefs = v164.itemDetailsPeekViewRefs
            })
        })
    });
end;
v114.didMount = function(v171) --[[ Line: 666 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v171.isMounted = true;
    v171.dispatchInitialSearch():catch(function(v172) --[[ Line: 668 ]]
        if not _G.__TESTEZ_RUNNING_TEST__ then
            warn("Error fetching CatalogSearch results:\n" .. tostring(v172));
        end;
    end);
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v174 = l_l_UserInputService_0_LastInputType_0 and l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v174 then
        v171.props.focusController.captureFocus();
    end;
end;
v114.willUnmount = function(v175) --[[ Line: 683 ]] --[[ Name: willUnmount ]]
    v175.isMounted = false;
    local l_searchUuid_3 = v175.props.searchUuid;
    v175.props.dispatchRemoveSearch(l_searchUuid_3);
    v175.props.pageObjectManager:storePageObject(l_searchUuid_3, nil);
    v175.props.resetSortAndFilters();
end;
v114.didUpdate = function(v177, v178) --[[ Line: 694 ]] --[[ Name: didUpdate ]]
    if v178.searchUuid ~= v177.props.searchUuid then
        if v178.searchUuid ~= nil then
            v177.props.dispatchRemoveSearch(v178.searchUuid);
            v177.props.pageObjectManager:storePageObject(v178.searchUuid, nil);
        end;
        v177.dispatchInitialSearch();
    end;
end;
v114 = v10.connect(function(v179, v180) --[[ Line: 705 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v59 (copy), l_DeviceOrientationMode_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v22 (copy), v69 (copy), l_AvatarScreen_0 (copy), l_PerformFetch_0 (copy), v46 (copy), l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 (copy)
    local v181 = v179.Search.SearchesInCatalog[v180.searchUuid];
    local v182 = v181 and v181.items or nil;
    local v183 = v182 and #v182 ~= 0 or false;
    local v184 = v59.getSearchKey(v179, v180.searchUuid);
    local v185 = v179.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v186 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v186 = v180.categoryInfo;
    else
        local l_SearchCategories_0 = v179.AvatarExperience.Catalog.SearchCategories;
        if l_SearchCategories_0 then
            local l_categoryId_0 = l_SearchCategories_0.categoryId;
            local l_subcategoryId_0 = l_SearchCategories_0.subcategoryId;
            if l_categoryId_0 == nil then
                v22("[CatalogSearch] categoryId is nil");
            else
                v186 = v59.getCatalogCategoryInfoById(l_categoryId_0, l_subcategoryId_0);
            end;
        end;
    end;
    return {
        categoryInfo = v186, 
        fullView = v69(v179, l_AvatarScreen_0.CatalogSearch), 
        hasEntries = v183, 
        dataStatus = l_PerformFetch_0.GetStatus(v179, v184), 
        topBarHeight = v46.selectTopBarHeightNoBanners(v179), 
        itemDetailsExpanded = v179.AvatarExperience.Common.ItemDetailsExpanded, 
        isPortrait = v185, 
        tryOnManagerPeekViewState = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v179.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v179.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v190) --[[ Line: 749 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v88 (copy), v83 (copy), v50 (copy), v49 (copy), v84 (copy), v72 (copy), v71 (copy), v74 (copy), v73 (copy), v85 (copy), v86 (copy), v87 (copy), v91 (copy), v48 (copy)
    return {
        dispatchSearch = function(v191, v192, v193, v194) --[[ Line: 751 ]] --[[ Name: dispatchSearch ]]
            -- upvalues: v190 (copy), v88 (ref)
            return v190(v88({
                searchKeyword = v191, 
                searchUuid = v192, 
                categoryInfo = v193
            }, v194));
        end, 
        dispatchSearchWithParameters = function(v195, v196, v197, v198) --[[ Line: 758 ]] --[[ Name: dispatchSearchWithParameters ]]
            -- upvalues: v190 (copy), v88 (ref)
            local v199 = {};
            if v195.sortAndFilters then
                v199 = v195.sortAndFilters.SelectedTopics or {};
            end;
            return v190(v88({
                searchKeyword = v195.searchKeyword, 
                searchUuid = v196, 
                categoryInfo = v197, 
                topics = v199
            }, v198));
        end, 
        dispatchRemoveSearch = function(v200) --[[ Line: 771 ]] --[[ Name: dispatchRemoveSearch ]]
            -- upvalues: v190 (copy), v83 (ref)
            v190(v83(v200));
        end, 
        setSearchType = function(v201, v202) --[[ Line: 775 ]] --[[ Name: setSearchType ]]
            -- upvalues: v190 (copy), v50 (ref)
            return v190(v50(v201, v202));
        end, 
        setSearchParameters = function(v203, v204) --[[ Line: 779 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v190 (copy), v49 (ref)
            return v190(v49(v203, v204));
        end, 
        setSortAndFilters = function(v205) --[[ Line: 783 ]] --[[ Name: setSortAndFilters ]]
            -- upvalues: v190 (copy), v84 (ref)
            return v190(v84(v205));
        end, 
        openItemPrompt = function(v206, v207, v208, v209, v210) --[[ Line: 787 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v190 (copy), v72 (ref)
            v190(v72(v206, v207, v208, v209, v210));
        end, 
        setItemDetailsPeekViewState = function(v211) --[[ Line: 791 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v190 (copy), v71 (ref)
            v190(v71(v211));
        end, 
        setFullView = function(v212, v213, v214) --[[ Line: 795 ]] --[[ Name: setFullView ]]
            -- upvalues: v190 (copy), v74 (ref)
            v190(v74(v212, v213, v214));
        end, 
        navigateIntoQuickMenu = function(v215, v216) --[[ Line: 799 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v190 (copy), v73 (ref)
            v190(v73(v215, v216));
        end, 
        resetSortAndFilters = function() --[[ Line: 803 ]] --[[ Name: resetSortAndFilters ]]
            -- upvalues: v190 (copy), v85 (ref)
            v190(v85());
        end, 
        setTryOnManagerPeekViewState = function(v217) --[[ Line: 807 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v190 (copy), v86 (ref)
            v190(v86(v217));
        end, 
        fetchWidgetInfo = function(v218, v219) --[[ Line: 811 ]] --[[ Name: fetchWidgetInfo ]]
            -- upvalues: v190 (copy), v87 (ref)
            v190(v87(v218, v219));
        end, 
        dispatchCatalogTilesLatencyStartTracker = v91() and function(v220) --[[ Line: 816 ]]
            -- upvalues: v190 (copy), v48 (ref)
            v190((v48.StartTracking(v220)));
        end or nil
    };
end)(v114);
if not l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    v114 = v62((l_withNavigation_0(v114)));
end;
v114 = v57(v63(v114), v58.Consumer, "pageObjectManager");
v114 = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then l_RoactServices_0.connect({
    avatarExperienceAnalytics = v64, 
    eventIngest = v31
})(v114) else l_RoactServices_0.connect({
    analytics = v28, 
    catalogAnalytics = v79, 
    avatarExperienceAnalytics = v64, 
    networking = v30, 
    eventIngest = v31
})(v114);
if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    return function(v221) --[[ Line: 848 ]] --[[ Name: CatalogSearchContainer ]]
        -- upvalues: l_useDispatch_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v21 (copy), v79 (copy), v30 (copy), l_useSelector_0 (copy), v105 (copy), v107 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v5 (copy), v77 (copy), v76 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v72 (copy), v56 (copy), l_AvatarScreen_0 (copy), l_PeekViewState_0 (copy), v86 (copy), l_AvatarScreenProperties_0 (copy), v12 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v113 (copy), l_useTableWrappedCallbackRef_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v100 (copy), l_useSignalState_0 (copy), v114 (ref)
        local v222 = l_useDispatch_0();
        local v223 = l_useAvatarRoute_0();
        local v224 = l_useNavigation_0();
        local v225 = v21(v79);
        local v226 = v21(v30);
        local v227 = l_useSelector_0(v105);
        local v228 = l_useSelector_0(v107);
        local l_name_1 = v223.current.name;
        local v230 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
        local v231 = v77(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v230);
        local v232 = v76({
            overlayClosedCallback = v231
        });
        local v233 = l_useLocalization_0({
            searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
        });
        local v234 = l_useDesignTokens_0();
        local v235 = nil;
        local v236 = v6.useCallback(function() --[[ Line: 875 ]]
            -- upvalues: v222 (copy), v72 (ref), v226 (copy), v225 (copy), v231 (copy), v224 (copy), v223 (copy)
            v222(v72(v226, v225, v231, v224, v223));
        end, {
            v222, 
            v231, 
            v223, 
            v224, 
            v226, 
            v225
        });
        local v237 = v6.useCallback(function() --[[ Line: 879 ]]
            -- upvalues: v56 (ref), v224 (copy), l_AvatarScreen_0 (ref)
            v56.closeFiltersAndItemDetails(v224);
            v224.navigate(l_AvatarScreen_0.TryOnManager);
        end, {
            v224
        });
        local v238 = v6.useCallback(function() --[[ Line: 884 ]]
            -- upvalues: v227 (copy), l_PeekViewState_0 (ref), v222 (copy), v86 (ref)
            if v227 == l_PeekViewState_0.Full or v227 == l_PeekViewState_0.Extended then
                v222(v86(l_PeekViewState_0.Brief));
                return;
            else
                v222(v86(l_PeekViewState_0.Full));
                return;
            end;
        end, {
            v227, 
            v222
        });
        local l_isMultiTryOn_1 = l_AvatarScreenProperties_0[v223.opaque.name].isMultiTryOn;
        local v240 = #v12.Dictionary.values(v228) > 1;
        local v241 = nil;
        if l_name_1 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_1 or l_FFlagAXMISEnableMultiShopping_0) and v240 then
            v241 = v237;
        end;
        if l_name_1 == l_AvatarScreen_0.TryOnManager or l_name_1 == l_AvatarScreen_0.LookDetails then
            v241 = v238;
        end;
        local v242 = v113(nil, if l_name_1 == l_AvatarScreen_0.ItemDetails then v236 else nil, v241);
        v235 = l_useTableWrappedCallbackRef_0(v242);
        local v243 = v12.Dictionary.join(v221, {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v230, 
            overlayClosedCallback = v231, 
            localized = v233, 
            designTokens = v234, 
            focusNavigationRef = v235, 
            avatarRoute = v223, 
            navigation = v224, 
            networking = v226, 
            tryOnManagerPeekViewState = v227
        });
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v244 = v100.getCatalogSearchSelectionStore();
            v243.categoryInfo = l_useSignalState_0(v244.selectedCategoryInfo);
        end;
        return v6.createElement("Frame", {
            ref = v232, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v6.createElement(v114, v243));
    end;
else
    return function(v245) --[[ Line: 944 ]] --[[ Name: CatalogSearchContainer ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v5 (copy), v77 (copy), v76 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v12 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v100 (copy), l_useSignalState_0 (copy), v114 (ref)
        local v246 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
        local v247 = v77(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v246);
        local v248 = v76({
            overlayClosedCallback = v247
        });
        local v249 = l_useLocalization_0({
            searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
        });
        local v250 = l_useDesignTokens_0();
        local v251 = v12.Dictionary.join(v245, {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v246, 
            overlayClosedCallback = v247, 
            localized = v249, 
            designTokens = v250
        });
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v252 = v100.getCatalogSearchSelectionStore();
            v251.categoryInfo = l_useSignalState_0(v252.selectedCategoryInfo);
        end;
        return v6.createElement("Frame", {
            ref = v248, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v6.createElement(v114, v251));
    end;
end;