local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.LuauPolyfill);
local l_Object_0 = v5.Object;
local l_Array_0 = v5.Array;
local v8 = require(l_Parent_1.UIBloxConfig);
local v9 = require(l_Parent_0.ResponsiveLayoutContext);
local v10 = require(l_Parent_0.ResponsiveLayoutConfigReader);
local v11 = require(l_Parent_0.ResponsiveBaseRow);
local v12 = require(l_Parent_0.ResponsiveCell);
local v13 = v3.PureComponent:extend("ResponsiveRow");
v13.validateProps = v4.strictInterface({
    kind = v4.optional(v4.string), 
    layoutOrder = v4.optional(v4.integer), 
    zIndex = v4.optional(v4.number), 
    scrollable = v4.optional(v4.boolean), 
    clipsDescendants = v4.optional(v4.boolean), 
    selectable = v4.optional(v4.boolean), 
    multiLine = v4.optional(v4.boolean), 
    displayLines = v4.optional(v4.NumberRange), 
    relativeHeight = v4.optional(v4.UDim), 
    data = v4.optional(v4.any), 
    getItem = v4.optional(v4.callback), 
    getItemCount = v4.optional(v4.callback), 
    renderItem = v4.optional(v4.callback), 
    keyExtractor = v4.optional(v4.callback), 
    getCellColspan = v4.optional(v4.callback), 
    getCellRowspan = v4.optional(v4.callback), 
    getCellOrder = v4.optional(v4.callback), 
    scrollingFrameRef = v4.optional(v4.table), 
    forwardedRef = v4.optional(v4.union(v4.table, v4.callback))
});
v13.defaultProps = {
    kind = "default", 
    multiLine = false, 
    data = {}, 
    getItem = function(v14, v15, _) --[[ Line: 78 ]] --[[ Name: getItem ]]
        if type(v14) == "table" then
            return v14[v15];
        else
            return nil;
        end;
    end, 
    renderItem = function(v17, _) --[[ Line: 85 ]] --[[ Name: renderItem ]]
        return v17;
    end, 
    getCellColspan = function(_, _) --[[ Line: 88 ]] --[[ Name: getCellColspan ]]
        return nil;
    end, 
    getCellRowspan = function(_, _) --[[ Line: 91 ]] --[[ Name: getCellRowspan ]]
        return nil;
    end, 
    getCellOrder = function(_, _) --[[ Line: 94 ]] --[[ Name: getCellOrder ]]
        return nil;
    end
};
local function v28(v25, v26) --[[ Line: 99 ]] --[[ Name: countItems ]]
    -- upvalues: v13 (copy)
    if v25.getItemCount then
        return v25.getItemCount(v25.data, v26);
    elseif v25.getItem == v13.defaultProps.getItem then
        return #v25.data;
    else
        for v27 = 1, v26.columns do
            if v25.getItem(v25.data, v27, v26) == nil then
                return v27 - 1;
            end;
        end;
        return v26.columns;
    end;
end;
local function _(v29, v30, v31, v32) --[[ Line: 114 ]] --[[ Name: resolveCellProp ]]
    if v29 then
        local v33 = v29(v30, v31);
        if v33 ~= nil then
            if type(v33) == table then
                local v34 = v31.breakpoint or "default";
                if v33[v34] ~= nil then
                    return v33[v34];
                elseif v33.default ~= nil then
                    return v33.default;
                end;
            else
                return v33;
            end;
        end;
    end;
    return v32;
end;
local function v56(v36, v37) --[[ Line: 133 ]] --[[ Name: addPaddingCells ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v38 = {};
    local function _(v39) --[[ Line: 135 ]] --[[ Name: shouldSkip ]]
        -- upvalues: v37 (copy), v38 (copy)
        local v40 = math.floor(v39 / v37.columns);
        local v41 = v39 - v40 * v37.columns;
        return v38[string.format("%d,%d", v41, v40)];
    end;
    local function v50(v43, v44, v45) --[[ Line: 140 ]] --[[ Name: setSkip ]]
        -- upvalues: v37 (copy), v38 (copy)
        local v46 = math.floor(v43 / v37.columns);
        local v47 = v43 - v46 * v37.columns;
        for v48 = v47, v47 + v44 - 1 do
            for v49 = v46, v46 + v45 - 1 do
                v38[string.format("%d,%d", v48, v49)] = true;
            end;
        end;
    end;
    return l_Array_0.reduce(v36, function(v51, v52) --[[ Line: 149 ]]
        -- upvalues: v37 (copy), v38 (copy), v50 (copy), l_Object_0 (ref)
        while true do
            local v53 = #v51;
            local v54 = math.floor(v53 / v37.columns);
            local v55 = v53 - v54 * v37.columns;
            if v38[string.format("%d,%d", v55, v54)] then
                table.insert(v51, {
                    order = #v51 + 1
                });
            else
                break;
            end;
        end;
        if v52.colspan > 1 or v52.rowspan > 1 then
            v50(#v51, v52.colspan, v52.rowspan);
        end;
        table.insert(v51, l_Object_0.assign({}, v52, {
            order = #v51 + 1
        }));
        return v51;
    end, {});
end;
local function _(v57, v58) --[[ Line: 169 ]] --[[ Name: formatCellKey ]]
    local v59 = math.floor(math.log10(v58) + 1);
    return string.format("ResponsiveRowCell%0" .. v59 .. "d", v57);
end;
filterDisplayedCells = function(v61, v62, v63) --[[ Line: 175 ]] --[[ Name: filterDisplayedCells ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v64 = (v63.Min - 1) * v62.columns + 1;
    local v65 = v63.Max * v62.columns;
    local v69 = l_Array_0.filter(v61, function(_, v67) --[[ Line: 179 ]]
        -- upvalues: v64 (copy), v65 (copy)
        local v68 = false;
        if v64 <= v67 then
            v68 = v67 <= v65;
        end;
        return v68;
    end);
    local v70 = (v63.Max - v63.Min + 1) * v62.columns;
    return l_Array_0.map(v69, function(v71, _) --[[ Line: 184 ]]
        -- upvalues: l_Object_0 (ref), v70 (copy)
        local l_assign_0 = l_Object_0.assign;
        local v74 = {};
        local l_v71_0 = v71;
        local v76 = {};
        local v77 = (v71.order - 1) % v70 + 1;
        local v78 = math.floor(math.log10(v70) + 1);
        v76.key = string.format("ResponsiveRowCell%0" .. v78 .. "d", v77);
        return l_assign_0(v74, l_v71_0, v76);
    end);
end;
v13.init = function(v79) --[[ Line: 193 ]] --[[ Name: init ]]
    v79.itemCache = {};
end;
v13.renderChildren = function(v80, v81) --[[ Line: 197 ]] --[[ Name: renderChildren ]]
    -- upvalues: v28 (copy), l_Array_0 (copy), v56 (copy), v8 (copy), v3 (copy), v12 (copy)
    local v82 = false;
    local v83 = false;
    local v84 = false;
    local v85 = {};
    local v86 = {};
    local v87 = 1;
    local v88 = 1;
    for v89 = 1, v28(v80.props, v81) do
        local v90 = v80.props.getItem(v80.props.data, v89, v81);
        local v91 = nil;
        local v92 = nil;
        if v80.props.keyExtractor then
            v91 = v80.props.keyExtractor(v90, v89, v81);
        end;
        if v91 and v80.itemCache[v91] then
            v92 = v80.itemCache[v91];
        end;
        if not v92 then
            v92 = v80.props.renderItem(v90, v81);
        end;
        if v91 then
            v86[v91] = v92;
        end;
        local v93 = {};
        local l_getCellColspan_0 = v80.props.getCellColspan;
        local v95;
        if l_getCellColspan_0 then
            local v96 = l_getCellColspan_0(v90, v81);
            if v96 ~= nil then
                if type(v96) == table then
                    local v97 = v81.breakpoint or "default";
                    if v96[v97] ~= nil then
                        v95 = v96[v97];
                        v82 = true;
                    elseif v96.default ~= nil then
                        v95 = v96.default;
                        v82 = true;
                    end;
                else
                    v95 = v96;
                    v82 = true;
                end;
            end;
        end;
        if not v82 then
            if not v82 then
                if not v82 then
                    v95 = 1;
                end;
            end;
        end;
        v82 = false;
        v93.colspan = v95;
        l_getCellColspan_0 = v80.props.getCellRowspan;
        if l_getCellColspan_0 then
            local v98 = l_getCellColspan_0(v90, v81);
            if v98 ~= nil then
                if type(v98) == table then
                    local v99 = v81.breakpoint or "default";
                    if v98[v99] ~= nil then
                        v95 = v98[v99];
                        v83 = true;
                    elseif v98.default ~= nil then
                        v95 = v98.default;
                        v83 = true;
                    end;
                else
                    v95 = v98;
                    v83 = true;
                end;
            end;
        end;
        if not v83 then
            if not v83 then
                if not v83 then
                    v95 = 1;
                end;
            end;
        end;
        v83 = false;
        v93.rowspan = v95;
        l_getCellColspan_0 = v80.props.getCellOrder;
        if l_getCellColspan_0 then
            local v100 = l_getCellColspan_0(v90, v81);
            if v100 ~= nil then
                if type(v100) == table then
                    local v101 = v81.breakpoint or "default";
                    if v100[v101] ~= nil then
                        v95 = v100[v101];
                        v84 = true;
                    elseif v100.default ~= nil then
                        v95 = v100.default;
                        v84 = true;
                    end;
                else
                    v95 = v100;
                    v84 = true;
                end;
            end;
        end;
        if not v84 then
            if not v84 then
                if not v84 then
                    v95 = v89;
                end;
            end;
        end;
        v84 = false;
        v93.order = v95;
        v93.cell = v92;
        table.insert(v85, v93);
    end;
    v80.itemCache = v86;
    if v80.props.multiLine then
        l_Array_0.sort(v85, function(v102, v103) --[[ Line: 227 ]]
            return v102.order - v103.order;
        end);
        v85 = v56(v85, v81);
        v87 = math.ceil(#v85 / v81.columns);
        if v80.props.displayLines then
            v85 = filterDisplayedCells(v85, v81, v80.props.displayLines);
        end;
    elseif v80.props.scrollable then
        v88 = l_Array_0.reduce(v85, function(v104, v105) --[[ Line: 237 ]]
            return v104 + v105.colspan;
        end, 0) / v81.columns;
    end;
    if v8.setZIndexOnGridCells then
        for v106 = 1, #v85 do
            v85[v106].zIndex = #v85 + 2 - v106;
        end;
    end;
    return l_Array_0.map(v85, function(v107, v108) --[[ Line: 250 ]]
        -- upvalues: v3 (ref), v12 (ref), v85 (ref)
        local l_createElement_0 = v3.createElement;
        local l_v12_0 = v12;
        local v111 = {};
        local l_key_0 = v107.key;
        if not l_key_0 then
            local v113 = math.floor(math.log10(#v85) + 1);
            l_key_0 = string.format("ResponsiveRowCell%0" .. v113 .. "d", v108);
        end;
        v111.key = l_key_0;
        v111.colspan = v107.colspan;
        v111.rowspan = v107.rowspan;
        v111.order = v107.order;
        v111.zIndex = v107.zIndex;
        return l_createElement_0(l_v12_0, v111, {
            ResponsiveItem = v107.cell
        });
    end), v88, v87;
end;
v13.render = function(v114) --[[ Line: 265 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy), l_Object_0 (copy), v10 (copy), v11 (copy)
    return v3.createElement(v9.Consumer, {
        render = function(v115) --[[ Line: 267 ]] --[[ Name: render ]]
            -- upvalues: l_Object_0 (ref), v114 (copy), v10 (ref), v3 (ref), v11 (ref)
            local v116 = l_Object_0.assign({}, v115, {
                kind = v114.props.kind or l_Object_0.None
            });
            local v117, v118, v119 = v114:renderChildren({
                breakpoint = v116.breakpoint, 
                kind = v116.kind, 
                width = v10.getValue(v116, "width") or 1, 
                columns = v10.getValue(v116, "columns") or 1, 
                margin = v10.getValue(v116, "margin") or 1, 
                gutter = v10.getValue(v116, "gutter") or 1, 
                verticalGutter = v10.getValue(v116, "verticalGutter")
            });
            return v3.createElement(v11, {
                kind = v114.props.kind, 
                layoutOrder = v114.props.layoutOrder, 
                zIndex = v114.props.zIndex, 
                scrollable = v114.props.scrollable, 
                clipsDescendants = v114.props.clipsDescendants, 
                selectable = v114.props.selectable, 
                pages = v118, 
                multiLine = v114.props.multiLine, 
                lines = v119, 
                paddingTopLines = if v114.props.multiLine and v114.props.displayLines then math.max(v114.props.displayLines.Min - 1, 0) else nil, 
                relativeHeight = v114.props.relativeHeight, 
                scrollingFrameRef = v114.props.scrollingFrameRef, 
                [v3.Ref] = v114.props.forwardedRef
            }, v117);
        end
    });
end;
return v3.forwardRef(function(v120, v121) --[[ Line: 302 ]]
    -- upvalues: v3 (copy), v13 (copy), l_Object_0 (copy)
    return v3.createElement(v13, l_Object_0.assign({}, v120, {
        forwardedRef = v121
    }));
end);