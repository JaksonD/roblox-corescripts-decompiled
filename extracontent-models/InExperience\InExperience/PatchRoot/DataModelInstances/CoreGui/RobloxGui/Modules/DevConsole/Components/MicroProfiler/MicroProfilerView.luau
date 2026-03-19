local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Parent.Immutable);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(script.Parent.LocalActionsView);
local v4 = require(script.Parent.RecentlyCapturedDumpsView);
local v5 = require(script.Parent.RecordAndDumpView);
local v6 = v2.Component:extend("Column");
local v7 = v2.Component:extend("MicroProfilerView");
v6.render = function(v8) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v9 = v8.props[v2.Children];
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.props.LayoutOrder
    }, v1.JoinDictionaries({
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 12), 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    }, v9));
end;
v7.render = function(v10) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), v3 (copy), v5 (copy), v4 (copy)
    return v2.createElement("Frame", {
        Size = v10.props.Size, 
        BackgroundTransparency = v10.props.BackgroundTransparency, 
        LayoutOrder = v10.props.LayoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 8), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            HorizontalFlex = Enum.UIFlexAlignment.Fill, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            VerticalFlex = Enum.UIFlexAlignment.Fill
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        LeftColumn = v2.createElement(v6, {
            LayoutOrder = 1
        }, {
            LocalActionsView = v2.createElement(v3, {
                LayoutOrder = 1
            }), 
            RecordAndDumpView = v2.createElement(v5, {
                LayoutOrder = 2
            })
        }), 
        RightColumn = v2.createElement(v6, {
            LayoutOrder = 2
        }, {
            RecentlyCapturedDumpsView = v2.createElement(v4)
        })
    });
end;
return v7;