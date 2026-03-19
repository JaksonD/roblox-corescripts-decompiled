local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local v5 = require(l_Components_0.LineGraph);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v6.ServerScriptsFormatting.ChartHeaderNames;
local l_EntryFrameHeight_0 = v6.ServerScriptsFormatting.EntryFrameHeight;
local l_ActivityBoxWidth_0 = v6.ServerScriptsFormatting.ActivityBoxWidth;
local l_ActivityBoxPadding_0 = v6.ServerScriptsFormatting.ActivityBoxPadding;
local v13 = UDim2.new(0, l_ActivityBoxPadding_0, 0, 0);
local l_LineGraphHeight_0 = v6.GeneralFormatting.LineGraphHeight;
local v15 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
return function(v16) --[[ Line: 24 ]]
    -- upvalues: v1 (copy), v4 (copy), l_EntryFrameHeight_0 (copy), l_ActivityBoxWidth_0 (copy), l_ActivityBoxPadding_0 (copy), v3 (copy), v13 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v5 (copy), l_LineGraphHeight_0 (copy), v15 (copy), l_ChartHeaderNames_0 (copy)
    local l_scriptData_0 = v16.scriptData;
    local l_frameHeight_0 = v16.frameHeight;
    local l_showGraph_0 = v16.showGraph;
    local l_layoutOrder_0 = v16.layoutOrder;
    local l_activityBoxColor_0 = v16.activityBoxColor;
    local l_entryCellSize_0 = v16.entryCellSize;
    local l_cellOffset_0 = v16.cellOffset;
    local l_verticalOffsets_0 = v16.verticalOffsets;
    local l_onButtonPress_0 = v16.onButtonPress;
    local l_getX_0 = v16.getX;
    local l_getActivity_0 = v16.getActivity;
    local l_getRate_0 = v16.getRate;
    local l_formatScriptsData_0 = v16.formatScriptsData;
    local l_dataStats_0 = l_scriptData_0.dataStats;
    local v31 = l_dataStats_0.dataSet:back();
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        button = v1.createElement(v4, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_showGraph_0, 
            onButtonPress = l_onButtonPress_0
        }, {
            ActivityBox = v1.createElement("Frame", {
                Size = UDim2.new(0, l_ActivityBoxWidth_0, 0, l_ActivityBoxWidth_0), 
                Position = UDim2.new(0, l_ActivityBoxPadding_0, 0, (l_EntryFrameHeight_0 - l_ActivityBoxWidth_0) / 2), 
                BackgroundColor3 = l_activityBoxColor_0
            }), 
            ScriptName = v1.createElement(v3, {
                text = l_scriptData_0.name, 
                size = l_entryCellSize_0[1] - v13, 
                pos = l_cellOffset_0[1] + v13
            }), 
            ScriptAcitivity = v1.createElement(v3, {
                text = l_formatScriptsData_0(v31.data[1]), 
                size = l_entryCellSize_0[2], 
                pos = l_cellOffset_0[2]
            }), 
            scriptFreqStr = v1.createElement(v3, {
                text = l_formatScriptsData_0(v31.data[2]), 
                size = l_entryCellSize_0[3], 
                pos = l_cellOffset_0[3]
            }), 
            upperHorizontalLine = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            verticalLine1 = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = l_verticalOffsets_0[2], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            verticalLine2 = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = l_verticalOffsets_0[3], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            lowerHorizontalLine = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        ActivityGraph = l_showGraph_0 and v1.createElement(v5, {
            pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
            size = UDim2.new(1, 0, 0, l_LineGraphHeight_0), 
            graphData = l_dataStats_0.dataSet, 
            maxY = l_dataStats_0.max[1], 
            minY = l_dataStats_0.min[1], 
            getX = l_getX_0, 
            getY = l_getActivity_0, 
            stringFormatX = v15, 
            stringFormatY = l_formatScriptsData_0, 
            axisLabelX = "Timestamp", 
            axisLabelY = l_ChartHeaderNames_0[2]
        }), 
        RateGraph = l_showGraph_0 and v1.createElement(v5, {
            pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0 + l_LineGraphHeight_0), 
            size = UDim2.new(1, 0, 0, l_LineGraphHeight_0), 
            graphData = l_dataStats_0.dataSet, 
            maxY = l_dataStats_0.max[2], 
            minY = l_dataStats_0.min[2], 
            getX = l_getX_0, 
            getY = l_getRate_0, 
            stringFormatX = v15, 
            stringFormatY = l_formatScriptsData_0, 
            axisLabelX = "Timestamp", 
            axisLabelY = l_ChartHeaderNames_0[3]
        })
    });
end;