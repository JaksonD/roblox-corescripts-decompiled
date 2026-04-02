local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_3.Cryo);
local v8 = require(l_Parent_3.Foundation);
local l_EventConnection_0 = require(l_Parent_3.ReactUtils).EventConnection;
local v10 = require(l_Parent_1.Control.Interactable);
local v11 = require(l_Parent_1.Control.Enum.ControlState);
local v12 = require(script.Parent.getContentStyle);
local v13 = require(l_Parent_2.Core.Style.withStyle);
local v14 = require(l_Parent_1.ImageSet.ImageSetComponent);
local l_Skeleton_0 = v8.Skeleton;
local v16 = require(l_Parent_2.App.ImageSet.Enum.IconSize);
local v17 = require(l_Parent_2.App.Loading.getClosestRadius);
local v18 = require(l_Parent_2.App.ImageSet.getIconSize);
local v19 = require(l_Parent_1.Text.GenericTextLabel.GenericTextLabel);
local v20 = require(l_Parent_2.Core.Animation.withAnimation);
local v21 = require(l_Parent_1.Style.Validator.validateFontInfo);
local v22 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v23 = require(l_Parent_1.Button.HoverButtonBackground);
local v24 = require(l_Parent_0.Enum.StandardButtonSize);
local v25 = require(l_Parent_1.ImageSet.Validator.validateImage);
local v26 = v5.PureComponent:extend("GenericButton");
v26.init = function(v27) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy), v5 (copy)
    v27:setState({
        controlState = v11.Initialize, 
        absoluteSize = Vector2.new(100, 100), 
        targetLoadingProgress = 1, 
        isButtonUnfocused = l_RunService_0:GetRobloxGuiFocused()
    });
    v27.onStateChanged = function(v28, v29) --[[ Line: 54 ]]
        -- upvalues: v27 (copy)
        v27:setState({
            controlState = v29
        });
        if v27.props.onStateChanged then
            v27.props.onStateChanged(v28, v29);
        end;
    end;
    v27.onAbsoluteSizeChanged = function(v30) --[[ Line: 63 ]]
        -- upvalues: v27 (copy), v5 (ref)
        v27:setState({
            absoluteSize = v30.AbsoluteSize
        });
        if v27.props[v5.Change.AbsoluteSize] then
            v27.props[v5.Change.AbsoluteSize](v30);
        end;
    end;
    v27.onRobloxGuiFocusedChanged = function(v31) --[[ Line: 72 ]]
        -- upvalues: v27 (copy)
        if v31 then
            v27:setState({
                targetLoadingProgress = 1, 
                isButtonUnfocused = true
            });
            return;
        else
            v27:setState({
                isButtonUnfocused = false
            });
            return;
        end;
    end;
end;
local v32 = v6.interface({
    [v11.Default] = v6.string
});
v26.validateProps = v6.interface({
    icon = v6.optional(v25), 
    text = v6.optional(v6.string), 
    inputIcon = v6.optional(v25), 
    buttonImage = v25, 
    fontStyle = v6.optional(v6.union(v6.string, v21, v22)), 
    delayedInputImage = v6.optional(v25), 
    buttonStateColorMap = v32, 
    contentStateColorMap = v6.optional(v32), 
    textStateColorMap = v6.optional(v32), 
    iconStateColorMap = v6.optional(v32), 
    inputIconStateColorMap = v6.optional(v32), 
    isDisabled = v6.optional(v6.boolean), 
    isLoading = v6.optional(v6.boolean), 
    isDelayedInput = v6.optional(v6.boolean), 
    isHoverBackgroundEnabled = v6.optional(v6.boolean), 
    hoverImage = v6.optional(v25), 
    enableInputDelayed = v6.optional(v6.boolean), 
    delayInputSeconds = v6.optional(v6.numberPositive), 
    onActivated = v6.callback, 
    onStateChanged = v6.optional(v6.callback), 
    userInteractionEnabled = v6.optional(v6.boolean), 
    standardSize = v6.optional(v24.isEnumValue), 
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
v26.defaultProps = {
    fontStyle = "Header2", 
    isDisabled = false, 
    isLoading = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    delayInputSeconds = 3, 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
v26.didMount = function(v33) --[[ Line: 198 ]] --[[ Name: didMount ]]
    v33:setState({
        targetLoadingProgress = not v33.state.isButtonUnfocused and v33.props.enableInputDelayed and 0 or 1
    });
end;
v26.render = function(v34) --[[ Line: 206 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy)
    local l_isDelayedInput_0 = v34.props.isDelayedInput;
    local l_delayInputSeconds_0 = v34.props.delayInputSeconds;
    if l_isDelayedInput_0 and not v34.state.isButtonUnfocused then
        local l_targetLoadingProgress_0 = v34.state.targetLoadingProgress;
        return v20({
            loadingProgress = l_targetLoadingProgress_0
        }, function(v38) --[[ Line: 219 ]]
            -- upvalues: v34 (copy)
            local v39 = math.clamp(v38.loadingProgress, 0, 1);
            return v34:renderButton(v39);
        end, {
            frequency = 1 / l_delayInputSeconds_0, 
            dampingRatio = 0.8
        });
    elseif v34.state.isButtonUnfocused then
        return v34:renderButton(1);
    else
        return v34:renderButton();
    end;
end;
v26.renderButton = function(v40, v41) --[[ Line: 239 ]] --[[ Name: renderButton ]]
    -- upvalues: v13 (copy), v6 (copy), v32 (copy), v12 (copy), v11 (copy), v24 (copy), v5 (copy), l_Skeleton_0 (copy), v17 (copy), v18 (copy), v16 (copy), v14 (copy), v19 (copy), v7 (copy), v10 (copy), v23 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    return v13(function(v42) --[[ Line: 240 ]]
        -- upvalues: v6 (ref), v40 (copy), v32 (ref), v41 (copy), v12 (ref), v11 (ref), v24 (ref), v5 (ref), l_Skeleton_0 (ref), v17 (ref), v18 (ref), v16 (ref), v14 (ref), v19 (ref), v7 (ref), v10 (ref), v23 (ref), l_EventConnection_0 (ref), l_RunService_0 (ref)
        assert(v6.table(v42), "Style provider is missing.");
        local l_controlState_0 = v40.state.controlState;
        local l_text_0 = v40.props.text;
        local l_icon_0 = v40.props.icon;
        local l_inputIcon_0 = v40.props.inputIcon;
        local l_isLoading_0 = v40.props.isLoading;
        local l_isDisabled_0 = v40.props.isDisabled;
        local l_isDelayedInput_1 = v40.props.isDelayedInput;
        local l_userInteractionEnabled_0 = v40.props.userInteractionEnabled;
        local l_buttonImage_0 = v40.props.buttonImage;
        local l_fontStyle_0 = v40.props.fontStyle;
        local l_delayedInputImage_0 = v40.props.delayedInputImage;
        local l_buttonStateColorMap_0 = v40.props.buttonStateColorMap;
        local l_contentStateColorMap_0 = v40.props.contentStateColorMap;
        local v56 = v40.props.textStateColorMap or l_contentStateColorMap_0;
        local v57 = v40.props.iconStateColorMap or l_contentStateColorMap_0;
        local v58 = v40.props.inputIconStateColorMap or l_contentStateColorMap_0;
        local l_Size_0 = v40.props.Size;
        local l_standardSize_0 = v40.props.standardSize;
        local v61 = v40.props.maxWidth or 640;
        local l_fitContent_0 = v40.props.fitContent;
        if l_text_0 then
            assert(v32(v56), "textStateColorMap is missing or invalid.");
        end;
        if l_icon_0 then
            assert(v32(v57), "iconStateColorMap is missing or invalid.");
        end;
        if l_inputIcon_0 then
            assert(v32(v58), "inputIconStateColorMap is missing or invalid.");
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
            l_fontStyle_0 = v42.Font[l_fontStyle_0];
        end;
        local l_l_delayedInputImage_0_0 = l_delayedInputImage_0;
        if v41 == 1 then
            l_l_delayedInputImage_0_0 = l_buttonImage_0;
        end;
        if l_isDelayedInput_1 and v41 ~= 0 then
            l_userInteractionEnabled_0 = false;
        end;
        local v64 = v12(l_buttonStateColorMap_0, l_controlState_0, v42);
        local v65 = l_text_0 and v12(v56, l_controlState_0, v42);
        local v66 = l_icon_0 and v12(v57, l_controlState_0, v42);
        local v67 = l_inputIcon_0 and v12(v58, l_controlState_0, v42);
        local v68 = false;
        if l_controlState_0 == v11.Hover then
            v68 = v40.props.isHoverBackgroundEnabled == true;
        end;
        local l_hoverImage_0 = v40.props.hoverImage;
        local v70 = 5;
        if l_standardSize_0 then
            local v71 = nil;
            local v72 = nil;
            if l_standardSize_0 == v24.Regular then
                v71 = 48;
                v70 = 12;
                l_fontStyle_0 = v42.Font.Header2;
                v72 = false;
            elseif l_standardSize_0 == v24.Small then
                v71 = 36;
                v70 = 8;
                l_fontStyle_0 = v42.Font.Header2;
                v72 = false;
            elseif l_standardSize_0 == v24.XSmall then
                v71 = 28;
                v70 = 8;
                l_fontStyle_0 = v42.Font.CaptionHeader;
                v72 = true;
            end;
            if l_fitContent_0 == nil then
                l_fitContent_0 = v72;
            end;
            local v73 = l_fitContent_0 and 0 or 1;
            l_Size_0 = UDim2.new(v73, 0, 0, v71);
        end;
        local v74 = nil;
        if l_isLoading_0 then
            v74 = {
                isLoadingShimmer = v5.createElement(l_Skeleton_0, {
                    Size = if l_standardSize_0 then UDim2.new(1, v70 * 2, 1, 0) else UDim2.new(1, 0, 1, 0), 
                    Position = if l_standardSize_0 then UDim2.new(0, -v70, 0, 0) else nil, 
                    radius = v17(v42.Tokens.Semantic.Radius, UDim.new(0, 8))
                })
            };
        else
            local l_X_0 = v40.state.absoluteSize.X;
            if l_standardSize_0 and l_fitContent_0 then
                l_X_0 = v61;
            end;
            local v76 = v40.state.absoluteSize.Y - 10;
            local v77 = l_X_0 - v70 * 2;
            if l_icon_0 then
                v77 = v77 - (5 + v18(v16.Medium));
            end;
            local v78 = Vector2.new(v77, v76);
            v74 = v40.props[v5.Children] or {
                UIListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Icon = l_icon_0 and v5.createElement(v14.Label, {
                    Size = UDim2.new(0, v18(v16.Medium), 0, v18(v16.Medium)), 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = v66.Color, 
                    ImageTransparency = v66.Transparency, 
                    LayoutOrder = 1
                }) or nil, 
                Text = l_text_0 and v5.createElement(v19, v7.Dictionary.join({
                    BackgroundTransparency = 1, 
                    Text = l_text_0, 
                    fontStyle = l_fontStyle_0, 
                    colorStyle = v65, 
                    LayoutOrder = 2, 
                    maxSize = v78, 
                    TextWrapped = not l_standardSize_0 and nil, 
                    TextTruncate = if l_standardSize_0 then Enum.TextTruncate.AtEnd else nil, 
                    TextXAlignment = if l_standardSize_0 and l_icon_0 then Enum.TextXAlignment.Left else nil
                }, v40.props.buttonTextOverride or {})) or nil
            };
            v74 = v40.props[v5.Children] or {
                ButtonMiddleContent = v5.createElement("Frame", {
                    AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
                    Size = if l_fitContent_0 then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1
                }, v74), 
                ButtonIcon = l_inputIcon_0 and v5.createElement(v14.Label, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.new(1, -4, 0.5, 0), 
                    Size = UDim2.new(0, v18(v16.Medium), 0, v18(v16.Medium)), 
                    BackgroundTransparency = 1, 
                    Image = l_inputIcon_0, 
                    ImageColor3 = v67.Color, 
                    ImageTransparency = v67.Transparency
                }) or nil
            };
        end;
        return v5.createElement(v10, v7.Dictionary.join(v40.props, {
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
            [v5.Ref] = v40.props.forwardedRef, 
            isDisabled = l_isDisabled_0, 
            onStateChanged = v40.onStateChanged, 
            userInteractionEnabled = l_userInteractionEnabled_0, 
            Image = l_buttonImage_0, 
            ScaleType = Enum.ScaleType.Slice, 
            ImageColor3 = v64.Color, 
            ImageTransparency = v64.Transparency, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v5.Event.Activated] = v40.props.onActivated, 
            [v5.Change.AbsoluteSize] = v40.onAbsoluteSizeChanged
        }), {
            UISizeConstraint = if l_standardSize_0 and v61 then v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v61, 1e999)
            }) else nil, 
            UIPadding = if l_standardSize_0 then v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v70), 
                PaddingRight = UDim.new(0, v70)
            }) else nil, 
            ButtonContent = v5.createElement("Frame", {
                AutomaticSize = if l_fitContent_0 then Enum.AutomaticSize.X else nil, 
                Size = if l_fitContent_0 then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v74), 
            LoadingImage = l_isDelayedInput_1 and v5.createElement(v14.Label, {
                Size = UDim2.new(v41, 0, 1, 0), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_l_delayedInputImage_0_0, 
                ImageColor3 = Color3.new(0, 0, 0), 
                ImageTransparency = 0.5, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v40.props.SliceCenter
            }), 
            HoverBackground = v68 and v5.createElement(v23, {
                sidePadding = if l_standardSize_0 then UDim.new(0, v70) else nil, 
                image = l_hoverImage_0, 
                sliceCenter = v40.props.SliceCenter
            }) or nil, 
            EventConnection = v5.createElement(l_EventConnection_0, {
                event = l_RunService_0.RobloxGuiFocusedChanged, 
                callback = v40.onRobloxGuiFocusedChanged
            })
        });
    end);
end;
v26.didUpdate = function(v79, v80, v81) --[[ Line: 515 ]] --[[ Name: didUpdate ]]
    if v79.props.enableInputDelayed ~= v80.enableInputDelayed then
        v79:setState({
            targetLoadingProgress = v79.props.enableInputDelayed and 0 or 1
        });
    end;
    if not v79.state.isButtonUnfocused and v81.isButtonUnfocused and v79.state.targetLoadingProgress == 1 and v79.props.enableInputDelayed then
        v79:setState({
            targetLoadingProgress = 0
        });
    end;
end;
return v5.forwardRef(function(v82, v83) --[[ Line: 533 ]]
    -- upvalues: v5 (copy), v26 (copy), v7 (copy)
    return v5.createElement(v26, v7.Dictionary.join(v82, {
        forwardedRef = v83
    }));
end);