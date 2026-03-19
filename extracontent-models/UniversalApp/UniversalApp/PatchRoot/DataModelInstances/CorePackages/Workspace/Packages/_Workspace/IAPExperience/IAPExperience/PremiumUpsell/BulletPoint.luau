local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Roact);
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v2.Style.withStyle;
local l_IconSize_0 = v2.App.Constant.IconSize;
local v8 = l_IconSize_0.Small + 16;
return function(v9) --[[ Line: 24 ]]
    -- upvalues: l_withStyle_0 (copy), l_TextService_0 (copy), v8 (copy), v3 (copy), l_ImageSetLabel_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return l_withStyle_0(function(v10) --[[ Line: 25 ]]
        -- upvalues: v9 (copy), l_TextService_0 (ref), v8 (ref), v3 (ref), l_ImageSetLabel_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref)
        local l_Theme_0 = v10.Theme;
        local l_Font_0 = v10.Font;
        local l_text_0 = v9.text;
        local v14 = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize;
        local l_Font_1 = l_Font_0.Body.Font;
        local v16 = nil;
        v16 = if l_text_0 ~= nil then l_TextService_0:GetTextSize(l_text_0, v14, l_Font_1, Vector2.new(v9.width - v8, 10000)) else Vector2.new(0, 0);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v16.Y), 
            BackgroundTransparency = 1, 
            LayoutOrder = v9.layoutOrder
        }, {
            Bullet = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 2, 0, 2), 
                Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                ScaleType = Enum.ScaleType.Stretch, 
                Image = l_Images_0["icons/status/success_small"], 
                ImageColor3 = l_Theme_0.IconDefault.Color, 
                ImageTransparency = l_Theme_0.IconDefault.Transparency
            }), 
            Text = v3.createElement("TextLabel", {
                Position = UDim2.new(0, v8, 0, 0), 
                Size = UDim2.new(1, -v8, 0, v16.Y), 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                TextSize = v14, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                Font = l_Font_1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                LayoutOrder = v9.layoutOrder
            })
        });
    end);
end;