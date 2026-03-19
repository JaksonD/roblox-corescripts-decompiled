local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.ProfilerUtil);
local _ = v2.getDurations;
local _ = v2.getSourceName;
local _ = v2.getLine;
local l_getNativeFlag_0 = v2.getNativeFlag;
local l_getPluginFlag_0 = v2.getPluginFlag;
local _ = v2.standardizeChildren;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v10 = require(l_Components_0.CellLabel);
local v11 = require(l_Components_0.BannerButton);
local v12 = require(l_Components_0.Tooltip);
local v13 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v13.GeneralFormatting.LineWidth;
local l_LineColor_0 = v13.GeneralFormatting.LineColor;
local l_EntryFrameHeight_0 = v13.GeneralFormatting.EntryFrameHeight;
local _ = v13.ScriptProfilerFormatting.DepthIndent;
local l_ValueCellWidth_0 = v13.ScriptProfilerFormatting.ValueCellWidth;
local l_CellPadding_0 = v13.ScriptProfilerFormatting.CellPadding;
local l_ValuePadding_0 = v13.ScriptProfilerFormatting.ValuePadding;
local v21 = v1.PureComponent:extend("ProfilerFunctionViewEntry");
local function v23(v22) --[[ Line: 42 ]] --[[ Name: BorderedCellLabel ]]
    -- upvalues: v1 (copy), v10 (copy), l_LineWidth_0 (copy), l_ValuePadding_0 (copy), l_LineColor_0 (copy)
    return v1.createFragment({
        Label = v1.createElement(v10, {
            text = v22.text, 
            size = v22.size, 
            pos = v22.pos
        }), 
        LeftBorder = v1.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v22.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v22.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v21.init = function(v24) --[[ Line: 59 ]] --[[ Name: init ]]
    v24.state = {
        expanded = v24.props.depth == 0, 
        showTooltip = false, 
        tooltipPos = UDim2.fromOffset(0, 0)
    };
    v24.onButtonPress = function() --[[ Line: 66 ]]
        -- upvalues: v24 (copy)
        v24:setState(function(_) --[[ Line: 67 ]]
            -- upvalues: v24 (ref)
            return {
                expanded = not v24.state.expanded
            };
        end);
    end;
    v24.onMouseEnter = function(_, v27, v28) --[[ Line: 74 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v27, v28)
        });
    end;
    v24.onMouseMove = function(_, v30, v31) --[[ Line: 81 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            showTooltip = true, 
            tooltipPos = UDim2.fromOffset(v30, v31)
        });
    end;
    v24.onMouseLeave = function() --[[ Line: 88 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            showTooltip = false
        });
    end;
end;
v21.renderValues = function(_, v33) --[[ Line: 95 ]] --[[ Name: renderValues ]]
    -- upvalues: l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_EntryFrameHeight_0 (copy), v1 (copy), v23 (copy)
    local v34 = {};
    local v35 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_EntryFrameHeight_0);
    local v36 = UDim2.new(1 - l_ValueCellWidth_0 * #v33, l_ValuePadding_0, 0, 0);
    for v37, v38 in ipairs(v33) do
        v34[tostring(v37)] = v1.createElement(v23, {
            text = tostring(v38), 
            size = v35, 
            pos = v36 + UDim2.fromScale(l_ValueCellWidth_0 * (v37 - 1), 0)
        });
    end;
    return v34;
end;
v21.render = function(v39) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: l_EntryFrameHeight_0 (copy), l_getNativeFlag_0 (copy), l_getPluginFlag_0 (copy), v2 (copy), l_ValueCellWidth_0 (copy), v1 (copy), v12 (copy), v11 (copy), v10 (copy), l_CellPadding_0 (copy)
    local l_props_0 = v39.props;
    local v41 = l_props_0.size or UDim2.new(1, 0, 0, l_EntryFrameHeight_0);
    local v42 = l_props_0.layoutOrder or 0;
    local l_percentageRatio_0 = l_props_0.percentageRatio;
    local l_data_0 = l_props_0.data;
    local l_functionId_0 = l_props_0.functionId;
    local v46 = l_data_0.Functions[l_functionId_0];
    local v47 = v46.TotalDuration / v39.props.average - (v39.props.gcOffset or 0);
    local v48 = l_getNativeFlag_0(l_data_0, v46);
    local v49 = l_getPluginFlag_0(l_data_0, v46);
    local _ = nil;
    local v51 = {
        if l_percentageRatio_0 then l_percentageRatio_0 == 0 and "N/A" or string.format("%.3f%%", v47 / l_percentageRatio_0) else string.format("%.3f", v47 * 1000)
    };
    local l_nodeName_0 = l_props_0.nodeName;
    if not l_nodeName_0 or #l_nodeName_0 == 0 then
        l_nodeName_0 = "<anonymous>";
    end;
    local v53 = v2.getSourceLocationString(l_data_0, v46, l_nodeName_0);
    if l_nodeName_0 == "<anonymous>" then
        l_nodeName_0 = v53;
        v53 = "";
    end;
    if v49 then
        l_nodeName_0 = l_nodeName_0 .. " <plugin>";
    end;
    if v48 then
        l_nodeName_0 = l_nodeName_0 .. " <native>";
    end;
    local v54 = UDim.new(1 - l_ValueCellWidth_0 * #v51, -0);
    return v1.createElement("Frame", {
        Size = v41, 
        BackgroundTransparency = 1, 
        LayoutOrder = v42, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        tooltip = if v39.state.showTooltip then v1.createElement(v12, {
            text = v53, 
            pos = v39.state.tooltipPos
        }) else nil, 
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v1.createElement(v11, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            inset = 0, 
            isExpanded = v39.state.expanded, 
            isExpandable = false, 
            onButtonPress = v39.onButtonPress, 
            onMouseEnter = v39.onMouseEnter, 
            onMouseLeave = v39.onMouseLeave, 
            onMouseMove = v39.onMouseMove, 
            layoutOrder = -1
        }, {
            name = v1.createElement(v10, {
                text = l_nodeName_0, 
                size = UDim2.new(v54, UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0 + 0, 0, 0)
            }), 
            values = v1.createFragment(v39:renderValues(v51))
        })
    });
end;
return v21;