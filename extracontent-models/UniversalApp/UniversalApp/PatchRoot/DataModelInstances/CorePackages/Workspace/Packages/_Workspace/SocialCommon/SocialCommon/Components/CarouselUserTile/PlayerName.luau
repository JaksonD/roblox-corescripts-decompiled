local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v7 = require(script.Parent.Constants);
local l_FFlagHomepagePYMKPresence_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKPresence;
local v9 = {
    width = v7.TILE_SIZE
};
return function(v10) --[[ Line: 27 ]]
    -- upvalues: v2 (copy), v9 (copy), l_useStyle_0 (copy), v1 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), l_FFlagHomepagePYMKPresence_0 (copy)
    local v11 = v2.Dictionary.join(v9, v10);
    local v12 = l_useStyle_0();
    local l_Theme_0 = v12.Theme;
    local l_Font_0 = v12.Font;
    local v15 = v1.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: l_Text_0 (ref), v11 (copy), l_Font_0 (copy)
        return l_Text_0.GetTextHeight(v11.name, l_Font_0.CaptionHeader.Font, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 10000);
    end, {
        v11.name, 
        l_Font_0.CaptionHeader.Font, 
        l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize
    });
    return v1.createElement(l_StyledTextLabel_0, {
        layoutOrder = v11.layoutOrder, 
        text = v11.name, 
        fontStyle = l_Font_0.CaptionHeader, 
        colorStyle = l_Theme_0.TextEmphasis, 
        size = UDim2.fromOffset(v11.width, v15), 
        textTruncate = Enum.TextTruncate.AtEnd, 
        textXAlignment = Enum.TextXAlignment.Left, 
        textYAlignment = Enum.TextYAlignment.Center, 
        lineHeight = 1, 
        fluidSizing = false, 
        richText = l_FFlagHomepagePYMKPresence_0 and true or false
    });
end;