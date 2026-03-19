local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v10 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v14 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v15 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments);
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v18 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentTypeButtons);
local v19 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentSliders);
local v20 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Thunks.SendRefinementAnalytics);
local v21 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Services.Analytics);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local _ = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local function v27(v26) --[[ Line: 60 ]] --[[ Name: mapTokens ]]
    return {
        smallIconSize = v26.Semantic.Icon.Size.Small, 
        buttonSize = v26.Global.Size_400, 
        portraitPadding = v26.Global.Size_100, 
        landscapePadding = v26.Global.Size_150, 
        sidePadding = v26.Global.Size_150, 
        cornerRadius = v26.Semantic.Radius.Medium, 
        panelMargin = v26.Global.Size_450
    };
end;
local function v29(v28) --[[ Line: 72 ]] --[[ Name: selectAdjustmentTypeSelected ]]
    return v28.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected;
end;
local function v31(v30) --[[ Line: 76 ]] --[[ Name: selectSelectedAccessory ]]
    return v30.AvatarExperience.AccessoryAdjustment.SelectedAccessory;
end;
return (v22(function(v32) --[[ Line: 81 ]] --[[ Name: ControlPanel ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v27 (copy), v10 (copy), v21 (copy), l_useSelector_0 (copy), v13 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v29 (copy), v31 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v5 (copy), l_useNavigation_0 (copy), v2 (copy), l_Focusable_0 (copy), v18 (copy), v19 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v20 (copy), v14 (copy), v15 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v34 = l_useDesignTokens_0(v27);
    local v35 = v10(v21);
    local v36 = l_useSelector_0(v13);
    local v37 = l_useDispatch_0();
    local v38 = l_useLocalization_0({
        apply = "CommonUI.Messages.Action.Apply"
    });
    local v39 = l_useSelector_0(v29);
    local v40 = l_useSelector_0(v31);
    local v41 = if v36 then v34.portraitPadding else v34.landscapePadding;
    local v42 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v5.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    local v43 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then l_useNavigation_0().state.params else nil;
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        AnchorPoint = if v36 then Vector2.new(0, 1) else Vector2.new(0, 0.5), 
        Position = if v36 then UDim2.new(0, 0, 1, 0) else UDim2.new(0, v34.panelMargin, 0.5, 0), 
        Size = if v36 then UDim2.new(1, 0, 0, 0) else UDim2.fromScale(0.4, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ZIndex = 3
    }, {
        Content = v2.createElement(l_Focusable_0.Frame, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v41), 
                PaddingBottom = UDim.new(0, v41), 
                PaddingLeft = UDim.new(0, v34.sidePadding), 
                PaddingRight = UDim.new(0, v34.sidePadding)
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v34.cornerRadius)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, v41), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            AdjustmentTypeButtons = v2.createElement(v18, {
                adjustmentTypeSelected = v39, 
                LayoutOrder = 1, 
                frameRef = v32.adjustmentTypeFrameRef, 
                NextSelectionDown = v32.sliderFrameRef, 
                NextSelectionUp = v32.topBarRef, 
                NextSelectionLeft = v32.topBarRef, 
                NextSelectionRight = v32.resetRef
            }), 
            AdjustmentSliders = v2.createElement(v19, {
                adjustmentTypeSelected = v39, 
                LayoutOrder = 2, 
                updateCharacterCallback = v32.updateCharacterCallback, 
                setSliderValuesCallback = v32.setSliderValuesCallback, 
                sliderValues = v32.sliderValues, 
                NextSelectionUp = v32.adjustmentTypeFrameRef, 
                frameRef = v32.sliderFrameRef, 
                NextSelectionDown = v32.applyButtonRef, 
                NextSelectionRight = v32.resetRef
            }), 
            ApplyButton = v2.createElement(l_Button_0, {
                ref = v32.applyButtonRef, 
                NextSelectionUp = v32.sliderFrameRef, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                size = UDim2.new(1, 0, 0, v34.buttonSize), 
                layoutOrder = 3, 
                text = v38.apply, 
                onActivated = function() --[[ Line: 163 ]] --[[ Name: onActivated ]]
                    -- upvalues: v32 (copy), v37 (copy), v20 (ref), v35 (copy), v14 (ref), v15 (ref), v40 (copy), v42 (copy), v43 (copy)
                    v32.isApplyingAdjustment.current = true;
                    v37(v20(v35.avatarRefineAccessoryApply(v32.sliderValues)));
                    local v44, v45, v46 = v14.sliderInfoToVector3s(v32.sliderValues);
                    v37(v15(v44, v45, v46, v40));
                    if v42 and v43 and v43.fromRoute then
                        v32.navigation.popToTop();
                        v32.navigation.navigate(v43.fromRoute);
                        return;
                    else
                        v32.navigation.pop();
                        return;
                    end;
                end
            })
        }), 
        HideBottomCorners = if v36 then v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0.3), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = -5
        }) else nil
    });
end));