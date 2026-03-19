local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local v5 = require(l_Components_0.LineGraph);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_ValueCellWidth_0 = v6.MemoryFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.MemoryFormatting.CellPadding;
local l_ValuePadding_0 = v6.MemoryFormatting.ValuePadding;
local l_EntryFrameHeight_0 = v6.GeneralFormatting.EntryFrameHeight;
local l_DepthIndent_0 = v6.MemoryFormatting.DepthIndent;
local v14 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
return function(v15) --[[ Line: 22 ]]
    -- upvalues: l_DepthIndent_0 (copy), l_ValueCellWidth_0 (copy), v1 (copy), v4 (copy), l_EntryFrameHeight_0 (copy), v3 (copy), l_CellPadding_0 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), l_ValuePadding_0 (copy), v5 (copy), v14 (copy)
    local l_size_0 = v15.size;
    local l_depth_0 = v15.depth;
    local l_showGraph_0 = v15.showGraph;
    local l_dataStats_0 = v15.dataStats;
    local l_layoutOrder_0 = v15.layoutOrder;
    local l_onButtonPress_0 = v15.onButtonPress;
    local l_formatValueStr_0 = v15.formatValueStr;
    local l_getX_0 = v15.getX;
    local l_getY_0 = v15.getY;
    local v25 = l_depth_0 * l_DepthIndent_0;
    local l_name_0 = v15.name;
    local l_value_0 = v15.value;
    if l_dataStats_0 then
        l_value_0 = l_dataStats_0.dataSet:back().data;
    end;
    local v28 = UDim.new(1 - l_ValueCellWidth_0, -v25);
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        button = v1.createElement(v4, {
            size = UDim2.new(1, -v25, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(0, v25, 0, 0), 
            isExpanded = l_showGraph_0, 
            onButtonPress = l_onButtonPress_0
        }, {
            name = v1.createElement(v3, {
                text = l_name_0, 
                size = UDim2.new(v28, UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            horizonal1 = v1.createElement("Frame", {
                Size = UDim2.new(1, -v25, 0, l_LineWidth_0), 
                Position = UDim2.new(0, v25, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            horizonal2 = v1.createElement("Frame", {
                Size = UDim2.new(1, -v25, 0, l_LineWidth_0), 
                Position = UDim2.new(0, v25, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        value = l_value_0 and v1.createElement(v3, {
            text = l_formatValueStr_0(l_value_0), 
            size = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0)
        }), 
        vertical = v1.createElement("Frame", {
            Size = UDim2.new(0, 1, 0, l_EntryFrameHeight_0), 
            Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        Graph = l_showGraph_0 and v1.createElement(v5, {
            pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
            size = UDim2.new(1, 0, 1, -l_EntryFrameHeight_0), 
            graphData = l_dataStats_0.dataSet, 
            maxY = l_dataStats_0.max, 
            minY = l_dataStats_0.min, 
            getX = l_getX_0, 
            getY = l_getY_0, 
            stringFormatX = v14, 
            stringFormatY = l_formatValueStr_0, 
            axisLabelX = "Timestamp", 
            axisLabelY = l_name_0
        })
    });
end;