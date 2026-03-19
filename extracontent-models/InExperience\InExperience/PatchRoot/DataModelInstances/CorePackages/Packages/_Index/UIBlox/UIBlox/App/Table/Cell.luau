local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Roact);
local v7 = require(l_Parent_2.enumerate);
local v8 = require(l_Core_0.Utility.bindingValidator);
local v9 = require(l_Core_0.Style.withStyle);
local v10 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v11 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v12 = require(l_Core_0.Control.Interactable);
local v13 = require(l_Core_0.Control.Enum.ControlState);
local v14 = require(l_Parent_0.SelectionCursor.CursorType);
local v15 = v6.PureComponent:extend("Cell");
v15.debugProps = v7("debugProps", {
    "controlState"
});
v15.validateProps = v5.strictInterface({
    head = v5.table, 
    tail = v5.optional(v5.table), 
    background = v5.optional(v5.table), 
    layoutOrder = v5.optional(v5.union(v5.integer, v8(v5.number))), 
    size = v5.optional(v5.UDim2), 
    anchorPoint = v5.optional(v5.Vector2), 
    position = v5.optional(v5.UDim2), 
    horizontalPadding = v5.optional(v5.number), 
    selectable = v5.optional(v5.boolean), 
    layoutWraps = v5.optional(v5.boolean), 
    isDisabled = v5.optional(v5.boolean), 
    userInteractionEnabled = v5.optional(v5.boolean), 
    onStateChanged = v5.optional(v5.callback), 
    onActivated = v5.optional(v5.callback), 
    onTouchTapped = v5.optional(v5.callback), 
    [v15.debugProps.controlState] = v5.optional(v13.isEnumValue), 
    [v6.Change.AbsolutePosition] = v5.optional(v5.callback), 
    [v6.Ref] = v5.optional(v5.union(v5.callback, v5.table)), 
    forwardRef = v5.optional(v5.union(v5.callback, v5.table)), 
    selectionCursor = v5.optional(v5.any)
});
v15.defaultProps = {
    isDisabled = false, 
    userInteractionEnabled = true, 
    horizontalPadding = 24
};
v15.init = function(v16) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy)
    v16:setState({
        controlState = v13.Initialize
    });
    v16.stateStyleMap = {
        [v13.Default] = "BackgroundDefault", 
        [v13.Hover] = "BackgroundOnHover", 
        [v13.Pressed] = "BackgroundOnPress"
    };
    v16.getBackgroundStyle = function(v17, v18) --[[ Line: 90 ]]
        -- upvalues: v16 (copy), v13 (ref)
        local v19 = v16.stateStyleMap[v17] or v16.stateStyleMap[v13.Default];
        local v20 = {
            Color = v18.Theme[v19].Color, 
            Transparency = v18.Theme[v19].Transparency
        };
        if v17 == v13.Disabled then
            v20.Transparency = 1;
        end;
        return v20;
    end;
    v16.onStateChanged = function(v21, v22) --[[ Line: 106 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            controlState = v22
        });
        if v16.props.onStateChanged then
            v16.props.onStateChanged(v21, v22);
        end;
    end;
end;
v15.render = function(v23) --[[ Line: 116 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v10 (copy)
    return v9(function(v24) --[[ Line: 117 ]]
        -- upvalues: v10 (ref), v23 (copy)
        return v10(function(v25) --[[ Line: 118 ]]
            -- upvalues: v23 (ref), v24 (copy)
            return v23:renderWithProviders(v24, v25);
        end);
    end);
end;
v15.renderWithProviders = function(v26, v27, _) --[[ Line: 124 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v15 (copy), v6 (copy), v12 (copy), v13 (copy)
    local l_anchorPoint_0 = v26.props.anchorPoint;
    local l_layoutOrder_0 = v26.props.layoutOrder;
    local l_position_0 = v26.props.position;
    local v32 = v26.props.size or UDim2.fromScale(1, 1);
    local l_head_0 = v26.props.head;
    local l_tail_0 = v26.props.tail;
    local l_background_0 = v26.props.background;
    local l_isDisabled_0 = v26.props.isDisabled;
    local v37 = v26.props.onActivated and function(...) --[[ Line: 139 ]]
        -- upvalues: v26 (copy)
        if v26.props.tail and v26.props.userInteractionEnabled and v26.props.onActivated then
            v26.props.onActivated(...);
        end;
    end or v26.props.onActivated;
    local l_onTouchTapped_0 = v26.props.onTouchTapped;
    local v39 = v26.props[v15.debugProps.controlState] or v26.state.controlState;
    local v40 = v26.getBackgroundStyle(v39, v27);
    return v6.createElement(v12, {
        AnchorPoint = l_anchorPoint_0, 
        LayoutOrder = l_layoutOrder_0, 
        Position = l_position_0, 
        Size = v32, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        Selectable = v26.props.selectable, 
        SelectionImageObject = v26.props.selectionCursor, 
        isDisabled = l_isDisabled_0, 
        onStateChanged = v26.onStateChanged, 
        [v6.Event.Activated] = v37, 
        [v6.Event.TouchTap] = l_onTouchTapped_0, 
        [v6.Change.AbsolutePosition] = v26.props[v6.Change.AbsolutePosition], 
        [v6.Ref] = v26.props.forwardRef
    }, {
        CellBackground = v6.createElement("Frame", {
            Size = v32, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ZIndex = -1
        }, {
            Background = l_background_0 or v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v40.Color, 
                BackgroundTransparency = v40.Transparency, 
                BorderSizePixel = 0
            }), 
            CellContent = v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
                    Wraps = v26.props.layoutWraps
                }), 
                Padding = v6.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v26.props.horizontalPadding), 
                    PaddingRight = UDim.new(0, v26.props.horizontalPadding)
                }), 
                CellHead = v6.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.fromScale(0, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 1
                }, {
                    Head = l_head_0
                }), 
                CellTail = l_tail_0 and v6.createElement("Frame", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.fromScale(1, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2
                }, {
                    Tail = l_tail_0
                }) or nil
            })
        }), 
        DisabledMask = v39 == v13.Disabled and v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v40.Color, 
            BackgroundTransparency = 0.5, 
            ZIndex = 100
        }) or nil
    });
end;
return v6.forwardRef(function(v41, v42) --[[ Line: 233 ]]
    -- upvalues: v11 (copy), v14 (copy), v4 (copy), v6 (copy), v15 (copy)
    local v43 = v11(v14.RoundedRectNoInset);
    v41 = v4.Dictionary.join({
        selectionCursor = v43
    }, v41);
    return v6.createElement(v15, v4.Dictionary.join(v41, {
        forwardRef = v42
    }));
end);