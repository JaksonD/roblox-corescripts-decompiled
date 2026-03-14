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
local v10 = v3.PureComponent:extend("ItemRestrictionStatus");
local v11 = Vector2.new(50, 20);
local v12 = Vector2.new(8, 8);
v10.validateProps = v4.strictInterface({
    restrictionTypes = v4.map(v9.Restriction.isEnumValue, v4.boolean), 
    restrictionInfo = v4.optional(v4.table)
});
local function _(v13, v14) --[[ Line: 33 ]] --[[ Name: getAdditionalText ]]
    -- upvalues: v9 (copy)
    local v15 = "";
    if v13[v9.Restriction.LimitedUnique] then
        v15 = "#";
    end;
    if v13[v9.Restriction.Collectible] then
        return "#";
    else
        if v14 and v14.limitedSerialNumber then
            v15 = v15 .. " " .. v14.limitedSerialNumber;
        end;
        return v15;
    end;
end;
local function _(v17) --[[ Line: 51 ]] --[[ Name: getRestrictionIcon ]]
    -- upvalues: v9 (copy), v7 (copy)
    if v17[v9.Restriction.Collectible] then
        return v7["icons/status/item/limited"];
    elseif v17[v9.Restriction.Limited] or v17[v9.Restriction.LimitedUnique] then
        return v7["icons/status/item/limited"];
    else
        return nil;
    end;
end;
v10.render = function(v19) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v9 (copy), v6 (copy), v11 (copy), v7 (copy), v12 (copy), v3 (copy), v8 (copy)
    return v5(function(v20) --[[ Line: 67 ]]
        -- upvalues: v19 (copy), v9 (ref), v6 (ref), v11 (ref), v7 (ref), v12 (ref), v3 (ref), v8 (ref)
        local l_Theme_0 = v20.Theme;
        local l_Font_0 = v20.Font;
        local l_Tokens_0 = v20.Tokens;
        local l_restrictionInfo_0 = v19.props.restrictionInfo;
        local l_restrictionTypes_0 = v19.props.restrictionTypes;
        local v26 = "";
        if l_restrictionTypes_0[v9.Restriction.LimitedUnique] then
            v26 = "#";
        end;
        local v27;
        if l_restrictionTypes_0[v9.Restriction.Collectible] then
            v27 = "#";
        else
            if l_restrictionInfo_0 and l_restrictionInfo_0.limitedSerialNumber then
                v26 = v26 .. " " .. l_restrictionInfo_0.limitedSerialNumber;
            end;
            v27 = v26;
        end;
        v26 = l_Font_0.CaptionHeader.Font;
        local v28 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local v29 = v6(v27, v28, v26, v11);
        local v30 = if l_restrictionTypes_0[v9.Restriction.Collectible] then v7["icons/status/item/limited"] else if l_restrictionTypes_0[v9.Restriction.Limited] or l_restrictionTypes_0[v9.Restriction.LimitedUnique] then v7["icons/status/item/limited"] else nil;
        local v31 = v30 and v30.ImageRectSize / v7.ImagesResolutionScale or Vector2.new(0, 0);
        local v32 = v31.X + v29.X + v12.X;
        local v33 = math.max(v31.Y, v29.Y) + v12.Y;
        return v3.createElement(v8.Label, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            Image = v7["component_assets/circle_17"], 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Position = UDim2.new(0, l_Tokens_0.Global.Size_100, 1, -l_Tokens_0.Global.Size_100), 
            Size = UDim2.new(0, v32, 0, v33)
        }, {
            Icon = v30 and v3.createElement(v8.Label, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v30, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                Position = UDim2.new(0, v12.X / 2, 0.5, 0), 
                Size = UDim2.new(0, v31.X, 0, v31.Y)
            }), 
            Text = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v26, 
                TextSize = v28, 
                Text = v27, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.TextTransparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Position = UDim2.new(0, v31.X, 0, 0), 
                Size = UDim2.new(0, v29.X + 10, 1, 0)
            })
        });
    end);
end;
return v10;