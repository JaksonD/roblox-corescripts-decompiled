local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Text.GetTextSize);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_1.Utility.memoize);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v10 = require(l_Parent_0.Button.Enum.ButtonType);
local v11 = Vector2.new(36, 36);
local function _(v12, v13, v14, v15) --[[ Line: 31 ]] --[[ Name: getTextHeight ]]
    -- upvalues: v5 (copy)
    local v16 = Vector2.new(v15, 10000);
    return v5(v12, v14, v13, v16).Y;
end;
local v18 = v3.PureComponent:extend("ToastContainer");
v18.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    buttonText = v4.optional(v4.string), 
    fitHeight = v4.optional(v4.boolean), 
    iconColorStyle = v4.optional(v9), 
    iconImage = v4.optional(v4.union(v4.table, v4.string, v4.callback)), 
    iconSize = v4.optional(v4.Vector2), 
    iconChildren = v4.optional(v4.table), 
    layoutOrder = v4.optional(v4.integer), 
    onActivated = v4.optional(v4.callback), 
    onTouchSwipe = v4.optional(v4.callback), 
    padding = v4.numberMin(0), 
    position = v4.UDim2, 
    pressedScale = v4.optional(v4.number), 
    renderToast = v4.callback, 
    size = v4.UDim2, 
    sizeConstraint = v4.optional(v4.table), 
    toastSubtitle = v4.optional(v4.string), 
    toastTitle = v4.string, 
    buttonType = v4.optional(v10.isEnumValue)
});
v18.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    fitHeight = true, 
    padding = 12, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.new(1, -24, 0, 0), 
    sizeConstraint = {
        MaxSize = Vector2.new(400, 1e999), 
        MinSize = Vector2.new(24, 60)
    }
};
v18.init = function(v19) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v6 (copy), v11 (copy), v5 (copy), v7 (copy)
    v19.containerRef = v3.createRef();
    v19.isMounted = false;
    v19.state = {
        containerWidth = 0, 
        pressed = false, 
        subtitleHeight = 0, 
        titleHeight = 0
    };
    v19.getIconSize = function() --[[ Line: 85 ]]
        -- upvalues: v19 (copy), v6 (ref), v11 (ref)
        local l_iconSize_0 = v19.props.iconSize;
        local l_iconImage_0 = v19.props.iconImage;
        local l_ImagesResolutionScale_0 = v6.ImagesResolutionScale;
        if l_iconImage_0 then
            if l_iconSize_0 then
                return l_iconSize_0;
            elseif l_iconImage_0.ImageRectSize and l_ImagesResolutionScale_0 and l_ImagesResolutionScale_0 > 0 then
                return l_iconImage_0.ImageRectSize / l_ImagesResolutionScale_0;
            else
                return v11;
            end;
        else
            return Vector2.new(0, 0);
        end;
    end;
    v19.onButtonInputBegan = function(_, v24) --[[ Line: 101 ]]
        -- upvalues: v19 (copy)
        if v24.UserInputState == Enum.UserInputState.Begin and (v24.UserInputType == Enum.UserInputType.Touch or v24.UserInputType == Enum.UserInputType.MouseButton1) and not v19.state.pressed then
            v19:setState({
                pressed = true
            });
        end;
    end;
    v19.onButtonInputEnded = function() --[[ Line: 117 ]]
        -- upvalues: v19 (copy)
        if v19.state.pressed then
            v19:setState({
                pressed = false
            });
        end;
    end;
    v19.getTextHeights = function(v25) --[[ Line: 125 ]]
        -- upvalues: v19 (copy), v5 (ref)
        local l_iconImage_1 = v19.props.iconImage;
        local v27 = v19.getIconSize();
        local l_buttonText_0 = v19.props.buttonText;
        local l_padding_0 = v19.props.padding;
        local l_toastSubtitle_0 = v19.props.toastSubtitle;
        local l_toastTitle_0 = v19.props.toastTitle;
        local l_Font_0 = v25.Font;
        local l_Header2_0 = l_Font_0.Header2;
        local l_CaptionBody_0 = l_Font_0.CaptionBody;
        local v35 = v19.state.containerWidth - l_padding_0 * 2;
        if l_iconImage_1 then
            v35 = v35 - v27.X - l_padding_0;
        end;
        if l_buttonText_0 and not v19.showCompactToast() then
            v35 = v35 - v19.getButtonDimensions(v25).X;
        end;
        local l_Font_1 = l_Header2_0.Font;
        local v37 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
        local v38 = 0;
        local v39 = Vector2.new(v35, 10000);
        local v40 = math.max(v38, v5(l_toastTitle_0, v37, l_Font_1, v39).Y);
        v38 = 0;
        if l_toastSubtitle_0 then
            local l_Font_2 = l_CaptionBody_0.Font;
            local v42 = l_CaptionBody_0.RelativeSize * l_Font_0.BaseSize;
            local v43 = 0;
            local v44 = Vector2.new(v35, 10000);
            v38 = math.max(v43, v5(l_toastSubtitle_0, v42, l_Font_2, v44).Y);
        end;
        return v38, v40;
    end;
    v19.showCompactToast = function() --[[ Line: 160 ]]
        -- upvalues: v19 (copy)
        return v19.state.containerWidth < 400;
    end;
    v19.showPressed = function() --[[ Line: 164 ]]
        -- upvalues: v19 (copy)
        if not v19.props.buttonText and v19.props.onActivated then
            return v19.state.pressed;
        else
            return nil;
        end;
    end;
    v19.getButtonDimensions = v7(function(v45) --[[ Line: 172 ]]
        -- upvalues: v19 (copy), v5 (ref)
        local l_buttonText_1 = v19.props.buttonText;
        local l_onActivated_0 = v19.props.onActivated;
        if not l_buttonText_1 or not l_onActivated_0 then
            return Vector2.new(0, 0);
        else
            local l_Font_3 = v45.Font.Header2.Font;
            local v49 = v45.Font.Header2.RelativeSize * v45.Font.BaseSize;
            local v50 = Vector2.new(30, 30) + Vector2.new(10, 10) + v5(l_buttonText_1, v49, l_Font_3, Vector2.new(1000, 1000));
            if not v19.showCompactToast() then
                return v50;
            else
                return Vector2.new(math.min(v50.X, 200), v50.Y);
            end;
        end;
    end);
end;
v18.render = function(v51) --[[ Line: 193 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v3 (copy)
    local l_iconImage_2 = v51.props.iconImage;
    local v53 = v51.getIconSize();
    local l_padding_1 = v51.props.padding;
    local l_toastSubtitle_1 = v51.props.toastSubtitle;
    local l_toastTitle_1 = v51.props.toastTitle;
    return v8(function(v57) --[[ Line: 199 ]]
        -- upvalues: v51 (copy), v53 (copy), l_padding_1 (copy), v3 (ref), l_iconImage_2 (copy), l_toastSubtitle_1 (copy), l_toastTitle_1 (copy)
        local v58, v59 = v51.getTextHeights(v57);
        local v60 = v59 + v58;
        local l_Y_0 = v51.getButtonDimensions(v57).Y;
        local l_size_0 = v51.props.size;
        if v51.props.fitHeight then
            local v63 = math.max(v53.Y, v60) + l_padding_1 * 2 + if v51.showCompactToast() and v51.props.buttonText then l_Y_0 else 0;
            l_size_0 = UDim2.new(l_size_0.X.Scale, l_size_0.X.Offset, 0, v63);
        end;
        local l_Theme_0 = v57.Theme;
        local l_Font_4 = v57.Font;
        local l_Header2_1 = l_Font_4.Header2;
        local l_CaptionBody_1 = l_Font_4.CaptionBody;
        return v3.createElement("TextButton", {
            AnchorPoint = v51.props.anchorPoint, 
            BackgroundTransparency = 1, 
            LayoutOrder = v51.props.layoutOrder, 
            Position = v51.props.position, 
            Size = l_size_0, 
            Text = "", 
            [v3.Change.AbsoluteSize] = function(v68) --[[ Line: 225 ]]
                -- upvalues: v51 (ref)
                if v51.state.containerWidth ~= v68.AbsoluteSize.X then
                    v51:setState({
                        containerWidth = v68.AbsoluteSize.X
                    });
                end;
            end, 
            [v3.Event.Activated] = if not v51.props.buttonText then v51.props.onActivated else nil, 
            [v3.Event.InputBegan] = v51.onButtonInputBegan, 
            [v3.Event.InputEnded] = v51.onButtonInputEnded, 
            [v3.Event.TouchSwipe] = v51.props.onTouchSwipe, 
            [v3.Ref] = v51.containerRef
        }, {
            UISizeConstraint = v3.createElement("UISizeConstraint", v51.props.sizeConstraint), 
            Toast = v51.props.renderToast({
                buttonProps = if v51.props.buttonText and v51.props.onActivated then {
                    buttonDimensions = v51.getButtonDimensions(v57), 
                    buttonText = v51.props.buttonText, 
                    onActivated = v51.props.onActivated, 
                    buttonType = v51.props.buttonType
                } else nil, 
                iconProps = l_iconImage_2 and {
                    colorStyle = v51.props.iconColorStyle, 
                    Image = l_iconImage_2, 
                    Size = UDim2.new(0, v53.X, 0, v53.Y)
                } or nil, 
                iconChildren = v51.props.iconChildren, 
                isCompact = if v51.props.buttonText and v51.props.onActivated then v51.showCompactToast() else nil, 
                padding = l_padding_1, 
                pressed = v51.showPressed(), 
                pressedScale = v51.props.pressedScale, 
                subtitleTextProps = l_toastSubtitle_1 and {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_CaptionBody_1, 
                    Size = UDim2.new(1, 0, 0, v58), 
                    Text = l_toastSubtitle_1
                } or nil, 
                textFrameSize = UDim2.new(1, l_iconImage_2 and -v53.X - l_padding_1 or 0, 0, v60), 
                titleTextProps = {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Header2_1, 
                    Size = UDim2.new(1, 0, 0, v59), 
                    Text = l_toastTitle_1
                }
            })
        });
    end);
end;
v18.didMount = function(v69) --[[ Line: 278 ]] --[[ Name: didMount ]]
    v69:setState({
        containerWidth = v69.containerRef.current and v69.containerRef.current.AbsoluteSize.X or 0
    });
end;
return v18;