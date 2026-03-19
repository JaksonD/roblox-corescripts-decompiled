local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.BannerButton);
local v5 = require(l_Components_0.BoxButton);
local v6 = require(l_Components_0.CellCheckbox);
local v7 = require(l_Components_0.CellLabel);
local v8 = require(l_Components_0.DataConsumer);
local v9 = require(l_Components_0.HeaderButton);
local v10 = require(script.Parent.Parent.Parent.Constants);
local l_GeneralFormatting_0 = v10.GeneralFormatting;
local l_LineWidth_0 = l_GeneralFormatting_0.LineWidth;
local l_LineColor_0 = l_GeneralFormatting_0.LineColor;
local l_DebugVisualizationsFormatting_0 = v10.DebugVisualizationsFormatting;
local l_ChartHeaderNames_0 = l_DebugVisualizationsFormatting_0.ChartHeaderNames;
local l_ChartCellWidths_0 = l_DebugVisualizationsFormatting_0.ChartCellWidths;
local l_HeaderFrameHeight_0 = l_DebugVisualizationsFormatting_0.HeaderFrameHeight;
local l_EntryFrameHeight_0 = l_DebugVisualizationsFormatting_0.EntryFrameHeight;
local l_CellPadding_0 = l_DebugVisualizationsFormatting_0.CellPadding;
local l_MinFrameWidth_0 = l_DebugVisualizationsFormatting_0.MinFrameWidth;
local l_LearnMoreWidth_0 = l_DebugVisualizationsFormatting_0.LearnMoreWidth;
local v22 = 0;
for _, v24 in ipairs(l_ChartCellWidths_0) do
    v22 = v22 + v24;
end;
local v25 = -v22;
local v26 = {};
local v27 = {};
local v28 = {};
v25 = v25 / 2;
table.insert(v26, UDim2.fromOffset(l_CellPadding_0, 0));
table.insert(v27, UDim2.new(0.5, v25 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v28, UDim2.new(0.5, v25 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
for _, v30 in ipairs(l_ChartCellWidths_0) do
    table.insert(v26, UDim2.new(0.5, v25 + l_CellPadding_0, 0, 0));
    table.insert(v27, UDim2.fromOffset(v30 - l_CellPadding_0, l_HeaderFrameHeight_0));
    table.insert(v28, UDim2.fromOffset(v30 - l_CellPadding_0, l_EntryFrameHeight_0));
    v25 = v25 + v30;
end;
table.insert(v26, UDim2.new(0.5, v25 + l_CellPadding_0, 0, 0));
table.insert(v27, UDim2.new(0.5, -v22 / 2 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v28, UDim2.new(0.5, -v22 / 2 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
assert(#l_ChartCellWidths_0 == 2, "DebugVisualizationsChart expected DebugVisualizationsFormatting CELL_WIDTHS to have a length of 2");
assert(#v26 == 4, "DebugVisualizationsChart expected cellOffset to have length " .. 4);
assert(#v27 == 4, "DebugVisualizationsChart expected headerCellSize to have length " .. 4);
assert(#v28 == 4, "DebugVisualizationsChart expected entryCellSize to have length " .. 4);
local v31 = {};
for v32, v33 in ipairs(v26) do
    v31[v32] = UDim2.new(v33.X.Scale, v33.X.Offset - l_CellPadding_0, v33.Y.Scale, v33.Y.Offset);
end;
local v34 = v1.Component:extend("DebugVisualizationsChart");
local function v41(v35, v36) --[[ Line: 84 ]] --[[ Name: constructHeader ]]
    -- upvalues: l_ChartHeaderNames_0 (copy), v1 (copy), v9 (copy), v27 (copy), v26 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v31 (copy), l_HeaderFrameHeight_0 (copy)
    local v37 = {};
    for v38, v39 in ipairs(l_ChartHeaderNames_0) do
        v37[v39] = v1.createElement(v9, {
            text = v39, 
            size = v27[v38], 
            pos = v26[v38], 
            sortfunction = v35
        });
    end;
    v37.upperHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    v37.lowerHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, -l_LineWidth_0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    for v40 = 2, #v31 do
        v37[string.format("VerticalLine_%d", v40)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v31[v40], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v36, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1
    }, v37);
end;
local function v54(v42, v43, v44, v45, v46, v47, v48) --[[ Line: 126 ]] --[[ Name: constructEntry ]]
    -- upvalues: v31 (copy), v1 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v7 (copy), v28 (copy), v26 (copy), v6 (copy), v4 (copy), l_EntryFrameHeight_0 (copy), l_CellPadding_0 (copy), l_LearnMoreWidth_0 (copy), v5 (copy)
    local l_name_0 = v42.name;
    local l_settingInfo_0 = v42.settingInfo;
    local v51 = tostring(l_settingInfo_0.Name);
    local v52 = {};
    for v53 = 2, #v31 do
        v52[string.format("line_%d", v53)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = v31[v53], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    v52[l_name_0] = v1.createElement(v7, {
        text = v51, 
        size = v28[1], 
        pos = v26[1]
    });
    v52.checkbox = v1.createElement(v6, {
        name = v51, 
        isSelected = l_settingInfo_0.Value, 
        size = v28[2], 
        pos = v26[2], 
        OnCheckboxClicked = v42.valueChangeCallback
    });
    v52.visualType = v1.createElement(v7, {
        text = l_settingInfo_0.Type, 
        size = v28[3], 
        pos = v26[3]
    });
    v52.tags = v1.createElement(v7, {
        text = tostring(l_settingInfo_0.Tagstring), 
        size = v28[4], 
        pos = v26[4]
    });
    v52.lowerHorizontalLine = v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = l_LineColor_0, 
        BorderSizePixel = 0
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v43, 0, v44), 
        BackgroundTransparency = 1, 
        LayoutOrder = v45
    }, {
        Button = v1.createElement(v4, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(), 
            isExpanded = v46, 
            onButtonPress = v47(l_name_0)
        }, v52), 
        DescriptionText = v46 and v1.createElement(v7, {
            pos = UDim2.new(0, l_CellPadding_0, 0, l_EntryFrameHeight_0 + l_CellPadding_0), 
            size = UDim2.new(0, v43 - l_LearnMoreWidth_0 - l_CellPadding_0 * 2, 0, l_EntryFrameHeight_0), 
            text = tostring(l_settingInfo_0.Description)
        }), 
        LearnMoreButton = v46 and v1.createElement(v5, {
            text = "Learn More", 
            size = UDim2.new(0, l_LearnMoreWidth_0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(0, v43 - l_LearnMoreWidth_0 - l_CellPadding_0, 0, l_EntryFrameHeight_0 + l_CellPadding_0), 
            onClicked = v48(l_name_0)
        })
    });
end;
populateEntries = function(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64) --[[ Line: 206 ]] --[[ Name: populateEntries ]]
    -- upvalues: v1 (copy), l_EntryFrameHeight_0 (copy), l_CellPadding_0 (copy), v54 (copy), l_LineColor_0 (copy)
    local v65 = {
        UIListLayout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v66 = {};
    for v67, v68 in pairs(v56) do
        if v68 then
            table.insert(v66, v67);
        end;
    end;
    local v69 = #v57;
    local v70 = 0;
    if v60 and v59 then
        local v71 = -1;
        local v72 = 0;
        local v73 = 0;
        for v74, v75 in ipairs(v57) do
            local v76 = false;
            if v55 then
                local v77 = tostring(v75.settingInfo.Name);
                v76 = string.find(v77:lower(), v55:lower()) ~= nil or string.find(v75.name:lower(), v55:lower()) ~= nil;
            end;
            if #v66 > 0 then
                local v78 = false;
                for _, v80 in pairs(v66) do
                    if table.find(v75.settingInfo.Tags, v80) ~= nil then
                        v78 = true;
                        break;
                    end;
                end;
                if not v55 then
                    v55 = true;
                    v76 = v78;
                else
                    v76 = v76 and v78;
                end;
            end;
            if not v55 or v76 then
                local v81 = v62 == v75.name;
                local v82 = v81 and l_EntryFrameHeight_0 * 2 + l_CellPadding_0 * 2 or l_EntryFrameHeight_0;
                if v70 + l_EntryFrameHeight_0 >= v59.Y then
                    if v72 < v60.Y then
                        local v83 = v58 and v69 - v74 or v74;
                        v65[v74] = v54(v75, v61, v82, v83 + 1, v81, v63, v64);
                    end;
                    if v71 < 0 then
                        v71 = v70;
                    else
                        v72 = v72 + l_EntryFrameHeight_0;
                    end;
                    v73 = v73 + 1;
                end;
                v70 = v70 + v82;
            end;
        end;
        if v73 == 0 then
            v65.NoneFound = v1.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1), 
                Text = "No DebugVisualizations Found", 
                TextColor3 = l_LineColor_0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        else
            v65.WindowingPadding = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v71), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            });
        end;
    end;
    return v65, v70;
end;
v34.init = function(v84, v85) --[[ Line: 312 ]] --[[ Name: init ]]
    -- upvalues: l_LinkingProtocol_0 (copy), v1 (copy)
    local v86 = v85.DebugVisualizationsData:getCurrentData();
    v84.getOnButtonPress = function(v87) --[[ Line: 315 ]]
        -- upvalues: v84 (copy)
        return function(_, _) --[[ Line: 316 ]]
            -- upvalues: v84 (ref), v87 (copy)
            local l_v84_0 = v84;
            local v91 = {};
            local v92 = false;
            if v84.state.expandedEntry ~= v87 then
                v92 = v87;
            end;
            v91.expandedEntry = v92;
            l_v84_0:setState(v91);
        end;
    end;
    v84.getLearnMorePress = function(v93) --[[ Line: 323 ]]
        -- upvalues: l_LinkingProtocol_0 (ref)
        return function(_, _) --[[ Line: 324 ]]
            -- upvalues: l_LinkingProtocol_0 (ref), v93 (copy)
            l_LinkingProtocol_0.default:openURL("https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings#" .. v93);
        end;
    end;
    v84.onSortChanged = function(v96) --[[ Line: 332 ]]
        -- upvalues: v85 (copy), v84 (copy)
        if v96 == v85.DebugVisualizationsData:getSortType() then
            v84:setState(function(v97) --[[ Line: 335 ]]
                return {
                    reverseSort = not v97.reverseSort
                };
            end);
            return;
        else
            v85.DebugVisualizationsData:setSortType(v96);
            v84:setState({
                reverseSort = false
            });
            return;
        end;
    end;
    v84.onCanvasPosChanged = function() --[[ Line: 349 ]]
        -- upvalues: v84 (copy)
        local l_CanvasPosition_0 = v84.scrollingRef.current.CanvasPosition;
        v84:setState({
            canvasPos = l_CanvasPosition_0
        });
    end;
    v84.scrollingRef = v1.createRef();
    v84.state = {
        visualizationEntries = v86, 
        reverseSort = false, 
        expandedEntry = nil
    };
end;
v34.didUpdate = function(v99) --[[ Line: 365 ]] --[[ Name: didUpdate ]]
    if v99.scrollingRef.current then
        local l_AbsoluteSize_0 = v99.scrollingRef.current.AbsoluteSize;
        if l_AbsoluteSize_0 ~= v99.state.absScrollSize then
            v99:setState({
                absScrollSize = l_AbsoluteSize_0
            });
        end;
    end;
end;
v34.didMount = function(v101) --[[ Line: 377 ]] --[[ Name: didMount ]]
    v101.visualizationsUpdated = v101.props.DebugVisualizationsData:Signal():Connect(function(v102) --[[ Line: 378 ]]
        -- upvalues: v101 (copy)
        v101:setState({
            visualizationEntries = v102
        });
    end);
    if v101.scrollingRef.current then
        v101.canvasPosConnector = v101.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v101.onCanvasPosChanged);
        v101:setState({
            absScrollSize = v101.scrollingRef.current.AbsoluteSize, 
            canvasPos = v101.scrollingRef.current.CanvasPosition
        });
    end;
end;
v34.willUnmount = function(v103) --[[ Line: 395 ]] --[[ Name: willUnmount ]]
    v103.visualizationsUpdated:Disconnect();
    v103.visualizationsUpdated = nil;
    v103.canvasPosConnector:Disconnect();
    v103.canvasPosConnector = nil;
end;
v34.render = function(v104) --[[ Line: 402 ]] --[[ Name: render ]]
    -- upvalues: l_MinFrameWidth_0 (copy), v1 (copy), v41 (copy), l_HeaderFrameHeight_0 (copy), v10 (copy)
    local l_absScrollSize_0 = v104.state.absScrollSize;
    local v106 = l_absScrollSize_0 and math.max(l_absScrollSize_0.X, l_MinFrameWidth_0) or l_MinFrameWidth_0;
    local v107, v108 = populateEntries(v104.props.searchTerm, v104.props.typeFilters, v104.state.visualizationEntries, v104.state.reverseSort, v104.state.canvasPos, l_absScrollSize_0, v106, v104.state.expandedEntry, v104.getOnButtonPress, v104.getLearnMorePress);
    local l_size_0 = v104.props.size;
    local l_layoutOrder_0 = v104.props.layoutOrder;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Header = v41(v104.onSortChanged, v106), 
        MainChart = v1.createElement("ScrollingFrame", {
            Position = UDim2.fromOffset(0, l_HeaderFrameHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_HeaderFrameHeight_0), 
            CanvasSize = UDim2.fromOffset(v106, v108), 
            ScrollBarThickness = 6, 
            BackgroundColor3 = v10.Color.BaseGray, 
            BackgroundTransparency = 1, 
            [v1.Ref] = v104.scrollingRef
        }, v107)
    });
end;
return v8(v34, "DebugVisualizationsData");