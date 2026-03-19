local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_0.ImageSet.Images);
local v9 = require(l_Parent_0.SelectionCursor.useCursor);
local v10 = require(l_Core_0.Control.Enum.ControlState);
local v11 = require(l_Core_0.Button.GenericButton);
local v12 = require(l_Core_0.ImageSet.Validator.validateImage);
local v13 = require(l_Core_0.Style.withStyle);
local v14 = v4.PureComponent:extend("ComboButton");
local v15 = UDim.new(0, 8);
local v16 = {
    [v10.Default] = "ContextualPrimaryDefault", 
    [v10.Hover] = "ContextualPrimaryOnHover"
};
local v17 = {
    [v10.Default] = "ContextualPrimaryContent"
};
v14.validateProps = v6.strictInterface({
    button = v6.strictInterface({
        icon = v6.optional(v12), 
        text = v6.optional(v6.string), 
        isDisabled = v6.optional(v6.boolean), 
        onActivated = v6.callback
    }), 
    overflow = v6.strictInterface({
        icon = v6.optional(v12), 
        isDisabled = v6.optional(v6.boolean), 
        onActivated = v6.callback
    }), 
    position = v6.optional(v6.UDim2), 
    size = v6.optional(v6.UDim2), 
    layoutOrder = v6.optional(v6.number), 
    cursor = v6.optional(v6.table), 
    testId = v6.optional(v6.string)
});
v14.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    testId = "--uiblox-combo-button"
};
v14.init = function(v18) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v18:setState({
        buttonControlState = v10.Initialize, 
        overflowControlState = v10.Initialize
    });
    v18.onButtonStateChanged = function(_, v20) --[[ Line: 80 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            buttonControlState = v20
        });
    end;
    v18.onOverflowStateChanged = function(_, v22) --[[ Line: 84 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            overflowControlState = v22
        });
    end;
end;
v14.render = function(v23) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy)
    return v13(function(v24) --[[ Line: 90 ]]
        -- upvalues: v23 (copy)
        return v23:renderWithProviders(v24, nil, nil);
    end);
end;
v14.renderWithProviders = function(v25, _, _, _) --[[ Line: 95 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v4 (copy), v5 (copy), v11 (copy), v8 (copy), v16 (copy), v17 (copy)
    local l_size_0 = v25.props.size;
    local v30 = UDim2.new(1, -40, 1, 0);
    local v31 = UDim2.new(0, 39, 1, 0);
    return v4.createElement("Frame", {
        LayoutOrder = v25.props.layoutOrder, 
        Position = v25.props.position, 
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        [v5.Tag] = if v25.props.testId then ("data-testid=%*"):format(v25.props.testId) else nil
    }, {
        Button = v4.createElement(v11, {
            Position = UDim2.fromScale(0, 0), 
            Size = v30, 
            buttonImage = v8["component_assets/bulletLeft_17"], 
            buttonStateColorMap = v16, 
            contentStateColorMap = v17, 
            hoverImage = v8["component_assets/bulletLeft_17"], 
            icon = v25.props.button.icon, 
            isDisabled = v25.props.button.isDisabled, 
            isHoverBackgroundEnabled = true, 
            onActivated = v25.props.button.onActivated, 
            onStateChanged = v25.onButtonStateChanged, 
            SelectionImageObject = v25.props.cursor, 
            text = v25.props.button.text, 
            ZIndex = 0
        }), 
        Overflow = v4.createElement(v11, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            Size = v31, 
            ZIndex = 0, 
            buttonImage = v8["component_assets/bulletRight_17"], 
            buttonStateColorMap = v16, 
            contentStateColorMap = v17, 
            hoverImage = v8["component_assets/bulletRight_17"], 
            icon = v25.props.overflow.icon or v8["icons/actions/truncationExpand"], 
            isDisabled = v25.props.overflow.isDisabled, 
            isHoverBackgroundEnabled = true, 
            onActivated = v25.props.overflow.onActivated, 
            onStateChanged = v25.onOverflowStateChanged, 
            SelectionImageObject = v25.props.cursor
        })
    });
end;
ComboButtonFunctionalWrapper = function(v32) --[[ Line: 142 ]] --[[ Name: ComboButtonFunctionalWrapper ]]
    -- upvalues: v9 (copy), v15 (copy), v4 (copy), v14 (copy), v7 (copy)
    local v33 = v9(v15);
    return v4.createElement(v14, v7.Dictionary.join(v32, {
        cursor = v33
    }));
end;
local v34 = v4.PureComponent:extend("ComboButtonOuterWrapper");
v34.validateProps = v14.validateProps;
v34.render = function(v35) --[[ Line: 156 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy)
    return v4.createElement(ComboButtonFunctionalWrapper, v35.props);
end;
return v34;