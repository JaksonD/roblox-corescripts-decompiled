local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(script.Parent.Parent.Parent.Components.DataConsumer);
local v4 = require(l_Components_0.HeaderButton);
local v5 = require(script.Parent.ServerScriptsEntry);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_ChartCellWidths_0 = v6.ServerScriptsFormatting.ChartCellWidths;
local l_ChartHeaderNames_0 = v6.ServerScriptsFormatting.ChartHeaderNames;
local l_HeaderFrameHeight_0 = v6.ServerScriptsFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v6.ServerScriptsFormatting.EntryFrameHeight;
local l_CellPadding_0 = v6.ServerScriptsFormatting.CellPadding;
local l_LineGraphHeight_0 = v6.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v6.GeneralFormatting.NoResultSearchStr;
local v16 = {};
local v17 = {};
local v18 = {};
local v19 = 0;
for _, v21 in ipairs(l_ChartCellWidths_0) do
    table.insert(v16, UDim2.new(v19, l_CellPadding_0, 0, 0));
    table.insert(v17, UDim2.new(v21, -l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v18, UDim2.new(v21, -l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v19 = v19 + v21;
end;
local v22 = {};
for v23, v24 in ipairs(v16) do
    v22[v23] = UDim2.new(v24.X.Scale, v24.X.Offset - l_CellPadding_0, v24.Y.Scale, v24.Y.Offset);
end;
local v25 = v1.Component:extend("ServerScripts");
local function v29(v26) --[[ Line: 45 ]] --[[ Name: constructHeader ]]
    -- upvalues: l_ChartHeaderNames_0 (copy), v1 (copy), v4 (copy), v17 (copy), v16 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v22 (copy), l_HeaderFrameHeight_0 (copy)
    local v27 = {};
    for v28 = 1, #l_ChartHeaderNames_0 do
        v27[l_ChartHeaderNames_0[v28]] = v1.createElement(v4, {
            text = l_ChartHeaderNames_0[v28], 
            size = v17[v28], 
            pos = v16[v28], 
            sortfunction = v26
        });
    end;
    v27.upperHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v27.verticalLine1 = v1.createElement("Frame", {
        Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
        Position = v22[2], 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v27.verticalLine2 = v1.createElement("Frame", {
        Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
        Position = v22[3], 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v27.lowerHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1
    }, v27);
end;
local function v31(v30) --[[ Line: 91 ]] --[[ Name: getX ]]
    return v30.time;
end;
local function v33(v32) --[[ Line: 95 ]] --[[ Name: getActivity ]]
    return v32.data[1];
end;
local function v35(v34) --[[ Line: 99 ]] --[[ Name: getRate ]]
    return v34.data[2];
end;
local function v37(v36) --[[ Line: 103 ]] --[[ Name: formatScriptsData ]]
    return string.format("%.3f", v36);
end;
v25.init = function(v38, v39) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    local v40 = v39.ServerScriptsData:getCurrentData();
    v38.onSortChanged = function(v41) --[[ Line: 110 ]]
        -- upvalues: v39 (copy), v38 (copy)
        if v41 == v39.ServerScriptsData:getSortType() then
            v38:setState({
                reverseSort = not v38.state.reverseSort
            });
            return;
        else
            v39.ServerScriptsData:setSortType(v41);
            v38:setState({
                reverseSort = false
            });
            return;
        end;
    end;
    v38.getOnButtonPress = function(v42) --[[ Line: 124 ]]
        -- upvalues: v38 (copy)
        return function(_, _) --[[ Line: 125 ]]
            -- upvalues: v38 (ref), v42 (copy)
            local l_v38_0 = v38;
            local v46 = {};
            local v47 = false;
            if v38.state.expandIndex ~= v42 then
                v47 = v42;
            end;
            v46.expandIndex = v47;
            l_v38_0:setState(v46);
        end;
    end;
    v38.onCanvasPosChanged = function() --[[ Line: 132 ]]
        -- upvalues: v38 (copy)
        local l_CanvasPosition_0 = v38.scrollingRef.current.CanvasPosition;
        if v38.state.canvasPos ~= l_CanvasPosition_0 then
            v38:setState({
                absScrollSize = v38.scrollingRef.current.AbsoluteSize, 
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v38.scrollingRef = v1.createRef();
    v38.state = {
        serverScriptsData = v40, 
        expandIndex = nil
    };
end;
v25.willUpdate = function(v49) --[[ Line: 150 ]] --[[ Name: willUpdate ]]
    if v49.canvasPosConnector then
        v49.canvasPosConnector:Disconnect();
    end;
end;
v25.didUpdate = function(v50) --[[ Line: 156 ]] --[[ Name: didUpdate ]]
    if v50.scrollingRef.current then
        v50.canvasPosConnector = v50.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v50.onCanvasPosChanged);
    end;
end;
v25.didMount = function(v51) --[[ Line: 163 ]] --[[ Name: didMount ]]
    v51.statsConnector = v51.props.ServerScriptsData:Signal():Connect(function(v52) --[[ Line: 164 ]]
        -- upvalues: v51 (copy)
        v51:setState({
            serverScriptsData = v52
        });
    end);
    if v51.scrollingRef.current then
        v51.canvasPosConnector = v51.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v51.onCanvasPosChanged);
        v51:setState({
            absScrollSize = v51.scrollingRef.current.AbsoluteSize, 
            canvasPos = v51.scrollingRef.current.CanvasPosition
        });
    end;
end;
v25.willUnmount = function(v53) --[[ Line: 181 ]] --[[ Name: willUnmount ]]
    v53.statsConnector:Disconnect();
    v53.statsConnector = nil;
end;
v25.render = function(v54) --[[ Line: 186 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), l_EntryFrameHeight_0 (copy), l_LineGraphHeight_0 (copy), v5 (copy), v18 (copy), v16 (copy), v22 (copy), v37 (copy), v31 (copy), v33 (copy), v35 (copy), l_NoResultSearchStr_0 (copy), v29 (copy), l_HeaderFrameHeight_0 (copy)
    local l_searchTerm_0 = v54.props.searchTerm;
    local l_scriptFilters_0 = v54.props.scriptFilters;
    local l_layoutOrder_0 = v54.props.layoutOrder;
    local l_size_0 = v54.props.size;
    local l_serverScriptsData_0 = v54.state.serverScriptsData;
    local l_reverseSort_0 = v54.state.reverseSort;
    local l_absScrollSize_0 = v54.state.absScrollSize;
    local l_canvasPos_0 = v54.state.canvasPos;
    local v63 = {};
    local v64 = #l_serverScriptsData_0;
    if v64 == 0 then
        return v1.createElement("TextLabel", {
            Size = l_size_0, 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Awaiting Server Scripts Information.", 
            TextColor3 = v6.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    else
        local v65 = 0;
        local v66 = -1;
        local v67 = 0;
        local v68 = 0;
        if l_canvasPos_0 and l_absScrollSize_0 then
            for v69, v70 in pairs(l_serverScriptsData_0) do
                if not l_searchTerm_0 or string.find(v70.name:lower(), l_searchTerm_0:lower()) ~= nil then
                    v68 = v68 + 1;
                    local v71 = true;
                    local l_Active_0 = l_scriptFilters_0.Active;
                    local l_Inactive_0 = l_scriptFilters_0.Inactive;
                    local v74 = v70.dataStats.dataSet:back();
                    if l_Active_0 ~= l_Inactive_0 then
                        if v74.data[1] > 0 and l_Inactive_0 then
                            v71 = false;
                        elseif v74.data[1] == 0 and l_Active_0 then
                            v71 = false;
                        end;
                    end;
                    if v71 then
                        local v75 = v54.state.expandIndex == v70.name;
                        local v76 = v75 and l_EntryFrameHeight_0 + 2 * l_LineGraphHeight_0 or l_EntryFrameHeight_0;
                        if v65 + v76 >= l_canvasPos_0.Y then
                            if v67 < l_absScrollSize_0.Y then
                                local v77 = v74.data[1] > 0 and v6.Color.ActiveBox or v6.Color.InactiveBox;
                                local v78 = l_reverseSort_0 and v64 - v69 or v69;
                                v63[v69] = v1.createElement(v5, {
                                    scriptData = v70, 
                                    frameHeight = v76, 
                                    showGraph = v75, 
                                    layoutOrder = v78, 
                                    activityBoxColor = v77, 
                                    entryCellSize = v18, 
                                    cellOffset = v16, 
                                    verticalOffsets = v22, 
                                    onButtonPress = v54.getOnButtonPress(v70.name), 
                                    formatScriptsData = v37, 
                                    getX = v31, 
                                    getActivity = v33, 
                                    getRate = v35, 
                                    stringFormatY = v37
                                });
                            end;
                            if v66 < 0 then
                                v66 = v65;
                            else
                                v67 = v67 + v76;
                            end;
                        end;
                        v65 = v65 + v76;
                    end;
                end;
            end;
            if v68 > 0 then
                v63.WindowingPadding = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v66), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                });
            else
                local v79 = string.format(l_NoResultSearchStr_0, l_searchTerm_0);
                v63.emptySearch = v1.createElement("TextLabel", {
                    Size = l_size_0, 
                    Text = v79, 
                    TextColor3 = v6.Color.Text, 
                    BackgroundTransparency = 1
                });
            end;
        end;
        v63.UIListLayout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        return v1.createElement("Frame", {
            Size = l_size_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        }, {
            Header = v29(v54.onSortChanged), 
            Entries = v1.createElement("ScrollingFrame", {
                Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
                Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
                BackgroundTransparency = 1, 
                VerticalScrollBarInset = 1, 
                ScrollBarThickness = 5, 
                CanvasSize = UDim2.new(1, 0, 0, v65), 
                [v1.Ref] = v54.scrollingRef
            }, v63)
        });
    end;
end;
return v3(v25, "ServerScriptsData");