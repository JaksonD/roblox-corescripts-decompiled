local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local v6 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local v11 = l_FFlagLuaAppSearchGridTiles_0 and function(v9, v10) --[[ Line: 45 ]]
    return v9 * (v10 or 1);
end or nil;
return function(v12) --[[ Line: 50 ]] --[[ Name: GridTileTextFooter ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), v6 (copy), v2 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), v11 (copy)
    local v13 = l_useDesignTokens_0();
    local v14 = l_useTextSizeOffset_0();
    local v15 = l_useTokens_0();
    local v16 = if v12.isUnifiedGameTile then v15.Size.Size_500 else v13.Global.Space_250;
    local v17 = if v12.isUnifiedGameTile then v15.Color.Content.Default else v13.Semantic.Color.Text.Default;
    local v18 = v6(v12.useLargerFont, v13, v15, v12.isUnifiedGameTile and true or nil);
    return v2.createElement("Frame", {
        LayoutOrder = v12.LayoutOrder, 
        Size = UDim2.new(l_FFlagLuaAppSupportAdRatingFooter_0 and v12.shouldSizeToContentWidth and 0 or 1, 0, 0, if l_FFlagLuaAppSearchGridTiles_0 then v11(v16 + v14, v12.linesOfText) else v16 + v14), 
        AutomaticSize = if l_FFlagLuaAppSupportAdRatingFooter_0 and v12.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
        Position = v12.Position, 
        AnchorPoint = v12.AnchorPoint, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        Text = v2.createElement("TextLabel", {
            Text = v12.text, 
            Size = UDim2.new(l_FFlagLuaAppSupportAdRatingFooter_0 and v12.shouldSizeToContentWidth and 0 or 1, 0, 0, if l_FFlagLuaAppSearchGridTiles_0 then v11(v18.FontSize + v14, v12.linesOfText) else v18.FontSize + v14), 
            AutomaticSize = if l_FFlagLuaAppSupportAdRatingFooter_0 and v12.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = v18.FontSize, 
            Font = v18.Font, 
            TextTransparency = v17.Transparency, 
            TextColor3 = v17.Color3, 
            TextWrapped = if l_FFlagLuaAppSearchGridTiles_0 then v12.TextWrapped or false else false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = if l_FFlagLuaAppSearchGridTiles_0 then v12.TextYAlignment or Enum.TextYAlignment.Center else Enum.TextYAlignment.Center, 
            ClipsDescendants = if l_FFlagLuaAppSearchGridTiles_0 then v12.ClipsDescendants else nil, 
            RichText = if l_FFlagLuaAppSearchGridTiles_0 then v12.RichText else nil
        })
    });
end;