local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.ReactUtils);
local l_useProperties_0 = v3.useProperties;
local l_usePropertiesDeferred_0 = v3.usePropertiesDeferred;
local v6 = require(l_Parent_0.UIBloxConfig);
local v7 = require(l_Parent_0.Core.Layout.Responsive.ResponsiveRow);
local v8 = require(l_Parent_0.Core.Layout.Responsive.useResponsiveLayout);
local function v18(v9, v10) --[[ Line: 60 ]] --[[ Name: useCellAbsoluteHeight ]]
    -- upvalues: v8 (copy), v2 (copy)
    local v11 = v8("columns", v10) or 1;
    local v12 = v8("gutter", v10) or 0;
    local v13 = v8("verticalGutter", v10) or v12;
    local v14 = v8("margin", v10) or 0;
    local v15 = v8("relativeHeight", v10);
    local v16 = v9 or v15;
    return v2.useCallback(function(v17) --[[ Line: 69 ]]
        -- upvalues: v16 (copy), v14 (copy), v12 (copy), v11 (copy), v13 (copy)
        if v16 then
            return math.max(((v17 - 2 * v14 + v12) / v11 - v12) * v16.Scale + v16.Offset, 0) + v13;
        else
            return nil;
        end;
    end, {
        v11, 
        v12, 
        v13, 
        v14, 
        v16
    });
end;
local v19 = NumberRange.new(0, 0);
local v20 = if v6.responsiveGridDisplayLinesNonNil then v19 else nil;
return v2.forwardRef(function(v21, v22) --[[ Line: 83 ]] --[[ Name: ResponsiveGrid ]]
    -- upvalues: v2 (copy), v20 (copy), v18 (copy), l_usePropertiesDeferred_0 (copy), l_useProperties_0 (copy), v7 (copy)
    local v23, v24 = v2.useState(v20);
    local v25 = v18(v21.relativeHeight, v21.kind);
    local v31 = v2.useCallback(function(v26, v27) --[[ Line: 87 ]]
        -- upvalues: v21 (copy), v25 (copy), v24 (copy), v20 (ref)
        if v21.absoluteWindowTop and v21.absoluteWindowHeight then
            local v28 = v25(v27.X);
            if v28 and v28 > 0 then
                local v29 = math.floor(math.max(v21.absoluteWindowTop - v26.Y, 0) / v28) + 1;
                local v30 = math.ceil(math.max(v21.absoluteWindowHeight, 0) / v28) + 1;
                return v24(NumberRange.new(v29, v29 + v30 - 1));
            end;
        end;
        return v24(v20);
    end, {
        v25, 
        v21.absoluteWindowTop, 
        v21.absoluteWindowHeight, 
        v24
    });
    local v32 = (if v21.enableDeferredRefPropEvents then l_usePropertiesDeferred_0 else l_useProperties_0)(v22, v31, {
        "AbsolutePosition", 
        "AbsoluteSize"
    });
    return v2.createElement(v7, {
        kind = v21.kind, 
        layoutOrder = v21.layoutOrder, 
        scrollable = false, 
        multiLine = true, 
        displayLines = if v21.absoluteWindowTop and v21.absoluteWindowHeight then v23 else nil, 
        relativeHeight = v21.relativeHeight, 
        data = v21.data, 
        getItem = v21.getItem, 
        getItemCount = v21.getItemCount, 
        renderItem = v21.renderItem, 
        keyExtractor = v21.keyExtractor, 
        getCellColspan = v21.getCellColspan, 
        getCellRowspan = v21.getCellRowspan, 
        getCellOrder = v21.getCellOrder, 
        ref = v32
    });
end);