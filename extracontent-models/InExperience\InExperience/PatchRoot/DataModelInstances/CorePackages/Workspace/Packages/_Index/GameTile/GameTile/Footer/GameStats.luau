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
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local v20 = l_Images_0["icons/status/games/rating_small"];
local v21 = l_Images_0["icons/status/games/people-playing_small"];
local v22 = v6.PureComponent:extend("GameStats");
local function _(v23, v24) --[[ Line: 30 ]] --[[ Name: getRatingText ]]
    local v25 = "--";
    if v23 == nil or v23 < 0 then
        v23 = 0;
    end;
    if v24 == nil or v24 < 0 then
        v24 = 0;
    end;
    local v26 = v23 + v24;
    if v26 > 0 then
        v25 = tostring((math.floor(v23 / v26 * 100)));
    end;
    return v25;
end;
v22.renderSponsored = function(v28, v29) --[[ Line: 50 ]] --[[ Name: renderSponsored ]]
    -- upvalues: v6 (copy), l_SponsoredTooltipHover_0 (copy), l_TooltipOrientation_0 (copy), v4 (copy), l_Interactable_0 (copy), l_withLocalization_0 (copy)
    local l_Theme_0 = v29.Theme;
    local l_Font_0 = v29.Font;
    local v32 = if v28.props.useLargerFont then l_Font_0.Body else l_Font_0.CaptionHeader;
    local v33 = v32.RelativeSize * l_Font_0.BaseSize;
    local function v38(v34) --[[ Line: 57 ]]
        -- upvalues: v6 (ref), v33 (copy), l_Theme_0 (copy), v32 (copy), l_SponsoredTooltipHover_0 (ref), l_TooltipOrientation_0 (ref), v28 (copy), v4 (ref), l_Interactable_0 (ref)
        local l_sponsoredText_0 = v34.sponsoredText;
        local v36 = v6.createElement("Frame", {
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
                TextSize = v33, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = v32.Font, 
                Text = l_sponsoredText_0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            SponsoredTooltip = v6.createElement(l_SponsoredTooltipHover_0, {
                tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                onActivateTooltip = v28.props.onActivateSponsoredTooltip, 
                size = UDim2.new(0, 16, 0, 16), 
                color = l_Theme_0.TextEmphasis.Color, 
                layoutOrder = 2, 
                selectable = v4()
            })
        });
        local v37 = math.ceil(v33);
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v37), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.UIDefault.Color, 
            BackgroundTransparency = l_Theme_0.UIDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            SponsoredBlock = v6.createElement(l_Interactable_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                onStateChanged = function() --[[ Line: 105 ]] --[[ Name: onStateChanged ]]

                end, 
                [v6.Event.Activated] = v28.props.onActivateSponsoredTooltip
            }, {
                SponsoredBlockFrame = v36
            })
        });
    end;
    return l_withLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored"
    })(v38);
end;
v22.renderGameStats = function(v39, v40, v41, v42) --[[ Line: 118 ]] --[[ Name: renderGameStats ]]
    -- upvalues: v6 (copy), v1 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), l_withLocalization_0 (copy), v2 (copy), l_Images_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy)
    local l_stats_0 = v41.stats;
    local l_totalUpVotes_0 = l_stats_0.totalUpVotes;
    local l_totalDownVotes_0 = l_stats_0.totalDownVotes;
    local v46 = "--";
    if l_totalUpVotes_0 == nil or l_totalUpVotes_0 < 0 then
        l_totalUpVotes_0 = 0;
    end;
    if l_totalDownVotes_0 == nil or l_totalDownVotes_0 < 0 then
        l_totalDownVotes_0 = 0;
    end;
    local v47 = l_totalUpVotes_0 + l_totalDownVotes_0;
    if v47 > 0 then
        v46 = tostring((math.floor(l_totalUpVotes_0 / v47 * 100)));
    end;
    local l_v46_0 = v46;
    if l_stats_0.playerCount ~= nil then
        if l_stats_0.totalUpVotes + l_stats_0.totalDownVotes > 0 then
            l_v46_0 = l_v46_0 .. "%";
        end;
        if v41.isGridTile or v41.isUnifiedGameTile then
            return v6.createElement(v1, {
                playerCountText = v41.playerCountText, 
                ratingText = l_v46_0, 
                useLargerFont = v39.props.useLargerFont, 
                isUnifiedGameTile = v41.isUnifiedGameTile, 
                gameTileLayoutType = v41.gameTileLayoutType, 
                LayoutOrder = if l_FFlagLuaAppSearchGridTiles_0 then v39.props.LayoutOrder else nil
            });
        else
            return v39:renderFullGameStats(v40, v41, l_v46_0, v42);
        end;
    else
        return l_withLocalization_0({
            longRatingText = {
                "Feature.GameDetails.RatingPercentOnly"; 
                percentRating = l_v46_0
            }
        })(function(v49) --[[ Line: 141 ]]
            -- upvalues: v6 (ref), v2 (ref), l_Images_0 (ref), v39 (copy), v41 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref)
            return v6.createElement(v2, {
                icon = l_Images_0["icons/status/games/rating_small"], 
                text = v49.longRatingText, 
                styleProps = {
                    iconSize = 15, 
                    padding = 4
                }, 
                useLargerFont = v39.props.useLargerFont, 
                isUnifiedGameTile = v41.isUnifiedGameTile, 
                shouldSizeToContentWidth = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v41.shouldSizeToContentWidth else nil
            });
        end);
    end;
end;
v22.renderFullGameStats = function(_, v51, v52, v53, v54) --[[ Line: 159 ]] --[[ Name: renderFullGameStats ]]
    -- upvalues: v6 (copy), l_ImageSetLabel_0 (copy), v20 (copy), v21 (copy)
    local l_playerCount_0 = v52.stats.playerCount;
    local v56 = nil;
    if l_playerCount_0 then
        v56 = v52.playerCountText;
    end;
    local l_Theme_1 = v51.Theme;
    local l_Font_1 = v51.Font;
    local l_Font_2 = l_Font_1.CaptionSubHeader.Font;
    local v60 = l_Font_1.BaseSize * l_Font_1.CaptionSubHeader.RelativeSize;
    local v61 = math.ceil(v60);
    local v62 = v60 + v51.Tokens.Global.Size_75;
    v61 = math.min(v61 + (v54 or 0), v62);
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        VoteIcon = v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v61), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            BackgroundTransparency = 1, 
            Image = v20, 
            ImageColor3 = l_Theme_1.TextDefault.Color, 
            ImageTransparency = l_Theme_1.TextDefault.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }), 
        Vote = v6.createElement("TextLabel", {
            Size = UDim2.new(0.35, 0, 0, v61), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.15, 0.5), 
            Text = v53, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextDefault.Color, 
            TextTransparency = l_Theme_1.TextDefault.Transparency, 
            TextSize = v60, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            UiTextSizeConstraint = v6.createElement("UITextSizeConstraint", {
                MaxTextSize = v62
            })
        }), 
        PlayerIcon = if v56 ~= nil then v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v61), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Image = v21, 
            ImageColor3 = l_Theme_1.TextDefault.Color, 
            ImageTransparency = l_Theme_1.TextDefault.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }) else nil, 
        PlayerCount = if v56 ~= nil then v6.createElement("TextLabel", {
            Size = UDim2.new(0.35, 0, 0, v61), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.65, 0.5), 
            Text = v56, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextDefault.Color, 
            TextTransparency = l_Theme_1.TextDefault.Transparency, 
            TextSize = v60, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            UiTextSizeConstraint = v6.createElement("UITextSizeConstraint", {
                MaxTextSize = v62
            })
        }) else nil
    });
end;
v22.renderConcurrentUsersPill = function(_, v64, v65) --[[ Line: 244 ]] --[[ Name: renderConcurrentUsersPill ]]
    -- upvalues: v6 (copy), l_Colors_0 (copy), l_ImageSetLabel_0 (copy), v21 (copy)
    local l_playerCountText_0 = v65.playerCountText;
    local l_Font_3 = v64.Font;
    local l_Font_4 = l_Font_3.Footer.Font;
    local v69 = l_Font_3.BaseSize * l_Font_3.Footer.RelativeSize;
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
            Image = v21, 
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
            TextSize = v69, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        })
    });
end;
v22.render = function(v70) --[[ Line: 300 ]] --[[ Name: render ]]
    -- upvalues: l_withTextSizeOffset_0 (copy), l_withStyle_0 (copy)
    local l_stats_1 = v70.props.stats;
    if l_stats_1 == nil then
        return nil;
    else
        local function v74(v72, v73) --[[ Line: 306 ]]
            -- upvalues: l_stats_1 (copy), v70 (copy)
            if l_stats_1.isSponsored and l_stats_1.isShowSponsoredLabel then
                return v70:renderSponsored(v72);
            elseif l_stats_1.displayConcurrentUsersPill then
                return v70:renderConcurrentUsersPill(v72, v70.props);
            elseif v70.props.hideGameStats then
                return nil;
            else
                return v70:renderGameStats(v72, v70.props, v73);
            end;
        end;
        return l_withTextSizeOffset_0(function(v75) --[[ Line: 321 ]]
            -- upvalues: l_withStyle_0 (ref), v74 (copy)
            return l_withStyle_0(function(v76) --[[ Line: 322 ]]
                -- upvalues: v74 (ref), v75 (copy)
                return v74(v76, v75);
            end);
        end);
    end;
end;
local l_v22_0 = v22;
return function(v78) --[[ Line: 329 ]]
    -- upvalues: v3 (copy), v6 (copy), l_v22_0 (copy), v8 (copy)
    local v79 = v78.stats and v78.stats.playerCount or nil;
    local v80 = v3(v79);
    return v6.createElement(l_v22_0, v8.Dictionary.join(v78, {
        playerCountText = v80
    }));
end;