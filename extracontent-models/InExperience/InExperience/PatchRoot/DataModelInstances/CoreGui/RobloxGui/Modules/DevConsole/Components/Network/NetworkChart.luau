local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.Parent.Parent.Constants);
local l_ChartHeaderNames_0 = v3.NetworkFormatting.ChartHeaderNames;
local l_ChartCellWidths_0 = v3.NetworkFormatting.ChartCellWidths;
local l_CellPadding_0 = v3.NetworkFormatting.CellPadding;
local l_HeaderFrameHeight_0 = v3.NetworkFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v3.NetworkFormatting.EntryFrameHeight;
local l_LineWidth_0 = v3.GeneralFormatting.LineWidth;
local l_LineColor_0 = v3.GeneralFormatting.LineColor;
local l_MainWindow_0 = v3.DefaultFontSize.MainWindow;
local l_MainWindow_1 = v3.Font.MainWindow;
local l_ResponseStrHeight_0 = v3.NetworkFormatting.ResponseStrHeight;
local l_ResponseWidthRatio_0 = v3.NetworkFormatting.ResponseWidthRatio;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v16 = require(l_Components_0.HeaderButton);
local v17 = require(script.Parent.NetworkChartEntry);
local v18 = 0;
for _, v20 in pairs(l_ChartCellWidths_0) do
    v18 = v18 + v20;
end;
local v21 = 0;
local v22 = {};
local v23 = {};
local v24 = {};
for _, v26 in ipairs(l_ChartCellWidths_0) do
    table.insert(v22, UDim2.new(0, v21 + l_CellPadding_0, 0, 0));
    table.insert(v23, UDim2.new(0, v26 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v24, UDim2.new(0, v26 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v21 = v21 + v26;
end;
table.insert(v22, UDim2.new(0, v21 + l_CellPadding_0, 0, 0));
table.insert(v23, UDim2.new(1, -v18 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v24, UDim2.new(1, -v18 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
local v27 = {};
for v28, v29 in ipairs(v22) do
    v27[v28] = UDim2.new(v29.X.Scale, v29.X.Offset - l_CellPadding_0, v29.Y.Scale, v29.Y.Offset);
end;
local v30 = v2.Component:extend("NetworkChart");
v30.init = function(v31) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v31.getOnExpandEntry = function(v32) --[[ Line: 58 ]]
        -- upvalues: v31 (copy)
        return function(_, _) --[[ Line: 59 ]]
            -- upvalues: v31 (ref), v32 (copy)
            local l_v31_0 = v31;
            local v36 = {};
            local v37 = false;
            if v31.state.expandIndex ~= v32 then
                v37 = v32;
            end;
            v36.expandIndex = v37;
            l_v31_0:setState(v36);
        end;
    end;
    v31.onCanvasPosChanged = function() --[[ Line: 66 ]]
        -- upvalues: v31 (copy)
        local l_CanvasPosition_0 = v31.scrollingRef.current.CanvasPosition;
        if v31.state.canvasPos ~= l_CanvasPosition_0 then
            v31:setState({
                absScrollSize = v31.scrollingRef.current.AbsoluteSize, 
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v31.ref = v2.createRef();
    v31.scrollingRef = v2.createRef();
    v31.state = {
        expandIndex = false
    };
end;
v30.willUpdate = function(v39) --[[ Line: 84 ]] --[[ Name: willUpdate ]]
    if v39.canvasPosConnector then
        v39.canvasPosConnector:Disconnect();
    end;
end;
v30.didUpdate = function(v40) --[[ Line: 90 ]] --[[ Name: didUpdate ]]
    if v40.scrollingRef.current then
        v40.canvasPosConnector = v40.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v40.onCanvasPosChanged);
        local l_AbsoluteSize_0 = v40.scrollingRef.current.AbsoluteSize;
        if v40.state.absScrollSize ~= l_AbsoluteSize_0 then
            v40:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v30.didMount = function(v42) --[[ Line: 104 ]] --[[ Name: didMount ]]
    if v42.scrollingRef.current then
        v42.canvasPosConnector = v42.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v42.onCanvasPosChanged);
        v42:setState({
            absScrollSize = v42.scrollingRef.current.AbsoluteSize, 
            canvasPos = v42.scrollingRef.current.CanvasPosition
        });
    end;
end;
v30.render = function(v43) --[[ Line: 116 ]] --[[ Name: render ]]
    -- upvalues: l_ChartHeaderNames_0 (copy), v2 (copy), v16 (copy), v23 (copy), v22 (copy), v27 (copy), l_LineWidth_0 (copy), l_HeaderFrameHeight_0 (copy), l_LineColor_0 (copy), l_EntryFrameHeight_0 (copy), l_ResponseStrHeight_0 (copy), l_ResponseWidthRatio_0 (copy), l_TextService_0 (copy), l_MainWindow_0 (copy), l_MainWindow_1 (copy), v17 (copy), v24 (copy), v3 (copy)
    local v44 = v43.props.httpEntryList or {};
    local l_chartHeight_0 = v43.props.chartHeight;
    local l_width_0 = v43.props.width;
    local l_searchTerm_0 = v43.props.searchTerm;
    local l_layoutOrder_0 = v43.props.layoutOrder;
    local l_reverseSort_0 = v43.props.reverseSort;
    local l_onSortChanged_0 = v43.props.onSortChanged;
    local l_expandIndex_0 = v43.state.expandIndex;
    local l_absScrollSize_0 = v43.state.absScrollSize;
    local l_canvasPos_0 = v43.state.canvasPos;
    local v54 = {};
    for v55, v56 in ipairs(l_ChartHeaderNames_0) do
        v54[v56] = v2.createElement(v16, {
            text = v56, 
            size = v23[v55], 
            pos = v22[v55], 
            sortfunction = l_onSortChanged_0
        });
    end;
    for v57 = 2, #v27 do
        v54[string.format("VerticalLine_%d", v57)] = v2.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 0, l_HeaderFrameHeight_0), 
            Position = v27[v57], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    local v58 = {};
    local v59 = 0;
    local v60 = -1;
    local v61 = 0;
    local v62 = #v44;
    local v63 = 0;
    v58.UIListLayout = v2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    if l_canvasPos_0 and l_absScrollSize_0 then
        for v64, v65 in ipairs(v44) do
            local v66 = true;
            if l_searchTerm_0 ~= "" then
                local v67 = true;
                if string.find(v65.RequestType:lower(), l_searchTerm_0:lower()) == nil then
                    v67 = string.find(v65.Url:lower(), l_searchTerm_0:lower()) ~= nil;
                end;
                v66 = v67;
            end;
            if v65.RequestType ~= "Default" and v66 then
                v63 = v63 + 1;
                local v68 = l_expandIndex_0 == v65.Num;
                local l_l_EntryFrameHeight_0_0 = l_EntryFrameHeight_0;
                local v70 = 0;
                if v68 then
                    l_l_EntryFrameHeight_0_0 = l_l_EntryFrameHeight_0_0 + l_ResponseStrHeight_0;
                    if v43.ref.current then
                        local v71 = Vector2.new(v43.ref.current.AbsoluteSize.X * l_ResponseWidthRatio_0, 100000000);
                        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v65.Response, l_MainWindow_0, l_MainWindow_1, v71);
                        v70 = l_ResponseStrHeight_0 + l_l_TextService_0_TextSize_0.Y;
                        l_l_EntryFrameHeight_0_0 = l_l_EntryFrameHeight_0_0 + v70;
                    end;
                end;
                if v59 + l_l_EntryFrameHeight_0_0 >= l_canvasPos_0.Y then
                    if v61 < l_absScrollSize_0.Y then
                        local v73 = l_reverseSort_0 and v62 - v64 or v64;
                        v58[v64] = v2.createElement(v17, {
                            size = UDim2.new(1, 0, 0, l_l_EntryFrameHeight_0_0), 
                            entry = v65, 
                            entryCellSize = v24, 
                            cellOffset = v22, 
                            verticalOffsets = v27, 
                            showResponse = v68, 
                            responseBodyHeight = v70, 
                            layoutOrder = v73 + 1, 
                            onButtonPress = v43.getOnExpandEntry(v65.Num)
                        });
                    end;
                    if v60 < 0 then
                        v60 = v59;
                    else
                        v61 = v61 + l_l_EntryFrameHeight_0_0;
                    end;
                end;
                v59 = v59 + l_l_EntryFrameHeight_0_0;
            end;
        end;
        if v63 > 0 then
            v58.WindowingPadding = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v60), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        end;
    end;
    if v62 == 0 or v63 == 0 then
        v58["NONE FOUND"] = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, l_chartHeight_0), 
            Text = "No Network Entries Found", 
            TextColor3 = v3.Color.Text, 
            BackgroundTransparency = 1
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_chartHeight_0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Ref] = v43.ref
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v54), 
        HorizontalLine_1 = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            LayoutOrder = 2
        }), 
        scrollingFrameEntries = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.new(0, l_width_0, 0, v59), 
            ScrollBarThickness = 6, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            [v2.Ref] = v43.scrollingRef
        }, v58)
    });
end;
return v30;