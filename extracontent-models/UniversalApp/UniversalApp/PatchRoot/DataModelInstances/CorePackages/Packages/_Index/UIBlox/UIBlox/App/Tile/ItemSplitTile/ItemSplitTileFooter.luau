local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.Foundation);
local v6 = require(l_Parent_1.Core.Style.withStyle);
local v7 = require(l_Parent_1.App.ImageSet.Images);
local l_Skeleton_0 = v5.Skeleton;
local v9 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v11 = require(l_Parent_0.ImageSet.getIconSizeUDim2);
local v12 = v3.PureComponent:extend("ItemSplitTileFooter");
v12.validateProps = v4.strictInterface({
    priceText = v4.optional(v4.string), 
    isOwned = v4.optional(v4.boolean), 
    layoutOrder = v4.optional(v4.number)
});
v12.render = function(v13) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v6 (copy), v11 (copy), v10 (copy), v3 (copy), l_Skeleton_0 (copy), v9 (copy)
    local l_priceText_0 = v13.props.priceText;
    local l_isOwned_0 = v13.props.isOwned;
    local v16 = if l_isOwned_0 then v7["icons/status/item/owned"] else v7["icons/common/robux_small"];
    return v6(function(v17) --[[ Line: 38 ]]
        -- upvalues: l_priceText_0 (copy), l_isOwned_0 (copy), v11 (ref), v10 (ref), v3 (ref), v13 (copy), l_Skeleton_0 (ref), v9 (ref), v16 (copy)
        local l_Font_0 = v17.Font.Body.Font;
        local v19 = v17.Font.BaseSize * v17.Font.Body.RelativeSize;
        local l_Theme_0 = v17.Theme;
        local v21 = l_priceText_0 and tonumber(l_priceText_0:sub(1, 1)) or l_priceText_0 == "--";
        local v22 = l_priceText_0 and (v21 or l_isOwned_0);
        local v23 = v11(v10.Small);
        local v24 = if v22 then v23.Width.Offset + 4 else 0;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v19), 
            BackgroundTransparency = 1, 
            LayoutOrder = v13.props.layoutOrder
        }, {
            Shimmer = if not l_priceText_0 then v3.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.8, 0, 0, v19)
            }) else nil, 
            Icon = v22 and v3.createElement(v9.Label, {
                BackgroundTransparency = 1, 
                Image = v16, 
                ImageColor3 = l_Theme_0.TextMuted.Color, 
                ImageTransparency = l_Theme_0.TextMuted.Transparency, 
                Size = v23, 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5)
            }), 
            TextLabel = l_priceText_0 and v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v24, 0, 0), 
                Size = UDim2.new(1, -v24, 1, 0), 
                Font = l_Font_0, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                TextSize = v19, 
                Text = l_priceText_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v12;