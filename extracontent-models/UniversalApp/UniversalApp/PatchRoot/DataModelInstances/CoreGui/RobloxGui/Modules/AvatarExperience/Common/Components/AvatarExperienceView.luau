local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Roact);
local l_useEffectOnMount_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount;
local v8 = require(l_CorePackages_0.Packages.RoactNavigation);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v10.Focusable;
local v12 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v12.Hooks.useTokens;
local v14 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v15 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave);
local v17 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useFocusNavigableSurfaceRegistryConnection_0 = v17.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v17.FocusNavigableSurfaceIdentifierEnum;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v23 = require(l_CorePackages_0.Packages.tutils);
local v24 = require(l_CorePackages_0.Packages.UIBlox);
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v25.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v25.Enums.AvatarScreen;
local v28 = require(l_Modules_0.LuaApp.Constants);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_SpringAnimatedItem_0 = v24.Utility.SpringAnimatedItem;
local l_withStyle_0 = v24.Style.withStyle;
local v33 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v35 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_FullView_0 = v22.Enums.FullView;
local v37 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v38 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.AvatarLoadingSpinner);
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneUIContainer);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.SceneButtons);
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.VRAvatarEditorNavBar);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarVRPanelWrapper);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.AdaptiveScrollingView);
local v50 = require(l_Modules_0.AvatarExperience.Catalog.Components.RobuxBalance);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_TimeoutBanner_0 = v22.Components.TimeoutBanner;
local l_getTimeoutStatusStore_0 = v22.Stores.getTimeoutStatusStore;
local l_CheckoutActionBarContainer_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.CheckoutActionBarContainer;
local v56 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v58 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.MultiTryOnBottomBar);
local v59 = require(l_Modules_0.AvatarExperience.Common.Components.QuickButtons);
local v60 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.SlotControlBar);
local l_useSlotCustomizeFtux_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Hooks.useSlotCustomizeFtux;
local l_UndoRedoBar_0 = v15.UndoRedoBar;
local l_SaveButton_0 = v16.Components.SaveButton;
local v64 = require(l_Modules_0.AvatarExperience.Common.Components.FullViewEntryButton);
local v65 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_GetFFlagLuaAppEnableTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner;
local v69 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixRobuxBalanceButtonPositionSecond);
local v70 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v71 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower);
local l_FFlagAXEnableManualSaving_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableManualSaving;
local v73 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableSlotsFtux);
local l_getUseSelectorDeepEquals_0 = v22.Utils.getUseSelectorDeepEquals;
local v75 = v70() and game:DefineFastFlag("FFlagAXEnableFullSceneInteractionFrame3", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixManageOutfitPageFocusLostBehind_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXFixManageOutfitPageFocusLostBehind;
local v78 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local l_FFlagAXMISEnableMultiShopping_0 = v21.FFlagAXMISEnableMultiShopping;
local v80 = game:DefineFastFlag("AXFixConsoleFullSceneViewPosition", false);
local v81 = game:DefineFastFlag("AXQuickButtonsFrameShouldAlwaysExist", false);
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local l_FFlagAXResetAvatarButton_0 = v21.FFlagAXResetAvatarButton;
local l_FFlagAXShowHeadAdjustmentInRightControlBar_0 = v21.FFlagAXShowHeadAdjustmentInRightControlBar;
local l_FFlagAXMigrateBuilderIcons_0 = v21.FFlagAXMigrateBuilderIcons;
local l_FFlagDynamicHeadsMigration_0 = v21.FFlagDynamicHeadsMigration;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v21.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagAXMoveContextualActionButtons_0 = v21.FFlagAXMoveContextualActionButtons;
local l_FFlagAXFixControlBarSubMenuOverlap_0 = v21.FFlagAXFixControlBarSubMenuOverlap;
local l_FFlagAXResetAvatarButtonExposureLogging_0 = v21.FFlagAXResetAvatarButtonExposureLogging;
local v92 = game:DefineFastFlag("AXFixLightThemeBorder", false);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v95 = require(l_Modules_0.AvatarExperience.Common.Thunks.RemoveUnavailableEquippedAssets);
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v97 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXHideMenuOnScroll_0 = v21.FFlagAXHideMenuOnScroll;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v21.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXAvatarTimeoutFlow_0 = v21.FFlagAXAvatarTimeoutFlow;
local l_FFlagAXFixContextualActionVisibility_0 = v21.FFlagAXFixContextualActionVisibility;
local l_FFlagAXFixRobuxButtonShowingInFullView_0 = v21.FFlagAXFixRobuxButtonShowingInFullView;
local v104 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local v106 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local l_IconOnlyMenu_0 = v106.IconOnlyMenu;
local l_MenuItemEnum_0 = v106.Enums.MenuItemEnum;
local v109 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.ContextualActions.ContextualActions);
local l_IconName_0 = v12.Enums.IconName;
local v111 = if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then {
    [l_AvatarScreen_0.UpdateOutfitPage] = true, 
    [l_AvatarScreen_0.ManageOutfitPage] = true, 
    [l_AvatarScreen_0.OutfitDetails] = true
} else {
    [l_AvatarScreen_0.UpdateOutfitPage] = true, 
    [l_AvatarScreen_0.ManageOutfitPage] = true
};
local v112 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v113 = v35.PeekHeaderHeight + (v70() and 0 or v35.MainNavHeight) + v35.SubNavHeight;
local v114 = if not not v78() or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v35.PeekHeaderHeight + v35.CatalogMainNavHeight else nil;
local v115 = l_GuiService_0:IsTenFootInterface();
local function v120(v116) --[[ Line: 191 ]] --[[ Name: selectQuickItemsVisible ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local l_ItemDetailsPeekView_0 = v116.AvatarExperience.Common.ItemDetailsPeekView;
    local v118 = l_ItemDetailsPeekView_0.viewState == l_PeekViewState_0.Full;
    local v119 = l_ItemDetailsPeekView_0.tryOnViewState == l_PeekViewState_0.Full;
    return not (l_ItemDetailsPeekView_0.tryOnManagerViewState == l_PeekViewState_0.Full) and not v118 and not v119;
end;
local v121 = v6.PureComponent:extend("AvatarExperienceView");
v121.defaultProps = {
    bottomBarEnabled = false, 
    isDisabled = false, 
    showRobuxBalance = true, 
    showMultiTryOnBottomBar = true, 
    showControlBar = true, 
    itemDetailsPeekViewRefs = {}
};
local function v127(v122, v123) --[[ Line: 257 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v69 (copy)
    local v124 = v122.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v125 = v123.topBar and v122.TopBar.topBarHeight or 0;
    local v126 = if v69() then v123.topBar and v122.TopBar.statusBarHeight or 0 else nil;
    return {
        globalGuiInset = v122.GlobalGuiInset, 
        isPortrait = v124, 
        screenSize = v122.ScreenSize, 
        topBarHeight = v125, 
        tryOnItems = v122.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v122.AvatarExperience.AvatarScene.OutfitTryOn.LookId, 
        statusBarHeight = if v69() then v126 else nil
    };
end;
local function v129(v128) --[[ Line: 313 ]] --[[ Name: mapValuesToProps ]]
    return {
        Size = UDim2.new(0, v128.width, 0, v128.height)
    };
end;
v121.init = function(v130) --[[ Line: 319 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v6 (copy), v71 (copy), v70 (copy), v5 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v28 (copy), v35 (copy), v80 (copy)
    local v131, v132 = v130:calculateSceneSize();
    v130.state = {
        sceneShowing = true, 
        isVerticallyOffscreen = false, 
        animatedValues = {
            height = v131, 
            width = v132
        }, 
        bottomBarHeight = l_FFlagAXMISEnableMultiShopping_0 and 0 or nil
    };
    v130.navItemsFrameRef = v6.createRef();
    v130.sceneFrameRef = v6.createRef();
    v130.robuxBalanceRef = if v71 then v6.createRef() else nil;
    if v70() then
        local v133, v134 = v5.createBinding(nil);
        v130.quickButtonsZIndexBinding = v133;
        v130.setQuickButtonsZIndexBinding = v134;
        v130.onActiveControlBarMenuItemChanged = function(_, v136) --[[ Line: 339 ]]
            -- upvalues: v130 (copy)
            if v136 then
                v130.setQuickButtonsZIndexBinding(3);
                return;
            else
                v130.setQuickButtonsZIndexBinding(nil);
                return;
            end;
        end;
    end;
    v130.onTransitionComplete = function(v137) --[[ Line: 348 ]]
        -- upvalues: v130 (copy), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v28 (ref)
        local l_props_0 = v130.props;
        local l_name_0 = l_props_0.avatarRoute.current.name;
        local l_isPortrait_0 = l_props_0.isPortrait;
        local l_isSceneFullView_0 = l_props_0.isSceneFullView;
        local l_isUIFullView_0 = l_props_0.isUIFullView;
        local l_sceneShowing_0 = v130.state.sceneShowing;
        if l_isUIFullView_0 and l_isPortrait_0 and l_sceneShowing_0 then
            v130:setState({
                sceneShowing = false
            });
        end;
        if not l_isPortrait_0 and l_isSceneFullView_0 and l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage then
            if not v130.state.isVerticallyOffscreen then
                v130:setState({
                    isVerticallyOffscreen = true
                });
            end;
        elseif v130.state.isVerticallyOffscreen then
            v130:setState({
                isVerticallyOffscreen = false
            });
        end;
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            local l_routeName_0 = l_props_0.navigation.state.routeName;
            local v145 = false;
            if l_routeName_0 == l_name_0 then
                v145 = not l_props_0.avatarRoute.isOverlayVisible;
            end;
            if v137 and v145 and l_props_0.lastInputGroup == v28.InputType.Gamepad and not l_isSceneFullView_0 then
                v137.captureFocus();
            end;
        end;
    end;
    v130.onNavItemsFrameResized = function(_) --[[ Line: 388 ]]
        -- upvalues: v130 (copy)
        if v130.sceneFrameRef.current then
            v130.onSceneResized(v130.sceneFrameRef.current);
        end;
    end;
    v130.onSceneResized = function(v147) --[[ Line: 396 ]]
        -- upvalues: v130 (copy), l_AvatarScreen_0 (ref), v35 (ref), v80 (ref)
        local l_current_0 = v130.navItemsFrameRef.current;
        if not l_current_0 then
            return;
        else
            local l_props_1 = v130.props;
            local l_name_1 = l_props_1.avatarRoute.current.name;
            local l_isDisabled_0 = l_props_1.isDisabled;
            local l_isPortrait_1 = l_props_1.isPortrait;
            local l_screenSize_0 = l_props_1.screenSize;
            local l_allowAdaptiveScrolling_0 = l_props_1.allowAdaptiveScrolling;
            local v155 = v130:getTopBarHeight();
            local v156 = v130.state.isVerticallyOffscreen or l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage;
            if l_isPortrait_1 then
                if l_allowAdaptiveScrolling_0 then
                    l_current_0.Position = UDim2.new(0, 0, 0, v155);
                    l_current_0.Size = UDim2.new(1, 0, 1, -v155);
                    return;
                else
                    l_current_0.Position = UDim2.new(0, 0, 0, v147.AbsoluteSize.Y + v155);
                    l_current_0.Size = UDim2.new(1, 0, 1, -v147.AbsoluteSize.Y - v155);
                    return;
                end;
            else
                local v157 = l_isDisabled_0 and 1 or v35.LandscapeNavWidth;
                l_current_0.Size = UDim2.fromScale(v157, 1);
                local l_X_0 = l_current_0.AbsoluteSize.X;
                local v159 = l_screenSize_0.X - v147.AbsoluteSize.X;
                local v160 = 0;
                if v159 < l_X_0 then
                    v160 = if v80 then v159 - l_X_0 - v155 else v159 - l_X_0;
                end;
                if v156 then
                    l_current_0.Position = UDim2.fromOffset(0, l_screenSize_0.Y * (-v160 / l_X_0));
                    return;
                else
                    l_current_0.Position = UDim2.fromOffset(v160, 0);
                    return;
                end;
            end;
        end;
    end;
    v130.onBottomBarAbsoluteSizeChanged = l_FFlagAXMISEnableMultiShopping_0 and function(v161) --[[ Line: 443 ]]
        -- upvalues: v130 (copy)
        v130:setState({
            bottomBarHeight = v161.AbsoluteSize.Y
        });
    end or nil;
end;
v121.getTopBarHeight = function(v162) --[[ Line: 451 ]] --[[ Name: getTopBarHeight ]]
    return v162.props.topBarHeight;
end;
v121.instantResize = function(v163) --[[ Line: 456 ]] --[[ Name: instantResize ]]
    local l_current_1 = v163.sceneFrameRef.current;
    if not l_current_1 then
        return;
    else
        local v165, v166 = v163:calculateSceneSize();
        l_current_1.Size = UDim2.new(0, v166, 0, v165);
        v163.onSceneResized(l_current_1);
        return;
    end;
end;
v121.calculatePortraitSceneHeight = function(v167) --[[ Line: 468 ]] --[[ Name: calculatePortraitSceneHeight ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v35 (copy)
    local l_props_2 = v167.props;
    local l_globalGuiInset_0 = l_props_2.globalGuiInset;
    local l_screenSize_1 = l_props_2.screenSize;
    local l_isLandingPage_0 = l_props_2.isLandingPage;
    local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_1, l_globalGuiInset_0).Y.Offset;
    local v173 = l_Offset_0 * v35.PortraitSceneHeight;
    if l_isLandingPage_0 then
        v173 = l_Offset_0 * v35.LandingPagePortraitSceneHeight;
        if l_Offset_0 - v173 < v35.LandingPagePortraitMinItemsHeightPix then
            v173 = l_Offset_0 - v35.LandingPagePortraitMinItemsHeightPix;
        end;
    end;
    return v173;
end;
v121.calculateFullHeight = function(v174) --[[ Line: 491 ]] --[[ Name: calculateFullHeight ]]
    local l_props_3 = v174.props;
    local l_globalGuiInset_1 = l_props_3.globalGuiInset;
    local l_isPortrait_2 = l_props_3.isPortrait;
    local l_screenSize_2 = l_props_3.screenSize;
    local l_bottom_0 = l_globalGuiInset_1.bottom;
    local v180 = v174:getTopBarHeight();
    local v181 = l_isPortrait_2 and v180 or 0;
    return l_screenSize_2.Y - l_bottom_0 - v181;
end;
v121.calculateSceneSize = function(v182) --[[ Line: 502 ]] --[[ Name: calculateSceneSize ]]
    -- upvalues: v35 (copy)
    local l_props_4 = v182.props;
    local l_globalGuiInset_2 = l_props_4.globalGuiInset;
    local l_isDisabled_1 = l_props_4.isDisabled;
    local l_isSceneFullView_1 = l_props_4.isSceneFullView;
    local l_isPortrait_3 = l_props_4.isPortrait;
    local l_isUIFullView_1 = l_props_4.isUIFullView;
    local l_screenSize_3 = l_props_4.screenSize;
    local v190 = v182:getTopBarHeight();
    local l_bottom_1 = l_globalGuiInset_2.bottom;
    local l_left_0 = l_globalGuiInset_2.left;
    local v193 = l_isPortrait_3 and v190 or 0;
    local v194 = l_screenSize_3.Y - l_bottom_1;
    local v195 = (l_screenSize_3.X - l_left_0) * v35.LandscapeSceneWidth;
    local v196 = l_screenSize_3.X - l_left_0;
    local v197 = v182:calculatePortraitSceneHeight();
    local v198 = l_isPortrait_3 and v197 or v194;
    local v199 = l_isPortrait_3 and v196 or v195;
    if l_isUIFullView_1 and l_isPortrait_3 then
        v198 = 0;
    elseif l_isSceneFullView_1 then
        v199 = l_screenSize_3.X;
        v198 = l_screenSize_3.Y - l_bottom_1 - v193;
    end;
    if l_isDisabled_1 then
        v198 = 0;
        v199 = 0;
    end;
    return v198, v199;
end;
v121.isConsoleWithGamepad = function(v200) --[[ Line: 540 ]] --[[ Name: isConsoleWithGamepad ]]
    -- upvalues: v115 (copy), v28 (copy)
    local l_props_5 = v200.props;
    return v115 and l_props_5.lastInputGroup == v28.InputType.Gamepad;
end;
v121.renderSceneFrame = function(v202) --[[ Line: 545 ]] --[[ Name: renderSceneFrame ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_IsVRAppBuild_0 (copy), l_AvatarScreen_0 (copy), v6 (copy), l_SpringAnimatedItem_0 (copy), v129 (copy), v112 (copy), v42 (copy), v69 (copy), v75 (copy), v40 (copy), v41 (copy), v46 (copy), v10 (copy), l_Focusable_0 (copy)
    local l_props_6 = v202.props;
    local l_isDisabled_2 = l_props_6.isDisabled;
    local l_isSceneFullView_2 = l_props_6.isSceneFullView;
    local l_isUIFullView_2 = l_props_6.isUIFullView;
    local l_isPortrait_4 = l_props_6.isPortrait;
    local v208 = v202:getTopBarHeight();
    local l_name_2 = l_props_6.avatarRoute.opaque.name;
    local v210 = v202.state.sceneShowing or not l_isPortrait_4;
    if l_isDisabled_2 then
        v210 = false;
    end;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local l_forwardRef_0 = l_props_6.forwardRef;
        local v212 = not l_isSceneFullView_2 and not l_isUIFullView_2;
        if l_IsVRAppBuild_0() then
            v212 = v212 and l_name_2 ~= l_AvatarScreen_0.LayeredClothingSort;
        end;
        return v6.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, l_isPortrait_4 and v208 or 0), 
                ZIndex = -1, 
                [v6.Change.AbsoluteSize] = v202.onSceneResized, 
                [v6.Event.AncestryChanged] = v202.onSceneResized, 
                [v6.Ref] = v202.sceneFrameRef
            }, 
            animatedValues = v202.state.animatedValues, 
            mapValuesToProps = v129, 
            springOptions = v112, 
            onComplete = function() --[[ Line: 587 ]] --[[ Name: onComplete ]]
                -- upvalues: v202 (copy)
                v202.onTransitionComplete();
            end
        }, {
            SceneUIContainer = v6.createElement(v42, {
                globalGuiInset = v202.props.globalGuiInset, 
                statusBarHeight = if v69() then v202.props.statusBarHeight else nil, 
                changeViewFunction = l_props_6.changeViewFunction, 
                isVisible = v210, 
                row1ChildrenVisible = v212, 
                showRobuxBalance = l_props_6.showRobuxBalance, 
                [v6.Ref] = l_forwardRef_0
            }), 
            SceneInteractionFrame = if v75 then nil else if l_IsVRAppBuild_0() then nil else v6.createElement(v40), 
            AvatarLoadingSpinner = if l_IsVRAppBuild_0() then nil else v6.createElement(v41), 
            VRAvatarEditorNavBar = if l_IsVRAppBuild_0() then v6.createElement(v46, {
                currentPage = l_name_2, 
                navigation = l_props_6.navigation
            }) else nil, 
            SceneUi = l_props_6.sceneUi
        });
    else
        return v10.withFocusController(function(v213) --[[ Line: 617 ]]
            -- upvalues: l_props_6 (copy), l_isSceneFullView_2 (copy), l_isUIFullView_2 (copy), l_IsVRAppBuild_0 (ref), l_name_2 (copy), l_AvatarScreen_0 (ref), v6 (ref), l_SpringAnimatedItem_0 (ref), l_isPortrait_4 (copy), v208 (copy), v202 (copy), v129 (ref), v112 (ref), l_Focusable_0 (ref), v42 (ref), v69 (ref), v210 (ref), v75 (ref), v40 (ref), v41 (ref), v46 (ref)
            local l_forwardRef_1 = l_props_6.forwardRef;
            local v215 = not l_isSceneFullView_2 and not l_isUIFullView_2;
            if l_IsVRAppBuild_0() then
                v215 = v215 and l_name_2 ~= l_AvatarScreen_0.LayeredClothingSort;
            end;
            return v6.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                regularProps = {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 0, l_isPortrait_4 and v208 or 0), 
                    ZIndex = -1, 
                    [v6.Change.AbsoluteSize] = v202.onSceneResized, 
                    [v6.Event.AncestryChanged] = v202.onSceneResized, 
                    [v6.Ref] = v202.sceneFrameRef
                }, 
                animatedValues = v202.state.animatedValues, 
                mapValuesToProps = v129, 
                springOptions = v112, 
                onComplete = function() --[[ Line: 645 ]] --[[ Name: onComplete ]]
                    -- upvalues: v202 (ref), v213 (copy)
                    v202.onTransitionComplete(v213);
                end
            }, {
                SceneUIContainer = v6.createElement(l_Focusable_0[v42], {
                    globalGuiInset = v202.props.globalGuiInset, 
                    statusBarHeight = if v69() then v202.props.statusBarHeight else nil, 
                    changeViewFunction = l_props_6.changeViewFunction, 
                    isVisible = v210, 
                    row1ChildrenVisible = v215, 
                    showRobuxBalance = l_props_6.showRobuxBalance, 
                    [v6.Ref] = l_forwardRef_1, 
                    NextSelectionDown = l_props_6.NextSelectionDown, 
                    NextSelectionLeft = l_props_6.NextSelectionLeft, 
                    NextSelectionUp = l_props_6.NextSelectionUp
                }), 
                SceneInteractionFrame = if v75 then nil else if l_IsVRAppBuild_0() then nil else v6.createElement(v40), 
                AvatarLoadingSpinner = if l_IsVRAppBuild_0() then nil else v6.createElement(v41), 
                VRAvatarEditorNavBar = if l_IsVRAppBuild_0() then v6.createElement(v46, {
                    currentPage = l_name_2, 
                    navigation = l_props_6.navigation
                }) else nil, 
                SceneUi = l_props_6.sceneUi
            });
        end);
    end;
end;
v121.renderWithStyle = function(v216, _) --[[ Line: 679 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v70 (copy), l_FFlagAXEnableManualSaving_0 (copy), v78 (copy), l_AvatarScreen_0 (copy), v114 (copy), v113 (copy), v4 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v6 (copy), v49 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), v5 (copy), l_TimeoutBanner_0 (copy), v92 (copy), v12 (copy), l_SaveButton_0 (copy), v64 (copy), v44 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v35 (copy), v60 (copy), l_FFlagAXResetAvatarButton_0 (copy), v73 (copy), v59 (copy), v71 (copy), v14 (copy), l_FFlagAXShowHeadAdjustmentInRightControlBar_0 (copy), l_FFlagAXFixRobuxButtonShowingInFullView_0 (copy), v50 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), l_IconOnlyMenu_0 (copy), l_MenuItemEnum_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy), l_FFlagAXFixContextualActionVisibility_0 (copy), v109 (copy), l_FFlagAXFixControlBarSubMenuOverlap_0 (copy), l_UndoRedoBar_0 (copy), l_IsVRAppBuild_0 (copy), v48 (copy), v39 (copy), v23 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), v81 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), v45 (copy), v58 (copy), v37 (copy), l_CheckoutActionBarContainer_0 (copy), v75 (copy), v40 (copy), l_FFlagAXResetAvatarButtonExposureLogging_0 (copy), v56 (copy), l_AppUserLayers_0 (copy)
    local l_props_7 = v216.props;
    local l_allowAdaptiveScrolling_1 = l_props_7.allowAdaptiveScrolling;
    local l_bottomBarEnabled_0 = l_props_7.bottomBarEnabled;
    local l_globalGuiInset_3 = l_props_7.globalGuiInset;
    local l_isPortrait_5 = l_props_7.isPortrait;
    local v223 = v216:getTopBarHeight();
    local l_tokens_0 = l_props_7.tokens;
    local l_isTimedOut_0 = l_props_7.isTimedOut;
    local v226 = if v70() then l_props_7.showUndoRedo else nil;
    local v227 = if v70() and l_FFlagAXEnableManualSaving_0 then l_props_7.showSaveButton else nil;
    local v228 = not l_bottomBarEnabled_0 and l_globalGuiInset_3.bottom > 0;
    local v229 = v216:calculateSceneSize();
    local l_avatarRoute_0 = l_props_7.avatarRoute;
    local v231 = nil;
    if v78() then
        v231 = if l_props_7.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then v114 else v113;
    end;
    local v232 = not v4.isEmpty(l_props_7.tryOnItems) and (not l_props_7.isSceneFullView or false);
    if l_props_7.lookId ~= nil then
        if l_FFlagAXMISEnableMultiShopping_0 then
            local v233 = false;
            if l_avatarRoute_0.opaque.name ~= l_AvatarScreen_0.MySharedAvatars then
                v233 = v232;
            end;
            v232 = v233;
        else
            v232 = false;
        end;
    end;
    v232 = not not l_props_7.showMultiTryOnBottomBar and v232;
    local v234 = nil;
    local v235 = nil;
    if l_allowAdaptiveScrolling_1 then
        v234 = v216:calculateFullHeight();
        v235 = v234 - v216:calculatePortraitSceneHeight();
    end;
    local v236 = {
        TopBar = not l_isPortrait_5 and l_props_7.topBar, 
        Items = v6.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, l_isPortrait_5 and 0 or -v223), 
            ZIndex = 2
        }, if l_allowAdaptiveScrolling_1 and l_isPortrait_5 then {
            AdaptiveScrollingView = v6.createElement(v49, {
                fullHeight = v234, 
                midHeight = v235, 
                alwaysShowingHeight = if v78() then v231 else v113, 
                topBarHeight = l_props_7.topBarHeight, 
                fullHeightOptions = if l_props_7.adaptiveScrollingProps then l_props_7.adaptiveScrollingProps.fullHeightOptions else nil, 
                enableExpandPeekViewOnUpwardScroll = if l_FFlagAXExpandPeekViewOnFirstScroll_0 and l_props_7.adaptiveScrollingProps then l_props_7.adaptiveScrollingProps.enableExpandPeekViewOnUpwardScroll else nil, 
                disableViewChangeByScroll = if l_FFlagAXSlotsPeekViewScrollFix_0 then l_props_7.disableScrollViewBindings else nil, 
                enableAnimatedVisibility = if l_FFlagAXHideMenuOnScroll_0 and l_props_7.adaptiveScrollingProps then l_props_7.adaptiveScrollingProps.enableAnimatedVisibility else nil, 
                banner = if l_FFlagAXAvatarTimeoutFlow_0 and l_isTimedOut_0 then v5.createElement(l_TimeoutBanner_0) else nil
            }, l_props_7.children)
        } else if l_FFlagAXAvatarTimeoutFlow_0 and l_props_7.tokens then {
            ScrollingView = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = v92 and 0 or nil, 
                BackgroundColor3 = l_props_7.tokens.Semantic.Color.Background.Contrast.Color3, 
                BackgroundTransparency = l_props_7.tokens.Semantic.Color.Background.Contrast.Transparency
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Banner = if l_FFlagAXAvatarTimeoutFlow_0 and l_isTimedOut_0 then v5.createElement(l_TimeoutBanner_0) else nil, 
                Content = v6.createElement(v12.View, {
                    tag = "size-full-full", 
                    LayoutOrder = 1
                }, l_props_7.children)
            })
        } else l_props_7.children)
    };
    local v237 = v216:renderSceneFrame();
    local v238 = nil;
    if v70() and l_tokens_0 then
        local v239 = v216:calculatePortraitSceneHeight();
        local v240 = UDim2.new(1, -l_tokens_0.Size.Size_500, 0, v239 + v223 - l_tokens_0.Size.Size_400);
        if not l_isPortrait_5 then
            local l_Size_500_0 = l_tokens_0.Size.Size_500;
            if l_FFlagAXMISEnableMultiShopping_0 then
                local l_bottomBarHeight_0 = v216.state.bottomBarHeight;
                if l_props_7.isTryingOnItems and l_bottomBarHeight_0 then
                    l_Size_500_0 = l_Size_500_0 + l_bottomBarHeight_0;
                end;
            elseif l_props_7.isTryingOnItems and l_props_7.multiTryOnBottomBarRef and l_props_7.multiTryOnBottomBarRef.current then
                l_Size_500_0 = l_Size_500_0 + l_props_7.multiTryOnBottomBarRef.current.AbsoluteSize.Y;
            end;
            v240 = UDim2.new(1, -l_tokens_0.Size.Size_500, 1, -l_Size_500_0);
        end;
        v238 = v6.createElement(v12.View, {
            tag = "auto-xy anchor-bottom-right row", 
            Position = v240
        }, {
            SaveButton = if not v227 or l_props_7.isSceneFullView then nil else v6.createElement(l_SaveButton_0, {}), 
            FullViewEntryButton = if not l_props_7.isSceneFullView or l_isPortrait_5 then nil else v5.createElement(v64, {
                isUIFullView = l_props_7.isUIFullView, 
                isSceneFullView = l_props_7.isSceneFullView, 
                changeViewFunction = l_props_7.changeViewFunction
            })
        });
    else
        v238 = if l_allowAdaptiveScrolling_1 and l_isPortrait_5 then nil else v6.createElement(v44, {
            sceneHeight = v229, 
            isUIFullView = l_props_7.isUIFullView, 
            isSceneFullView = l_props_7.isSceneFullView, 
            changeViewFunction = l_props_7.changeViewFunction, 
            ZIndex = 3
        });
    end;
    local v243 = nil;
    v243 = if v70() and l_tokens_0 then v5.createElement(v12.View, {
        tag = "auto-xy col gap-small", 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef, 
        SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        Position = if l_isPortrait_5 then UDim2.fromOffset(l_tokens_0.Size.Size_500, v223) else UDim2.new(v35.LandscapeNavWidth, l_tokens_0.Size.Size_700, 0, v223), 
        Visible = not l_props_7.isSceneFullView, 
        ZIndex = v216.quickButtonsZIndexBinding
    }, {
        ControlBar = v5.createElement(v60, {
            isUIFullView = l_props_7.isUIFullView, 
            isSceneFullView = l_props_7.isSceneFullView, 
            showControlBar = l_props_7.showControlBar, 
            showUndoRedo = v226 and (l_FFlagAXResetAvatarButton_0 and true or not l_isPortrait_5), 
            onActiveMenuItemChanged = v216.onActiveControlBarMenuItemChanged, 
            NextSelectionLeft = l_props_7.defaultChildRef, 
            focusAnimation = if v73 and l_props_7.controlBarFocusAnimation then l_props_7.controlBarFocusAnimation else nil, 
            LayoutOrder = 1
        })
    }) else v6.createElement(v59, {
        isUIFullView = l_props_7.isUIFullView, 
        isSceneFullView = l_props_7.isSceneFullView, 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.defaultChildRef
    });
    local v244 = nil;
    if v71 and v216.props.showRobuxBalance and v216.props.tokens then
        local l_Size_700_0 = v216.props.tokens.Size.Size_700;
        if l_isPortrait_5 then
            l_Size_700_0 = v216.props.tokens.Size.Size_500;
        elseif v216.props.preferredInput == v14.Input.Directional then
            l_Size_700_0 = v216.props.tokens.Size.Size_200;
        end;
        local v246 = "auto-xy anchor-top-right";
        if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v246 = v246 .. " col gap-small align-x-right";
        end;
        v244 = v5.createElement(v12.View, {
            tag = v246, 
            Position = UDim2.new(1, -l_Size_700_0, 0, v216.props.isSpatial and 0 or v216.props.topBarHeight)
        }, {
            RobuxBalance = if if l_FFlagAXFixRobuxButtonShowingInFullView_0 then not (l_props_7.isSceneFullView or l_props_7.isUIFullView) else not l_props_7.isSceneFullView then v5.createElement(v50, {
                ref = v216.robuxBalanceRef, 
                NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef
            }) else nil, 
            WhiteSpace = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v5.createElement(v12.View, {
                Size = UDim2.new(1, 0, 0, v216.props.tokens.Size.Size_1300), 
                LayoutOrder = 2
            }) else nil, 
            HeadAdjustmentButton = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 and v216.props.supportsHeadShapes then v5.createElement(l_IconOnlyMenu_0, {
                LayoutOrder = 3, 
                items = {
                    {
                        type = "icon", 
                        id = l_MenuItemEnum_0.AvatarRefinement.CustomizeHead, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                        iconSize = v216.props.tokens.Size.Size_600, 
                        onActivated = v216.props.onCustomizeHeadActivated
                    }
                }
            }) else nil
        });
    end;
    local v247 = nil;
    if l_FFlagAXMoveContextualActionButtons_0 and l_tokens_0 then
        local v248 = v216:calculatePortraitSceneHeight() / 2 + v223;
        v247 = v5.createElement(v12.View, {
            tag = "auto-xy anchor-center-right", 
            Position = UDim2.new(1, -l_tokens_0.Size.Size_500, 0, v248), 
            Visible = not l_FFlagAXFixContextualActionVisibility_0 or not (l_props_7.isSceneFullView or l_props_7.isUIFullView)
        }, {
            ContextualActions = if v216.props.isPortrait then v5.createElement(v109, {
                LayoutOrder = 1
            }) else nil
        });
    end;
    local v249 = nil;
    if v70() and l_tokens_0 then
        local v250 = v226 and not l_props_7.isSceneFullView and l_isPortrait_5 and not l_FFlagAXResetAvatarButton_0 and not (l_FFlagAXFixControlBarSubMenuOverlap_0 and l_props_7.isUIFullView);
        local v251 = v216:calculatePortraitSceneHeight();
        local v252 = UDim2.fromOffset(l_tokens_0.Size.Size_500, v251 + v223 - l_tokens_0.Size.Size_400);
        if not l_isPortrait_5 then
            local l_Size_500_1 = l_tokens_0.Size.Size_500;
            if l_FFlagAXMISEnableMultiShopping_0 then
                local l_bottomBarHeight_1 = v216.state.bottomBarHeight;
                if l_props_7.isTryingOnItems and l_bottomBarHeight_1 then
                    l_Size_500_1 = l_Size_500_1 + l_bottomBarHeight_1;
                end;
            elseif l_props_7.isTryingOnItems and l_props_7.multiTryOnBottomBarRef and l_props_7.multiTryOnBottomBarRef.current then
                l_Size_500_1 = l_Size_500_1 + l_props_7.multiTryOnBottomBarRef.current.AbsoluteSize.Y;
            end;
            v252 = UDim2.new(v35.LandscapeNavWidth, l_tokens_0.Size.Size_500, 1, -l_Size_500_1);
        end;
        v249 = v5.createElement(v12.View, {
            tag = "auto-xy anchor-bottom-left", 
            Position = v252
        }, {
            UndoRedoBarPortrait = if v250 then v5.createElement(l_UndoRedoBar_0) else nil
        });
    end;
    local v255 = nil;
    v255 = if l_IsVRAppBuild_0() then v6.createElement(v48, {
        roundedCornersFrame = false, 
        panelPlacement = "Center"
    }, {
        SceneFrame = v237, 
        QuickButtons = v243, 
        BottomRightButtons = v238, 
        GamepadHandler = if l_avatarRoute_0.current.name ~= l_AvatarScreen_0.LayeredClothingSort then v6.createElement(v39) else nil, 
        TopRightButtons = if v71 then v244 else nil, 
        MiddleRightButtons = if l_FFlagAXMoveContextualActionButtons_0 then v247 else nil, 
        BottomLeftButtons = if v70() then v249 else nil
    }) else v6.createFragment({
        SceneFrame = v237, 
        QuickButtons = v243, 
        BottomRightButtons = v238, 
        TopRightButtons = if v71 then v244 else nil, 
        MiddleRightButtons = if l_FFlagAXMoveContextualActionButtons_0 then v247 else nil, 
        BottomLeftButtons = if v70() then v249 else nil
    });
    local v256 = v23.fieldCount(l_props_7.tryOnItems) > 1;
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, if l_GetFFlagLuaAppEnableTopBanner_0() then -l_props_7.globalGuiInset.top else 0), 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = l_props_7.ZIndex, 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_props_7.itemFrameRef else nil
    }, {
        TopBar = l_isPortrait_5 and l_props_7.topBar, 
        ItemsFrame = if l_IsVRAppBuild_0() then v6.createElement(v48, {
            visible = l_avatarRoute_0.current.name ~= l_AvatarScreen_0.LayeredClothingSort, 
            roundedCornersFrame = true, 
            panelPlacement = "Left"
        }, v236) else v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            ZIndex = (not l_isPortrait_5 or l_allowAdaptiveScrolling_1) and 2 or nil, 
            [v6.Change.AbsoluteSize] = v216.onNavItemsFrameResized, 
            [v6.Ref] = v216.navItemsFrameRef, 
            Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v216.props.isItemFrameVisible else nil
        }, v236), 
        OverlayedUI = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then if v81 then v5.createElement("Frame", {
            ref = l_props_7.quickButtonsRef, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_7.isQuickButtonsVisible, 
            SelectionGroup = l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and true or nil, 
            ZIndex = l_FFlagAXFixControlBarSubMenuOverlap_0 and 3 or nil
        }, v255) else if l_props_7.isQuickButtonsVisible then v5.createElement("Frame", {
            ref = l_props_7.quickButtonsRef, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = l_FFlagAXFixControlBarSubMenuOverlap_0 and 3 or nil
        }, v255) else nil else v255, 
        BottomInsetBackground = if v228 then v6.createElement(v45, {
            globalGuiInset = l_globalGuiInset_3
        }) else nil, 
        MultiTryOnBottomBar = if l_FFlagAXMISEnableMultiShopping_0 and v256 then nil else v6.createElement(v58, {
            bottomBarRef = l_props_7.multiTryOnBottomBarRef, 
            NextSelectionLeft = l_props_7.namedRefs[l_props_7.avatarRoute.opaque.name .. v37.ItemsList], 
            Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_props_7.isOpaqueRouteMatchingCurrentRoute and v232 else v232, 
            isConsoleWithGamepad = v216:isConsoleWithGamepad(), 
            itemDetailsPeekViewRefs = l_props_7.itemDetailsPeekViewRefs, 
            onAbsoluteSizeChanged = if l_FFlagAXMISEnableMultiShopping_0 then v216.onBottomBarAbsoluteSizeChanged else nil
        }), 
        CheckoutActionBar = if l_FFlagAXMISEnableMultiShopping_0 and l_props_7.isOpaqueRouteMatchingCurrentRoute and v256 then v5.createElement(l_CheckoutActionBarContainer_0, {
            ref = l_props_7.multiTryOnBottomBarRef, 
            onAbsoluteSizeChanged = v216.onBottomBarAbsoluteSizeChanged, 
            Visible = v232
        }) else nil, 
        FullSceneInteractionFrame = if v75 then if v216.props.isSpatial then nil else v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = -2
        }, {
            SceneInteractionFrame = v6.createElement(v40)
        }) else nil, 
        OnFocusExperimentExposureLogger = if l_FFlagAXResetAvatarButtonExposureLogging_0 then v6.createElement(v56, {
            ixpTests = {}, 
            flagIXPTestLayers = {
                if l_FFlagAXResetAvatarButtonExposureLogging_0 then l_AppUserLayers_0.AvatarExperienceUAAllViews else nil
            }
        }) else nil
    });
end;
v121.render = function(v257) --[[ Line: 1122 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v38 (copy)
    return l_withStyle_0(function(v258) --[[ Line: 1123 ]]
        -- upvalues: v6 (ref), v38 (ref), v257 (copy)
        return v6.createElement(v38, nil, {
            AvatarExperienceView = v257:renderWithStyle(v258)
        });
    end);
end;
v121.didUpdate = function(v259, v260) --[[ Line: 1130 ]] --[[ Name: didUpdate ]]
    local l_props_8 = v259.props;
    local l_isUIFullView_3 = l_props_8.isUIFullView;
    local l_sceneShowing_1 = v259.state.sceneShowing;
    if not l_isUIFullView_3 and not l_sceneShowing_1 then
        v259:setState({
            sceneShowing = true
        });
    end;
    local l_isPortrait_6 = v260.isPortrait;
    local l_isPortrait_7 = l_props_8.isPortrait;
    if l_isPortrait_7 ~= l_isPortrait_6 then
        if l_isPortrait_7 and l_isUIFullView_3 then
            v259:setState({
                sceneShowing = false
            });
        elseif not l_isPortrait_6 and l_isUIFullView_3 then
            v259:setState({
                sceneShowing = true
            });
        end;
        v259:instantResize();
    end;
    if l_props_8.isDisabled then
        v259:instantResize();
    end;
    if l_props_8.screenSize ~= v260.screenSize then
        v259:instantResize();
    end;
    if l_props_8.topBarHeight ~= v260.topBarHeight then
        v259:instantResize();
    end;
    local v266, v267 = v259:calculateSceneSize();
    if v266 ~= v259.state.animatedValues.height or v267 ~= v259.state.animatedValues.width then
        v259:setState({
            animatedValues = {
                height = v266, 
                width = v267
            }
        });
    end;
end;
v121.didMount = function(v268) --[[ Line: 1183 ]] --[[ Name: didMount ]]
    v268:instantResize();
    local v269, v270 = v268:calculateSceneSize();
    v268:setState({
        animatedValues = {
            height = v269, 
            width = v270
        }
    });
end;
v121 = v47((v9.connect(v127, nil)(v121)));
v121 = v33((v43((v8.withNavigation(v121)))));
v121 = v65.connectTestVariables({
    universalAppCameraEnabled = v97.EnabledForUser
})(v121);
local function v272(v271) --[[ Line: 1210 ]] --[[ Name: selectTryingOnItems ]]
    -- upvalues: v4 (copy)
    return not v4.isEmpty(v271.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
local function v294(v273) --[[ Line: 1215 ]] --[[ Name: selectEquippedDynamicHeadAndTryOnBundle ]]
    -- upvalues: v35 (copy), v104 (copy), l_FFlagDynamicHeadsMigration_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
    local v274 = nil;
    local v275 = nil;
    local v276 = v273.AvatarExperience and v273.AvatarExperience.AvatarEditor and v273.AvatarExperience.AvatarEditor.Character and v273.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if v276 and v276[v35.AssetTypeIdStrings.DynamicHead] then
        v274 = next(v276[v35.AssetTypeIdStrings.DynamicHead]);
    end;
    local v277 = v273.AvatarExperience and v273.AvatarExperience.Common and v273.AvatarExperience.Common.AssetInfos;
    if v274 and v277 then
        v275 = v277[v274];
    end;
    local v278, _ = v104(v273, v35.AssetTypeIdStrings.DynamicHead);
    local v280 = nil;
    if v278 and v277 then
        v280 = v277[v278];
    end;
    local v281 = false;
    if l_FFlagDynamicHeadsMigration_0 then
        local v282 = v273.AvatarExperience.AvatarScene.OutfitTryOn and v273.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v283 = nil;
        local v284 = nil;
        local l_LookId_0 = v273.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        if v282 and v278 then
            for _, v287 in v282 do
                if v287.itemType == v35.ItemType.Bundle and v287.bundleInfo then
                    if v287.bundleInfo[v278] then
                        v283 = v287.itemId;
                        v284 = v287;
                        break;
                    end;
                elseif v287.itemType == v35.ItemType.Asset and v287.itemId == v278 then
                    v283 = v287.itemId;
                    v284 = v287;
                    break;
                end;
            end;
        end;
        local v288 = v273.AvatarExperience and v273.AvatarExperience.Common and v273.AvatarExperience.Common.BundleInfos;
        local v289 = nil;
        if v283 and v288 then
            v289 = v288[v283];
        end;
        local v290 = nil;
        if v284 and v284.itemSubType == v35.BundleTypeIdStrings.DynamicHead and v284.bundleInfo then
            for v291, _ in v284.bundleInfo do
                local v293 = if v277 then v277[v291] else nil;
                if v293 and v293.supportsHeadShapes == true then
                    v290 = true;
                    break;
                end;
            end;
        end;
        if v280 and v280.supportsHeadShapes ~= nil then
            v281 = v280.supportsHeadShapes;
        elseif v289 and v289.supportsHeadShapes ~= nil then
            v281 = v289.supportsHeadShapes;
        elseif v290 ~= nil then
            v281 = v290;
        elseif v278 == nil and v275 and v275.supportsHeadShapes ~= nil then
            v281 = v275.supportsHeadShapes;
        elseif l_LookId_0 then
            v281 = false;
        end;
    elseif v280 then
        v281 = v280.supportsHeadShapes ~= nil and v280.supportsHeadShapes;
    elseif v275 then
        v281 = v275.supportsHeadShapes ~= nil and v275.supportsHeadShapes;
    end;
    return {
        equippedDynamicHeadId = v274, 
        equippedDynamicHeadInfo = v275, 
        tryOnAssetId = v278, 
        tryOnDynamicHeadAssetInfo = v280, 
        supportsHeadShapes = v281, 
        hasDynamicHead = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v274 ~= nil or v278 ~= nil else nil
    };
end;
return v6.forwardRef(function(v295, v296) --[[ Line: 1353 ]]
    -- upvalues: l_FFlagAXShowHeadAdjustmentInRightControlBar_0 (copy), l_useNavigation_0 (copy), v71 (copy), v70 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), l_useTokens_0 (copy), l_getTimeoutStatusStore_0 (copy), l_useSignalState_0 (copy), v14 (copy), l_useSelector_0 (copy), v272 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), v294 (copy), v73 (copy), v5 (copy), l_FullView_0 (copy), l_useSlotCustomizeFtux_0 (copy), l_AvatarScreen_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_MenuItemEnum_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useAvatarRoute_0 (copy), v111 (copy), v120 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_useDispatch_0 (copy), l_useAvatarSaveContext_0 (copy), l_useEffectOnMount_0 (copy), v95 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v6 (copy), v121 (ref), v4 (copy)
    local v297 = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useNavigation_0() else nil;
    local v298 = if not not v71 or v70() or l_FFlagAXAvatarTimeoutFlow_0 then l_useTokens_0() else nil;
    local v299 = if l_FFlagAXAvatarTimeoutFlow_0 then l_getTimeoutStatusStore_0(false) else nil;
    local v300 = if v299 then l_useSignalState_0(v299.getIsTimedOut) else nil;
    local v301 = if v71 then v14.useIsSpatial() else nil;
    local v302 = if v71 then v14.usePreferredInput() else nil;
    local v303 = if v70() then l_useSelector_0(v272, l_getUseSelectorDeepEquals_0()) else nil;
    local v304 = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useSelector_0(v294) else nil;
    local v305 = nil;
    if v73 then
        local v307 = v5.useCallback(function(v306) --[[ Line: 1376 ]]
            -- upvalues: l_FullView_0 (ref)
            return v306 ~= l_FullView_0.SceneFullView;
        end, {});
        v305 = l_useSlotCustomizeFtux_0(v307);
    end;
    local v308 = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v5.useCallback(function() --[[ Line: 1384 ]]
        -- upvalues: v297 (ref), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), l_MenuItemEnum_0 (ref)
        v297.navigate(l_AvatarScreen_0.HeadRefinement);
        l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(l_MenuItemEnum_0.AvatarRefinement.CustomizeHead);
    end, {
        v297
    }) else nil;
    local v309 = nil;
    local v310 = nil;
    local v311 = nil;
    local v312 = nil;
    local v313 = nil;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v312 = v5.useRef(nil);
        local v314 = v5.useRef(nil);
        v311 = v295.quickButtonsRef or v314;
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v297 = l_useNavigation_0();
        end;
        local v315 = l_useAvatarRoute_0();
        local v316 = if v297 and v297.state then v297.state.routeName else nil;
        local l_name_3 = v315.opaque.name;
        local l_name_4 = v315.current.name;
        local v319 = false;
        if v316 == l_name_3 then
            v319 = not v111[l_name_4];
        end;
        v313 = v319;
        v310 = l_useSelector_0(v120);
        v309 = v316 == l_name_4;
        l_useFocusNavigableSurfaceRegistryConnection_0(v312.current, l_FocusNavigableSurfaceIdentifierEnum_0.SubRouterView, v313);
        l_useFocusNavigableSurfaceRegistryConnection_0(v311.current, l_FocusNavigableSurfaceIdentifierEnum_0.Auxiliary, v310);
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v297 = l_useNavigation_0();
        end;
        local v320 = l_useAvatarRoute_0();
        local v321 = v297 and v297.state and v297.state.routeName;
        local v322 = v320 and v320.current and v320.current.name;
        v309 = v321 and v321 == v322;
    end;
    if l_FFlagAXModeratedItemsFlow_0 then
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v297 = l_useNavigation_0();
        end;
        local v323 = l_useDispatch_0();
        local v324 = l_useAvatarSaveContext_0();
        local l_v323_0 = v323 --[[ copy: 17 -> 23 ]];
        l_useEffectOnMount_0(function() --[[ Line: 1443 ]]
            -- upvalues: l_v323_0 (copy), v95 (ref), v297 (ref), v324 (copy)
            l_v323_0(v95(v297, v324.trySaveAvatar));
        end);
    end;
    local v326 = nil;
    if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
        v326 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v304 and v304.hasDynamicHead else if v304 then v304.supportsHeadShapes or false else false;
    end;
    return v6.createElement(v121, v4.Dictionary.join(v295, {
        forwardRef = v296, 
        tokens = v298, 
        isSpatial = v301, 
        navigation = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v297 else nil, 
        onCustomizeHeadActivated = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v308 else nil, 
        supportsHeadShapes = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v326 else nil, 
        preferredInput = v302, 
        isTryingOnItems = v303, 
        controlBarFocusAnimation = if v73 then v305 else nil, 
        itemFrameRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v312 else nil, 
        quickButtonsRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v311 else nil, 
        isQuickButtonsVisible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v310 else nil, 
        isOpaqueRouteMatchingCurrentRoute = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMISEnableMultiShopping_0 then v309 else nil, 
        isItemFrameVisible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v313 else nil, 
        isTimedOut = if l_FFlagAXAvatarTimeoutFlow_0 then v300 else nil
    }));
end);