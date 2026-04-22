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
local v53 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_SetItemDetailsPeekViewState_0 = v53.Actions.SetItemDetailsPeekViewState;
local l_SetTryOnManagerPeekViewState_0 = v53.Actions.SetTryOnManagerPeekViewState;
local v56 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemPrompt);
local v57 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_FullView_0 = v19.Enums.FullView;
local v59 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenQuickMenu);
local v60 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v61 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonConnection);
local v62 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible);
local v63 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v64 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v65 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v66 = require(l_Modules_0.LuaApp.Thunks.InstantResetNavigationHistory);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v68 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExposureLogger);
local v69 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local v70 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v71 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback);
local v72 = require(l_Modules_0.AvatarExperience.Common.Hooks.useQuickMenuAvailable);
local v73 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v76 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchCategoryAndSubcategory);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v78 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v80 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v81 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksIXPLogging);
local v82 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v85 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagDynamicHeadsMigration_0 = v85.FFlagDynamicHeadsMigration;
local v87 = require(l_Modules_0.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests);
local v88 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v89 = require(l_Modules_0.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP);
local v90 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
local l_AXAvatarsTabIXP_0 = v19.Experiments.AXAvatarsTabIXP;
local l_getBackendLayerNamesForCatalog_0 = v19.Utils.getBackendLayerNamesForCatalog;
local l_UserIsInExperiment_0 = v85.FFlagsAXPrefetchMarketplaceThumbnailsXP.UserIsInExperiment;
local v94 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableRelevanceRecommendationsLayerExposure);
local v95 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableSortsLayerExposure);
local v96 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableRecommendationsAndSearchLayerExposure);
local v97 = require(l_Modules_0.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter);
local l_FFlagAXMigrateCatalogPageInputBindings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogPageInputBindings;
local v99 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName);
local l_FFlagAXAvatarTimeoutFlow_0 = v85.FFlagAXAvatarTimeoutFlow;
local l_FFlagAXRefetchAvatarOnTimeout_0 = v85.FFlagAXRefetchAvatarOnTimeout;
local l_FFlagAXMISEnableMultiShopping_0 = v85.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMakeupReleaseFTUX_0 = v85.FFlagAXMakeupReleaseFTUX;
local l_FFlagAXOpaqueMarketplaceTopbar_0 = v85.FFlagAXOpaqueMarketplaceTopbar;
local l_FFlagAXBackendDrivenCatalogLayers_0 = v85.FFlagAXBackendDrivenCatalogLayers;
local v106 = game:DefineFastFlag("AXEnableIXPCounters2", false);
local v107 = game:DefineFastFlag("AXCustomizeOverhaulCatalogExposure2", false);
local v108 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogCategoriesStore_0 = v85.FFlagAXCatalogCategoriesStore;
local v111 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v112 = game:DefineFastString("AXMISExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local v113 = game:DefineFastFlag("AXMISExposureLogging", false);
local v114 = game:DefineFastString("AXTaxonomyM20ExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = v85.FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXEnableCategoryPillsExposureLogging_0 = v85.FFlagAXEnableCategoryPillsExposureLogging;
local l_FFlagAXHideMenuOnScroll_0 = v85.FFlagAXHideMenuOnScroll;
local l_FFlagAXFixCatalogRefreshRendering_0 = v85.FFlagAXFixCatalogRefreshRendering;
local l_FFlagBasedExposureLoggingCatalogPage_0 = v85.FFlagBasedExposureLoggingCatalogPage;
local l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 = v85.FFlagAXEnableTaxonomyM20ExposureLoggingCatalog;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v85.FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 = v85.FFlagAXMoveCatalogFilterToL1NavigationExposureLogging;
local l_FFlagAXDefaultCatalogCategoryId_0 = v85.FFlagAXDefaultCatalogCategoryId;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v85.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local l_FFlagAXHideCatalogShortcutsInFullView_0 = v85.FFlagAXHideCatalogShortcutsInFullView;
local v127 = game:DefineFastFlag("FFlagAXCatalogCategoriesSDUIExposureLogging", false);
local v128 = game:DefineFastString("FStringAXCatalogCategoriesSDUIExposureLayer", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local l_FFlagAXCatalogM41CategoriesExposureLogging_0 = v85.FFlagAXCatalogM41CategoriesExposureLogging;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v85.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_WidgetsPercievedTTIManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).WidgetsPercievedTTIManager;
local l_FFlagAXHideMenuOnScrollExposureLogging_0 = v85.FFlagAXHideMenuOnScrollExposureLogging;
local v133 = game:DefineFastFlag("AXVirtualizedListConfigExposureLogging", false);
local v134 = require(script.Parent.useCatalogPageFocusNavigationBindings);
local v135 = require(script.Parent.useCatalogPageRevertToLastEquippedStateHook);
local l_useCatalogPageTimeoutPrompt_0 = v20.Hooks.useCatalogPageTimeoutPrompt;
local l_useCatalogPageMakeupReleaseFtux_0 = v20.Hooks.useCatalogPageMakeupReleaseFtux;
local v138 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.RefetchAvatarData);
local v139 = require(l_Modules_0.LuaApp.mutedError);
local v140 = l_Images_0["icons/actions/truncationExpand"];
local l_CatalogCategories_0 = v19.Enums.CatalogCategories;
local function v143(v142) --[[ Line: 213 ]] --[[ Name: selectTryOnManagerViewState ]]
    return v142.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v146(v144) --[[ Line: 217 ]] --[[ Name: selectIsTryOnButtonShowing ]]
    -- upvalues: v10 (copy)
    local l_TryOnItems_0 = v144.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return #v10.Dictionary.values(l_TryOnItems_0) > 1;
end;
local v147 = v4.PureComponent:extend("CatalogPage");
v147.validateProps = v7.strictInterface({
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
v147.init = function(v148) --[[ Line: 284 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v23 (copy), l_AvatarScreen_0 (copy), l_FullView_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v22 (copy), v42 (copy), v44 (copy), v80 (copy), v97 (copy), l_sendAXCounterV2_0 (copy), v78 (copy), l_FFlagAXEnableCategoryPillsExposureLogging_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 (copy), v114 (copy)
    v148.topBarRef = v4.createRef();
    v148.sceneUIContainerRef = v4.createRef();
    v148.titleDropDownRef = v4.createRef();
    v148.topBarRenderRightRef = v4.createRef();
    v148.refinementButtonsRef = v4.createRef();
    v148.multiTryOnBottomBarRef = v4.createRef();
    v148.quickButtonsRef = v4.createRef();
    v148.itemDetailsPeekViewRefs = v8.createRefCache();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v148:setState({
        lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v148.setDefaultRefOverride = function(v150) --[[ Line: 301 ]]
        -- upvalues: v148 (copy), v4 (ref)
        v148:setState({
            defaultRefOverride = v150 or v4.None
        });
    end;
    v148.changeView = function() --[[ Line: 307 ]]
        -- upvalues: v148 (copy), v23 (ref)
        local l_avatarExperienceAnalytics_0 = v148.props.avatarExperienceAnalytics;
        local v152 = v23.getNewFullViewEnum(v148.props.fullView);
        v148.props.setFullView(l_avatarExperienceAnalytics_0, v148.props.avatarRoute.opaque.name, v152);
    end;
    v148.setUIFullView = function() --[[ Line: 314 ]]
        -- upvalues: v148 (copy), l_AvatarScreen_0 (ref), l_FullView_0 (ref)
        local l_avatarExperienceAnalytics_1 = v148.props.avatarExperienceAnalytics;
        if v148.props.isPortrait then
            v148.props.setFullView(l_avatarExperienceAnalytics_1, l_AvatarScreen_0.CatalogSearch, l_FullView_0.UIFullView);
        end;
    end;
    v148.isAvatarScreen = function(v154) --[[ Line: 322 ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (rawget(l_AvatarScreen_0, v154));
    end;
    v148.topBarBackButtonActivated = function() --[[ Line: 326 ]]
        -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v148 (copy), l_FullView_0 (ref), l_AvatarScreen_0 (ref), v22 (ref)
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v148.props.fullView == l_FullView_0.UIFullView then
            local l_avatarExperienceAnalytics_2 = v148.props.avatarExperienceAnalytics;
            v148.props.setFullView(l_avatarExperienceAnalytics_2, v148.props.avatarRoute.opaque.name, l_FullView_0.None);
            return;
        else
            local l_navigation_0 = v148.props.navigation;
            local l_avatarEditorAnalytics_0 = v148.props.avatarEditorAnalytics;
            local l_prevNavPage_0 = v148.props.prevNavPage;
            local l_prevNavHistory_0 = v148.props.prevNavHistory;
            if l_prevNavPage_0 and l_prevNavHistory_0 then
                if v148.isAvatarScreen(l_prevNavPage_0) then
                    v148.props.navigation.navigate(l_prevNavPage_0);
                else
                    v148.props.resetNavigationHistory(l_prevNavHistory_0);
                end;
            else
                local v160 = if v148.props.is10ftUI then l_AvatarScreen_0.AvatarExperienceLandingPage else v22.Home;
                l_navigation_0.navigate(v160);
            end;
            l_avatarEditorAnalytics_0.catalogToAvatarBackButton();
            return;
        end;
    end;
    v148.defaultChildRef = v4.createRef();
    v148.lastInputTypeChangedCallback = function(v161) --[[ Line: 354 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v148 (copy)
        local v162 = l_isGamepadInput_0(v161);
        if v162 ~= v148.state.lastInputIsGamepad then
            v148:setState({
                lastInputIsGamepad = v162
            });
        end;
    end;
    v148.titleDropDown = v42("Feature.Avatar.Action.Marketplace", v148.props.overlayClosedCallback);
    v148.backButton = v44(v148.topBarBackButtonActivated);
    v148.onConfirmSearchCallback = function() --[[ Line: 367 ]]
        -- upvalues: v148 (copy), v80 (ref)
        v148.props.resetSearchCategoryAndSubcategory();
        if v80() and v148.setUIFullView then
            v148.setUIFullView();
        end;
    end;
    if v97() then
        l_sendAXCounterV2_0(v78.Counter.TopLevelPageInitialView.Catalog);
    end;
    if l_FFlagAXEnableCategoryPillsExposureLogging_0 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
    if l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v114);
    end;
end;
v147.getBestDefaultRefForPage = function(v163) --[[ Line: 389 ]] --[[ Name: getBestDefaultRefForPage ]]
    if v163.state.defaultRefOverride then
        return v163.state.defaultRefOverride;
    else
        return v163.defaultChildRef;
    end;
end;
if not l_FFlagAXMigrateCatalogPageInputBindings_0 then
    v147.getInputBindings = function(v164) --[[ Line: 398 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreenProperties_0 (copy), v10 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v8 (copy), v36 (copy), l_PeekViewState_0 (copy)
        local l_avatarRoute_0 = v164.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local l_isMultiTryOn_0 = l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
        local v168 = #v10.Dictionary.values(v164.props.tryOnItems) > 1;
        local v169 = {
            OpenTryOnManager = if l_name_0 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_0 or l_FFlagAXMISEnableMultiShopping_0) and v168 then v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 408 ]]
                -- upvalues: v36 (ref), v164 (copy), l_AvatarScreen_0 (ref)
                v36.closeFiltersAndItemDetails(v164.props.navigation);
                v164.props.navigation.navigate(l_AvatarScreen_0.TryOnManager);
            end, {
                key = "Feature.Catalog.Label.TryOns"
            }) else nil
        };
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            return (v10.Dictionary.join(v169, {
                NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 419 ]]
                    -- upvalues: v36 (ref), v164 (copy)
                    v36.closeFocusedScreen(v164.props.navigation);
                end), 
                OpenItemPrompt = v8.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 422 ]]
                    -- upvalues: v164 (copy), l_avatarRoute_0 (copy)
                    v164.props.openItemPrompt(v164.props.networking, v164.props.catalogAnalytics, v164.props.overlayClosedCallback, v164.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v8.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 433 ]]
                    -- upvalues: v164 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                    v164.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_avatarRoute_0.current.params.itemId, 
                        itemType = l_avatarRoute_0.current.params.itemType, 
                        onOverlayClosed = v164.props.overlayClosedCallback
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            }));
        elseif l_name_0 == l_AvatarScreen_0.TryOnManager then
            return (v10.Dictionary.join(v169, {
                OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 445 ]]
                    -- upvalues: v164 (copy), l_PeekViewState_0 (ref)
                    local l_tryOnManagerPeekViewState_0 = v164.props.tryOnManagerPeekViewState;
                    if l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v164.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v164.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }));
        else
            if l_name_0 == l_AvatarScreen_0.LookDetails then
                v169 = v10.Dictionary.join(v169, {
                    OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 458 ]]
                        -- upvalues: v164 (copy), l_PeekViewState_0 (ref)
                        local l_tryOnManagerPeekViewState_1 = v164.props.tryOnManagerPeekViewState;
                        if l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Extended then
                            v164.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                            return;
                        else
                            v164.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                            return;
                        end;
                    end, {
                        key = "Feature.Catalog.Label.TryOns"
                    })
                });
            end;
            return v169;
        end;
    end;
end;
if v106 then
    v147.sendExperimentCountersOnce = function(_) --[[ Line: 476 ]] --[[ Name: sendExperimentCountersOnce ]]

    end;
end;
v147.didMount = function(v173) --[[ Line: 479 ]] --[[ Name: didMount ]]
    -- upvalues: v62 (copy), v106 (copy), v107 (copy), v82 (copy), v108 (copy), v99 (copy), l_AppUserLayers_0 (copy), v113 (copy), l_IXPServiceWrapper_0 (copy), v112 (copy)
    if not v173.props.is10ftUI and v62(v173.props) then
        v173.props.androidBackButtonConnection.connect(v173.topBarBackButtonActivated);
    end;
    if v106 then
        v173:sendExperimentCountersOnce();
    end;
    if v107 then
        v82.logLayerExposure(if v108 then v99() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
    if v113 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v112);
    end;
end;
v147.willUnmount = function(v174) --[[ Line: 503 ]] --[[ Name: willUnmount ]]
    v174.props.androidBackButtonConnection.disconnect();
end;
v147.didUpdate = function(v175, v176) --[[ Line: 507 ]] --[[ Name: didUpdate ]]
    -- upvalues: v62 (copy)
    if not v175.props.is10ftUI then
        if not v62(v176) and v62(v175.props) then
            v175.props.androidBackButtonConnection.connect(v175.topBarBackButtonActivated);
            return;
        elseif v62(v176) and not v62(v175.props) then
            v175.props.androidBackButtonConnection.disconnect();
        end;
    end;
end;
v147.willUpdate = function(v177, v178) --[[ Line: 517 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v44 (copy)
    if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v178.fullView ~= v177.props.fullView then
        v177.backButton = v44(v177.topBarBackButtonActivated, v177:getBackButtonIcon(v178.fullView));
    end;
end;
if l_FFlagAXExpandPeekViewOnFirstScroll_0 then
    v147.getBackButtonIcon = function(v179, v180) --[[ Line: 525 ]] --[[ Name: getBackButtonIcon ]]
        -- upvalues: l_FullView_0 (copy), v140 (copy)
        if not v180 then
            v180 = v179.props.fullView;
        end;
        if v180 == l_FullView_0.UIFullView then
            return v140;
        else
            return nil;
        end;
    end;
end;
v147.renderTopBar = function(v181) --[[ Line: 539 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v80 (copy), l_IsVRAppBuild_0 (copy), v43 (copy), v47 (copy), v4 (copy), v60 (copy), l_FFlagAXOpaqueMarketplaceTopbar_0 (copy)
    local l_isPortrait_0 = v181.props.isPortrait;
    local l_show3dView_0 = v181.props.show3dView;
    return l_withLocalization_0({
        title = "Feature.Avatar.Action.Marketplace"
    })(function(v184) --[[ Line: 545 ]]
        -- upvalues: v80 (ref), l_IsVRAppBuild_0 (ref), v181 (copy), v43 (ref), v47 (ref), v4 (ref), v60 (ref), l_FFlagAXOpaqueMarketplaceTopbar_0 (ref), l_isPortrait_0 (copy), l_show3dView_0 (copy)
        local v185 = 2;
        if v80() then
            v185 = 3;
        end;
        local v186 = nil;
        local v187 = nil;
        local v188 = nil;
        if l_IsVRAppBuild_0() then
            v187 = nil;
            v186 = nil;
            v188 = nil;
        else
            v186 = v181.backButton;
            v187 = if v181.props.is10ftUI then v181.titleDropDown else v43;
            v188 = {
                v47.SearchButton
            };
        end;
        return v4.createElement(v47.Container, {
            forceCompactMode = true, 
            searchType = v60.SearchTypes.Catalog, 
            titleText = v184.title, 
            ZIndex = v185, 
            transparentBackground = if not l_FFlagAXOpaqueMarketplaceTopbar_0 or l_isPortrait_0 then l_show3dView_0 else false, 
            hideSiteMessageBanner = l_isPortrait_0, 
            [v4.Ref] = v181.topBarRef, 
            setDefaultRefOverride = v181.setDefaultRefOverride, 
            NextSelectionDown = v181.defaultChildRef, 
            NextSelectionRight = v181.sceneUIContainerRef, 
            onConfirmSearchCallback = v181.onConfirmSearchCallback, 
            leftItem = v186, 
            centerItem = v187, 
            rightItems = v188, 
            useParentSizeForCenterItem = true, 
            shouldNavigateToSearchLandingPage = true
        });
    end);
end;
v147.render = function(v189) --[[ Line: 588 ]] --[[ Name: render ]]
    -- upvalues: l_FullView_0 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), v49 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v33 (copy), v68 (copy), v88 (copy), v94 (copy), v87 (copy), v96 (copy), v81 (copy), v95 (copy), v69 (copy), v89 (copy), v90 (copy), l_AXRemoveBackButtonDesktopClientsIXPTest_0 (copy), l_AXAvatarsTabIXP_0 (copy), l_FFlagAXBackendDrivenCatalogLayers_0 (copy), l_getBackendLayerNamesForCatalog_0 (copy), l_FFlagBasedExposureLoggingCatalogPage_0 (copy), l_UserIsInExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 (copy), v127 (copy), v128 (copy), l_FFlagAXCatalogM41CategoriesExposureLogging_0 (copy), l_FFlagAXHideMenuOnScrollExposureLogging_0 (copy), v133 (copy), v45 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v48 (copy), v46 (copy)
    local v190 = v189.props.fullView == l_FullView_0.SceneFullView;
    local v191 = v189.props.fullView == l_FullView_0.UIFullView;
    local l_show3dView_1 = v189.props.show3dView;
    local l_namedRefs_0 = v189.props.namedRefs;
    local v194 = v189.props.avatarRoute.current.name == l_AvatarScreen_0.SortAndFilters;
    local l_quickButtonsRef_0 = v189.quickButtonsRef;
    if v189.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.TryOnManager];
    elseif v189.props.avatarRoute.current.name == l_AvatarScreen_0.LookDetails then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.LookDetails];
    elseif v194 then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.SortAndFilters];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v189.props.focusController, 
        defaultChild = v189:getBestDefaultRefForPage(), 
        restorePreviousChildFocus = false, 
        inputBindings = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v189:getInputBindings(), 
        ref = l_namedRefs_0[l_AvatarScreen_0.Catalog]
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v49), 
        LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v189.lastInputTypeChangedCallback
        }), 
        NavigationEventsLogger = v4.createElement(v33, {
            pageName = "Catalog"
        }), 
        UniversalAppCameraExposure = v4.createElement(v68, {
            ixpTest = v88
        }), 
        RelevanceRecommendationsExposure = if v94() then nil else v4.createElement(v68, {
            ixpTest = v87.RelevanceRecommendations
        }), 
        RecommendationsAndSearchExposure = if v96() then nil else v4.createElement(v68, {
            ixpTest = v87.RecommendationsAndSearch
        }), 
        SortsExposure = (not not v81() or not v95()) and v4.createElement(v68, {
            ixpTest = v87.Sorts
        }), 
        SearchWidgetsExposure = v81() and v4.createElement(v68, {
            ixpTest = v87.SearchWidgets
        }), 
        OnFocusExperimentExposureLogger = v4.createElement(v69, {
            ixpTests = {
                if v89.isEnabled() then v89 else nil, 
                if v90.isEnabled() then v90 else nil, 
                if l_AXRemoveBackButtonDesktopClientsIXPTest_0.isEnabled() then l_AXRemoveBackButtonDesktopClientsIXPTest_0 else nil, 
                if l_AXAvatarsTabIXP_0.isEnabled() then l_AXAvatarsTabIXP_0 else nil
            }, 
            layers = if l_FFlagAXBackendDrivenCatalogLayers_0 then l_getBackendLayerNamesForCatalog_0() else nil, 
            flagIXPTestLayers = if l_FFlagBasedExposureLoggingCatalogPage_0 then {
                if l_UserIsInExperiment_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil, 
                if l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil, 
                if v127 then v128 else nil, 
                if l_FFlagAXCatalogM41CategoriesExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil, 
                if l_FFlagAXHideMenuOnScrollExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil, 
                if v133 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil
            } else nil
        }), 
        AvatarExperienceView = v4.createElement(v45, {
            changeViewFunction = v189.changeView, 
            allowAdaptiveScrolling = true, 
            adaptiveScrollingProps = if not not l_FFlagAXHideMenuOnScroll_0 or l_FFlagAXExpandPeekViewOnFirstScroll_0 then {
                enableExpandPeekViewOnUpwardScroll = l_FFlagAXExpandPeekViewOnFirstScroll_0 and true or nil, 
                enableAnimatedVisibility = l_FFlagAXHideMenuOnScroll_0 and true or nil
            } else nil, 
            isDisabled = not l_show3dView_1, 
            isSceneFullView = v190, 
            isUIFullView = v191, 
            topBar = v189:renderTopBar(), 
            refinementButtonsRef = v189.refinementButtonsRef, 
            quickButtonsRef = v189.quickButtonsRef, 
            [v4.Ref] = v189.sceneUIContainerRef, 
            NextSelectionDown = v189.defaultChildRef, 
            NextSelectionLeft = v189.topBarRef, 
            defaultChildRef = v189.defaultChildRef, 
            multiTryOnBottomBarRef = v189.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v189.itemDetailsPeekViewRefs, 
            showUndoRedo = true, 
            showSaveButton = false
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v48, {
                focusController = v189.props.focusController, 
                captureFocusOnMount = true
            }), 
            NavigationAndItemsList = v4.createElement(v46, {
                defaultChildRef = v189.defaultChildRef, 
                NextSelectionUp = v189.topBarRef, 
                NextSelectionRight = l_quickButtonsRef_0, 
                multiTryOnBottomBarRef = v189.multiTryOnBottomBarRef, 
                itemDetailsPeekViewRefs = v189.itemDetailsPeekViewRefs
            })
        })
    });
end;
v147 = v6.connect(function(v196) --[[ Line: 722 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v64 (copy), l_AvatarScreen_0 (copy), v63 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy)
    return {
        fullView = v64(v196, l_AvatarScreen_0.Catalog), 
        isPortrait = v63(v196), 
        itemDetailsExpanded = v196.AvatarExperience.Common.ItemDetailsExpanded, 
        tryOnManagerPeekViewState = v196.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v196.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v197) --[[ Line: 734 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v56 (copy), l_SetItemDetailsPeekViewState_0 (copy), v59 (copy), v57 (copy), v65 (copy), v66 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v111 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v78 (copy), l_CatalogCategories_0 (copy), v139 (copy), v76 (copy)
    return {
        openItemPrompt = function(v198, v199, v200, v201, v202) --[[ Line: 736 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v197 (copy), v56 (ref)
            v197(v56(v198, v199, v200, v201, v202));
        end, 
        setItemDetailsPeekViewState = function(v203) --[[ Line: 739 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v197 (copy), l_SetItemDetailsPeekViewState_0 (ref)
            v197(l_SetItemDetailsPeekViewState_0(v203));
        end, 
        navigateIntoQuickMenu = function(v204, v205) --[[ Line: 742 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v197 (copy), v59 (ref)
            v197(v59(v204, v205));
        end, 
        setFullView = function(v206, v207, v208) --[[ Line: 745 ]] --[[ Name: setFullView ]]
            -- upvalues: v197 (copy), v57 (ref)
            v197(v57(v206, v207, v208));
        end, 
        resetNavigationHistory = function(v209) --[[ Line: 748 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v197 (copy), v65 (ref)
            return v197(v65(nil, v209));
        end, 
        instantResetNavigationHistory = function(v210) --[[ Line: 751 ]] --[[ Name: instantResetNavigationHistory ]]
            -- upvalues: v197 (copy), v66 (ref)
            return v197(v66(nil, v210));
        end, 
        setTryOnManagerPeekViewState = function(v211) --[[ Line: 754 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v197 (copy), l_SetTryOnManagerPeekViewState_0 (ref)
            v197(l_SetTryOnManagerPeekViewState_0(v211));
        end, 
        resetSearchCategoryAndSubcategory = function() --[[ Line: 757 ]] --[[ Name: resetSearchCategoryAndSubcategory ]]
            -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (ref), v111 (ref), l_FFlagAXDefaultCatalogCategoryId_0 (ref), v78 (ref), l_CatalogCategories_0 (ref), v139 (ref), v197 (copy), v76 (ref)
            if l_FFlagAXCatalogCategoriesStore_0 then
                if not v111.getCatalogSearchSelectionStore().changeCategory(if l_FFlagAXDefaultCatalogCategoryId_0 then v78.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue(), nil) then
                    v139("Failed to select subcategory in ResetSearchCategoryAndSubcategory thunk");
                    return;
                end;
            else
                v197(v76("All", nil));
            end;
        end
    };
end)(v147);
v147 = l_RoactServices_0.connect({
    avatarExperienceAnalytics = v28, 
    networking = v31, 
    appAnalytics = v29, 
    avatarEditorAnalytics = v50, 
    catalogAnalytics = v51
})(v147);
v147 = v40((v35(v34((l_RoactAppPolicy_0.connect(function(v212, _) --[[ Line: 786 ]]
    return {
        show3dView = v212.getCatalogShow3dView()
    };
end)(v147))), nil)));
return function(v214) --[[ Line: 798 ]] --[[ Name: CatalogPageContainer ]]
    -- upvalues: l_FFlagAXRefetchAvatarOnTimeout_0 (copy), l_useRoactService_0 (copy), v31 (copy), l_useDispatch_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v5 (copy), v21 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_WidgetsPercievedTTIManager_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), v61 (copy), v73 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), v51 (copy), v41 (copy), v72 (copy), l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_AvatarScreenProperties_0 (copy), l_useSelector_0 (copy), v146 (copy), v71 (copy), v36 (copy), v56 (copy), v143 (copy), l_PeekViewState_0 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_FFlagAXHideCatalogShortcutsInFullView_0 (copy), v64 (copy), l_FullView_0 (copy), v134 (copy), v70 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), v138 (copy), l_useCatalogPageTimeoutPrompt_0 (copy), l_FFlagAXMakeupReleaseFTUX_0 (copy), v111 (copy), l_CatalogCategories_0 (copy), l_useCatalogPageMakeupReleaseFtux_0 (copy), v10 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), v135 (copy), v147 (ref)
    local v215 = nil;
    local v216 = nil;
    if l_FFlagAXRefetchAvatarOnTimeout_0 then
        v215 = l_useRoactService_0(v31);
        v216 = l_useDispatch_0();
    end;
    if l_FFlagDynamicHeadsMigration_0 then
        v5.useEffect(function() --[[ Line: 807 ]]
            -- upvalues: v21 (ref)
            local v217 = v21(false);
            if v217 then
                v217.getInventory(false);
            end;
        end, {});
    end;
    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_WidgetsPercievedTTIManager_0 then
        l_WidgetsPercievedTTIManager_0.Hooks.useRenderAndMountedTracking();
    end;
    local v218 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useRef(v8.createFocusController()).current;
    local l_current_0 = v5.useRef(v61()).current;
    local v220 = v73(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v218);
    local v221 = nil;
    if l_FFlagAXMigrateCatalogPageInputBindings_0 then
        if not l_FFlagAXRefetchAvatarOnTimeout_0 then
            v215 = l_useRoactService_0(v31);
            v216 = l_useDispatch_0();
        end;
        local v222 = l_useRoactService_0(v51);
        local v223 = v41();
        local v224 = v72();
        local v225 = l_useAvatarRoute_0();
        local v226 = v225.current.name == l_AvatarScreen_0.ItemDetails;
        local v227 = true;
        if v225.current.name ~= l_AvatarScreen_0.LookDetails then
            v227 = v225.current.name == l_AvatarScreen_0.TryOnManager;
        end;
        local l_isMultiTryOn_1 = l_AvatarScreenProperties_0[v225.opaque.name].isMultiTryOn;
        local v229 = l_useSelector_0(v146);
        local v230 = false;
        if v225.current.name ~= l_AvatarScreen_0.TryOnManager then
            v230 = l_isMultiTryOn_1 and v229;
        end;
        local v231 = v71(v220);
        local v233 = v5.useCallback(function(v232) --[[ Line: 851 ]]
            -- upvalues: v36 (ref), v214 (copy)
            v232.cancelled = true;
            v36.closeFocusedScreen(v214.navigation);
        end, {
            v214.navigation
        });
        local l_v222_0 = v222 --[[ copy: 7 -> 29 ]];
        local l_v225_0 = v225 --[[ copy: 10 -> 30 ]];
        local v236 = v5.useCallback(function() --[[ Line: 857 ]]
            -- upvalues: v216 (ref), v56 (ref), v215 (ref), l_v222_0 (copy), v220 (copy), v214 (copy), l_v225_0 (copy)
            v216(v56(v215, l_v222_0, v220, v214.navigation, l_v225_0));
        end, {
            v216, 
            v215, 
            v222, 
            v220, 
            v214.navigation, 
            v225
        });
        local v237 = v5.useCallback(function() --[[ Line: 865 ]]
            -- upvalues: v214 (copy), l_AvatarScreen_0 (ref), l_v225_0 (copy), v220 (copy)
            v214.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = l_v225_0.current.params.itemId, 
                itemType = l_v225_0.current.params.itemType, 
                onOverlayClosed = v220
            });
        end, {
            v214.navigation, 
            v225, 
            v220
        });
        local v238 = l_useSelector_0(v143);
        local v240 = v5.useCallback(function() --[[ Line: 875 ]]
            -- upvalues: v238 (copy), l_PeekViewState_0 (ref), v216 (ref), l_SetTryOnManagerPeekViewState_0 (ref)
            local v239 = if not (v238 ~= l_PeekViewState_0.Full) or v238 == l_PeekViewState_0.Extended then l_PeekViewState_0.Brief else l_PeekViewState_0.Full;
            v216(l_SetTryOnManagerPeekViewState_0(v239));
        end, {
            v238, 
            v216
        });
        local v241 = v5.useCallback(function() --[[ Line: 883 ]]
            -- upvalues: v36 (ref), v214 (copy), l_AvatarScreen_0 (ref)
            v36.closeFiltersAndItemDetails(v214.navigation);
            v214.navigation.navigate(l_AvatarScreen_0.TryOnManager);
        end, {
            v214.navigation
        });
        local l_v223_0 = v223 --[[ copy: 8 -> 31 ]];
        local v243 = v5.useCallback(function() --[[ Line: 888 ]]
            -- upvalues: l_v223_0 (copy), l_AvatarScreen_0 (ref)
            l_v223_0:fire(l_AvatarScreen_0.Catalog);
        end, {
            v223
        });
        local v244 = v5.useMemo(function() --[[ Line: 892 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v227 (copy), v230 (copy)
            return {
                [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu, 
                [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
                [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu, 
                [Enum.KeyCode.ButtonY] = if not not v227 or v230 then l_FocusNavigationEventNameEnum_0.ToggleTryOnManager else l_FocusNavigationEventNameEnum_0.Search
            };
        end, {
            v227, 
            v230
        });
        if l_FFlagAXHideCatalogShortcutsInFullView_0 then
            local l_v225_1 = v225 --[[ copy: 10 -> 32 ]];
            local v247 = v5.useCallback(function(v246) --[[ Line: 906 ]]
                -- upvalues: v64 (ref), l_v225_1 (copy), l_FullView_0 (ref)
                return v64(v246, l_v225_1.opaque.name) == l_FullView_0.SceneFullView;
            end, {
                v225.opaque.name
            });
            local v248 = not l_useSelector_0(v247);
            v221 = v134(v244, {
                onNavigateBack = if v248 and v226 then v233 else nil, 
                onOpenQuickMenu = if v248 and v224 then v231 else nil, 
                onOpenBuyItemPrompt = if v248 and v226 then v236 else nil, 
                onOpenContextMenu = if v248 and v226 then v237 else nil, 
                onToggleSearch = if v248 then v243 else nil, 
                onToggleTryOnManager = if v248 and v227 then v240 else if v230 then v241 else nil
            });
        else
            v221 = v134(v244, {
                onNavigateBack = if v226 then v233 else nil, 
                onOpenQuickMenu = if v224 then v231 else nil, 
                onOpenBuyItemPrompt = if v226 then v236 else nil, 
                onOpenContextMenu = if v226 then v237 else nil, 
                onToggleSearch = v243, 
                onToggleTryOnManager = if v227 then v240 else if v230 then v241 else nil
            });
        end;
    else
        v221 = v70({
            overlayClosedCallback = v220
        });
    end;
    if l_FFlagAXAvatarTimeoutFlow_0 then
        local v249 = l_useAvatarRoute_0();
        local v250 = if l_FFlagAXRefetchAvatarOnTimeout_0 then v5.useCallback(function() --[[ Line: 946 ]]
            -- upvalues: v216 (ref), v138 (ref), v215 (ref)
            v216(v138(v215, true));
        end, {
            v216, 
            v215
        }) else nil;
        l_useCatalogPageTimeoutPrompt_0(v214.navigation, if l_FFlagAXRefetchAvatarOnTimeout_0 and v249.opaque.name == l_AvatarScreen_0.Catalog then v250 else nil);
    end;
    if l_FFlagAXMakeupReleaseFTUX_0 then
        local v251 = l_useAvatarRoute_0();
        local v252 = v5.useCallback(function() --[[ Line: 961 ]]
            -- upvalues: v111 (ref), l_CatalogCategories_0 (ref)
            v111.getCatalogSelectionStore().changeCategory(l_CatalogCategories_0.Makeup:rawValue(), nil);
        end, {});
        l_useCatalogPageMakeupReleaseFtux_0(v251, v214.navigation, v252);
    end;
    local l_join_0 = v10.Dictionary.join;
    local l_v214_0 = v214;
    local v255 = {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v218, 
        overlayClosedCallback = v220, 
        androidBackButtonConnection = l_current_0
    };
    local v256 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v256 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    v255.is10ftUI = v256;
    l_join_0 = l_join_0(l_v214_0, v255);
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        v135();
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v221
    }, v5.createElement(v147, l_join_0));
end;