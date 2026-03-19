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
local v22 = require(l_CorePackages_0.Packages.tutils);
local v23 = require(l_CorePackages_0.Packages.UIBlox);
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v24.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v24.Enums.AvatarScreen;
local v27 = require(l_Modules_0.LuaApp.Constants);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_SpringAnimatedItem_0 = v23.Utility.SpringAnimatedItem;
local l_withStyle_0 = v23.Style.withStyle;
local v32 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v34 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v35 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v36 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v37 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED);
local v38 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.AvatarLoadingSpinner);
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneUIContainer);
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.SceneButtons);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local v45 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.VRAvatarEditorNavBar);
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarVRPanelWrapper);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.AdaptiveScrollingView);
local v49 = require(l_Modules_0.AvatarExperience.Catalog.Components.RobuxBalance);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v52 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_TimeoutBanner_0 = v52.Components.TimeoutBanner;
local l_getTimeoutStatusStore_0 = v52.Stores.getTimeoutStatusStore;
local l_CheckoutActionBarContainer_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.CheckoutActionBarContainer;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v57 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.MultiTryOnBottomBar);
local v58 = require(l_Modules_0.AvatarExperience.Common.Components.QuickButtons);
local v59 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.SlotControlBar);
local l_useSlotCustomizeFtux_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Hooks.useSlotCustomizeFtux;
local l_UndoRedoBar_0 = v15.UndoRedoBar;
local l_SaveButton_0 = v16.Components.SaveButton;
local v63 = require(l_Modules_0.AvatarExperience.Common.Components.FullViewEntryButton);
local v64 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_GetFFlagLuaAppEnableTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner;
local v67 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixRobuxBalanceButtonPositionSecond);
local v68 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v69 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower);
local l_FFlagAXEnableManualSaving_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableManualSaving;
local v71 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableSlotsFtux);
local l_getUseSelectorDeepEquals_0 = v52.Utils.getUseSelectorDeepEquals;
local v73 = v68() and game:DefineFastFlag("FFlagAXEnableFullSceneInteractionFrame3", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixManageOutfitPageFocusLostBehind_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXFixManageOutfitPageFocusLostBehind;
local v76 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local l_FFlagAXMISEnableMultiShopping_0 = v21.FFlagAXMISEnableMultiShopping;
local v78 = game:DefineFastFlag("AXFixConsoleFullSceneViewPosition", false);
local v79 = game:DefineFastFlag("AXQuickButtonsFrameShouldAlwaysExist", false);
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local l_FFlagAXResetAvatarButton_0 = v21.FFlagAXResetAvatarButton;
local l_FFlagAXShowHeadAdjustmentInRightControlBar_0 = v21.FFlagAXShowHeadAdjustmentInRightControlBar;
local l_FFlagAXMigrateBuilderIcons_0 = v21.FFlagAXMigrateBuilderIcons;
local l_FFlagDynamicHeadsMigration_0 = v21.FFlagDynamicHeadsMigration;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v21.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagAXMoveContextualActionButtons_0 = v21.FFlagAXMoveContextualActionButtons;
local l_FFlagAXFixControlBarSubMenuOverlap_0 = v21.FFlagAXFixControlBarSubMenuOverlap;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v91 = require(l_Modules_0.AvatarExperience.Common.Thunks.RemoveUnavailableEquippedAssets);
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v93 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXHideMenuOnScroll_0 = v21.FFlagAXHideMenuOnScroll;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v21.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXAvatarTimeoutFlow_0 = v21.FFlagAXAvatarTimeoutFlow;
local l_FFlagAXFixContextualActionVisibility_0 = v21.FFlagAXFixContextualActionVisibility;
local v99 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local v101 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local l_IconOnlyMenu_0 = v101.IconOnlyMenu;
local l_MenuItemEnum_0 = v101.Enums.MenuItemEnum;
local v104 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.ContextualActions.ContextualActions);
local l_IconName_0 = v12.Enums.IconName;
local v106 = if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then {
    [l_AvatarScreen_0.UpdateOutfitPage] = true, 
    [l_AvatarScreen_0.ManageOutfitPage] = true, 
    [l_AvatarScreen_0.OutfitDetails] = true
} else {
    [l_AvatarScreen_0.UpdateOutfitPage] = true, 
    [l_AvatarScreen_0.ManageOutfitPage] = true
};
local v107 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v108 = v34.PeekHeaderHeight + (v68() and 0 or v34.MainNavHeight) + v34.SubNavHeight;
local v109 = if not not v76() or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v34.PeekHeaderHeight + v34.CatalogMainNavHeight else nil;
local v110 = l_GuiService_0:IsTenFootInterface();
local function v115(v111) --[[ Line: 185 ]] --[[ Name: selectQuickItemsVisible ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local l_ItemDetailsPeekView_0 = v111.AvatarExperience.Common.ItemDetailsPeekView;
    local v113 = l_ItemDetailsPeekView_0.viewState == l_PeekViewState_0.Full;
    local v114 = l_ItemDetailsPeekView_0.tryOnViewState == l_PeekViewState_0.Full;
    return not (l_ItemDetailsPeekView_0.tryOnManagerViewState == l_PeekViewState_0.Full) and not v113 and not v114;
end;
local v116 = v6.PureComponent:extend("AvatarExperienceView");
v116.defaultProps = {
    bottomBarEnabled = false, 
    isDisabled = false, 
    showRobuxBalance = true, 
    showMultiTryOnBottomBar = true, 
    showControlBar = true, 
    itemDetailsPeekViewRefs = {}
};
local function v122(v117, v118) --[[ Line: 251 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v67 (copy)
    local v119 = v117.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v120 = v118.topBar and v117.TopBar.topBarHeight or 0;
    local v121 = if v67() then v118.topBar and v117.TopBar.statusBarHeight or 0 else nil;
    return {
        globalGuiInset = v117.GlobalGuiInset, 
        isPortrait = v119, 
        screenSize = v117.ScreenSize, 
        topBarHeight = v120, 
        tryOnItems = v117.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v117.AvatarExperience.AvatarScene.OutfitTryOn.LookId, 
        statusBarHeight = if v67() then v121 else nil
    };
end;
local function v124(v123) --[[ Line: 307 ]] --[[ Name: mapValuesToProps ]]
    return {
        Size = UDim2.new(0, v123.width, 0, v123.height)
    };
end;
v116.init = function(v125) --[[ Line: 313 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v6 (copy), v69 (copy), v68 (copy), v5 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v27 (copy), v34 (copy), v78 (copy)
    local v126, v127 = v125:calculateSceneSize();
    v125.state = {
        sceneShowing = true, 
        isVerticallyOffscreen = false, 
        animatedValues = {
            height = v126, 
            width = v127
        }, 
        bottomBarHeight = l_FFlagAXMISEnableMultiShopping_0 and 0 or nil
    };
    v125.navItemsFrameRef = v6.createRef();
    v125.sceneFrameRef = v6.createRef();
    v125.robuxBalanceRef = if v69 then v6.createRef() else nil;
    if v68() then
        local v128, v129 = v5.createBinding(nil);
        v125.quickButtonsZIndexBinding = v128;
        v125.setQuickButtonsZIndexBinding = v129;
        v125.onActiveControlBarMenuItemChanged = function(_, v131) --[[ Line: 333 ]]
            -- upvalues: v125 (copy)
            if v131 then
                v125.setQuickButtonsZIndexBinding(3);
                return;
            else
                v125.setQuickButtonsZIndexBinding(nil);
                return;
            end;
        end;
    end;
    v125.onTransitionComplete = function(v132) --[[ Line: 342 ]]
        -- upvalues: v125 (copy), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v27 (ref)
        local l_props_0 = v125.props;
        local l_name_0 = l_props_0.avatarRoute.current.name;
        local l_isPortrait_0 = l_props_0.isPortrait;
        local l_isSceneFullView_0 = l_props_0.isSceneFullView;
        local l_isUIFullView_0 = l_props_0.isUIFullView;
        local l_sceneShowing_0 = v125.state.sceneShowing;
        if l_isUIFullView_0 and l_isPortrait_0 and l_sceneShowing_0 then
            v125:setState({
                sceneShowing = false
            });
        end;
        if not l_isPortrait_0 and l_isSceneFullView_0 and l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage then
            if not v125.state.isVerticallyOffscreen then
                v125:setState({
                    isVerticallyOffscreen = true
                });
            end;
        elseif v125.state.isVerticallyOffscreen then
            v125:setState({
                isVerticallyOffscreen = false
            });
        end;
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            local l_routeName_0 = l_props_0.navigation.state.routeName;
            local v140 = false;
            if l_routeName_0 == l_name_0 then
                v140 = not l_props_0.avatarRoute.isOverlayVisible;
            end;
            if v132 and v140 and l_props_0.lastInputGroup == v27.InputType.Gamepad and not l_isSceneFullView_0 then
                v132.captureFocus();
            end;
        end;
    end;
    v125.onNavItemsFrameResized = function(_) --[[ Line: 382 ]]
        -- upvalues: v125 (copy)
        if v125.sceneFrameRef.current then
            v125.onSceneResized(v125.sceneFrameRef.current);
        end;
    end;
    v125.onSceneResized = function(v142) --[[ Line: 390 ]]
        -- upvalues: v125 (copy), l_AvatarScreen_0 (ref), v34 (ref), v78 (ref)
        local l_current_0 = v125.navItemsFrameRef.current;
        if not l_current_0 then
            return;
        else
            local l_props_1 = v125.props;
            local l_name_1 = l_props_1.avatarRoute.current.name;
            local l_isDisabled_0 = l_props_1.isDisabled;
            local l_isPortrait_1 = l_props_1.isPortrait;
            local l_screenSize_0 = l_props_1.screenSize;
            local l_allowAdaptiveScrolling_0 = l_props_1.allowAdaptiveScrolling;
            local v150 = v125:getTopBarHeight();
            local v151 = v125.state.isVerticallyOffscreen or l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage;
            if l_isPortrait_1 then
                if l_allowAdaptiveScrolling_0 then
                    l_current_0.Position = UDim2.new(0, 0, 0, v150);
                    l_current_0.Size = UDim2.new(1, 0, 1, -v150);
                    return;
                else
                    l_current_0.Position = UDim2.new(0, 0, 0, v142.AbsoluteSize.Y + v150);
                    l_current_0.Size = UDim2.new(1, 0, 1, -v142.AbsoluteSize.Y - v150);
                    return;
                end;
            else
                local v152 = l_isDisabled_0 and 1 or v34.LandscapeNavWidth;
                l_current_0.Size = UDim2.fromScale(v152, 1);
                local l_X_0 = l_current_0.AbsoluteSize.X;
                local v154 = l_screenSize_0.X - v142.AbsoluteSize.X;
                local v155 = 0;
                if v154 < l_X_0 then
                    v155 = if v78 then v154 - l_X_0 - v150 else v154 - l_X_0;
                end;
                if v151 then
                    l_current_0.Position = UDim2.fromOffset(0, l_screenSize_0.Y * (-v155 / l_X_0));
                    return;
                else
                    l_current_0.Position = UDim2.fromOffset(v155, 0);
                    return;
                end;
            end;
        end;
    end;
    v125.onBottomBarAbsoluteSizeChanged = l_FFlagAXMISEnableMultiShopping_0 and function(v156) --[[ Line: 437 ]]
        -- upvalues: v125 (copy)
        v125:setState({
            bottomBarHeight = v156.AbsoluteSize.Y
        });
    end or nil;
end;
v116.getTopBarHeight = function(v157) --[[ Line: 445 ]] --[[ Name: getTopBarHeight ]]
    return v157.props.topBarHeight;
end;
v116.instantResize = function(v158) --[[ Line: 450 ]] --[[ Name: instantResize ]]
    local l_current_1 = v158.sceneFrameRef.current;
    if not l_current_1 then
        return;
    else
        local v160, v161 = v158:calculateSceneSize();
        l_current_1.Size = UDim2.new(0, v161, 0, v160);
        v158.onSceneResized(l_current_1);
        return;
    end;
end;
v116.calculatePortraitSceneHeight = function(v162) --[[ Line: 462 ]] --[[ Name: calculatePortraitSceneHeight ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v34 (copy)
    local l_props_2 = v162.props;
    local l_globalGuiInset_0 = l_props_2.globalGuiInset;
    local l_screenSize_1 = l_props_2.screenSize;
    local l_isLandingPage_0 = l_props_2.isLandingPage;
    local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_1, l_globalGuiInset_0).Y.Offset;
    local v168 = l_Offset_0 * v34.PortraitSceneHeight;
    if l_isLandingPage_0 then
        v168 = l_Offset_0 * v34.LandingPagePortraitSceneHeight;
        if l_Offset_0 - v168 < v34.LandingPagePortraitMinItemsHeightPix then
            v168 = l_Offset_0 - v34.LandingPagePortraitMinItemsHeightPix;
        end;
    end;
    return v168;
end;
v116.calculateFullHeight = function(v169) --[[ Line: 485 ]] --[[ Name: calculateFullHeight ]]
    local l_props_3 = v169.props;
    local l_globalGuiInset_1 = l_props_3.globalGuiInset;
    local l_isPortrait_2 = l_props_3.isPortrait;
    local l_screenSize_2 = l_props_3.screenSize;
    local l_bottom_0 = l_globalGuiInset_1.bottom;
    local v175 = v169:getTopBarHeight();
    local v176 = l_isPortrait_2 and v175 or 0;
    return l_screenSize_2.Y - l_bottom_0 - v176;
end;
v116.calculateSceneSize = function(v177) --[[ Line: 496 ]] --[[ Name: calculateSceneSize ]]
    -- upvalues: v34 (copy)
    local l_props_4 = v177.props;
    local l_globalGuiInset_2 = l_props_4.globalGuiInset;
    local l_isDisabled_1 = l_props_4.isDisabled;
    local l_isSceneFullView_1 = l_props_4.isSceneFullView;
    local l_isPortrait_3 = l_props_4.isPortrait;
    local l_isUIFullView_1 = l_props_4.isUIFullView;
    local l_screenSize_3 = l_props_4.screenSize;
    local v185 = v177:getTopBarHeight();
    local l_bottom_1 = l_globalGuiInset_2.bottom;
    local l_left_0 = l_globalGuiInset_2.left;
    local v188 = l_isPortrait_3 and v185 or 0;
    local v189 = l_screenSize_3.Y - l_bottom_1;
    local v190 = (l_screenSize_3.X - l_left_0) * v34.LandscapeSceneWidth;
    local v191 = l_screenSize_3.X - l_left_0;
    local v192 = v177:calculatePortraitSceneHeight();
    local v193 = l_isPortrait_3 and v192 or v189;
    local v194 = l_isPortrait_3 and v191 or v190;
    if l_isUIFullView_1 and l_isPortrait_3 then
        v193 = 0;
    elseif l_isSceneFullView_1 then
        v194 = l_screenSize_3.X;
        v193 = l_screenSize_3.Y - l_bottom_1 - v188;
    end;
    if l_isDisabled_1 then
        v193 = 0;
        v194 = 0;
    end;
    return v193, v194;
end;
v116.isConsoleWithGamepad = function(v195) --[[ Line: 534 ]] --[[ Name: isConsoleWithGamepad ]]
    -- upvalues: v110 (copy), v27 (copy)
    local l_props_5 = v195.props;
    return v110 and l_props_5.lastInputGroup == v27.InputType.Gamepad;
end;
v116.renderSceneFrame = function(v197) --[[ Line: 539 ]] --[[ Name: renderSceneFrame ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_IsVRAppBuild_0 (copy), l_AvatarScreen_0 (copy), v6 (copy), l_SpringAnimatedItem_0 (copy), v124 (copy), v107 (copy), v41 (copy), v67 (copy), v73 (copy), v39 (copy), v40 (copy), v45 (copy), v10 (copy), l_Focusable_0 (copy)
    local l_props_6 = v197.props;
    local l_isDisabled_2 = l_props_6.isDisabled;
    local l_isSceneFullView_2 = l_props_6.isSceneFullView;
    local l_isUIFullView_2 = l_props_6.isUIFullView;
    local l_isPortrait_4 = l_props_6.isPortrait;
    local v203 = v197:getTopBarHeight();
    local l_name_2 = l_props_6.avatarRoute.opaque.name;
    local v205 = v197.state.sceneShowing or not l_isPortrait_4;
    if l_isDisabled_2 then
        v205 = false;
    end;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local l_forwardRef_0 = l_props_6.forwardRef;
        local v207 = not l_isSceneFullView_2 and not l_isUIFullView_2;
        if l_IsVRAppBuild_0() then
            v207 = v207 and l_name_2 ~= l_AvatarScreen_0.LayeredClothingSort;
        end;
        return v6.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, l_isPortrait_4 and v203 or 0), 
                ZIndex = -1, 
                [v6.Change.AbsoluteSize] = v197.onSceneResized, 
                [v6.Event.AncestryChanged] = v197.onSceneResized, 
                [v6.Ref] = v197.sceneFrameRef
            }, 
            animatedValues = v197.state.animatedValues, 
            mapValuesToProps = v124, 
            springOptions = v107, 
            onComplete = function() --[[ Line: 581 ]] --[[ Name: onComplete ]]
                -- upvalues: v197 (copy)
                v197.onTransitionComplete();
            end
        }, {
            SceneUIContainer = v6.createElement(v41, {
                globalGuiInset = v197.props.globalGuiInset, 
                statusBarHeight = if v67() then v197.props.statusBarHeight else nil, 
                changeViewFunction = l_props_6.changeViewFunction, 
                isVisible = v205, 
                row1ChildrenVisible = v207, 
                showRobuxBalance = l_props_6.showRobuxBalance, 
                [v6.Ref] = l_forwardRef_0
            }), 
            SceneInteractionFrame = if v73 then nil else if l_IsVRAppBuild_0() then nil else v6.createElement(v39), 
            AvatarLoadingSpinner = if l_IsVRAppBuild_0() then nil else v6.createElement(v40), 
            VRAvatarEditorNavBar = if l_IsVRAppBuild_0() then v6.createElement(v45, {
                currentPage = l_name_2, 
                navigation = l_props_6.navigation
            }) else nil, 
            SceneUi = l_props_6.sceneUi
        });
    else
        return v10.withFocusController(function(v208) --[[ Line: 611 ]]
            -- upvalues: l_props_6 (copy), l_isSceneFullView_2 (copy), l_isUIFullView_2 (copy), l_IsVRAppBuild_0 (ref), l_name_2 (copy), l_AvatarScreen_0 (ref), v6 (ref), l_SpringAnimatedItem_0 (ref), l_isPortrait_4 (copy), v203 (copy), v197 (copy), v124 (ref), v107 (ref), l_Focusable_0 (ref), v41 (ref), v67 (ref), v205 (ref), v73 (ref), v39 (ref), v40 (ref), v45 (ref)
            local l_forwardRef_1 = l_props_6.forwardRef;
            local v210 = not l_isSceneFullView_2 and not l_isUIFullView_2;
            if l_IsVRAppBuild_0() then
                v210 = v210 and l_name_2 ~= l_AvatarScreen_0.LayeredClothingSort;
            end;
            return v6.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                regularProps = {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 0, l_isPortrait_4 and v203 or 0), 
                    ZIndex = -1, 
                    [v6.Change.AbsoluteSize] = v197.onSceneResized, 
                    [v6.Event.AncestryChanged] = v197.onSceneResized, 
                    [v6.Ref] = v197.sceneFrameRef
                }, 
                animatedValues = v197.state.animatedValues, 
                mapValuesToProps = v124, 
                springOptions = v107, 
                onComplete = function() --[[ Line: 639 ]] --[[ Name: onComplete ]]
                    -- upvalues: v197 (ref), v208 (copy)
                    v197.onTransitionComplete(v208);
                end
            }, {
                SceneUIContainer = v6.createElement(l_Focusable_0[v41], {
                    globalGuiInset = v197.props.globalGuiInset, 
                    statusBarHeight = if v67() then v197.props.statusBarHeight else nil, 
                    changeViewFunction = l_props_6.changeViewFunction, 
                    isVisible = v205, 
                    row1ChildrenVisible = v210, 
                    showRobuxBalance = l_props_6.showRobuxBalance, 
                    [v6.Ref] = l_forwardRef_1, 
                    NextSelectionDown = l_props_6.NextSelectionDown, 
                    NextSelectionLeft = l_props_6.NextSelectionLeft, 
                    NextSelectionUp = l_props_6.NextSelectionUp
                }), 
                SceneInteractionFrame = if v73 then nil else if l_IsVRAppBuild_0() then nil else v6.createElement(v39), 
                AvatarLoadingSpinner = if l_IsVRAppBuild_0() then nil else v6.createElement(v40), 
                VRAvatarEditorNavBar = if l_IsVRAppBuild_0() then v6.createElement(v45, {
                    currentPage = l_name_2, 
                    navigation = l_props_6.navigation
                }) else nil, 
                SceneUi = l_props_6.sceneUi
            });
        end);
    end;
end;
v116.renderWithStyle = function(v211, _) --[[ Line: 673 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v68 (copy), l_FFlagAXEnableManualSaving_0 (copy), v76 (copy), l_AvatarScreen_0 (copy), v109 (copy), v108 (copy), v4 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v6 (copy), v48 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), v5 (copy), l_TimeoutBanner_0 (copy), v12 (copy), l_SaveButton_0 (copy), v63 (copy), v43 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v34 (copy), v59 (copy), l_FFlagAXResetAvatarButton_0 (copy), v71 (copy), v58 (copy), v69 (copy), v14 (copy), l_FFlagAXShowHeadAdjustmentInRightControlBar_0 (copy), v49 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), l_IconOnlyMenu_0 (copy), l_MenuItemEnum_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy), l_FFlagAXFixContextualActionVisibility_0 (copy), v104 (copy), l_FFlagAXFixControlBarSubMenuOverlap_0 (copy), l_UndoRedoBar_0 (copy), l_IsVRAppBuild_0 (copy), v47 (copy), v38 (copy), v22 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), v79 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), v44 (copy), v57 (copy), v36 (copy), l_CheckoutActionBarContainer_0 (copy), v73 (copy), v39 (copy)
    local l_props_7 = v211.props;
    local l_allowAdaptiveScrolling_1 = l_props_7.allowAdaptiveScrolling;
    local l_bottomBarEnabled_0 = l_props_7.bottomBarEnabled;
    local l_globalGuiInset_3 = l_props_7.globalGuiInset;
    local l_isPortrait_5 = l_props_7.isPortrait;
    local v218 = v211:getTopBarHeight();
    local l_tokens_0 = l_props_7.tokens;
    local l_isTimedOut_0 = l_props_7.isTimedOut;
    local v221 = if v68() then l_props_7.showUndoRedo else nil;
    local v222 = if v68() and l_FFlagAXEnableManualSaving_0 then l_props_7.showSaveButton else nil;
    local v223 = not l_bottomBarEnabled_0 and l_globalGuiInset_3.bottom > 0;
    local v224 = v211:calculateSceneSize();
    local l_avatarRoute_0 = l_props_7.avatarRoute;
    local v226 = nil;
    if v76() then
        v226 = if l_props_7.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then v109 else v108;
    end;
    local v227 = not v4.isEmpty(l_props_7.tryOnItems) and (not l_props_7.isSceneFullView or false);
    if l_props_7.lookId ~= nil then
        if l_FFlagAXMISEnableMultiShopping_0 then
            local v228 = false;
            if l_avatarRoute_0.opaque.name ~= l_AvatarScreen_0.MySharedAvatars then
                v228 = v227;
            end;
            v227 = v228;
        else
            v227 = false;
        end;
    end;
    v227 = not not l_props_7.showMultiTryOnBottomBar and v227;
    local v229 = nil;
    local v230 = nil;
    if l_allowAdaptiveScrolling_1 then
        v229 = v211:calculateFullHeight();
        v230 = v229 - v211:calculatePortraitSceneHeight();
    end;
    local v231 = {
        TopBar = not l_isPortrait_5 and l_props_7.topBar, 
        Items = v6.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, l_isPortrait_5 and 0 or -v218), 
            ZIndex = 2
        }, if l_allowAdaptiveScrolling_1 and l_isPortrait_5 then {
            AdaptiveScrollingView = v6.createElement(v48, {
                fullHeight = v229, 
                midHeight = v230, 
                alwaysShowingHeight = if v76() then v226 else v108, 
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
    local v232 = v211:renderSceneFrame();
    local v233 = nil;
    if v68() and l_tokens_0 then
        local v234 = v211:calculatePortraitSceneHeight();
        local v235 = UDim2.new(1, -l_tokens_0.Size.Size_500, 0, v234 + v218 - l_tokens_0.Size.Size_400);
        if not l_isPortrait_5 then
            local l_Size_500_0 = l_tokens_0.Size.Size_500;
            if l_FFlagAXMISEnableMultiShopping_0 then
                local l_bottomBarHeight_0 = v211.state.bottomBarHeight;
                if l_props_7.isTryingOnItems and l_bottomBarHeight_0 then
                    l_Size_500_0 = l_Size_500_0 + l_bottomBarHeight_0;
                end;
            elseif l_props_7.isTryingOnItems and l_props_7.multiTryOnBottomBarRef and l_props_7.multiTryOnBottomBarRef.current then
                l_Size_500_0 = l_Size_500_0 + l_props_7.multiTryOnBottomBarRef.current.AbsoluteSize.Y;
            end;
            v235 = UDim2.new(1, -l_tokens_0.Size.Size_500, 1, -l_Size_500_0);
        end;
        v233 = v6.createElement(v12.View, {
            tag = "auto-xy anchor-bottom-right row", 
            Position = v235
        }, {
            SaveButton = if not v222 or l_props_7.isSceneFullView then nil else v6.createElement(l_SaveButton_0, {}), 
            FullViewEntryButton = if not l_props_7.isSceneFullView or l_isPortrait_5 then nil else v5.createElement(v63, {
                isUIFullView = l_props_7.isUIFullView, 
                isSceneFullView = l_props_7.isSceneFullView, 
                changeViewFunction = l_props_7.changeViewFunction
            })
        });
    else
        v233 = if l_allowAdaptiveScrolling_1 and l_isPortrait_5 then nil else v6.createElement(v43, {
            sceneHeight = v224, 
            isUIFullView = l_props_7.isUIFullView, 
            isSceneFullView = l_props_7.isSceneFullView, 
            changeViewFunction = l_props_7.changeViewFunction, 
            ZIndex = 3
        });
    end;
    local v238 = nil;
    v238 = if v68() and l_tokens_0 then v5.createElement(v12.View, {
        tag = "auto-xy col gap-small", 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef, 
        SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        Position = if l_isPortrait_5 then UDim2.fromOffset(l_tokens_0.Size.Size_500, v218) else UDim2.new(v34.LandscapeNavWidth, l_tokens_0.Size.Size_700, 0, v218), 
        Visible = not l_props_7.isSceneFullView, 
        ZIndex = v211.quickButtonsZIndexBinding
    }, {
        ControlBar = v5.createElement(v59, {
            isUIFullView = l_props_7.isUIFullView, 
            isSceneFullView = l_props_7.isSceneFullView, 
            showControlBar = l_props_7.showControlBar, 
            showUndoRedo = v221 and (l_FFlagAXResetAvatarButton_0 and true or not l_isPortrait_5), 
            onActiveMenuItemChanged = v211.onActiveControlBarMenuItemChanged, 
            NextSelectionLeft = l_props_7.defaultChildRef, 
            focusAnimation = if v71 and l_props_7.controlBarFocusAnimation then l_props_7.controlBarFocusAnimation else nil, 
            LayoutOrder = 1
        })
    }) else v6.createElement(v58, {
        isUIFullView = l_props_7.isUIFullView, 
        isSceneFullView = l_props_7.isSceneFullView, 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.defaultChildRef
    });
    local v239 = nil;
    if v69 and v211.props.showRobuxBalance and v211.props.tokens then
        local l_Size_700_0 = v211.props.tokens.Size.Size_700;
        if l_isPortrait_5 then
            l_Size_700_0 = v211.props.tokens.Size.Size_500;
        elseif v211.props.preferredInput == v14.Input.Directional then
            l_Size_700_0 = v211.props.tokens.Size.Size_200;
        end;
        local v241 = "auto-xy anchor-top-right";
        if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v241 = v241 .. " col gap-small align-x-right";
        end;
        v239 = v5.createElement(v12.View, {
            tag = v241, 
            Position = UDim2.new(1, -l_Size_700_0, 0, v211.props.isSpatial and 0 or v211.props.topBarHeight)
        }, {
            RobuxBalance = if not l_props_7.isSceneFullView then v5.createElement(v49, {
                ref = v211.robuxBalanceRef, 
                NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef
            }) else nil, 
            WhiteSpace = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v5.createElement(v12.View, {
                Size = UDim2.new(1, 0, 0, v211.props.tokens.Size.Size_1300), 
                LayoutOrder = 2
            }) else nil, 
            HeadAdjustmentButton = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 and v211.props.supportsHeadShapes then v5.createElement(l_IconOnlyMenu_0, {
                LayoutOrder = 3, 
                items = {
                    {
                        type = "icon", 
                        id = l_MenuItemEnum_0.AvatarRefinement.CustomizeHead, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                        iconSize = v211.props.tokens.Size.Size_600, 
                        onActivated = v211.props.onCustomizeHeadActivated
                    }
                }
            }) else nil
        });
    end;
    local v242 = nil;
    if l_FFlagAXMoveContextualActionButtons_0 and l_tokens_0 then
        local v243 = v211:calculatePortraitSceneHeight() / 2 + v218;
        v242 = v5.createElement(v12.View, {
            tag = "auto-xy anchor-center-right", 
            Position = UDim2.new(1, -l_tokens_0.Size.Size_500, 0, v243), 
            Visible = not l_FFlagAXFixContextualActionVisibility_0 or not (l_props_7.isSceneFullView or l_props_7.isUIFullView)
        }, {
            ContextualActions = if v211.props.isPortrait then v5.createElement(v104, {
                LayoutOrder = 1
            }) else nil
        });
    end;
    local v244 = nil;
    if v68() and l_tokens_0 then
        local v245 = v221 and not l_props_7.isSceneFullView and l_isPortrait_5 and not l_FFlagAXResetAvatarButton_0 and not (l_FFlagAXFixControlBarSubMenuOverlap_0 and l_props_7.isUIFullView);
        local v246 = v211:calculatePortraitSceneHeight();
        local v247 = UDim2.fromOffset(l_tokens_0.Size.Size_500, v246 + v218 - l_tokens_0.Size.Size_400);
        if not l_isPortrait_5 then
            local l_Size_500_1 = l_tokens_0.Size.Size_500;
            if l_FFlagAXMISEnableMultiShopping_0 then
                local l_bottomBarHeight_1 = v211.state.bottomBarHeight;
                if l_props_7.isTryingOnItems and l_bottomBarHeight_1 then
                    l_Size_500_1 = l_Size_500_1 + l_bottomBarHeight_1;
                end;
            elseif l_props_7.isTryingOnItems and l_props_7.multiTryOnBottomBarRef and l_props_7.multiTryOnBottomBarRef.current then
                l_Size_500_1 = l_Size_500_1 + l_props_7.multiTryOnBottomBarRef.current.AbsoluteSize.Y;
            end;
            v247 = UDim2.new(v34.LandscapeNavWidth, l_tokens_0.Size.Size_500, 1, -l_Size_500_1);
        end;
        v244 = v5.createElement(v12.View, {
            tag = "auto-xy anchor-bottom-left", 
            Position = v247
        }, {
            UndoRedoBarPortrait = if v245 then v5.createElement(l_UndoRedoBar_0) else nil
        });
    end;
    local v250 = nil;
    v250 = if l_IsVRAppBuild_0() then v6.createElement(v47, {
        roundedCornersFrame = false, 
        panelPlacement = "Center"
    }, {
        SceneFrame = v232, 
        QuickButtons = v238, 
        BottomRightButtons = v233, 
        GamepadHandler = if l_avatarRoute_0.current.name ~= l_AvatarScreen_0.LayeredClothingSort then v6.createElement(v38) else nil, 
        TopRightButtons = if v69 then v239 else nil, 
        MiddleRightButtons = if l_FFlagAXMoveContextualActionButtons_0 then v242 else nil, 
        BottomLeftButtons = if v68() then v244 else nil
    }) else v6.createFragment({
        SceneFrame = v232, 
        QuickButtons = v238, 
        BottomRightButtons = v233, 
        TopRightButtons = if v69 then v239 else nil, 
        MiddleRightButtons = if l_FFlagAXMoveContextualActionButtons_0 then v242 else nil, 
        BottomLeftButtons = if v68() then v244 else nil
    });
    local v251 = v22.fieldCount(l_props_7.tryOnItems) > 1;
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, if l_GetFFlagLuaAppEnableTopBanner_0() then -l_props_7.globalGuiInset.top else 0), 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = l_props_7.ZIndex, 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_props_7.itemFrameRef else nil
    }, {
        TopBar = l_isPortrait_5 and l_props_7.topBar, 
        ItemsFrame = if l_IsVRAppBuild_0() then v6.createElement(v47, {
            visible = l_avatarRoute_0.current.name ~= l_AvatarScreen_0.LayeredClothingSort, 
            roundedCornersFrame = true, 
            panelPlacement = "Left"
        }, v231) else v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            ZIndex = (not l_isPortrait_5 or l_allowAdaptiveScrolling_1) and 2 or nil, 
            [v6.Change.AbsoluteSize] = v211.onNavItemsFrameResized, 
            [v6.Ref] = v211.navItemsFrameRef, 
            Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v211.props.isItemFrameVisible else nil
        }, v231), 
        OverlayedUI = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then if v79 then v5.createElement("Frame", {
            ref = l_props_7.quickButtonsRef, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_7.isQuickButtonsVisible, 
            SelectionGroup = l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and true or nil, 
            ZIndex = l_FFlagAXFixControlBarSubMenuOverlap_0 and 3 or nil
        }, v250) else if l_props_7.isQuickButtonsVisible then v5.createElement("Frame", {
            ref = l_props_7.quickButtonsRef, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = l_FFlagAXFixControlBarSubMenuOverlap_0 and 3 or nil
        }, v250) else nil else v250, 
        BottomInsetBackground = if v223 then v6.createElement(v44, {
            globalGuiInset = l_globalGuiInset_3
        }) else nil, 
        MultiTryOnBottomBar = if l_FFlagAXMISEnableMultiShopping_0 and v251 then nil else v6.createElement(v57, {
            bottomBarRef = l_props_7.multiTryOnBottomBarRef, 
            NextSelectionLeft = l_props_7.namedRefs[l_props_7.avatarRoute.opaque.name .. v36.ItemsList], 
            Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_props_7.isOpaqueRouteMatchingCurrentRoute and v227 else v227, 
            isConsoleWithGamepad = v211:isConsoleWithGamepad(), 
            itemDetailsPeekViewRefs = l_props_7.itemDetailsPeekViewRefs, 
            onAbsoluteSizeChanged = if l_FFlagAXMISEnableMultiShopping_0 then v211.onBottomBarAbsoluteSizeChanged else nil
        }), 
        CheckoutActionBar = if l_FFlagAXMISEnableMultiShopping_0 and l_props_7.isOpaqueRouteMatchingCurrentRoute and v251 then v5.createElement(l_CheckoutActionBarContainer_0, {
            ref = l_props_7.multiTryOnBottomBarRef, 
            onAbsoluteSizeChanged = v211.onBottomBarAbsoluteSizeChanged, 
            Visible = v227
        }) else nil, 
        FullSceneInteractionFrame = if v73 then if v211.props.isSpatial then nil else v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = -2
        }, {
            SceneInteractionFrame = v6.createElement(v39)
        }) else nil
    });
end;
v116.render = function(v252) --[[ Line: 1103 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v37 (copy)
    return l_withStyle_0(function(v253) --[[ Line: 1104 ]]
        -- upvalues: v6 (ref), v37 (ref), v252 (copy)
        return v6.createElement(v37, nil, {
            AvatarExperienceView = v252:renderWithStyle(v253)
        });
    end);
end;
v116.didUpdate = function(v254, v255) --[[ Line: 1111 ]] --[[ Name: didUpdate ]]
    local l_props_8 = v254.props;
    local l_isUIFullView_3 = l_props_8.isUIFullView;
    local l_sceneShowing_1 = v254.state.sceneShowing;
    if not l_isUIFullView_3 and not l_sceneShowing_1 then
        v254:setState({
            sceneShowing = true
        });
    end;
    local l_isPortrait_6 = v255.isPortrait;
    local l_isPortrait_7 = l_props_8.isPortrait;
    if l_isPortrait_7 ~= l_isPortrait_6 then
        if l_isPortrait_7 and l_isUIFullView_3 then
            v254:setState({
                sceneShowing = false
            });
        elseif not l_isPortrait_6 and l_isUIFullView_3 then
            v254:setState({
                sceneShowing = true
            });
        end;
        v254:instantResize();
    end;
    if l_props_8.isDisabled then
        v254:instantResize();
    end;
    if l_props_8.screenSize ~= v255.screenSize then
        v254:instantResize();
    end;
    if l_props_8.topBarHeight ~= v255.topBarHeight then
        v254:instantResize();
    end;
    local v261, v262 = v254:calculateSceneSize();
    if v261 ~= v254.state.animatedValues.height or v262 ~= v254.state.animatedValues.width then
        v254:setState({
            animatedValues = {
                height = v261, 
                width = v262
            }
        });
    end;
end;
v116.didMount = function(v263) --[[ Line: 1164 ]] --[[ Name: didMount ]]
    v263:instantResize();
    local v264, v265 = v263:calculateSceneSize();
    v263:setState({
        animatedValues = {
            height = v264, 
            width = v265
        }
    });
end;
v116 = v46((v9.connect(v122, nil)(v116)));
v116 = v32((v42((v8.withNavigation(v116)))));
v116 = v64.connectTestVariables({
    universalAppCameraEnabled = v93.EnabledForUser
})(v116);
local function v267(v266) --[[ Line: 1191 ]] --[[ Name: selectTryingOnItems ]]
    -- upvalues: v4 (copy)
    return not v4.isEmpty(v266.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
local function v289(v268) --[[ Line: 1196 ]] --[[ Name: selectEquippedDynamicHeadAndTryOnBundle ]]
    -- upvalues: v34 (copy), v99 (copy), l_FFlagDynamicHeadsMigration_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
    local v269 = nil;
    local v270 = nil;
    local v271 = v268.AvatarExperience and v268.AvatarExperience.AvatarEditor and v268.AvatarExperience.AvatarEditor.Character and v268.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if v271 and v271[v34.AssetTypeIdStrings.DynamicHead] then
        v269 = next(v271[v34.AssetTypeIdStrings.DynamicHead]);
    end;
    local v272 = v268.AvatarExperience and v268.AvatarExperience.Common and v268.AvatarExperience.Common.AssetInfos;
    if v269 and v272 then
        v270 = v272[v269];
    end;
    local v273, _ = v99(v268, v34.AssetTypeIdStrings.DynamicHead);
    local v275 = nil;
    if v273 and v272 then
        v275 = v272[v273];
    end;
    local v276 = false;
    if l_FFlagDynamicHeadsMigration_0 then
        local v277 = v268.AvatarExperience.AvatarScene.OutfitTryOn and v268.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v278 = nil;
        local v279 = nil;
        local l_LookId_0 = v268.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        if v277 and v273 then
            for _, v282 in v277 do
                if v282.itemType == v34.ItemType.Bundle and v282.bundleInfo then
                    if v282.bundleInfo[v273] then
                        v278 = v282.itemId;
                        v279 = v282;
                        break;
                    end;
                elseif v282.itemType == v34.ItemType.Asset and v282.itemId == v273 then
                    v278 = v282.itemId;
                    v279 = v282;
                    break;
                end;
            end;
        end;
        local v283 = v268.AvatarExperience and v268.AvatarExperience.Common and v268.AvatarExperience.Common.BundleInfos;
        local v284 = nil;
        if v278 and v283 then
            v284 = v283[v278];
        end;
        local v285 = nil;
        if v279 and v279.itemSubType == v34.BundleTypeIdStrings.DynamicHead and v279.bundleInfo then
            for v286, _ in v279.bundleInfo do
                local v288 = if v272 then v272[v286] else nil;
                if v288 and v288.supportsHeadShapes == true then
                    v285 = true;
                    break;
                end;
            end;
        end;
        if v275 and v275.supportsHeadShapes ~= nil then
            v276 = v275.supportsHeadShapes;
        elseif v284 and v284.supportsHeadShapes ~= nil then
            v276 = v284.supportsHeadShapes;
        elseif v285 ~= nil then
            v276 = v285;
        elseif v273 == nil and v270 and v270.supportsHeadShapes ~= nil then
            v276 = v270.supportsHeadShapes;
        elseif l_LookId_0 then
            v276 = false;
        end;
    elseif v275 then
        v276 = v275.supportsHeadShapes ~= nil and v275.supportsHeadShapes;
    elseif v270 then
        v276 = v270.supportsHeadShapes ~= nil and v270.supportsHeadShapes;
    end;
    return {
        equippedDynamicHeadId = v269, 
        equippedDynamicHeadInfo = v270, 
        tryOnAssetId = v273, 
        tryOnDynamicHeadAssetInfo = v275, 
        supportsHeadShapes = v276, 
        hasDynamicHead = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v269 ~= nil or v273 ~= nil else nil
    };
end;
return v6.forwardRef(function(v290, v291) --[[ Line: 1334 ]]
    -- upvalues: l_FFlagAXShowHeadAdjustmentInRightControlBar_0 (copy), l_useNavigation_0 (copy), v69 (copy), v68 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), l_useTokens_0 (copy), l_getTimeoutStatusStore_0 (copy), l_useSignalState_0 (copy), v14 (copy), l_useSelector_0 (copy), v267 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), v289 (copy), v71 (copy), v5 (copy), v35 (copy), l_useSlotCustomizeFtux_0 (copy), l_AvatarScreen_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_MenuItemEnum_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useAvatarRoute_0 (copy), v106 (copy), v115 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_useDispatch_0 (copy), l_useAvatarSaveContext_0 (copy), l_useEffectOnMount_0 (copy), v91 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v6 (copy), v116 (ref), v4 (copy)
    local v292 = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useNavigation_0() else nil;
    local v293 = if not not v69 or v68() or l_FFlagAXAvatarTimeoutFlow_0 then l_useTokens_0() else nil;
    local v294 = if l_FFlagAXAvatarTimeoutFlow_0 then l_getTimeoutStatusStore_0(false) else nil;
    local v295 = if v294 then l_useSignalState_0(v294.getIsTimedOut) else nil;
    local v296 = if v69 then v14.useIsSpatial() else nil;
    local v297 = if v69 then v14.usePreferredInput() else nil;
    local v298 = if v68() then l_useSelector_0(v267, l_getUseSelectorDeepEquals_0()) else nil;
    local v299 = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useSelector_0(v289) else nil;
    local v300 = nil;
    if v71 then
        local v302 = v5.useCallback(function(v301) --[[ Line: 1357 ]]
            -- upvalues: v35 (ref)
            return v301 ~= v35.SceneFullView;
        end, {});
        v300 = l_useSlotCustomizeFtux_0(v302);
    end;
    local v303 = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v5.useCallback(function() --[[ Line: 1365 ]]
        -- upvalues: v292 (ref), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), l_MenuItemEnum_0 (ref)
        v292.navigate(l_AvatarScreen_0.HeadRefinement);
        l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(l_MenuItemEnum_0.AvatarRefinement.CustomizeHead);
    end, {
        v292
    }) else nil;
    local v304 = nil;
    local v305 = nil;
    local v306 = nil;
    local v307 = nil;
    local v308 = nil;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v307 = v5.useRef(nil);
        local v309 = v5.useRef(nil);
        v306 = v290.quickButtonsRef or v309;
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v292 = l_useNavigation_0();
        end;
        local v310 = l_useAvatarRoute_0();
        local v311 = if v292 and v292.state then v292.state.routeName else nil;
        local l_name_3 = v310.opaque.name;
        local l_name_4 = v310.current.name;
        local v314 = false;
        if v311 == l_name_3 then
            v314 = not v106[l_name_4];
        end;
        v308 = v314;
        v305 = l_useSelector_0(v115);
        v304 = v311 == l_name_4;
        l_useFocusNavigableSurfaceRegistryConnection_0(v307.current, l_FocusNavigableSurfaceIdentifierEnum_0.SubRouterView, v308);
        l_useFocusNavigableSurfaceRegistryConnection_0(v306.current, l_FocusNavigableSurfaceIdentifierEnum_0.Auxiliary, v305);
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v292 = l_useNavigation_0();
        end;
        local v315 = l_useAvatarRoute_0();
        local v316 = v292 and v292.state and v292.state.routeName;
        local v317 = v315 and v315.current and v315.current.name;
        v304 = v316 and v316 == v317;
    end;
    if l_FFlagAXModeratedItemsFlow_0 then
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v292 = l_useNavigation_0();
        end;
        local v318 = l_useDispatch_0();
        local v319 = l_useAvatarSaveContext_0();
        local l_v318_0 = v318 --[[ copy: 17 -> 23 ]];
        l_useEffectOnMount_0(function() --[[ Line: 1424 ]]
            -- upvalues: l_v318_0 (copy), v91 (ref), v292 (ref), v319 (copy)
            l_v318_0(v91(v292, v319.trySaveAvatar));
        end);
    end;
    local v321 = nil;
    if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
        v321 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v299 and v299.hasDynamicHead else if v299 then v299.supportsHeadShapes or false else false;
    end;
    return v6.createElement(v116, v4.Dictionary.join(v290, {
        forwardRef = v291, 
        tokens = v293, 
        isSpatial = v296, 
        navigation = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v292 else nil, 
        onCustomizeHeadActivated = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v303 else nil, 
        supportsHeadShapes = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v321 else nil, 
        preferredInput = v297, 
        isTryingOnItems = v298, 
        controlBarFocusAnimation = if v71 then v300 else nil, 
        itemFrameRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v307 else nil, 
        quickButtonsRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v306 else nil, 
        isQuickButtonsVisible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v305 else nil, 
        isOpaqueRouteMatchingCurrentRoute = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMISEnableMultiShopping_0 then v304 else nil, 
        isItemFrameVisible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v308 else nil, 
        isTimedOut = if l_FFlagAXAvatarTimeoutFlow_0 then v295 else nil
    }));
end);