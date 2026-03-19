local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v9.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v9.AvatarRoute.Hooks.useAvatarRoute;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = v12.FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_selectColorAdjustmentButtonColor_0 = v14.State.Selectors.selectColorAdjustmentButtonColor;
local v16 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v14.State.Selectors.selectShowColorQuickButton else require(l_Modules_0.AvatarExperience.Common.Selectors.selectShowColorQuickButton);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useNavigationFocus_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigationFocus;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v22 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_selectTopBarHeight_0 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar).selectTopBarHeight;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v26 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory);
local v27 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAccessoryAdjustmentQuickButtonDuringTryOn);
local v28 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementEntryButton);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.ColorAdjustmentEntryButton);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.AccessoryAdjustmentEntryButton);
local v31 = require(l_Modules_0.AvatarExperience.UniversalAppCamera.Components.UniversalAppCameraToggle);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.AXProfilePictureQuickButton);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v37 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v38 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v39 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v14.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP);
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local l_FFlagAXCatalogCategoriesStore_0 = v12.FFlagAXCatalogCategoriesStore;
local v44 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local function v46(v45) --[[ Line: 93 ]] --[[ Name: ProfilePictureQuickButton ]]
    -- upvalues: v3 (copy), v32 (copy)
    return v3.createElement(v32, {
        isUIFullView = v45.isUIFullView, 
        isSceneFullView = v45.isSceneFullView, 
        layoutOrder = v45.layoutOrder, 
        ref = v45.profilePictureButtonRef, 
        NextSelectionLeft = v45.NextSelectionLeft, 
        NextSelectionDown = v45.refinementButtonsRef
    });
end;
local function v53(v47) --[[ Line: 104 ]] --[[ Name: RefinementEntryQuickButton ]]
    -- upvalues: l_useAvatarRoute_0 (copy), v41 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_AvatarScreenProperties_0 (copy), v37 (copy), v38 (copy), v3 (copy), v28 (copy)
    local v48 = l_useAvatarRoute_0();
    local v49 = nil;
    if v41() then
        v49 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    end;
    local v50 = l_AvatarScreenProperties_0[v48.opaque.name];
    local v51 = if v50 then not v50.isRefinementPage else false;
    local v52 = if v41() then not v49 else v37.useTestVariables(v38.EnabledForUser);
    return v51 and v3.createElement(v28, {
        layoutOrder = v47.layoutOrder, 
        ref = v47.refinementButtonsRef, 
        NextSelectionUp = if v52 then v47.profilePictureButtonRef else nil, 
        NextSelectionLeft = v47.NextSelectionLeft, 
        NextSelectionDown = v47.NextSelectionDown
    });
end;
local function v58(v54) --[[ Line: 130 ]] --[[ Name: CameraQuickButton ]]
    -- upvalues: v37 (copy), v39 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v44 (copy), l_useSignalState_0 (copy), l_IsVRAppBuild_0 (copy), v3 (copy), v31 (copy)
    local v55 = v37.useTestVariables(v39.EnabledForUser);
    local v56 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v57 = v44.getCatalogSelectionStore();
        v56 = l_useSignalState_0(v57.selectedCategoryInfo);
    end;
    if v55 and not l_IsVRAppBuild_0() then
        return (v3.createElement(v31, {
            isUIFullView = v54.isUIFullView, 
            isSceneFullView = v54.isSceneFullView, 
            layoutOrder = v54.layoutOrder, 
            selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStore_0 then v56 else nil
        }));
    else
        return nil;
    end;
end;
return (v3.forwardRef(function(v59, v60) --[[ Line: 150 ]]
    -- upvalues: l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_useTokens_0 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useNavigationFocus_0 (copy), v41 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v8 (copy), v22 (copy), l_useSelector_0 (copy), v23 (copy), l_getUseSelectorDeepEquals_0 (copy), l_selectTopBarHeight_0 (copy), v16 (copy), l_selectColorAdjustmentButtonColor_0 (copy), v3 (copy), l_AvatarScreen_0 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v27 (copy), v26 (copy), v7 (copy), v37 (copy), v38 (copy), v4 (copy), v46 (copy), v2 (copy), v53 (copy), v58 (copy), v29 (copy), v30 (copy)
    local v61 = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then l_useTokens_0() else nil;
    local v62 = l_useAvatarRoute_0();
    local v63 = l_useNavigation_0();
    local v64 = l_useDispatch_0();
    local v65 = l_useNavigationFocus_0();
    local v66 = nil;
    if v41() then
        v66 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    end;
    local l_name_0 = v62.opaque.name;
    local v68 = v8.isAvatarSceneButtonsVisible(v62, v65, v59.isUIFullView, v59.isSceneFullView, v63);
    local v70 = v22(function(v69) --[[ Line: 171 ]]
        return v69.getAllowCameraMovements();
    end);
    local v71 = l_useSelector_0(v23, l_getUseSelectorDeepEquals_0());
    local v72 = l_useSelector_0(l_selectTopBarHeight_0, l_getUseSelectorDeepEquals_0());
    local v73 = l_useSelector_0(v16, l_getUseSelectorDeepEquals_0());
    local v74 = l_useSelector_0(l_selectColorAdjustmentButtonColor_0, l_getUseSelectorDeepEquals_0());
    local v75 = v3.useCallback(function() --[[ Line: 180 ]]
        -- upvalues: v63 (copy), l_AvatarScreen_0 (ref)
        v63.navigate(l_AvatarScreen_0.ColorAdjustment);
    end, {
        v63
    });
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then
        local v79 = v27();
        v76 = v79.shouldEnableAccessoryAdjustmentDuringTryOn;
        v77 = v79.adjustableLastTryOnItemId;
        v78 = v79.accessoryAdjustmentQuickButtonFtux;
    end;
    local v80 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v3.useCallback(function() --[[ Line: 195 ]]
        -- upvalues: v78 (ref), v63 (copy), l_AvatarScreen_0 (ref), l_name_0 (copy), v64 (copy), v26 (ref), v77 (ref)
        if v78 and v78.shouldShowFirstTimeGlow() then
            v78.completeFirstTimeGlow();
        end;
        v63.navigate(l_AvatarScreen_0.AdjustAccessoryView, {
            fromRoute = l_name_0
        });
        v64(v26(v77));
    end, {
        v63, 
        v77, 
        l_name_0, 
        v78
    }) else nil;
    local v81 = v71 and 0 or v7.LandscapeNavWidth;
    local v82 = if v41() then not v66 else v37.useTestVariables(v38.EnabledForUser);
    local v83 = v3.useRef(nil);
    local v84 = v3.useRef(nil);
    local v85 = v3.useRef(nil);
    local v86 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v3.useRef(nil) else nil;
    local v87 = if v82 and (not (l_name_0 ~= l_AvatarScreen_0.AvatarEditor) or l_name_0 == l_AvatarScreen_0.Catalog) then v83 else v84;
    local v88 = 24;
    if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and l_name_0 == l_AvatarScreen_0.SearchLandingFocusedWidgetPage and v61 and v71 then
        v88 = v61.Size.Size_400;
    end;
    return v3.createElement(v4.Focusable.Frame, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(v81, v88, 0, v72 + 4), 
        Size = UDim2.fromOffset(44, 0), 
        Visible = v68, 
        ref = v60, 
        defaultChild = v87
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        }), 
        ProfilePictureButton = if v82 and v70 then v3.createElement(v46, v2.Dictionary.join(v59, {
            layoutOrder = 1, 
            profilePictureButtonRef = v83, 
            refinementButtonsRef = v84
        })) else nil, 
        RefinementEntryButton = v3.createElement(v53, v2.Dictionary.join(v59, {
            layoutOrder = 2, 
            profilePictureButtonRef = v83, 
            refinementButtonsRef = v84, 
            NextSelectionDown = if v73 then v85 else if v76 and v77 then v86 else nil
        })), 
        UniversalAppCameraButton = v3.createElement(v58, v2.Dictionary.join(v59, {
            layoutOrder = 3
        })), 
        ColorAdjustmentQuickButton = if v73 then v3.createElement(v29, {
            colors = {
                v74
            }, 
            onActivated = v75, 
            ref = v85, 
            LayoutOrder = 4, 
            NextSelectionUp = v84, 
            NextSelectionLeft = v59.NextSelectionLeft
        }) else nil, 
        AccessoryAdjustmentButton = if v76 and v62.opaque.name == l_AvatarScreen_0.Catalog and v77 then v3.createElement(v30, {
            colors = {
                v74
            }, 
            onActivated = v80, 
            ref = v86, 
            LayoutOrder = 5, 
            NextSelectionUp = v84, 
            NextSelectionLeft = v59.NextSelectionLeft, 
            enableFocusAnimation = v78 and v78.shouldShowFirstTimeGlow()
        }) else nil
    });
end));