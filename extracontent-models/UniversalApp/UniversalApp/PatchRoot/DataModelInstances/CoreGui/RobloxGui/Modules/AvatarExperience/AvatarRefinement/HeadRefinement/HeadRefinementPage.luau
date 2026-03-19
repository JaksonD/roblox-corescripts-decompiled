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
local l_DeviceOrientationMode_0 = v10.DeviceOrientationMode;
local function v38(v37) --[[ Line: 65 ]] --[[ Name: selectGlobalGuiInset ]]
    return v37.GlobalGuiInset;
end;
local function v40(v39) --[[ Line: 69 ]] --[[ Name: selectScreenSize ]]
    return v39.ScreenSize;
end;
return (v28((v27(function(v41) --[[ Line: 78 ]] --[[ Name: HeadRefinementPage ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_FFlagAXEnableResponsiveHeadRefinementMenu_0 (copy), l_useTokens_0 (copy), l_getFoundationMappedStyleTokens_0 (copy), l_getMappedStyleTokens_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v19 (copy), v38 (copy), l_useDeviceOrientation_0 (copy), l_DeviceOrientationMode_0 (copy), l_useTopBarHeight_0 (copy), v2 (copy), v15 (copy), v40 (copy), l_getHeadShapeListHeight_0 (copy), v32 (copy), l_AvatarScreen_0 (copy), l_Focusable_0 (copy), v31 (copy), v22 (copy), v24 (copy), v26 (copy), v25 (copy), v23 (copy), l_HeadShapePicker_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
    local v42 = l_useDesignTokens_0();
    local v43 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then l_useTokens_0() else nil;
    local v44 = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then l_getFoundationMappedStyleTokens_0(v43) else l_getMappedStyleTokens_0(v42);
    local v45 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useRootFocusController();
    local v46 = l_useLocalization_0({
        topBarTitle = "Feature.Avatar.Label.HeadRefinement.Adjust.Title"
    });
    local v47 = l_useSelector_0(v19);
    local v48 = l_useSelector_0(v38);
    local v49 = l_useDeviceOrientation_0() or l_DeviceOrientationMode_0.Portrait;
    local v50 = l_useTopBarHeight_0();
    local v51 = v44.largeTileContainerSize * 4 + v44.tileListPaddingBetweenItems * 3 + v44.tileListPaddingLeft + v44.tileListPaddingRight;
    local v52 = v2.useRef(nil);
    local v53 = v2.useRef(nil);
    local v54, v55, v56, v57, v58 = v15();
    local v59 = nil;
    if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 then
        local v60 = l_useSelector_0(v40);
        v59 = l_getHeadShapeListHeight_0({
            tokens = v43, 
            itemCount = if v54 then #v54 else 0, 
            availableViewportHeight = v60.Y - v50 - v48.bottom
        });
    end;
    local function v61() --[[ Line: 118 ]] --[[ Name: onBackButtonPressed ]]
        -- upvalues: v32 (ref), v41 (copy), l_AvatarScreen_0 (ref)
        if v32() then
            v41.navigation.pop();
            return;
        else
            v41.navigation.navigate(l_AvatarScreen_0.AvatarRefinement);
            return;
        end;
    end;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v45, 
        defaultChild = v52, 
        inputBindings = if v31 then nil else {
            Back = v3.Input.onBegin(Enum.KeyCode.ButtonB, v61)
        }
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v22, {
            focusController = v45, 
            captureFocusOnMount = true
        }), 
        HeadRefinementPageTopBar = v2.createElement(v24.Container, {
            titleText = v46.topBarTitle, 
            transparentBackground = true, 
            leftItem = v24.makeBackButton(v61), 
            ref = v52, 
            NextSelectionDown = v53, 
            ZIndex = 3
        }), 
        RefinementNavBar = if v47 then v2.createElement(if v32() then v26 else v25, {}) else nil, 
        HeadRefinementPageContainer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v50 + v48.bottom), 
            Position = UDim2.fromOffset(0, v50), 
            BackgroundTransparency = 1
        }, {
            HeadShapePickerUIListLayout = if v47 then v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }) else nil, 
            HeadRefinementPageSceneInteractionFrame = v2.createElement(v23), 
            HeadRefinementPageControlPanel = v2.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                AnchorPoint = if v47 then Vector2.new(0, 1) else Vector2.new(0, 0.5), 
                Position = if v47 then UDim2.new(0, 0, 1, 0) else UDim2.new(0, v42.Global.Size_450, 0.5, 0), 
                Size = if v47 then UDim2.new(1, 0, 0, 0) else UDim2.new(0, v51, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                ZIndex = 3
            }, {
                HeadShapePicker = v2.createElement(l_Focusable_0[l_HeadShapePicker_0], {
                    isUnsupported = v55, 
                    items = v54, 
                    orientation = v49, 
                    tileSize = v49 == l_DeviceOrientationMode_0.Portrait and "small" or "large", 
                    isLoading = v56, 
                    containerRef = v53, 
                    NextSelectionUp = v52, 
                    isFacialAnimationEnabled = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v57 else nil, 
                    onFacialAnimationToggle = if l_FFlagHeadRefinementFacialAnimationToggle_0 then v58 else nil, 
                    headShapeListMaxHeight = if l_FFlagAXEnableResponsiveHeadRefinementMenu_0 and v49 == l_DeviceOrientationMode_0.Landscape then v59 else nil
                }), 
                HeadRefinementPageBottomFiller = if v47 then v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0, 0, 0, v48.bottom), 
                    BackgroundColor3 = v42.Semantic.Color.Background.Default.Color3, 
                    BackgroundTransparency = v42.Semantic.Color.Background.Default.Transparency
                }) else nil
            })
        })
    });
end))));