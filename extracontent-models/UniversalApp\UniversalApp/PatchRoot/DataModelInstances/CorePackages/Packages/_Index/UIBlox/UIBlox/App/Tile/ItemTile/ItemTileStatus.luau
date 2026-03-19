local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.Core.Text.GetTextSize);
local v7 = require(l_Parent_1.App.ImageSet.Images);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.Enum.ItemTileEnums);
local v10 = v3.PureComponent:extend("ItemTileStatus");
local v11 = Vector2.new(50, 20);
local v12 = Vector2.new(10, 6);
v10.validateProps = v4.strictInterface({
    statusText = v4.string, 
    statusStyle = v9.StatusStyle.isEnumValue
});
local function v15(v13, v14) --[[ Line: 30 ]] --[[ Name: getStyle ]]
    -- upvalues: v9 (copy)
    if v14 == v9.StatusStyle.Info then
        return {
            Background = v13.SystemPrimaryDefault, 
            Text = v13.SystemPrimaryContent
        };
    elseif v14 == v9.StatusStyle.Alert then
        return {
            Background = v13.Alert, 
            Text = v13.TextEmphasis
        };
    else
        return {
            Background = v13.SystemPrimaryDefault, 
            Text = v13.SystemPrimaryContent
        };
    end;
end;
v10.render = function(v16) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v6 (copy), v11 (copy), v15 (copy), v3 (copy), v8 (copy), v7 (copy), v12 (copy)
    return v5(function(v17) --[[ Line: 50 ]]
        -- upvalues: v16 (copy), v6 (ref), v11 (ref), v15 (ref), v3 (ref), v8 (ref), v7 (ref), v12 (ref)
        local l_Theme_0 = v17.Theme;
        local l_Font_0 = v17.Font;
        local l_Tokens_0 = v17.Tokens;
        local l_statusText_0 = v16.props.statusText;
        local l_statusStyle_0 = v16.props.statusStyle;
        local l_Font_1 = l_Font_0.CaptionHeader.Font;
        local v24 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local v25 = v6(l_statusText_0, v24, l_Font_1, v11);
        local v26 = v15(l_Theme_0, l_statusStyle_0);
        return v3.createElement(v8.Label, {
            BackgroundTransparency = 1, 
            Image = v7["component_assets/circle_17"], 
            ImageColor3 = v26.Background.Color, 
            ImageTransparency = v26.Background.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Position = UDim2.new(0, l_Tokens_0.Global.Size_100, 0, l_Tokens_0.Global.Size_100), 
            Size = UDim2.new(0, v25.X + v12.X, 0, v25.Y + v12.Y)
        }, {
            Text = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                TextSize = v24, 
                Text = l_statusText_0, 
                TextColor3 = v26.Text.Color, 
                TextTransparency = v26.Text.TextTransparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0)
            })
        });
    end);
end;
return v10;