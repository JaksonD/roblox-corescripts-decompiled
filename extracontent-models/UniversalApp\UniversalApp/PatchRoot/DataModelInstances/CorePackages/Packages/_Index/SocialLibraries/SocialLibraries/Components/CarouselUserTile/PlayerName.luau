local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_UIBlox_0 = v1.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Style_0 = l_UIBlox_0.Style;
local v7 = require(script.Parent.getTextHeight);
local _ = require(script.Parent.StyleTypes);
local v9 = {
    width = require(script.Parent.Constants).TILE_SIZE
};
return function(v10) --[[ Line: 25 ]]
    -- upvalues: l_llama_0 (copy), v9 (copy), l_Style_0 (copy), l_Roact_0 (copy), l_StyledTextLabel_0 (copy), v7 (copy)
    local v11 = l_llama_0.Dictionary.join(v9, v10);
    return l_Style_0.withStyle(function(v12) --[[ Line: 28 ]]
        -- upvalues: l_Roact_0 (ref), l_StyledTextLabel_0 (ref), v11 (copy), v7 (ref)
        local l_Theme_0 = v12.Theme;
        local l_Font_0 = v12.Font;
        return l_Roact_0.createElement(l_StyledTextLabel_0, {
            layoutOrder = v11.layoutOrder, 
            text = v11.name, 
            fontStyle = l_Font_0.CaptionHeader, 
            colorStyle = l_Theme_0.TextEmphasis, 
            size = UDim2.fromOffset(v11.width, v7(v11.name, l_Font_0.CaptionHeader.Font, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize)), 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Center, 
            lineHeight = 1, 
            fluidSizing = false, 
            richText = false
        });
    end);
end;