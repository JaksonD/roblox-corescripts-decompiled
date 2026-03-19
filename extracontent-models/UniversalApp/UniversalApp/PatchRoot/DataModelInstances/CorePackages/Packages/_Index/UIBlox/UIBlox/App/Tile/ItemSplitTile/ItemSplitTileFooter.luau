local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v10 = require(l_Parent_0.ImageSet.getIconSizeUDim2);
local v11 = v3.PureComponent:extend("ItemSplitTileFooter");
v11.validateProps = v4.strictInterface({
    priceText = v4.optional(v4.string), 
    isOwned = v4.optional(v4.boolean), 
    layoutOrder = v4.optional(v4.number)
});
v11.render = function(v12) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v5 (copy), v10 (copy), v9 (copy), v3 (copy), v7 (copy), v8 (copy)
    local l_priceText_0 = v12.props.priceText;
    local l_isOwned_0 = v12.props.isOwned;
    local v15 = if l_isOwned_0 then v6["icons/status/item/owned"] else v6["icons/common/robux_small"];
    return v5(function(v16) --[[ Line: 37 ]]
        -- upvalues: l_priceText_0 (copy), l_isOwned_0 (copy), v10 (ref), v9 (ref), v3 (ref), v12 (copy), v7 (ref), v8 (ref), v15 (copy)
        local l_Font_0 = v16.Font.Body.Font;
        local v18 = v16.Font.BaseSize * v16.Font.Body.RelativeSize;
        local l_Theme_0 = v16.Theme;
        local v20 = l_priceText_0 and tonumber(l_priceText_0:sub(1, 1)) or l_priceText_0 == "--";
        local v21 = l_priceText_0 and (v20 or l_isOwned_0);
        local v22 = v10(v9.Small);
        local v23 = if v21 then v22.Width.Offset + 4 else 0;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v18), 
            BackgroundTransparency = 1, 
            LayoutOrder = v12.props.layoutOrder
        }, {
            Shimmer = if not l_priceText_0 then v3.createElement(v7, {
                Size = UDim2.new(0.8, 0, 0, v18)
            }) else nil, 
            Icon = v21 and v3.createElement(v8.Label, {
                BackgroundTransparency = 1, 
                Image = v15, 
                ImageColor3 = l_Theme_0.TextMuted.Color, 
                ImageTransparency = l_Theme_0.TextMuted.Transparency, 
                Size = v22, 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5)
            }), 
            TextLabel = l_priceText_0 and v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v23, 0, 0), 
                Size = UDim2.new(1, -v23, 1, 0), 
                Font = l_Font_0, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                TextSize = v18, 
                Text = l_priceText_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v11;