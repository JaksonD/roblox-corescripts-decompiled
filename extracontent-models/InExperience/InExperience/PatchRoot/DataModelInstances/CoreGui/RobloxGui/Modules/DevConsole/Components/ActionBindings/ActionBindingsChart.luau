local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = game:DefineFastFlag("FixActionBindingSecurity", false);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.DataConsumer);
local v5 = require(l_Components_0.HeaderButton);
local v6 = require(l_Components_0.CellLabel);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_GeneralFormatting_0 = v7.GeneralFormatting;
local l_LineWidth_0 = l_GeneralFormatting_0.LineWidth;
local l_LineColor_0 = l_GeneralFormatting_0.LineColor;
local l_ActionBindingsFormatting_0 = v7.ActionBindingsFormatting;
local l_ChartHeaderNames_0 = l_ActionBindingsFormatting_0.ChartHeaderNames;
local l_ChartCellWidths_0 = l_ActionBindingsFormatting_0.ChartCellWidths;
local l_HeaderFrameHeight_0 = l_ActionBindingsFormatting_0.HeaderFrameHeight;
local l_EntryFrameHeight_0 = l_ActionBindingsFormatting_0.EntryFrameHeight;
local l_CellPadding_0 = l_ActionBindingsFormatting_0.CellPadding;
local l_MinFrameWidth_0 = l_ActionBindingsFormatting_0.MinFrameWidth;
local v18 = 0;
for _, v20 in ipairs(l_ChartCellWidths_0) do
    v18 = v18 + v20;
end;
local v21 = -v18;
local v22 = {};
local v23 = {};
local v24 = {};
v21 = v21 / 2;
table.insert(v22, UDim2.new(0, l_CellPadding_0, 0, 0));
table.insert(v23, UDim2.new(0.5, v21 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v24, UDim2.new(0.5, v21 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
for _, v26 in ipairs(l_ChartCellWidths_0) do
    table.insert(v22, UDim2.new(0.5, v21 + l_CellPadding_0, 0, 0));
    table.insert(v23, UDim2.new(0, v26 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v24, UDim2.new(0, v26 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v21 = v21 + v26;
end;
table.insert(v22, UDim2.new(0.5, v21 + l_CellPadding_0, 0, 0));
table.insert(v23, UDim2.new(0.5, -v18 / 2 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v24, UDim2.new(0.5, -v18 / 2 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
local v27 = {};
for v28, v29 in ipairs(v22) do
    v27[v28] = UDim2.new(v29.X.Scale, v29.X.Offset - l_CellPadding_0, v29.Y.Scale, v29.Y.Offset);
end;
local v30 = v1.Component:extend("ActionBindingsChart");
local function v37(v31, v32) --[[ Line: 63 ]] --[[ Name: constructHeader ]]
    -- upvalues: l_ChartHeaderNames_0 (copy), v1 (copy), v5 (copy), v23 (copy), v22 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v27 (copy), l_HeaderFrameHeight_0 (copy)
    local v33 = {};
    for v34, v35 in ipairs(l_ChartHeaderNames_0) do
        v33[v35] = v1.createElement(v5, {
            text = v35, 
            size = v23[v34], 
            pos = v22[v34], 
            sortfunction = v31
        });
    end;
    v33.upperHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v33.lowerHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    for v36 = 2, #v27 do
        v33[string.format("VerticalLine_%d", v36)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v27[v36], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v32, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1
    }, v33);
end;
local function v47(v38, v39, v40) --[[ Line: 105 ]] --[[ Name: constructEntry ]]
    -- upvalues: v2 (copy), v27 (copy), v1 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v6 (copy), v24 (copy), v22 (copy), l_EntryFrameHeight_0 (copy)
    local l_name_0 = v38.name;
    local l_actionInfo_0 = v38.actionInfo;
    local v43 = tostring(l_actionInfo_0.inputTypes[1]);
    local v44 = nil;
    if v2 then
        v44 = "Developer";
        if l_actionInfo_0.isCore then
            v44 = "Core";
        end;
    else
        v44 = "Core";
        if l_actionInfo_0.isCore then
            v44 = "Developer";
        end;
    end;
    local v45 = {};
    for v46 = 2, #v27 do
        v45[string.format("line_%d", v46)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v27[v46], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    v45[l_name_0] = v1.createElement(v6, {
        text = v43, 
        size = v24[1], 
        pos = v22[1]
    });
    v45.priorityLevel = v1.createElement(v6, {
        text = l_actionInfo_0.priorityLevel, 
        size = v24[2], 
        pos = v22[2]
    });
    v45.isCore = v1.createElement(v6, {
        text = v44, 
        size = v24[3], 
        pos = v22[3]
    });
    v45.actionName = v1.createElement(v6, {
        text = l_name_0, 
        size = v24[4], 
        pos = v22[4]
    });
    v45.inputTypes = v1.createElement(v6, {
        text = v43, 
        size = v24[5], 
        pos = v22[5]
    });
    v45.lowerHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v39, 0, l_EntryFrameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v40
    }, v45);
end;
v30.init = function(v48, v49) --[[ Line: 182 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    local v50 = v49.ActionBindingsData:getCurrentData();
    v48.onSortChanged = function(v51) --[[ Line: 185 ]]
        -- upvalues: v49 (copy), v48 (copy)
        if v51 == v49.ActionBindingsData:getSortType() then
            v48:setState({
                reverseSort = not v48.state.reverseSort
            });
            return;
        else
            v49.ActionBindingsData:setSortType(v51);
            v48:setState({
                reverseSort = false
            });
            return;
        end;
    end;
    v48.onCanvasPosChanged = function() --[[ Line: 199 ]]
        -- upvalues: v48 (copy)
        local l_CanvasPosition_0 = v48.scrollingRef.current.CanvasPosition;
        if v48.state.canvasPos ~= l_CanvasPosition_0 then
            v48:setState({
                canvasPos = l_CanvasPosition_0
            });
        end;
    end;
    v48.scrollingRef = v1.createRef();
    v48.state = {
        actionBindingEntries = v50, 
        reverseSort = false
    };
end;
v30.willUpdate = function(v53) --[[ Line: 216 ]] --[[ Name: willUpdate ]]
    if v53.canvasPosConnector then
        v53.canvasPosConnector:Disconnect();
    end;
end;
v30.didUpdate = function(v54) --[[ Line: 222 ]] --[[ Name: didUpdate ]]
    if v54.scrollingRef.current then
        v54.canvasPosConnector = v54.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v54.onCanvasPosChanged);
        local l_AbsoluteSize_0 = v54.scrollingRef.current.AbsoluteSize;
        local l_absScrollSize_0 = v54.state.absScrollSize;
        if l_AbsoluteSize_0.X ~= l_absScrollSize_0.X or l_AbsoluteSize_0.Y ~= l_absScrollSize_0.Y then
            v54:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v30.didMount = function(v57) --[[ Line: 237 ]] --[[ Name: didMount ]]
    v57.bindingsUpdated = v57.props.ActionBindingsData:Signal():Connect(function(v58) --[[ Line: 238 ]]
        -- upvalues: v57 (copy)
        v57:setState({
            actionBindingEntries = v58
        });
    end);
    if v57.scrollingRef.current then
        v57.canvasPosConnector = v57.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v57.onCanvasPosChanged);
        v57:setState({
            absScrollSize = v57.scrollingRef.current.AbsoluteSize, 
            canvasPos = v57.scrollingRef.current.CanvasPosition
        });
    end;
end;
v30.willUnmount = function(v59) --[[ Line: 255 ]] --[[ Name: willUnmount ]]
    v59.bindingsUpdated:Disconnect();
    v59.bindingsUpdated = nil;
    v59.canvasPosConnector:Disconnect();
    v59.canvasPosConnector = nil;
end;
v30.render = function(v60) --[[ Line: 262 ]] --[[ Name: render ]]
    -- upvalues: l_MinFrameWidth_0 (copy), v1 (copy), l_EntryFrameHeight_0 (copy), v47 (copy), l_LineColor_0 (copy), v37 (copy), l_HeaderFrameHeight_0 (copy), v7 (copy)
    local v61 = {};
    local l_searchTerm_0 = v60.props.searchTerm;
    local l_size_0 = v60.props.size;
    local l_layoutOrder_0 = v60.props.layoutOrder;
    local l_actionBindingEntries_0 = v60.state.actionBindingEntries;
    local l_reverseSort_0 = v60.state.reverseSort;
    local l_canvasPos_0 = v60.state.canvasPos;
    local l_absScrollSize_1 = v60.state.absScrollSize;
    local v69 = l_absScrollSize_1 and math.max(l_absScrollSize_1.X, l_MinFrameWidth_0) or l_MinFrameWidth_0;
    v61.UIListLayout = v1.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local v70 = #l_actionBindingEntries_0;
    local v71 = 0;
    if l_absScrollSize_1 and l_canvasPos_0 then
        local v72 = -1;
        local v73 = 0;
        local v74 = 0;
        for v75, v76 in ipairs(l_actionBindingEntries_0) do
            local v77 = false;
            if l_searchTerm_0 then
                local v78 = tostring(v76.actionInfo.inputTypes[1]);
                v77 = string.find(v78:lower(), l_searchTerm_0:lower()) ~= nil or string.find(v76.name:lower(), l_searchTerm_0:lower()) ~= nil;
            end;
            if not l_searchTerm_0 or v77 then
                if v71 + l_EntryFrameHeight_0 >= l_canvasPos_0.Y then
                    if v73 < l_absScrollSize_1.Y then
                        local v79 = l_reverseSort_0 and v70 - v75 or v75;
                        v61[v75] = v47(v76, v69, v79 + 1);
                    end;
                    if v72 < 0 then
                        v72 = v71;
                    else
                        v73 = v73 + l_EntryFrameHeight_0;
                    end;
                    v74 = v74 + 1;
                end;
                v71 = v71 + l_EntryFrameHeight_0;
            end;
        end;
        if v74 == 0 then
            v61.NoneFound = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "No ActionBindings Found", 
                TextColor3 = l_LineColor_0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        else
            v61.WindowingPadding = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v72), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        end;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v37(v60.onSortChanged, v69), 
        MainChart = v1.createElement("ScrollingFrame", {
            Position = UDim2.new(0, 0, 0, l_HeaderFrameHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.new(0, v69, 0, v71), 
            ScrollBarThickness = 6, 
            BackgroundColor3 = v7.Color.BaseGray, 
            BackgroundTransparency = 1, 
            [v1.Ref] = v60.scrollingRef
        }, v61)
    });
end;
return v4(v30, "ActionBindingsData");