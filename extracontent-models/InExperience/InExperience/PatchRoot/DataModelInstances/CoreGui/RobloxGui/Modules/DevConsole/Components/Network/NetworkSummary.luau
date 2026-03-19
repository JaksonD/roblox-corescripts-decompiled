local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Parent.Constants);
local l_SummaryHeaderNames_0 = v2.NetworkFormatting.SummaryHeaderNames;
local l_SummaryCellWidths_0 = v2.NetworkFormatting.SummaryCellWidths;
local l_HeaderFrameHeight_0 = v2.NetworkFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v2.NetworkFormatting.EntryFrameHeight;
local l_LineWidth_0 = v2.GeneralFormatting.LineWidth;
local l_LineColor_0 = v2.GeneralFormatting.LineColor;
local l_CellPadding_0 = v2.NetworkFormatting.CellPadding;
local l_Text_0 = v2.Color.Text;
local v11 = require(script.Parent.Parent.Parent.Components.CellLabel);
local v12 = require(script.Parent.Parent.Parent.Components.HeaderButton);
local v13 = 0;
for _, v15 in pairs(l_SummaryCellWidths_0) do
    v13 = v13 + v15;
end;
local v16 = -v13;
local v17 = {};
local v18 = {};
local v19 = {};
table.insert(v17, UDim2.new(0, l_CellPadding_0, 0, 0));
table.insert(v18, UDim2.new(1, -v13 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
table.insert(v19, UDim2.new(1, -v13 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
for _, v21 in ipairs(l_SummaryCellWidths_0) do
    table.insert(v17, UDim2.new(1, v16 + l_CellPadding_0, 0, 0));
    table.insert(v18, UDim2.new(0, v21 - l_CellPadding_0, 0, l_HeaderFrameHeight_0));
    table.insert(v19, UDim2.new(0, v21 - l_CellPadding_0, 0, l_EntryFrameHeight_0));
    v16 = v16 + v21;
end;
local v22 = {};
for v23, v24 in ipairs(v17) do
    v22[v23] = UDim2.new(v24.X.Scale, v24.X.Offset - l_CellPadding_0, v24.Y.Scale, v24.Y.Offset);
end;
local v25 = v1.Component:extend("NetworkSummary");
v25.render = function(v26) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_LineWidth_0 (copy), l_LineColor_0 (copy), v22 (copy), l_HeaderFrameHeight_0 (copy), l_SummaryHeaderNames_0 (copy), v12 (copy), v18 (copy), v17 (copy), v11 (copy), l_EntryFrameHeight_0 (copy), l_Text_0 (copy)
    local l_width_0 = v26.props.width;
    local v28 = v26.props.httpSummaryTable or {};
    local l_layoutOrder_0 = v26.props.layoutOrder;
    local v30 = {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v31 = {
        UpperHorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        LowerHorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    };
    for v32 = 2, #v22 do
        v31[string.format("VerticalLine_%d", v32)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 0, l_HeaderFrameHeight_0), 
            Position = v22[v32], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    for v33, v34 in ipairs(l_SummaryHeaderNames_0) do
        v31[v34] = v1.createElement(v12, {
            text = v34, 
            size = v18[v33], 
            pos = v17[v33]
        });
    end;
    v30.Header = v1.createElement("Frame", {
        Size = UDim2.new(0, l_width_0, 0, l_HeaderFrameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }, v31);
    local v35 = 0;
    for _, v37 in pairs(v28) do
        v35 = v35 + 1;
        local v38 = {
            RequestType = v1.createElement(v11, {
                text = v37.RequestType, 
                size = v18[1], 
                pos = v17[1]
            }), 
            RequestCount = v1.createElement(v11, {
                text = v37.RequestCount, 
                size = v18[2], 
                pos = v17[2]
            }), 
            FailedCount = v1.createElement(v11, {
                text = v37.FailedCount, 
                size = v18[3], 
                pos = v17[3]
            }), 
            AverageTime = v1.createElement(v11, {
                text = string.format("%.3f", v37.AverageTime), 
                size = v18[4], 
                pos = v17[4]
            }), 
            MinTime = v1.createElement(v11, {
                text = string.format("%.3f", v37.MinTime), 
                size = v18[5], 
                pos = v17[5]
            }), 
            MaxTime = v1.createElement(v11, {
                text = string.format("%.3f", v37.MaxTime), 
                size = v18[6], 
                pos = v17[6]
            }), 
            LowerHorizontalLine = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            })
        };
        for v39 = 2, #v22 do
            v38[string.format("VerticalLine_%d", v39)] = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                Position = v22[v39], 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
        end;
        v30[v37.RequestType] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_width_0, 0, l_EntryFrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v35 + 1
        }, v38);
    end;
    if v35 == 0 then
        v30.Padding = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_width_0, 0, l_EntryFrameHeight_0), 
            Text = "No Summary Data Found", 
            TextColor3 = l_Text_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        });
        v35 = 1;
    end;
    local v40 = v35 * l_EntryFrameHeight_0 + l_HeaderFrameHeight_0;
    return v1.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 0, v40), 
        ScrollingEnabled = false, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, v30);
end;
return v25;