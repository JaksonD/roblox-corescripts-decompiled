local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Text_0 = v2.Text;
local l_Checkbox_0 = v2.Checkbox;
local l_CheckboxSize_0 = v2.Enums.CheckboxSize;
local v7 = require(l_CorePackages_0.Packages.React);
local l_useTopBarHeight_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useTopBarHeight;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v12 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v12.Focusable;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v16 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v17 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementNavBar);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v19 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.RefinementControlBar);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyColorsFrame);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v23 = game:DefineFastFlag("AXFixFlickerOnColorAdjustmentPageEntry", false);
local v24 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixColorAdjustmentGamepadSupport);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v26 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXRemoveColorAdjustmentPageGamepadBindings", false);
local function v28(v27) --[[ Line: 42 ]] --[[ Name: selectGlobalGuiInset ]]
    return v27.GlobalGuiInset;
end;
local function v42(v29) --[[ Line: 54 ]] --[[ Name: ColorAdjustmentPage ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v24 (copy), v12 (copy), v7 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), v28 (copy), l_useLocalization_0 (copy), v10 (copy), v23 (copy), l_useTopBarHeight_0 (copy), l_Focusable_0 (copy), v26 (copy), v16 (copy), v14 (copy), v22 (copy), v19 (copy), v17 (copy), v15 (copy), l_Checkbox_0 (copy), l_CheckboxSize_0 (copy), v20 (copy), l_Text_0 (copy)
    local v30 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if v24 then v12.useRootFocusController() else nil;
    local v31 = if v24 then v7.useRef(nil) else nil;
    local v32 = if v24 then v7.useRef(nil) else nil;
    local v33 = l_useTokens_0();
    local v34 = l_useSelector_0(v28);
    local v35 = l_useLocalization_0({
        topBarTitle = "Feature.Avatar.ColorAdjustmentPage.Title", 
        defaultColorsLabel = "Feature.Avatar.ColorAdjustmentPage.Label.SelectDefaultColors", 
        notAvailableForBodyMessage = "Feature.Avatar.ColorAdjustmentPage.AdjustmentNotAvailableForBody"
    });
    local v36 = v10.useOrientation();
    local v37 = if v24 then v10.usePreferredInput() else nil;
    local v38 = if v24 then v37 == v10.Input.Directional else nil;
    local v39 = if v23 then v36 ~= v10.BreakpointConfig.Enum.Landscape and (not v24 or not v38) else v36 == v10.BreakpointConfig.Enum.Portrait;
    local v40 = if v10.useResponsive() == "Small" then v33.Padding.XLarge else v33.Padding.XXLarge;
    local v41 = l_useTopBarHeight_0();
    return v7.createElement(if v24 then l_Focusable_0.Frame else "Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        focusController = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v24 then v30 else nil, 
        defaultChild = if v24 then v31 else nil, 
        inputBindings = if not v24 or v26 then nil else {
            Back = v12.Input.onBegin(Enum.KeyCode.ButtonB, v29.onBackButtonPressed)
        }
    }, {
        TopBar = v7.createElement(v16.Container, {
            titleText = v35.topBarTitle, 
            transparentBackground = true, 
            leftItem = v16.makeBackButton(v29.onBackButtonPressed), 
            ZIndex = 3, 
            ref = if v24 then v31 else nil, 
            NextSelectionDown = if v24 then v32 else nil
        }), 
        GamepadFocusHandlerForPage = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v24 then v7.createElement(v14, {
            focusController = v30, 
            captureFocusOnMount = true
        }) else nil, 
        RefinementNavBar = if v39 then v7.createElement(if v22() then v19 else v17, {}) else nil, 
        Content = v7.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v41 + v34.bottom), 
            Position = UDim2.fromOffset(0, v41), 
            BackgroundTransparency = 1
        }, {
            Layout = if v39 then v7.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }) else nil, 
            SceneInteractionFrame = v7.createElement(v15), 
            ControlPanel = v7.createElement("Frame", {
                BackgroundColor3 = v33.Color.Surface.Surface_0.Color3, 
                BackgroundTransparency = v33.Color.Surface.Surface_0.Transparency, 
                AnchorPoint = if v39 then Vector2.new(0, 1) else Vector2.new(0, 0.5), 
                Position = if v39 then UDim2.new(0, 0, 1, 0) else UDim2.new(0, v33.Size.Size_900, 0.5, 0), 
                Size = if v39 then UDim2.new(1, 0, v29.colorPickerAvailable and 0.5 or 0, 0) else UDim2.new(0.5, 0, 0, if v29.colorPickerAvailable then v33.Size.Size_3000 * 3 else 0), 
                AutomaticSize = if v29.colorPickerAvailable then nil else Enum.AutomaticSize.Y, 
                ZIndex = 3
            }, {
                UIPadding = v7.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v40), 
                    PaddingBottom = UDim.new(0, if v39 then v40 + v34.bottom else v40), 
                    PaddingLeft = UDim.new(0, v40), 
                    PaddingRight = UDim.new(0, v40)
                }), 
                UICorner = v7.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v33.Radius.Large)
                }), 
                ColorPicker = if v29.colorPickerAvailable then v7.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    Layout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalFlex = Enum.UIFlexAlignment.Fill
                    }), 
                    AboveDivider = if v29.defaultColorCheckboxAvailable then v7.createElement("Frame", {
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 1, 
                        BackgroundColor3 = v33.Color.Surface.Surface_0.Color3, 
                        BackgroundTransparency = v33.Color.Surface.Surface_0.Transparency
                    }, {
                        Padding = v7.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, v33.Gap.XLarge + 3)
                        }), 
                        DefaultColorCheckBox = v7.createElement(l_Checkbox_0, {
                            label = v35.defaultColorsLabel, 
                            isChecked = v29.defaultColorChecked, 
                            isDisabled = false, 
                            onActivated = v29.onDefaultColorCheckboxActivated, 
                            size = l_CheckboxSize_0.Medium
                        }), 
                        Divider = v7.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 1), 
                            Position = UDim2.new(0, 0, 1, v33.Gap.Large), 
                            BackgroundColor3 = v33.Color.Stroke.Default.Color3, 
                            BackgroundTransparency = v33.Color.Stroke.Default.Transparency, 
                            BorderSizePixel = 0
                        })
                    }) else nil, 
                    BodyColorPicker = v7.createElement(v20, {
                        Size = UDim2.fromScale(1, 1), 
                        LayoutOrder = 2, 
                        PaddingRight = UDim.new(), 
                        PaddingLeft = UDim.new(), 
                        PaddingTop = UDim.new(0, v33.Gap.Large), 
                        PaddingBottom = UDim.new(), 
                        ref = if v24 then v32 else nil, 
                        NextSelectionUp = if v24 then v31 else nil
                    })
                }) else v7.createElement(l_Text_0, {
                    Text = v35.notAvailableForBodyMessage, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    fontStyle = {
                        Font = v33.Typography.LabelSmall.Font, 
                        FontSize = v33.Typography.LabelSmall.FontSize, 
                        LineHeight = v33.Typography.LabelSmall.LineHeight
                    }
                }), 
                BottomFiller = if v39 then v7.createElement("Frame", {
                    LayoutOrder = 2, 
                    ZIndex = -1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, v34.bottom), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundColor3 = v33.Color.Surface.Surface_0.Color3, 
                    BackgroundTransparency = v33.Color.Surface.Surface_0.Transparency
                }) else nil
            })
        })
    });
end;
if v23 then
    v42 = v21(v42);
end;
return v42;