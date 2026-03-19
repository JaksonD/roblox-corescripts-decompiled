local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Parent.Constants);
local l_EntryFrameHeight_0 = v2.NetworkFormatting.EntryFrameHeight;
local l_LineWidth_0 = v2.GeneralFormatting.LineWidth;
local l_LineColor_0 = v2.GeneralFormatting.LineColor;
local l_ResponseStrHeight_0 = v2.NetworkFormatting.ResponseStrHeight;
local l_ResponseWidthRatio_0 = v2.NetworkFormatting.ResponseWidthRatio;
local v8 = (1 - l_ResponseWidthRatio_0) / 2;
local v9 = (1 - l_ResponseWidthRatio_0) / 4;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v11 = require(l_Components_0.CellLabel);
local v12 = require(l_Components_0.HeaderButton);
local v13 = require(l_Components_0.BannerButton);
return function(v14) --[[ Line: 21 ]]
    -- upvalues: v1 (copy), v11 (copy), l_LineColor_0 (copy), l_LineWidth_0 (copy), l_EntryFrameHeight_0 (copy), v13 (copy), v8 (copy), v12 (copy), l_ResponseStrHeight_0 (copy), v9 (copy)
    local l_size_0 = v14.size;
    local l_entry_0 = v14.entry;
    local l_entryCellSize_0 = v14.entryCellSize;
    local l_cellOffset_0 = v14.cellOffset;
    local l_verticalOffsets_0 = v14.verticalOffsets;
    local l_layoutOrder_0 = v14.layoutOrder;
    local l_showResponse_0 = v14.showResponse;
    local l_responseBodyHeight_0 = v14.responseBodyHeight;
    local l_onButtonPress_0 = v14.onButtonPress;
    local v24 = {
        Num = v1.createElement(v11, {
            text = l_entry_0.Num, 
            size = l_entryCellSize_0[1], 
            pos = l_cellOffset_0[1]
        }), 
        Method = v1.createElement(v11, {
            text = l_entry_0.Method, 
            size = l_entryCellSize_0[2], 
            pos = l_cellOffset_0[2]
        }), 
        Status = v1.createElement(v11, {
            text = l_entry_0.Status, 
            size = l_entryCellSize_0[3], 
            pos = l_cellOffset_0[3]
        }), 
        Time = v1.createElement(v11, {
            text = string.format("%.3f", l_entry_0.Time), 
            size = l_entryCellSize_0[4], 
            pos = l_cellOffset_0[4]
        }), 
        RequestType = v1.createElement(v11, {
            text = l_entry_0.RequestType, 
            size = l_entryCellSize_0[5], 
            pos = l_cellOffset_0[5]
        }), 
        Url = v1.createElement(v11, {
            text = l_entry_0.Url, 
            size = l_entryCellSize_0[6], 
            pos = l_cellOffset_0[6]
        }), 
        LowerHorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    };
    for v25 = 2, #l_verticalOffsets_0 do
        v24[string.format("VerticalLine_%d", v25)] = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 0, l_EntryFrameHeight_0), 
            Position = l_verticalOffsets_0[v25], 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        });
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        Button = v1.createElement(v13, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_showResponse_0, 
            onButtonPress = l_onButtonPress_0
        }, v24), 
        Response = l_showResponse_0 and v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_responseBodyHeight_0), 
            Position = UDim2.new(v8, 0, 0, l_EntryFrameHeight_0), 
            BackgroundTransparency = 1
        }, {
            Text = v1.createElement(v12, {
                text = "Response Body:", 
                size = UDim2.new(1, 0, 0, l_ResponseStrHeight_0), 
                pos = UDim2.new(-v9, 0, 0, 0)
            }), 
            ResponseBody = v1.createElement(v11, {
                text = l_entry_0.Response, 
                size = UDim2.new(0.8, 0, 1, -l_ResponseStrHeight_0), 
                pos = UDim2.new(0, 0, 0, l_ResponseStrHeight_0)
            })
        })
    });
end;