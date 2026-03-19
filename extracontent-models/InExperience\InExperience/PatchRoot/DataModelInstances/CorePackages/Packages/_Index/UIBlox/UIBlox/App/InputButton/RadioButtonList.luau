local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_UIBlox_0 = l_Parent_0.UIBlox;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactGamepad);
local v4 = require(l_Parent_0.t);
local v5 = require(script.Parent.RadioButton);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_UIBlox_0.App.SelectionCursor.useCursorByType);
local v8 = require(l_UIBlox_0.App.SelectionCursor.CursorType);
local v9 = v2.PureComponent:extend("RadioButtonList");
local v10 = v4.strictInterface({
    label = v4.string, 
    isDisabled = v4.optional(v4.boolean)
});
v9.validateProps = v4.strictInterface({
    radioButtons = v4.array(v4.union(v4.string, v10)), 
    onActivated = v4.callback, 
    elementSize = v4.UDim2, 
    initialValue = v4.optional(v4.number), 
    currentValue = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.number), 
    padding = v4.optional(v4.UDim), 
    automaticSize = v4.optional(v4.boolean), 
    cursor = v4.table, 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    forwardRef = v4.optional(v4.table), 
    isRoactGamepadEnabled = v4.optional(v4.boolean)
});
v9.defaultProps = {
    isRoactGamepadEnabled = true
};
v9.init = function(v11) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v11.state = {
        currentValue = v11.props.initialValue or 0
    };
    local v12 = {};
    for v13, v14 in ipairs(v11.props.radioButtons) do
        v12[v13] = type(v14) == "table" and (v14.isDisabled or false);
    end;
    v11.state.disabledIndices = v12;
    v11.doLogic = function(v15) --[[ Line: 68 ]]
        -- upvalues: v11 (copy)
        if v11.state.disabledIndices[v15] then
            return;
        else
            v11:setState({
                currentValue = v15
            });
            v11.props.onActivated(v15);
            return;
        end;
    end;
    v11.gamepadRefs = v11.props.isRoactGamepadEnabled and v3.createRefCache() or {};
end;
v9.renderWithProviders = function(v16, _, v18) --[[ Line: 81 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy)
    local v19 = {
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v16.props.padding
        })
    };
    for v20, v21 in ipairs(v16.props.radioButtons) do
        if not v16.props.isRoactGamepadEnabled then
            v16.gamepadRefs[v20] = v16.gamepadRefs[v20] or v2.createRef();
        end;
        v19["RadioButton" .. v20] = v2.createElement(if v16.props.isRoactGamepadEnabled then v3.Focusable[v5] else v5, {
            text = type(v21) == "table" and v21.label or v21, 
            isSelected = if v16.props.currentValue ~= nil then v20 == v16.props.currentValue else v20 == v16.state.currentValue, 
            isDisabled = v16.state.disabledIndices[v20], 
            onActivated = v16.doLogic, 
            size = v16.props.elementSize, 
            layoutOrder = v20, 
            id = v20, 
            isRoactGamepadEnabled = v16.props.isRoactGamepadEnabled, 
            [v2.Ref] = v16.gamepadRefs[v20], 
            NextSelectionUp = v20 > 1 and v16.gamepadRefs[v20 - 1] or nil, 
            NextSelectionDown = v20 < #v16.props.radioButtons and v16.gamepadRefs[v20 + 1] or nil, 
            SelectionImageObject = v18, 
            inputBindings = if v16.props.isRoactGamepadEnabled then {
                OnActivatedButton = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 112 ]]
                    -- upvalues: v16 (copy), v20 (copy)
                    v16.doLogic(v20);
                end)
            } else nil
        });
    end;
    return v2.createElement(if v16.props.isRoactGamepadEnabled then v3.Focusable.Frame else "Frame", {
        Size = if v16.props.automaticSize then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1), 
        AutomaticSize = if v16.props.automaticSize then Enum.AutomaticSize.Y else nil, 
        BackgroundTransparency = 1, 
        LayoutOrder = v16.props.layoutOrder, 
        [v2.Ref] = v16.props.forwardRef, 
        NextSelectionLeft = v16.props.NextSelectionLeft, 
        NextSelectionRight = v16.props.NextSelectionRight, 
        NextSelectionDown = v16.props.NextSelectionDown, 
        NextSelectionUp = v16.props.NextSelectionUp
    }, v19);
end;
v9.render = function(v22) --[[ Line: 134 ]] --[[ Name: render ]]
    return v22:renderWithProviders(nil, v22.props.cursor);
end;
return v2.forwardRef(function(v23, v24) --[[ Line: 138 ]]
    -- upvalues: v7 (copy), v8 (copy), v2 (copy), v9 (copy), v6 (copy)
    local v25 = v7(v8.RoundedRect);
    return v2.createElement(v9, v6.Dictionary.join(v23, {
        forwardRef = v24, 
        cursor = v25
    }));
end);