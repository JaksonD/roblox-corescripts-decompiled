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
local l_FFlagAXPassScreenSizeToWidgetApiLogExposure_0 = v84.FFlagAXPassScreenSizeToWidgetApiLogExposure;
local l_FStringAXPassScreenSizeToWidgetApiExposureLayer_0 = v84.FStringAXPassScreenSizeToWidgetApiExposureLayer;
local l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 = v84.FFlagAXEnableTaxonomyM20ExposureLoggingCatalog;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v84.FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 = v84.FFlagAXMoveCatalogFilterToL1NavigationExposureLogging;
local l_FFlagAXDefaultCatalogCategoryId_0 = v84.FFlagAXDefaultCatalogCategoryId;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v84.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v126 = game:DefineFastFlag("FFlagAXCatalogCategoriesSDUIExposureLogging", false);
local v127 = game:DefineFastString("FStringAXCatalogCategoriesSDUIExposureLayer", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local v128 = require(script.Parent.useCatalogPageFocusNavigationBindings);
local v129 = require(script.Parent.useCatalogPageRevertToLastEquippedStateHook);
local l_useCatalogPageMISIntroFtux_0 = v20.Hooks.useCatalogPageMISIntroFtux;
local l_useCatalogPageTimeoutPrompt_0 = v20.Hooks.useCatalogPageTimeoutPrompt;
local l_useCatalogPageMakeupReleaseFtux_0 = v20.Hooks.useCatalogPageMakeupReleaseFtux;
local v133 = require(l_Modules_0.LuaApp.mutedError);
local v134 = l_Images_0["icons/actions/truncationExpand"];
local l_CatalogCategories_0 = v19.Enums.CatalogCategories;
local function v137(v136) --[[ Line: 205 ]] --[[ Name: selectTryOnManagerViewState ]]
    return v136.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local function v140(v138) --[[ Line: 209 ]] --[[ Name: selectIsTryOnButtonShowing ]]
    -- upvalues: v10 (copy)
    local l_TryOnItems_0 = v138.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return #v10.Dictionary.values(l_TryOnItems_0) > 1;
end;
local v141 = v4.PureComponent:extend("CatalogPage");
v141.validateProps = v7.strictInterface({
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
v141.init = function(v142) --[[ Line: 276 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy), l_UserInputService_0 (copy), l_isGamepadInput_0 (copy), v23 (copy), l_AvatarScreen_0 (copy), v57 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v22 (copy), v42 (copy), v44 (copy), v79 (copy), v96 (copy), l_sendAXCounterV2_0 (copy), v77 (copy), l_FFlagAXEnableCategoryPillsExposureLogging_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXEnableTaxonomyM20ExposureLoggingCatalog_0 (copy), v112 (copy)
    v142.topBarRef = v4.createRef();
    v142.sceneUIContainerRef = v4.createRef();
    v142.titleDropDownRef = v4.createRef();
    v142.topBarRenderRightRef = v4.createRef();
    v142.refinementButtonsRef = v4.createRef();
    v142.multiTryOnBottomBarRef = v4.createRef();
    v142.quickButtonsRef = v4.createRef();
    v142.itemDetailsPeekViewRefs = v8.createRefCache();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v142:setState({
        lastInputIsGamepad = l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0)
    });
    v142.setDefaultRefOverride = function(v144) --[[ Line: 293 ]]
        -- upvalues: v142 (copy), v4 (ref)
        v142:setState({
            defaultRefOverride = v144 or v4.None
        });
    end;
    v142.changeView = function() --[[ Line: 299 ]]
        -- upvalues: v142 (copy), v23 (ref)
        local l_avatarExperienceAnalytics_0 = v142.props.avatarExperienceAnalytics;
        local v146 = v23.getNewFullViewEnum(v142.props.fullView);
        v142.props.setFullView(l_avatarExperienceAnalytics_0, v142.props.avatarRoute.opaque.name, v146);
    end;
    v142.setUIFullView = function() --[[ Line: 306 ]]
        -- upvalues: v142 (copy), l_AvatarScreen_0 (ref), v57 (ref)
        local l_avatarExperienceAnalytics_1 = v142.props.avatarExperienceAnalytics;
        if v142.props.isPortrait then
            v142.props.setFullView(l_avatarExperienceAnalytics_1, l_AvatarScreen_0.CatalogSearch, v57.UIFullView);
        end;
    end;
    v142.isAvatarScreen = function(v148) --[[ Line: 314 ]]
        -- upvalues: l_AvatarScreen_0 (ref)
        return (rawget(l_AvatarScreen_0, v148));
    end;
    v142.topBarBackButtonActivated = function() --[[ Line: 318 ]]
        -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v142 (copy), v57 (ref), l_AvatarScreen_0 (ref), v22 (ref)
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v142.props.fullView == v57.UIFullView then
            local l_avatarExperienceAnalytics_2 = v142.props.avatarExperienceAnalytics;
            v142.props.setFullView(l_avatarExperienceAnalytics_2, v142.props.avatarRoute.opaque.name, v57.None);
            return;
        else
            local l_navigation_0 = v142.props.navigation;
            local l_avatarEditorAnalytics_0 = v142.props.avatarEditorAnalytics;
            local l_prevNavPage_0 = v142.props.prevNavPage;
            local l_prevNavHistory_0 = v142.props.prevNavHistory;
            if l_prevNavPage_0 and l_prevNavHistory_0 then
                if v142.isAvatarScreen(l_prevNavPage_0) then
                    v142.props.navigation.navigate(l_prevNavPage_0);
                else
                    v142.props.resetNavigationHistory(l_prevNavHistory_0);
                end;
            else
                local v154 = if v142.props.is10ftUI then l_AvatarScreen_0.AvatarExperienceLandingPage else v22.Home;
                l_navigation_0.navigate(v154);
            end;
            l_avatarEditorAnalytics_0.catalogToAvatarBackButton();
            return;
        end;
    end;
    v142.defaultChildRef = v4.createRef();
    v142.lastInputTypeChangedCallback = function(v155) --[[ Line: 346 ]]
        -- upvalues: l_isGamepadInput_0 (ref), v142 (copy)
        local v156 = l_isGamepadInput_0(v155);
        if v156 ~= v142.state.lastInputIsGamepad then
            v142:setState({
                lastInputIsGamepad = v156
            });
        end;
    end;
    v142.titleDropDown = v42("Feature.Avatar.Action.Marketplace", v142.props.overlayClosedCallback);
    v142.backButton = v44(v142.topBarBackButtonActivated);
    v142.onConfirmSearchCallback = function() --[[ Line: 359 ]]
        -- upvalues: v142 (copy), v79 (ref)
        v142.props.resetSearchCategoryAndSubcategory();
        if v79() and v142.setUIFullView then
            v142.setUIFullView();
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
v141.getBestDefaultRefForPage = function(v157) --[[ Line: 381 ]] --[[ Name: getBestDefaultRefForPage ]]
    if v157.state.defaultRefOverride then
        return v157.state.defaultRefOverride;
    else
        return v157.defaultChildRef;
    end;
end;
if not l_FFlagAXMigrateCatalogPageInputBindings_0 then
    v141.getInputBindings = function(v158) --[[ Line: 390 ]] --[[ Name: getInputBindings ]]
        -- upvalues: l_AvatarScreenProperties_0 (copy), v10 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v8 (copy), v36 (copy), l_PeekViewState_0 (copy)
        local l_avatarRoute_0 = v158.props.avatarRoute;
        local l_name_0 = l_avatarRoute_0.current.name;
        local l_isMultiTryOn_0 = l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
        local v162 = #v10.Dictionary.values(v158.props.tryOnItems) > 1;
        local v163 = {
            OpenTryOnManager = if l_name_0 ~= l_AvatarScreen_0.TryOnManager and (l_isMultiTryOn_0 or l_FFlagAXMISEnableMultiShopping_0) and v162 then v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 400 ]]
                -- upvalues: v36 (ref), v158 (copy), l_AvatarScreen_0 (ref)
                v36.closeFiltersAndItemDetails(v158.props.navigation);
                v158.props.navigation.navigate(l_AvatarScreen_0.TryOnManager);
            end, {
                key = "Feature.Catalog.Label.TryOns"
            }) else nil
        };
        if l_name_0 == l_AvatarScreen_0.ItemDetails then
            return (v10.Dictionary.join(v163, {
                NavigateBack = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 411 ]]
                    -- upvalues: v36 (ref), v158 (copy)
                    v36.closeFocusedScreen(v158.props.navigation);
                end), 
                OpenItemPrompt = v8.Input.onBegin(Enum.KeyCode.ButtonX, function() --[[ Line: 414 ]]
                    -- upvalues: v158 (copy), l_avatarRoute_0 (copy)
                    v158.props.openItemPrompt(v158.props.networking, v158.props.catalogAnalytics, v158.props.overlayClosedCallback, v158.props.navigation, l_avatarRoute_0);
                end, {
                    key = "Feature.Catalog.Action.Buy"
                }), 
                OpenCatalogContextMenu = v8.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 425 ]]
                    -- upvalues: v158 (copy), l_AvatarScreen_0 (ref), l_avatarRoute_0 (copy)
                    v158.props.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                        itemId = l_avatarRoute_0.current.params.itemId, 
                        itemType = l_avatarRoute_0.current.params.itemType, 
                        onOverlayClosed = v158.props.overlayClosedCallback
                    });
                end, {
                    key = "Feature.Catalog.Action.ItemOptions"
                })
            }));
        elseif l_name_0 == l_AvatarScreen_0.TryOnManager then
            return (v10.Dictionary.join(v163, {
                OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 437 ]]
                    -- upvalues: v158 (copy), l_PeekViewState_0 (ref)
                    local l_tryOnManagerPeekViewState_0 = v158.props.tryOnManagerPeekViewState;
                    if l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_0 == l_PeekViewState_0.Extended then
                        v158.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                        return;
                    else
                        v158.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                        return;
                    end;
                end, {
                    key = "Feature.Catalog.Label.TryOns"
                })
            }));
        else
            if l_name_0 == l_AvatarScreen_0.LookDetails then
                v163 = v10.Dictionary.join(v163, {
                    OpenCloseTryOnManager = v8.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 450 ]]
                        -- upvalues: v158 (copy), l_PeekViewState_0 (ref)
                        local l_tryOnManagerPeekViewState_1 = v158.props.tryOnManagerPeekViewState;
                        if l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Full or l_tryOnManagerPeekViewState_1 == l_PeekViewState_0.Extended then
                            v158.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Brief);
                            return;
                        else
                            v158.props.setTryOnManagerPeekViewState(l_PeekViewState_0.Full);
                            return;
                        end;
                    end, {
                        key = "Feature.Catalog.Label.TryOns"
                    })
                });
            end;
            return v163;
        end;
    end;
end;
if v104 then
    v141.sendExperimentCountersOnce = function(_) --[[ Line: 468 ]] --[[ Name: sendExperimentCountersOnce ]]

    end;
end;
v141.didMount = function(v167) --[[ Line: 471 ]] --[[ Name: didMount ]]
    -- upvalues: v61 (copy), v104 (copy), v105 (copy), v81 (copy), v106 (copy), v98 (copy), l_AppUserLayers_0 (copy), v111 (copy), l_IXPServiceWrapper_0 (copy), v110 (copy)
    if not v167.props.is10ftUI and v61(v167.props) then
        v167.props.androidBackButtonConnection.connect(v167.topBarBackButtonActivated);
    end;
    if v104 then
        v167:sendExperimentCountersOnce();
    end;
    if v105 then
        v81.logLayerExposure(if v106 then v98() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
    end;
    if v111 then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v110);
    end;
end;
v141.willUnmount = function(v168) --[[ Line: 495 ]] --[[ Name: willUnmount ]]
    v168.props.androidBackButtonConnection.disconnect();
end;
v141.didUpdate = function(v169, v170) --[[ Line: 499 ]] --[[ Name: didUpdate ]]
    -- upvalues: v61 (copy)
    if not v169.props.is10ftUI then
        if not v61(v170) and v61(v169.props) then
            v169.props.androidBackButtonConnection.connect(v169.topBarBackButtonActivated);
            return;
        elseif v61(v170) and not v61(v169.props) then
            v169.props.androidBackButtonConnection.disconnect();
        end;
    end;
end;
v141.willUpdate = function(v171, v172) --[[ Line: 509 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v44 (copy)
    if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v172.fullView ~= v171.props.fullView then
        v171.backButton = v44(v171.topBarBackButtonActivated, v171:getBackButtonIcon(v172.fullView));
    end;
end;
if l_FFlagAXExpandPeekViewOnFirstScroll_0 then
    v141.getBackButtonIcon = function(v173, v174) --[[ Line: 517 ]] --[[ Name: getBackButtonIcon ]]
        -- upvalues: v57 (copy), v134 (copy)
        if not v174 then
            v174 = v173.props.fullView;
        end;
        if v174 == v57.UIFullView then
            return v134;
        else
            return nil;
        end;
    end;
end;
v141.renderTopBar = function(v175) --[[ Line: 531 ]] --[[ Name: renderTopBar ]]
    -- upvalues: l_withLocalization_0 (copy), v79 (copy), l_IsVRAppBuild_0 (copy), v43 (copy), v47 (copy), v4 (copy), v59 (copy), l_FFlagAXOpaqueMarketplaceTopbar_0 (copy)
    local l_isPortrait_0 = v175.props.isPortrait;
    local l_show3dView_0 = v175.props.show3dView;
    return l_withLocalization_0({
        title = "Feature.Avatar.Action.Marketplace"
    })(function(v178) --[[ Line: 537 ]]
        -- upvalues: v79 (ref), l_IsVRAppBuild_0 (ref), v175 (copy), v43 (ref), v47 (ref), v4 (ref), v59 (ref), l_FFlagAXOpaqueMarketplaceTopbar_0 (ref), l_isPortrait_0 (copy), l_show3dView_0 (copy)
        local v179 = 2;
        if v79() then
            v179 = 3;
        end;
        local v180 = nil;
        local v181 = nil;
        local v182 = nil;
        if l_IsVRAppBuild_0() then
            v181 = nil;
            v180 = nil;
            v182 = nil;
        else
            v180 = v175.backButton;
            v181 = if v175.props.is10ftUI then v175.titleDropDown else v43;
            v182 = {
                v47.SearchButton
            };
        end;
        return v4.createElement(v47.Container, {
            forceCompactMode = true, 
            searchType = v59.SearchTypes.Catalog, 
            titleText = v178.title, 
            ZIndex = v179, 
            transparentBackground = if not l_FFlagAXOpaqueMarketplaceTopbar_0 or l_isPortrait_0 then l_show3dView_0 else false, 
            hideSiteMessageBanner = l_isPortrait_0, 
            [v4.Ref] = v175.topBarRef, 
            setDefaultRefOverride = v175.setDefaultRefOverride, 
            NextSelectionDown = v175.defaultChildRef, 
            NextSelectionRight = v175.sceneUIContainerRef, 
            onConfirmSearchCallback = v175.onConfirmSearchCallback, 
            leftItem = v180, 
            centerItem = v181, 
            rightItems = v182, 
            useParentSizeForCenterItem = true, 
            shouldNavigateToSearchLandingPage = true
        });
    end);
end;
v141.render = function(v183) --[[ Line: 580 ]] --[[ Name: render ]]
    -- upvalues: v57 (copy), l_AvatarScreen_0 (copy), v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), v49 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v33 (copy), v67 (copy), v87 (copy), v93 (copy), v86 (copy), v95 (copy), v80 (copy), v94 (copy), v68 (copy), v88 (copy), v89 (copy), l_AXRemoveBackButtonDesktopClientsIXPTest_0 (copy), l_AXAvatarsTabIXP_0 (copy), l_FFlagAXBackendDrivenCatalogLayers_0 (copy), l_getBackendLayerNamesForCatalog_0 (copy), l_FFlagBasedExposureLoggingCatalogPage_0 (copy), l_UserIsInExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagAXPassScreenSizeToWidgetApiLogExposure_0 (copy), l_FStringAXPassScreenSizeToWidgetApiExposureLayer_0 (copy), l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 (copy), v126 (copy), v127 (copy), v45 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), v48 (copy), v46 (copy)
    local v184 = v183.props.fullView == v57.SceneFullView;
    local v185 = v183.props.fullView == v57.UIFullView;
    local l_show3dView_1 = v183.props.show3dView;
    local l_namedRefs_0 = v183.props.namedRefs;
    local v188 = v183.props.avatarRoute.current.name == l_AvatarScreen_0.SortAndFilters;
    local l_quickButtonsRef_0 = v183.quickButtonsRef;
    if v183.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnManager then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.TryOnManager];
    elseif v183.props.avatarRoute.current.name == l_AvatarScreen_0.LookDetails then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.LookDetails];
    elseif v188 then
        l_quickButtonsRef_0 = l_namedRefs_0[l_AvatarScreen_0.SortAndFilters];
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v183.props.focusController, 
        defaultChild = v183:getBestDefaultRefForPage(), 
        restorePreviousChildFocus = false, 
        inputBindings = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v183:getInputBindings(), 
        ref = l_namedRefs_0[l_AvatarScreen_0.Catalog]
    }, {
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v49), 
        LastInputTypeChangedConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v183.lastInputTypeChangedCallback
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
                if l_FFlagAXPassScreenSizeToWidgetApiLogExposure_0 then l_FStringAXPassScreenSizeToWidgetApiExposureLayer_0 else nil, 
                if l_FFlagAXMoveCatalogFilterToL1NavigationExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAMarketplaceView else nil, 
                if v126 then v127 else nil
            } else nil
        }), 
        AvatarExperienceView = v4.createElement(v45, {
            changeViewFunction = v183.changeView, 
            allowAdaptiveScrolling = true, 
            adaptiveScrollingProps = if not not l_FFlagAXHideMenuOnScroll_0 or l_FFlagAXExpandPeekViewOnFirstScroll_0 then {
                enableExpandPeekViewOnUpwardScroll = l_FFlagAXExpandPeekViewOnFirstScroll_0 and true or nil, 
                enableAnimatedVisibility = l_FFlagAXHideMenuOnScroll_0 and true or nil
            } else nil, 
            isDisabled = not l_show3dView_1, 
            isSceneFullView = v184, 
            isUIFullView = v185, 
            topBar = v183:renderTopBar(), 
            refinementButtonsRef = v183.refinementButtonsRef, 
            quickButtonsRef = v183.quickButtonsRef, 
            [v4.Ref] = v183.sceneUIContainerRef, 
            NextSelectionDown = v183.defaultChildRef, 
            NextSelectionLeft = v183.topBarRef, 
            defaultChildRef = v183.defaultChildRef, 
            multiTryOnBottomBarRef = v183.multiTryOnBottomBarRef, 
            itemDetailsPeekViewRefs = v183.itemDetailsPeekViewRefs, 
            showUndoRedo = true, 
            showSaveButton = false
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v48, {
                focusController = v183.props.focusController, 
                captureFocusOnMount = true
            }), 
            NavigationAndItemsList = v4.createElement(v46, {
                defaultChildRef = v183.defaultChildRef, 
                NextSelectionUp = v183.topBarRef, 
                NextSelectionRight = l_quickButtonsRef_0, 
                multiTryOnBottomBarRef = v183.multiTryOnBottomBarRef, 
                itemDetailsPeekViewRefs = v183.itemDetailsPeekViewRefs
            })
        })
    });
end;
v141 = v6.connect(function(v190) --[[ Line: 708 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v63 (copy), l_AvatarScreen_0 (copy), v62 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy)
    return {
        fullView = v63(v190, l_AvatarScreen_0.Catalog), 
        isPortrait = v62(v190), 
        itemDetailsExpanded = v190.AvatarExperience.Common.ItemDetailsExpanded, 
        tryOnManagerPeekViewState = v190.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState, 
        tryOnItems = if l_FFlagAXMigrateCatalogPageInputBindings_0 then nil else v190.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v191) --[[ Line: 720 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v54 (copy), v53 (copy), v58 (copy), v55 (copy), v64 (copy), v65 (copy), v56 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v109 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v77 (copy), l_CatalogCategories_0 (copy), v133 (copy), v75 (copy)
    return {
        openItemPrompt = function(v192, v193, v194, v195, v196) --[[ Line: 722 ]] --[[ Name: openItemPrompt ]]
            -- upvalues: v191 (copy), v54 (ref)
            v191(v54(v192, v193, v194, v195, v196));
        end, 
        setItemDetailsPeekViewState = function(v197) --[[ Line: 725 ]] --[[ Name: setItemDetailsPeekViewState ]]
            -- upvalues: v191 (copy), v53 (ref)
            v191(v53(v197));
        end, 
        navigateIntoQuickMenu = function(v198, v199) --[[ Line: 728 ]] --[[ Name: navigateIntoQuickMenu ]]
            -- upvalues: v191 (copy), v58 (ref)
            v191(v58(v198, v199));
        end, 
        setFullView = function(v200, v201, v202) --[[ Line: 731 ]] --[[ Name: setFullView ]]
            -- upvalues: v191 (copy), v55 (ref)
            v191(v55(v200, v201, v202));
        end, 
        resetNavigationHistory = function(v203) --[[ Line: 734 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v191 (copy), v64 (ref)
            return v191(v64(nil, v203));
        end, 
        instantResetNavigationHistory = function(v204) --[[ Line: 737 ]] --[[ Name: instantResetNavigationHistory ]]
            -- upvalues: v191 (copy), v65 (ref)
            return v191(v65(nil, v204));
        end, 
        setTryOnManagerPeekViewState = function(v205) --[[ Line: 740 ]] --[[ Name: setTryOnManagerPeekViewState ]]
            -- upvalues: v191 (copy), v56 (ref)
            v191(v56(v205));
        end, 
        resetSearchCategoryAndSubcategory = function() --[[ Line: 743 ]] --[[ Name: resetSearchCategoryAndSubcategory ]]
            -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (ref), v109 (ref), l_FFlagAXDefaultCatalogCategoryId_0 (ref), v77 (ref), l_CatalogCategories_0 (ref), v133 (ref), v191 (copy), v75 (ref)
            if l_FFlagAXCatalogCategoriesStore_0 then
                if not v109.getCatalogSearchSelectionStore().changeCategory(if l_FFlagAXDefaultCatalogCategoryId_0 then v77.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue(), nil) then
                    v133("Failed to select subcategory in ResetSearchCategoryAndSubcategory thunk");
                    return;
                end;
            else
                v191(v75("All", nil));
            end;
        end
    };
end)(v141);
v141 = l_RoactServices_0.connect({
    avatarExperienceAnalytics = v28, 
    networking = v31, 
    appAnalytics = v29, 
    avatarEditorAnalytics = v50, 
    catalogAnalytics = v51
})(v141);
v141 = v40((v35(v34((l_RoactAppPolicy_0.connect(function(v206, _) --[[ Line: 772 ]]
    return {
        show3dView = v206.getCatalogShow3dView()
    };
end)(v141))), nil)));
return function(v208) --[[ Line: 784 ]] --[[ Name: CatalogPageContainer ]]
    -- upvalues: l_FFlagDynamicHeadsMigration_0 (copy), v5 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), v60 (copy), v72 (copy), l_FFlagAXMigrateCatalogPageInputBindings_0 (copy), l_useRoactService_0 (copy), v31 (copy), l_useDispatch_0 (copy), v51 (copy), v41 (copy), v71 (copy), l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_AvatarScreenProperties_0 (copy), l_useSelector_0 (copy), v140 (copy), v70 (copy), v36 (copy), v54 (copy), v137 (copy), l_PeekViewState_0 (copy), v56 (copy), l_FocusNavigationEventNameEnum_0 (copy), v128 (copy), v69 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useCatalogPageMISIntroFtux_0 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), l_useCatalogPageTimeoutPrompt_0 (copy), l_FFlagAXMakeupReleaseFTUX_0 (copy), v109 (copy), l_CatalogCategories_0 (copy), l_useCatalogPageMakeupReleaseFtux_0 (copy), v10 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), v129 (copy), v141 (ref)
    if l_FFlagDynamicHeadsMigration_0 then
        v5.useEffect(function() --[[ Line: 786 ]]
            -- upvalues: v21 (ref)
            local v209 = v21(false);
            if v209 then
                v209.getInventory(false);
            end;
        end, {});
    end;
    local v210 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.useRef(v8.createFocusController()).current;
    local l_current_0 = v5.useRef(v60()).current;
    local v212 = v72(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v210);
    local v213 = nil;
    if l_FFlagAXMigrateCatalogPageInputBindings_0 then
        local v214 = l_useRoactService_0(v31);
        local v215 = l_useDispatch_0();
        local v216 = l_useRoactService_0(v51);
        local v217 = v41();
        local v218 = v71();
        local v219 = l_useAvatarRoute_0();
        local v220 = v219.current.name == l_AvatarScreen_0.ItemDetails;
        local v221 = true;
        if v219.current.name ~= l_AvatarScreen_0.LookDetails then
            v221 = v219.current.name == l_AvatarScreen_0.TryOnManager;
        end;
        local l_isMultiTryOn_1 = l_AvatarScreenProperties_0[v219.opaque.name].isMultiTryOn;
        local v223 = l_useSelector_0(v140);
        local v224 = false;
        if v219.current.name ~= l_AvatarScreen_0.TryOnManager then
            v224 = l_isMultiTryOn_1 and v223;
        end;
        local v225 = v70(v212);
        local v227 = v5.useCallback(function(v226) --[[ Line: 823 ]]
            -- upvalues: v36 (ref), v208 (copy)
            v226.cancelled = true;
            v36.closeFocusedScreen(v208.navigation);
        end, {
            v208.navigation
        });
        local l_v215_0 = v215 --[[ copy: 6 -> 26 ]];
        local l_v214_0 = v214 --[[ copy: 5 -> 27 ]];
        local l_v216_0 = v216 --[[ copy: 7 -> 28 ]];
        local v231 = v5.useCallback(function() --[[ Line: 829 ]]
            -- upvalues: l_v215_0 (copy), v54 (ref), l_v214_0 (copy), l_v216_0 (copy), v212 (copy), v208 (copy), v219 (copy)
            l_v215_0(v54(l_v214_0, l_v216_0, v212, v208.navigation, v219));
        end, {
            v215, 
            v214, 
            v216, 
            v212, 
            v208.navigation, 
            v219
        });
        local v232 = v5.useCallback(function() --[[ Line: 837 ]]
            -- upvalues: v208 (copy), l_AvatarScreen_0 (ref), v219 (copy), v212 (copy)
            v208.navigation.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = v219.current.params.itemId, 
                itemType = v219.current.params.itemType, 
                onOverlayClosed = v212
            });
        end, {
            v208.navigation, 
            v219, 
            v212
        });
        local v233 = l_useSelector_0(v137);
        local v235 = v5.useCallback(function() --[[ Line: 847 ]]
            -- upvalues: v233 (copy), l_PeekViewState_0 (ref), l_v215_0 (copy), v56 (ref)
            local v234 = if not (v233 ~= l_PeekViewState_0.Full) or v233 == l_PeekViewState_0.Extended then l_PeekViewState_0.Brief else l_PeekViewState_0.Full;
            l_v215_0(v56(v234));
        end, {
            v233, 
            v215
        });
        local v236 = v5.useCallback(function() --[[ Line: 855 ]]
            -- upvalues: v36 (ref), v208 (copy), l_AvatarScreen_0 (ref)
            v36.closeFiltersAndItemDetails(v208.navigation);
            v208.navigation.navigate(l_AvatarScreen_0.TryOnManager);
        end, {
            v208.navigation
        });
        local l_v217_0 = v217 --[[ copy: 8 -> 29 ]];
        local v238 = v5.useCallback(function() --[[ Line: 860 ]]
            -- upvalues: l_v217_0 (copy), l_AvatarScreen_0 (ref)
            l_v217_0:fire(l_AvatarScreen_0.Catalog);
        end, {
            v217
        });
        local v239 = v5.useMemo(function() --[[ Line: 864 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v221 (copy), v224 (copy)
            return {
                [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
                [Enum.KeyCode.ButtonStart] = l_FocusNavigationEventNameEnum_0.OpenQuickMenu, 
                [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.OpenBuyCatalogItemPrompt, 
                [Enum.KeyCode.ButtonL3] = l_FocusNavigationEventNameEnum_0.OpenCatalogContextMenu, 
                [Enum.KeyCode.ButtonY] = if not not v221 or v224 then l_FocusNavigationEventNameEnum_0.ToggleTryOnManager else l_FocusNavigationEventNameEnum_0.Search
            };
        end, {
            v221, 
            v224
        });
        v213 = v128(v239, {
            onNavigateBack = if v220 then v227 else nil, 
            onOpenQuickMenu = if v218 then v225 else nil, 
            onOpenBuyItemPrompt = if v220 then v231 else nil, 
            onOpenContextMenu = if v220 then v232 else nil, 
            onToggleSearch = v238, 
            onToggleTryOnManager = if v221 then v235 else if v224 then v236 else nil
        });
    else
        v213 = v69({
            overlayClosedCallback = v212
        });
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v240 = l_useAvatarRoute_0();
        l_useCatalogPageMISIntroFtux_0(v240, v208.navigation);
    end;
    if l_FFlagAXAvatarTimeoutFlow_0 then
        l_useCatalogPageTimeoutPrompt_0(v208.navigation);
    end;
    if l_FFlagAXMakeupReleaseFTUX_0 then
        local v241 = l_useAvatarRoute_0();
        local v242 = v5.useCallback(function() --[[ Line: 907 ]]
            -- upvalues: v109 (ref), l_CatalogCategories_0 (ref)
            v109.getCatalogSelectionStore().changeCategory(l_CatalogCategories_0.Makeup:rawValue(), nil);
        end, {});
        l_useCatalogPageMakeupReleaseFtux_0(v241, v208.navigation, v242);
    end;
    local l_join_0 = v10.Dictionary.join;
    local l_v208_0 = v208;
    local v245 = {
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v210, 
        overlayClosedCallback = v212, 
        androidBackButtonConnection = l_current_0
    };
    local v246 = false;
    if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
        v246 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    v245.is10ftUI = v246;
    l_join_0 = l_join_0(l_v208_0, v245);
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        v129();
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v213
    }, v5.createElement(v141, l_join_0));
end;