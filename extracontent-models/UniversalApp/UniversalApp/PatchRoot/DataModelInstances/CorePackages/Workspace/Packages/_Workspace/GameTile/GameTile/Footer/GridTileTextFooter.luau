local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local v6 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local function _(v8, v9) --[[ Line: 43 ]]
    return v8 * (v9 or 1);
end;
return function(v11) --[[ Line: 47 ]] --[[ Name: GridTileTextFooter ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), v6 (copy), v2 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy)
    local v12 = l_useDesignTokens_0();
    local v13 = l_useTextSizeOffset_0();
    local v14 = l_useTokens_0();
    local v15 = if v11.isUnifiedGameTile then v14.Size.Size_500 else v12.Global.Space_250;
    local v16 = if v11.isUnifiedGameTile then v14.Color.Content.Default else v12.Semantic.Color.Text.Default;
    local v17 = v6(v11.useLargerFont, v12, v14, v11.isUnifiedGameTile and true or nil);
    return v2.createElement("Frame", {
        LayoutOrder = v11.LayoutOrder, 
        Size = UDim2.new(l_FFlagLuaAppSupportAdRatingFooter_0 and v11.shouldSizeToContentWidth and 0 or 1, 0, 0, (v15 + v13) * (v11.linesOfText or 1)), 
        AutomaticSize = if l_FFlagLuaAppSupportAdRatingFooter_0 and v11.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
        Position = v11.Position, 
        AnchorPoint = v11.AnchorPoint, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        Text = v2.createElement("TextLabel", {
            Text = v11.text, 
            Size = UDim2.new(l_FFlagLuaAppSupportAdRatingFooter_0 and v11.shouldSizeToContentWidth and 0 or 1, 0, 0, (v17.FontSize + v13) * (v11.linesOfText or 1)), 
            AutomaticSize = if l_FFlagLuaAppSupportAdRatingFooter_0 and v11.shouldSizeToContentWidth then Enum.AutomaticSize.X else Enum.AutomaticSize.None, 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = v17.FontSize, 
            Font = v17.Font, 
            TextTransparency = v16.Transparency, 
            TextColor3 = v16.Color3, 
            TextWrapped = v11.TextWrapped or false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = v11.TextYAlignment or Enum.TextYAlignment.Center, 
            ClipsDescendants = v11.ClipsDescendants, 
            RichText = v11.RichText
        })
    });
end;