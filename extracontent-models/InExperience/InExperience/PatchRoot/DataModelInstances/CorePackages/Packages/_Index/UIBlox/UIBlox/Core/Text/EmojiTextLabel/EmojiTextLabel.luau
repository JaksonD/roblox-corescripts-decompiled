local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local _ = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local _ = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v7 = require(l_Parent_0.Core.Style.useStyle);
local v8 = require(l_Parent_0.Core.Text.GetTextSize);
local l_Emoji_0 = l_Parent_0.Core.Emoji;
local v10 = require(l_Emoji_0.Emoji);
local v11 = require(l_Emoji_0.Enum.Emoji);
local v12 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v13 = {
    maxSize = Vector2.new(10000, 10000), 
    fluidSizing = false
};
return function(v14) --[[ Line: 47 ]] --[[ Name: EmojiTextLabel ]]
    -- upvalues: v3 (copy), v13 (copy), v7 (copy), v11 (copy), v8 (copy), v2 (copy), v12 (copy), v10 (copy)
    v14 = v3.Dictionary.join(v13, v14);
    local v15 = v7();
    local v16 = v11.isEnumValue(v14.emoji);
    local l_BaseSize_0 = v15.Font.BaseSize;
    local l_colorStyle_0 = v14.colorStyle;
    local l_fontStyle_0 = v14.fontStyle;
    local l_Font_0 = l_fontStyle_0.Font;
    local v21 = if l_fontStyle_0.RelativeSize then l_BaseSize_0 * l_fontStyle_0.RelativeSize else l_fontStyle_0.FontSize;
    local l_maxSize_0 = v14.maxSize;
    local v23 = v8(v14.Text, v21, l_Font_0, l_maxSize_0);
    local v24 = math.min(v23.X, l_maxSize_0.X - v21);
    local v25 = v3.Dictionary.join(v14, {
        emoji = v3.None, 
        emojiOnActivated = v3.None, 
        colorStyle = l_colorStyle_0, 
        Size = UDim2.fromOffset(v24, v23.Y)
    });
    return v2.createElement(v12, v25, {
        Emoji = v16 and v2.createElement(v10, {
            emoji = v14.emoji, 
            onActivated = v14.emojiOnActivated, 
            textFont = l_Font_0, 
            textSize = v21, 
            Position = UDim2.fromScale(1, 0)
        })
    });
end;