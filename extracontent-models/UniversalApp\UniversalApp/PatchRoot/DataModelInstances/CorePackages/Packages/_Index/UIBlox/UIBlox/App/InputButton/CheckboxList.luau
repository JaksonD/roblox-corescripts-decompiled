local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.Checkbox);
local v5 = v1.PureComponent:extend("CheckboxList");
local v6 = v2.strictInterface({
    label = v2.string, 
    isSelected = v2.optional(v2.boolean), 
    isDisabled = v2.optional(v2.boolean)
});
v5.validateProps = v2.strictInterface({
    checkboxes = v2.array(v2.union(v2.string, v6)), 
    onActivated = v2.callback, 
    elementSize = v2.UDim2, 
    atMost = v2.optional(v2.number), 
    layoutOrder = v2.optional(v2.number)
});
local _ = function(v7) --[[ Line: 31 ]] --[[ Name: numTrue ]]
    local v8 = 0;
    for _, v10 in pairs(v7) do
        if v10 then
            v8 = v8 + 1;
        end;
    end;
    return v8;
end;
v5.init = function(v12) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    local v13 = v12.props.atMost or #v12.props.checkboxes;
    local v14 = {};
    local v15 = {};
    for v16, v17 in ipairs(v12.props.checkboxes) do
        if type(v17) == "table" then
            v14[v16] = v17.isSelected or false;
            v15[v16] = v17.isDisabled or false;
        end;
    end;
    local v18 = 0;
    for _, v20 in pairs(v14) do
        if v20 then
            v18 = v18 + 1;
        end;
    end;
    assert(v18 < v13, "number of 'isSelected' must be less than atMost!");
    v12.state = {
        selectedIndices = v14, 
        disabledIndices = v15
    };
    v12.doLogic = function(v21) --[[ Line: 62 ]]
        -- upvalues: v12 (copy), v3 (ref), v13 (copy)
        local l_v12_0 = v12;
        local v23 = {};
        local l_join_0 = v3.Dictionary.join;
        local l_selectedIndices_0 = v12.state.selectedIndices;
        local v26 = {};
        local v27 = not v12.state.selectedIndices[v21];
        if v27 then
            local l_selectedIndices_1 = v12.state.selectedIndices;
            local v29 = 0;
            for _, v31 in pairs(l_selectedIndices_1) do
                if v31 then
                    v29 = v29 + 1;
                end;
            end;
            v27 = v29 < v13;
        end;
        v26[v21] = v27;
        v23.selectedIndices = l_join_0(l_selectedIndices_0, v26);
        l_v12_0:setState(v23);
        v12.props.onActivated(v12.state.selectedIndices);
    end;
end;
v5.render = function(v32) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v33 = {
        layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v34, v35 in ipairs(v32.props.checkboxes) do
        v33["Checkbox" .. v34] = v1.createElement(v4, {
            text = type(v35) == "table" and v35.label or v35, 
            isSelected = v32.state.selectedIndices[v34], 
            isDisabled = v32.state.disabledIndices[v34], 
            onActivated = function() --[[ Line: 84 ]] --[[ Name: onActivated ]]
                -- upvalues: v32 (copy), v34 (copy)
                v32.doLogic(v34);
            end, 
            size = v32.props.elementSize, 
            layoutOrder = v34
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v32.props.layoutOrder
    }, v33);
end;
return v5;