local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v8 = require(l_Parent_0.Enum.ItemTileEnums);
local v9 = v3.PureComponent:extend("ItemIcon");
local v10 = {
    [v8.ItemIconType.AnimationBundle] = v6["icons/status/item/bundle"], 
    [v8.ItemIconType.Bundle] = v6["icons/status/item/bundle"], 
    [v8.ItemIconType.DynamicHead] = v6["icons/status/dynamicHead_small"]
};
v9.validateProps = v4.strictInterface({
    itemIconType = v4.intersection(v8.ItemIconType.isEnumValue, function(v11) --[[ Line: 24 ]] --[[ Name: isValidItemIconType ]]
        -- upvalues: v10 (copy)
        if v10[v11] then
            return true;
        else
            return false, "Unknown ItemType " .. v11;
        end;
    end)
});
v9.render = function(v12) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v6 (copy), v5 (copy), v3 (copy), v7 (copy)
    local v13 = v10[v12.props.itemIconType];
    local v14 = v13.ImageRectSize / v6.ImagesResolutionScale;
    return v5(function(v15) --[[ Line: 43 ]]
        -- upvalues: v3 (ref), v7 (ref), v13 (copy), v14 (copy)
        local l_Theme_0 = v15.Theme;
        local l_Tokens_0 = v15.Tokens;
        return v3.createElement(v7.Label, {
            AnchorPoint = Vector2.new(1, 1), 
            BackgroundTransparency = 1, 
            Image = v13, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            Position = UDim2.new(1, -l_Tokens_0.Global.Size_100, 1, -l_Tokens_0.Global.Size_100), 
            Size = UDim2.new(0, v14.X, 0, v14.Y)
        });
    end);
end;
return v9;