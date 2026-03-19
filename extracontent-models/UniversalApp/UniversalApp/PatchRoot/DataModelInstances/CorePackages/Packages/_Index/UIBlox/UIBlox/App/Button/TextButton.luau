local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.Cryo);
local v8 = require(l_Core_0.Control.Interactable);
local v9 = require(l_Core_0.Control.Enum.ControlState);
local v10 = require(l_Core_0.Button.getContentStyle);
local v11 = require(l_Core_0.Text.GetTextSize);
local v12 = require(l_Core_0.Text.CleanRichTextTags);
local v13 = require(l_Parent_0.Utility.isReactTagProp);
local v14 = require(l_script_FirstAncestor_0.SelectionImage.CursorKind);
local v15 = require(l_Core_0.Style.Validator.validateColorInfo);
local v16 = require(l_Core_0.Style.withStyle);
local v17 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v18 = require(l_Parent_0.App.SelectionCursor.useCursor);
local v19 = UDim.new(0, 8);
local v20 = v5.PureComponent:extend("TextButton");
v20.validateProps = v4.strictInterface({
    [v6.Tag] = v13, 
    onStateChanged = v4.optional(v4.callback), 
    isDisabled = v4.optional(v4.boolean), 
    fontStyle = v4.optional(v4.string), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    hoverBackgroundEnabled = v4.optional(v4.boolean), 
    richText = v4.optional(v4.boolean), 
    showBackground = v4.optional(v4.boolean), 
    backgroundColor = v4.optional(v15), 
    horizontalPadding = v4.optional(v4.number), 
    verticalPadding = v4.optional(v4.number), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v4.callback), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    size = v4.optional(v4.UDim2), 
    text = v4.optional(v4.string), 
    cursor = v4.optional(v4.table), 
    debugGetTextSize = v4.optional(v4.callback), 
    debugControlState = v4.optional(v9.isEnumValue)
});
v20.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.fromScale(0, 0), 
    text = "", 
    verticalPadding = 11, 
    horizontalPadding = 8, 
    showBackground = false, 
    fontStyle = "Header2", 
    colorStyleDefault = "TextEmphasis", 
    colorStyleHover = "TextEmphasis", 
    hoverBackgroundEnabled = true, 
    richText = false, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    debugGetTextSize = v11, 
    debugControlState = nil
};
v20.init = function(v21) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    v21:setState({
        controlState = v9.Initialize
    });
    v21.onStateChanged = function(v22, v23) --[[ Line: 112 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            controlState = v23
        });
        if v21.props.onStateChanged then
            v21.props.onStateChanged(v22, v23);
        end;
    end;
end;
v20.render = function(v24) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy)
    return v16(function(v25) --[[ Line: 123 ]]
        -- upvalues: v24 (copy)
        return v24:renderWithProviders(v25, nil, nil);
    end);
end;
v20.renderWithProviders = function(v26, v27, v28, v29) --[[ Line: 128 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v9 (copy), v10 (copy), v12 (copy), v5 (copy), v8 (copy), v6 (copy), v19 (copy), v14 (copy), v17 (copy)
    local v30 = v26.props.debugControlState or v26.state.controlState;
    local v31 = {
        [v9.Default] = v26.props.colorStyleDefault, 
        [v9.Hover] = v26.props.colorStyleHover
    };
    local v32 = v10(v31, v30, v27);
    local v33 = v27.Font[v26.props.fontStyle];
    local v34 = v33.RelativeSize * v27.Font.BaseSize;
    local l_X_0 = v26.props.debugGetTextSize(v26.props.richText and v12(v26.props.text) or v26.props.text, v34, v33.Font, Vector2.new(10000, 0)).X;
    local v36 = if v26.props.showBackground then v26.props.backgroundColor or v27.Theme.UIMuted else {
        Color = nil, 
        Transparency = 1
    };
    local l_verticalPadding_0 = v26.props.verticalPadding;
    local l_horizontalPadding_0 = v26.props.horizontalPadding;
    local l_BackgroundOnHover_0 = v27.Theme.BackgroundOnHover;
    if v26.props.hoverBackgroundEnabled and v30 == v9.Hover then
        v36 = if v36.Color then {
            Color = v36.Color:Lerp(l_BackgroundOnHover_0.Color, 1 - l_BackgroundOnHover_0.Transparency), 
            Transparency = v36.Transparency
        } else l_BackgroundOnHover_0;
    end;
    return v5.createElement(v8, {
        [v6.Tag] = v26.props[v6.Tag], 
        AnchorPoint = v26.props.anchorPoint, 
        LayoutOrder = v26.props.layoutOrder, 
        Position = v26.props.position, 
        Size = v26.props.size, 
        isDisabled = v26.props.isDisabled, 
        onStateChanged = v26.onStateChanged, 
        userInteractionEnabled = v26.props.userInteractionEnabled, 
        BackgroundColor3 = v36.Color, 
        BackgroundTransparency = v36.Transparency, 
        AutoButtonColor = false, 
        SelectionImageObject = if v29 then v29(v19) else v28 and v28(v14.RoundedRectNoInset), 
        [v5.Event.Activated] = v26.props.onActivated
    }, {
        corner = v5.createElement("UICorner", {
            CornerRadius = v19
        }), 
        sizeConstraint = v5.createElement("UISizeConstraint", {
            MinSize = Vector2.new(l_X_0 + l_horizontalPadding_0 * 2, v34 + l_verticalPadding_0 * 2)
        }), 
        textLabel = v5.createElement(v17, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Text = v26.props.text, 
            fontStyle = v33, 
            colorStyle = v32, 
            RichText = v26.props.richText
        })
    });
end;
local function v42(v40) --[[ Line: 203 ]] --[[ Name: TextButtonFunctionalWrapper ]]
    -- upvalues: v18 (copy), v19 (copy), v5 (copy), v20 (copy), v7 (copy)
    local v41 = v18(v19);
    return v5.createElement(v20, v7.Dictionary.join(v40, {
        cursor = v41
    }));
end;
local v43 = v5.PureComponent:extend("TextButtonOuterWrapper");
v43.validateProps = v20.validateProps;
v43.render = function(v44) --[[ Line: 217 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v42 (copy)
    return v5.createElement(v42, v44.props);
end;
return v43;