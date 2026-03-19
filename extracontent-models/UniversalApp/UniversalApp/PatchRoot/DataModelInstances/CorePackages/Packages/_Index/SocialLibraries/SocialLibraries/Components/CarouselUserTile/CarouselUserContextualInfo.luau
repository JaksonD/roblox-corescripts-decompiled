local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_UIBlox_0 = v1.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Style_0 = l_UIBlox_0.Style;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local v10 = require(script.Parent.getTextHeight);
local _ = require(script.Parent.StyleTypes);
local v12 = require(script.Parent.Constants);
local v13 = {
    maxNumberOfLines = v12.LINES_MAX, 
    lineWidth = v12.TILE_SIZE
};
return function(v14) --[[ Line: 46 ]]
    -- upvalues: l_llama_0 (copy), v13 (copy), l_Style_0 (copy), l_Roact_0 (copy), l_IconSize_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy), v10 (copy)
    local v15 = l_llama_0.Dictionary.join(v13, v14);
    local l_icon_0 = v15.icon;
    local l_label_0 = v15.label;
    return l_Style_0.withStyle(function(v18) --[[ Line: 51 ]]
        -- upvalues: l_label_0 (copy), l_Roact_0 (ref), v15 (copy), l_icon_0 (copy), l_IconSize_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_StyledTextLabel_0 (ref), v10 (ref)
        local l_Theme_0 = v18.Theme;
        local l_Font_0 = v18.Font;
        local v21 = l_label_0.font or l_Font_0.CaptionBody;
        local l_text_0 = l_label_0.text;
        return l_Roact_0.createElement("Frame", {
            LayoutOrder = v15.layoutOrder, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 2)
            }), 
            IconFrame = if l_icon_0 and l_icon_0.path then l_Roact_0.createElement("Frame", {
                Size = UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
                BackgroundTransparency = 1
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                ImageLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0[l_icon_0.path], 
                    ImageColor3 = l_icon_0.color or l_Theme_0.IconDefault.Color, 
                    ImageTransparency = l_icon_0.transparency or l_Theme_0.IconDefault.Transparency, 
                    Size = l_icon_0.size or UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }) else nil, 
            ContextualText = if l_text_0 then l_Roact_0.createElement(l_StyledTextLabel_0, {
                layoutOrder = 2, 
                size = UDim2.fromOffset(l_icon_0 and v15.lineWidth - (l_IconSize_0.Small + 2) or v15.lineWidth, v10(l_text_0, v21.Font, l_Font_0.BaseSize * v21.RelativeSize) * v15.maxNumberOfLines), 
                lineHeight = 1, 
                text = l_text_0, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Top, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                fontStyle = v21, 
                colorStyle = l_label_0.colorStyle or l_Theme_0.SecondaryContent, 
                fluidSizing = false, 
                richText = false
            }) else nil
        });
    end);
end;