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
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local v19 = l_Images_0["icons/status/games/rating_small"];
local v20 = l_Images_0["icons/status/games/people-playing_small"];
local v21 = Vector2.new(1e999, 1e999);
return function(v22) --[[ Line: 60 ]] --[[ Name: GridTileGameStats ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), l_FFlagLuaAppFixSmallScreenFooterStatsOverlap_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v13 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 (copy), v9 (copy), v3 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_TextService_0 (copy), v21 (copy), l_ImageSetLabel_0 (copy), v19 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), v20 (copy)
    local v23 = l_useDesignTokens_0();
    local v24 = l_useTextSizeOffset_0();
    local v25 = l_useTokens_0();
    local v26 = if l_FFlagLuaAppFixSmallScreenFooterStatsOverlap_0 then l_useBreakpointXOrSmaller_0(v11.Keys.XSmall) and v22.gameTileLayoutType == v13.GameTileLayoutType.Narrow else false;
    local v27 = l_useBreakpointXOrSmaller_0(v11.Keys.Small) and v22.gameTileLayoutType == v13.GameTileLayoutType.Narrow;
    local v28 = v26 or l_FFlagLuaAppNarrowTileSmallerFooterFont_0 and v22.compactMetadataFormat;
    local v29 = if v22.isUnifiedGameTile then if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then v25.Size.Size_500 else v25.Size.Size_300 else if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then v23.Global.Space_250 else v23.Global.Space_150;
    local v30 = if v22.isUnifiedGameTile then if v28 then v25.Gap.XXSmall else v25.Gap.XSmall else v23.Global.Space_50;
    local v31 = if v22.isUnifiedGameTile then if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then if v26 then v25.Gap.XXSmall else v25.Gap.Small else v25.Gap.Medium else v23.Global.Space_100;
    local v32 = if v22.isUnifiedGameTile then v25.Color.Content.Default else v23.Semantic.Color.Text.Default;
    local v33 = v9(v22.useLargerFont, v23, v25 or nil, v22.isUnifiedGameTile and true or nil, if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v22.compactMetadataFormat else nil);
    local l_FontSize_0 = v33.FontSize;
    local l_Font_0 = v33.Font;
    local v36 = false;
    if v24 > 0 then
        v36 = v27;
    end;
    local v37 = l_FontSize_0 / 1.26;
    local l_ratingText_0 = v22.ratingText;
    local v39 = v3.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: l_FFlagLuaAppNarrowTileHideRating_0 (ref), v22 (copy), l_ratingText_0 (copy), l_TextService_0 (ref), l_FontSize_0 (copy), l_Font_0 (copy), v21 (ref)
        if l_FFlagLuaAppNarrowTileHideRating_0 and v22.hideRating or l_ratingText_0 == nil or l_ratingText_0 == "" then
            return 0;
        else
            return l_TextService_0:GetTextSize(l_ratingText_0, l_FontSize_0, l_Font_0, v21).X;
        end;
    end, {
        l_ratingText_0, 
        l_FontSize_0, 
        l_Font_0, 
        v24, 
        if l_FFlagLuaAppNarrowTileHideRating_0 then v22.hideRating else nil
    });
    local v40 = v37 + v30 + v39 + v31;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, v36 and 1 or 0, v36 and 0 or v29 + v24), 
        Position = v22.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1, 
        LayoutOrder = v22.LayoutOrder
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = if v36 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = if v36 then nil else UDim.new(0, v31)
        }), 
        RatingsFrame = if l_FFlagLuaAppNarrowTileHideRating_0 and v22.hideRating then nil else v3.createElement("Frame", {
            Size = UDim2.new(0, v39 + v37 + v30, 0, v29 + v24), 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, {
            RatingIconSlot = v3.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v37, v37), 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v19, 
                    ImageColor3 = v32.Color3, 
                    ImageTransparency = 0, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(v37, v37), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1
                })
            }), 
            RatingText = v3.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = l_ratingText_0, 
                Size = UDim2.new(0, v39 + v30, 0, l_FontSize_0 + v24), 
                Position = UDim2.new(0, v37 + v30, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                TextSize = l_FontSize_0, 
                Font = v33.Font, 
                TextTransparency = v32.Transparency, 
                TextColor3 = v32.Color3, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        }), 
        PlayerCountFrame = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 and v22.hidePlayerCount then nil else v3.createElement("Frame", {
            Size = if v36 then UDim2.new(1, 0, 0, v29 + v24) else if l_FFlagLuaAppNarrowTileHideRating_0 and v22.hideRating then UDim2.new(1, 0, 0, v29 + v24) else UDim2.new(1, -v40, 0, v29 + v24), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            PlayerCountIconSlot = v3.createElement("Frame", {
                Position = UDim2.new(0, 0, 0.5, 0), 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v37, v37), 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v20, 
                    ImageColor3 = v32.Color3, 
                    ImageTransparency = 0, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(v37, v37), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1
                })
            }), 
            PlayerCountText = v3.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v22.playerCountText, 
                Size = UDim2.new(1, -v37 - v30, 0, l_FontSize_0 + v24), 
                Position = UDim2.new(0, v37 + v30, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                TextSize = v33.FontSize, 
                Font = v33.Font, 
                TextTransparency = v32.Transparency, 
                TextColor3 = v32.Color3, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;