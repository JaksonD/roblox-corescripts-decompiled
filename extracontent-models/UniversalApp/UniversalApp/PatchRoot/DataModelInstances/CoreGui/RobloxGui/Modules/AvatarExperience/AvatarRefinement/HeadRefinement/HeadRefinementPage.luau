local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v7 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_useTopBarHeight_0 = v6.useTopBarHeight;
local l_useDeviceOrientation_0 = v6.useDeviceOrientation;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v15 = require(script.Parent.Hooks.useHeadRefinementPageProps);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_getMappedStyleTokens_0 = v5.Utils.getMappedStyleTokens;
local l_getHeadShapeListHeight_0 = v5.Utils.getHeadShapeListHeight;
local v19 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_getFoundationMappedStyleTokens_0 = v5.Utils.getFoundationMappedStyleTokens;
local l_HeadShapePicker_0 = v5.Features.HeadShapePicker;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v24 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v25 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementNavBar);
local v26 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v29 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v29.FFlagHeadRefinementFacialAnimationToggle;
local v31 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXRemoveHeadRefinementPageGamepadBindings", false);
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXEnableResponsiveHeadRefinementMenu_0 = v29.FFlagAXEnableResponsiveHeadRefinementMenu;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v36 = game:DefineFastFlag("AXHeadRefinementResizeFix", false);
local l_DeviceOrientationMode_0 = v10.DeviceOrientationMode;
local function v39(v38) --[[ Line: 66 ]] --[[ Name: selectGlobalGuiInset ]]
    return v38.GlobalGuiInset;
end;
local function v41(v40) --[[ Line: 70 ]] --[[ Name: selectScreenSize ]]
    return v40.ScreenSize;
end;
return (v28((v27(function(v42) --[[ Line: 79 ]] --[[ Name: HeadRefinementPage ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagAXEnableResponsiveHeadRefinementMenu_0 (copy), l_useTokens_0 (copy), l_getFoundationMappedStyleTokens_0 (copy), l_getMappedStyleTokens_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v19 (copy), v39 (copy), v36 (copy), l_DeviceOrientationMode_0 (copy), l_useDeviceOrientation_0 (copy), l_useTopBarHeight_0 (copy), v2 (copy), v15 (copy), v41 (copy), l_getHeadShapeListHeight_0 (copy), v32 (copy), l_AvatarScreen_0 (copy), l_Focusable_0 (copy), v31 (copy), v22 (copy), v24 (copy), v26 (copy), v25 (copy), v23 (copy), l_HeadShapePicker_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
    local v43 = l_useDesignTokens_0();
    local v44 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then l_useTokens_0() else nil;
    local v45 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then l_getFoundationMappedStyleTokens_0(v44) else l_getMappedStyleTokens_0(v43);
    local v46 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useRootFocusController();
    local v47 = l_useLocalization_0({
        topBarTitle = "Feature.Avatar.Label.HeadRefinement.Adjust.Title"
    });
    local v48 = l_useSelector_0(v19);
    local v49 = l_useSelector_0(v39);
    local v50 = if v36 then if v48 then l_DeviceOrientationMode_0.Portrait else l_DeviceOrientationMode_0.Landscape else l_useDeviceOrientation_0() or l_DeviceOrientationMode_0.Portrait;
    local v51 = l_useTopBarHeight_0();
    local v52 = v45.largeTileContainerSize * 4 + v45.tileListPaddingBetweenItems * 3 + v45.tileListPaddingLeft + v45.tileListPaddingRight;
    local v53 = v2.useRef(nil);
    local v54 = v2.useRef(nil);
    local v55, v56, v57, v58, v59 = v15();
    local v60 = nil;
    if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then
        local v61 = l_useSelector_0(v41);
        v60 = l_getHeadShapeListHeight_0({
            tokens = v44, 
            itemCount = if v55 then #v55 else 0, 
            availableViewportHeight = v61.Y - v51 - v49.bottom
        });
    end;
    local function v62() --[[ Line: 120 ]] --[[ Name: onBackButtonPressed ]]
        -- upvalues: v32 (ref), v42 (copy), l_AvatarScreen_0 (ref)
        if v32() then
            v42.navigation.pop();
            return;
        else
            v42.navigation.navigate(l_AvatarScreen_0.AvatarRefinement);
            return;
        end;
    end;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v46, 
        defaultChild = v53, 
        inputBindings = if v31 then nil else {
            Back = v3.Input.onBegin(Enum.KeyCode.ButtonB, v62)
        }
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v22, {
            focusController = v46, 
            captureFocusOnMount = true
        }), 
        HeadRefinementPageTopBar = v2.createElement(v24.Container, {
            titleText = v47.topBarTitle, 
            transparentBackground = true, 
            leftItem = v24.makeBackButton(v62), 
            ref = v53, 
            NextSelectionDown = v54, 
            ZIndex = 3
        }), 
        RefinementNavBar = if v48 then v2.createElement(if v32() then v26 else v25, {}) else nil, 
        HeadRefinementPageContainer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v51 + v49.bottom), 
            Position = UDim2.fromOffset(0, v51), 
            BackgroundTransparency = 1
        }, {
            HeadShapePickerUIListLayout = if not v36 and v48 then v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }) else nil, 
            HeadRefinementPageSceneInteractionFrame = v2.createElement(v23), 
            HeadRefinementPageControlPanel = v2.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                AnchorPoint = if v48 then Vector2.new(0, 1) else Vector2.new(0, 0.5), 
                Position = if v48 then UDim2.new(0, 0, 1, 0) else UDim2.new(0, v43.Global.Size_450, 0.5, 0), 
                Size = if v48 then UDim2.new(1, 0, 0, 0) else UDim2.new(0, v52, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                ZIndex = 3
            }, {
                HeadShapePicker = v2.createElement(l_Focusable_0[l_HeadShapePicker_0], {
                    isUnsupported = v56, 
                    items = v55, 
                    orientation = v50, 
                    tileSize = v50 == l_DeviceOrientationMode_0.Portrait and "small" or "large", 
                    isLoading = v57, 
                    containerRef = v54, 
                    NextSelectionUp = v53, 
                    isFacialAnimationEnabled = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v58 else nil, 
                    onFacialAnimationToggle = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v59 else nil, 
                    headShapeListMaxHeight = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 and v50 == l_DeviceOrientationMode_0.Landscape then v60 else nil
                }), 
                HeadRefinementPageBottomFiller = if v48 then v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = if v36 then UDim2.new(1, 0, 0, v49.bottom) else UDim2.new(1, 0, 1, 0), 
                    Position = if v36 then UDim2.new(0, 0, 1, 0) else UDim2.new(0, 0, 0, v49.bottom), 
                    BackgroundColor3 = v43.Semantic.Color.Background.Default.Color3, 
                    BackgroundTransparency = v43.Semantic.Color.Background.Default.Transparency, 
                    ZIndex = v36 and 0 or nil
                }) else nil
            })
        })
    });
end))));