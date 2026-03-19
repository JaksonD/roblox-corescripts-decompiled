local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.ProfilerUtil);
local l_getDurations_0 = v2.getDurations;
local l_formatSessionLength_0 = v2.formatSessionLength;
local _ = require(script.Parent.ProfilerDataFormatV2);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v7 = require(l_Components_0.HeaderButton);
local v8 = require(script.Parent.ProfilerViewEntry);
local v9 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v9.GeneralFormatting.LineWidth;
local l_LineColor_0 = v9.GeneralFormatting.LineColor;
local l_HeaderFrameHeight_0 = v9.GeneralFormatting.HeaderFrameHeight;
local _ = v9.GeneralFormatting.EntryFrameHeight;
local _ = v9.GeneralFormatting.NoResultSearchStr;
local l_HeaderNames_0 = v9.ScriptProfilerFormatting.HeaderNames;
local l_ValueCellWidth_0 = v9.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v9.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v9.ScriptProfilerFormatting.ValuePadding;
local v19 = v1.PureComponent:extend("ProfilerView");
v19.renderChildren = function(v20) --[[ Line: 29 ]] --[[ Name: renderChildren ]]
    -- upvalues: l_getDurations_0 (copy), v1 (copy), v8 (copy)
    local l_data_0 = v20.props.data;
    assert(l_data_0.Version == 2);
    local v22 = l_getDurations_0(l_data_0, 0);
    local v23 = 1;
    if v20.props.average > 0 and v20.props.sessionLength then
        v23 = v20.props.sessionLength / 1000 / v20.props.average;
    end;
    return v1.createElement(v8, {
        layoutOrder = 0, 
        depth = 0, 
        data = l_data_0, 
        nodeId = v20.props.rootNode, 
        functionId = v20.props.rootFunc, 
        nodeName = v20.props.rootNodeName, 
        average = v23, 
        searchTerm = v20.props.searchTerm, 
        searchFilter = v20.props.searchFilter, 
        showPlugins = v20.props.showPlugins, 
        pluginOffsets = v20.props.pluginOffsets, 
        showGC = v20.props.showGC, 
        gcNodeOffsets = v20.props.gcNodeOffsets, 
        pluginGCOffsets = v20.props.pluginGCOffsets, 
        expandedNodes = v20.props.expandedNodes, 
        percentageRatio = if v20.props.showAsPercentages then v22 / 100 else nil
    });
end;
v19.render = function(v24) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v9 (copy), l_formatSessionLength_0 (copy), l_HeaderFrameHeight_0 (copy), v7 (copy), l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_CellPadding_0 (copy), l_LineColor_0 (copy), l_HeaderNames_0 (copy), l_LineWidth_0 (copy)
    local l_layoutOrder_0 = v24.props.layoutOrder;
    local l_size_0 = v24.props.size;
    local v27 = nil;
    if v24.props.profiling and not v24.props.data then
        v27 = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Press Stop to Finish Profiling", 
            TextColor3 = v9.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    elseif not v24.props.data then
        v27 = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Start Profiling to View Data", 
            TextColor3 = v9.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    end;
    local v28 = l_formatSessionLength_0(v24.props.sessionLength);
    if v28 then
        v28 = "Session Duration: " .. v28;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        SessionInfo = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Name = v1.createElement(v7, {
                text = v28 or "Session Info", 
                size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            TopHorizontal = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        Header = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0)
        }, {
            Name = v1.createElement(v7, {
                text = l_HeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
                sortfunction = v24.onSortChanged
            }), 
            Inclusive = v1.createElement(v7, {
                text = l_HeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0 * 2, l_ValuePadding_0, 0, 0), 
                sortfunction = v24.onSortChanged
            }), 
            Self = v1.createElement(v7, {
                text = l_HeaderNames_0[3], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0), 
                sortfunction = v24.onSortChanged
            }), 
            TopHorizontal = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            LowerHorizontal = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            Vertical1 = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            Vertical2 = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0 * 2, 0, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        Entries = v1.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0 * 2), 
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0 * 2), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Children = if v27 then v27 else v1.createFragment(v24:renderChildren())
        })
    });
end;
return v19;