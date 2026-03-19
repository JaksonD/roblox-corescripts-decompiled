local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.Core.Text.GetTextSize);
local v6 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v7 = require(l_Parent_0.App.ImageSet.Images);
local v8 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v9 = require(script.Parent.Enum.BadgeStates);
local v10 = require(script.Parent.Enum.BadgeVariant);
local v11 = require(l_Parent_0.Utility.divideTransparency);
local v12 = v7["component_assets/circle_25"];
local v13 = v7["component_assets/circle_21"];
local v14 = v2.PureComponent:extend("Badge");
v14.validateProps = v3.strictInterface({
    position = v3.optional(v3.UDim2), 
    anchorPoint = v3.optional(v3.Vector2), 
    disabled = v3.optional(v3.boolean), 
    hasShadow = v3.optional(v3.boolean), 
    value = v3.union(v3.string, v3.integer, v9.isEnumValue), 
    badgeVariant = v3.optional(v10.isEnumValue), 
    layoutOrder = v3.optional(v3.integer)
});
v14.defaultProps = {
    position = UDim2.new(0, 0, 0, 0), 
    anchorPoint = Vector2.new(0, 0), 
    disabled = false, 
    hasShadow = false, 
    badgeVariant = v10.Default
};
v14.render = function(v15) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v3 (copy), v9 (copy), v5 (copy), v10 (copy), v2 (copy), v8 (copy), v7 (copy), v11 (copy), v12 (copy), v13 (copy), v6 (copy)
    return v4(function(v16) --[[ Line: 66 ]]
        -- upvalues: v15 (copy), v3 (ref), v9 (ref), v5 (ref), v10 (ref), v2 (ref), v8 (ref), v7 (ref), v11 (ref), v12 (ref), v13 (ref), v6 (ref)
        local l_Theme_0 = v16.Theme;
        local l_Font_0 = v16.Font;
        local v19 = tostring(v15.props.value);
        if v3.number(v15.props.value) and v15.props.value > 99 then
            v19 = "99+";
        elseif v3.string(v15.props.value) and utf8.len(utf8.nfcnormalize(v15.props.value)) > 4 then
            local v20 = utf8.offset(v15.props.value, 4) - 1;
            v19 = string.sub(v15.props.value, 1, v20) .. "...";
        end;
        if v15.props.value == v9.isEmpty then
            v19 = "";
        end;
        local l_BaseSize_0 = v16.Font.BaseSize;
        local v22 = l_Font_0.CaptionBody.RelativeSize * l_BaseSize_0;
        local v23 = v5(v19, v22, l_Font_0.CaptionBody.Font, Vector2.new(10000, 10000)).X + 10 + 4;
        if v23 < 24 then
            v23 = 24;
        end;
        local v24 = 24;
        if v15.props.value == v9.isEmpty then
            v23 = 12;
            v24 = 12;
        end;
        local l_Badge_0 = v16.Tokens.Semantic.Color.Common.Badge;
        local v26 = {
            Color = v16.Tokens.Semantic.Color.Common.BadgeContent.Color3, 
            Transparency = v16.Tokens.Semantic.Color.Common.BadgeContent.Transparency
        };
        if v15.props.badgeVariant == v10.Alert then
            l_Badge_0 = v16.Tokens.Semantic.Color.Common.Alert;
            v26 = {
                Color = v16.Tokens.Global.Color.White.Color3, 
                Transparency = v16.Tokens.Semantic.Color.Common.BadgeContent.Transparency
            };
        end;
        return v2.createElement("Frame", {
            Position = v15.props.position, 
            AnchorPoint = v15.props.anchorPoint, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v23, v24), 
            LayoutOrder = v15.props.layoutOrder
        }, {
            Shadow = v15.props.hasShadow and v2.createElement(v8.Label, {
                ZIndex = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 12, 1, 12), 
                Image = v7["component_assets/dropshadow_25"], 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(18, 18, 19, 19)
            }), 
            Background = v2.createElement(v8.Label, {
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
                ImageTransparency = v11(l_Theme_0.BackgroundDefault.Transparency, v15.props.disabled and 2 or 1), 
                Image = v12, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(14, 14, 15, 15)
            }), 
            Inner = v2.createElement(v8.Label, {
                ZIndex = 3, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, -4, 1, -4), 
                ImageColor3 = l_Badge_0.Color3, 
                ImageTransparency = v11(l_Badge_0.Transparency, v15.props.disabled and 2 or 1), 
                Image = v13, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 12, 13, 13)
            }, {
                TextLabel = v2.createElement(v6, {
                    fontStyle = l_Font_0.CaptionBody, 
                    colorStyle = v26, 
                    BackgroundTransparency = 1, 
                    Text = v19, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromScale(1, 1), 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            })
        });
    end);
end;
return v14;