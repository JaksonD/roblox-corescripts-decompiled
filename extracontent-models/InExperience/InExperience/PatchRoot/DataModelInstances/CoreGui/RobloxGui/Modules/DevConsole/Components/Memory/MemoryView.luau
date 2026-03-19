local l_CorePackages_0 = game:GetService("CorePackages");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.HeaderButton);
local v5 = require(script.Parent.MemoryViewEntry);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_ChartHeaderNames_0 = v6.MemoryFormatting.ChartHeaderNames;
local l_HeaderFrameHeight_0 = v6.GeneralFormatting.HeaderFrameHeight;
local l_ValueCellWidth_0 = v6.MemoryFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.MemoryFormatting.CellPadding;
local l_ValuePadding_0 = v6.MemoryFormatting.ValuePadding;
local l_EntryFrameHeight_0 = v6.GeneralFormatting.EntryFrameHeight;
local l_LineGraphHeight_0 = v6.GeneralFormatting.LineGraphHeight;
local l_NoResultSearchStr_0 = v6.GeneralFormatting.NoResultSearchStr;
local v17 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0);
local v18 = v2.Component:extend("MemoryView");
local function v20(v19) --[[ Line: 37 ]] --[[ Name: getX ]]
    return v19.time;
end;
local function v22(v21) --[[ Line: 41 ]] --[[ Name: getY ]]
    return v21.data;
end;
local function v24(v23) --[[ Line: 45 ]] --[[ Name: formatValueStr ]]
    return string.format("%.3f", v23);
end;
v18.init = function(v25, v26) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), l_TweenService_0 (copy), v17 (copy), v2 (copy)
    v25.getOnButtonPress = function(v27, v28) --[[ Line: 50 ]]
        -- upvalues: v25 (copy), l_EntryFrameHeight_0 (ref), l_TweenService_0 (ref), v17 (ref)
        return function(_, _) --[[ Line: 51 ]]
            -- upvalues: v25 (ref), v27 (copy), v28 (copy), l_EntryFrameHeight_0 (ref), l_TweenService_0 (ref), v17 (ref)
            if v25.state.expandIndex ~= v27 and v27 then
                local l_current_0 = v25.scrollingRef.current;
                if l_current_0 then
                    local v32 = (v28 - 2.4) * l_EntryFrameHeight_0;
                    l_TweenService_0:Create(l_current_0, v17, {
                        CanvasPosition = Vector2.new(0, v32)
                    }):Play();
                end;
            end;
            local l_v25_0 = v25;
            local v34 = {};
            local v35 = false;
            if v25.state.expandIndex ~= v27 then
                v35 = v27;
            end;
            v34.expandIndex = v35;
            l_v25_0:setState(v34);
        end;
    end;
    v25.onSortChanged = function(v36) --[[ Line: 71 ]]
        -- upvalues: v26 (copy), v25 (copy)
        if v36 == v26.targetMemoryData:getSortType() then
            v26.targetMemoryData:setSortType(v36);
            v25:setState({
                reverseSort = not v25.state.reverseSort
            });
            return;
        else
            v26.targetMemoryData:setSortType(v36);
            v25:setState({
                reverseSort = false
            });
            return;
        end;
    end;
    v25.onCanvasPosChanged = function() --[[ Line: 87 ]]
        -- upvalues: v25 (copy)
        local l_CanvasPosition_0 = v25.scrollingRef.current.CanvasPosition;
        if v25.state.canvasPos ~= l_CanvasPosition_0 then
            v25:setState({
                absScrollSize = v25.scrollingRef.current.AbsoluteSize, 
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v25.scrollingRef = v2.createRef();
    v25.state = {
        memoryData = v26.targetMemoryData:getMemoryData(), 
        reverseSort = false, 
        expandIndex = false
    };
end;
v18.willUpdate = function(v38) --[[ Line: 106 ]] --[[ Name: willUpdate ]]
    if v38.canvasPosConnector then
        v38.canvasPosConnector:Disconnect();
    end;
end;
v18.didUpdate = function(v39) --[[ Line: 112 ]] --[[ Name: didUpdate ]]
    if v39.scrollingRef.current then
        v39.canvasPosConnector = v39.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v39.onCanvasPosChanged);
    end;
end;
v18.didMount = function(v40) --[[ Line: 119 ]] --[[ Name: didMount ]]
    v40.treeViewItemConnector = v40.props.targetMemoryData:treeUpdatedSignal():Connect(function(v41) --[[ Line: 121 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            memoryData = v41
        });
    end);
    if v40.scrollingRef.current then
        v40.canvasPosConnector = v40.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v40.onCanvasPosChanged);
        v40:setState({
            absScrollSize = v40.scrollingRef.current.AbsoluteSize, 
            canvasPos = v40.scrollingRef.current.CanvasPosition
        });
    end;
end;
v18.willUnmount = function(v42) --[[ Line: 138 ]] --[[ Name: willUnmount ]]
    v42.treeViewItemConnector:Disconnect();
end;
v18.appendAdditionTabInformation = function(v43, v44, v45, v46, v47, v48) --[[ Line: 142 ]] --[[ Name: appendAdditionTabInformation ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), v2 (copy), v5 (copy), v24 (copy)
    local l_CanvasPosition_1 = v43.scrollingRef.current.CanvasPosition;
    local l_AbsoluteSize_0 = v43.scrollingRef.current.AbsoluteSize;
    for _, v52 in ipairs(v45) do
        local l_name_0 = v52.name;
        local l_value_0 = v52.value;
        local v55 = v46 .. l_name_0;
        v48.layoutOrder = v48.layoutOrder + 1;
        if v48.scrollingFrameHeight + l_EntryFrameHeight_0 >= l_CanvasPosition_1.Y and v48.usedFrameSpace < l_AbsoluteSize_0.Y then
            v44[v46 .. l_name_0] = v2.createElement(v5, {
                size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
                depth = v47, 
                name = l_name_0, 
                showGraph = false, 
                value = l_value_0, 
                formatValueStr = v24, 
                layoutOrder = v48.layoutOrder
            });
            if v48.paddingHeight < 0 then
                v48.paddingHeight = v48.scrollingFrameHeight;
            else
                v48.usedFrameSpace = v48.usedFrameSpace + l_EntryFrameHeight_0;
            end;
        end;
        v48.scrollingFrameHeight = v48.scrollingFrameHeight + l_EntryFrameHeight_0;
        if v52.moreInfo and type(v52.moreInfo) == "table" then
            v43:appendAdditionTabInformation(v44, v52.moreInfo, v55, v47 + 1, v48);
        end;
    end;
end;
v18.recursiveConstructEntries = function(v56, v57, v58, v59, v60) --[[ Line: 183 ]] --[[ Name: recursiveConstructEntries ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), l_LineGraphHeight_0 (copy), v2 (copy), v5 (copy), v24 (copy), v20 (copy), v22 (copy)
    assert(v56.scrollingRef.current, "ScrollingFrame not initialized yet");
    local l_expandIndex_0 = v56.state.expandIndex;
    local v62 = v56.props.searchTerm or "";
    local l_reverseSort_0 = v56.state.reverseSort;
    local l_CanvasPosition_2 = v56.scrollingRef.current.CanvasPosition;
    local l_AbsoluteSize_1 = v56.scrollingRef.current.AbsoluteSize;
    local l_name_1 = v58.name;
    if string.find(l_name_1:lower(), v62:lower()) then
        local v67 = l_expandIndex_0 == l_name_1;
        local v68 = v67 and l_EntryFrameHeight_0 + l_LineGraphHeight_0 or l_EntryFrameHeight_0;
        v60.layoutOrder = v60.layoutOrder + 1;
        if v60.scrollingFrameHeight + v68 >= l_CanvasPosition_2.Y and v60.usedFrameSpace < l_AbsoluteSize_1.Y then
            v57[l_name_1] = v2.createElement(v5, {
                size = UDim2.new(1, 0, 0, v68), 
                depth = v59, 
                name = v58.name, 
                showGraph = v67, 
                dataStats = v58.dataStats, 
                onButtonPress = v56.getOnButtonPress(l_name_1, v60.layoutOrder), 
                formatValueStr = v24, 
                getX = v20, 
                getY = v22, 
                layoutOrder = v60.layoutOrder
            });
            if v60.paddingHeight < 0 then
                v60.paddingHeight = v60.scrollingFrameHeight;
            else
                v60.usedFrameSpace = v60.usedFrameSpace + v68;
            end;
        end;
        v60.scrollingFrameHeight = v60.scrollingFrameHeight + v68;
        if v67 and v58.dataStats.additionalInfoFunc then
            v56:appendAdditionTabInformation(v57, v58.dataStats.additionalInfoFunc(), v58.name, v59 + 1, v60);
        end;
    end;
    local l_sortedChildren_0 = v58.dataStats.sortedChildren;
    if l_sortedChildren_0 then
        if l_reverseSort_0 then
            local v70 = #l_sortedChildren_0;
            for v71 = 1, v70 do
                v56:recursiveConstructEntries(v57, l_sortedChildren_0[v70 - v71 + 1], v59 + 1, v60);
            end;
            return;
        else
            for _, v73 in ipairs(l_sortedChildren_0) do
                v56:recursiveConstructEntries(v57, v73, v59 + 1, v60);
            end;
        end;
    end;
end;
v18.render = function(v74) --[[ Line: 251 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), l_NoResultSearchStr_0 (copy), l_HeaderFrameHeight_0 (copy), v4 (copy), l_ChartHeaderNames_0 (copy), l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_CellPadding_0 (copy), l_LineColor_0 (copy), l_LineWidth_0 (copy)
    local v75 = {};
    local l_layoutOrder_0 = v74.props.layoutOrder;
    local l_size_0 = v74.props.size;
    local v78 = v74.props.searchTerm or "";
    local v79 = {
        scrollingFrameHeight = 0, 
        paddingHeight = -1, 
        usedFrameSpace = 0, 
        layoutOrder = 1
    };
    if v74.scrollingRef.current then
        for _, v81 in ipairs(v74.state.memoryData) do
            v74:recursiveConstructEntries(v75, v81, 0, v79);
        end;
        v75.UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        v75.WindowingPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v79.paddingHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        });
    end;
    if v79.layoutOrder == 1 then
        if v78 == "" then
            v75.noDataMessage = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Awaiting Memory Stats", 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        else
            local v82 = string.format(l_NoResultSearchStr_0, v78);
            v75.noDataMessage = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = v82, 
                TextColor3 = v6.Color.Text, 
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0
            });
        end;
    end;
    return v2.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Name = v2.createElement(v4, {
                text = l_ChartHeaderNames_0[1], 
                size = UDim2.new(1 - l_ValueCellWidth_0, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
                sortfunction = v74.onSortChanged
            }), 
            ValueMB = v2.createElement(v4, {
                text = l_ChartHeaderNames_0[2], 
                size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
                pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0), 
                sortfunction = v74.onSortChanged
            }), 
            TopHorizontal = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            LowerHorizontal = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            }), 
            vertical = v2.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        }), 
        Entries = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = 1, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.new(1, 0, 0, v79.scrollingFrameHeight), 
            [v2.Ref] = v74.scrollingRef
        }, v75)
    });
end;
return v18;