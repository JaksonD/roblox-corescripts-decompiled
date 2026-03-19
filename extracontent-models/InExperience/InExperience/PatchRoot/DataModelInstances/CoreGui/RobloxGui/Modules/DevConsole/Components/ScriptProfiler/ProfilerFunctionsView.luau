local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local _ = require(script.Parent.ProfilerDataFormatV2);
local v3 = require(script.Parent.ProfilerUtil);
local l_getDurations_0 = v3.getDurations;
local l_formatSessionLength_0 = v3.formatSessionLength;
local l_getPluginFlag_0 = v3.getPluginFlag;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v8 = require(l_Components_0.HeaderButton);
local v9 = require(script.Parent.ProfilerFunctionViewEntry);
local v10 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v10.GeneralFormatting.LineWidth;
local l_LineColor_0 = v10.GeneralFormatting.LineColor;
local l_HeaderFrameHeight_0 = v10.GeneralFormatting.HeaderFrameHeight;
local _ = v10.GeneralFormatting.EntryFrameHeight;
local _ = v10.GeneralFormatting.NoResultSearchStr;
local l_HeaderNames_0 = v10.ScriptProfilerFormatting.HeaderNames;
local l_ValueCellWidth_0 = v10.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v10.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v10.ScriptProfilerFormatting.ValuePadding;
local v20 = v1.PureComponent:extend("ProfilerView");
v20.renderChildren = function(v21) --[[ Line: 29 ]] --[[ Name: renderChildren ]]
    -- upvalues: l_getDurations_0 (copy), l_getPluginFlag_0 (copy), v1 (copy), v9 (copy)
    local l_data_0 = v21.props.data;
    assert(l_data_0.Version == 2);
    local v23 = l_getDurations_0(l_data_0, 0);
    local v24 = {};
    local l_searchFilter_0 = v21.props.searchFilter;
    local l_showPlugins_0 = v21.props.showPlugins;
    local l_showGC_0 = v21.props.showGC;
    local l_gcFunctionOffsets_0 = v21.props.gcFunctionOffsets;
    local v29 = 1;
    if v21.props.average > 0 and v21.props.sessionLength then
        v29 = v21.props.sessionLength / 1000 / v21.props.average;
    end;
    for v30, v31 in ipairs(l_data_0.Functions) do
        if (#l_searchFilter_0 <= 0 or l_searchFilter_0[v30]) and (l_showPlugins_0 or not l_getPluginFlag_0(l_data_0, v31)) then
            v24[v30] = v1.createElement(v9, {
                layoutOrder = (v23 - v31.TotalDuration) * 1000000, 
                data = l_data_0, 
                functionId = v30, 
                nodeName = v31.Name, 
                average = v29, 
                gcOffset = if not l_showGC_0 then l_gcFunctionOffsets_0[v30] else nil, 
                percentageRatio = if v21.props.showAsPercentages then v23 / 100 else nil
            });
        end;
    end;
    return v24;
end;
v20.render = function(v32) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v10 (copy), l_formatSessionLength_0 (copy), l_HeaderFrameHeight_0 (copy), v8 (copy), l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_CellPadding_0 (copy), l_LineColor_0 (copy), l_HeaderNames_0 (copy), l_LineWidth_0 (copy)
    local l_layoutOrder_0 = v32.props.layoutOrder;
    local l_size_0 = v32.props.size;
    local v35 = nil;
    if v32.props.profiling and not v32.props.data then
        v35 = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Press Stop to Finish Profiling", 
            TextColor3 = v10.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    elseif not v32.props.data then
        v35 = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Start Profiling to View Data", 
            TextColor3 = v10.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    end;
    local v36 = l_formatSessionLength_0(v32.props.sessionLength);
    if v36 then
        v36 = "Session Duration: " .. v36;
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
            Name = v1.createElement(v8, {
                text = v36 or "Session Info", 
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
            Name = v1.createElement(v8, {
                text = l_HeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
                sortfunction = v32.onSortChanged
            }), 
            Inclusive = v1.createElement(v8, {
                text = l_HeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0 * 1, l_ValuePadding_0, 0, 0), 
                sortfunction = v32.onSortChanged
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
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Children = if v35 then v35 else v1.createFragment(v32:renderChildren())
        })
    });
end;
return v20;