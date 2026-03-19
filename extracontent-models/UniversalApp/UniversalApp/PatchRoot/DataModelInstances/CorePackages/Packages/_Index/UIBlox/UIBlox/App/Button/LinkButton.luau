local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.Cryo);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = require(l_Core_0.Button.getContentStyle);
local v10 = require(l_Core_0.Text.GetTextSize);
local v11 = require(l_Core_0.Text.CleanRichTextTags);
local v12 = require(l_Core_0.Style.withStyle);
local v13 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v14 = require(l_Core_0.Button.HoverButtonBackground);
local v15 = require(l_script_FirstAncestor_0.SelectionCursor.useCursorByType);
local v16 = require(l_script_FirstAncestor_0.SelectionCursor.CursorType);
local l_Focusable_0 = require(l_Parent_1.RoactGamepad).Focusable;
local v18 = v5.PureComponent:extend("LinkButton");
v18.validateProps = v4.strictInterface({
    onStateChanged = v4.optional(v4.callback), 
    isDisabled = v4.optional(v4.boolean), 
    fontStyle = v4.optional(v4.string), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    hoverBackgroundEnabled = v4.optional(v4.boolean), 
    underlineAlwaysEnabled = v4.optional(v4.boolean), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v4.callback), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    size = v4.optional(v4.UDim2), 
    text = v4.optional(v4.string), 
    minPaddingX = v4.optional(v4.number), 
    minPaddingY = v4.optional(v4.number), 
    selectionCursorKind = v4.optional(v4.userdata), 
    debugGetTextSize = v4.optional(v4.callback), 
    debugControlState = v4.optional(v8.isEnumValue), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    buttonRef = v4.optional(v4.union(v4.callback, v4.table)), 
    cursor = v4.optional(v4.table)
});
v18.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.fromScale(0, 0), 
    text = "", 
    fontStyle = "Header2", 
    colorStyleDefault = "TextLink", 
    colorStyleHover = "TextLink", 
    hoverBackgroundEnabled = false, 
    underlineAlwaysEnabled = false, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    minPaddingX = 8, 
    minPaddingY = 11, 
    debugGetTextSize = v10, 
    debugControlState = nil
};
v18.init = function(v19) --[[ Line: 109 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v19:setState({
        controlState = v8.Initialize
    });
    v19.applyRichTextUnderline = function(v20) --[[ Line: 114 ]]
        return "<u>" .. v20 .. "</u>";
    end;
    v19.onStateChanged = function(v21, v22) --[[ Line: 118 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            controlState = v22
        });
        if v19.props.onStateChanged then
            v19.props.onStateChanged(v21, v22);
        end;
    end;
end;
v18.render = function(v23) --[[ Line: 128 ]] --[[ Name: render ]]
    return v23:renderWithSelectionCursorProvider(nil, v23.props.cursor);
end;
v18.renderWithSelectionCursorProvider = function(v24, _, v26) --[[ Line: 132 ]] --[[ Name: renderWithSelectionCursorProvider ]]
    -- upvalues: v12 (copy), v8 (copy), v9 (copy), v11 (copy), v5 (copy), l_Focusable_0 (copy), v7 (copy), v13 (copy), v14 (copy)
    return v12(function(v27) --[[ Line: 133 ]]
        -- upvalues: v24 (copy), v8 (ref), v9 (ref), v11 (ref), v26 (copy), v5 (ref), l_Focusable_0 (ref), v7 (ref), v13 (ref), v14 (ref)
        local v28 = v24.props.debugControlState or v24.state.controlState;
        local v29 = {
            [v8.Default] = v24.props.colorStyleDefault, 
            [v8.Hover] = v24.props.colorStyleHover
        };
        local v30 = v9(v29, v28, v27);
        local v31 = v27.Font[v24.props.fontStyle];
        if v24.props.underlineAlwaysEnabled == true and v28 == v8.Hover then
            v30.Transparency = 0.3;
        end;
        local v32 = v31.RelativeSize * v27.Font.BaseSize;
        local l_X_0 = v24.props.debugGetTextSize(v11(v24.props.text), v32, v31.Font, Vector2.new(10000, 0)).X;
        local l_text_0 = v24.props.text;
        if v24.props.underlineAlwaysEnabled or v28 == v8.Hover or v28 == v8.Pressed then
            l_text_0 = v24.applyRichTextUnderline(v24.props.text);
        end;
        local l_minPaddingX_0 = v24.props.minPaddingX;
        local l_minPaddingY_0 = v24.props.minPaddingY;
        local v37 = Vector2.new(l_X_0 + l_minPaddingX_0 * 2, v32 + l_minPaddingY_0 * 2);
        local l_v26_0 = v26;
        return v5.createElement(l_Focusable_0[v7], {
            AnchorPoint = v24.props.anchorPoint, 
            LayoutOrder = v24.props.layoutOrder, 
            Position = v24.props.position, 
            Size = v24.props.size, 
            isDisabled = v24.props.isDisabled, 
            onStateChanged = v24.onStateChanged, 
            userInteractionEnabled = v24.props.userInteractionEnabled, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            SelectionImageObject = l_v26_0, 
            [v5.Event.Activated] = v24.props.onActivated, 
            [v5.Ref] = v24.props.buttonRef, 
            NextSelectionLeft = v24.props.NextSelectionLeft, 
            NextSelectionRight = v24.props.NextSelectionRight, 
            NextSelectionUp = v24.props.NextSelectionUp, 
            NextSelectionDown = v24.props.NextSelectionDown
        }, {
            sizeConstraint = v5.createElement("UISizeConstraint", {
                MinSize = v37
            }), 
            textLabel = v5.createElement(v13, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                fontStyle = v31, 
                colorStyle = v30, 
                RichText = true
            }), 
            background = v24.props.hoverBackgroundEnabled and v28 == v8.Hover and v5.createElement(v14)
        });
    end);
end;
LinkButtonFunctionalWrapper = function(v39) --[[ Line: 209 ]] --[[ Name: LinkButtonFunctionalWrapper ]]
    -- upvalues: v15 (copy), v16 (copy), v5 (copy), v18 (copy), v6 (copy)
    local v40 = v15(v16.RoundedRectNoInset);
    return v5.createElement(v18, v6.Dictionary.join(v39, {
        cursor = v40
    }));
end;
return LinkButtonFunctionalWrapper;