local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_0.SelectionCursor.CursorType);
local v8 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v9 = require(l_Parent_1.App.Cell.Small.SelectionGroup.SmallRadioButtonCell);
local v10 = v3.PureComponent:extend("SmallRadioButtonGroup");
local v11 = v6.strictInterface({
    text = v6.string, 
    id = v6.string, 
    isDisabled = v6.optional(v6.boolean)
});
v10.validateProps = v6.strictInterface({
    items = v6.optional(v6.array(v6.tuple(v11))), 
    selectedValue = v6.optional(v6.string), 
    cursor = v6.optional(v6.table), 
    onActivated = v6.callback, 
    layoutOrder = v6.optional(v6.number), 
    useDefaultControlState = v6.optional(v6.boolean), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table), 
    isRoactGamepadEnabled = v6.optional(v6.boolean)
});
v10.defaultProps = {
    selectedValue = nil, 
    isRoactGamepadEnabled = true
};
v10.init = function(v12) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v12.gamepadRefs = v12.props.isRoactGamepadEnabled and v5.createRefCache() or {};
end;
v10.renderButtonCell = function(v13, v14, v15, v16) --[[ Line: 69 ]] --[[ Name: renderButtonCell ]]
    -- upvalues: v3 (copy), v5 (copy), v9 (copy)
    return v3.createElement(if v16 then v5.Focusable[v9] else v9, {
        id = v14.id, 
        text = v14.text, 
        onActivated = v13.props.onActivated, 
        isSelected = v13.props.selectedValue == v14.id, 
        isDisabled = v14.isDisabled, 
        layoutOrder = v15, 
        useDefaultControlState = v13.props.useDefaultControlState, 
        [v3.Ref] = v13.gamepadRefs[v15], 
        NextSelectionUp = v15 > 1 and v13.gamepadRefs[v15 - 1] or nil, 
        NextSelectionDown = v15 < #v13.props.items and v13.gamepadRefs[v15 + 1] or nil, 
        SelectionImageObject = v13.props.cursor
    });
end;
v10.render = function(v17) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy)
    assert(v17.validateProps(v17.props));
    local v18 = {
        layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 1)
        })
    };
    local l_isRoactGamepadEnabled_0 = v17.props.isRoactGamepadEnabled;
    for v20, v21 in ipairs(v17.props.items) do
        if not l_isRoactGamepadEnabled_0 then
            v17.gamepadRefs[v20] = v17.gamepadRefs[v20] or v3.createRef();
        end;
        v18["smallRadioButtonCell" .. v21.id] = v17:renderButtonCell(v21, v20, l_isRoactGamepadEnabled_0);
    end;
    local v22 = l_isRoactGamepadEnabled_0 and v17.props.items and #v17.props.items > 0;
    return v3.createElement(if v22 then v5.Focusable.Frame else "Frame", {
        defaultChild = if v22 then v17.gamepadRefs[1] else nil, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v17.props.layoutOrder, 
        NextSelectionLeft = v17.props.NextSelectionLeft, 
        NextSelectionRight = v17.props.NextSelectionRight, 
        NextSelectionDown = v17.props.NextSelectionDown, 
        NextSelectionUp = v17.props.NextSelectionUp, 
        [v3.Ref] = v17.props.frameRef
    }, v18);
end;
return v3.forwardRef(function(v23, v24) --[[ Line: 121 ]]
    -- upvalues: v8 (copy), v7 (copy), v3 (copy), v10 (copy), v4 (copy)
    local v25 = v8(v7.SelectionCell);
    return v3.createElement(v10, v4.Dictionary.join(v23, {
        frameRef = v24, 
        cursor = v25
    }));
end);