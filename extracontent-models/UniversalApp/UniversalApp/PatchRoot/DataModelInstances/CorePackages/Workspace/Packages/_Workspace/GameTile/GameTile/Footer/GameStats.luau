local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.Footer.GridTileGameStats);
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local v3 = require(l_script_FirstAncestor_0.Footer.usePlayerCountText);
local v4 = require(l_script_FirstAncestor_0.Footer.getUserInputIsSelectionOnly);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Roact);
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_withTextSizeOffset_0 = v9.Core.Style.withTextSizeOffset;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v9.App.ImageSet.Images;
local l_Interactable_0 = v9.Core.Control.Interactable;
local l_TooltipOrientation_0 = v9.App.Dialog.Enum.TooltipOrientation;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_SponsoredTooltipHover_0 = require(l_Parent_0.Ads).SponsoredTooltipHover;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local v22 = l_Images_0["icons/status/games/rating_small"];
local v23 = l_Images_0["icons/status/games/people-playing_small"];
local v24 = v6.PureComponent:extend("GameStats");
local function _(v25, v26) --[[ Line: 32 ]] --[[ Name: getRatingText ]]
    local v27 = "--";
    if v25 == nil or v25 < 0 then
        v25 = 0;
    end;
    if v26 == nil or v26 < 0 then
        v26 = 0;
    end;
    local v28 = v25 + v26;
    if v28 > 0 then
        v27 = tostring((math.floor(v25 / v28 * 100)));
    end;
    return v27;
end;
v24.renderSponsored = function(v30, v31) --[[ Line: 52 ]] --[[ Name: renderSponsored ]]
    -- upvalues: v6 (copy), l_SponsoredTooltipHover_0 (copy), l_TooltipOrientation_0 (copy), v4 (copy), l_Interactable_0 (copy), l_withLocalization_0 (copy)
    local l_Theme_0 = v31.Theme;
    local l_Font_0 = v31.Font;
    local v34 = if v30.props.useLargerFont then l_Font_0.Body else l_Font_0.CaptionHeader;
    local v35 = v34.RelativeSize * l_Font_0.BaseSize;
    local function v40(v36) --[[ Line: 59 ]]
        -- upvalues: v6 (ref), v35 (copy), l_Theme_0 (copy), v34 (copy), l_SponsoredTooltipHover_0 (ref), l_TooltipOrientation_0 (ref), v30 (copy), v4 (ref), l_Interactable_0 (ref)
        local l_sponsoredText_0 = v36.sponsoredText;
        local v38 = v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Layout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            SponsoredText = v6.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextSize = v35, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = v34.Font, 
                Text = l_sponsoredText_0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            SponsoredTooltip = v6.createElement(l_SponsoredTooltipHover_0, {
                tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                onActivateTooltip = v30.props.onActivateSponsoredTooltip, 
                size = UDim2.new(0, 16, 0, 16), 
                color = l_Theme_0.TextEmphasis.Color, 
                layoutOrder = 2, 
                selectable = v4()
            })
        });
        local v39 = math.ceil(v35);
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v39), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.UIDefault.Color, 
            BackgroundTransparency = l_Theme_0.UIDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            SponsoredBlock = v6.createElement(l_Interactable_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                onStateChanged = function() --[[ Line: 107 ]] --[[ Name: onStateChanged ]]

                end, 
                [v6.Event.Activated] = v30.props.onActivateSponsoredTooltip
            }, {
                SponsoredBlockFrame = v38
            })
        });
    end;
    return l_withLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored"
    })(v40);
end;
v24.renderGameStats = function(v41, v42, v43, v44) --[[ Line: 120 ]] --[[ Name: renderGameStats ]]
    -- upvalues: v6 (copy), v1 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), l_withLocalization_0 (copy), v2 (copy), l_Images_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy)
    local l_stats_0 = v43.stats;
    local l_totalUpVotes_0 = l_stats_0.totalUpVotes;
    local l_totalDownVotes_0 = l_stats_0.totalDownVotes;
    local v48 = "--";
    if l_totalUpVotes_0 == nil or l_totalUpVotes_0 < 0 then
        l_totalUpVotes_0 = 0;
    end;
    if l_totalDownVotes_0 == nil or l_totalDownVotes_0 < 0 then
        l_totalDownVotes_0 = 0;
    end;
    local v49 = l_totalUpVotes_0 + l_totalDownVotes_0;
    if v49 > 0 then
        v48 = tostring((math.floor(l_totalUpVotes_0 / v49 * 100)));
    end;
    local l_v48_0 = v48;
    if l_stats_0.playerCount ~= nil then
        if l_stats_0.totalUpVotes + l_stats_0.totalDownVotes > 0 then
            l_v48_0 = l_v48_0 .. "%";
        end;
        if v43.isGridTile or v43.isUnifiedGameTile then
            return v6.createElement(v1, {
                playerCountText = v43.playerCountText, 
                ratingText = l_v48_0, 
                useLargerFont = v41.props.useLargerFont, 
                isUnifiedGameTile = v43.isUnifiedGameTile, 
                gameTileLayoutType = v43.gameTileLayoutType, 
                LayoutOrder = v41.props.LayoutOrder, 
                compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v43.compactMetadataFormat else nil, 
                hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v43.hideRating else nil, 
                hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v43.hidePlayerCount else nil
            });
        else
            return v41:renderFullGameStats(v42, v43, l_v48_0, v44);
        end;
    else
        return l_withLocalization_0({
            longRatingText = {
                "Feature.GameDetails.RatingPercentOnly"; 
                percentRating = l_v48_0
            }
        })(function(v51) --[[ Line: 148 ]]
            -- upvalues: v6 (ref), v2 (ref), l_Images_0 (ref), v41 (copy), v43 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref)
            return v6.createElement(v2, {
                icon = l_Images_0["icons/status/games/rating_small"], 
                text = v51.longRatingText, 
                styleProps = {
                    iconSize = 15, 
                    padding = 4
                }, 
                useLargerFont = v41.props.useLargerFont, 
                isUnifiedGameTile = v43.isUnifiedGameTile, 
                shouldSizeToContentWidth = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v43.shouldSizeToContentWidth else nil
            });
        end);
    end;
end;
v24.renderFullGameStats = function(_, v53, v54, v55, v56) --[[ Line: 166 ]] --[[ Name: renderFullGameStats ]]
    -- upvalues: v6 (copy), l_ImageSetLabel_0 (copy), v22 (copy), v23 (copy)
    local l_playerCount_0 = v54.stats.playerCount;
    local v58 = nil;
    if l_playerCount_0 then
        v58 = v54.playerCountText;
    end;
    local l_Theme_1 = v53.Theme;
    local l_Font_1 = v53.Font;
    local l_Font_2 = l_Font_1.CaptionSubHeader.Font;
    local v62 = l_Font_1.BaseSize * l_Font_1.CaptionSubHeader.RelativeSize;
    local v63 = math.ceil(v62);
    local v64 = v62 + v53.Tokens.Global.Size_75;
    v63 = math.min(v63 + (v56 or 0), v64);
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        VoteIcon = v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v63), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            BackgroundTransparency = 1, 
            Image = v22, 
            ImageColor3 = l_Theme_1.TextDefault.Color, 
            ImageTransparency = l_Theme_1.TextDefault.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }), 
        Vote = v6.createElement("TextLabel", {
            Size = UDim2.new(0.35, 0, 0, v63), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.15, 0.5), 
            Text = v55, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextDefault.Color, 
            TextTransparency = l_Theme_1.TextDefault.Transparency, 
            TextSize = v62, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            UiTextSizeConstraint = v6.createElement("UITextSizeConstraint", {
                MaxTextSize = v64
            })
        }), 
        PlayerIcon = if v58 ~= nil then v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v63), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Image = v23, 
            ImageColor3 = l_Theme_1.TextDefault.Color, 
            ImageTransparency = l_Theme_1.TextDefault.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }) else nil, 
        PlayerCount = if v58 ~= nil then v6.createElement("TextLabel", {
            Size = UDim2.new(0.35, 0, 0, v63), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.65, 0.5), 
            Text = v58, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextDefault.Color, 
            TextTransparency = l_Theme_1.TextDefault.Transparency, 
            TextSize = v62, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            UiTextSizeConstraint = v6.createElement("UITextSizeConstraint", {
                MaxTextSize = v64
            })
        }) else nil
    });
end;
v24.renderConcurrentUsersPill = function(_, v66, v67) --[[ Line: 251 ]] --[[ Name: renderConcurrentUsersPill ]]
    -- upvalues: v6 (copy), l_Colors_0 (copy), l_ImageSetLabel_0 (copy), v23 (copy)
    local l_playerCountText_0 = v67.playerCountText;
    local l_Font_3 = v66.Font;
    local l_Font_4 = l_Font_3.Footer.Font;
    local v71 = l_Font_3.BaseSize * l_Font_3.Footer.RelativeSize;
    return v6.createElement("Frame", {
        Size = UDim2.new(0, 0, 0, 23), 
        Position = UDim2.new(1, -8, 1, -8), 
        AnchorPoint = Vector2.new(1, 1), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Colors_0.Black
    }, {
        Corner = v6.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Padding = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 2), 
            PaddingRight = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 2), 
            PaddingLeft = UDim.new(0, 15)
        }), 
        Layout = v6.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Padding = UDim.new(0.15, 0)
        }), 
        PillIcon = v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.7, 0, 0.7, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Image = v23, 
            ImageColor3 = l_Colors_0.White, 
            ImageTransparency = 0, 
            ScaleType = Enum.ScaleType.Fit
        }), 
        PillPlayerCount = v6.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Text = l_playerCountText_0, 
            Font = l_Font_4, 
            TextColor3 = l_Colors_0.White, 
            TextTransparency = 0, 
            TextSize = v71, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        })
    });
end;
v24.render = function(v72) --[[ Line: 307 ]] --[[ Name: render ]]
    -- upvalues: l_withTextSizeOffset_0 (copy), l_withStyle_0 (copy)
    local l_stats_1 = v72.props.stats;
    if l_stats_1 == nil then
        return nil;
    else
        local function v76(v74, v75) --[[ Line: 313 ]]
            -- upvalues: l_stats_1 (copy), v72 (copy)
            if l_stats_1.isSponsored and l_stats_1.isShowSponsoredLabel then
                return v72:renderSponsored(v74);
            elseif l_stats_1.displayConcurrentUsersPill then
                return v72:renderConcurrentUsersPill(v74, v72.props);
            elseif v72.props.hideGameStats then
                return nil;
            else
                return v72:renderGameStats(v74, v72.props, v75);
            end;
        end;
        return l_withTextSizeOffset_0(function(v77) --[[ Line: 328 ]]
            -- upvalues: l_withStyle_0 (ref), v76 (copy)
            return l_withStyle_0(function(v78) --[[ Line: 329 ]]
                -- upvalues: v76 (ref), v77 (copy)
                return v76(v78, v77);
            end);
        end);
    end;
end;
local l_v24_0 = v24;
return function(v80) --[[ Line: 336 ]]
    -- upvalues: v3 (copy), v6 (copy), l_v24_0 (copy), v8 (copy)
    local v81 = v80.stats and v80.stats.playerCount or nil;
    local v82 = v3(v81);
    return v6.createElement(l_v24_0, v8.Dictionary.join(v80, {
        playerCountText = v82
    }));
end;