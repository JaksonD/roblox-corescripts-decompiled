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
local v10 = require(l_script_FirstAncestor_0.ImageSet.getIconSize);
local v11 = require(l_Core_0.Utility.bindingValidator);
local v12 = require(l_Core_0.ImageSet.Validator.validateImage);
local v13 = require(l_Core_0.Style.Validator.validateColorInfo);
local v14 = require(l_Core_0.Style.withStyle);
local v15 = require(l_Core_0.Button.HoverButtonBackground);
local v16 = require(l_Core_0.ImageSet.ImageSetComponent);
local v17 = require(l_script_FirstAncestor_0.ImageSet.Enum.IconSize);
local l_Focusable_0 = require(l_Parent_1.RoactGamepad).Focusable;
local v19 = require(l_Parent_0.Utility.isCallable);
local v20 = require(l_Parent_0.App.SelectionCursor.useCursor);
local v21 = UDim.new(0, 8);
local v22 = v5.PureComponent:extend("IconButton");
v22.validateProps = v4.strictInterface({
    onStateChanged = v4.optional(v19), 
    isDisabled = v4.optional(v4.boolean), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    colorDefault = v4.optional(v13), 
    colorHover = v4.optional(v13), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v19), 
    onAbsolutePositionChanged = v4.optional(v19), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.union(v4.UDim2, v4.table)), 
    size = v4.optional(v4.union(v4.UDim2, v4.table)), 
    icon = v4.optional(v12), 
    iconSize = v4.optional(v17.isEnumValue), 
    iconColor3 = v4.optional(v4.Color3), 
    iconTransparency = v4.optional(v4.union(v4.number, v11(v4.number))), 
    showBackground = v4.optional(v4.boolean), 
    backgroundColor = v4.optional(v13), 
    backgroundTransparency = v4.optional(v4.union(v4.number, v11(v4.number))), 
    cursor = v4.optional(v4.table), 
    [v5.Children] = v4.optional(v4.table), 
    debugControlState = v4.optional(v8.isEnumValue), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    inputBindings = v4.optional(v4.table), 
    buttonRef = v4.optional(v4.union(v4.callback, v4.table)), 
    [v5.Change.AbsoluteSize] = v4.optional(v4.callback), 
    isRoactGamepadEnabled = v4.optional(v4.boolean)
});
v22.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = nil, 
    icon = "", 
    iconSize = v17.Medium, 
    colorStyleDefault = "IconEmphasis", 
    colorStyleHover = "IconEmphasis", 
    iconColor3 = nil, 
    iconTransparency = nil, 
    showBackground = false, 
    backgroundColor = nil, 
    backgroundTransparency = nil, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    debugControlState = nil, 
    isRoactGamepadEnabled = true
};
v22.init = function(v23) --[[ Line: 133 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v17 (copy)
    v23:setState({
        controlState = v8.Initialize
    });
    v23.onStateChanged = function(v24, v25) --[[ Line: 138 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            controlState = v25
        });
        if v23.props.onStateChanged then
            v23.props.onStateChanged(v24, v25);
        end;
    end;
    local v26 = {
        [v17.Small] = 1, 
        [v17.Medium] = 2, 
        [v17.Large] = 3, 
        [v17.XLarge] = 4, 
        [v17.XXLarge] = 5
    };
    v23.getSize = function(v27) --[[ Line: 154 ]]
        -- upvalues: v23 (copy), v26 (copy)
        if v23.props.size then
            return v23.props.size;
        else
            local v28 = v27 + 4 * v26[v23.props.iconSize];
            return UDim2.fromOffset(v28, v28);
        end;
    end;
end;
v22.render = function(v29) --[[ Line: 165 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy)
    return v14(function(v30) --[[ Line: 166 ]]
        -- upvalues: v29 (copy)
        return v29:renderWithProviders(v30, nil, nil);
    end);
end;
v22.renderWithProviders = function(v31, v32, _, _) --[[ Line: 171 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v10 (copy), v8 (copy), v9 (copy), v5 (copy), l_Focusable_0 (copy), v7 (copy), v16 (copy), v15 (copy), v21 (copy)
    local v35 = v10(v31.props.iconSize, v32);
    local v36 = v31.getSize(v35);
    local l_showBackground_0 = v31.props.showBackground;
    local v38 = v31.props.debugControlState or v31.state.controlState;
    local v39 = {
        [v8.Default] = v31.props.colorStyleDefault, 
        [v8.Hover] = v31.props.colorStyleHover
    };
    local v40 = v9(v39, v38, v32);
    local v41 = nil;
    v41 = if v31.props.backgroundColor == nil then v32.Theme.UIMuted else v31.props.backgroundColor;
    return v5.createElement(if v31.props.isRoactGamepadEnabled then l_Focusable_0[v7] else v7, {
        AnchorPoint = v31.props.anchorPoint, 
        LayoutOrder = v31.props.layoutOrder, 
        Position = v31.props.position, 
        Size = v36, 
        isDisabled = v31.props.isDisabled, 
        onStateChanged = v31.onStateChanged, 
        userInteractionEnabled = v31.props.userInteractionEnabled, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        [v5.Change.AbsoluteSize] = v31.props[v5.Change.AbsoluteSize], 
        [v5.Change.AbsolutePosition] = v31.props.onAbsolutePositionChanged, 
        [v5.Event.Activated] = v31.props.onActivated, 
        [v5.Ref] = v31.props.buttonRef, 
        NextSelectionLeft = v31.props.NextSelectionLeft, 
        NextSelectionRight = v31.props.NextSelectionRight, 
        NextSelectionUp = v31.props.NextSelectionUp, 
        NextSelectionDown = v31.props.NextSelectionDown, 
        inputBindings = if v31.props.isRoactGamepadEnabled then v31.props.inputBindings else nil, 
        SelectionImageObject = v31.props.cursor
    }, {
        sizeConstraint = v5.createElement("UISizeConstraint", {
            MinSize = Vector2.new(v35, v35)
        }), 
        imageLabel = v5.createElement(v16.Label, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(v35, v35), 
            BackgroundTransparency = 1, 
            Image = v31.props.icon, 
            ImageColor3 = v31.props.iconColor3 or v40.Color, 
            ImageTransparency = v31.props.iconTransparency or v40.Transparency
        }, v31.props[v5.Children]), 
        hoverBackground = v38 == v8.Hover and v5.createElement(v15) or nil, 
        background = l_showBackground_0 and v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v41.Color, 
            BackgroundTransparency = v31.props.backgroundTransparency or v41.Transparency, 
            ZIndex = 0
        }, {
            corner = v5.createElement("UICorner", {
                CornerRadius = v21
            })
        }) or nil
    });
end;
local function v44(v42) --[[ Line: 239 ]] --[[ Name: IconButtonFunctionalWrapper ]]
    -- upvalues: v20 (copy), v21 (copy), v5 (copy), v22 (copy), v6 (copy)
    local v43 = v20(v21);
    return v5.createElement(v22, v6.Dictionary.join(v42, {
        cursor = v43
    }));
end;
local v45 = v5.PureComponent:extend("IconButtonOuterWrapper");
v45.validateProps = v22.validateProps;
v45.render = function(v46) --[[ Line: 253 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v44 (copy)
    return v5.createElement(v44, v46.props);
end;
return v45;