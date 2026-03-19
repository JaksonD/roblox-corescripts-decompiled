local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v5 = require(l_Parent_0.ResponsiveLayoutContext);
local v6 = require(l_Parent_0.ResponsiveLayoutConfigReader);
local v7 = v2.PureComponent:extend("ResponsiveBaseRow");
local function v9(v8) --[[ Line: 16 ]] --[[ Name: multilineScrollingValidator ]]
    if v8.multiLine and v8.scrollable then
        return false, "multiLine can't be scrollable";
    else
        return true;
    end;
end;
v7.validateProps = v3.strictInterface({
    kind = v3.optional(v3.string), 
    layoutOrder = v3.optional(v3.integer), 
    zIndex = v3.optional(v3.number), 
    scrollable = v3.optional(v3.boolean), 
    clipsDescendants = v3.optional(v3.boolean), 
    selectable = v3.optional(v3.boolean), 
    pages = v3.optional(v3.numberPositive), 
    multiLine = v3.optional(v3.boolean), 
    lines = v3.optional(v3.intersection(v3.integer, v3.numberMin(0))), 
    paddingTopLines = v3.optional(v3.intersection(v3.integer, v3.numberMin(0))), 
    relativeHeight = v3.optional(v3.UDim), 
    scrollingFrameRef = v3.optional(v3.table), 
    [v2.Children] = v3.optional(v3.table), 
    gridBasicRowRef = v3.optional(v3.union(v3.table, v3.callback))
});
v7.defaultProps = {
    kind = "default", 
    scrollable = false, 
    selectable = false, 
    clipsDescendants = true, 
    multiLine = false
};
v7.renderChildrenWithPadding = function(v10, v11, v12) --[[ Line: 64 ]] --[[ Name: renderChildrenWithPadding ]]
    -- upvalues: l_Object_0 (copy), v2 (copy)
    local v13 = v10.props.lines or 1;
    local v14 = v10.props.paddingTopLines or 0;
    return l_Object_0.assign({
        _uiblox_grid_padding_ = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v11), 
            PaddingRight = UDim.new(0, v11), 
            PaddingTop = if v10.props.multiLine and v14 > 0 and v13 > 0 then UDim.new(v14 / v13, v14 / v13 * v12) else nil
        })
    }, v10.props[v2.Children]);
end;
v7.renderChildrenMultiline = function(v15, v16, v17, v18, v19) --[[ Line: 80 ]] --[[ Name: renderChildrenMultiline ]]
    -- upvalues: l_Object_0 (copy), v2 (copy)
    local v20 = v15.props.lines or 1;
    if v15.props.paddingTopLines then
        v20 = v20 - v15.props.paddingTopLines;
    end;
    v20 = math.max(v20, 1);
    return l_Object_0.assign({
        _uiblox_grid_layout_ = v2.createElement("UIGridLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirectionMaxCells = v16, 
            CellSize = UDim2.new(1 / v16, math.floor((1 - v16) / v16 * v18), 1 / v20, (math.floor((1 - v20) / v20 * v19))), 
            CellPadding = UDim2.fromOffset(v18, v19)
        })
    }, v15:renderChildrenWithPadding(v17, v19));
end;
v7.renderChildren = function(v21, v22, v23, v24, v25) --[[ Line: 102 ]] --[[ Name: renderChildren ]]
    -- upvalues: l_Object_0 (copy), v2 (copy)
    local v26 = l_Object_0.assign({
        _uiblox_grid_layout_ = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v24)
        })
    }, v21:renderChildrenWithPadding(v23, v25));
    if v22 then
        local v27 = v21.props.pages or 1;
        return {
            ResponsiveRowScroller = v2.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarThickness = 0, 
                CanvasSize = UDim2.new(v27, (v27 - 1) * (v24 - 2 * v23), 1, 0), 
                AutomaticCanvasSize = v21.props.pages and Enum.AutomaticSize.None or Enum.AutomaticSize.X, 
                Selectable = v21.props.selectable, 
                ClipsDescendants = v21.props.clipsDescendants, 
                [v2.Ref] = v21.props.scrollingFrameRef
            }, v26)
        };
    else
        return v26;
    end;
end;
local function _(v28, v29) --[[ Line: 136 ]] --[[ Name: applyUDim ]]
    return v28.Scale * v29 + v28.Offset;
end;
v7.getSize = function(v31, v32, v33, v34, v35, v36) --[[ Line: 141 ]] --[[ Name: getSize ]]
    if v32 == nil then
        return UDim2.fromScale(1, 0);
    else
        local v37 = v32.Scale / v36;
        local v38 = (v33 - 2 * v35) / v36 - v33;
        local v39 = v32.Scale * v38 + v32.Offset;
        if v31.props.multiLine and v31.props.lines then
            if v31.props.lines == 0 then
                return UDim2.fromScale(1, 0);
            else
                v37 = v37 * v31.props.lines;
                v39 = v39 * v31.props.lines + (v31.props.lines - 1) * v34;
            end;
        end;
        return UDim2.new(1, 0, v37, v39);
    end;
end;
v7.render = function(v40) --[[ Line: 165 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v2 (copy), v5 (copy), l_Object_0 (copy), v6 (copy)
    assert(v9(v40.props));
    local l_relativeHeight_0 = v40.props.relativeHeight;
    local l_scrollable_0 = v40.props.scrollable;
    local l_multiLine_0 = v40.props.multiLine;
    local v44 = if v40.props.layoutOrder then string.format("ResponsiveRow%02d", v40.props.layoutOrder) else "ResponsiveRow";
    return v2.createElement(v5.Consumer, {
        render = function(v45) --[[ Line: 174 ]] --[[ Name: render ]]
            -- upvalues: l_Object_0 (ref), v40 (copy), l_scrollable_0 (copy), l_multiLine_0 (copy), l_relativeHeight_0 (ref), v6 (ref), v2 (ref), v5 (ref), v44 (copy)
            local v46 = l_Object_0.assign({}, v45, {
                kind = v40.props.kind or l_Object_0.None, 
                scrollable = l_scrollable_0, 
                pages = v40.props.pages or 1, 
                multiLine = l_multiLine_0, 
                relativeHeight = l_relativeHeight_0, 
                subPixelOffset = 0
            });
            if not l_relativeHeight_0 then
                l_relativeHeight_0 = v6.getValue(v46, "relativeHeight");
                v46.relativeHeight = l_relativeHeight_0;
            end;
            local v47 = v6.getValue(v46, "width");
            local v48 = v6.getValue(v46, "gutter") or 0;
            local v49 = v6.getValue(v46, "verticalGutter") or v48;
            local v50 = v6.getValue(v46, "margin") or 0;
            local v51 = v6.getValue(v46, "columns") or 1;
            local v52 = l_relativeHeight_0 and (not l_multiLine_0 or v40.props.lines);
            local v53 = v40:getSize(l_relativeHeight_0, v48, v49, v50, v51);
            local l_createElement_0 = v2.createElement;
            local l_Provider_0 = v5.Provider;
            local v56 = {
                value = v46
            };
            local v57 = {};
            local l_v44_0 = v44;
            local l_createElement_1 = v2.createElement;
            local v60 = "Frame";
            local v61 = {
                Size = v53, 
                SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                AutomaticSize = if v52 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v40.props.layoutOrder, 
                ZIndex = v40.props.zIndex, 
                [v2.Ref] = v40.props.gridBasicRowRef
            };
            local l_assign_0 = l_Object_0.assign;
            local v63 = {};
            local v64;
            if v47 then
                v64 = v2.createElement;
                local v65 = "UISizeConstraint";
                local v66 = {};
                local l_new_0 = Vector2.new;
                local l_v47_0 = v47;
                local v69;
                if l_relativeHeight_0 then
                    local l_Y_0 = v53.Y;
                    v69 = l_Y_0.Scale * v47 + l_Y_0.Offset;
                else
                    v69 = 1e999;
                end;
                v66.MaxSize = l_new_0(l_v47_0, v69);
                v64 = v64(v65, v66);
            else
                v64 = nil;
            end;
            v63._uiblox_grid_maxwidth_ = v64;
            v57[l_v44_0] = l_createElement_1(v60, v61, l_assign_0(v63, if l_multiLine_0 then v40:renderChildrenMultiline(v51, v50, v48, v49) else v40:renderChildren(l_scrollable_0, v50, v48, v49)));
            return l_createElement_0(l_Provider_0, v56, v57);
        end
    });
end;
return v2.forwardRef(function(v71, v72) --[[ Line: 230 ]]
    -- upvalues: v2 (copy), v7 (copy), l_Object_0 (copy)
    return v2.createElement(v7, l_Object_0.assign({}, v71, {
        gridBasicRowRef = v72
    }));
end);