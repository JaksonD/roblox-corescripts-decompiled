local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_0.Core.Style.withStyle);
local v6 = require(l_Parent_0.App.ImageSet.Images);
local l_Skeleton_0 = v4.Skeleton;
local v8 = require(l_Parent_0.Core.Text.ImageTextLabel.ImageTextLabel);
local v9 = require(l_Parent_0.Core.Text.EmojiTextLabel.EmojiTextLabel);
local v10 = require(l_Parent_0.Core.Emoji.Enum.Emoji);
local v11 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v12 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v13 = v2.PureComponent:extend("ItemTileName");
v13.validateProps = v3.strictInterface({
    LayoutOrder = v3.optional(v3.integer), 
    maxHeight = v3.intersection(v3.number, v3.numberMin(0)), 
    maxWidth = v3.intersection(v3.number, v3.numberMin(0)), 
    name = v3.optional(v3.string), 
    titleIcon = v3.optional(v3.table), 
    nameTextColor = v3.optional(v3.Color3), 
    nameTextTransparency = v3.optional(v3.number), 
    richText = v3.optional(v3.boolean), 
    hasVerifiedBadge = v3.optional(v3.boolean), 
    useMaxHeight = v3.optional(v3.boolean), 
    fluidSizing = v3.optional(v3.boolean), 
    titleFontStyle = v3.optional(v3.union(v11, v12)), 
    horizontalAlignment = v3.optional(v3.enum(Enum.HorizontalAlignment))
});
v13.render = function(v14) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy), v9 (copy), v10 (copy), v6 (copy), v8 (copy), l_Skeleton_0 (copy)
    local l_LayoutOrder_0 = v14.props.LayoutOrder;
    local l_maxHeight_0 = v14.props.maxHeight;
    local l_maxWidth_0 = v14.props.maxWidth;
    local l_name_0 = v14.props.name;
    local l_titleIcon_0 = v14.props.titleIcon;
    local l_useMaxHeight_0 = v14.props.useMaxHeight;
    local l_fluidSizing_0 = v14.props.fluidSizing;
    local l_hasVerifiedBadge_0 = v14.props.hasVerifiedBadge;
    local l_richText_0 = v14.props.richText;
    local v24 = if v14.props.horizontalAlignment == Enum.HorizontalAlignment.Center then Enum.TextXAlignment.Center else nil;
    return v5(function(v25) --[[ Line: 77 ]]
        -- upvalues: v14 (copy), l_name_0 (copy), l_maxWidth_0 (copy), l_maxHeight_0 (copy), l_hasVerifiedBadge_0 (copy), v2 (ref), v9 (ref), l_richText_0 (copy), l_fluidSizing_0 (copy), v10 (ref), l_LayoutOrder_0 (copy), l_titleIcon_0 (copy), v6 (ref), v8 (ref), v24 (copy), l_useMaxHeight_0 (copy), l_Skeleton_0 (ref)
        local l_Theme_0 = v25.Theme;
        local l_Font_0 = v25.Font;
        local v28 = v14.props.titleFontStyle or l_Font_0.Header2;
        local v29 = if v28.RelativeSize then l_Font_0.BaseSize * v28.RelativeSize else v28.FontSize;
        if l_name_0 ~= nil then
            local v30 = Vector2.new(l_maxWidth_0, l_maxHeight_0);
            local v31 = {
                Color = v14.props.nameTextColor or l_Theme_0.TextEmphasis.Color, 
                Transparency = v14.props.nameTextTransparency or l_Theme_0.TextEmphasis.Transparency
            };
            if l_hasVerifiedBadge_0 then
                return v2.createElement(v9, {
                    RichText = l_richText_0, 
                    maxSize = v30, 
                    fluidSizing = l_fluidSizing_0, 
                    emoji = v10.Verified, 
                    fontStyle = v28, 
                    colorStyle = v31, 
                    Text = l_name_0, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    LayoutOrder = l_LayoutOrder_0
                });
            else
                local v32 = l_titleIcon_0 and l_titleIcon_0.ImageRectSize / v6.ImagesResolutionScale or Vector2.new(0, 0);
                return v2.createElement(v8, {
                    imageProps = l_titleIcon_0 and {
                        BackgroundTransparency = 1, 
                        Image = l_titleIcon_0, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Size = UDim2.new(0, v32.X, 0, v32.Y), 
                        AnchorPoint = Vector2.new(0, 0), 
                        Position = UDim2.new(0, 0, 0, 0)
                    } or nil, 
                    genericTextLabelProps = {
                        fluidSizing = l_fluidSizing_0, 
                        fontStyle = v28, 
                        colorStyle = v31, 
                        Text = l_name_0, 
                        TextTruncate = Enum.TextTruncate.SplitWord, 
                        RichText = l_richText_0, 
                        TextXAlignment = v24
                    }, 
                    frameProps = {
                        BackgroundTransparency = 1, 
                        LayoutOrder = l_LayoutOrder_0
                    }, 
                    maxSize = v30, 
                    padding = 4, 
                    useMaxHeight = l_useMaxHeight_0
                });
            end;
        else
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = l_LayoutOrder_0, 
                Size = UDim2.new(0, l_maxWidth_0, 0, l_maxHeight_0)
            }, {
                FirstLine = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v29)
                }), 
                SecondLine = v2.createElement(l_Skeleton_0, {
                    Position = UDim2.fromOffset(0, v29 + 4), 
                    Size = UDim2.new(0.4, 0, 0, v29)
                })
            });
        end;
    end);
end;
return v13;