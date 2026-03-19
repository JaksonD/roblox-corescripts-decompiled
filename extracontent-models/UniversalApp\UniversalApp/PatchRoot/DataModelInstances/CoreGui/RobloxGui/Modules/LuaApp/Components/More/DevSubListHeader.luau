local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v3 = {
    LEFT = 22, 
    TOP = 5, 
    BOTTOM = 5
};
return function(v4) --[[ Line: 17 ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), v3 (copy)
    local l_maxSize_0 = v4.maxSize;
    local l_layoutOrder_0 = v4.layoutOrder;
    local l_text_0 = v4.text;
    return l_withStyle_0(function(v8) --[[ Line: 22 ]]
        -- upvalues: v1 (ref), l_layoutOrder_0 (copy), l_maxSize_0 (copy), v3 (ref), l_text_0 (copy)
        return v1.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 32)
        }, {
            SizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = l_maxSize_0
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v3.LEFT), 
                PaddingTop = UDim.new(0, v3.TOP), 
                PaddingBottom = UDim.new(0, v3.BOTTOM)
            }), 
            Text = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Font = v8.Font.Header2.Font, 
                TextSize = v8.Font.BaseSize * v8.Font.Header2.RelativeSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v8.Theme.TextDefault.Color, 
                TextTransparency = v8.Theme.TextDefault.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Text = l_text_0
            })
        });
    end);
end;