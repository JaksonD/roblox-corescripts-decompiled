local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v9 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local l_useTextSizeOffset_0 = v6.Core.Style.useTextSizeOffset;
local v11 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v11.useBreakpointXOrSmaller;
local v13 = require(l_script_FirstAncestor_0.GameTileTypes);
local l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileFooterValueFixes;
local l_FFlagLuaAppFixSmallScreenFooterStatsOverlap_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixSmallScreenFooterStatsOverlap;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local v17 = l_Images_0["icons/status/games/rating_small"];
local v18 = l_Images_0["icons/status/games/people-playing_small"];
local v19 = Vector2.new(1e999, 1e999);
return function(v20) --[[ Line: 55 ]] --[[ Name: GridTileGameStats ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), l_FFlagLuaAppFixSmallScreenFooterStatsOverlap_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v13 (copy), l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 (copy), v9 (copy), v3 (copy), l_TextService_0 (copy), v19 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), l_ImageSetLabel_0 (copy), v17 (copy), v18 (copy)
    local v21 = l_useDesignTokens_0();
    local v22 = l_useTextSizeOffset_0();
    local v23 = l_useTokens_0();
    local v24 = if l_FFlagLuaAppFixSmallScreenFooterStatsOverlap_0 then l_useBreakpointXOrSmaller_0(v11.Keys.XSmall) and v20.gameTileLayoutType == v13.GameTileLayoutType.Narrow else false;
    local v25 = l_useBreakpointXOrSmaller_0(v11.Keys.Small) and v20.gameTileLayoutType == v13.GameTileLayoutType.Narrow;
    local v26 = if v20.isUnifiedGameTile then if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then v23.Size.Size_500 else v23.Size.Size_300 else if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then v21.Global.Space_250 else v21.Global.Space_150;
    local v27 = if v20.isUnifiedGameTile then if v24 then v23.Gap.XXSmall else v23.Gap.XSmall else v21.Global.Space_50;
    local v28 = if v20.isUnifiedGameTile then if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then if v24 then v23.Gap.XXSmall else v23.Gap.Small else v23.Gap.Medium else v21.Global.Space_100;
    local v29 = if v20.isUnifiedGameTile then v23.Color.Content.Default else v21.Semantic.Color.Text.Default;
    local v30 = v9(v20.useLargerFont, v21, v23 or nil, v20.isUnifiedGameTile and true or nil);
    local l_FontSize_0 = v30.FontSize;
    local l_Font_0 = v30.Font;
    local v33 = false;
    if v22 > 0 then
        v33 = v25;
    end;
    local v34 = l_FontSize_0 / 1.26;
    local l_ratingText_0 = v20.ratingText;
    local v36 = v3.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: l_ratingText_0 (copy), l_TextService_0 (ref), l_FontSize_0 (copy), l_Font_0 (copy), v19 (ref)
        if l_ratingText_0 == nil or l_ratingText_0 == "" then
            return 0;
        else
            return l_TextService_0:GetTextSize(l_ratingText_0, l_FontSize_0, l_Font_0, v19).X;
        end;
    end, {
        l_ratingText_0, 
        l_FontSize_0, 
        l_Font_0, 
        v22
    });
    local v37 = v34 + v27 + v36 + v28;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, v33 and 1 or 0, v33 and 0 or v26 + v22), 
        Position = v20.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1, 
        LayoutOrder = if l_FFlagLuaAppSearchGridTiles_0 then v20.LayoutOrder else nil
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = if v33 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = if v33 then nil else UDim.new(0, v28)
        }), 
        RatingsFrame = v3.createElement("Frame", {
            Size = UDim2.new(0, v36 + v34 + v27, 0, v26 + v22), 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, {
            RatingIconSlot = v3.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v34, v34), 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v17, 
                    ImageColor3 = v29.Color3, 
                    ImageTransparency = 0, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(v34, v34), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1
                })
            }), 
            RatingText = v3.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = l_ratingText_0, 
                Size = UDim2.new(0, v36 + v27, 0, l_FontSize_0 + v22), 
                Position = UDim2.new(0, v34 + v27, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                TextSize = l_FontSize_0, 
                Font = v30.Font, 
                TextTransparency = v29.Transparency, 
                TextColor3 = v29.Color3, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        }), 
        PlayerCountFrame = v3.createElement("Frame", {
            Size = if v33 then UDim2.new(1, 0, 0, v26 + v22) else UDim2.new(1, -v37, 0, v26 + v22), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            PlayerCountIconSlot = v3.createElement("Frame", {
                Position = UDim2.new(0, 0, 0.5, 0), 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v34, v34), 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v18, 
                    ImageColor3 = v29.Color3, 
                    ImageTransparency = 0, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(v34, v34), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1
                })
            }), 
            PlayerCountText = v3.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v20.playerCountText, 
                Size = UDim2.new(1, -v34 - v27, 0, l_FontSize_0 + v22), 
                Position = UDim2.new(0, v34 + v27, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                TextSize = v30.FontSize, 
                Font = v30.Font, 
                TextTransparency = v29.Transparency, 
                TextColor3 = v29.Color3, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;