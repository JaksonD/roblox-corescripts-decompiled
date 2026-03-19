local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(script.Parent.ProfilerDataFormatV2);
local v4 = require(script.Parent.ProfilerUtil);
local l_getDurations_0 = v4.getDurations;
local l_getNativeFlag_0 = v4.getNativeFlag;
local l_getPluginFlag_0 = v4.getPluginFlag;
local l_standardizeChildren_0 = v4.standardizeChildren;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v10 = require(l_Components_0.CellLabel);
local v11 = require(l_Components_0.BannerButton);
local v12 = require(l_Components_0.Tooltip);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v14 = require(l_Actions_0.SetScriptProfilerRoot);
local v15 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v15.GeneralFormatting.LineWidth;
local l_LineColor_0 = v15.GeneralFormatting.LineColor;
local l_EntryFrameHeight_0 = v15.GeneralFormatting.EntryFrameHeight;
local l_DepthIndent_0 = v15.ScriptProfilerFormatting.DepthIndent;
local l_ValueCellWidth_0 = v15.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v15.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v15.ScriptProfilerFormatting.ValuePadding;
local v23 = v1.PureComponent:extend("ProfilerViewEntry");
local v28 = v2.UNSTABLE_connect2(nil, function(v24) --[[ Line: 39 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy)
    return {
        dispatchSetScriptProfilerRoot = function(v25, v26, v27) --[[ Line: 41 ]] --[[ Name: dispatchSetScriptProfilerRoot ]]
            -- upvalues: v24 (copy), v14 (ref)
            v24(v14(v25, v26, v27));
        end
    };
end)(v23);
local function v30(v29) --[[ Line: 59 ]] --[[ Name: BorderedCellLabel ]]
    -- upvalues: v1 (copy), v10 (copy), l_LineWidth_0 (copy), l_ValuePadding_0 (copy), l_LineColor_0 (copy)
    return v1.createFragment({
        Label = v1.createElement(v10, {
            text = v29.text, 
            size = v29.size, 
            pos = v29.pos
        }), 
        LeftBorder = v1.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v29.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v29.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
local _ = function(v31) --[[ Line: 76 ]] --[[ Name: getNodeName ]]
    local l_depth_0 = v31.depth;
    local l_data_0 = v31.data;
    local l_functionId_0 = v31.functionId;
    local _ = l_data_0.Functions[l_functionId_0];
    local v36 = l_depth_0 == 0 and l_functionId_0 == 0 and "<root>" or "<anonymous>";
    local l_nodeName_0 = v31.nodeName;
    if not l_nodeName_0 or #l_nodeName_0 == 0 then
        return v36;
    else
        return l_nodeName_0;
    end;
end;
v23.init = function(v39) --[[ Line: 90 ]] --[[ Name: init ]]
    local v40 = {};
    local v41 = true;
    if v39.props.depth ~= 0 then
        v41 = v39.props.expandedNodes[v39.props.nodeId];
    end;
    v40.expanded = v41;
    v40.showTooltip = false;
    v40.tooltipPos = UDim2.fromOffset(0, 0);
    v39.state = v40;
    v39.onButtonPress = function() --[[ Line: 97 ]]
        -- upvalues: v39 (copy)
        v39.props.expandedNodes[v39.props.nodeId] = not v39.state.expanded;
        v39:setState(function(_) --[[ Line: 100 ]]
            -- upvalues: v39 (ref)
            return {
                expanded = not v39.state.expanded
            };
        end);
    end;
    v39.onMouseEnter = function(_, v44, v45) --[[ Line: 107 ]]
        -- upvalues: v39 (copy)
        v39:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v44, v45)
        });
    end;
    v39.onMouseMove = function(_, v47, v48) --[[ Line: 114 ]]
        -- upvalues: v39 (copy)
        v39:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v47, v48)
        });
    end;
    v39.onMouseLeave = function() --[[ Line: 121 ]]
        -- upvalues: v39 (copy)
        v39:setState({
            showTooltip = false
        });
    end;
    v39.onMouse2Click = function() --[[ Line: 127 ]]
        -- upvalues: v39 (copy)
        local l_dispatchSetScriptProfilerRoot_0 = v39.props.dispatchSetScriptProfilerRoot;
        local l_nodeId_0 = v39.props.nodeId;
        local l_functionId_1 = v39.props.functionId;
        local l_props_0 = v39.props;
        local l_depth_1 = l_props_0.depth;
        local l_data_1 = l_props_0.data;
        local l_functionId_2 = l_props_0.functionId;
        local _ = l_data_1.Functions[l_functionId_2];
        local v57 = l_depth_1 == 0 and l_functionId_2 == 0 and "<root>" or "<anonymous>";
        local l_nodeName_1 = l_props_0.nodeName;
        if not l_nodeName_1 or #l_nodeName_1 == 0 then
            l_nodeName_1 = v57;
        end;
        l_dispatchSetScriptProfilerRoot_0(l_nodeId_0, l_functionId_1, l_nodeName_1);
    end;
end;
v23.renderChildren = function(v59, v60) --[[ Line: 132 ]] --[[ Name: renderChildren ]]
    -- upvalues: l_getDurations_0 (copy), l_getPluginFlag_0 (copy), v1 (copy), v28 (copy)
    local v61 = {};
    if v59.state.expanded then
        local l_percentageRatio_0 = v59.props.percentageRatio;
        local v63 = l_getDurations_0(v59.props.data, v59.props.nodeId);
        local v64 = v59.props.depth + 1;
        local l_average_0 = v59.props.average;
        local l_searchTerm_0 = v59.props.searchTerm;
        local l_searchFilter_0 = v59.props.searchFilter;
        local l_showPlugins_0 = v59.props.showPlugins;
        local l_showGC_0 = v59.props.showGC;
        local l_gcNodeOffsets_0 = v59.props.gcNodeOffsets;
        local l_expandedNodes_0 = v59.props.expandedNodes;
        local l_data_2 = v59.props.data;
        local l_GCFuncId_0 = l_data_2.GCFuncId;
        if v60 then
            for v74, v75 in pairs(v60) do
                if (#l_searchFilter_0 <= 0 or l_searchFilter_0[v75]) and (l_showGC_0 or v74 ~= l_GCFuncId_0) then
                    local _ = l_data_2.Nodes[v75];
                    local v77 = l_data_2.Functions[v74];
                    if l_showPlugins_0 or not l_getPluginFlag_0(l_data_2, v77) then
                        local v78 = l_getDurations_0(l_data_2, v75);
                        v61[v74] = v1.createElement(v28, {
                            layoutOrder = (v63 - v78) * 1000000, 
                            depth = v64, 
                            data = l_data_2, 
                            nodeId = v75, 
                            functionId = v74, 
                            nodeName = v77.Name, 
                            average = l_average_0, 
                            percentageRatio = l_percentageRatio_0, 
                            searchTerm = l_searchTerm_0, 
                            searchFilter = l_searchFilter_0, 
                            showPlugins = l_showPlugins_0, 
                            showGC = l_showGC_0, 
                            gcNodeOffsets = l_gcNodeOffsets_0, 
                            expandedNodes = l_expandedNodes_0
                        });
                    end;
                end;
            end;
            return v61;
        elseif v59.props.nodeId == 0 then
            assert(v60 == nil);
            for v79, v80 in l_data_2.Categories do
                if #l_searchFilter_0 <= 0 or l_searchFilter_0[v80.NodeId] then
                    local _ = l_data_2.Nodes[v80.NodeId];
                    local v82 = l_getDurations_0(l_data_2, v80.NodeId);
                    local v83 = v59.props.pluginOffsets[v79];
                    local v84 = v59.props.pluginGCOffsets[v79];
                    if not l_showPlugins_0 then
                        v82 = v82 - v83;
                        if l_showGC_0 then
                            v82 = v82 - v84;
                        end;
                    end;
                    v61[v79] = v1.createElement(v28, {
                        layoutOrder = (v63 - v82) * 1000000, 
                        depth = v64, 
                        data = l_data_2, 
                        nodeId = v80.NodeId, 
                        functionId = nil, 
                        nodeName = v80.Name, 
                        average = l_average_0, 
                        percentageRatio = l_percentageRatio_0, 
                        searchTerm = l_searchTerm_0, 
                        searchFilter = l_searchFilter_0, 
                        showPlugins = l_showPlugins_0, 
                        pluginOffset = v83, 
                        pluginGCOffset = v84, 
                        showGC = l_showGC_0, 
                        gcNodeOffsets = l_gcNodeOffsets_0, 
                        expandedNodes = l_expandedNodes_0
                    });
                end;
            end;
        end;
    end;
    return v61;
end;
v23.renderValues = function(_, v86) --[[ Line: 231 ]] --[[ Name: renderValues ]]
    -- upvalues: l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_EntryFrameHeight_0 (copy), v1 (copy), v30 (copy)
    local v87 = {};
    local v88 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_EntryFrameHeight_0);
    local v89 = UDim2.new(1 - l_ValueCellWidth_0 * #v86, l_ValuePadding_0, 0, 0);
    for v90, v91 in ipairs(v86) do
        v87[tostring(v90)] = v1.createElement(v30, {
            text = tostring(v91), 
            size = v88, 
            pos = v89 + UDim2.fromScale(l_ValueCellWidth_0 * (v90 - 1), 0)
        });
    end;
    return v87;
end;
v23.render = function(v92) --[[ Line: 246 ]] --[[ Name: render ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), l_DepthIndent_0 (copy), l_getDurations_0 (copy), l_standardizeChildren_0 (copy), v4 (copy), l_getNativeFlag_0 (copy), l_getPluginFlag_0 (copy), l_ValueCellWidth_0 (copy), v1 (copy), v12 (copy), v11 (copy), v10 (copy), l_CellPadding_0 (copy)
    local l_props_1 = v92.props;
    local v94 = l_props_1.size or UDim2.new(1, 0, 0, l_EntryFrameHeight_0);
    local l_depth_2 = l_props_1.depth;
    local v96 = l_props_1.layoutOrder or 0;
    local v97 = l_depth_2 * l_DepthIndent_0;
    local l_percentageRatio_1 = l_props_1.percentageRatio;
    local l_data_3 = l_props_1.data;
    local l_showPlugins_1 = l_props_1.showPlugins;
    local l_showGC_1 = l_props_1.showGC;
    local l_nodeId_1 = l_props_1.nodeId;
    local l_functionId_3 = l_props_1.functionId;
    local v104 = l_data_3.Functions[l_functionId_3];
    local v105 = l_data_3.Nodes[l_nodeId_1];
    local v106, v107 = l_getDurations_0(l_data_3, l_nodeId_1);
    v106 = v106 / v92.props.average;
    v107 = v107 / v92.props.average;
    local v108 = l_standardizeChildren_0(l_data_3, v105);
    if not l_showPlugins_1 then
        if l_nodeId_1 == 0 then
            v106 = v106 - (v92.props.pluginOffsets.Total or 0);
            if l_showGC_1 then
                v106 = v106 - (v92.props.pluginGCOffsets.Total or 0);
            end;
        else
            v106 = v106 - (v92.props.pluginOffset or 0);
            if l_showGC_1 then
                v106 = v106 - (v92.props.pluginGCOffset or 0);
            end;
        end;
    end;
    if not l_showGC_1 then
        local l_gcNodeOffsets_1 = l_props_1.gcNodeOffsets;
        v106 = if l_nodeId_1 == 0 then v106 - (l_gcNodeOffsets_1.Total or 0) else v106 - (l_gcNodeOffsets_1[l_nodeId_1] or 0);
    end;
    local v110 = nil;
    local v111 = nil;
    if l_percentageRatio_1 then
        if l_percentageRatio_1 == 0 then
            v110 = "N/A";
            v111 = "N/A";
        else
            v110 = string.format("%.3f%%", v106 / l_percentageRatio_1);
            v111 = string.format("%.3f%%", v107 / l_percentageRatio_1);
        end;
    else
        v110 = string.format("%.3f", v106 * 1000);
        v111 = string.format("%.3f", v107 * 1000);
    end;
    local v112 = {
        v110, 
        v111
    };
    local l_depth_3 = l_props_1.depth;
    local l_data_4 = l_props_1.data;
    local l_functionId_4 = l_props_1.functionId;
    local v116 = l_data_4.Functions[l_functionId_4];
    local v117 = l_depth_3 == 0 and l_functionId_4 == 0 and "<root>" or "<anonymous>";
    local l_nodeName_2 = l_props_1.nodeName;
    if not l_nodeName_2 or #l_nodeName_2 == 0 then
        l_nodeName_2 = v117;
    end;
    local l_l_nodeName_2_0 = l_nodeName_2;
    l_depth_3 = v4.getSourceLocationString(l_data_3, v104, l_l_nodeName_2_0);
    l_data_4 = l_getNativeFlag_0(l_data_3, v104);
    if l_getPluginFlag_0(l_data_3, v104) then
        l_l_nodeName_2_0 = l_l_nodeName_2_0 .. " <plugin>";
    end;
    if l_data_4 then
        l_l_nodeName_2_0 = l_l_nodeName_2_0 .. " <native>";
    end;
    v116 = UDim.new(1 - l_ValueCellWidth_0 * #v112, -v97);
    return v1.createElement("Frame", {
        Size = v94, 
        BackgroundTransparency = 1, 
        LayoutOrder = v96, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        tooltip = if v92.state.showTooltip then v1.createElement(v12, {
            text = l_depth_3, 
            pos = v92.state.tooltipPos
        }) else nil, 
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v1.createElement(v11, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            inset = v97, 
            isExpanded = v92.state.expanded, 
            isExpandable = v108 and next(v108) ~= nil or l_depth_2 == 0, 
            onButtonPress = v92.onButtonPress, 
            onMouseEnter = v92.onMouseEnter, 
            onMouseLeave = v92.onMouseLeave, 
            onMouseMove = v92.onMouseMove, 
            onMouse2Click = v92.onMouse2Click, 
            layoutOrder = -1
        }, {
            name = v1.createElement(v10, {
                text = l_l_nodeName_2_0, 
                size = UDim2.new(v116, UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0 + v97, 0, 0)
            }), 
            values = v1.createFragment(v92:renderValues(v112))
        }), 
        children = v1.createFragment(v92:renderChildren(v108))
    });
end;
return v28;