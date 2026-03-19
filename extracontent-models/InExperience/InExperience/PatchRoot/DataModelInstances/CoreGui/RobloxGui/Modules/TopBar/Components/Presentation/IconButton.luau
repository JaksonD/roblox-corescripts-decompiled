local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Signals);
local v4 = require(l_CorePackages_0.Workspace.Packages.Display);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v5.FFlagEnableConsoleExpControls;
local l_FFlagAddUILessMode_0 = v5.FFlagAddUILessMode;
local l_FIntAddUILessModeVariant_0 = v5.FIntAddUILessModeVariant;
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local v13 = require(l_CorePackages_0.Packages.Cryo);
local l_ImageSetLabel_0 = v12.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v12.Core.Style.withStyle;
local l_Interactable_0 = v12.Core.Control.Interactable;
local l_ControlState_0 = v12.Core.Control.Enum.ControlState;
local l_Images_0 = v12.App.ImageSet.Images;
local l_withSelectionCursorProvider_0 = v12.App.SelectionImage.withSelectionCursorProvider;
local _ = v12.App.SelectionImage.CursorKind;
local v21 = require(l_CorePackages_0.Packages.ReactOtter);
local v22 = require(l_CorePackages_0.Packages.Foundation);
local l_withCursor_0 = v22.Hooks.withCursor;
local l_SkinToneCircle_0 = v22.Enums.CursorType.SkinToneCircle;
local _ = script.Parent.Parent.Parent;
local v26 = require(script.Parent.FlashingDot);
local v27 = require(script.Parent.FlashingDotV2);
local v28 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagFlashingDotUseAsyncInit);
local v29 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v30 = require(l_CoreGui_0.RobloxGui.Modules.isNewTiltIconEnabled);
local v31 = require(script.Parent.Parent.Parent.Constants);
local v32 = v9.PureComponent:extend("IconButton");
local v33 = l_Images_0["component_assets/circle_17"];
v32.validateProps = v11.strictInterface({
    icon = v11.union(v11.string, v11.table), 
    iconSize = v11.union(v11.number, v11.UDim2, v11.table), 
    enableFlashingDot = v11.optional(v11.boolean), 
    useIconScaleAnimation = v11.optional(v11.boolean), 
    onActivated = v11.callback, 
    onHover = v11.optional(v11.callback), 
    onHoverEnd = v11.optional(v11.callback), 
    backgroundTransparency = v11.optional(v11.number), 
    backgroundColor3 = v11.optional(v11.Color3), 
    backgroundCornerRadius = v11.optional(v11.UDim), 
    forwardRef = v11.optional(v11.any), 
    onSelectionChanged = if v29 and l_FFlagEnableConsoleExpControls_0 then v11.optional(v11.callback) else nil, 
    nextSelectionRightRef = if v29 and l_FFlagEnableConsoleExpControls_0 then v11.optional(v11.any) else nil, 
    modal = if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 == 2 then v11.optional(v11.boolean) else nil, 
    [v9.Change.AbsoluteSize] = v11.optional(v11.callback), 
    [v9.Change.AbsolutePosition] = v11.optional(v11.callback)
});
AnimatedScaleIcon = function(v34) --[[ Line: 65 ]] --[[ Name: AnimatedScaleIcon ]]
    -- upvalues: v21 (copy), v10 (copy), v9 (copy), l_ImageSetLabel_0 (copy)
    local v35, v36 = v21.useAnimatedBinding(v34.iconSize);
    v10.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v36 (copy), v21 (ref), v34 (copy)
        v36(v21.spring(v34.iconSize, {
            dampingRatio = 1, 
            frequency = 2.857142857142857
        }));
        return function() --[[ Line: 73 ]]

        end;
    end, {
        v34.iconSize
    });
    return v9.createElement(l_ImageSetLabel_0, {
        Size = v35:map(function(v37) --[[ Line: 77 ]]
            return UDim2.fromOffset(v37, v37);
        end), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v34.icon, 
        ImageColor3 = v34.style.Theme.IconEmphasis.Color, 
        ImageTransparency = v34.style.Theme.IconEmphasis.Transparency, 
        ZIndex = 1
    });
end;
v32.init = function(v38) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: l_ControlState_0 (copy), v3 (copy), v4 (copy)
    v38:setState({
        controlState = l_ControlState_0.Default
    });
    v38.controlStateUpdated = function(v39, v40) --[[ Line: 95 ]]
        -- upvalues: v38 (copy), l_ControlState_0 (ref)
        if v38.props.onHover and v40 == l_ControlState_0.Hover then
            v38.props.onHover();
        elseif v38.props.onHoverEnd and v39 == l_ControlState_0.Hover and v40 ~= l_ControlState_0.Hover then
            v38.props.onHoverEnd();
        end;
        v38:setState({
            controlState = v40
        });
    end;
    v38.disposeUiScaleEffect = v3.createEffect(function(v41) --[[ Line: 109 ]]
        -- upvalues: v4 (ref), v38 (copy)
        local v42 = v4.GetDisplayStore(v41);
        v38:setState({
            UiScale = v42.getUIScale(v41)
        });
    end);
end;
v32.render = function(v43) --[[ Line: 117 ]] --[[ Name: render ]]
    -- upvalues: v29 (copy), l_withCursor_0 (copy), l_withSelectionCursorProvider_0 (copy)
    if v29 then
        return l_withCursor_0(function(v44) --[[ Line: 119 ]]
            -- upvalues: v43 (copy)
            return v43:renderWithCursor(v44);
        end);
    else
        return l_withSelectionCursorProvider_0(function(v45) --[[ Line: 123 ]]
            -- upvalues: v43 (copy)
            return v43:renderWithCursor(v45);
        end);
    end;
end;
v32.renderWithCursor = function(v46, v47) --[[ Line: 129 ]] --[[ Name: renderWithCursor ]]
    -- upvalues: v30 (copy), v31 (copy), l_withStyle_0 (copy), l_ControlState_0 (copy), v9 (copy), l_Interactable_0 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_SkinToneCircle_0 (copy), v29 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_ImageSetLabel_0 (copy), v28 (copy), v27 (copy), v26 (copy), v33 (copy)
    local v48 = not v30() and v46.props.backgroundColor3;
    local v49 = v31.TopBarButtonHeight * v46.state.UiScale;
    return l_withStyle_0(function(v50) --[[ Line: 132 ]]
        -- upvalues: v46 (copy), l_ControlState_0 (ref), v9 (ref), l_Interactable_0 (ref), l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v30 (ref), v49 (copy), v47 (copy), l_SkinToneCircle_0 (ref), v29 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v48 (copy), l_ImageSetLabel_0 (ref), v28 (ref), v27 (ref), v26 (ref), v33 (ref)
        local v51 = {
            Color = Color3.new(1, 1, 1), 
            Transparency = 1
        };
        if v46.state.controlState == l_ControlState_0.Pressed then
            v51 = v50.Theme.BackgroundOnPress;
        elseif v46.state.controlState == l_ControlState_0.Hover then
            v51 = v50.Theme.BackgroundOnHover;
        end;
        return v9.createElement(l_Interactable_0, {
            onStateChanged = v46.controlStateUpdated, 
            ZIndex = 1, 
            Modal = if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 == 2 then v46.props.modal else nil, 
            BackgroundTransparency = if v30() then v50.Theme.BackgroundUIContrast.Transparency * v50.Settings.PreferredTransparency else 1, 
            Position = UDim2.fromScale(0, v30() and 0.5 or 1), 
            AnchorPoint = Vector2.new(0, v30() and 0.5 or 1), 
            Size = UDim2.fromOffset(v49, v49), 
            Image = not v30() and "rbxasset://textures/ui/TopBar/iconBase.png" or nil, 
            BackgroundColor3 = v50.Theme.BackgroundUIContrast.Color, 
            SelectionImageObject = if v30() then v47.refCache[l_SkinToneCircle_0] else nil, 
            NextSelectionRight = if v29 and l_FFlagEnableConsoleExpControls_0 then v46.props.nextSelectionRightRef else nil, 
            [v9.Event.Activated] = v46.props.onActivated, 
            [v9.Event.SelectionChanged] = if v29 and l_FFlagEnableConsoleExpControls_0 then v46.props.onSelectionChanged else nil, 
            [v9.Ref] = v46.props.forwardRef
        }, {
            UICorner = v30() and v9.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }) or nil, 
            BackgroundFrame = if v48 then v9.createElement("Frame", {
                Size = v46.props.iconSize, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundTransparency = v46.props.backgroundTransparency, 
                BackgroundColor3 = v46.props.backgroundColor3, 
                ZIndex = 0
            }, {
                UICorner = if v46.props.backgroundCornerRadius then v9.createElement("UICorner", {
                    CornerRadius = v46.props.backgroundCornerRadius
                }) else nil
            }) else nil, 
            Icon = not v46.props.useIconScaleAnimation and v9.createElement(l_ImageSetLabel_0, {
                Size = if typeof(v46.props.iconSize) ~= "number" then v46.props.iconSize else UDim2.fromOffset(v46.props.iconSize, v46.props.iconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v46.props.icon, 
                ImageColor3 = v50.Theme.IconEmphasis.Color, 
                ImageTransparency = v50.Theme.IconEmphasis.Transparency, 
                ZIndex = 1
            }), 
            ScalingIcon = v46.props.useIconScaleAnimation and v9.createElement(AnimatedScaleIcon, {
                icon = v46.props.icon, 
                iconSize = v46.props.iconSize, 
                style = v50
            }), 
            FlashingDot = if v46.props.enableFlashingDot then v9.createElement(if v28() then v27 else v26) else nil, 
            StateOverlayRound = v30() and v9.createElement("Frame", {
                BackgroundTransparency = v51.Transparency, 
                BackgroundColor3 = v51.Color, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, {
                UICorner = v30() and v9.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) or nil
            }) or nil, 
            StateOverlay = not v30() and v9.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v33, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 8, 8), 
                ImageColor3 = v51.Color, 
                ImageTransparency = v51.Transparency, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }) or nil
        });
    end);
end;
v32.willUnmount = function(v52) --[[ Line: 236 ]] --[[ Name: willUnmount ]]
    if v52.disposeUiScaleEffect then
        v52.disposeUiScaleEffect();
    end;
end;
return v9.forwardRef(function(v53, v54) --[[ Line: 241 ]]
    -- upvalues: v9 (copy), v32 (copy), v13 (copy)
    return v9.createElement(v32, v13.Dictionary.join(v53, {
        forwardRef = v54
    }));
end);