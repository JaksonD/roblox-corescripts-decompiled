local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = v2.PureComponent:extend("TileBanner");
v5.validateProps = v3.strictInterface({
    bannerText = v3.string
});
v5.render = function(v6) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy)
    local l_bannerText_0 = v6.props.bannerText;
    return v4(function(v8) --[[ Line: 24 ]]
        -- upvalues: v2 (ref), l_bannerText_0 (copy)
        local l_Font_0 = v8.Font;
        local l_Theme_0 = v8.Theme;
        local v11 = 6 + l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize;
        return v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            BackgroundTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v11)
        }, {
            TextLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_0.CaptionBody.Font, 
                TextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
                Text = l_bannerText_0, 
                TextColor3 = l_Theme_0.SystemPrimaryContent.Color, 
                TextTransparency = l_Theme_0.SystemPrimaryContent.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0)
            })
        });
    end);
end;
return v5;