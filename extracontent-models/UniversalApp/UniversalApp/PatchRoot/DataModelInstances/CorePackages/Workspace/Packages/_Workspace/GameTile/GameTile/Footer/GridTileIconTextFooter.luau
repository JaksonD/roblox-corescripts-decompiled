local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v4 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v6 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useTextSizeOffset_0 = v4.Core.Style.useTextSizeOffset;
local v9 = require(l_script_FirstAncestor_0.GameTileTypes);
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
return function(v11) --[[ Line: 54 ]] --[[ Name: GridTileIconTextFooter ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), v9 (copy), v6 (copy), v2 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_ImageSetLabel_0 (copy)
    local v12 = l_useDesignTokens_0();
    local v13 = l_useTextSizeOffset_0();
    local v14 = l_useTokens_0();
    local v15 = if v11.isUnifiedGameTile then v14.Size.Size_500 else v12.Global.Space_250;
    local v16 = if v11.isUnifiedGameTile then if v11.isNarrowScreenXSmall and v11.gameTileLayoutType == v9.GameTileLayoutType.Narrow then v14.Gap.XXSmall else v14.Gap.XSmall else v12.Global.Space_50;
    local v17 = if v11.isUnifiedGameTile then v14.Color.Content.Default else v12.Semantic.Color.Text.Default;
    local v18 = v6(v11.useLargerFont, v12, v14 or nil, v11.isUnifiedGameTile and true or nil);
    local l_FontSize_0 = v18.FontSize;
    local v20 = nil;
    local v21 = nil;
    if v11.iconSize then
        v21 = v11.iconSize;
        v20 = v12.Global.Size_250;
    else
        v21 = l_FontSize_0 / 1.26;
        v20 = v21;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v11.shouldSizeToContentWidth and 0 or 1, 0, 0, v15 + v13), 
        AutomaticSize = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v11.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
        Position = v11.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        IconSlot = v2.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v20, v20), 
            ClipsDescendants = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Icon = if v11.iconElement then v11.iconElement else v2.createElement(l_ImageSetLabel_0, {
                Image = v11.icon, 
                ImageColor3 = v17.Color3, 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v21, v21), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            })
        }), 
        Text = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = v11.text, 
            Size = UDim2.new(l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v11.shouldSizeToContentWidth and 0 or 1, l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v11.shouldSizeToContentWidth and 0 or -(v20 + v16), 0, l_FontSize_0 + v13), 
            AutomaticSize = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v11.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
            Position = UDim2.new(0, v20 + v16, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = l_FontSize_0, 
            Font = v18.Font, 
            TextTransparency = v17.Transparency, 
            TextColor3 = v17.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;