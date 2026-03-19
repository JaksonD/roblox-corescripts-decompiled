local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(l_CorePackages_0.Packages.Cryo);
local v11 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v11.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local l_ExternalEventConnection_0 = v11.ExternalEventConnection;
local l_isGamepadInput_0 = v11.isGamepadInput;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local l_AXRemoveBackButtonDesktopClientsIXPTest_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXRemoveBackButtonDesktopClientsIXPTest;
local v19 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v21 = require(l_Modules_0.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore);
local v22 = require(l_Modules_0.LuaApp.AppPage);
local v23 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v24.Enums.AvatarScreen;
local l_AvatarScreenProperties_0 = v24.AvatarRoute.AvatarScreenProperties;
local l_useAvatarRoute_0 = v24.AvatarRoute.Hooks.useAvatarRoute;
local v28 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v29 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v31 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v40 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v41 = require(l_Modules_0.LuaApp.Context.useTopBarSearchSignal);
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeTitleDropDown);
local v43 = if require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXTransitionMenuV2)() then require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionSegmentedMenu) else require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionSegmentedMenu_DEPRECATED);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton);
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Components.NavigationItemsView);
local v47 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v50 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v51 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v53 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsPeekViewState);
local v54 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemPrompt);
local v55 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v56 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v57 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v58 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenQuickMenu);
local v59 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v60 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonConnection);
local v61 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible);
local v62 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v63 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v64 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v65 = require(l_Modules_0.LuaApp.Thunks.InstantResetNavigationHistory);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v67 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExposureLogger);
local v68 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local v69 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v70 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback);
local v71 = require(l_Modules_0.AvatarExperience.Common.Hooks.useQuickMenuAvailable);
local v72 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v75 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchCategoryAndSubcategory);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v77 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v79 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v80 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksIXPLogging);
local v81 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v84 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagDynamicHeadsMigration_0 = v84.FFlagDynamicHeadsMigration;
local v86 = require(l_Modules_0.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests);
local v87 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v88 = require(l_Modules_0.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP);
local v89 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
local l_AXAvatarsTabIXP_0 = v19.Experiments.AXAvatarsTabIXP;
local l_getBackendLayerNamesForCatalog_0 = v19.Utils.getBackendLayerNamesForCatalog;
local l_UserIsInExperiment_0 = v84.FFlagsAXPrefetchMarketplaceThumbnailsXP.UserIsInExperiment;
local v93 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableRelevanceRecommendationsLayerExposure);
local v94 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableSortsLayerExposure);
local v95 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableRecommendationsAndSearchLayerExposure);
local v96 = require(l_Modules_0.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter);
local l_FFlagAXMigrateCatalogPageInputBindings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogPageInputBindings;
local v98 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName);
local l_FFlagAXAvatarTimeoutFlow_0 = v84.FFlagAXAvatarTimeoutFlow;
local l_FFlagAXMISEnableMultiShopping_0 = v84.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMakeupReleaseFTUX_0 = v84.FFlagAXMakeupReleaseFTUX;
local l_FFlagAXOpaqueMarketplaceTopbar_0 = v84.FFlagAXOpaqueMarketplaceTopbar;
local l_FFlagAXBackendDrivenCatalogLayers_0 = v84.FFlagAXBackendDrivenCatalogLayers;
local v104 = game:DefineFastFlag("AXEnableIXPCounters2", false);
local v105 = game:DefineFastFlag("AXCustomizeOverhaulCatalogExposure2", false);
local v106 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogCategoriesStore_0 = v84.FFlagAXCatalogCategoriesStore;
local v109 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v110 = game:DefineFastString("AXMISExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local v111 = game:DefineFastFlag("AXMISExposureLogging", false);
local v112 = game:DefineFastString("AXTaxonomyM20ExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = v84.FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXEnableCategoryPillsExposureLogging_0 = v84.FFlagAXEnableCategoryPillsExposureLogging;
local l_FFlagAXHideMenuOnScroll_0 = v84.FFlagAXHideMenuOnScroll;
local l_FFlagAXFixCatalogRefreshRendering_0 = v84.FFlagAXFixCatalogRefreshRendering;
local l_FFlagBasedExposureLoggingCatalogPage_0 = v84.FFlagBasedExposureLoggingCatalogPage;
local l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 = v84.FFlagAXEnableTaxonomyM20ExposureLoggingCatalog;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v84.FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 = v84.FFlagAXMoveCatalogFilterToL1NavigationExposureLogging;
local l_FFlagAXDefaultCatalogCategoryId_0 = v84.FFlagAXDefaultCatalogCategoryId;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v84.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v124 = game:DefineFastFlag("FFlagAXCatalogCategoriesSDUIExposureLogging", false);
local v125 = game:DefineFastString("FStringAXCatalogCategoriesSDUIExposureLayer", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local l_FFlagAXCatalogM41CategoriesExposureLogging_0 = v84.FFlagAXCatalogM41CategoriesExposureLogging;
local v127 = require(script.Parent.useCatalogPageFocusNavigationBindings);
local v128 = require(script.Parent.useCatalogPageRevertToLastEquippedStateHook);
local l_useCatalogPageMISIntroFtux_0 = v20.Hooks.useCatalogPageMISIntroFtux;
local l_useCatalogPageTimeoutPrompt_0 = v20.Hooks.useCatalogPageTimeoutPrompt;
local l_useCatalogPageMakeupReleaseFtux_0 = v20.Hooks.useCatalogPageMakeupReleaseFtux;
local v132 = require(l_Modules_0.LuaApp.mutedError);
local v133 = l_Images_0["icons/actions/truncationExpand"];
local l_CatalogCategories_0 = v19.Enums.CatalogCategories;
local function v136(v135) --[[ Line: 204 ]] --[[ Name: selectTryOnManagerViewState ]]
    return v135.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v139(v137) --[[ Line: 208 ]] --[[ Name: selectIsTryOnButtonShowing ]]
    -- upvalues: v10 (copy)
    local l_TryOnItems_0 = v137.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return #v10.Dictionary.values(l_TryOnItems_0) > 1;
end;
local v140 = v4.PureComponent:extend("CatalogPage");
v140.validateProps = v7.strictInterface({
    fullView = v7.optional(v7.userdata), 
    isPortrait = v7.optional(v7.boolean), 
    itemDetailsExpanded = v7.optional(v7.boolean), 
    tryOnManagerPeekViewState = v7.optional(v7.valueOf(l_PeekViewState_0)), 
    tryOnItems = v7.optional(v7.table), 
    openItemPrompt = v7.callback, 
    setItemDetailsPeekViewState = v7.callback, 
    navigateIntoQuickMenu = v7.optional(v7.callback), 
    setFullView = v7.callback, 
    resetNavigationHistory = v7.callback, 
    instantResetNavigationHistory = v7.callback, 
    setTryOnManagerPeekViewState = v7.callback, 
    resetSearchCategoryAndSubcategory = v7.callback, 
    namedRefs = v7.table, 
    prevNavPage = v7.optional(v7.string), 
    prevNavHistory = v7.optional(v7.table), 
    navigation = v7.optional(v7.table), 
    avatarRoute = v7.optional(v7.table), 
    avatarExperienceAnalytics = v7.optional(v7.table), 
    networking = v7.optional(v7.callback), 
    appAnalytics = v7.optional(v7.table), 
    avatarEditorAnalytics = v7.optional(v7.table), 
    catalogAnalytics = v7.optional(v7.table), 
    show3dView = v7.optional(v7.boolean), 
    itemId = v7.optional(v7.string), 
    itemType = v7.optional(v7.string), 
    isFirstItemDetails = v7.optional(v7.boolean), 
    is10ftUI = v7.boolean, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.table, 
    androidBackButtonConnection = v7.table, 
    overlayClosedCallback = v7.callback, 
    fetchItemFailed = if l_FFlagAXFixCatalogRefreshRendering_0 then v7.optional(v7.boolean) else nil, 
    wasItemEquipped = if l_FFlagAXFixCatalogRefreshRendering_0 then v7.optional(v7.boolean) else nil, 
    category = if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then v7.optional(v7.string) else nil, 
    subcategory = if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then v7.optional(v7.string) else nil, 
    taxonomy = if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then v7.optional(v7.string) else nil
});
v140.init = function(v141) --[[ Line: 275 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v23 (copy), l_AvatarScreen_0 (copy), v57 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v22 (copy), v42 (copy), v44 (copy), v79 (copy), v96 (copy), l_sendAXCounterV2_0 (copy), v77 (copy), l_FFlagAXEnableCategoryPillsExposureLogging_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 (copy), v112 (copy)
    v141.topBarRef = v4.createRef();
    v141.sceneUIContainerRef = v4.createRef();
    v141.titleDropDownRef = v4.createRef();
    v141.topBarRenderRightRef = v4.createRef();
    v141.refinementButtonsRef = v4.createRef();
    v141.multiTryOnBottomBarRef = v4.createRef();
    v141.quickButtonsRef = v4.createRef();
    v141.itemDetailsPeekViewRefs = v8.createRefCache();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v141:setState({
        lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v141.setDefaultRefOverride = function(v143) --[[ Line: 292 ]]
        -- upvalues: v141 (copy), v4 (ref)
        v141:setState({
            defaultRefOverride = v143 or v4.None
        });
    end;
    v141.changeView = function() --[[ Line: 298 ]]
        -- upvalues: v141 (copy), v23 (ref)
        local l_avatarExperienceAnalytics_0 = v141.props.avatarExperienceAnalytics;
        local v145 = v23.getNewFullViewEnum(v141.props.fullView);
        v141.props.setFullView(l_avatarExperienceAnalytics_0, v141.props.avatarRoute.opaque.name, v145);
    end;
    v141.setUIFullView = function() --[[ Line: 305 ]]
        -- upvalues: v141 (copy), l_AvatarScreen_0 (ref), v57 (ref)
        local l_avatarExperienceAnalytics_1 = v141.props.avatarExperienceAnalytics;
        if v141.props.isPortrait then
            v141.props.setFullView(l_avatarExperienceAnalytics_1, l_AvatarScreen_0.CatalogSearch, v57.UIFullView);
        end;
    end;
    v141.isAvatarScreen = function(v147) --[[ Line: 313 ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (rawget(l_AvatarScreen_0, v147));
    end;
    v141.topBarBackButtonActivated = function() --[[ Line: 317 ]]
        -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v141 (copy), v57 (ref), l_AvatarScreen_0 (ref), v22 (ref)
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v141.props.fullView == v57.UIFullView then
            local l_avatarExperienceAnalytics_2 = v141.props.avatarExperienceAnalytics;
            v141.props.setFullView(l_avatarExperienceAnalytics_2, v141.props.avatarRoute.opaque.name, v57.None);
            return;
        else
            local l_navigation_0 = v141.props.navigation;
            local l_avatarEditorAnalytics_0 = v141.props.avatarEditorAnalytics;
            local l_prevNavPage_0 = v141.props.prevNavPage;
            local l_prevNavHistory_0 = v141.props.prevNavHistory;
            if l_prevNavPage_0 and l_prevNavHistory_0 then
                if v141.isAvatarScreen(l_prevNavPage_0) then
                    v141.props.navigation.navigate(l_prevNavPage_0);
                else
                    v141.props.resetNavigationHistory(l_prevNavHistory_0);
                end;
            else
                local v153 = if v141.props.is10ftUI then l_AvatarScreen_0.AvatarExperienceLandingPage else v22.Home;
                l_navigation_0.navigate(v153);
            end;
            l_avatarEditorAnalytics_0.catalogToAvatarBackButton();
            return;
        end;
    end;
    v141.defaultChildRef = v4.createRef();
    v141.lastInputTypeChangedCallback = function(v154) --[[ Line: 345 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v141 (copy)
        local v155 = l_isGamepadInput_0(v154);
        if v155 ~= v141.state.lastInputIsGamepad then
            v141:setState({
                lastInputIsGamepad = v155
            });
        end;
    end;
    v141.titleDropDown = v42("Feature.Avatar.Action.Marketplace", v141.props.overlayClosedCallback);
    v141.backButton = v44(v141.topBarBackButtonActivated);
    v141.onConfirmSearchCallback = function() --[[ Line: 358 ]]
        -- upvalues: v141 (copy), v79 (ref)
        v141.props.resetSearchCategoryAndSubcategory();
        if v79() and v141.setUIFullView then
            v141.setUIFullView();
        end;
    end;
    if v96() then
        l_sendAXCounterV2_0(v77.Counter.TopLevelPageInitialView.Catalog);
    end;
    if l_FFlagAXEnableCategoryPillsExposureLogging_0 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
    if l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v112);
    end;
end;
v140.getBestDefaultRefForPage = function(v156) --[[ Line: 380 ]] --[[ Name: getBestDefaultRefForPage ]]
    if v156.state.defaultRefOverride then
        return v156.state.defaultRefOverride;
    else
        return v156.defaultChildRef;
    end;
end;
if not l_FFlagAXMigrateCatalogPageInputBindings_0 then
    v140.getInputBindings = function(v157) --[[ Line: 389 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreenProperties_0 (copy), v10 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v8 (copy), v36 (copy), l_PeekViewState_0 (copy)
        local l_avatarRoute_0 = v157.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local l_isMultiTryOn_0 = l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
        local v161 = #v10.Dictionary.values(v157.props.tryOnItems) > 1;
        local v162 = {
            OpenTryOnManager = if l_name_0 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_0 or l_FFlagAXMISEnableMultiShopping_0) and v161 then v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 399 ]]
                -- upvalues: v36 (ref), v157 (copy), l_AvatarScreen_0 (ref)
                v36.closeFiltersAndItemDetails(v157.props.navigation);
                v157.props.navigation.navigate(l_AvatarScreen_0.TryOnManager);
            end, {
                key = "Feature.Catalog.Label.TryOns"
            }) else nil
        };
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            return (v10.Dictionary.join(v162, {
                NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 410 ]]
                    -- upvalues: v36 (ref), v157 (copy)
                    v36.closeFocusedScreen(v157.props.navigation);
                end), 
                OpenItemPrompt = v8.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 413 ]]
                    -- upvalues: v157 (copy), l_avatarRoute_0 (copy)
                    v157.props.openItemPrompt(v157.props.networking, v157.props.catalogAnalytics, v157.props.overlayClosedCallback, v157.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v8.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 424 ]]
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
            return (v10.Dictionary.join(v162, {
                OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 436 ]]
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
                v162 = v10.Dictionary.join(v162, {
                    OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 449 ]]
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
if v104 then
    v140.sendExperimentCountersOnce = function(_) --[[ Line: 467 ]] --[[ Name: sendExperimentCountersOnce ]]

    end;
end;
v140.didMount = function(v166) --[[ Line: 470 ]] --[[ Name: didMount ]]
    -- upvalues: v61 (copy), v104 (copy), v105 (copy), v81 (copy), v106 (copy), v98 (copy), l_AppUserLayers_0 (copy), v111 (copy), l_IXPServiceWrapper_0 (copy), v110 (copy)
    if not v166.props.is10ftUI and v61(v166.props) then
        v166.props.androidBackButtonConnection.connect(v166.topBarBackButtonActivated);
    end;
    if v104 then
        v166:sendExperimentCountersOnce();
    end;
    if v105 then
        v81.logLayerExposure(if v106 then v98() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
    if v111 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v110);
    end;
end;
v140.willUnmount = function(v167) --[[ Line: 494 ]] --[[ Name: willUnmount ]]
    v167.props.androidBackButtonConnection.disconnect();
end;
v140.didUpdate = function(v168, v169) --[[ Line: 498 ]] --[[ Name: didUpdate ]]
    -- upvalues: v61 (copy)
    if not v168.props.is10ftUI then
        if not v61(v169) and v61(v168.props) then
            v168.props.androidBackButtonConnection.connect(v168.topBarBackButtonActivated);
            return;
        elseif v61(v169) and not v61(v168.props) then
            v168.props.androidBackButtonConnection.disconnect();
        end;
    end;
end;
v140.willUpdate = function(v170, v171) --[[ Line: 508 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v44 (copy)
    if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v171.fullView ~= v170.props.fullView then
        v170.backButton = v44(v170.topBarBackButtonActivated, v170:getBackButtonIcon(v171.fullView));
    end;
end;
if l_FFlagAXExpandPeekViewOnFirstScroll_0 then
    v140.getBackButtonIcon = function(v172, v173) --[[ Line: 516 ]] --[[ Name: getBackButtonIcon ]]
        -- upvalues: v57 (copy), v133 (copy)
        if not v173 then
            v173 = v172.props.fullView;
        end;
        if v173 == v57.UIFullView then
            return v133;
        else
            return nil;
        end;
    end;
end;
v140.renderTopBar = function(v174) --[[ Line: 530 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v79 (copy), l_IsVRAppBuild_0 (copy), v43 (copy), v47 (copy), v4 (copy), v59 (copy), l_FFlagAXOpaqueMarketplaceTopbar_0 (copy)
    local l_isPortrait_0 = v174.props.isPortrait;
    local l_show3dView_0 = v174.props.show3dView;
    return l_withLocalization_0({
        title = "Feature.Avatar.Action.Marketplace"
    })(function(v177) --[[ Line: 536 ]]
        -- upvalues: v79 (ref), l_IsVRAppBuild_0 (ref), v174 (copy), v43 (ref), v47 (ref), v4 (ref), v59 (ref), l_FFlagAXOpaqueMarketplaceTopbar_0 (ref), l_isPortrait_0 (copy), l_show3dView_0 (copy)
        local v178 = 2;
        if v79() then
            v178 = 3;
        end;
        local v179 = nil;
        local v180 = nil;
        local v181 = nil;
        if l_IsVRAppBuild_0() then
            v180 = nil;
            v179 = nil;
            v181 = nil;
        else
            v179 = v174.backButton;
            v180 = if v174.props.is10ftUI then v174.titleDropDown else v43;
            v181 = {
                v47.SearchButton
            };
        end;
        return v4.createElement(v47.Container, {
            forceCompactMode = true, 
            searchType = v59.SearchTypes.Catalog, 
            titleText = v177.title, 
            ZIndex = v178, 
            transparentBackground = if not l_FFlagAXOpaqueMarketplaceTopbar_0 or l_isPortrait_0 then l_show3dView_0 else false, 
            hideSiteMessageBanner = l_isPortrait_0, 
            [v4.Ref] = v174.topBarRef, 
            setDefaultRefOverride = v174.setDefaultRefOverride, 
            NextSelectionDown = v174.defaultChildRef, 
            NextSelectionRight = v174.sceneUIContainerRef, 
            onConfirmSearchCallback = v174.onConfirmSearchCallback, 
            leftItem = v179, 
            centerItem = v180, 
            rightItems = v181, 
            useParentSizeForCenterItem = true, 
            shouldNavigateToSearchLandingPage = true
        });
    end);
end;
v140.render = function(v182) --[[ Line: 579 ]] --[[ Name: render ]]
    -- upvalues: v57 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), v49 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v33 (copy), v67 (copy), v87 (copy), v93 (copy), v86 (copy), v95 (copy), v80 (copy), v94 (copy), v68 (copy), v88 (copy), v89 (copy), l_AXRemoveBackButtonDesktopClientsIXPTest_0 (copy), l_AXAvatarsTabIXP_0 (copy), l_FFlagAXBackendDrivenCatalogLayers_0 (copy), l_getBackendLayerNamesForCatalog_0 (copy), l_FFlagBasedExposureLoggingCatalogPage_0 (copy), l_UserIsInExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 (copy), v124 (copy), v125 (copy), l_FFlagAXCatalogM41CategoriesExposureLogging_0 (copy), v45 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v48 (copy), v46 (copy)
    local v183 = v182.props.fullView == v57.SceneFullView;
    local v184 = v182.props.fullView == v57.UIFullView;
    local l_show3dView_1 = v182.props.show3dView;
    local l_namedRefs_0 = v182.props.namedRefs;
    local v187 = v182.props.avatarRoute.current.name == l_AvatarScreen_0.SortAndFilters;
    local l_quickButtonsRef_0 = v182.quickButtonsRef;
    if v182.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.TryOnManager];
    elseif v182.props.avatarRoute.current.name == l_AvatarScreen_0.LookDetails then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.LookDetails];
    elseif v187 then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.SortAndFilters];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v182.props.focusController, 
        defaultChild = v182:getBestDefaultRefForPage(), 
        restorePreviousChildFocus = false, 
        inputBindings = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v182:getInputBindings(), 
        ref = l_namedRefs_0[l_AvatarScreen_0.Catalog]
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v49), 
        LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v182.lastInputTypeChangedCallback
        }), 
        NavigationEventsLogger = v4.createElement(v33, {
            pageName = "Catalog"
        }), 
        UniversalAppCameraExposure = v4.createElement(v67, {
            ixpTest = v87
        }), 
        RelevanceRecommendationsExposure = if v93() then nil else v4.createElement(v67, {
            ixpTest = v86.RelevanceRecommendations
        }), 
        RecommendationsAndSearchExposure = if v95() then nil else v4.createElement(v67, {
            ixpTest = v86.RecommendationsAndSearch
        }), 
        SortsExposure = (not not v80() or not v94()) and v4.createElement(v67, {
            ixpTest = v86.Sorts
        }), 
        SearchWidgetsExposure = v80() and v4.createElement(v67, {
            ixpTest = v86.SearchWidgets
        }), 
        OnFocusExperimentExposureLogger = v4.createElement(v68, {
            ixpTests = {
                if v88.isEnabled() then v88 else nil, 
                if v89.isEnabled() then v89 else nil, 
                if l_AXRemoveBackButtonDesktopClientsIXPTest_0.isEnabled() then l_AXRemoveBackButtonDesktopClientsIXPTest_0 else nil, 
                if l_AXAvatarsTabIXP_0.isEnabled() then l_AXAvatarsTabIXP_0 else nil
            }, 
            layers = if l_FFlagAXBackendDrivenCatalogLayers_0 then l_getBackendLayerNamesForCatalog_0() else nil, 
            flagIXPTestLayers = if l_FFlagBasedExposureLoggingCatalogPage_0 then {
                if l_UserIsInExperiment_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil, 
                if l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil, 
                if v124 then v125 else nil, 
                if l_FFlagAXCatalogM41CategoriesExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil
            } else nil
        }), 
        AvatarExperienceView = v4.createElement(v45, {
            changeViewFunction = v182.changeView, 
            allowAdaptiveScrolling = true, 
            adaptiveScrollingProps = if not not l_FFlagAXHideMenuOnScroll_0 or l_FFlagAXExpandPeekViewOnFirstScroll_0 then {
                enableExpandPeekViewOnUpwardScroll = l_FFlagAXExpandPeekViewOnFirstScroll_0 and true or nil, 
                enableAnimatedVisibility = l_FFlagAXHideMenuOnScroll_0 and true or nil
            } else nil, 
            isDisabled = not l_show3dView_1, 
            isSceneFullView = v183, 
            isUIFullView = v184, 
            topBar = v182:renderTopBar(), 
            refinementButtonsRef = v182.refinementButtonsRef, 
            quickButtonsRef = v182.quickButtonsRef, 
            [v4.Ref] = v182.sceneUIContainerRef, 
            NextSelectionDown = v182.defaultChildRef, 
            NextSelectionLeft = v182.topBarRef, 
            defaultChildRef = v182.defaultChildRef, 
            multiTryOnBottomBarRef = v182.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v182.itemDetailsPeekViewRefs, 
            showUndoRedo = true, 
            showSaveButton = false
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v48, {
                focusController = v182.props.focusController, 
                captureFocusOnMount = true
            }), 
            NavigationAndItemsList = v4.createElement(v46, {
                defaultChildRef = v182.defaultChildRef, 
                NextSelectionUp = v182.topBarRef, 
                NextSelectionRight = l_quickButtonsRef_0, 
                multiTryOnBottomBarRef = v182.multiTryOnBottomBarRef, 
                itemDetailsPeekViewRefs = v182.itemDetailsPeekViewRefs
            })
        })
    });
end;
v140 = v6.connect(function(v189) --[[ Line: 707 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v63 (copy), l_AvatarScreen_0 (copy), v62 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy)
    return {
        fullView = v63(v189, l_AvatarScreen_0.Catalog), 
        isPortrait = v62(v189), 
        itemDetailsExpanded = v189.AvatarExperience.Common.ItemDetailsExpanded, 
        tryOnManagerPeekViewState = v189.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v189.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v190) --[[ Line: 719 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v54 (copy), v53 (copy), v58 (copy), v55 (copy), v64 (copy), v65 (copy), v56 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v109 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v77 (copy), l_CatalogCategories_0 (copy), v132 (copy), v75 (copy)
    return {
        openItemPrompt = function(v191, v192, v193, v194, v195) --[[ Line: 721 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v190 (copy), v54 (ref)
            v190(v54(v191, v192, v193, v194, v195));
        end, 
        setItemDetailsPeekViewState = function(v196) --[[ Line: 724 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v190 (copy), v53 (ref)
            v190(v53(v196));
        end, 
        navigateIntoQuickMenu = function(v197, v198) --[[ Line: 727 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v190 (copy), v58 (ref)
            v190(v58(v197, v198));
        end, 
        setFullView = function(v199, v200, v201) --[[ Line: 730 ]] --[[ Name: setFullView ]]
            -- upvalues: v190 (copy), v55 (ref)
            v190(v55(v199, v200, v201));
        end, 
        resetNavigationHistory = function(v202) --[[ Line: 733 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v190 (copy), v64 (ref)
            return v190(v64(nil, v202));
        end, 
        instantResetNavigationHistory = function(v203) --[[ Line: 736 ]] --[[ Name: instantResetNavigationHistory ]]
            -- upvalues: v190 (copy), v65 (ref)
            return v190(v65(nil, v203));
        end, 
        setTryOnManagerPeekViewState = function(v204) --[[ Line: 739 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v190 (copy), v56 (ref)
            v190(v56(v204));
        end, 
        resetSearchCategoryAndSubcategory = function() --[[ Line: 742 ]] --[[ Name: resetSearchCategoryAndSubcategory ]]
            -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (ref), v109 (ref), l_FFlagAXDefaultCatalogCategoryId_0 (ref), v77 (ref), l_CatalogCategories_0 (ref), v132 (ref), v190 (copy), v75 (ref)
            if l_FFlagAXCatalogCategoriesStore_0 then
                if not v109.getCatalogSearchSelectionStore().changeCategory(if l_FFlagAXDefaultCatalogCategoryId_0 then v77.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue(), nil) then
                    v132("Failed to select subcategory in ResetSearchCategoryAndSubcategory thunk");
                    return;
                end;
            else
                v190(v75("All", nil));
            end;
        end
    };
end)(v140);
v140 = l_RoactServices_0.connect({
    avatarExperienceAnalytics = v28, 
    networking = v31, 
    appAnalytics = v29, 
    avatarEditorAnalytics = v50, 
    catalogAnalytics = v51
})(v140);
v140 = v40((v35(v34((l_RoactAppPolicy_0.connect(function(v205, _) --[[ Line: 771 ]]
    return {
        show3dView = v205.getCatalogShow3dView()
    };
end)(v140))), nil)));
return function(v207) --[[ Line: 783 ]] --[[ Name: CatalogPageContainer ]]
    -- upvalues: l_FFlagDynamicHeadsMigration_0 (copy), v5 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), v60 (copy), v72 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), l_useRoactService_0 (copy), v31 (copy), l_useDispatch_0 (copy), v51 (copy), v41 (copy), v71 (copy), l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_AvatarScreenProperties_0 (copy), l_useSelector_0 (copy), v139 (copy), v70 (copy), v36 (copy), v54 (copy), v136 (copy), l_PeekViewState_0 (copy), v56 (copy), l_FocusNavigationEventNameEnum_0 (copy), v127 (copy), v69 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useCatalogPageMISIntroFtux_0 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), l_useCatalogPageTimeoutPrompt_0 (copy), l_FFlagAXMakeupReleaseFTUX_0 (copy), v109 (copy), l_CatalogCategories_0 (copy), l_useCatalogPageMakeupReleaseFtux_0 (copy), v10 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), v128 (copy), v140 (ref)
    if l_FFlagDynamicHeadsMigration_0 then
        v5.useEffect(function() --[[ Line: 785 ]]
            -- upvalues: v21 (ref)
            local v208 = v21(false);
            if v208 then
                v208.getInventory(false);
            end;
        end, {});
    end;
    local v209 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useRef(v8.createFocusController()).current;
    local l_current_0 = v5.useRef(v60()).current;
    local v211 = v72(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v209);
    local v212 = nil;
    if l_FFlagAXMigrateCatalogPageInputBindings_0 then
        local v213 = l_useRoactService_0(v31);
        local v214 = l_useDispatch_0();
        local v215 = l_useRoactService_0(v51);
        local v216 = v41();
        local v217 = v71();
        local v218 = l_useAvatarRoute_0();
        local v219 = v218.current.name == l_AvatarScreen_0.ItemDetails;
        local v220 = true;
        if v218.current.name ~= l_AvatarScreen_0.LookDetails then
            v220 = v218.current.name == l_AvatarScreen_0.TryOnManager;
        end;
        local l_isMultiTryOn_1 = l_AvatarScreenProperties_0[v218.opaque.name].isMultiTryOn;
        local v222 = l_useSelector_0(v139);
        local v223 = false;
        if v218.current.name ~= l_AvatarScreen_0.TryOnManager then
            v223 = l_isMultiTryOn_1 and v222;
        end;
        local v224 = v70(v211);
        local v226 = v5.useCallback(function(v225) --[[ Line: 822 ]]
            -- upvalues: v36 (ref), v207 (copy)
            v225.cancelled = true;
            v36.closeFocusedScreen(v207.navigation);
        end, {
            v207.navigation
        });
        local l_v214_0 = v214 --[[ copy: 6 -> 26 ]];
        local l_v213_0 = v213 --[[ copy: 5 -> 27 ]];
        local l_v215_0 = v215 --[[ copy: 7 -> 28 ]];
        local v230 = v5.useCallback(function() --[[ Line: 828 ]]
            -- upvalues: l_v214_0 (copy), v54 (ref), l_v213_0 (copy), l_v215_0 (copy), v211 (copy), v207 (copy), v218 (copy)
            l_v214_0(v54(l_v213_0, l_v215_0, v211, v207.navigation, v218));
        end, {
            v214, 
            v213, 
            v215, 
            v211, 
            v207.navigation, 
            v218
        });
        local v231 = v5.useCallback(function() --[[ Line: 836 ]]
            -- upvalues: v207 (copy), l_AvatarScreen_0 (ref), v218 (copy), v211 (copy)
            v207.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = v218.current.params.itemId, 
                itemType = v218.current.params.itemType, 
                onOverlayClosed = v211
            });
        end, {
            v207.navigation, 
            v218, 
            v211
        });
        local v232 = l_useSelector_0(v136);
        local v234 = v5.useCallback(function() --[[ Line: 846 ]]
            -- upvalues: v232 (copy), l_PeekViewState_0 (ref), l_v214_0 (copy), v56 (ref)
            local v233 = if not (v232 ~= l_PeekViewState_0.Full) or v232 == l_PeekViewState_0.Extended then l_PeekViewState_0.Brief else l_PeekViewState_0.Full;
            l_v214_0(v56(v233));
        end, {
            v232, 
            v214
        });
        local v235 = v5.useCallback(function() --[[ Line: 854 ]]
            -- upvalues: v36 (ref), v207 (copy), l_AvatarScreen_0 (ref)
            v36.closeFiltersAndItemDetails(v207.navigation);
            v207.navigation.navigate(l_AvatarScreen_0.TryOnManager);
        end, {
            v207.navigation
        });
        local l_v216_0 = v216 --[[ copy: 8 -> 29 ]];
        local v237 = v5.useCallback(function() --[[ Line: 859 ]]
            -- upvalues: l_v216_0 (copy), l_AvatarScreen_0 (ref)
            l_v216_0:fire(l_AvatarScreen_0.Catalog);
        end, {
            v216
        });
        local v238 = v5.useMemo(function() --[[ Line: 863 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v220 (copy), v223 (copy)
            return {
                [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu, 
                [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
                [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu, 
                [Enum.KeyCode.ButtonY] = if not not v220 or v223 then l_FocusNavigationEventNameEnum_0.ToggleTryOnManager else l_FocusNavigationEventNameEnum_0.Search
            };
        end, {
            v220, 
            v223
        });
        v212 = v127(v238, {
            onNavigateBack = if v219 then v226 else nil, 
            onOpenQuickMenu = if v217 then v224 else nil, 
            onOpenBuyItemPrompt = if v219 then v230 else nil, 
            onOpenContextMenu = if v219 then v231 else nil, 
            onToggleSearch = v237, 
            onToggleTryOnManager = if v220 then v234 else if v223 then v235 else nil
        });
    else
        v212 = v69({
            overlayClosedCallback = v211
        });
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v239 = l_useAvatarRoute_0();
        l_useCatalogPageMISIntroFtux_0(v239, v207.navigation);
    end;
    if l_FFlagAXAvatarTimeoutFlow_0 then
        l_useCatalogPageTimeoutPrompt_0(v207.navigation);
    end;
    if l_FFlagAXMakeupReleaseFTUX_0 then
        local v240 = l_useAvatarRoute_0();
        local v241 = v5.useCallback(function() --[[ Line: 906 ]]
            -- upvalues: v109 (ref), l_CatalogCategories_0 (ref)
            v109.getCatalogSelectionStore().changeCategory(l_CatalogCategories_0.Makeup:rawValue(), nil);
        end, {});
        l_useCatalogPageMakeupReleaseFtux_0(v240, v207.navigation, v241);
    end;
    local l_join_0 = v10.Dictionary.join;
    local l_v207_0 = v207;
    local v244 = {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v209, 
        overlayClosedCallback = v211, 
        androidBackButtonConnection = l_current_0
    };
    local v245 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v245 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    v244.is10ftUI = v245;
    l_join_0 = l_join_0(l_v207_0, v244);
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        v128();
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v212
    }, v5.createElement(v140, l_join_0));
end;