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
local l_FFlagAXRefetchAvatarOnTimeout_0 = v84.FFlagAXRefetchAvatarOnTimeout;
local l_FFlagAXMISEnableMultiShopping_0 = v84.FFlagAXMISEnableMultiShopping;
local l_FFlagAXMakeupReleaseFTUX_0 = v84.FFlagAXMakeupReleaseFTUX;
local l_FFlagAXOpaqueMarketplaceTopbar_0 = v84.FFlagAXOpaqueMarketplaceTopbar;
local l_FFlagAXBackendDrivenCatalogLayers_0 = v84.FFlagAXBackendDrivenCatalogLayers;
local v105 = game:DefineFastFlag("AXEnableIXPCounters2", false);
local v106 = game:DefineFastFlag("AXCustomizeOverhaulCatalogExposure2", false);
local v107 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogCategoriesStore_0 = v84.FFlagAXCatalogCategoriesStore;
local v110 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v111 = game:DefineFastString("AXMISExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local v112 = game:DefineFastFlag("AXMISExposureLogging", false);
local v113 = game:DefineFastString("AXTaxonomyM20ExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
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
local l_FFlagAXHideCatalogShortcutsInFullView_0 = v84.FFlagAXHideCatalogShortcutsInFullView;
local v126 = game:DefineFastFlag("FFlagAXCatalogCategoriesSDUIExposureLogging", false);
local v127 = game:DefineFastString("FStringAXCatalogCategoriesSDUIExposureLayer", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local l_FFlagAXCatalogM41CategoriesExposureLogging_0 = v84.FFlagAXCatalogM41CategoriesExposureLogging;
local v129 = require(script.Parent.useCatalogPageFocusNavigationBindings);
local v130 = require(script.Parent.useCatalogPageRevertToLastEquippedStateHook);
local l_useCatalogPageMISIntroFtux_0 = v20.Hooks.useCatalogPageMISIntroFtux;
local l_useCatalogPageTimeoutPrompt_0 = v20.Hooks.useCatalogPageTimeoutPrompt;
local l_useCatalogPageMakeupReleaseFtux_0 = v20.Hooks.useCatalogPageMakeupReleaseFtux;
local v134 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.RefetchAvatarData);
local v135 = require(l_Modules_0.LuaApp.mutedError);
local v136 = l_Images_0["icons/actions/truncationExpand"];
local l_CatalogCategories_0 = v19.Enums.CatalogCategories;
local function v139(v138) --[[ Line: 208 ]] --[[ Name: selectTryOnManagerViewState ]]
    return v138.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v142(v140) --[[ Line: 212 ]] --[[ Name: selectIsTryOnButtonShowing ]]
    -- upvalues: v10 (copy)
    local l_TryOnItems_0 = v140.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return #v10.Dictionary.values(l_TryOnItems_0) > 1;
end;
local v143 = v4.PureComponent:extend("CatalogPage");
v143.validateProps = v7.strictInterface({
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
v143.init = function(v144) --[[ Line: 279 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v23 (copy), l_AvatarScreen_0 (copy), v57 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v22 (copy), v42 (copy), v44 (copy), v79 (copy), v96 (copy), l_sendAXCounterV2_0 (copy), v77 (copy), l_FFlagAXEnableCategoryPillsExposureLogging_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 (copy), v113 (copy)
    v144.topBarRef = v4.createRef();
    v144.sceneUIContainerRef = v4.createRef();
    v144.titleDropDownRef = v4.createRef();
    v144.topBarRenderRightRef = v4.createRef();
    v144.refinementButtonsRef = v4.createRef();
    v144.multiTryOnBottomBarRef = v4.createRef();
    v144.quickButtonsRef = v4.createRef();
    v144.itemDetailsPeekViewRefs = v8.createRefCache();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v144:setState({
        lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v144.setDefaultRefOverride = function(v146) --[[ Line: 296 ]]
        -- upvalues: v144 (copy), v4 (ref)
        v144:setState({
            defaultRefOverride = v146 or v4.None
        });
    end;
    v144.changeView = function() --[[ Line: 302 ]]
        -- upvalues: v144 (copy), v23 (ref)
        local l_avatarExperienceAnalytics_0 = v144.props.avatarExperienceAnalytics;
        local v148 = v23.getNewFullViewEnum(v144.props.fullView);
        v144.props.setFullView(l_avatarExperienceAnalytics_0, v144.props.avatarRoute.opaque.name, v148);
    end;
    v144.setUIFullView = function() --[[ Line: 309 ]]
        -- upvalues: v144 (copy), l_AvatarScreen_0 (ref), v57 (ref)
        local l_avatarExperienceAnalytics_1 = v144.props.avatarExperienceAnalytics;
        if v144.props.isPortrait then
            v144.props.setFullView(l_avatarExperienceAnalytics_1, l_AvatarScreen_0.CatalogSearch, v57.UIFullView);
        end;
    end;
    v144.isAvatarScreen = function(v150) --[[ Line: 317 ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (rawget(l_AvatarScreen_0, v150));
    end;
    v144.topBarBackButtonActivated = function() --[[ Line: 321 ]]
        -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v144 (copy), v57 (ref), l_AvatarScreen_0 (ref), v22 (ref)
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v144.props.fullView == v57.UIFullView then
            local l_avatarExperienceAnalytics_2 = v144.props.avatarExperienceAnalytics;
            v144.props.setFullView(l_avatarExperienceAnalytics_2, v144.props.avatarRoute.opaque.name, v57.None);
            return;
        else
            local l_navigation_0 = v144.props.navigation;
            local l_avatarEditorAnalytics_0 = v144.props.avatarEditorAnalytics;
            local l_prevNavPage_0 = v144.props.prevNavPage;
            local l_prevNavHistory_0 = v144.props.prevNavHistory;
            if l_prevNavPage_0 and l_prevNavHistory_0 then
                if v144.isAvatarScreen(l_prevNavPage_0) then
                    v144.props.navigation.navigate(l_prevNavPage_0);
                else
                    v144.props.resetNavigationHistory(l_prevNavHistory_0);
                end;
            else
                local v156 = if v144.props.is10ftUI then l_AvatarScreen_0.AvatarExperienceLandingPage else v22.Home;
                l_navigation_0.navigate(v156);
            end;
            l_avatarEditorAnalytics_0.catalogToAvatarBackButton();
            return;
        end;
    end;
    v144.defaultChildRef = v4.createRef();
    v144.lastInputTypeChangedCallback = function(v157) --[[ Line: 349 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v144 (copy)
        local v158 = l_isGamepadInput_0(v157);
        if v158 ~= v144.state.lastInputIsGamepad then
            v144:setState({
                lastInputIsGamepad = v158
            });
        end;
    end;
    v144.titleDropDown = v42("Feature.Avatar.Action.Marketplace", v144.props.overlayClosedCallback);
    v144.backButton = v44(v144.topBarBackButtonActivated);
    v144.onConfirmSearchCallback = function() --[[ Line: 362 ]]
        -- upvalues: v144 (copy), v79 (ref)
        v144.props.resetSearchCategoryAndSubcategory();
        if v79() and v144.setUIFullView then
            v144.setUIFullView();
        end;
    end;
    if v96() then
        l_sendAXCounterV2_0(v77.Counter.TopLevelPageInitialView.Catalog);
    end;
    if l_FFlagAXEnableCategoryPillsExposureLogging_0 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
    if l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v113);
    end;
end;
v143.getBestDefaultRefForPage = function(v159) --[[ Line: 384 ]] --[[ Name: getBestDefaultRefForPage ]]
    if v159.state.defaultRefOverride then
        return v159.state.defaultRefOverride;
    else
        return v159.defaultChildRef;
    end;
end;
if not l_FFlagAXMigrateCatalogPageInputBindings_0 then
    v143.getInputBindings = function(v160) --[[ Line: 393 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreenProperties_0 (copy), v10 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v8 (copy), v36 (copy), l_PeekViewState_0 (copy)
        local l_avatarRoute_0 = v160.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local l_isMultiTryOn_0 = l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
        local v164 = #v10.Dictionary.values(v160.props.tryOnItems) > 1;
        local v165 = {
            OpenTryOnManager = if l_name_0 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_0 or l_FFlagAXMISEnableMultiShopping_0) and v164 then v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 403 ]]
                -- upvalues: v36 (ref), v160 (copy), l_AvatarScreen_0 (ref)
                v36.closeFiltersAndItemDetails(v160.props.navigation);
                v160.props.navigation.navigate(l_AvatarScreen_0.TryOnManager);
            end, {
                key = "Feature.Catalog.Label.TryOns"
            }) else nil
        };
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            return (v10.Dictionary.join(v165, {
                NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 414 ]]
                    -- upvalues: v36 (ref), v160 (copy)
                    v36.closeFocusedScreen(v160.props.navigation);
                end), 
                OpenItemPrompt = v8.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 417 ]]
                    -- upvalues: v160 (copy), l_avatarRoute_0 (copy)
                    v160.props.openItemPrompt(v160.props.networking, v160.props.catalogAnalytics, v160.props.overlayClosedCallback, v160.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v8.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 428 ]]
                    -- upvalues: v160 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                    v160.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_avatarRoute_0.current.params.itemId, 
                        itemType = l_avatarRoute_0.current.params.itemType, 
                        onOverlayClosed = v160.props.overlayClosedCallback
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            }));
        elseif l_name_0 == l_AvatarScreen_0.TryOnManager then
            return (v10.Dictionary.join(v165, {
                OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 440 ]]
                    -- upvalues: v160 (copy), l_PeekViewState_0 (ref)
                    local l_tryOnManagerPeekViewState_0 = v160.props.tryOnManagerPeekViewState;
                    if l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v160.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v160.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }));
        else
            if l_name_0 == l_AvatarScreen_0.LookDetails then
                v165 = v10.Dictionary.join(v165, {
                    OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 453 ]]
                        -- upvalues: v160 (copy), l_PeekViewState_0 (ref)
                        local l_tryOnManagerPeekViewState_1 = v160.props.tryOnManagerPeekViewState;
                        if l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Extended then
                            v160.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                            return;
                        else
                            v160.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                            return;
                        end;
                    end, {
                        key = "Feature.Catalog.Label.TryOns"
                    })
                });
            end;
            return v165;
        end;
    end;
end;
if v105 then
    v143.sendExperimentCountersOnce = function(_) --[[ Line: 471 ]] --[[ Name: sendExperimentCountersOnce ]]

    end;
end;
v143.didMount = function(v169) --[[ Line: 474 ]] --[[ Name: didMount ]]
    -- upvalues: v61 (copy), v105 (copy), v106 (copy), v81 (copy), v107 (copy), v98 (copy), l_AppUserLayers_0 (copy), v112 (copy), l_IXPServiceWrapper_0 (copy), v111 (copy)
    if not v169.props.is10ftUI and v61(v169.props) then
        v169.props.androidBackButtonConnection.connect(v169.topBarBackButtonActivated);
    end;
    if v105 then
        v169:sendExperimentCountersOnce();
    end;
    if v106 then
        v81.logLayerExposure(if v107 then v98() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
    if v112 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v111);
    end;
end;
v143.willUnmount = function(v170) --[[ Line: 498 ]] --[[ Name: willUnmount ]]
    v170.props.androidBackButtonConnection.disconnect();
end;
v143.didUpdate = function(v171, v172) --[[ Line: 502 ]] --[[ Name: didUpdate ]]
    -- upvalues: v61 (copy)
    if not v171.props.is10ftUI then
        if not v61(v172) and v61(v171.props) then
            v171.props.androidBackButtonConnection.connect(v171.topBarBackButtonActivated);
            return;
        elseif v61(v172) and not v61(v171.props) then
            v171.props.androidBackButtonConnection.disconnect();
        end;
    end;
end;
v143.willUpdate = function(v173, v174) --[[ Line: 512 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v44 (copy)
    if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v174.fullView ~= v173.props.fullView then
        v173.backButton = v44(v173.topBarBackButtonActivated, v173:getBackButtonIcon(v174.fullView));
    end;
end;
if l_FFlagAXExpandPeekViewOnFirstScroll_0 then
    v143.getBackButtonIcon = function(v175, v176) --[[ Line: 520 ]] --[[ Name: getBackButtonIcon ]]
        -- upvalues: v57 (copy), v136 (copy)
        if not v176 then
            v176 = v175.props.fullView;
        end;
        if v176 == v57.UIFullView then
            return v136;
        else
            return nil;
        end;
    end;
end;
v143.renderTopBar = function(v177) --[[ Line: 534 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v79 (copy), l_IsVRAppBuild_0 (copy), v43 (copy), v47 (copy), v4 (copy), v59 (copy), l_FFlagAXOpaqueMarketplaceTopbar_0 (copy)
    local l_isPortrait_0 = v177.props.isPortrait;
    local l_show3dView_0 = v177.props.show3dView;
    return l_withLocalization_0({
        title = "Feature.Avatar.Action.Marketplace"
    })(function(v180) --[[ Line: 540 ]]
        -- upvalues: v79 (ref), l_IsVRAppBuild_0 (ref), v177 (copy), v43 (ref), v47 (ref), v4 (ref), v59 (ref), l_FFlagAXOpaqueMarketplaceTopbar_0 (ref), l_isPortrait_0 (copy), l_show3dView_0 (copy)
        local v181 = 2;
        if v79() then
            v181 = 3;
        end;
        local v182 = nil;
        local v183 = nil;
        local v184 = nil;
        if l_IsVRAppBuild_0() then
            v183 = nil;
            v182 = nil;
            v184 = nil;
        else
            v182 = v177.backButton;
            v183 = if v177.props.is10ftUI then v177.titleDropDown else v43;
            v184 = {
                v47.SearchButton
            };
        end;
        return v4.createElement(v47.Container, {
            forceCompactMode = true, 
            searchType = v59.SearchTypes.Catalog, 
            titleText = v180.title, 
            ZIndex = v181, 
            transparentBackground = if not l_FFlagAXOpaqueMarketplaceTopbar_0 or l_isPortrait_0 then l_show3dView_0 else false, 
            hideSiteMessageBanner = l_isPortrait_0, 
            [v4.Ref] = v177.topBarRef, 
            setDefaultRefOverride = v177.setDefaultRefOverride, 
            NextSelectionDown = v177.defaultChildRef, 
            NextSelectionRight = v177.sceneUIContainerRef, 
            onConfirmSearchCallback = v177.onConfirmSearchCallback, 
            leftItem = v182, 
            centerItem = v183, 
            rightItems = v184, 
            useParentSizeForCenterItem = true, 
            shouldNavigateToSearchLandingPage = true
        });
    end);
end;
v143.render = function(v185) --[[ Line: 583 ]] --[[ Name: render ]]
    -- upvalues: v57 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), v49 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v33 (copy), v67 (copy), v87 (copy), v93 (copy), v86 (copy), v95 (copy), v80 (copy), v94 (copy), v68 (copy), v88 (copy), v89 (copy), l_AXRemoveBackButtonDesktopClientsIXPTest_0 (copy), l_AXAvatarsTabIXP_0 (copy), l_FFlagAXBackendDrivenCatalogLayers_0 (copy), l_getBackendLayerNamesForCatalog_0 (copy), l_FFlagBasedExposureLoggingCatalogPage_0 (copy), l_UserIsInExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 (copy), v126 (copy), v127 (copy), l_FFlagAXCatalogM41CategoriesExposureLogging_0 (copy), v45 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v48 (copy), v46 (copy)
    local v186 = v185.props.fullView == v57.SceneFullView;
    local v187 = v185.props.fullView == v57.UIFullView;
    local l_show3dView_1 = v185.props.show3dView;
    local l_namedRefs_0 = v185.props.namedRefs;
    local v190 = v185.props.avatarRoute.current.name == l_AvatarScreen_0.SortAndFilters;
    local l_quickButtonsRef_0 = v185.quickButtonsRef;
    if v185.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.TryOnManager];
    elseif v185.props.avatarRoute.current.name == l_AvatarScreen_0.LookDetails then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.LookDetails];
    elseif v190 then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.SortAndFilters];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v185.props.focusController, 
        defaultChild = v185:getBestDefaultRefForPage(), 
        restorePreviousChildFocus = false, 
        inputBindings = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v185:getInputBindings(), 
        ref = l_namedRefs_0[l_AvatarScreen_0.Catalog]
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v49), 
        LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v185.lastInputTypeChangedCallback
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
                if v126 then v127 else nil, 
                if l_FFlagAXCatalogM41CategoriesExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil
            } else nil
        }), 
        AvatarExperienceView = v4.createElement(v45, {
            changeViewFunction = v185.changeView, 
            allowAdaptiveScrolling = true, 
            adaptiveScrollingProps = if not not l_FFlagAXHideMenuOnScroll_0 or l_FFlagAXExpandPeekViewOnFirstScroll_0 then {
                enableExpandPeekViewOnUpwardScroll = l_FFlagAXExpandPeekViewOnFirstScroll_0 and true or nil, 
                enableAnimatedVisibility = l_FFlagAXHideMenuOnScroll_0 and true or nil
            } else nil, 
            isDisabled = not l_show3dView_1, 
            isSceneFullView = v186, 
            isUIFullView = v187, 
            topBar = v185:renderTopBar(), 
            refinementButtonsRef = v185.refinementButtonsRef, 
            quickButtonsRef = v185.quickButtonsRef, 
            [v4.Ref] = v185.sceneUIContainerRef, 
            NextSelectionDown = v185.defaultChildRef, 
            NextSelectionLeft = v185.topBarRef, 
            defaultChildRef = v185.defaultChildRef, 
            multiTryOnBottomBarRef = v185.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v185.itemDetailsPeekViewRefs, 
            showUndoRedo = true, 
            showSaveButton = false
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v48, {
                focusController = v185.props.focusController, 
                captureFocusOnMount = true
            }), 
            NavigationAndItemsList = v4.createElement(v46, {
                defaultChildRef = v185.defaultChildRef, 
                NextSelectionUp = v185.topBarRef, 
                NextSelectionRight = l_quickButtonsRef_0, 
                multiTryOnBottomBarRef = v185.multiTryOnBottomBarRef, 
                itemDetailsPeekViewRefs = v185.itemDetailsPeekViewRefs
            })
        })
    });
end;
v143 = v6.connect(function(v192) --[[ Line: 711 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v63 (copy), l_AvatarScreen_0 (copy), v62 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy)
    return {
        fullView = v63(v192, l_AvatarScreen_0.Catalog), 
        isPortrait = v62(v192), 
        itemDetailsExpanded = v192.AvatarExperience.Common.ItemDetailsExpanded, 
        tryOnManagerPeekViewState = v192.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v192.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v193) --[[ Line: 723 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v54 (copy), v53 (copy), v58 (copy), v55 (copy), v64 (copy), v65 (copy), v56 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v110 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v77 (copy), l_CatalogCategories_0 (copy), v135 (copy), v75 (copy)
    return {
        openItemPrompt = function(v194, v195, v196, v197, v198) --[[ Line: 725 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v193 (copy), v54 (ref)
            v193(v54(v194, v195, v196, v197, v198));
        end, 
        setItemDetailsPeekViewState = function(v199) --[[ Line: 728 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v193 (copy), v53 (ref)
            v193(v53(v199));
        end, 
        navigateIntoQuickMenu = function(v200, v201) --[[ Line: 731 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v193 (copy), v58 (ref)
            v193(v58(v200, v201));
        end, 
        setFullView = function(v202, v203, v204) --[[ Line: 734 ]] --[[ Name: setFullView ]]
            -- upvalues: v193 (copy), v55 (ref)
            v193(v55(v202, v203, v204));
        end, 
        resetNavigationHistory = function(v205) --[[ Line: 737 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v193 (copy), v64 (ref)
            return v193(v64(nil, v205));
        end, 
        instantResetNavigationHistory = function(v206) --[[ Line: 740 ]] --[[ Name: instantResetNavigationHistory ]]
            -- upvalues: v193 (copy), v65 (ref)
            return v193(v65(nil, v206));
        end, 
        setTryOnManagerPeekViewState = function(v207) --[[ Line: 743 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v193 (copy), v56 (ref)
            v193(v56(v207));
        end, 
        resetSearchCategoryAndSubcategory = function() --[[ Line: 746 ]] --[[ Name: resetSearchCategoryAndSubcategory ]]
            -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (ref), v110 (ref), l_FFlagAXDefaultCatalogCategoryId_0 (ref), v77 (ref), l_CatalogCategories_0 (ref), v135 (ref), v193 (copy), v75 (ref)
            if l_FFlagAXCatalogCategoriesStore_0 then
                if not v110.getCatalogSearchSelectionStore().changeCategory(if l_FFlagAXDefaultCatalogCategoryId_0 then v77.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue(), nil) then
                    v135("Failed to select subcategory in ResetSearchCategoryAndSubcategory thunk");
                    return;
                end;
            else
                v193(v75("All", nil));
            end;
        end
    };
end)(v143);
v143 = l_RoactServices_0.connect({
    avatarExperienceAnalytics = v28, 
    networking = v31, 
    appAnalytics = v29, 
    avatarEditorAnalytics = v50, 
    catalogAnalytics = v51
})(v143);
v143 = v40((v35(v34((l_RoactAppPolicy_0.connect(function(v208, _) --[[ Line: 775 ]]
    return {
        show3dView = v208.getCatalogShow3dView()
    };
end)(v143))), nil)));
return function(v210) --[[ Line: 787 ]] --[[ Name: CatalogPageContainer ]]
    -- upvalues: l_FFlagAXRefetchAvatarOnTimeout_0 (copy), l_useRoactService_0 (copy), v31 (copy), l_useDispatch_0 (copy), l_FFlagDynamicHeadsMigration_0 (copy), v5 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), v60 (copy), v72 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), v51 (copy), v41 (copy), v71 (copy), l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_AvatarScreenProperties_0 (copy), l_useSelector_0 (copy), v142 (copy), v70 (copy), v36 (copy), v54 (copy), v139 (copy), l_PeekViewState_0 (copy), v56 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_FFlagAXHideCatalogShortcutsInFullView_0 (copy), v63 (copy), v57 (copy), v129 (copy), v69 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useCatalogPageMISIntroFtux_0 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), v134 (copy), l_useCatalogPageTimeoutPrompt_0 (copy), l_FFlagAXMakeupReleaseFTUX_0 (copy), v110 (copy), l_CatalogCategories_0 (copy), l_useCatalogPageMakeupReleaseFtux_0 (copy), v10 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), v130 (copy), v143 (ref)
    local v211 = nil;
    local v212 = nil;
    if l_FFlagAXRefetchAvatarOnTimeout_0 then
        v211 = l_useRoactService_0(v31);
        v212 = l_useDispatch_0();
    end;
    if l_FFlagDynamicHeadsMigration_0 then
        v5.useEffect(function() --[[ Line: 796 ]]
            -- upvalues: v21 (ref)
            local v213 = v21(false);
            if v213 then
                v213.getInventory(false);
            end;
        end, {});
    end;
    local v214 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useRef(v8.createFocusController()).current;
    local l_current_0 = v5.useRef(v60()).current;
    local v216 = v72(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v214);
    local v217 = nil;
    if l_FFlagAXMigrateCatalogPageInputBindings_0 then
        if not l_FFlagAXRefetchAvatarOnTimeout_0 then
            v211 = l_useRoactService_0(v31);
            v212 = l_useDispatch_0();
        end;
        local v218 = l_useRoactService_0(v51);
        local v219 = v41();
        local v220 = v71();
        local v221 = l_useAvatarRoute_0();
        local v222 = v221.current.name == l_AvatarScreen_0.ItemDetails;
        local v223 = true;
        if v221.current.name ~= l_AvatarScreen_0.LookDetails then
            v223 = v221.current.name == l_AvatarScreen_0.TryOnManager;
        end;
        local l_isMultiTryOn_1 = l_AvatarScreenProperties_0[v221.opaque.name].isMultiTryOn;
        local v225 = l_useSelector_0(v142);
        local v226 = false;
        if v221.current.name ~= l_AvatarScreen_0.TryOnManager then
            v226 = l_isMultiTryOn_1 and v225;
        end;
        local v227 = v70(v216);
        local v229 = v5.useCallback(function(v228) --[[ Line: 836 ]]
            -- upvalues: v36 (ref), v210 (copy)
            v228.cancelled = true;
            v36.closeFocusedScreen(v210.navigation);
        end, {
            v210.navigation
        });
        local l_v218_0 = v218 --[[ copy: 7 -> 29 ]];
        local l_v221_0 = v221 --[[ copy: 10 -> 30 ]];
        local v232 = v5.useCallback(function() --[[ Line: 842 ]]
            -- upvalues: v212 (ref), v54 (ref), v211 (ref), l_v218_0 (copy), v216 (copy), v210 (copy), l_v221_0 (copy)
            v212(v54(v211, l_v218_0, v216, v210.navigation, l_v221_0));
        end, {
            v212, 
            v211, 
            v218, 
            v216, 
            v210.navigation, 
            v221
        });
        local v233 = v5.useCallback(function() --[[ Line: 850 ]]
            -- upvalues: v210 (copy), l_AvatarScreen_0 (ref), l_v221_0 (copy), v216 (copy)
            v210.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = l_v221_0.current.params.itemId, 
                itemType = l_v221_0.current.params.itemType, 
                onOverlayClosed = v216
            });
        end, {
            v210.navigation, 
            v221, 
            v216
        });
        local v234 = l_useSelector_0(v139);
        local v236 = v5.useCallback(function() --[[ Line: 860 ]]
            -- upvalues: v234 (copy), l_PeekViewState_0 (ref), v212 (ref), v56 (ref)
            local v235 = if not (v234 ~= l_PeekViewState_0.Full) or v234 == l_PeekViewState_0.Extended then l_PeekViewState_0.Brief else l_PeekViewState_0.Full;
            v212(v56(v235));
        end, {
            v234, 
            v212
        });
        local v237 = v5.useCallback(function() --[[ Line: 868 ]]
            -- upvalues: v36 (ref), v210 (copy), l_AvatarScreen_0 (ref)
            v36.closeFiltersAndItemDetails(v210.navigation);
            v210.navigation.navigate(l_AvatarScreen_0.TryOnManager);
        end, {
            v210.navigation
        });
        local l_v219_0 = v219 --[[ copy: 8 -> 31 ]];
        local v239 = v5.useCallback(function() --[[ Line: 873 ]]
            -- upvalues: l_v219_0 (copy), l_AvatarScreen_0 (ref)
            l_v219_0:fire(l_AvatarScreen_0.Catalog);
        end, {
            v219
        });
        local v240 = v5.useMemo(function() --[[ Line: 877 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v223 (copy), v226 (copy)
            return {
                [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu, 
                [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
                [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu, 
                [Enum.KeyCode.ButtonY] = if not not v223 or v226 then l_FocusNavigationEventNameEnum_0.ToggleTryOnManager else l_FocusNavigationEventNameEnum_0.Search
            };
        end, {
            v223, 
            v226
        });
        if l_FFlagAXHideCatalogShortcutsInFullView_0 then
            local l_v221_1 = v221 --[[ copy: 10 -> 32 ]];
            local v243 = v5.useCallback(function(v242) --[[ Line: 891 ]]
                -- upvalues: v63 (ref), l_v221_1 (copy), v57 (ref)
                return v63(v242, l_v221_1.opaque.name) == v57.SceneFullView;
            end, {
                v221.opaque.name
            });
            local v244 = not l_useSelector_0(v243);
            v217 = v129(v240, {
                onNavigateBack = if v244 and v222 then v229 else nil, 
                onOpenQuickMenu = if v244 and v220 then v227 else nil, 
                onOpenBuyItemPrompt = if v244 and v222 then v232 else nil, 
                onOpenContextMenu = if v244 and v222 then v233 else nil, 
                onToggleSearch = if v244 then v239 else nil, 
                onToggleTryOnManager = if v244 and v223 then v236 else if v226 then v237 else nil
            });
        else
            v217 = v129(v240, {
                onNavigateBack = if v222 then v229 else nil, 
                onOpenQuickMenu = if v220 then v227 else nil, 
                onOpenBuyItemPrompt = if v222 then v232 else nil, 
                onOpenContextMenu = if v222 then v233 else nil, 
                onToggleSearch = v239, 
                onToggleTryOnManager = if v223 then v236 else if v226 then v237 else nil
            });
        end;
    else
        v217 = v69({
            overlayClosedCallback = v216
        });
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v245 = l_useAvatarRoute_0();
        l_useCatalogPageMISIntroFtux_0(v245, v210.navigation);
    end;
    if l_FFlagAXAvatarTimeoutFlow_0 then
        local v246 = l_useAvatarRoute_0();
        local v247 = if l_FFlagAXRefetchAvatarOnTimeout_0 then v5.useCallback(function() --[[ Line: 937 ]]
            -- upvalues: v212 (ref), v134 (ref), v211 (ref)
            v212(v134(v211, true));
        end, {
            v212, 
            v211
        }) else nil;
        l_useCatalogPageTimeoutPrompt_0(v210.navigation, if l_FFlagAXRefetchAvatarOnTimeout_0 and v246.opaque.name == l_AvatarScreen_0.Catalog then v247 else nil);
    end;
    if l_FFlagAXMakeupReleaseFTUX_0 then
        local v248 = l_useAvatarRoute_0();
        local v249 = v5.useCallback(function() --[[ Line: 952 ]]
            -- upvalues: v110 (ref), l_CatalogCategories_0 (ref)
            v110.getCatalogSelectionStore().changeCategory(l_CatalogCategories_0.Makeup:rawValue(), nil);
        end, {});
        l_useCatalogPageMakeupReleaseFtux_0(v248, v210.navigation, v249);
    end;
    local l_join_0 = v10.Dictionary.join;
    local l_v210_0 = v210;
    local v252 = {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v214, 
        overlayClosedCallback = v216, 
        androidBackButtonConnection = l_current_0
    };
    local v253 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v253 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    v252.is10ftUI = v253;
    l_join_0 = l_join_0(l_v210_0, v252);
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        v130();
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v217
    }, v5.createElement(v143, l_join_0));
end;