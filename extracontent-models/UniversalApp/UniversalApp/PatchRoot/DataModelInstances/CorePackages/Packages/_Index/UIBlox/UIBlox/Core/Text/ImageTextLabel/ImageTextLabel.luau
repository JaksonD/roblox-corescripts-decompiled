local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v7 = require(l_Parent_0.Core.Text.GetTextSize);
local v8 = require(l_Parent_0.Core.Text.GetWrappedTextWithIcon);
local v9 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v10 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v11 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v12 = require(l_Parent_0.Core.Style.withStyle);
local v13 = v2.PureComponent:extend("ImageTextLabel");
v13.validateProps = v4.interface({
    imageProps = v4.optional(v4.interface({
        Size = v4.UDim2
    })), 
    genericTextLabelProps = v4.interface({
        Text = v4.string, 
        fontStyle = v4.union(v9, v10), 
        colorStyle = v11, 
        fluidSizing = v4.optional(v4.boolean), 
        AnchorPoint = v4.None, 
        Position = v4.None, 
        Size = v4.None, 
        TextXAlignment = v4.None, 
        TextYAlignment = v4.None, 
        TextScaled = v4.None, 
        maxSize = v4.None, 
        richText = v4.optional(v4.boolean)
    }), 
    frameProps = v4.optional(v4.interface({
        Size = v4.None
    })), 
    maxSize = v4.optional(v4.Vector2), 
    padding = v4.optional(v4.number)
});
v13.defaultProps = {
    maxSize = Vector2.new(10000, 10000), 
    frameProps = {}, 
    padding = 0
};
v13.render = function(v14) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v8 (copy), v7 (copy), v2 (copy), v3 (copy), v5 (copy), v6 (copy)
    local l_genericTextLabelProps_0 = v14.props.genericTextLabelProps;
    local l_imageProps_0 = v14.props.imageProps;
    local l_frameProps_0 = v14.props.frameProps;
    local l_padding_0 = v14.props.padding;
    local l_Text_0 = v14.props.genericTextLabelProps.Text;
    local l_maxSize_0 = v14.props.maxSize;
    local l_useMaxHeight_0 = v14.props.useMaxHeight;
    local l_richText_0 = v14.props.richText;
    return v12(function(v23) --[[ Line: 78 ]]
        -- upvalues: l_genericTextLabelProps_0 (copy), l_imageProps_0 (copy), l_Text_0 (ref), v8 (ref), l_padding_0 (copy), v7 (ref), l_maxSize_0 (copy), l_useMaxHeight_0 (copy), v2 (ref), v3 (ref), l_frameProps_0 (copy), v5 (ref), v6 (ref), v14 (copy), l_richText_0 (copy)
        local l_fontStyle_0 = l_genericTextLabelProps_0.fontStyle;
        local l_BaseSize_0 = v23.Font.BaseSize;
        local v26 = if l_fontStyle_0.RelativeSize then l_BaseSize_0 * l_fontStyle_0.RelativeSize else l_fontStyle_0.FontSize;
        local l_Font_0 = l_fontStyle_0.Font;
        if l_imageProps_0 then
            l_Text_0 = v8(l_Text_0, v26, l_Font_0, l_imageProps_0.Size.X.Offset, l_padding_0);
        end;
        local v28 = v7(l_Text_0, v26, l_Font_0, Vector2.new(l_maxSize_0.X, l_maxSize_0.Y));
        local v29 = l_useMaxHeight_0 and l_maxSize_0.Y or v28.Y;
        return v2.createElement("Frame", v3.Dictionary.join(l_frameProps_0, {
            Size = UDim2.new(0, v28.X, 0, v29)
        }), {
            Icon = if l_imageProps_0 then v2.createElement(v5.Label, l_imageProps_0) else nil, 
            Name = v2.createElement(v6, v3.Dictionary.join(l_genericTextLabelProps_0, {
                Text = l_Text_0, 
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                TextXAlignment = l_genericTextLabelProps_0.TextXAlignment or Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                fluidSizing = not l_imageProps_0 and v14.props.fluidSizing, 
                maxSize = l_maxSize_0, 
                RichText = l_richText_0
            }))
        });
    end);
end;
return v13;