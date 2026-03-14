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
local v51 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_TimeoutBanner_0 = v51.Components.TimeoutBanner;
local l_CheckoutActionBarContainer_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.CheckoutActionBarContainer;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v55 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.MultiTryOnBottomBar);
local v56 = require(l_Modules_0.AvatarExperience.Common.Components.QuickButtons);
local v57 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.SlotControlBar);
local l_useSlotCustomizeFtux_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Hooks.useSlotCustomizeFtux;
local l_UndoRedoBar_0 = v15.UndoRedoBar;
local l_SaveButton_0 = v16.Components.SaveButton;
local v61 = require(l_Modules_0.AvatarExperience.Common.Components.FullViewEntryButton);
local v62 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_GetFFlagLuaAppEnableTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner;
local v65 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixRobuxBalanceButtonPositionSecond);
local v66 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v67 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower);
local l_FFlagAXEnableManualSaving_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableManualSaving;
local v69 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableSlotsFtux);
local l_getUseSelectorDeepEquals_0 = v51.Utils.getUseSelectorDeepEquals;
local v71 = v66() and game:DefineFastFlag("FFlagAXEnableFullSceneInteractionFrame3", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixManageOutfitPageFocusLostBehind_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXFixManageOutfitPageFocusLostBehind;
local v74 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local l_FFlagAXMISEnableMultiShopping_0 = v21.FFlagAXMISEnableMultiShopping;
local v76 = game:DefineFastFlag("AXFixConsoleFullSceneViewPosition", false);
local v77 = game:DefineFastFlag("AXQuickButtonsFrameShouldAlwaysExist", false);
local l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local l_FFlagAXResetAvatarButton_0 = v21.FFlagAXResetAvatarButton;
local l_FFlagAXShowHeadAdjustmentInRightControlBar_0 = v21.FFlagAXShowHeadAdjustmentInRightControlBar;
local l_FFlagAXMigrateBuilderIcons_0 = v21.FFlagAXMigrateBuilderIcons;
local l_FFlagDynamicHeadsMigration_0 = v21.FFlagDynamicHeadsMigration;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v21.FFlagHeadRefinementFacialAnimationToggle;
local l_FFlagAXMoveContextualActionButtons_0 = v21.FFlagAXMoveContextualActionButtons;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v88 = require(l_Modules_0.AvatarExperience.Common.Thunks.RemoveUnavailableEquippedAssets);
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v90 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXHideMenuOnScroll_0 = v21.FFlagAXHideMenuOnScroll;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v21.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXAvatarTimeoutFlow_0 = v21.FFlagAXAvatarTimeoutFlow;
local v95 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local v97 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local l_IconOnlyMenu_0 = v97.IconOnlyMenu;
local l_MenuItemEnum_0 = v97.Enums.MenuItemEnum;
local v100 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.ContextualActions.ContextualActions);
local l_IconName_0 = v12.Enums.IconName;
local v102 = if l_FFlagAXFixManageOutfitPageFocusLostBehind_0 then {
    [l_AvatarScreen_0.UpdateOutfitPage] = true, 
    [l_AvatarScreen_0.ManageOutfitPage] = true, 
    [l_AvatarScreen_0.OutfitDetails] = true
} else {
    [l_AvatarScreen_0.UpdateOutfitPage] = true, 
    [l_AvatarScreen_0.ManageOutfitPage] = true
};
local v103 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v104 = v34.PeekHeaderHeight + (v66() and 0 or v34.MainNavHeight) + v34.SubNavHeight;
local v105 = if not not v74() or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v34.PeekHeaderHeight + v34.CatalogMainNavHeight else nil;
local v106 = l_GuiService_0:IsTenFootInterface();
local function v111(v107) --[[ Line: 181 ]] --[[ Name: selectQuickItemsVisible ]]
    -- upvalues: l_PeekViewState_0 (copy)
    local l_ItemDetailsPeekView_0 = v107.AvatarExperience.Common.ItemDetailsPeekView;
    local v109 = l_ItemDetailsPeekView_0.viewState == l_PeekViewState_0.Full;
    local v110 = l_ItemDetailsPeekView_0.tryOnViewState == l_PeekViewState_0.Full;
    return not (l_ItemDetailsPeekView_0.tryOnManagerViewState == l_PeekViewState_0.Full) and not v109 and not v110;
end;
local v112 = v6.PureComponent:extend("AvatarExperienceView");
v112.defaultProps = {
    bottomBarEnabled = false, 
    isDisabled = false, 
    showRobuxBalance = true, 
    showMultiTryOnBottomBar = true, 
    showControlBar = true, 
    itemDetailsPeekViewRefs = {}
};
local function v118(v113, v114) --[[ Line: 247 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v65 (copy)
    local v115 = v113.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v116 = v114.topBar and v113.TopBar.topBarHeight or 0;
    local v117 = if v65() then v114.topBar and v113.TopBar.statusBarHeight or 0 else nil;
    return {
        globalGuiInset = v113.GlobalGuiInset, 
        isPortrait = v115, 
        screenSize = v113.ScreenSize, 
        topBarHeight = v116, 
        tryOnItems = v113.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        lookId = v113.AvatarExperience.AvatarScene.OutfitTryOn.LookId, 
        statusBarHeight = if v65() then v117 else nil
    };
end;
local function v120(v119) --[[ Line: 301 ]] --[[ Name: mapValuesToProps ]]
    return {
        Size = UDim2.new(0, v119.width, 0, v119.height)
    };
end;
v112.init = function(v121) --[[ Line: 307 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), v6 (copy), v67 (copy), v66 (copy), v5 (copy), l_AvatarScreen_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v27 (copy), v34 (copy), v76 (copy)
    local v122, v123 = v121:calculateSceneSize();
    v121.state = {
        sceneShowing = true, 
        isVerticallyOffscreen = false, 
        animatedValues = {
            height = v122, 
            width = v123
        }, 
        bottomBarHeight = l_FFlagAXMISEnableMultiShopping_0 and 0 or nil
    };
    v121.navItemsFrameRef = v6.createRef();
    v121.sceneFrameRef = v6.createRef();
    v121.robuxBalanceRef = if v67 then v6.createRef() else nil;
    if v66() then
        local v124, v125 = v5.createBinding(nil);
        v121.quickButtonsZIndexBinding = v124;
        v121.setQuickButtonsZIndexBinding = v125;
        v121.onActiveControlBarMenuItemChanged = function(_, v127) --[[ Line: 327 ]]
            -- upvalues: v121 (copy)
            if v127 then
                v121.setQuickButtonsZIndexBinding(3);
                return;
            else
                v121.setQuickButtonsZIndexBinding(nil);
                return;
            end;
        end;
    end;
    v121.onTransitionComplete = function(v128) --[[ Line: 336 ]]
        -- upvalues: v121 (copy), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v27 (ref)
        local l_props_0 = v121.props;
        local l_name_0 = l_props_0.avatarRoute.current.name;
        local l_isPortrait_0 = l_props_0.isPortrait;
        local l_isSceneFullView_0 = l_props_0.isSceneFullView;
        local l_isUIFullView_0 = l_props_0.isUIFullView;
        local l_sceneShowing_0 = v121.state.sceneShowing;
        if l_isUIFullView_0 and l_isPortrait_0 and l_sceneShowing_0 then
            v121:setState({
                sceneShowing = false
            });
        end;
        if not l_isPortrait_0 and l_isSceneFullView_0 and l_name_0 == l_AvatarScreen_0.AvatarExperienceLandingPage then
            if not v121.state.isVerticallyOffscreen then
                v121:setState({
                    isVerticallyOffscreen = true
                });
            end;
        elseif v121.state.isVerticallyOffscreen then
            v121:setState({
                isVerticallyOffscreen = false
            });
        end;
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            local l_routeName_0 = l_props_0.navigation.state.routeName;
            local v136 = false;
            if l_routeName_0 == l_name_0 then
                v136 = not l_props_0.avatarRoute.isOverlayVisible;
            end;
            if v128 and v136 and l_props_0.lastInputGroup == v27.InputType.Gamepad and not l_isSceneFullView_0 then
                v128.captureFocus();
            end;
        end;
    end;
    v121.onNavItemsFrameResized = function(_) --[[ Line: 376 ]]
        -- upvalues: v121 (copy)
        if v121.sceneFrameRef.current then
            v121.onSceneResized(v121.sceneFrameRef.current);
        end;
    end;
    v121.onSceneResized = function(v138) --[[ Line: 384 ]]
        -- upvalues: v121 (copy), l_AvatarScreen_0 (ref), v34 (ref), v76 (ref)
        local l_current_0 = v121.navItemsFrameRef.current;
        if not l_current_0 then
            return;
        else
            local l_props_1 = v121.props;
            local l_name_1 = l_props_1.avatarRoute.current.name;
            local l_isDisabled_0 = l_props_1.isDisabled;
            local l_isPortrait_1 = l_props_1.isPortrait;
            local l_screenSize_0 = l_props_1.screenSize;
            local l_allowAdaptiveScrolling_0 = l_props_1.allowAdaptiveScrolling;
            local v146 = v121:getTopBarHeight();
            local v147 = v121.state.isVerticallyOffscreen or l_name_1 == l_AvatarScreen_0.AvatarExperienceLandingPage;
            if l_isPortrait_1 then
                if l_allowAdaptiveScrolling_0 then
                    l_current_0.Position = UDim2.new(0, 0, 0, v146);
                    l_current_0.Size = UDim2.new(1, 0, 1, -v146);
                    return;
                else
                    l_current_0.Position = UDim2.new(0, 0, 0, v138.AbsoluteSize.Y + v146);
                    l_current_0.Size = UDim2.new(1, 0, 1, -v138.AbsoluteSize.Y - v146);
                    return;
                end;
            else
                local v148 = l_isDisabled_0 and 1 or v34.LandscapeNavWidth;
                l_current_0.Size = UDim2.fromScale(v148, 1);
                local l_X_0 = l_current_0.AbsoluteSize.X;
                local v150 = l_screenSize_0.X - v138.AbsoluteSize.X;
                local v151 = 0;
                if v150 < l_X_0 then
                    v151 = if v76 then v150 - l_X_0 - v146 else v150 - l_X_0;
                end;
                if v147 then
                    l_current_0.Position = UDim2.fromOffset(0, l_screenSize_0.Y * (-v151 / l_X_0));
                    return;
                else
                    l_current_0.Position = UDim2.fromOffset(v151, 0);
                    return;
                end;
            end;
        end;
    end;
    v121.onBottomBarAbsoluteSizeChanged = l_FFlagAXMISEnableMultiShopping_0 and function(v152) --[[ Line: 431 ]]
        -- upvalues: v121 (copy)
        v121:setState({
            bottomBarHeight = v152.AbsoluteSize.Y
        });
    end or nil;
end;
v112.getTopBarHeight = function(v153) --[[ Line: 439 ]] --[[ Name: getTopBarHeight ]]
    return v153.props.topBarHeight;
end;
v112.instantResize = function(v154) --[[ Line: 444 ]] --[[ Name: instantResize ]]
    local l_current_1 = v154.sceneFrameRef.current;
    if not l_current_1 then
        return;
    else
        local v156, v157 = v154:calculateSceneSize();
        l_current_1.Size = UDim2.new(0, v157, 0, v156);
        v154.onSceneResized(l_current_1);
        return;
    end;
end;
v112.calculatePortraitSceneHeight = function(v158) --[[ Line: 456 ]] --[[ Name: calculatePortraitSceneHeight ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v34 (copy)
    local l_props_2 = v158.props;
    local l_globalGuiInset_0 = l_props_2.globalGuiInset;
    local l_screenSize_1 = l_props_2.screenSize;
    local l_isLandingPage_0 = l_props_2.isLandingPage;
    local l_Offset_0 = l_getSafeAreaSize_0(l_screenSize_1, l_globalGuiInset_0).Y.Offset;
    local v164 = l_Offset_0 * v34.PortraitSceneHeight;
    if l_isLandingPage_0 then
        v164 = l_Offset_0 * v34.LandingPagePortraitSceneHeight;
        if l_Offset_0 - v164 < v34.LandingPagePortraitMinItemsHeightPix then
            v164 = l_Offset_0 - v34.LandingPagePortraitMinItemsHeightPix;
        end;
    end;
    return v164;
end;
v112.calculateFullHeight = function(v165) --[[ Line: 479 ]] --[[ Name: calculateFullHeight ]]
    local l_props_3 = v165.props;
    local l_globalGuiInset_1 = l_props_3.globalGuiInset;
    local l_isPortrait_2 = l_props_3.isPortrait;
    local l_screenSize_2 = l_props_3.screenSize;
    local l_bottom_0 = l_globalGuiInset_1.bottom;
    local v171 = v165:getTopBarHeight();
    local v172 = l_isPortrait_2 and v171 or 0;
    return l_screenSize_2.Y - l_bottom_0 - v172;
end;
v112.calculateSceneSize = function(v173) --[[ Line: 490 ]] --[[ Name: calculateSceneSize ]]
    -- upvalues: v34 (copy)
    local l_props_4 = v173.props;
    local l_globalGuiInset_2 = l_props_4.globalGuiInset;
    local l_isDisabled_1 = l_props_4.isDisabled;
    local l_isSceneFullView_1 = l_props_4.isSceneFullView;
    local l_isPortrait_3 = l_props_4.isPortrait;
    local l_isUIFullView_1 = l_props_4.isUIFullView;
    local l_screenSize_3 = l_props_4.screenSize;
    local v181 = v173:getTopBarHeight();
    local l_bottom_1 = l_globalGuiInset_2.bottom;
    local l_left_0 = l_globalGuiInset_2.left;
    local v184 = l_isPortrait_3 and v181 or 0;
    local v185 = l_screenSize_3.Y - l_bottom_1;
    local v186 = (l_screenSize_3.X - l_left_0) * v34.LandscapeSceneWidth;
    local v187 = l_screenSize_3.X - l_left_0;
    local v188 = v173:calculatePortraitSceneHeight();
    local v189 = l_isPortrait_3 and v188 or v185;
    local v190 = l_isPortrait_3 and v187 or v186;
    if l_isUIFullView_1 and l_isPortrait_3 then
        v189 = 0;
    elseif l_isSceneFullView_1 then
        v190 = l_screenSize_3.X;
        v189 = l_screenSize_3.Y - l_bottom_1 - v184;
    end;
    if l_isDisabled_1 then
        v189 = 0;
        v190 = 0;
    end;
    return v189, v190;
end;
v112.isConsoleWithGamepad = function(v191) --[[ Line: 528 ]] --[[ Name: isConsoleWithGamepad ]]
    -- upvalues: v106 (copy), v27 (copy)
    local l_props_5 = v191.props;
    return v106 and l_props_5.lastInputGroup == v27.InputType.Gamepad;
end;
v112.renderSceneFrame = function(v193) --[[ Line: 533 ]] --[[ Name: renderSceneFrame ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_IsVRAppBuild_0 (copy), l_AvatarScreen_0 (copy), v6 (copy), l_SpringAnimatedItem_0 (copy), v120 (copy), v103 (copy), v41 (copy), v65 (copy), v71 (copy), v39 (copy), v40 (copy), v45 (copy), v10 (copy), l_Focusable_0 (copy)
    local l_props_6 = v193.props;
    local l_isDisabled_2 = l_props_6.isDisabled;
    local l_isSceneFullView_2 = l_props_6.isSceneFullView;
    local l_isUIFullView_2 = l_props_6.isUIFullView;
    local l_isPortrait_4 = l_props_6.isPortrait;
    local v199 = v193:getTopBarHeight();
    local l_name_2 = l_props_6.avatarRoute.opaque.name;
    local v201 = v193.state.sceneShowing or not l_isPortrait_4;
    if l_isDisabled_2 then
        v201 = false;
    end;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local l_forwardRef_0 = l_props_6.forwardRef;
        local v203 = not l_isSceneFullView_2 and not l_isUIFullView_2;
        if l_IsVRAppBuild_0() then
            v203 = v203 and l_name_2 ~= l_AvatarScreen_0.LayeredClothingSort;
        end;
        return v6.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, l_isPortrait_4 and v199 or 0), 
                ZIndex = -1, 
                [v6.Change.AbsoluteSize] = v193.onSceneResized, 
                [v6.Event.AncestryChanged] = v193.onSceneResized, 
                [v6.Ref] = v193.sceneFrameRef
            }, 
            animatedValues = v193.state.animatedValues, 
            mapValuesToProps = v120, 
            springOptions = v103, 
            onComplete = function() --[[ Line: 575 ]] --[[ Name: onComplete ]]
                -- upvalues: v193 (copy)
                v193.onTransitionComplete();
            end
        }, {
            SceneUIContainer = v6.createElement(v41, {
                globalGuiInset = v193.props.globalGuiInset, 
                statusBarHeight = if v65() then v193.props.statusBarHeight else nil, 
                changeViewFunction = l_props_6.changeViewFunction, 
                isVisible = v201, 
                row1ChildrenVisible = v203, 
                showRobuxBalance = l_props_6.showRobuxBalance, 
                [v6.Ref] = l_forwardRef_0
            }), 
            SceneInteractionFrame = if v71 then nil else if l_IsVRAppBuild_0() then nil else v6.createElement(v39), 
            AvatarLoadingSpinner = if l_IsVRAppBuild_0() then nil else v6.createElement(v40), 
            VRAvatarEditorNavBar = if l_IsVRAppBuild_0() then v6.createElement(v45, {
                currentPage = l_name_2, 
                navigation = l_props_6.navigation
            }) else nil, 
            SceneUi = l_props_6.sceneUi
        });
    else
        return v10.withFocusController(function(v204) --[[ Line: 605 ]]
            -- upvalues: l_props_6 (copy), l_isSceneFullView_2 (copy), l_isUIFullView_2 (copy), l_IsVRAppBuild_0 (ref), l_name_2 (copy), l_AvatarScreen_0 (ref), v6 (ref), l_SpringAnimatedItem_0 (ref), l_isPortrait_4 (copy), v199 (copy), v193 (copy), v120 (ref), v103 (ref), l_Focusable_0 (ref), v41 (ref), v65 (ref), v201 (ref), v71 (ref), v39 (ref), v40 (ref), v45 (ref)
            local l_forwardRef_1 = l_props_6.forwardRef;
            local v206 = not l_isSceneFullView_2 and not l_isUIFullView_2;
            if l_IsVRAppBuild_0() then
                v206 = v206 and l_name_2 ~= l_AvatarScreen_0.LayeredClothingSort;
            end;
            return v6.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                regularProps = {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 0, l_isPortrait_4 and v199 or 0), 
                    ZIndex = -1, 
                    [v6.Change.AbsoluteSize] = v193.onSceneResized, 
                    [v6.Event.AncestryChanged] = v193.onSceneResized, 
                    [v6.Ref] = v193.sceneFrameRef
                }, 
                animatedValues = v193.state.animatedValues, 
                mapValuesToProps = v120, 
                springOptions = v103, 
                onComplete = function() --[[ Line: 633 ]] --[[ Name: onComplete ]]
                    -- upvalues: v193 (ref), v204 (copy)
                    v193.onTransitionComplete(v204);
                end
            }, {
                SceneUIContainer = v6.createElement(l_Focusable_0[v41], {
                    globalGuiInset = v193.props.globalGuiInset, 
                    statusBarHeight = if v65() then v193.props.statusBarHeight else nil, 
                    changeViewFunction = l_props_6.changeViewFunction, 
                    isVisible = v201, 
                    row1ChildrenVisible = v206, 
                    showRobuxBalance = l_props_6.showRobuxBalance, 
                    [v6.Ref] = l_forwardRef_1, 
                    NextSelectionDown = l_props_6.NextSelectionDown, 
                    NextSelectionLeft = l_props_6.NextSelectionLeft, 
                    NextSelectionUp = l_props_6.NextSelectionUp
                }), 
                SceneInteractionFrame = if v71 then nil else if l_IsVRAppBuild_0() then nil else v6.createElement(v39), 
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
v112.renderWithStyle = function(v207, _) --[[ Line: 667 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v66 (copy), l_FFlagAXEnableManualSaving_0 (copy), v74 (copy), l_AvatarScreen_0 (copy), v105 (copy), v104 (copy), v4 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v6 (copy), v48 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), v5 (copy), l_TimeoutBanner_0 (copy), v12 (copy), l_SaveButton_0 (copy), v61 (copy), v43 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v34 (copy), v57 (copy), l_FFlagAXResetAvatarButton_0 (copy), v69 (copy), v56 (copy), v67 (copy), v14 (copy), l_FFlagAXShowHeadAdjustmentInRightControlBar_0 (copy), v49 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), l_IconOnlyMenu_0 (copy), l_MenuItemEnum_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_IconName_0 (copy), v100 (copy), l_UndoRedoBar_0 (copy), l_IsVRAppBuild_0 (copy), v47 (copy), v38 (copy), v22 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), v77 (copy), l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 (copy), v44 (copy), v55 (copy), v36 (copy), l_CheckoutActionBarContainer_0 (copy), v71 (copy), v39 (copy)
    local l_props_7 = v207.props;
    local l_allowAdaptiveScrolling_1 = l_props_7.allowAdaptiveScrolling;
    local l_bottomBarEnabled_0 = l_props_7.bottomBarEnabled;
    local l_globalGuiInset_3 = l_props_7.globalGuiInset;
    local l_isPortrait_5 = l_props_7.isPortrait;
    local v214 = v207:getTopBarHeight();
    local l_tokens_0 = l_props_7.tokens;
    local v216 = if v66() then l_props_7.showUndoRedo else nil;
    local v217 = if v66() and l_FFlagAXEnableManualSaving_0 then l_props_7.showSaveButton else nil;
    local v218 = not l_bottomBarEnabled_0 and l_globalGuiInset_3.bottom > 0;
    local v219 = v207:calculateSceneSize();
    local l_avatarRoute_0 = l_props_7.avatarRoute;
    local v221 = nil;
    if v74() then
        v221 = if l_props_7.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog then v105 else v104;
    end;
    local v222 = not v4.isEmpty(l_props_7.tryOnItems) and (not l_props_7.isSceneFullView or false);
    if l_props_7.lookId ~= nil then
        if l_FFlagAXMISEnableMultiShopping_0 then
            local v223 = false;
            if l_avatarRoute_0.opaque.name ~= l_AvatarScreen_0.MySharedAvatars then
                v223 = v222;
            end;
            v222 = v223;
        else
            v222 = false;
        end;
    end;
    v222 = not not l_props_7.showMultiTryOnBottomBar and v222;
    local v224 = nil;
    local v225 = nil;
    if l_allowAdaptiveScrolling_1 then
        v224 = v207:calculateFullHeight();
        v225 = v224 - v207:calculatePortraitSceneHeight();
    end;
    local v226 = {
        TopBar = not l_isPortrait_5 and l_props_7.topBar, 
        Items = v6.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1, l_isPortrait_5 and 0 or -v214), 
            ZIndex = 2
        }, if l_allowAdaptiveScrolling_1 and l_isPortrait_5 then {
            AdaptiveScrollingView = v6.createElement(v48, {
                fullHeight = v224, 
                midHeight = v225, 
                alwaysShowingHeight = if v74() then v221 else v104, 
                topBarHeight = l_props_7.topBarHeight, 
                fullHeightOptions = if l_props_7.adaptiveScrollingProps then l_props_7.adaptiveScrollingProps.fullHeightOptions else nil, 
                enableExpandPeekViewOnUpwardScroll = if l_FFlagAXExpandPeekViewOnFirstScroll_0 and l_props_7.adaptiveScrollingProps then l_props_7.adaptiveScrollingProps.enableExpandPeekViewOnUpwardScroll else nil, 
                disableViewChangeByScroll = if l_FFlagAXSlotsPeekViewScrollFix_0 then l_props_7.disableScrollViewBindings else nil, 
                enableAnimatedVisibility = if l_FFlagAXHideMenuOnScroll_0 and l_props_7.adaptiveScrollingProps then l_props_7.adaptiveScrollingProps.enableAnimatedVisibility else nil, 
                banner = if l_FFlagAXAvatarTimeoutFlow_0 then v5.createElement(l_TimeoutBanner_0) else nil
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
                Banner = if l_FFlagAXAvatarTimeoutFlow_0 then v5.createElement(l_TimeoutBanner_0) else nil, 
                Content = v6.createElement(v12.View, {
                    tag = "size-full-full", 
                    LayoutOrder = 1
                }, l_props_7.children)
            })
        } else l_props_7.children)
    };
    local v227 = v207:renderSceneFrame();
    local v228 = nil;
    if v66() and l_tokens_0 then
        local v229 = v207:calculatePortraitSceneHeight();
        local v230 = UDim2.new(1, -l_tokens_0.Size.Size_500, 0, v229 + v214 - l_tokens_0.Size.Size_400);
        if not l_isPortrait_5 then
            local l_Size_500_0 = l_tokens_0.Size.Size_500;
            if l_FFlagAXMISEnableMultiShopping_0 then
                local l_bottomBarHeight_0 = v207.state.bottomBarHeight;
                if l_props_7.isTryingOnItems and l_bottomBarHeight_0 then
                    l_Size_500_0 = l_Size_500_0 + l_bottomBarHeight_0;
                end;
            elseif l_props_7.isTryingOnItems and l_props_7.multiTryOnBottomBarRef and l_props_7.multiTryOnBottomBarRef.current then
                l_Size_500_0 = l_Size_500_0 + l_props_7.multiTryOnBottomBarRef.current.AbsoluteSize.Y;
            end;
            v230 = UDim2.new(1, -l_tokens_0.Size.Size_500, 1, -l_Size_500_0);
        end;
        v228 = v6.createElement(v12.View, {
            tag = "auto-xy anchor-bottom-right row", 
            Position = v230
        }, {
            SaveButton = if not v217 or l_props_7.isSceneFullView then nil else v6.createElement(l_SaveButton_0, {}), 
            FullViewEntryButton = if not l_props_7.isSceneFullView or l_isPortrait_5 then nil else v5.createElement(v61, {
                isUIFullView = l_props_7.isUIFullView, 
                isSceneFullView = l_props_7.isSceneFullView, 
                changeViewFunction = l_props_7.changeViewFunction
            })
        });
    else
        v228 = if l_allowAdaptiveScrolling_1 and l_isPortrait_5 then nil else v6.createElement(v43, {
            sceneHeight = v219, 
            isUIFullView = l_props_7.isUIFullView, 
            isSceneFullView = l_props_7.isSceneFullView, 
            changeViewFunction = l_props_7.changeViewFunction, 
            ZIndex = 3
        });
    end;
    local v233 = nil;
    v233 = if v66() and l_tokens_0 then v5.createElement(v12.View, {
        tag = "auto-xy col gap-small", 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef, 
        SelectionGroup = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
        Position = if l_isPortrait_5 then UDim2.fromOffset(l_tokens_0.Size.Size_500, v214) else UDim2.new(v34.LandscapeNavWidth, l_tokens_0.Size.Size_700, 0, v214), 
        Visible = not l_props_7.isSceneFullView, 
        ZIndex = v207.quickButtonsZIndexBinding
    }, {
        ControlBar = v5.createElement(v57, {
            isUIFullView = l_props_7.isUIFullView, 
            isSceneFullView = l_props_7.isSceneFullView, 
            showControlBar = l_props_7.showControlBar, 
            showUndoRedo = v216 and (l_FFlagAXResetAvatarButton_0 and true or not l_isPortrait_5), 
            onActiveMenuItemChanged = v207.onActiveControlBarMenuItemChanged, 
            NextSelectionLeft = l_props_7.defaultChildRef, 
            focusAnimation = if v69 and l_props_7.controlBarFocusAnimation then l_props_7.controlBarFocusAnimation else nil, 
            LayoutOrder = 1
        })
    }) else v6.createElement(v56, {
        isUIFullView = l_props_7.isUIFullView, 
        isSceneFullView = l_props_7.isSceneFullView, 
        ref = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.defaultChildRef
    });
    local v234 = nil;
    if v67 and v207.props.showRobuxBalance and v207.props.tokens then
        local l_Size_700_0 = v207.props.tokens.Size.Size_700;
        if l_isPortrait_5 then
            l_Size_700_0 = v207.props.tokens.Size.Size_500;
        elseif v207.props.preferredInput == v14.Input.Directional then
            l_Size_700_0 = v207.props.tokens.Size.Size_200;
        end;
        local v236 = "auto-xy anchor-top-right";
        if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v236 = v236 .. " col gap-small align-x-right";
        end;
        v234 = v5.createElement(v12.View, {
            tag = v236, 
            Position = UDim2.new(1, -l_Size_700_0, 0, v207.props.isSpatial and 0 or v207.props.topBarHeight)
        }, {
            RobuxBalance = if not l_props_7.isSceneFullView then v5.createElement(v49, {
                ref = v207.robuxBalanceRef, 
                NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_props_7.quickButtonsRef
            }) else nil, 
            WhiteSpace = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v5.createElement(v12.View, {
                Size = UDim2.new(1, 0, 0, v207.props.tokens.Size.Size_1300), 
                LayoutOrder = 2
            }) else nil, 
            HeadAdjustmentButton = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 and v207.props.supportsHeadShapes then v5.createElement(l_IconOnlyMenu_0, {
                LayoutOrder = 3, 
                items = {
                    {
                        type = "icon", 
                        id = l_MenuItemEnum_0.AvatarRefinement.CustomizeHead, 
                        icon = if l_FFlagAXMigrateBuilderIcons_0 then l_IconName_0.HeadBlank else "icons/menu/clothing/classicHead_off", 
                        iconSize = v207.props.tokens.Size.Size_600, 
                        onActivated = v207.props.onCustomizeHeadActivated
                    }
                }
            }) else nil
        });
    end;
    local v237 = nil;
    if l_FFlagAXMoveContextualActionButtons_0 and l_tokens_0 then
        local v238 = v207:calculatePortraitSceneHeight() / 2 + v214;
        v237 = v5.createElement(v12.View, {
            tag = "auto-xy anchor-center-right", 
            Position = UDim2.new(1, -l_tokens_0.Size.Size_500, 0, v238)
        }, {
            ContextualActions = if v207.props.isPortrait then v5.createElement(v100, {
                LayoutOrder = 1
            }) else nil
        });
    end;
    local v239 = nil;
    if v66() and l_tokens_0 then
        local v240 = v216 and not l_props_7.isSceneFullView and l_isPortrait_5 and not l_FFlagAXResetAvatarButton_0;
        local v241 = v207:calculatePortraitSceneHeight();
        local v242 = UDim2.fromOffset(l_tokens_0.Size.Size_500, v241 + v214 - l_tokens_0.Size.Size_400);
        if not l_isPortrait_5 then
            local l_Size_500_1 = l_tokens_0.Size.Size_500;
            if l_FFlagAXMISEnableMultiShopping_0 then
                local l_bottomBarHeight_1 = v207.state.bottomBarHeight;
                if l_props_7.isTryingOnItems and l_bottomBarHeight_1 then
                    l_Size_500_1 = l_Size_500_1 + l_bottomBarHeight_1;
                end;
            elseif l_props_7.isTryingOnItems and l_props_7.multiTryOnBottomBarRef and l_props_7.multiTryOnBottomBarRef.current then
                l_Size_500_1 = l_Size_500_1 + l_props_7.multiTryOnBottomBarRef.current.AbsoluteSize.Y;
            end;
            v242 = UDim2.new(v34.LandscapeNavWidth, l_tokens_0.Size.Size_500, 1, -l_Size_500_1);
        end;
        v239 = v5.createElement(v12.View, {
            tag = "auto-xy anchor-bottom-left", 
            Position = v242
        }, {
            UndoRedoBarPortrait = if v240 then v5.createElement(l_UndoRedoBar_0) else nil
        });
    end;
    local v245 = nil;
    v245 = if l_IsVRAppBuild_0() then v6.createElement(v47, {
        roundedCornersFrame = false, 
        panelPlacement = "Center"
    }, {
        SceneFrame = v227, 
        QuickButtons = v233, 
        BottomRightButtons = v228, 
        GamepadHandler = if l_avatarRoute_0.current.name ~= l_AvatarScreen_0.LayeredClothingSort then v6.createElement(v38) else nil, 
        TopRightButtons = if v67 then v234 else nil, 
        MiddleRightButtons = if l_FFlagAXMoveContextualActionButtons_0 then v237 else nil, 
        BottomLeftButtons = if v66() then v239 else nil
    }) else v6.createFragment({
        SceneFrame = v227, 
        QuickButtons = v233, 
        BottomRightButtons = v228, 
        TopRightButtons = if v67 then v234 else nil, 
        MiddleRightButtons = if l_FFlagAXMoveContextualActionButtons_0 then v237 else nil, 
        BottomLeftButtons = if v66() then v239 else nil
    });
    local v246 = v22.fieldCount(l_props_7.tryOnItems) > 1;
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
        }, v226) else v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            ZIndex = (not l_isPortrait_5 or l_allowAdaptiveScrolling_1) and 2 or nil, 
            [v6.Change.AbsoluteSize] = v207.onNavItemsFrameResized, 
            [v6.Ref] = v207.navItemsFrameRef, 
            Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v207.props.isItemFrameVisible else nil
        }, v226), 
        OverlayedUI = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then if v77 then v5.createElement("Frame", {
            ref = l_props_7.quickButtonsRef, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_7.isQuickButtonsVisible, 
            SelectionGroup = l_FFlagAXMigrateQuickButtonsToGlobalAutoFocus_0 and true or nil
        }, v245) else if l_props_7.isQuickButtonsVisible then v5.createElement("Frame", {
            ref = l_props_7.quickButtonsRef, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v245) else nil else v245, 
        BottomInsetBackground = if v218 then v6.createElement(v44, {
            globalGuiInset = l_globalGuiInset_3
        }) else nil, 
        MultiTryOnBottomBar = if l_FFlagAXMISEnableMultiShopping_0 and v246 then nil else v6.createElement(v55, {
            bottomBarRef = l_props_7.multiTryOnBottomBarRef, 
            NextSelectionLeft = l_props_7.namedRefs[l_props_7.avatarRoute.opaque.name .. v36.ItemsList], 
            Visible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_props_7.isOpaqueRouteMatchingCurrentRoute and v222 else v222, 
            isConsoleWithGamepad = v207:isConsoleWithGamepad(), 
            itemDetailsPeekViewRefs = l_props_7.itemDetailsPeekViewRefs, 
            onAbsoluteSizeChanged = if l_FFlagAXMISEnableMultiShopping_0 then v207.onBottomBarAbsoluteSizeChanged else nil
        }), 
        CheckoutActionBar = if l_FFlagAXMISEnableMultiShopping_0 and l_props_7.isOpaqueRouteMatchingCurrentRoute and v246 then v5.createElement(l_CheckoutActionBarContainer_0, {
            ref = l_props_7.multiTryOnBottomBarRef, 
            onAbsoluteSizeChanged = v207.onBottomBarAbsoluteSizeChanged, 
            Visible = v222
        }) else nil, 
        FullSceneInteractionFrame = if v71 then if v207.props.isSpatial then nil else v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = -2
        }, {
            SceneInteractionFrame = v6.createElement(v39)
        }) else nil
    });
end;
v112.render = function(v247) --[[ Line: 1090 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v6 (copy), v37 (copy)
    return l_withStyle_0(function(v248) --[[ Line: 1091 ]]
        -- upvalues: v6 (ref), v37 (ref), v247 (copy)
        return v6.createElement(v37, nil, {
            AvatarExperienceView = v247:renderWithStyle(v248)
        });
    end);
end;
v112.didUpdate = function(v249, v250) --[[ Line: 1098 ]] --[[ Name: didUpdate ]]
    local l_props_8 = v249.props;
    local l_isUIFullView_3 = l_props_8.isUIFullView;
    local l_sceneShowing_1 = v249.state.sceneShowing;
    if not l_isUIFullView_3 and not l_sceneShowing_1 then
        v249:setState({
            sceneShowing = true
        });
    end;
    local l_isPortrait_6 = v250.isPortrait;
    local l_isPortrait_7 = l_props_8.isPortrait;
    if l_isPortrait_7 ~= l_isPortrait_6 then
        if l_isPortrait_7 and l_isUIFullView_3 then
            v249:setState({
                sceneShowing = false
            });
        elseif not l_isPortrait_6 and l_isUIFullView_3 then
            v249:setState({
                sceneShowing = true
            });
        end;
        v249:instantResize();
    end;
    if l_props_8.isDisabled then
        v249:instantResize();
    end;
    if l_props_8.screenSize ~= v250.screenSize then
        v249:instantResize();
    end;
    if l_props_8.topBarHeight ~= v250.topBarHeight then
        v249:instantResize();
    end;
    local v256, v257 = v249:calculateSceneSize();
    if v256 ~= v249.state.animatedValues.height or v257 ~= v249.state.animatedValues.width then
        v249:setState({
            animatedValues = {
                height = v256, 
                width = v257
            }
        });
    end;
end;
v112.didMount = function(v258) --[[ Line: 1151 ]] --[[ Name: didMount ]]
    v258:instantResize();
    local v259, v260 = v258:calculateSceneSize();
    v258:setState({
        animatedValues = {
            height = v259, 
            width = v260
        }
    });
end;
v112 = v46((v9.connect(v118, nil)(v112)));
v112 = v32((v42((v8.withNavigation(v112)))));
v112 = v62.connectTestVariables({
    universalAppCameraEnabled = v90.EnabledForUser
})(v112);
local function v262(v261) --[[ Line: 1178 ]] --[[ Name: selectTryingOnItems ]]
    -- upvalues: v4 (copy)
    return not v4.isEmpty(v261.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
local function v284(v263) --[[ Line: 1183 ]] --[[ Name: selectEquippedDynamicHeadAndTryOnBundle ]]
    -- upvalues: v34 (copy), v95 (copy), l_FFlagDynamicHeadsMigration_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
    local v264 = nil;
    local v265 = nil;
    local v266 = v263.AvatarExperience and v263.AvatarExperience.AvatarEditor and v263.AvatarExperience.AvatarEditor.Character and v263.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if v266 and v266[v34.AssetTypeIdStrings.DynamicHead] then
        v264 = next(v266[v34.AssetTypeIdStrings.DynamicHead]);
    end;
    local v267 = v263.AvatarExperience and v263.AvatarExperience.Common and v263.AvatarExperience.Common.AssetInfos;
    if v264 and v267 then
        v265 = v267[v264];
    end;
    local v268, _ = v95(v263, v34.AssetTypeIdStrings.DynamicHead);
    local v270 = nil;
    if v268 and v267 then
        v270 = v267[v268];
    end;
    local v271 = false;
    if l_FFlagDynamicHeadsMigration_0 then
        local v272 = v263.AvatarExperience.AvatarScene.OutfitTryOn and v263.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v273 = nil;
        local v274 = nil;
        local l_LookId_0 = v263.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
        if v272 and v268 then
            for _, v277 in v272 do
                if v277.itemType == v34.ItemType.Bundle and v277.bundleInfo then
                    if v277.bundleInfo[v268] then
                        v273 = v277.itemId;
                        v274 = v277;
                        break;
                    end;
                elseif v277.itemType == v34.ItemType.Asset and v277.itemId == v268 then
                    v273 = v277.itemId;
                    v274 = v277;
                    break;
                end;
            end;
        end;
        local v278 = v263.AvatarExperience and v263.AvatarExperience.Common and v263.AvatarExperience.Common.BundleInfos;
        local v279 = nil;
        if v273 and v278 then
            v279 = v278[v273];
        end;
        local v280 = nil;
        if v274 and v274.itemSubType == v34.BundleTypeIdStrings.DynamicHead and v274.bundleInfo then
            for v281, _ in v274.bundleInfo do
                local v283 = if v267 then v267[v281] else nil;
                if v283 and v283.supportsHeadShapes == true then
                    v280 = true;
                    break;
                end;
            end;
        end;
        if v270 and v270.supportsHeadShapes ~= nil then
            v271 = v270.supportsHeadShapes;
        elseif v279 and v279.supportsHeadShapes ~= nil then
            v271 = v279.supportsHeadShapes;
        elseif v280 ~= nil then
            v271 = v280;
        elseif v268 == nil and v265 and v265.supportsHeadShapes ~= nil then
            v271 = v265.supportsHeadShapes;
        elseif l_LookId_0 then
            v271 = false;
        end;
    elseif v270 then
        v271 = v270.supportsHeadShapes ~= nil and v270.supportsHeadShapes;
    elseif v265 then
        v271 = v265.supportsHeadShapes ~= nil and v265.supportsHeadShapes;
    end;
    return {
        equippedDynamicHeadId = v264, 
        equippedDynamicHeadInfo = v265, 
        tryOnAssetId = v268, 
        tryOnDynamicHeadAssetInfo = v270, 
        supportsHeadShapes = v271, 
        hasDynamicHead = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v264 ~= nil or v268 ~= nil else nil
    };
end;
return v6.forwardRef(function(v285, v286) --[[ Line: 1321 ]]
    -- upvalues: l_FFlagAXShowHeadAdjustmentInRightControlBar_0 (copy), l_useNavigation_0 (copy), v67 (copy), v66 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), l_useTokens_0 (copy), v14 (copy), l_useSelector_0 (copy), v262 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXMoveContextualActionButtons_0 (copy), v284 (copy), v69 (copy), v5 (copy), v35 (copy), l_useSlotCustomizeFtux_0 (copy), l_AvatarScreen_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), l_MenuItemEnum_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useAvatarRoute_0 (copy), v102 (copy), v111 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_useDispatch_0 (copy), l_useAvatarSaveContext_0 (copy), l_useEffectOnMount_0 (copy), v88 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v6 (copy), v112 (ref), v4 (copy)
    local v287 = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useNavigation_0() else nil;
    local v288 = if not not v67 or v66() or l_FFlagAXAvatarTimeoutFlow_0 then l_useTokens_0() else nil;
    local v289 = if v67 then v14.useIsSpatial() else nil;
    local v290 = if v67 then v14.usePreferredInput() else nil;
    local v291 = if v66() then l_useSelector_0(v262, l_getUseSelectorDeepEquals_0()) else nil;
    local v292 = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then l_useSelector_0(v284) else nil;
    local v293 = nil;
    if v69 then
        local v295 = v5.useCallback(function(v294) --[[ Line: 1342 ]]
            -- upvalues: v35 (ref)
            return v294 ~= v35.SceneFullView;
        end, {});
        v293 = l_useSlotCustomizeFtux_0(v295);
    end;
    local v296 = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v5.useCallback(function() --[[ Line: 1350 ]]
        -- upvalues: v287 (ref), l_AvatarScreen_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), l_MenuItemEnum_0 (ref)
        v287.navigate(l_AvatarScreen_0.HeadRefinement);
        l_SlotBasedEditorAnalytics_0.trackAdvancedCustomizationControlBarClick(l_MenuItemEnum_0.AvatarRefinement.CustomizeHead);
    end, {
        v287
    }) else nil;
    local v297 = nil;
    local v298 = nil;
    local v299 = nil;
    local v300 = nil;
    local v301 = nil;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v300 = v5.useRef(nil);
        local v302 = v5.useRef(nil);
        v299 = v285.quickButtonsRef or v302;
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v287 = l_useNavigation_0();
        end;
        local v303 = l_useAvatarRoute_0();
        local v304 = if v287 and v287.state then v287.state.routeName else nil;
        local l_name_3 = v303.opaque.name;
        local l_name_4 = v303.current.name;
        local v307 = false;
        if v304 == l_name_3 then
            v307 = not v102[l_name_4];
        end;
        v301 = v307;
        v298 = l_useSelector_0(v111);
        v297 = v304 == l_name_4;
        l_useFocusNavigableSurfaceRegistryConnection_0(v300.current, l_FocusNavigableSurfaceIdentifierEnum_0.SubRouterView, v301);
        l_useFocusNavigableSurfaceRegistryConnection_0(v299.current, l_FocusNavigableSurfaceIdentifierEnum_0.Auxiliary, v298);
    end;
    if l_FFlagAXMISEnableMultiShopping_0 then
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v287 = l_useNavigation_0();
        end;
        local v308 = l_useAvatarRoute_0();
        local v309 = v287 and v287.state and v287.state.routeName;
        local v310 = v308 and v308.current and v308.current.name;
        v297 = v309 and v309 == v310;
    end;
    if l_FFlagAXModeratedItemsFlow_0 then
        if not l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
            v287 = l_useNavigation_0();
        end;
        local v311 = l_useDispatch_0();
        local v312 = l_useAvatarSaveContext_0();
        local l_v311_0 = v311 --[[ copy: 15 -> 21 ]];
        l_useEffectOnMount_0(function() --[[ Line: 1409 ]]
            -- upvalues: l_v311_0 (copy), v88 (ref), v287 (ref), v312 (copy)
            l_v311_0(v88(v287, v312.trySaveAvatar));
        end);
    end;
    local v314 = nil;
    if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then
        v314 = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v292 and v292.hasDynamicHead else if v292 then v292.supportsHeadShapes or false else false;
    end;
    return v6.createElement(v112, v4.Dictionary.join(v285, {
        forwardRef = v286, 
        tokens = v288, 
        isSpatial = v289, 
        navigation = if l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v287 else nil, 
        onCustomizeHeadActivated = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v296 else nil, 
        supportsHeadShapes = if not l_FFlagAXMoveContextualActionButtons_0 and l_FFlagAXShowHeadAdjustmentInRightControlBar_0 then v314 else nil, 
        preferredInput = v290, 
        isTryingOnItems = v291, 
        controlBarFocusAnimation = if v69 then v293 else nil, 
        itemFrameRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v300 else nil, 
        quickButtonsRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v299 else nil, 
        isQuickButtonsVisible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v298 else nil, 
        isOpaqueRouteMatchingCurrentRoute = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMISEnableMultiShopping_0 then v297 else nil, 
        isItemFrameVisible = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v301 else nil
    }));
end);