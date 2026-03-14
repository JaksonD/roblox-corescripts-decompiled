local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v3 = require(l_Components_0.CellLabel);
local v4 = require(l_Components_0.BannerButton);
local _ = require(script.Parent.LuauHeapTypes);
local v6 = require(script.Parent.Parent.Parent.Constants);
local _ = v6.GeneralFormatting.LineWidth;
local _ = v6.GeneralFormatting.LineColor;
local l_PathEntryFrameHeight_0 = v6.LuauHeapFormatting.PathEntryFrameHeight;
local l_DepthIndent_0 = v6.LuauHeapFormatting.DepthIndent;
local _ = v6.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v6.LuauHeapFormatting.CellPadding;
local _ = v6.LuauHeapFormatting.ValuePadding;
local v14 = v1.PureComponent:extend("LuauHeapViewPathEntry");
v14.init = function(v15) --[[ Line: 25 ]] --[[ Name: init ]]
    v15.state = {
        expanded = false
    };
    v15.onButtonPress = function() --[[ Line: 30 ]]
        -- upvalues: v15 (copy)
        v15:setState(function(v16) --[[ Line: 31 ]]
            return {
                expanded = not v16.expanded
            };
        end);
    end;
end;
v14.renderChildren = function(v17, v18) --[[ Line: 39 ]] --[[ Name: renderChildren ]]
    -- upvalues: l_DepthIndent_0 (copy), l_CellPadding_0 (copy), v1 (copy), v3 (copy), l_PathEntryFrameHeight_0 (copy)
    local v19 = {};
    local v20 = 2 * l_DepthIndent_0 + l_CellPadding_0;
    if v17.state.expanded and v18 and #v18 then
        for v21, v22 in ipairs(v18) do
            v19[v21] = v1.createElement(v3, {
                text = v22, 
                layoutOrder = v21, 
                size = UDim2.new(UDim.new(1, -v20), UDim.new(0, l_PathEntryFrameHeight_0)), 
                pos = UDim2.new(0, v20, 0, 0)
            });
        end;
    end;
    return v19;
end;
v14.render = function(v23) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_PathEntryFrameHeight_0 (copy), l_DepthIndent_0 (copy), v1 (copy), v4 (copy), v3 (copy), l_CellPadding_0 (copy)
    local l_props_0 = v23.props;
    local v25 = l_props_0.size or UDim2.new(1, 0, 0, l_PathEntryFrameHeight_0);
    local v26 = l_props_0.layoutOrder or 0;
    local l_name_0 = l_props_0.name;
    local l_data_0 = l_props_0.data;
    local v29 = l_props_0.depth * l_DepthIndent_0;
    return v1.createElement("Frame", {
        Size = v25, 
        BackgroundTransparency = 1, 
        LayoutOrder = v26, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        button = v1.createElement(v4, {
            size = UDim2.new(1, 0, 0, l_PathEntryFrameHeight_0), 
            inset = v29, 
            isExpanded = v23.state.expanded, 
            isExpandable = #l_data_0 ~= 0, 
            onButtonPress = v23.onButtonPress, 
            layoutOrder = -1
        }, {
            name = v1.createElement(v3, {
                text = l_name_0, 
                size = UDim2.new(UDim.new(1, -v29), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0 + v29, 0, 0)
            })
        }), 
        children = v1.createFragment(v23:renderChildren(l_data_0))
    });
end;
return v14;