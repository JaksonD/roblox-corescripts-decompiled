local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_0.Core.Utility.bindingValidator);
local v6 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v7 = require(script.Parent.InteractableListItem);
local v8 = require(script.Parent.Enum.SelectionMode);
local v9 = v2.PureComponent:extend("InteractableList");
v9.validateProps = v3.strictInterface({
    itemList = v3.table, 
    renderItem = v3.callback, 
    renderList = v3.optional(v3.callback), 
    selection = v3.optional(v3.table), 
    selectionMode = v3.optional(v8.isEnumValue), 
    onSelectionChanged = v3.optional(v3.callback), 
    size = v3.optional(v3.UDim2), 
    position = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.integer), 
    padding = v3.optional(v3.UDim), 
    fillDirection = v3.optional(v3.enum(Enum.FillDirection)), 
    horizontalAlignment = v3.optional(v3.enum(Enum.HorizontalAlignment)), 
    verticalAlignment = v3.optional(v3.enum(Enum.VerticalAlignment)), 
    sortOrder = v3.optional(v3.enum(Enum.SortOrder)), 
    automaticSize = v3.optional(v3.enum(Enum.AutomaticSize)), 
    itemSize = v3.optional(v3.union(v3.UDim2, v5(v3.UDim2)))
});
v9.defaultProps = {
    renderList = function(v10, v11, v12) --[[ Line: 60 ]] --[[ Name: renderList ]]
        -- upvalues: v2 (copy)
        local v13 = {
            v2.createElement("UIListLayout", {
                Padding = v12.padding, 
                FillDirection = v12.fillDirection, 
                HorizontalAlignment = v12.horizontalAlignment, 
                VerticalAlignment = v12.verticalAlignment, 
                SortOrder = v12.sortOrder, 
                key = "$layout"
            })
        };
        for v14 in pairs(v10) do
            table.insert(v13, v11(v14));
        end;
        return v2.createElement("Frame", {
            Size = v12.size, 
            Position = v12.position, 
            BackgroundTransparency = 1, 
            AutomaticSize = v12.automaticSize, 
            BorderSizePixel = 0
        }, v13);
    end, 
    size = UDim2.fromScale(1, 1), 
    itemSize = UDim2.fromScale(1, 1), 
    selectionMode = v8.Single
};
v9.init = function(v15) --[[ Line: 88 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v4 (copy)
    local v16 = {
        interactable = {}, 
        selection = {}
    };
    if v15.props.selectionMode == v8.Single then
        local v17 = next(v15.props.itemList);
        if v17 ~= nil then
            v16.selection = {
                v17
            };
        end;
    end;
    v15:setState(v16);
    v15.setInteractableState = function(v18, v19) --[[ Line: 101 ]]
        -- upvalues: v15 (copy), v4 (ref)
        v15:setState(function(v20) --[[ Line: 102 ]]
            -- upvalues: v4 (ref), v18 (copy), v19 (copy)
            return {
                interactable = v4.Dictionary.join(v20.interactable, {
                    [v18] = v19
                })
            };
        end);
    end;
    v15.setSelection = function(v21) --[[ Line: 110 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            selection = v21
        });
    end;
end;
v9.getSelection = function(v22) --[[ Line: 117 ]] --[[ Name: getSelection ]]
    -- upvalues: v8 (copy), v4 (copy)
    if v22.props.selection then
        return v22.props.selection;
    elseif v22.props.selectionMode == v8.None then
        return {};
    else
        local v24 = v4.List.filter(v22.state.selection, function(v23) --[[ Line: 124 ]]
            -- upvalues: v22 (copy)
            return v22.props.itemList[v23] ~= nil;
        end);
        if v22.props.selectionMode == v8.Single then
            local v25 = v24[#v24];
            if v25 == nil then
                v25 = next(v22.props.itemList);
            end;
            if v25 ~= nil then
                return {
                    v25
                };
            else
                return {};
            end;
        else
            return v24;
        end;
    end;
end;
v9.didMount = function(v26) --[[ Line: 142 ]] --[[ Name: didMount ]]
    if v26.props.selection == nil and v26.props.onSelectionChanged then
        v26.props.onSelectionChanged(v26:getSelection());
    end;
end;
v9.render = function(v27) --[[ Line: 148 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy), v7 (copy)
    return v27.props.renderList(v27.props.itemList, function(v28) --[[ Line: 149 ]]
        -- upvalues: v27 (copy), v6 (ref), v2 (ref), v7 (ref)
        local v29 = v27.state.interactable[v28] or v6.Default;
        local v30 = v27:getSelection();
        return v2.createElement(v7, {
            id = v28, 
            item = v27.props.itemList[v28], 
            interactableState = v29, 
            selection = v30, 
            renderItem = v27.props.renderItem, 
            itemSize = v27.props.itemList[v28] and v27.props.itemList[v28].itemSize or v27.props.itemSize, 
            selectionMode = v27.props.selectionMode, 
            onSelectionChanged = v27.props.onSelectionChanged, 
            setInteractableState = v27.setInteractableState, 
            setSelection = v27.setSelection, 
            key = tostring(v28)
        });
    end, v27.props);
end;
return v9;