local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v5 = require(l_Parent_0.ResponsiveLayoutContext);
local v6 = require(l_Parent_0.ResponsiveLayoutConfigReader);
local v7 = v2.PureComponent:extend("ResponsiveCell");
v7.validateProps = v3.interface({
    layoutOrder = v3.optional(v3.integer), 
    zIndex = v3.optional(v3.integer), 
    colspan = v3.optional(v3.union(v3.integer, v3.table)), 
    rowspan = v3.optional(v3.union(v3.integer, v3.table)), 
    order = v3.optional(v3.union(v3.integer, v3.table)), 
    [v2.Children] = v3.optional(v3.table), 
    gridCellRef = v3.optional(v3.union(v3.table, v3.callback))
});
local function v11(v8, v9, v10) --[[ Line: 35 ]] --[[ Name: findProp ]]
    if v10 == nil then
        v10 = "default";
    end;
    if v8[v9 .. "_" .. v10] ~= nil then
        return v8[v9 .. "_" .. v10];
    elseif v8[v9] ~= nil then
        if type(v8[v9]) == "table" then
            if v8[v9][v10] ~= nil then
                return v8[v9][v10];
            else
                return v8[v9].default;
            end;
        else
            return v8[v9];
        end;
    else
        return nil;
    end;
end;
v7.getColspan = function(v12, v13) --[[ Line: 56 ]] --[[ Name: getColspan ]]
    -- upvalues: v11 (copy)
    local v14 = v11(v12.props, "colspan", v13);
    if v14 ~= nil then
        return v14;
    else
        return 1;
    end;
end;
v7.getRowspan = function(v15, v16) --[[ Line: 61 ]] --[[ Name: getRowspan ]]
    -- upvalues: v11 (copy)
    local v17 = v11(v15.props, "rowspan", v16);
    if v17 ~= nil then
        return v17;
    else
        return 1;
    end;
end;
v7.getOrder = function(v18, v19) --[[ Line: 66 ]] --[[ Name: getOrder ]]
    -- upvalues: v11 (copy)
    if v18.props.layoutOrder then
        return v18.props.layoutOrder;
    else
        return (v11(v18.props, "order", v19));
    end;
end;
local function _(v20, v21) --[[ Line: 75 ]] --[[ Name: round ]]
    local v22 = math.floor(v20);
    v21.subPixelOffset = v21.subPixelOffset + (v20 - v22);
    local v23 = math.floor(v21.subPixelOffset + 0.5);
    v21.subPixelOffset = v21.subPixelOffset - v23;
    return v22 + v23;
end;
v7.getSize = function(_, v26, v27, v28) --[[ Line: 84 ]] --[[ Name: getSize ]]
    -- upvalues: v6 (copy)
    local v29 = v6.getValue(v28, "gutter") or 0;
    if v28.multiLine then
        local v30 = v6.getValue(v28, "verticalGutter") or v29;
        return UDim2.new(v26, (v26 - 1) * v29, v27, (v27 - 1) * v30);
    else
        local v31 = v6.getValue(v28, "columns") or 1;
        if v28.scrollable then
            v31 = v31 * math.max(v28.pages, 1);
        end;
        local l_new_0 = UDim2.new;
        local v33 = v26 / v31;
        local v34 = (v26 / v31 - 1) * v29;
        local v35 = math.floor(v34);
        v28.subPixelOffset = v28.subPixelOffset + (v34 - v35);
        local v36 = math.floor(v28.subPixelOffset + 0.5);
        v28.subPixelOffset = v28.subPixelOffset - v36;
        return l_new_0(v33, v35 + v36, 1, 0);
    end;
end;
v7.render = function(v37) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.createElement(v5.Consumer, {
        render = function(v38) --[[ Line: 105 ]] --[[ Name: render ]]
            -- upvalues: v37 (copy), v2 (ref)
            local v39 = v37:getColspan(v38.breakpoint);
            local v40 = if v38.multiLine then v37:getRowspan(v38.breakpoint) else 1;
            if v39 > 0 and v40 > 0 then
                local v41 = v37:getOrder(v38.breakpoint);
                local v42 = if v41 then string.format("ResponsiveCell%02d", v41) else "ResponsiveCell";
                local v43 = v38.multiLine and (v39 > 1 or v40 > 1);
                local v44 = v2.createElement("Frame", {
                    Name = if v43 then nil else v42, 
                    Size = v37:getSize(v39, v40, v38), 
                    AutomaticSize = if v38.relativeHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v41, 
                    ZIndex = v37.props.zIndex, 
                    [v2.Ref] = v37.props.gridCellRef
                }, v37.props[v2.Children]);
                if v43 then
                    return v2.createElement("Frame", {
                        Name = v42, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v41
                    }, {
                        ResponsiveCellInner = v44
                    });
                else
                    return v44;
                end;
            else
                return nil;
            end;
        end
    });
end;
return v2.forwardRef(function(v45, v46) --[[ Line: 141 ]]
    -- upvalues: v2 (copy), v7 (copy), l_Object_0 (copy)
    return v2.createElement(v7, l_Object_0.assign({}, v45, {
        gridCellRef = v46
    }));
end);