local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_3.Cryo);
local l_EventConnection_0 = require(l_Parent_3.ReactUtils).EventConnection;
local v9 = require(l_Parent_1.Control.Interactable);
local v10 = require(l_Parent_1.Control.Enum.ControlState);
local v11 = require(script.Parent.getContentStyle);
local v12 = require(l_Parent_2.Core.Style.withStyle);
local v13 = require(l_Parent_1.ImageSet.ImageSetComponent);
local v14 = require(l_Parent_2.App.Loading.ShimmerPanel);
local v15 = require(l_Parent_2.App.ImageSet.Enum.IconSize);
local v16 = require(l_Parent_2.App.ImageSet.getIconSize);
local v17 = require(l_Parent_1.Text.GenericTextLabel.GenericTextLabel);
local v18 = require(l_Parent_2.Core.Animation.withAnimation);
local v19 = require(l_Parent_1.Style.Validator.validateFontInfo);
local v20 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v21 = require(l_Parent_1.Button.HoverButtonBackground);
local v22 = require(l_Parent_0.Enum.StandardButtonSize);
local v23 = require(l_Parent_1.ImageSet.Validator.validateImage);
local v24 = v5.PureComponent:extend("GenericButton");
v24.init = function(v25) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), l_RunService_0 (copy), v5 (copy)
    v25:setState({
        controlState = v10.Initialize, 
        absoluteSize = Vector2.new(100, 100), 
        targetLoadingProgress = 1, 
        isButtonUnfocused = l_RunService_0:GetRobloxGuiFocused()
    });
    v25.onStateChanged = function(v26, v27) --[[ Line: 52 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            controlState = v27
        });
        if v25.props.onStateChanged then
            v25.props.onStateChanged(v26, v27);
        end;
    end;
    v25.onAbsoluteSizeChanged = function(v28) --[[ Line: 61 ]]
        -- upvalues: v25 (copy), v5 (ref)
        v25:setState({
            absoluteSize = v28.AbsoluteSize
        });
        if v25.props[v5.Change.AbsoluteSize] then
            v25.props[v5.Change.AbsoluteSize](v28);
        end;
    end;
    v25.onRobloxGuiFocusedChanged = function(v29) --[[ Line: 70 ]]
        -- upvalues: v25 (copy)
        if v29 then
            v25:setState({
                targetLoadingProgress = 1, 
                isButtonUnfocused = true
            });
            return;
        else
            v25:setState({
                isButtonUnfocused = false
            });
            return;
        end;
    end;
end;
local v30 = v6.interface({
    [v10.Default] = v6.string
});
v24.validateProps = v6.interface({
    icon = v6.optional(v23), 
    text = v6.optional(v6.string), 
    inputIcon = v6.optional(v23), 
    buttonImage = v23, 
    fontStyle = v6.optional(v6.union(v6.string, v19, v20)), 
    delayedInputImage = v6.optional(v23), 
    buttonStateColorMap = v30, 
    contentStateColorMap = v6.optional(v30), 
    textStateColorMap = v6.optional(v30), 
    iconStateColorMap = v6.optional(v30), 
    inputIconStateColorMap = v6.optional(v30), 
    isDisabled = v6.optional(v6.boolean), 
    isLoading = v6.optional(v6.boolean), 
    isDelayedInput = v6.optional(v6.boolean), 
    isHoverBackgroundEnabled = v6.optional(v6.boolean), 
    hoverImage = v6.optional(v23), 
    enableInputDelayed = v6.optional(v6.boolean), 
    delayInputSeconds = v6.optional(v6.numberPositive), 
    onActivated = v6.callback, 
    onStateChanged = v6.optional(v6.callback), 
    userInteractionEnabled = v6.optional(v6.boolean), 
    standardSize = v6.optional(v22.isEnumValue), 
    maxWidth = v6.optional(v6.numberPositive), 
    fitContent = v6.optional(v6.boolean), 
    buttonTextOverride = v6.optional(v6.strictInterface({
        RichText = v6.optional(v6.boolean), 
        Size = v6.optional(v6.UDim2), 
        TextSize = v6.optional(v6.number), 
        TextWrapped = v6.optional(v6.boolean), 
        TextTruncate = v6.optional(v6.enum(Enum.TextTruncate)), 
        TextXAlignment = v6.optional(v6.enum(Enum.TextXAlignment))
    })), 
    forwardedRef = v6.optional(v6.union(v6.table, v6.callback)), 
    feedbackType = v6.optional(v6.string)
});
v24.defaultProps = {
    fontStyle = "Header2", 
    isDisabled = false, 
    isLoading = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    delayInputSeconds = 3, 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
v24.didMount = function(v31) --[[ Line: 196 ]] --[[ Name: didMount ]]
    v31:setState({
        targetLoadingProgress = not v31.state.isButtonUnfocused and v31.props.enableInputDelayed and 0 or 1
    });
end;
v24.render = function(v32) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy)
    local l_isDelayedInput_0 = v32.props.isDelayedInput;
    local l_delayInputSeconds_0 = v32.props.delayInputSeconds;
    if l_isDelayedInput_0 and not v32.state.isButtonUnfocused then
        local l_targetLoadingProgress_0 = v32.state.targetLoadingProgress;
        return v18({
            loadingProgress = l_targetLoadingProgress_0
        }, function(v36) --[[ Line: 217 ]]
            -- upvalues: v32 (copy)
            local v37 = math.clamp(v36.loadingProgress, 0, 1);
            return v32:renderButton(v37);
        end, {
            frequency = 1 / l_delayInputSeconds_0, 
            dampingRatio = 0.8
        });
    elseif v32.state.isButtonUnfocused then
        return v32:renderButton(1);
    else
        return v32:renderButton();
    end;
end;
v24.renderButton = function(v38, v39) --[[ Line: 237 ]] --[[ Name: renderButton ]]
    -- upvalues: v12 (copy), v6 (copy), v30 (copy), v11 (copy), v10 (copy), v22 (copy), v5 (copy), v14 (copy), v16 (copy), v15 (copy), v13 (copy), v17 (copy), v7 (copy), v9 (copy), v21 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    return v12(function(v40) --[[ Line: 238 ]]
        -- upvalues: v6 (ref), v38 (copy), v30 (ref), v39 (copy), v11 (ref), v10 (ref), v22 (ref), v5 (ref), v14 (ref), v16 (ref), v15 (ref), v13 (ref), v17 (ref), v7 (ref), v9 (ref), v21 (ref), l_EventConnection_0 (ref), l_RunService_0 (ref)
        assert(v6.table(v40), "Style provider is missing.");
        local l_controlState_0 = v38.state.controlState;
        local l_text_0 = v38.props.text;
        local l_icon_0 = v38.props.icon;
        local l_inputIcon_0 = v38.props.inputIcon;
        local l_isLoading_0 = v38.props.isLoading;
        local l_isDisabled_0 = v38.props.isDisabled;
        local l_isDelayedInput_1 = v38.props.isDelayedInput;
        local l_userInteractionEnabled_0 = v38.props.userInteractionEnabled;
        local l_buttonImage_0 = v38.props.buttonImage;
        local l_fontStyle_0 = v38.props.fontStyle;
        local l_delayedInputImage_0 = v38.props.delayedInputImage;
        local l_buttonStateColorMap_0 = v38.props.buttonStateColorMap;
        local l_contentStateColorMap_0 = v38.props.contentStateColorMap;
        local v54 = v38.props.textStateColorMap or l_contentStateColorMap_0;
        local v55 = v38.props.iconStateColorMap or l_contentStateColorMap_0;
        local v56 = v38.props.inputIconStateColorMap or l_contentStateColorMap_0;
        local l_Size_0 = v38.props.Size;
        local l_standardSize_0 = v38.props.standardSize;
        local v59 = v38.props.maxWidth or 640;
        local l_fitContent_0 = v38.props.fitContent;
        if l_text_0 then
            assert(v30(v54), "textStateColorMap is missing or invalid.");
        end;
        if l_icon_0 then
            assert(v30(v55), "iconStateColorMap is missing or invalid.");
        end;
        if l_inputIcon_0 then
            assert(v30(v56), "inputIconStateColorMap is missing or invalid.");
        end;
        if l_isDelayedInput_1 and l_delayedInputImage_0 == nil then
            l_isDelayedInput_1 = false;
        end;
        if l_isLoading_0 then
            l_isDisabled_0 = true;
        end;
        if l_isDisabled_0 then
            l_isDelayedInput_1 = false;
        end;
        if type(l_fontStyle_0) == "string" then
            l_fontStyle_0 = v40.Font[l_fontStyle_0];
        end;
        local l_l_delayedInputImage_0_0 = l_delayedInputImage_0;
        if v39 == 1 then
            l_l_delayedInputImage_0_0 = l_buttonImage_0;
        end;
        if l_isDelayedInput_1 and v39 ~= 0 then
            l_userInteractionEnabled_0 = false;
        end;
        local v62 = v11(l_buttonStateColorMap_0, l_controlState_0, v40);
        local v63 = l_text_0 and v11(v54, l_controlState_0, v40);
        local v64 = l_icon_0 and v11(v55, l_controlState_0, v40);
        local v65 = l_inputIcon_0 and v11(v56, l_controlState_0, v40);
        local v66 = false;
        if l_controlState_0 == v10.Hover then
            v66 = v38.props.isHoverBackgroundEnabled == true;
        end;
        local l_hoverImage_0 = v38.props.hoverImage;
        local v68 = 5;
        if l_standardSize_0 then
            local v69 = nil;
            local v70 = nil;
            if l_standardSize_0 == v22.Regular then
                v69 = 48;
                v68 = 12;
                l_fontStyle_0 = v40.Font.Header2;
                v70 = false;
            elseif l_standardSize_0 == v22.Small then
                v69 = 36;
                v68 = 8;
                l_fontStyle_0 = v40.Font.Header2;
                v70 = false;
            elseif l_standardSize_0 == v22.XSmall then
                v69 = 28;
                v68 = 8;
                l_fontStyle_0 = v40.Font.CaptionHeader;
                v70 = true;
            end;
            if l_fitContent_0 == nil then
                l_fitContent_0 = v70;
            end;
            local v71 = l_fitContent_0 and 0 or 1;
            l_Size_0 = UDim2.new(v71, 0, 0, v69);
        end;
        local v72 = nil;
        if l_isLoading_0 then
            v72 = {
                isLoadingShimmer = v5.createElement(v14, {
                    Size = if l_standardSize_0 then UDim2.new(1, v68 * 2, 1, 0) else UDim2.new(1, 0, 1, 0), 
                    Position = if l_standardSize_0 then UDim2.new(0, -v68, 0, 0) else nil, 
                    cornerRadius = UDim.new(0, 8)
                })
            };
        else
            local l_X_0 = v38.state.absoluteSize.X;
            if l_standardSize_0 and l_fitContent_0 then
                l_X_0 = v59;
            end;
            local v74 = v38.state.absoluteSize.Y - 10;
            local v75 = l_X_0 - v68 * 2;
            if l_icon_0 then
                v75 = v75 - (5 + v16(v15.Medium));
            end;
            local v76 = Vector2.new(v75, v74);
            v72 = v38.props[v5.Children] or {
                UIListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Icon = l_icon_0 and v5.createElement(v13.Label, {
                    Size = UDim2.new(0, v16(v15.Medium), 0, v16(v15.Medium)), 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = v64.Color, 
                    ImageTransparency = v64.Transparency, 
                    LayoutOrder = 1
                }) or nil, 
                Text = l_text_0 and v5.createElement(v17, v7.Dictionary.join({
                    BackgroundTransparency = 1, 
                    Text = l_text_0, 
                    fontStyle = l_fontStyle_0, 
                    colorStyle = v63, 
                    LayoutOrder = 2, 
                    maxSize = v76, 
                    TextWrapped = not l_standardSize_0 and nil, 
                    TextTruncate = if l_standardSize_0 then Enum.TextTruncate.AtEnd else nil, 
                    TextXAlignment = if l_standardSize_0 and l_icon_0 then Enum.TextXAlignment.Left else nil
                }, v38.props.buttonTextOverride or {})) or nil
            };
            v72 = v38.props[v5.Children] or {
                ButtonMiddleContent = v5.createElement("Frame", {
                    AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
                    Size = if l_fitContent_0 then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1
                }, v72), 
                ButtonIcon = l_inputIcon_0 and v5.createElement(v13.Label, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.new(1, -4, 0.5, 0), 
                    Size = UDim2.new(0, v16(v15.Medium), 0, v16(v15.Medium)), 
                    BackgroundTransparency = 1, 
                    Image = l_inputIcon_0, 
                    ImageColor3 = v65.Color, 
                    ImageTransparency = v65.Transparency
                }) or nil
            };
        end;
        return v5.createElement(v9, v7.Dictionary.join(v38.props, {
            forwardedRef = v7.None, 
            icon = v7.None, 
            text = v7.None, 
            inputIcon = v7.None, 
            buttonImage = v7.None, 
            fontStyle = v7.None, 
            delayedInputImage = v7.None, 
            buttonStateColorMap = v7.None, 
            contentStateColorMap = v7.None, 
            textStateColorMap = v7.None, 
            iconStateColorMap = v7.None, 
            inputIconStateColorMap = v7.None, 
            onActivated = v7.None, 
            isLoading = v7.None, 
            isHoverBackgroundEnabled = v7.None, 
            hoverImage = v7.None, 
            isDelayedInput = v7.None, 
            enableInputDelayed = v7.None, 
            delayInputSeconds = v7.None, 
            standardSize = v7.None, 
            maxWidth = v7.None, 
            fitContent = v7.None, 
            buttonTextOverride = v7.None, 
            [v5.Children] = v7.None, 
            Size = l_Size_0, 
            AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
            [v5.Ref] = v38.props.forwardedRef, 
            isDisabled = l_isDisabled_0, 
            onStateChanged = v38.onStateChanged, 
            userInteractionEnabled = l_userInteractionEnabled_0, 
            Image = l_buttonImage_0, 
            ScaleType = Enum.ScaleType.Slice, 
            ImageColor3 = v62.Color, 
            ImageTransparency = v62.Transparency, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v5.Event.Activated] = v38.props.onActivated, 
            [v5.Change.AbsoluteSize] = v38.onAbsoluteSizeChanged
        }), {
            UISizeConstraint = if l_standardSize_0 and v59 then v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v59, 1e999)
            }) else nil, 
            UIPadding = if l_standardSize_0 then v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v68), 
                PaddingRight = UDim.new(0, v68)
            }) else nil, 
            ButtonContent = v5.createElement("Frame", {
                AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
                Size = if l_fitContent_0 then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v72), 
            LoadingImage = l_isDelayedInput_1 and v5.createElement(v13.Label, {
                Size = UDim2.new(v39, 0, 1, 0), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_l_delayedInputImage_0_0, 
                ImageColor3 = Color3.new(0, 0, 0), 
                ImageTransparency = 0.5, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v38.props.SliceCenter
            }), 
            HoverBackground = v66 and v5.createElement(v21, {
                sidePadding = if l_standardSize_0 then UDim.new(0, v68) else nil, 
                image = l_hoverImage_0, 
                sliceCenter = v38.props.SliceCenter
            }) or nil, 
            EventConnection = v5.createElement(l_EventConnection_0, {
                event = l_RunService_0.RobloxGuiFocusedChanged, 
                callback = v38.onRobloxGuiFocusedChanged
            })
        });
    end);
end;
v24.didUpdate = function(v77, v78, v79) --[[ Line: 513 ]] --[[ Name: didUpdate ]]
    if v77.props.enableInputDelayed ~= v78.enableInputDelayed then
        v77:setState({
            targetLoadingProgress = v77.props.enableInputDelayed and 0 or 1
        });
    end;
    if not v77.state.isButtonUnfocused and v79.isButtonUnfocused and v77.state.targetLoadingProgress == 1 and v77.props.enableInputDelayed then
        v77:setState({
            targetLoadingProgress = 0
        });
    end;
end;
return v5.forwardRef(function(v80, v81) --[[ Line: 531 ]]
    -- upvalues: v5 (copy), v24 (copy), v7 (copy)
    return v5.createElement(v24, v7.Dictionary.join(v80, {
        forwardedRef = v81
    }));
end);