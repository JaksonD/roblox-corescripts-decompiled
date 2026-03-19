local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.DataConsumer);
local v4 = require(l_Components_0.CellLabel);
local v5 = require(l_Components_0.BannerButton);
local v6 = require(l_Components_0.LineGraph);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v7.GeneralFormatting.LineWidth;
local l_LineColor_0 = v7.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v7.ServerStatsFormatting.ChartHeaderNames;
local l_ValueCellWidth_0 = v7.ServerStatsFormatting.ValueCellWidth;
local l_CellPadding_0 = v7.ServerStatsFormatting.CellPadding;
local l_ExpandArrowPadding_0 = v7.ServerStatsFormatting.ExpandArrowPadding;
local l_HeaderFrameHeight_0 = v7.ServerStatsFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v7.ServerStatsFormatting.EntryFrameHeight;
local l_LineGraphHeight_0 = v7.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v7.GeneralFormatting.NoResultSearchStr;
local v18 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v19 = v1.Component:extend("ServerStats");
local function v21(v20) --[[ Line: 29 ]] --[[ Name: formatData ]]
    return string.format("%.3f", v20);
end;
local function v23(v22) --[[ Line: 32 ]] --[[ Name: getX ]]
    return v22.time;
end;
local function v25(v24) --[[ Line: 36 ]] --[[ Name: getY ]]
    return v24.value;
end;
v19.init = function(v26) --[[ Line: 40 ]] --[[ Name: init ]]
    local v27 = v26.props.ServerStatsData:getCurrentData();
    v26.getOnButtonPress = function(v28) --[[ Line: 43 ]]
        -- upvalues: v26 (copy)
        return function(_, _) --[[ Line: 44 ]]
            -- upvalues: v26 (ref), v28 (copy)
            local l_v26_0 = v26;
            local v32 = {};
            local v33 = false;
            if v26.state.expandedEntry ~= v28 then
                v33 = v28;
            end;
            v32.expandedEntry = v33;
            l_v26_0:setState(v32);
        end;
    end;
    v26.state = {
        serverStatsData = v27
    };
end;
v19.didMount = function(v34) --[[ Line: 56 ]] --[[ Name: didMount ]]
    v34.statsConnector = v34.props.ServerStatsData:Signal():Connect(function(v35) --[[ Line: 57 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            serverStatsData = v35
        });
    end);
end;
v19.willUnmount = function(v36) --[[ Line: 64 ]] --[[ Name: willUnmount ]]
    v36.statsConnector:Disconnect();
    v36.statsConnector = nil;
end;
v19.render = function(v37) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), l_LineGraphHeight_0 (copy), v1 (copy), v5 (copy), v4 (copy), l_ValueCellWidth_0 (copy), l_CellPadding_0 (copy), l_ExpandArrowPadding_0 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v6 (copy), v23 (copy), v25 (copy), v18 (copy), v21 (copy), v7 (copy), l_NoResultSearchStr_0 (copy), l_HeaderFrameHeight_0 (copy), l_ChartHeaderNames_0 (copy)
    local v38 = {};
    local l_searchTerm_0 = v37.props.searchTerm;
    local l_layoutOrder_0 = v37.props.layoutOrder;
    local l_size_0 = v37.props.size;
    local l_expandedEntry_0 = v37.state.expandedEntry;
    local l_serverStatsData_0 = v37.state.serverStatsData;
    local v44 = 1;
    local v45 = 0;
    local v46 = 0;
    if l_serverStatsData_0 then
        for v47, v48 in pairs(l_serverStatsData_0) do
            v45 = v45 + 1;
            if not l_searchTerm_0 or string.find(v47:lower(), l_searchTerm_0:lower()) ~= nil then
                v44 = v44 + 1;
                local v49 = l_expandedEntry_0 == v47;
                local v50 = v49 and l_EntryFrameHeight_0 + l_LineGraphHeight_0 or l_EntryFrameHeight_0;
                v46 = v49 and v46 + 1 or v46;
                local l_createElement_0 = v1.createElement;
                local v52 = "Frame";
                local v53 = {
                    Size = UDim2.new(1, 0, 0, v50), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v44
                };
                local v54 = {};
                local l_createElement_1 = v1.createElement;
                local l_v5_0 = v5;
                local v57 = {
                    size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                    pos = UDim2.new(), 
                    isExpanded = v49, 
                    onButtonPress = v37.getOnButtonPress(v47)
                };
                local v58 = {
                    [v47] = v1.createElement(v4, {
                        text = v47, 
                        size = UDim2.new(1 - l_ValueCellWidth_0, -l_CellPadding_0 - l_ExpandArrowPadding_0, 1, 0), 
                        pos = UDim2.new(0, l_CellPadding_0 + l_ExpandArrowPadding_0, 0, 0)
                    })
                };
                local l_createElement_2 = v1.createElement;
                local l_v4_0 = v4;
                local v61 = {};
                local l_value_0 = v48.dataSet:back().value;
                v61.text = string.format("%.3f", l_value_0);
                v61.size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 1, 0);
                v61.pos = UDim2.new(1 - l_ValueCellWidth_0, l_CellPadding_0, 0, 0);
                v58.Data = l_createElement_2(l_v4_0, v61);
                v58.VerticalLine = v1.createElement("Frame", {
                    Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                    Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
                    BackgroundColor3 = l_LineColor_0, 
                    BorderSizePixel = 0
                });
                v58.HorizontalAlignment = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundColor3 = l_LineColor_0, 
                    BorderSizePixel = 0
                });
                v54.DataButton = l_createElement_1(l_v5_0, v57, v58);
                v54.Graph = v49 and v1.createElement(v6, {
                    pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
                    size = UDim2.new(1, 0, 1, -l_EntryFrameHeight_0), 
                    graphData = v48.dataSet, 
                    minY = v48.min, 
                    maxY = v48.max, 
                    getX = v23, 
                    getY = v25, 
                    axisLabelX = "Timestamp", 
                    axisLabelY = v47, 
                    stringFormatX = v18, 
                    stringFormatY = v21
                });
                v38[v47] = l_createElement_0(v52, v53, v54);
            end;
        end;
    end;
    if v44 == 1 then
        if v45 == 0 then
            return v1.createElement("TextLabel", {
                Size = l_size_0, 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Awaiting Server Stats", 
                TextColor3 = v7.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        else
            local v63 = string.format(l_NoResultSearchStr_0, l_searchTerm_0);
            v38.emptyResult = v1.createElement("TextLabel", {
                Size = l_size_0, 
                Text = v63, 
                TextColor3 = v7.Color.Text, 
                BackgroundTransparency = 1
            });
        end;
    end;
    v38.UIListLayout = v1.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local v64 = v45 * l_EntryFrameHeight_0 + v46 * l_LineGraphHeight_0;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            [l_ChartHeaderNames_0[1]] = v1.createElement(v4, {
                text = l_ChartHeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0, -l_CellPadding_0 - l_ExpandArrowPadding_0, 1, 0), 
                pos = UDim2.new(0, l_CellPadding_0 + l_ExpandArrowPadding_0, 0, 0)
            }), 
            [l_ChartHeaderNames_0[2]] = v1.createElement(v4, {
                text = l_ChartHeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 1, 0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0, l_CellPadding_0, 0, 0)
            }), 
            upperHorizontalLine = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            VerticalLine = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
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
        mainFrame = v1.createElement("ScrollingFrame", {
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.new(1, 0, 0, v64), 
            ScrollBarThickness = 5, 
            BackgroundTransparency = 1
        }, v38)
    });
end;
return v3(v19, "ServerStatsData");