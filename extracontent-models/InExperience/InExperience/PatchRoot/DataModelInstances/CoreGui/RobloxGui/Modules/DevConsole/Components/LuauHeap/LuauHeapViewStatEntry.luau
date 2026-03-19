local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local _ = require(script.Parent.LuauHeapTypes);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_StatEntryFrameHeight_0 = v6.LuauHeapFormatting.StatEntryFrameHeight;
local _ = v6.LuauHeapFormatting.DepthIndent;
local l_ValueCellWidth_0 = v6.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v6.LuauHeapFormatting.ValuePadding;
local v14 = v1.PureComponent:extend("LuauHeapViewStatEntry");
local function v16(v15) --[[ Line: 31 ]] --[[ Name: BorderedCellLabel ]]
    -- upvalues: v1 (copy), v3 (copy), l_LineWidth_0 (copy), l_ValuePadding_0 (copy), l_LineColor_0 (copy)
    return v1.createFragment({
        Label = v1.createElement(v3, {
            text = v15.text, 
            size = v15.size, 
            pos = v15.pos, 
            richText = true
        }), 
        LeftBorder = v1.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v15.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v15.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v14.renderValues = function(_, v18) --[[ Line: 49 ]] --[[ Name: renderValues ]]
    -- upvalues: l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_StatEntryFrameHeight_0 (copy), v1 (copy), v16 (copy)
    local v19 = {};
    local v20 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_StatEntryFrameHeight_0);
    local v21 = UDim2.new(1 - l_ValueCellWidth_0 * #v18, l_ValuePadding_0, 0, 0);
    for v22, v23 in v18 do
        v19[tostring(v22)] = v1.createElement(v16, {
            text = tostring(v23), 
            size = v20, 
            pos = v21 + UDim2.fromScale(l_ValueCellWidth_0 * (v22 - 1), 0)
        });
    end;
    return v19;
end;
v14.render = function(v24) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: l_StatEntryFrameHeight_0 (copy), l_ValueCellWidth_0 (copy), v1 (copy), v4 (copy), v3 (copy), l_CellPadding_0 (copy)
    local l_props_0 = v24.props;
    local v26 = l_props_0.size or UDim2.new(1, 0, 0, l_StatEntryFrameHeight_0);
    local v27 = l_props_0.layoutOrder or 0;
    local l_data_0 = l_props_0.data;
    local l_compare_0 = l_props_0.compare;
    local v30 = string.format("%.0f", l_data_0.Size);
    local v31 = string.format("%.0f", l_data_0.Count);
    if l_compare_0 then
        if l_compare_0.Size ~= l_data_0.Size then
            v30 = string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.Size, l_compare_0.Size > l_data_0.Size and "0f0" or "f00", l_compare_0.Size > l_data_0.Size and "" or "+", l_data_0.Size - l_compare_0.Size);
        end;
        if l_compare_0.Count ~= l_data_0.Count then
            v31 = string.format("%d <font color=\"#%s\">(%s%d)</font>", l_data_0.Count, l_compare_0.Count > l_data_0.Count and "0f0" or "f00", l_compare_0.Count > l_data_0.Count and "" or "+", l_data_0.Count - l_compare_0.Count);
        end;
    end;
    local v32 = {
        v30, 
        v31
    };
    local v33 = UDim.new(1 - l_ValueCellWidth_0 * #v32, 0);
    return v1.createElement("Frame", {
        Size = v26, 
        BackgroundTransparency = 1, 
        LayoutOrder = v27, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v1.createElement(v4, {
            size = UDim2.new(1, 0, 0, l_StatEntryFrameHeight_0), 
            inset = 0, 
            isExpanded = false, 
            isExpandable = false, 
            layoutOrder = -1
        }, {
            name = v1.createElement(v3, {
                text = l_data_0.Name, 
                size = UDim2.new(v33, UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            values = v1.createFragment(v24:renderValues(v32))
        })
    });
end;
return v14;