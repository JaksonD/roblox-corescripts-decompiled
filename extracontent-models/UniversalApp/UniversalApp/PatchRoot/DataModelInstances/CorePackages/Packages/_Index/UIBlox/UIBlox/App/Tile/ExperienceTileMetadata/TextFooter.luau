local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local v5 = require(l_Parent_2.Core.Style.useStyle);
local _ = require(l_Parent_1.Style.StyleTypes);
local _ = require(l_Parent_1.Style.Fonts);
local v8 = require(l_Parent_0.FooterFrame);
local function v12(v9, v10) --[[ Line: 34 ]] --[[ Name: getStyleProps ]]
    local v11 = v9 or {};
    return {
        cornerRadius = v11.cornerRadius, 
        textColor = v11.textColor or v10.Theme.TextMuted, 
        backgroundColor = v11.backgroundColor, 
        textXAlignment = v11.textXAlignment or Enum.TextXAlignment.Left, 
        textFont = v11.textFont or v10.Font.CaptionBody
    };
end;
return function(v13) --[[ Line: 45 ]] --[[ Name: TextFooter ]]
    -- upvalues: v5 (copy), v12 (copy), v4 (copy), v8 (copy)
    local v14 = v5();
    local l_Font_0 = v14.Font;
    local v16 = v12(v13.styleProps, v14);
    local l_cornerRadius_0 = v16.cornerRadius;
    local l_textColor_0 = v16.textColor;
    local l_backgroundColor_0 = v16.backgroundColor;
    local l_textXAlignment_0 = v16.textXAlignment;
    local l_textFont_0 = v16.textFont;
    return v4.createElement(v8, v13, {
        Text = v4.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = if l_backgroundColor_0 then l_backgroundColor_0.Color else nil, 
            BackgroundTransparency = if l_backgroundColor_0 then l_backgroundColor_0.Transparency else 1, 
            BorderSizePixel = 0, 
            Text = v13.text, 
            TextXAlignment = l_textXAlignment_0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_textFont_0.Font, 
            TextSize = l_Font_0.BaseSize * l_textFont_0.RelativeSize, 
            TextColor3 = l_textColor_0.Color, 
            TextTransparency = l_textColor_0.Transparency, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            UICorner = if l_cornerRadius_0 then v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_cornerRadius_0)
            }) else nil
        })
    });
end;