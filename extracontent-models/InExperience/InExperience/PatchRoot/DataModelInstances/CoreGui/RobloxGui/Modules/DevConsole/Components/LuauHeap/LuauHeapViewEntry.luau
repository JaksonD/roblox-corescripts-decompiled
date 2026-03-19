local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local v5 = require(l_Components_0.Tooltip);
local _ = require(script.Parent.LuauHeapTypes);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v7.GeneralFormatting.LineWidth;
local l_LineColor_0 = v7.GeneralFormatting.LineColor;
local l_GraphEntryFrameHeight_0 = v7.LuauHeapFormatting.GraphEntryFrameHeight;
local l_DepthIndent_0 = v7.LuauHeapFormatting.DepthIndent;
local l_ValueCellWidth_0 = v7.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v7.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v7.LuauHeapFormatting.ValuePadding;
local v15 = v1.PureComponent:extend("LuauHeapViewEntry");
local function v17(v16) --[[ Line: 32 ]] --[[ Name: BorderedCellLabel ]]
    -- upvalues: v1 (copy), v3 (copy), l_LineWidth_0 (copy), l_ValuePadding_0 (copy), l_LineColor_0 (copy)
    return v1.createFragment({
        Label = v1.createElement(v3, {
            text = v16.text, 
            size = v16.size, 
            pos = v16.pos, 
            richText = true
        }), 
        LeftBorder = v1.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v16.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v16.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v15.init = function(v18) --[[ Line: 50 ]] --[[ Name: init ]]
    v18.state = {
        expanded = v18.props.depth == 0, 
        expandedEllipsis = false, 
        showTooltip = false, 
        tooltipPos = UDim2.fromOffset(0, 0)
    };
    v18.onButtonPress = function() --[[ Line: 58 ]]
        -- upvalues: v18 (copy)
        v18:setState(function(v19) --[[ Line: 59 ]]
            return {
                expanded = not v19.expanded
            };
        end);
    end;
    v18.onExpandEllipsis = function() --[[ Line: 66 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            expandedEllipsis = true
        });
    end;
    v18.onMouseEnter = function(_, v21, v22) --[[ Line: 72 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v21, v22)
        });
    end;
    v18.onMouseMove = function(_, v24, v25) --[[ Line: 79 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v24, v25)
        });
    end;
    v18.onMouseLeave = function() --[[ Line: 86 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            showTooltip = false
        });
    end;
end;
v15.renderChildren = function(v26, v27, v28) --[[ Line: 93 ]] --[[ Name: renderChildren ]]
    -- upvalues: v1 (copy), v15 (copy)
    local v29 = false;
    if not v26.state.expanded then
        return {};
    else
        local v30 = true;
        if #v27 == 0 then
            v30 = false;
            if v28 ~= nil then
                v30 = #v28 ~= 0;
            end;
        end;
        if not v30 then
            return {};
        else
            local v31 = {};
            local l_TotalSize_0 = v26.props.data.TotalSize;
            local v33 = v26.props.depth + 1;
            local v34 = 0;
            local v35 = 0;
            local v36 = 0;
            local _ = function(v37) --[[ Line: 117 ]] --[[ Name: getCompareInfo ]]
                -- upvalues: v28 (copy)
                if v28 then
                    for _, v39 in ipairs(v28) do
                        if v37.Name == v39.Name then
                            return v39;
                        end;
                    end;
                end;
                return nil;
            end;
            for _, v42 in ipairs(v27) do
                local v43;
                if v28 then
                    for _, v45 in ipairs(v28) do
                        if v42.Name == v45.Name then
                            v43 = v45;
                            v29 = true;
                        end;
                        if v29 then
                            break;
                        end;
                    end;
                end;
                if not v29 then
                    v43 = nil;
                end;
                v29 = false;
                if v42.TotalSize <= 128 and #v27 > 4 and not v26.state.expandedEllipsis then
                    v34 = v34 + v42.TotalSize;
                    if v43 then
                        v35 = v35 + v43.TotalSize;
                    end;
                else
                    v36 = v36 + 1;
                    v31[v36] = v1.createElement(v15, {
                        layoutOrder = l_TotalSize_0 - v42.TotalSize, 
                        depth = v33, 
                        data = v42, 
                        compare = v43
                    });
                end;
            end;
            if v34 > 0 then
                v36 = v36 + 1;
                v31[v36] = v1.createElement(v15, {
                    layoutOrder = l_TotalSize_0, 
                    depth = v33, 
                    data = {
                        Size = v34, 
                        TotalSize = v34, 
                        Name = "...", 
                        Children = {}
                    }, 
                    compare = if v28 then {
                        Size = v35, 
                        TotalSize = v35, 
                        Name = "...", 
                        Children = {}
                    } else nil, 
                    customButtonPress = v26.onExpandEllipsis
                });
            end;
            if v28 then
                for _, v47 in ipairs(v28) do
                    local v48 = false;
                    for _, v50 in ipairs(v27) do
                        if v50.Name == v47.Name then
                            v48 = true;
                            break;
                        end;
                    end;
                    if not v48 then
                        local v51 = {
                            Size = 0, 
                            TotalSize = 0, 
                            Name = v47.Name, 
                            Source = v47.Source, 
                            Children = {}
                        };
                        v36 = v36 + 1;
                        v31[v36] = v1.createElement(v15, {
                            layoutOrder = l_TotalSize_0, 
                            depth = v33, 
                            data = v51, 
                            compare = v47
                        });
                    end;
                end;
            end;
            return v31;
        end;
    end;
end;
v15.renderValues = function(_, v53) --[[ Line: 223 ]] --[[ Name: renderValues ]]
    -- upvalues: l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_GraphEntryFrameHeight_0 (copy), v1 (copy), v17 (copy)
    local v54 = {};
    local v55 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_GraphEntryFrameHeight_0);
    local v56 = UDim2.new(1 - l_ValueCellWidth_0 * #v53, l_ValuePadding_0, 0, 0);
    for v57, v58 in ipairs(v53) do
        v54[tostring(v57)] = v1.createElement(v17, {
            text = tostring(v58), 
            size = v55, 
            pos = v56 + UDim2.fromScale(l_ValueCellWidth_0 * (v57 - 1), 0)
        });
    end;
    return v54;
end;
v15.render = function(v59) --[[ Line: 238 ]] --[[ Name: render ]]
    -- upvalues: l_GraphEntryFrameHeight_0 (copy), l_DepthIndent_0 (copy), l_ValueCellWidth_0 (copy), l_CellPadding_0 (copy), v1 (copy), v5 (copy), v4 (copy), v3 (copy)
    local l_props_0 = v59.props;
    local v61 = l_props_0.size or UDim2.new(1, 0, 0, l_GraphEntryFrameHeight_0);
    local l_depth_0 = l_props_0.depth;
    local v63 = l_props_0.layoutOrder or 0;
    local v64 = l_depth_0 * l_DepthIndent_0;
    local l_data_0 = l_props_0.data;
    local l_compare_0 = l_props_0.compare;
    local _ = "";
    local _ = "";
    local v69 = {
        if l_compare_0 and l_compare_0.TotalSize ~= l_data_0.TotalSize then string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.TotalSize, l_compare_0.TotalSize > l_data_0.TotalSize and "0f0" or "f00", l_compare_0.TotalSize > l_data_0.TotalSize and "" or "+", l_data_0.TotalSize - l_compare_0.TotalSize) else string.format("%.0f", l_data_0.TotalSize), 
        if l_compare_0 and l_compare_0.Size ~= l_data_0.Size then string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.Size, l_compare_0.Size > l_data_0.Size and "0f0" or "f00", l_compare_0.Size > l_data_0.Size and "" or "+", l_data_0.Size - l_compare_0.Size) else string.format("%.0f", l_data_0.Size)
    };
    local v70 = l_depth_0 == 0 and "<root>" or "<anonymous>";
    local v71 = if not l_data_0.Name or #l_data_0.Name == 0 then v70 else l_data_0.Name;
    local v72 = if not l_data_0.Source or #l_data_0.Source == 0 then v71 else l_data_0.Source;
    local v73 = UDim.new(1 - l_ValueCellWidth_0 * #v69, -(l_CellPadding_0 + v64));
    local v74 = true;
    if #l_data_0.Children == 0 then
        v74 = l_compare_0 ~= nil and #l_compare_0.Children ~= 0 or l_props_0.customButtonPress ~= nil;
    end;
    local v75 = if l_props_0.customButtonPress then l_props_0.customButtonPress else v59.onButtonPress;
    return v1.createElement("Frame", {
        Size = v61, 
        BackgroundTransparency = 1, 
        LayoutOrder = v63, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        tooltip = if v59.state.showTooltip then v1.createElement(v5, {
            text = v72, 
            pos = v59.state.tooltipPos
        }) else nil, 
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v1.createElement(v4, {
            size = UDim2.new(1, 0, 0, l_GraphEntryFrameHeight_0), 
            inset = v64, 
            isExpanded = v59.state.expanded, 
            isExpandable = v74, 
            onButtonPress = v75, 
            onMouseEnter = v59.onMouseEnter, 
            onMouseLeave = v59.onMouseLeave, 
            onMouseMove = v59.onMouseMove, 
            layoutOrder = -1
        }, {
            name = v1.createElement(v3, {
                text = v71, 
                size = UDim2.new(v73, UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0 + v64, 0, 0), 
                textTruncate = Enum.TextTruncate.SplitWord, 
                textWrapped = false
            }), 
            values = v1.createFragment(v59:renderValues(v69))
        }), 
        children = v1.createFragment(v59:renderChildren(l_data_0.Children, if l_compare_0 then l_compare_0.Children else nil))
    });
end;
return v15;