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
local v16 = l_Images_0["icons/status/games/rating_small"];
local v17 = l_Images_0["icons/status/games/people-playing_small"];
local v18 = Vector2.new(1e999, 1e999);
return function(v19) --[[ Line: 54 ]] --[[ Name: GridTileGameStats ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), l_FFlagLuaAppFixSmallScreenFooterStatsOverlap_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v13 (copy), l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 (copy), v9 (copy), v3 (copy), l_TextService_0 (copy), v18 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v17 (copy)
    local v20 = l_useDesignTokens_0();
    local v21 = l_useTextSizeOffset_0();
    local v22 = l_useTokens_0();
    local v23 = if l_FFlagLuaAppFixSmallScreenFooterStatsOverlap_0 then l_useBreakpointXOrSmaller_0(v11.Keys.XSmall) and v19.gameTileLayoutType == v13.GameTileLayoutType.Narrow else false;
    local v24 = l_useBreakpointXOrSmaller_0(v11.Keys.Small) and v19.gameTileLayoutType == v13.GameTileLayoutType.Narrow;
    local v25 = if v19.isUnifiedGameTile then if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then v22.Size.Size_500 else v22.Size.Size_300 else if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then v20.Global.Space_250 else v20.Global.Space_150;
    local v26 = if v19.isUnifiedGameTile then if v23 then v22.Gap.XXSmall else v22.Gap.XSmall else v20.Global.Space_50;
    local v27 = if v19.isUnifiedGameTile then if l_FFlagLuaAppMigrateGameTileFooterValueFixes_0 then if v23 then v22.Gap.XXSmall else v22.Gap.Small else v22.Gap.Medium else v20.Global.Space_100;
    local v28 = if v19.isUnifiedGameTile then v22.Color.Content.Default else v20.Semantic.Color.Text.Default;
    local v29 = v9(v19.useLargerFont, v20, v22 or nil, v19.isUnifiedGameTile and true or nil);
    local l_FontSize_0 = v29.FontSize;
    local l_Font_0 = v29.Font;
    local v32 = false;
    if v21 > 0 then
        v32 = v24;
    end;
    local v33 = l_FontSize_0 / 1.26;
    local l_ratingText_0 = v19.ratingText;
    local v35 = v3.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: l_ratingText_0 (copy), l_TextService_0 (ref), l_FontSize_0 (copy), l_Font_0 (copy), v18 (ref)
        if l_ratingText_0 == nil or l_ratingText_0 == "" then
            return 0;
        else
            return l_TextService_0:GetTextSize(l_ratingText_0, l_FontSize_0, l_Font_0, v18).X;
        end;
    end, {
        l_ratingText_0, 
        l_FontSize_0, 
        l_Font_0, 
        v21
    });
    local v36 = v33 + v26 + v35 + v27;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, v32 and 1 or 0, v32 and 0 or v25 + v21), 
        Position = v19.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.LayoutOrder
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = if v32 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = if v32 then nil else UDim.new(0, v27)
        }), 
        RatingsFrame = v3.createElement("Frame", {
            Size = UDim2.new(0, v35 + v33 + v26, 0, v25 + v21), 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, {
            RatingIconSlot = v3.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v33, v33), 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v16, 
                    ImageColor3 = v28.Color3, 
                    ImageTransparency = 0, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(v33, v33), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1
                })
            }), 
            RatingText = v3.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = l_ratingText_0, 
                Size = UDim2.new(0, v35 + v26, 0, l_FontSize_0 + v21), 
                Position = UDim2.new(0, v33 + v26, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                TextSize = l_FontSize_0, 
                Font = v29.Font, 
                TextTransparency = v28.Transparency, 
                TextColor3 = v28.Color3, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        }), 
        PlayerCountFrame = v3.createElement("Frame", {
            Size = if v32 then UDim2.new(1, 0, 0, v25 + v21) else UDim2.new(1, -v36, 0, v25 + v21), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            PlayerCountIconSlot = v3.createElement("Frame", {
                Position = UDim2.new(0, 0, 0.5, 0), 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v33, v33), 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5)
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    Image = v17, 
                    ImageColor3 = v28.Color3, 
                    ImageTransparency = 0, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromOffset(v33, v33), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1
                })
            }), 
            PlayerCountText = v3.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v19.playerCountText, 
                Size = UDim2.new(1, -v33 - v26, 0, l_FontSize_0 + v21), 
                Position = UDim2.new(0, v33 + v26, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                TextSize = v29.FontSize, 
                Font = v29.Font, 
                TextTransparency = v28.Transparency, 
                TextColor3 = v28.Color3, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;