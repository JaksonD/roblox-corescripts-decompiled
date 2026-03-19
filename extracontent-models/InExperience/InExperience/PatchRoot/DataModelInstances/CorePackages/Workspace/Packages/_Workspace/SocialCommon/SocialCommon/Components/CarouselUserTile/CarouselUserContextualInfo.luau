local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_IconSize_0 = v3.App.Constant.IconSize;
local l_useTextSizeOffset_0 = v3.Core.Style.useTextSizeOffset;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v11 = require(script.Parent.Constants);
local v12 = {
    maxNumberOfLines = v11.LINES_MAX, 
    lineWidth = v11.TILE_SIZE
};
CarouselUserContextualInfo = function(v13) --[[ Line: 51 ]] --[[ Name: CarouselUserContextualInfo ]]
    -- upvalues: v2 (copy), v12 (copy), l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), l_IconSize_0 (copy), v1 (copy), l_Text_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy)
    local v14 = v2.Dictionary.join(v12, v13);
    local l_icon_0 = v14.icon;
    local l_label_0 = v14.label;
    local v17 = l_useStyle_0();
    local v18 = l_useTextSizeOffset_0();
    local l_Theme_0 = v17.Theme;
    local l_Font_0 = v17.Font;
    local v21 = l_label_0.font or l_Font_0.CaptionBody;
    local l_text_0 = l_label_0.text;
    local v23 = l_icon_0 and v14.lineWidth - (l_IconSize_0.Small + 2) or v14.lineWidth;
    local v24 = v1.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: l_Font_0 (copy), v21 (copy), v18 (copy), v14 (copy), l_Text_0 (ref), l_text_0 (copy), v23 (copy)
        return (math.min((l_Font_0.BaseSize * v21.RelativeSize + v18) * v14.maxNumberOfLines, l_Text_0.GetTextHeight(l_text_0 or "", v21.Font, l_Font_0.BaseSize * v21.RelativeSize, v23)));
    end, {
        v21.Font, 
        l_Font_0.BaseSize, 
        v21.RelativeSize, 
        v14.maxNumberOfLines, 
        l_text_0, 
        v18, 
        v23
    });
    return v1.createElement("Frame", {
        LayoutOrder = v14.layoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 2)
        }), 
        IconFrame = if l_icon_0 and l_icon_0.path then v1.createElement("Frame", {
            Size = UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
            BackgroundTransparency = 1
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            ImageLabel = v1.createElement(l_ImageSetLabel_0, {
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
        ContextualText = if l_text_0 then v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 2, 
            size = UDim2.fromOffset(v23, v24), 
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
end;
return CarouselUserContextualInfo;