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
local l_ChartHeaderNames_0 = v7.DataStoresFormatting.ChartHeaderNames;
local l_ValueCellWidth_0 = v7.DataStoresFormatting.ValueCellWidth;
local l_CellPadding_0 = v7.DataStoresFormatting.CellPadding;
local l_ExpandArrowPadding_0 = v7.DataStoresFormatting.ExpandArrowPadding;
local l_HeaderFrameHeight_0 = v7.DataStoresFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v7.DataStoresFormatting.EntryFrameHeight;
local l_LineGraphHeight_0 = v7.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v7.GeneralFormatting.NoResultSearchStr;
local v18 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v19 = v1.Component:extend("DataStoresChart");
local function v21(v20) --[[ Line: 30 ]] --[[ Name: getX ]]
    return v20.time;
end;
local function v23(v22) --[[ Line: 34 ]] --[[ Name: getY ]]
    return v22.value;
end;
local function v25(v24) --[[ Line: 38 ]] --[[ Name: stringFormatY ]]
    return (math.ceil(v24));
end;
v19.init = function(v26, v27) --[[ Line: 42 ]] --[[ Name: init ]]
    local v28, v29 = v27.DataStoresData:getCurrentData();
    v26.getOnButtonPress = function(v30) --[[ Line: 45 ]]
        -- upvalues: v26 (copy)
        return function(_, _) --[[ Line: 46 ]]
            -- upvalues: v26 (ref), v30 (copy)
            local l_v26_0 = v26;
            local v34 = {};
            local v35 = false;
            if v26.state.expandedEntry ~= v30 then
                v35 = v30;
            end;
            v34.expandedEntry = v35;
            l_v26_0:setState(v34);
        end;
    end;
    v26.state = {
        dataStoresData = v28, 
        dataStoresDataCount = v29, 
        expandedEntry = nil
    };
end;
v19.didMount = function(v36) --[[ Line: 60 ]] --[[ Name: didMount ]]
    v36.statsConnector = v36.props.DataStoresData:Signal():Connect(function(v37, v38) --[[ Line: 61 ]]
        -- upvalues: v36 (copy)
        v36:setState({
            dataStoresData = v37, 
            dataStoresDataCount = v38
        });
    end);
end;
v19.willUnmount = function(v39) --[[ Line: 69 ]] --[[ Name: willUnmount ]]
    v39.statsConnector:Disconnect();
    v39.statsConnector = nil;
end;
v19.render = function(v40) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_HeaderFrameHeight_0 (copy), l_EntryFrameHeight_0 (copy), l_LineGraphHeight_0 (copy), v5 (copy), v4 (copy), l_ValueCellWidth_0 (copy), l_CellPadding_0 (copy), l_ExpandArrowPadding_0 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v6 (copy), v21 (copy), v23 (copy), v18 (copy), v25 (copy), v7 (copy), l_NoResultSearchStr_0 (copy), l_ChartHeaderNames_0 (copy)
    local v41 = {};
    local l_searchTerm_0 = v40.props.searchTerm;
    local l_size_0 = v40.props.size;
    local l_layoutOrder_0 = v40.props.layoutOrder;
    local l_expandedEntry_0 = v40.state.expandedEntry;
    v41.UIListLayout = v1.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local l_l_HeaderFrameHeight_0_0 = l_HeaderFrameHeight_0;
    local l_dataStoresData_0 = v40.state.dataStoresData;
    local v48 = 0;
    local v49 = 1;
    if l_dataStoresData_0 then
        for v50, v51 in pairs(l_dataStoresData_0) do
            v48 = v48 + 1;
            if not l_searchTerm_0 or string.find(v50:lower(), l_searchTerm_0:lower()) ~= nil then
                v49 = v49 + 1;
                local v52 = l_expandedEntry_0 == v50;
                local v53 = v52 and l_EntryFrameHeight_0 + l_LineGraphHeight_0 or l_EntryFrameHeight_0;
                v41[v50] = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v53), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v49
                }, {
                    DataButton = v1.createElement(v5, {
                        size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                        pos = UDim2.new(), 
                        isExpanded = v52, 
                        onButtonPress = v40.getOnButtonPress(v50)
                    }, {
                        [v50] = v1.createElement(v4, {
                            text = v50, 
                            size = UDim2.new(1 - l_ValueCellWidth_0, -l_CellPadding_0 - l_ExpandArrowPadding_0, 1, 0), 
                            pos = UDim2.new(0, l_CellPadding_0 + l_ExpandArrowPadding_0, 0, 0)
                        }), 
                        Data = v1.createElement(v4, {
                            text = v51.dataSet:back().value, 
                            size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 1, 0), 
                            pos = UDim2.new(1 - l_ValueCellWidth_0, l_CellPadding_0, 0, 0)
                        }), 
                        VerticalLine = v1.createElement("Frame", {
                            Size = UDim2.new(0, l_LineWidth_0, 0, l_EntryFrameHeight_0), 
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
                    Graph = v52 and v1.createElement(v6, {
                        pos = UDim2.new(0, 0, 0, l_EntryFrameHeight_0), 
                        size = UDim2.new(1, 0, 1, -l_EntryFrameHeight_0), 
                        graphData = v51.dataSet, 
                        maxY = v51.max, 
                        minY = v51.min, 
                        getX = v21, 
                        getY = v23, 
                        axisLabelX = "Timestamp", 
                        axisLabelY = v50, 
                        stringFormatX = v18, 
                        stringFormatY = v25
                    })
                });
                l_l_HeaderFrameHeight_0_0 = l_l_HeaderFrameHeight_0_0 + l_EntryFrameHeight_0;
            end;
        end;
    end;
    if v49 == 1 then
        if v48 == 0 then
            return v1.createElement("TextLabel", {
                Size = l_size_0, 
                Text = "Initialize DataStoresService to view DataStore Budget.", 
                TextColor3 = v7.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        else
            local v54 = string.format(l_NoResultSearchStr_0, l_searchTerm_0);
            v41.emptyResult = v1.createElement("TextLabel", {
                Size = l_size_0, 
                Text = v54, 
                TextColor3 = v7.Color.Text, 
                BackgroundTransparency = 1
            });
        end;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
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
            vertical = v1.createElement("Frame", {
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
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.new(1, 0, 0, l_l_HeaderFrameHeight_0_0), 
            BackgroundTransparency = 1
        }, v41)
    });
end;
return v3(v19, "DataStoresData");