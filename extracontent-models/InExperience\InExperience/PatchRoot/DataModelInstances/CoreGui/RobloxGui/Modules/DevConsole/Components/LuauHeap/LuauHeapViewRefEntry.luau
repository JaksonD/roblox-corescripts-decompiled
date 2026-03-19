local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local _ = require(script.Parent.LuauHeapTypes);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v6.GeneralFormatting.LineWidth;
local l_LineColor_0 = v6.GeneralFormatting.LineColor;
local l_RefEntryFrameHeight_0 = v6.LuauHeapFormatting.RefEntryFrameHeight;
local _ = v6.LuauHeapFormatting.DepthIndent;
local l_ValueCellWidth_0 = v6.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v6.LuauHeapFormatting.ValuePadding;
local v14 = require(script.Parent.LuauHeapViewPathEntry);
local v15 = v1.PureComponent:extend("LuauHeapViewRefEntry");
local function v17(v16) --[[ Line: 33 ]] --[[ Name: BorderedCellLabel ]]
    -- upvalues: v1 (copy), v3 (copy), l_LineWidth_0 (copy), l_ValuePadding_0 (copy), l_LineColor_0 (copy)
    return v1.createFragment({
        Label = v1.createElement(v3, {
            text = v16.text, 
            size = v16.size, 
            pos = v16.pos, 
            richText = true
        }), 
        LeftBorder = v1.createElement("Frame", {
            Size = UDim2.new(UDim.new(0, l_LineWidth_0), v16.size.Y), 
            Position = UDim2.fromOffset(-l_ValuePadding_0, 0) + v16.pos, 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v15.init = function(v18) --[[ Line: 51 ]] --[[ Name: init ]]
    v18.state = {
        expanded = false
    };
    v18.onButtonPress = function() --[[ Line: 56 ]]
        -- upvalues: v18 (copy)
        v18:setState(function(v19) --[[ Line: 57 ]]
            return {
                expanded = not v19.expanded
            };
        end);
    end;
end;
v15.renderValues = function(_, v21) --[[ Line: 65 ]] --[[ Name: renderValues ]]
    -- upvalues: l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_RefEntryFrameHeight_0 (copy), v1 (copy), v17 (copy)
    local v22 = {};
    local v23 = UDim2.new(l_ValueCellWidth_0, -l_ValuePadding_0, 0, l_RefEntryFrameHeight_0);
    local v24 = UDim2.new(1 - l_ValueCellWidth_0 * #v21, l_ValuePadding_0, 0, 0);
    for v25, v26 in v21 do
        v22[tostring(v25)] = v1.createElement(v17, {
            text = tostring(v26), 
            size = v23, 
            pos = v24 + UDim2.fromScale(l_ValueCellWidth_0 * (v25 - 1), 0)
        });
    end;
    return v22;
end;
v15.renderChildren = function(v27, v28) --[[ Line: 80 ]] --[[ Name: renderChildren ]]
    -- upvalues: v1 (copy), v14 (copy)
    local v29 = {};
    if v27.state.expanded and v28 and #v28 then
        for v30, v31 in ipairs(v28) do
            v29[v30] = v1.createElement(v14, {
                layoutOrder = v30, 
                depth = 1, 
                name = ("Path #%*"):format(v30), 
                data = v31
            });
        end;
    end;
    return v29;
end;
v15.render = function(v32) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: l_RefEntryFrameHeight_0 (copy), l_ValueCellWidth_0 (copy), v1 (copy), v4 (copy), v3 (copy), l_CellPadding_0 (copy)
    local l_props_0 = v32.props;
    local v34 = l_props_0.size or UDim2.new(1, 0, 0, l_RefEntryFrameHeight_0);
    local v35 = l_props_0.layoutOrder or 0;
    local l_data_0 = l_props_0.data;
    local v37 = {
        ("%*"):format(l_data_0.Count), 
        (("%*"):format(l_data_0.Instances))
    };
    local v38 = UDim.new(1 - l_ValueCellWidth_0 * #v37, 0);
    return v1.createElement("Frame", {
        Size = v34, 
        BackgroundTransparency = 1, 
        LayoutOrder = v35, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v1.createElement(v4, {
            size = UDim2.new(1, 0, 0, l_RefEntryFrameHeight_0), 
            inset = 0, 
            isExpanded = v32.state.expanded, 
            isExpandable = l_data_0.Paths and #l_data_0.Paths ~= 0, 
            onButtonPress = v32.onButtonPress, 
            layoutOrder = -1
        }, {
            name = v1.createElement(v3, {
                text = l_data_0.Name, 
                size = UDim2.new(v38, UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            values = v1.createFragment(v32:renderValues(v37))
        }), 
        children = v1.createFragment(v32:renderChildren(l_data_0.Paths))
    });
end;
return v15;