local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.DataConsumer);
local v4 = require(l_Components_0.HeaderButton);
local v5 = require(l_Components_0.CellLabel);
local v6 = require(l_Components_0.BannerButton);
local v7 = require(l_Components_0.LineGraph);
local v8 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v8.GeneralFormatting.LineWidth;
local l_LineColor_0 = v8.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v8.ServerJobsFormatting.ChartHeaderNames;
local l_ValueCellWidth_0 = v8.ServerJobsFormatting.ValueCellWidth;
local l_EntryFrameHeight_0 = v8.ServerJobsFormatting.EntryFrameHeight;
local l_HeaderFrameHeight_0 = v8.ServerJobsFormatting.HeaderFrameHeight;
local l_CellPadding_0 = v8.ServerJobsFormatting.CellPadding;
local l_MinFrameWidth_0 = v8.ServerJobsFormatting.MinFrameWidth;
local l_LineGraphHeight_0 = v8.GeneralFormatting.LineGraphHeight;
local v18 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v22 = {
    function(v19) --[[ Line: 27 ]]
        return v19 and string.format("%.4f%%", v19) or "";
    end, 
    function(v20) --[[ Line: 30 ]]
        return v20 and string.format("%.4f/s", v20) or "";
    end, 
    function(v21) --[[ Line: 33 ]]
        return v21 and string.format("%.4fms", v21) or "";
    end
};
local l_NoResultSearchStr_0 = v8.GeneralFormatting.NoResultSearchStr;
local v24 = 0;
local v25 = {};
local v26 = {};
local v27 = {};
local v28 = l_EntryFrameHeight_0 - l_LineWidth_0;
for _, v30 in ipairs(l_ValueCellWidth_0) do
    table.insert(v25, UDim2.new(v24, l_CellPadding_0, 0, 0));
    table.insert(v26, UDim2.new(v30, -l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v27, UDim2.new(v30, -l_CellPadding_0, 0, v28));
    v24 = v24 + v30;
end;
local v31 = {};
for v32, v33 in ipairs(v25) do
    v31[v32] = UDim2.new(v33.X.Scale, v33.X.Offset - l_CellPadding_0, v33.Y.Scale, v33.Y.Offset);
end;
local v34 = v1.Component:extend("ServerJobsChart");
local function v36(v35) --[[ Line: 63 ]] --[[ Name: getX ]]
    return v35.time;
end;
local function v38(v37) --[[ Line: 67 ]] --[[ Name: getDutyCycle ]]
    return v37.data[1];
end;
local function v40(v39) --[[ Line: 71 ]] --[[ Name: getStepsPerSec ]]
    return v39.data[2];
end;
local function v42(v41) --[[ Line: 75 ]] --[[ Name: getStepTime ]]
    return v41.data[3];
end;
v34.init = function(v43, v44) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    local v45 = v44.ServerJobsData:getCurrentData();
    v43.getOnButtonPress = function(v46) --[[ Line: 82 ]]
        -- upvalues: v43 (copy)
        return function(_, _) --[[ Line: 83 ]]
            -- upvalues: v43 (ref), v46 (copy)
            local l_v43_0 = v43;
            local v50 = {};
            local v51 = false;
            if v43.state.expandIndex ~= v46 then
                v51 = v46;
            end;
            v50.expandIndex = v51;
            l_v43_0:setState(v50);
        end;
    end;
    v43.onSortChanged = function(v52) --[[ Line: 90 ]]
        -- upvalues: v44 (copy), v43 (copy)
        if v52 == v44.ServerJobsData:getSortType() then
            v43:setState({
                reverseSort = not v43.state.reverseSort
            });
            return;
        else
            v44.ServerJobsData:setSortType(v52);
            v43:setState({
                reverseSort = false
            });
            return;
        end;
    end;
    v43.onCanvasPosChanged = function() --[[ Line: 104 ]]
        -- upvalues: v43 (copy)
        local l_CanvasPosition_0 = v43.scrollingRef.current.CanvasPosition;
        if v43.state.canvasPos ~= l_CanvasPosition_0 then
            v43:setState({
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v43.scrollingRef = v1.createRef();
    v43.state = {
        serverJobsList = v45, 
        reverseSort = false, 
        expandIndex = nil
    };
end;
v34.willUpdate = function(v54) --[[ Line: 122 ]] --[[ Name: willUpdate ]]
    if v54.canvasPosConnector then
        v54.canvasPosConnector:Disconnect();
    end;
end;
v34.didUpdate = function(v55) --[[ Line: 128 ]] --[[ Name: didUpdate ]]
    if v55.scrollingRef.current then
        v55.canvasPosConnector = v55.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v55.onCanvasPosChanged);
        local l_AbsoluteSize_0 = v55.scrollingRef.current.AbsoluteSize;
        local l_absScrollSize_0 = v55.state.absScrollSize;
        if l_AbsoluteSize_0.X ~= l_absScrollSize_0.X or l_AbsoluteSize_0.Y ~= l_absScrollSize_0.Y then
            v55:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v34.didMount = function(v58) --[[ Line: 143 ]] --[[ Name: didMount ]]
    v58.statsConnector = v58.props.ServerJobsData:Signal():Connect(function(v59) --[[ Line: 144 ]]
        -- upvalues: v58 (copy)
        v58:setState({
            serverJobsList = v59
        });
    end);
    if v58.scrollingRef.current then
        v58.canvasPosConnector = v58.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v58.onCanvasPosChanged);
        v58:setState({
            absScrollSize = v58.scrollingRef.current.AbsoluteSize, 
            canvasPos = v58.scrollingRef.current.CanvasPosition
        });
    end;
end;
v34.willUnmount = function(v60) --[[ Line: 161 ]] --[[ Name: willUnmount ]]
    v60.statsConnector:Disconnect();
    v60.statsConnector = nil;
    if v60.canvasPosConnector then
        v60.canvasPosConnector:Disconnect();
        v60.canvasPosConnector = nil;
    end;
end;
v34.render = function(v61) --[[ Line: 170 ]] --[[ Name: render ]]
    -- upvalues: l_MinFrameWidth_0 (copy), v1 (copy), v8 (copy), l_EntryFrameHeight_0 (copy), l_LineGraphHeight_0 (copy), l_CellPadding_0 (copy), v5 (copy), v26 (copy), v25 (copy), l_ChartHeaderNames_0 (copy), v22 (copy), v31 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v6 (copy), v7 (copy), v36 (copy), v38 (copy), v18 (copy), v40 (copy), v42 (copy), l_NoResultSearchStr_0 (copy), v4 (copy), l_HeaderFrameHeight_0 (copy)
    local v62 = {};
    local l_searchTerm_0 = v61.props.searchTerm;
    local l_size_0 = v61.props.size;
    local l_layoutOrder_0 = v61.props.layoutOrder;
    local l_serverJobsList_0 = v61.state.serverJobsList;
    local l_reverseSort_0 = v61.state.reverseSort;
    local l_expandIndex_0 = v61.state.expandIndex;
    local l_canvasPos_0 = v61.state.canvasPos;
    local l_absScrollSize_1 = v61.state.absScrollSize;
    local v71 = l_absScrollSize_1 and math.max(l_absScrollSize_1.X, l_MinFrameWidth_0) or l_MinFrameWidth_0;
    local v72 = #l_serverJobsList_0;
    if v72 == 0 then
        return v1.createElement("TextLabel", {
            Size = l_size_0, 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Awaiting Server Jobs Information", 
            TextColor3 = v8.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    else
        local v73 = 0;
        if l_absScrollSize_1 then
            local v74 = -1;
            local v75 = 0;
            for v76, v77 in pairs(l_serverJobsList_0) do
                local l_name_0 = v77.name;
                if not l_searchTerm_0 or string.find(l_name_0:lower(), l_searchTerm_0:lower()) ~= nil then
                    local l_dataStats_0 = v77.dataStats;
                    local v80 = l_dataStats_0.dataSet:back();
                    local v81 = l_expandIndex_0 == l_name_0;
                    local v82 = v81 and l_EntryFrameHeight_0 + 3 * l_LineGraphHeight_0 / 2 + l_CellPadding_0 * 4 or l_EntryFrameHeight_0;
                    if v73 + v82 >= l_canvasPos_0.Y then
                        if v75 < l_absScrollSize_1.Y then
                            local v83 = l_reverseSort_0 and v72 - v76 or v76;
                            local v84 = {
                                [l_name_0] = v1.createElement(v5, {
                                    text = l_name_0, 
                                    size = v26[1], 
                                    pos = v25[1]
                                })
                            };
                            for v85, v86 in pairs(v80.data) do
                                v84[l_ChartHeaderNames_0[v85]] = v1.createElement(v5, {
                                    text = v22[v85](v86), 
                                    size = v26[v85 + 1], 
                                    pos = v25[v85 + 1]
                                });
                            end;
                            for v87 = 2, #v31 do
                                v84[string.format("VerticalLine_%d", v87)] = v1.createElement("Frame", {
                                    Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                                    Position = v31[v87], 
                                    BackgroundColor3 = l_LineColor_0, 
                                    BorderSizePixel = 0
                                });
                            end;
                            v84.lowerHorizontalLine = v1.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                                Position = UDim2.new(0, 0, 1, 0), 
                                BackgroundColor3 = l_LineColor_0, 
                                BorderSizePixel = 0
                            });
                            v62[l_name_0] = v1.createElement("Frame", {
                                Size = UDim2.new(0, v71, 0, v82), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = v83 + 1
                            }, {
                                Button = v1.createElement(v6, {
                                    size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                                    pos = UDim2.new(), 
                                    isExpanded = v81, 
                                    onButtonPress = v61.getOnButtonPress(l_name_0)
                                }, v84), 
                                DutyCycleGraph = v81 and v1.createElement(v7, {
                                    pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0 + l_CellPadding_0), 
                                    size = UDim2.new(0, v71, 0, l_LineGraphHeight_0 / 2), 
                                    graphData = l_dataStats_0.dataSet, 
                                    maxY = l_dataStats_0.max[1], 
                                    minY = l_dataStats_0.min[1], 
                                    getX = v36, 
                                    getY = v38, 
                                    stringFormatX = v18, 
                                    stringFormatY = v22[1], 
                                    axisLabelX = "Timestamp", 
                                    axisLabelY = l_name_0 .. " " .. l_ChartHeaderNames_0[2]
                                }), 
                                StepsPerSecGraph = v81 and v1.createElement(v7, {
                                    pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0 + l_LineGraphHeight_0 / 2 + l_CellPadding_0 * 2), 
                                    size = UDim2.new(0, v71, 0, l_LineGraphHeight_0 / 2), 
                                    graphData = l_dataStats_0.dataSet, 
                                    maxY = l_dataStats_0.max[2], 
                                    minY = l_dataStats_0.min[2], 
                                    getX = v36, 
                                    getY = v40, 
                                    stringFormatX = v18, 
                                    stringFormatY = v22[2], 
                                    axisLabelX = "Timestamp", 
                                    axisLabelY = l_name_0 .. " " .. l_ChartHeaderNames_0[3]
                                }), 
                                StepTimeGraph = v81 and v1.createElement(v7, {
                                    pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0 + l_LineGraphHeight_0 + l_CellPadding_0 * 3), 
                                    size = UDim2.new(0, v71, 0, l_LineGraphHeight_0 / 2), 
                                    graphData = l_dataStats_0.dataSet, 
                                    maxY = l_dataStats_0.max[3], 
                                    minY = l_dataStats_0.min[3], 
                                    getX = v36, 
                                    getY = v42, 
                                    stringFormatX = v18, 
                                    stringFormatY = v22[3], 
                                    axisLabelX = "Timestamp", 
                                    axisLabelY = l_name_0 .. " " .. l_ChartHeaderNames_0[4]
                                })
                            });
                        end;
                        if v74 < 0 then
                            v74 = v73;
                        else
                            v75 = v75 + v82;
                        end;
                    end;
                    v73 = v73 + v82;
                end;
            end;
            if v74 == -1 then
                local v88 = string.format(l_NoResultSearchStr_0, l_searchTerm_0);
                v62.emptyResult = v1.createElement("TextLabel", {
                    Size = l_size_0, 
                    Text = v88, 
                    TextColor3 = v8.Color.Text, 
                    BackgroundTransparency = 1
                });
            else
                v62.WindowingPadding = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v74), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                });
            end;
        end;
        local v89 = {};
        for v90 = 1, #l_ChartHeaderNames_0 do
            v89[l_ChartHeaderNames_0[v90]] = v1.createElement(v4, {
                text = l_ChartHeaderNames_0[v90], 
                size = v26[v90], 
                pos = v25[v90], 
                sortfunction = v61.onSortChanged
            });
        end;
        v89.upperHorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
        v89.lowerHorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
        for v91 = 2, #v31 do
            v89[string.format("VerticalLine_%d", v91)] = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = v31[v91], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
        end;
        v62.UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v1.createElement("Frame", {
            Size = l_size_0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = l_layoutOrder_0
        }, {
            Header = v1.createElement("Frame", {
                Size = UDim2.new(0, v71, 0, l_HeaderFrameHeight_0), 
                BackgroundTransparency = 1
            }, v89), 
            MainChart = v1.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
                Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
                BackgroundTransparency = 1, 
                VerticalScrollBarInset = 1, 
                ScrollBarThickness = 5, 
                CanvasSize = UDim2.new(0, v71, 0, v73), 
                [v1.Ref] = v61.scrollingRef
            }, v62)
        });
    end;
end;
return v3(v34, "ServerJobsData");