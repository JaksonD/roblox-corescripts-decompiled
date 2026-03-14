local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Constants);
local l_HighlightHeight_0 = v2.TabRowFormatting.HighlightHeight;
local l_FrameHeight_0 = v2.TabRowFormatting.FrameHeight;
return function(v5) --[[ Line: 10 ]] --[[ Name: TabRowButton ]]
    -- upvalues: v2 (copy), v1 (copy), l_FrameHeight_0 (copy), l_HighlightHeight_0 (copy)
    local l_index_0 = v5.index;
    local l_name_0 = v5.name;
    local l_textWidth_0 = v5.textWidth;
    local l_padding_0 = v5.padding;
    local l_isSelected_0 = v5.isSelected;
    local l_layoutOrder_0 = v5.layoutOrder;
    local l_onTabButtonClicked_0 = v5.onTabButtonClicked;
    l_textWidth_0 = l_textWidth_0 + l_padding_0;
    local l_UnselectedTextTransparency_0 = v2.TabRowFormatting.UnselectedTextTransparency;
    if l_isSelected_0 then
        l_UnselectedTextTransparency_0 = v2.TabRowFormatting.SelectedTextTransparency;
    end;
    return v1.createElement("TextButton", {
        Text = l_name_0, 
        TextSize = v2.DefaultFontSize.TabBar, 
        Font = v2.Font.TabBar, 
        TextScaled = false, 
        TextTransparency = l_UnselectedTextTransparency_0, 
        Size = UDim2.new(0, l_textWidth_0, 0, l_FrameHeight_0), 
        AutoButtonColor = false, 
        TextColor3 = v2.Color.Text, 
        BackgroundColor3 = v2.Color.UnselectedGray, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0, 
        [v1.Event.Activated] = function(_) --[[ Line: 38 ]]
            -- upvalues: l_onTabButtonClicked_0 (copy), l_index_0 (copy)
            l_onTabButtonClicked_0(l_index_0);
        end
    }, {
        BlueHighlight = l_isSelected_0 and v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, -l_HighlightHeight_0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v2.Color.HighlightBlue
        })
    });
end;