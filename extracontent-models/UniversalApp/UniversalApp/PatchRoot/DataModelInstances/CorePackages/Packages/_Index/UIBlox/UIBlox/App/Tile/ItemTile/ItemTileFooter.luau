local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_0.Core.Style.withStyle);
local v6 = require(l_Parent_0.App.ImageSet.Images);
local l_Skeleton_0 = v4.Skeleton;
local v8 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v9 = v2.PureComponent:extend("ItemTileFooter");
v9.validateProps = v3.strictInterface({
    priceText = v3.optional(v3.string), 
    isOwned = v3.optional(v3.boolean)
});
v9.render = function(v10) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), l_Skeleton_0 (copy), v8 (copy)
    local l_priceText_0 = v10.props.priceText;
    local l_isOwned_0 = v10.props.isOwned;
    local v13 = v6["icons/common/robux_small"];
    if l_isOwned_0 then
        v13 = v6["icons/status/item/owned"];
    end;
    return v5(function(v14) --[[ Line: 38 ]]
        -- upvalues: v13 (ref), v6 (ref), l_priceText_0 (copy), l_isOwned_0 (copy), v2 (ref), l_Skeleton_0 (ref), v8 (ref)
        local l_Font_0 = v14.Font.SubHeader1.Font;
        local v16 = v14.Font.BaseSize * v14.Font.SubHeader1.RelativeSize;
        local l_Theme_0 = v14.Theme;
        local v18 = v13.ImageRectSize / v6.ImagesResolutionScale;
        local v19 = l_priceText_0 and tonumber(l_priceText_0:sub(1, 1));
        local v20 = l_priceText_0 and (v19 or l_isOwned_0);
        local v21 = 0;
        if v20 then
            v21 = v18.X + 4;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Shimmer = not l_priceText_0 and v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.8, 0, 0, v16)
            }), 
            icon = v20 and v2.createElement(v8.Label, {
                BackgroundTransparency = 1, 
                Image = v13, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                Size = UDim2.new(0, v18.X, 0, v18.Y)
            }), 
            TextLabel = l_priceText_0 and v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(1, -v21, 1, 0), 
                Font = l_Font_0, 
                TextColor3 = l_Theme_0.SecondaryContent.Color, 
                TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                TextSize = v16, 
                Text = l_priceText_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        });
    end);
end;
return v9;