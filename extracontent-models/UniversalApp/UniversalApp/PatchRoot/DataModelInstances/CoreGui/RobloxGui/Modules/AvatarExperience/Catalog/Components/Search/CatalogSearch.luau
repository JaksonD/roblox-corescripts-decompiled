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
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v39 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSearch);
local v40 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v40.Enums.AvatarScreen;
local l_AvatarRoute_0 = v40.AvatarRoute.AvatarRoute;
local l_useAvatarRoute_0 = v40.AvatarRoute.Hooks.useAvatarRoute;
local v44 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v45 = require(l_Modules_0.LuaApp.Components.SearchBar);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v47 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v48 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v49 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local l_HorizontalPageMargin_0 = require(l_CorePackages_0.Packages.UIBlox).App.Container.HorizontalPageMargin;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local _ = require(l_Common_0.AvatarExperienceState);
local v54 = require(l_Common_0.Components.RoactNavigation.NavigationUtils);
local v55 = require(l_Common_0.withContextValue);
local v56 = require(l_Common_0.Context.PageObjectManagerContext);
local v57 = require(l_Common_0.Utils);
local v58 = require(l_Common_0.NamedRefConstants);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v60 = require(l_Common_0.Components.RoactNavigation.withAvatarRoute);
local v61 = require(l_Common_0.Context.withNamedRefs);
local v62 = require(l_Common_0.Services.Analytics);
local v63 = require(l_Common_0.Components.AvatarExperienceView);
local v64 = require(l_Common_0.Components.BoundInputsUpdater);
local v65 = require(l_Common_0.Components.GamepadFocusHandlerForPage);
local v66 = require(l_Common_0.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v67 = require(l_Common_0.Selectors.selectIsFullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v69 = require(l_Common_0.Actions.SetItemDetailsPeekViewState);
local v70 = require(l_Common_0.Thunks.OpenItemPrompt);
local v71 = require(l_Common_0.Thunks.OpenQuickMenu);
local v72 = require(l_Common_0.Thunks.SetFullView);
local v73 = require(l_Common_0.Enum.FullView);
local v74 = require(l_Common_0.Hooks.useAvatarExperienceFocusNavigationBindings);
local v75 = require(l_Common_0.Hooks.useOverlayClosedCallback);
local l_Catalog_0 = l_Modules_0.AvatarExperience.Catalog;
local v77 = require(l_Catalog_0.Services.Analytics);
local v78 = require(l_Catalog_0.CatalogConstants);
local v79 = require(l_Catalog_0.Components.Search.ResultsList);
local v80 = require(l_Catalog_0.CatalogUtils);
local v81 = require(l_Catalog_0.Actions.RemoveSearchInCatalog);
local v82 = require(l_Catalog_0.Actions.SetSortAndFilters);
local v83 = require(l_Catalog_0.Actions.ResetSortAndFilters);
local v84 = require(l_Catalog_0.Actions.SetTryOnManagerPeekViewState);
local v85 = require(l_Catalog_0.Thunks.FetchWidgetInfo);
local v86 = require(l_Catalog_0.Thunks.ApiFetchCatalogSearch);
local l_Flags_0 = l_Modules_0.AvatarExperience.Flags;
local v88 = require(l_Flags_0.GetFFlagAvatarAutocompleteEnabledForAll);
local v89 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v90 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXEnableManualSaving_0 = v35.FFlagAXEnableManualSaving;
local l_FFlagAXMISEnableMultiShopping_0 = v35.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogSearchToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = v35.FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXHideMenuOnScroll_0 = v35.FFlagAXHideMenuOnScroll;
local l_FFlagAXCatalogCategoriesStore_0 = v35.FFlagAXCatalogCategoriesStore;
local v98 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_RecentSearchTermsAppStorage_0 = v39.Utils.RecentSearchTermsAppStorage;
local v101 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.ToggleTryOn
};
local function v103(v102) --[[ Line: 148 ]]
    return v102.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v105(v104) --[[ Line: 152 ]]
    return v104.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v111(v106, v107, v108) --[[ Line: 156 ]] --[[ Name: useCatalogSearchFocusNavigationBindings ]]
    -- upvalues: v24 (copy), v101 (copy), v6 (copy), l_FocusNavigationEventNameEnum_0 (copy), v25 (copy)
    local v109 = v24.useEventMap(v101, v106);
    local v110 = v6.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v107 (copy), v25 (ref), v108 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt] = if v107 then {
                handler = v25.onRelease(v107)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.ToggleTryOn] = if v108 then {
                handler = v25.onRelease(v108)
            } else nil
        };
    end, {
        v107, 
        v108
    });
    return v24.useEventHandlerMap(v110, v109);
end;
local v112 = v4.PureComponent:extend("CatalogSearch");
v112.validateProps = v11.strictInterface({
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
    dispatchCatalogTilesLatencyStartTracker = if v89() then v11.callback else nil, 
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
v112.init = function(v113) --[[ Line: 237 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_AvatarScreen_0 (copy), v58 (copy), v5 (copy), v73 (copy), v80 (copy), v13 (copy), v33 (copy), v32 (copy), v88 (copy), v49 (copy), l_RecentSearchTermsAppStorage_0 (copy), v54 (copy), v57 (copy), v89 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), v36 (copy)
    local v114, v115 = v4.createBinding(0);
    v113.pillBarScrollOffset = v114;
    v113.updatePillBarScrollOffset = v115;
    v113.searchBarRef = v4.createRef();
    v113.sceneUIContainerRef = v4.createRef();
    v113.resultsListRef = v113.props.namedRefs[l_AvatarScreen_0.CatalogSearch .. v58.ItemsList];
    v113.refinementButtonsRef = v4.createRef();
    v113.multiTryOnBottomBarRef = v4.createRef();
    v113.isMounted = false;
    v113.itemDetailsPeekViewRefs = v5.createRefCache();
    v113:setState({
        isSearching = false
    });
    v113.onNavBarSizeChanged = function(v116) --[[ Line: 253 ]]
        -- upvalues: v113 (copy)
        if v113.resultsListRef.current then
            v113.resultsListRef.current.Size = UDim2.new(1, 0, 1, -v116.Y);
        end;
    end;
    v113.dispatchInitialSearch = function() --[[ Line: 259 ]]
        -- upvalues: v113 (copy), v73 (ref), v80 (ref), v13 (ref)
        local l_searchUuid_0 = v113.props.searchUuid;
        local l_searchParameters_0 = v113.props.searchParameters;
        local l_dispatchSearchWithParameters_0 = v113.props.dispatchSearchWithParameters;
        local v120 = v113.props.fullView == v73.SceneFullView;
        local l_avatarExperienceAnalytics_0 = v113.props.avatarExperienceAnalytics;
        if v120 then
            v113.props.setFullView(l_avatarExperienceAnalytics_0, v113.props.avatarRoute.opaque.name, v73.None);
        end;
        local l_fetchWidgetInfo_0 = v113.props.fetchWidgetInfo;
        local l_networking_0 = v113.props.networking;
        local v124 = v80.getQueryStringForSearchWidgets(l_searchParameters_0);
        if v124 then
            l_fetchWidgetInfo_0(l_networking_0, v124);
        end;
        local l_categoryInfo_0 = v113.props.categoryInfo;
        if not l_searchParameters_0.categoryInfo then
            l_searchParameters_0 = v13.join(l_searchParameters_0, {
                categoryInfo = l_categoryInfo_0
            });
            v113.props.setSearchParameters(l_searchUuid_0, l_searchParameters_0);
        end;
        return l_dispatchSearchWithParameters_0(l_searchParameters_0, l_searchUuid_0, l_categoryInfo_0, v113.props.networking);
    end;
    v113.setUIFullView = function() --[[ Line: 290 ]]
        -- upvalues: v113 (copy), v73 (ref)
        local l_avatarExperienceAnalytics_1 = v113.props.avatarExperienceAnalytics;
        v113.props.setFullView(l_avatarExperienceAnalytics_1, v113.props.avatarRoute.opaque.name, v73.UIFullView);
    end;
    v113.confirmSearchCallback = function(v127, v128, v129) --[[ Line: 295 ]]
        -- upvalues: v33 (ref), v113 (copy), v13 (ref), v32 (ref), v88 (ref), l_AvatarScreen_0 (ref), v49 (ref), l_RecentSearchTermsAppStorage_0 (ref), v54 (ref)
        local v130 = v33();
        local l_categoryInfo_1 = v113.props.categoryInfo;
        local v132 = nil;
        local v133 = v113.props.navigation.getParam("searchParams") or {};
        v132 = v13.join(v133, {
            searchKeyword = v127, 
            isKeywordSuggestionEnabled = true, 
            categoryInfo = l_categoryInfo_1
        });
        v113.props.setSearchType(v130, v32.SearchTypes.Catalog);
        v113.props.setSearchParameters(v130, v132);
        if v88() then
            if v113.props.isPortrait then
                v113.setUIFullView();
            end;
            local l_CatalogSearch_0 = l_AvatarScreen_0.CatalogSearch;
            v49(v113.props.eventIngest, "catalog", v127, v128, l_CatalogSearch_0, v129);
        end;
        l_RecentSearchTermsAppStorage_0.addTerm(v127);
        v54.navigateToSearch(v113.props.navigation, v130, v132);
    end;
    v113.cancelSearchCallback = function() --[[ Line: 337 ]]
        -- upvalues: v113 (copy), l_AvatarScreen_0 (ref)
        v113.props.navigation.navigate(l_AvatarScreen_0.Catalog);
        if v113.isMounted then
            v113:setState({
                isSearching = false
            });
        end;
    end;
    v113.onSearchBarFocused = function() --[[ Line: 347 ]]
        -- upvalues: v113 (copy)
        if not v113.isMounted then
            return;
        else
            v113:setState({
                isSearching = true
            });
            return;
        end;
    end;
    v113.changeView = function() --[[ Line: 357 ]]
        -- upvalues: v113 (copy), v57 (ref)
        local l_avatarExperienceAnalytics_2 = v113.props.avatarExperienceAnalytics;
        local v136 = v57.getNewFullViewEnum(v113.props.fullView);
        v113.props.setFullView(l_avatarExperienceAnalytics_2, v113.props.avatarRoute.opaque.name, v136);
    end;
    v113.onSameTermConfirmSearch = function() --[[ Line: 364 ]]
        -- upvalues: v113 (copy)
        if v113.isMounted then
            v113:setState({
                isSearching = false
            });
        end;
    end;
    v113.clearSearchState = function(v137) --[[ Line: 372 ]]
        -- upvalues: v113 (copy)
        v113.props.dispatchRemoveSearch(v137);
        v113.props.pageObjectManager:storePageObject(v137, nil);
    end;
    v113.dispatchWidgetSearch = function() --[[ Line: 377 ]]
        -- upvalues: v113 (copy), v80 (ref)
        local l_searchParameters_1 = v113.props.searchParameters;
        local l_fetchWidgetInfo_1 = v113.props.fetchWidgetInfo;
        local l_networking_1 = v113.props.networking;
        local v141 = v80.getQueryStringForSearchWidgets(l_searchParameters_1);
        if v141 then
            l_fetchWidgetInfo_1(l_networking_1, v141);
        end;
    end;
    v113.onCategoryOrSubcategoryChangeById = function(v142, v143) --[[ Line: 387 ]]
        -- upvalues: v57 (ref), v113 (copy), v89 (ref), l_FFlagAXEnableTTIViaModule_0 (ref), l_TimeToInteractiveTracker_0 (ref), v36 (ref)
        local v144 = v57.getCatalogCategoryInfoById(v142, v143);
        if v144 ~= v113.props.categoryInfo then
            v113.dispatchSearchOnCategoryOrSubcategoryChange(v144);
            if v89() then
                if l_FFlagAXEnableTTIViaModule_0 then
                    l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Organic.Tiles);
                    l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Organic.Thumbnails);
                    l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Widget.Tiles);
                    l_TimeToInteractiveTracker_0.trackStart(v36.Counter.PREFIX .. v36.Counter.Latency.Widget.Thumbnails);
                end;
                v113.props.dispatchCatalogTilesLatencyStartTracker(v113.props.searchUuid);
            end;
        end;
    end;
    v113.dispatchSearchOnCategoryOrSubcategoryChange = function(v145) --[[ Line: 420 ]]
        -- upvalues: v113 (copy), v13 (ref)
        local l_searchUuid_1 = v113.props.searchUuid;
        local l_searchParameters_2 = v113.props.searchParameters;
        local l_dispatchSearch_0 = v113.props.dispatchSearch;
        local v149 = v13.join(l_searchParameters_2, {
            categoryInfo = v13.join({}, v145)
        });
        v113.props.setSearchParameters(l_searchUuid_1, v149);
        v113.clearSearchState(l_searchUuid_1);
        if v145 and v145.ShowWidgets then
            v113.dispatchWidgetSearch();
        end;
        return l_dispatchSearch_0(l_searchParameters_2.searchKeyword, l_searchUuid_1, v145, v113.props.networking);
    end;
end;
if not l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    v112.getInputBindings = function(v150) --[[ Line: 441 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreenProperties_0 (copy), v12 (copy), v5 (copy), v54 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_PeekViewState_0 (copy)
        local l_avatarRoute_0 = v150.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local l_isMultiTryOn_0 = l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
        local v154 = #v12.Dictionary.values(v150.props.tryOnItems) > 1;
        local v155 = {
            NavigateBack = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 449 ]]
                -- upvalues: v54 (ref), v150 (copy)
                v54.closeFocusedScreen(v150.props.navigation);
            end), 
            OpenTryOnManager = if l_name_0 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_0 or l_FFlagAXMISEnableMultiShopping_0) and v154 then v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 455 ]]
                -- upvalues: v54 (ref), v150 (copy), l_AvatarScreen_0 (ref)
                v54.closeFiltersAndItemDetails(v150.props.navigation);
                v150.props.navigation.navigate(l_AvatarScreen_0.TryOnManager);
            end, {
                key = "Feature.Catalog.Label.TryOns"
            }) else nil
        };
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            return (v12.Dictionary.join(v155, {
                OpenItemPrompt = v5.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 466 ]]
                    -- upvalues: v150 (copy), l_avatarRoute_0 (copy)
                    v150.props.openItemPrompt(v150.props.networking, v150.props.catalogAnalytics, v150.props.overlayClosedCallback, v150.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v5.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 477 ]]
                    -- upvalues: v150 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                    v150.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_avatarRoute_0.current.params.itemId, 
                        itemType = l_avatarRoute_0.current.params.itemType, 
                        onOverlayClosed = v150.props.overlayClosedCallback
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            }));
        elseif l_name_0 == l_AvatarScreen_0.TryOnManager then
            return (v12.Dictionary.join(v155, {
                OpenCloseTryOnManager = v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 489 ]]
                    -- upvalues: v150 (copy), l_PeekViewState_0 (ref)
                    local l_tryOnManagerPeekViewState_0 = v150.props.tryOnManagerPeekViewState;
                    if l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v150.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v150.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }));
        else
            if l_name_0 == l_AvatarScreen_0.LookDetails then
                v155 = v12.Dictionary.join(v155, {
                    OpenCloseTryOnManager = v5.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 502 ]]
                        -- upvalues: v150 (copy), l_PeekViewState_0 (ref)
                        local l_tryOnManagerPeekViewState_1 = v150.props.tryOnManagerPeekViewState;
                        if l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Extended then
                            v150.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                            return;
                        else
                            v150.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                            return;
                        end;
                    end, {
                        key = "Feature.Catalog.Label.TryOns"
                    })
                });
            end;
            return v155;
        end;
    end;
end;
v112.renderSearchBar = function(v158) --[[ Line: 519 ]] --[[ Name: renderSearchBar ]]
    -- upvalues: v4 (copy), v88 (copy), l_HorizontalPageMargin_0 (copy), v45 (copy), v32 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local l_searchKeyword_0 = v158.props.searchParameters.searchKeyword;
    local l_topBarHeight_0 = v158.props.topBarHeight;
    local v161 = 20;
    if v158.props.designTokens then
        v161 = v158.props.designTokens.Global.Space_600;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = v88() and 3 or nil
    }, {
        PaddedFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            SearchBarPadding = if v158.props.isPortrait then v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v161)
            }) else nil, 
            SearchBar = v4.createElement(l_HorizontalPageMargin_0, {
                backgroundTransparency = 1, 
                backgroundColor3 = Color3.fromRGB(0, 0, 0)
            }, {
                v4.createElement(v45, {
                    cancelSearch = v158.cancelSearchCallback, 
                    confirmSearch = v158.confirmSearchCallback, 
                    onFocused = v158.onSearchBarFocused, 
                    placeholderText = v158.props.localized.searchPlaceholder, 
                    isCompactView = true, 
                    modernUI = true, 
                    autocomplete = v88(), 
                    isSearching = v158.state.isSearching, 
                    searchType = v32.SearchTypes.Catalog, 
                    initialSearchText = l_searchKeyword_0, 
                    [v4.Ref] = v158.searchBarRef, 
                    NextSelectionDown = v158.resultsListRef, 
                    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v158.props.focusController, 
                    forceShowCancelButton = v88(), 
                    onSameTermConfirmSearch = v158.onSameTermConfirmSearch, 
                    shouldShowRecentSearchTerms = true
                })
            })
        })
    });
end;
v112.render = function(v162) --[[ Line: 574 ]] --[[ Name: render ]]
    -- upvalues: v73 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 (copy), v64 (copy), v8 (copy), v66 (copy), v63 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v90 (copy), l_FFlagAXEnableManualSaving_0 (copy), v65 (copy), v79 (copy), v78 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy)
    local l_hasEntries_0 = v162.props.hasEntries;
    local v164 = v162.props.fullView == v73.SceneFullView;
    local v165 = v162.props.fullView == v73.UIFullView;
    local l_searchUuid_2 = v162.props.searchUuid;
    local l_refinementButtonsRef_0 = v162.refinementButtonsRef;
    if v162.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
        l_refinementButtonsRef_0 = v162.props.namedRefs[l_AvatarScreen_0.TryOnManager];
    elseif v162.props.avatarRoute.current.name == l_AvatarScreen_0.LookDetails then
        l_refinementButtonsRef_0 = v162.props.namedRefs[l_AvatarScreen_0.LookDetails];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v162.props.focusController, 
        defaultChild = l_hasEntries_0 and v162.resultsListRef or v162.searchBarRef, 
        inputBindings = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v162:getInputBindings(), 
        [v4.Ref] = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then v162.props.focusNavigationRef else nil
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v64), 
        NavigationEvents = v4.createElement(v8.NavigationEvents, {
            onDidFocus = function() --[[ Line: 598 ]] --[[ Name: onDidFocus ]]
                -- upvalues: v162 (copy)
                local l_sortAndFilters_0 = (v162.props.navigation.getParam("searchParams") or {}).sortAndFilters;
                if l_sortAndFilters_0 then
                    v162.props.setSortAndFilters(l_sortAndFilters_0);
                    return;
                else
                    v162.props.resetSortAndFilters();
                    return;
                end;
            end
        }), 
        NavigationEventsLogger = v4.createElement(v66, {
            pageName = "CatalogSearch"
        }), 
        AvatarExperienceView = v4.createElement(v63, {
            changeViewFunction = v162.changeView, 
            allowAdaptiveScrolling = true, 
            adaptiveScrollingProps = if not not l_FFlagAXHideMenuOnScroll_0 or l_FFlagAXExpandPeekViewOnFirstScroll_0 then {
                enableExpandPeekViewOnUpwardScroll = l_FFlagAXExpandPeekViewOnFirstScroll_0 and true or nil, 
                enableAnimatedVisibility = l_FFlagAXHideMenuOnScroll_0 and true or nil
            } else nil, 
            isSceneFullView = v164, 
            isUIFullView = v165, 
            topBar = v162:renderSearchBar(), 
            [v4.Ref] = v162.sceneUIContainerRef, 
            NextSelectionLeft = v162.searchBarRef, 
            refinementButtonsRef = v162.refinementButtonsRef, 
            defaultChildRef = l_hasEntries_0 and v162.resultsListRef or v162.searchBarRef, 
            multiTryOnBottomBarRef = v162.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v162.itemDetailsPeekViewRefs, 
            showUndoRedo = v90() and true or nil, 
            showSaveButton = v90() and l_FFlagAXEnableManualSaving_0 and true or nil
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v65, {
                focusController = v162.props.focusController
            }), 
            ResultsList = v4.createElement(v79, {
                analyticsContext = v78.AnalyticsContext.CatalogSearch, 
                fromSearch = true, 
                searchUuid = l_searchUuid_2, 
                onRetry = v162.dispatchInitialSearch, 
                frameRef = v162.resultsListRef, 
                NextSelectionUp = v162.searchBarRef, 
                NextSelectionRight = l_refinementButtonsRef_0, 
                multiTryOnBottomBarRef = v162.multiTryOnBottomBarRef, 
                onCategoryOrSubcategoryChange = v162.onCategoryOrSubcategoryChange, 
                onCategoryOrSubcategoryChangeById = v162.onCategoryOrSubcategoryChangeById, 
                categoryInfo = if l_FFlagAXCatalogCategoriesStore_0 then nil else v162.props.categoryInfo, 
                itemDetailsPeekViewRefs = v162.itemDetailsPeekViewRefs
            })
        })
    });
end;
v112.didMount = function(v169) --[[ Line: 658 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v169.isMounted = true;
    v169.dispatchInitialSearch():catch(function(v170) --[[ Line: 660 ]]
        if not _G.__TESTEZ_RUNNING_TEST__ then
            warn("Error fetching CatalogSearch results:\n" .. tostring(v170));
        end;
    end);
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v172 = l_l_UserInputService_0_LastInputType_0 and l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0);
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v172 then
        v169.props.focusController.captureFocus();
    end;
end;
v112.willUnmount = function(v173) --[[ Line: 675 ]] --[[ Name: willUnmount ]]
    v173.isMounted = false;
    local l_searchUuid_3 = v173.props.searchUuid;
    v173.props.dispatchRemoveSearch(l_searchUuid_3);
    v173.props.pageObjectManager:storePageObject(l_searchUuid_3, nil);
    v173.props.resetSortAndFilters();
end;
v112.didUpdate = function(v175, v176) --[[ Line: 686 ]] --[[ Name: didUpdate ]]
    if v176.searchUuid ~= v175.props.searchUuid then
        if v176.searchUuid ~= nil then
            v175.props.dispatchRemoveSearch(v176.searchUuid);
            v175.props.pageObjectManager:storePageObject(v176.searchUuid, nil);
        end;
        v175.dispatchInitialSearch();
    end;
end;
v112 = v10.connect(function(v177, v178) --[[ Line: 697 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v57 (copy), l_DeviceOrientationMode_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v22 (copy), v67 (copy), l_AvatarScreen_0 (copy), l_PerformFetch_0 (copy), v44 (copy), l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 (copy)
    local v179 = v177.Search.SearchesInCatalog[v178.searchUuid];
    local v180 = v179 and v179.items or nil;
    local v181 = v180 and #v180 ~= 0 or false;
    local v182 = v57.getSearchKey(v177, v178.searchUuid);
    local v183 = v177.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v184 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v184 = v178.categoryInfo;
    else
        local l_SearchCategories_0 = v177.AvatarExperience.Catalog.SearchCategories;
        if l_SearchCategories_0 then
            local l_categoryId_0 = l_SearchCategories_0.categoryId;
            local l_subcategoryId_0 = l_SearchCategories_0.subcategoryId;
            if l_categoryId_0 == nil then
                v22("[CatalogSearch] categoryId is nil");
            else
                v184 = v57.getCatalogCategoryInfoById(l_categoryId_0, l_subcategoryId_0);
            end;
        end;
    end;
    return {
        categoryInfo = v184, 
        fullView = v67(v177, l_AvatarScreen_0.CatalogSearch), 
        hasEntries = v181, 
        dataStatus = l_PerformFetch_0.GetStatus(v177, v182), 
        topBarHeight = v44.selectTopBarHeightNoBanners(v177), 
        itemDetailsExpanded = v177.AvatarExperience.Common.ItemDetailsExpanded, 
        isPortrait = v183, 
        tryOnManagerPeekViewState = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v177.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then nil else v177.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v188) --[[ Line: 741 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v86 (copy), v81 (copy), v48 (copy), v47 (copy), v82 (copy), v70 (copy), v69 (copy), v72 (copy), v71 (copy), v83 (copy), v84 (copy), v85 (copy), v89 (copy), v46 (copy)
    return {
        dispatchSearch = function(v189, v190, v191, v192) --[[ Line: 743 ]] --[[ Name: dispatchSearch ]]
            -- upvalues: v188 (copy), v86 (ref)
            return v188(v86({
                searchKeyword = v189, 
                searchUuid = v190, 
                categoryInfo = v191
            }, v192));
        end, 
        dispatchSearchWithParameters = function(v193, v194, v195, v196) --[[ Line: 750 ]] --[[ Name: dispatchSearchWithParameters ]]
            -- upvalues: v188 (copy), v86 (ref)
            local v197 = {};
            if v193.sortAndFilters then
                v197 = v193.sortAndFilters.SelectedTopics or {};
            end;
            return v188(v86({
                searchKeyword = v193.searchKeyword, 
                searchUuid = v194, 
                categoryInfo = v195, 
                topics = v197
            }, v196));
        end, 
        dispatchRemoveSearch = function(v198) --[[ Line: 763 ]] --[[ Name: dispatchRemoveSearch ]]
            -- upvalues: v188 (copy), v81 (ref)
            v188(v81(v198));
        end, 
        setSearchType = function(v199, v200) --[[ Line: 767 ]] --[[ Name: setSearchType ]]
            -- upvalues: v188 (copy), v48 (ref)
            return v188(v48(v199, v200));
        end, 
        setSearchParameters = function(v201, v202) --[[ Line: 771 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v188 (copy), v47 (ref)
            return v188(v47(v201, v202));
        end, 
        setSortAndFilters = function(v203) --[[ Line: 775 ]] --[[ Name: setSortAndFilters ]]
            -- upvalues: v188 (copy), v82 (ref)
            return v188(v82(v203));
        end, 
        openItemPrompt = function(v204, v205, v206, v207, v208) --[[ Line: 779 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v188 (copy), v70 (ref)
            v188(v70(v204, v205, v206, v207, v208));
        end, 
        setItemDetailsPeekViewState = function(v209) --[[ Line: 783 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v188 (copy), v69 (ref)
            v188(v69(v209));
        end, 
        setFullView = function(v210, v211, v212) --[[ Line: 787 ]] --[[ Name: setFullView ]]
            -- upvalues: v188 (copy), v72 (ref)
            v188(v72(v210, v211, v212));
        end, 
        navigateIntoQuickMenu = function(v213, v214) --[[ Line: 791 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v188 (copy), v71 (ref)
            v188(v71(v213, v214));
        end, 
        resetSortAndFilters = function() --[[ Line: 795 ]] --[[ Name: resetSortAndFilters ]]
            -- upvalues: v188 (copy), v83 (ref)
            v188(v83());
        end, 
        setTryOnManagerPeekViewState = function(v215) --[[ Line: 799 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v188 (copy), v84 (ref)
            v188(v84(v215));
        end, 
        fetchWidgetInfo = function(v216, v217) --[[ Line: 803 ]] --[[ Name: fetchWidgetInfo ]]
            -- upvalues: v188 (copy), v85 (ref)
            v188(v85(v216, v217));
        end, 
        dispatchCatalogTilesLatencyStartTracker = v89() and function(v218) --[[ Line: 808 ]]
            -- upvalues: v188 (copy), v46 (ref)
            v188((v46.StartTracking(v218)));
        end or nil
    };
end)(v112);
if not l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    v112 = v60((l_withNavigation_0(v112)));
end;
v112 = v55(v61(v112), v56.Consumer, "pageObjectManager");
v112 = if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then l_RoactServices_0.connect({
    avatarExperienceAnalytics = v62, 
    eventIngest = v31
})(v112) else l_RoactServices_0.connect({
    analytics = v28, 
    catalogAnalytics = v77, 
    avatarExperienceAnalytics = v62, 
    networking = v30, 
    eventIngest = v31
})(v112);
if l_FFlagAXMigrateCatalogSearchToFocusNavigation_0 then
    return function(v219) --[[ Line: 840 ]] --[[ Name: CatalogSearchContainer ]]
        -- upvalues: l_useDispatch_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v21 (copy), v77 (copy), v30 (copy), l_useSelector_0 (copy), v103 (copy), v105 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v5 (copy), v75 (copy), v74 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v70 (copy), v54 (copy), l_AvatarScreen_0 (copy), l_PeekViewState_0 (copy), v84 (copy), l_AvatarScreenProperties_0 (copy), v12 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v111 (copy), l_useTableWrappedCallbackRef_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v98 (copy), l_useSignalState_0 (copy), v112 (ref)
        local v220 = l_useDispatch_0();
        local v221 = l_useAvatarRoute_0();
        local v222 = l_useNavigation_0();
        local v223 = v21(v77);
        local v224 = v21(v30);
        local v225 = l_useSelector_0(v103);
        local v226 = l_useSelector_0(v105);
        local l_name_1 = v221.current.name;
        local v228 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
        local v229 = v75(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v228);
        local v230 = v74({
            overlayClosedCallback = v229
        });
        local v231 = l_useLocalization_0({
            searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
        });
        local v232 = l_useDesignTokens_0();
        local v233 = nil;
        local v234 = v6.useCallback(function() --[[ Line: 867 ]]
            -- upvalues: v220 (copy), v70 (ref), v224 (copy), v223 (copy), v229 (copy), v222 (copy), v221 (copy)
            v220(v70(v224, v223, v229, v222, v221));
        end, {
            v220, 
            v229, 
            v221, 
            v222, 
            v224, 
            v223
        });
        local v235 = v6.useCallback(function() --[[ Line: 871 ]]
            -- upvalues: v54 (ref), v222 (copy), l_AvatarScreen_0 (ref)
            v54.closeFiltersAndItemDetails(v222);
            v222.navigate(l_AvatarScreen_0.TryOnManager);
        end, {
            v222
        });
        local v236 = v6.useCallback(function() --[[ Line: 876 ]]
            -- upvalues: v225 (copy), l_PeekViewState_0 (ref), v220 (copy), v84 (ref)
            if v225 == l_PeekViewState_0.Full or v225 == l_PeekViewState_0.Extended then
                v220(v84(l_PeekViewState_0.Brief));
                return;
            else
                v220(v84(l_PeekViewState_0.Full));
                return;
            end;
        end, {
            v225, 
            v220
        });
        local l_isMultiTryOn_1 = l_AvatarScreenProperties_0[v221.opaque.name].isMultiTryOn;
        local v238 = #v12.Dictionary.values(v226) > 1;
        local v239 = nil;
        if l_name_1 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_1 or l_FFlagAXMISEnableMultiShopping_0) and v238 then
            v239 = v235;
        end;
        if l_name_1 == l_AvatarScreen_0.TryOnManager or l_name_1 == l_AvatarScreen_0.LookDetails then
            v239 = v236;
        end;
        local v240 = v111(nil, if l_name_1 == l_AvatarScreen_0.ItemDetails then v234 else nil, v239);
        v233 = l_useTableWrappedCallbackRef_0(v240);
        local v241 = v12.Dictionary.join(v219, {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v228, 
            overlayClosedCallback = v229, 
            localized = v231, 
            designTokens = v232, 
            focusNavigationRef = v233, 
            avatarRoute = v221, 
            navigation = v222, 
            networking = v224, 
            tryOnManagerPeekViewState = v225
        });
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v242 = v98.getCatalogSearchSelectionStore();
            v241.categoryInfo = l_useSignalState_0(v242.selectedCategoryInfo);
        end;
        return v6.createElement("Frame", {
            ref = v230, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v6.createElement(v112, v241));
    end;
else
    return function(v243) --[[ Line: 936 ]] --[[ Name: CatalogSearchContainer ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v6 (copy), v5 (copy), v75 (copy), v74 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v12 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v98 (copy), l_useSignalState_0 (copy), v112 (ref)
        local v244 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v6.useRef(v5.createFocusController()).current;
        local v245 = v75(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v244);
        local v246 = v74({
            overlayClosedCallback = v245
        });
        local v247 = l_useLocalization_0({
            searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
        });
        local v248 = l_useDesignTokens_0();
        local v249 = v12.Dictionary.join(v243, {
            focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v244, 
            overlayClosedCallback = v245, 
            localized = v247, 
            designTokens = v248
        });
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v250 = v98.getCatalogSearchSelectionStore();
            v249.categoryInfo = l_useSignalState_0(v250.selectedCategoryInfo);
        end;
        return v6.createElement("Frame", {
            ref = v246, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v6.createElement(v112, v249));
    end;
end;