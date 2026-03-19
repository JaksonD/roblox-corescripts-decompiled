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
local v19 = l_Images_0["icons/status/games/rating_small"];
local v20 = l_Images_0["icons/status/games/people-playing_small"];
local v21 = v6.PureComponent:extend("GameStats");
local function _(v22, v23) --[[ Line: 29 ]] --[[ Name: getRatingText ]]
    local v24 = "--";
    if v22 == nil or v22 < 0 then
        v22 = 0;
    end;
    if v23 == nil or v23 < 0 then
        v23 = 0;
    end;
    local v25 = v22 + v23;
    if v25 > 0 then
        v24 = tostring((math.floor(v22 / v25 * 100)));
    end;
    return v24;
end;
v21.renderSponsored = function(v27, v28) --[[ Line: 49 ]] --[[ Name: renderSponsored ]]
    -- upvalues: v6 (copy), l_SponsoredTooltipHover_0 (copy), l_TooltipOrientation_0 (copy), v4 (copy), l_Interactable_0 (copy), l_withLocalization_0 (copy)
    local l_Theme_0 = v28.Theme;
    local l_Font_0 = v28.Font;
    local v31 = if v27.props.useLargerFont then l_Font_0.Body else l_Font_0.CaptionHeader;
    local v32 = v31.RelativeSize * l_Font_0.BaseSize;
    local function v37(v33) --[[ Line: 56 ]]
        -- upvalues: v6 (ref), v32 (copy), l_Theme_0 (copy), v31 (copy), l_SponsoredTooltipHover_0 (ref), l_TooltipOrientation_0 (ref), v27 (copy), v4 (ref), l_Interactable_0 (ref)
        local l_sponsoredText_0 = v33.sponsoredText;
        local v35 = v6.createElement("Frame", {
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
                TextSize = v32, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = v31.Font, 
                Text = l_sponsoredText_0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            SponsoredTooltip = v6.createElement(l_SponsoredTooltipHover_0, {
                tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                onActivateTooltip = v27.props.onActivateSponsoredTooltip, 
                size = UDim2.new(0, 16, 0, 16), 
                color = l_Theme_0.TextEmphasis.Color, 
                layoutOrder = 2, 
                selectable = v4()
            })
        });
        local v36 = math.ceil(v32);
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v36), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.UIDefault.Color, 
            BackgroundTransparency = l_Theme_0.UIDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            SponsoredBlock = v6.createElement(l_Interactable_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                onStateChanged = function() --[[ Line: 104 ]] --[[ Name: onStateChanged ]]

                end, 
                [v6.Event.Activated] = v27.props.onActivateSponsoredTooltip
            }, {
                SponsoredBlockFrame = v35
            })
        });
    end;
    return l_withLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored"
    })(v37);
end;
v21.renderGameStats = function(v38, v39, v40, v41) --[[ Line: 117 ]] --[[ Name: renderGameStats ]]
    -- upvalues: v6 (copy), v1 (copy), l_withLocalization_0 (copy), v2 (copy), l_Images_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy)
    local l_stats_0 = v40.stats;
    local l_totalUpVotes_0 = l_stats_0.totalUpVotes;
    local l_totalDownVotes_0 = l_stats_0.totalDownVotes;
    local v45 = "--";
    if l_totalUpVotes_0 == nil or l_totalUpVotes_0 < 0 then
        l_totalUpVotes_0 = 0;
    end;
    if l_totalDownVotes_0 == nil or l_totalDownVotes_0 < 0 then
        l_totalDownVotes_0 = 0;
    end;
    local v46 = l_totalUpVotes_0 + l_totalDownVotes_0;
    if v46 > 0 then
        v45 = tostring((math.floor(l_totalUpVotes_0 / v46 * 100)));
    end;
    local l_v45_0 = v45;
    if l_stats_0.playerCount ~= nil then
        if l_stats_0.totalUpVotes + l_stats_0.totalDownVotes > 0 then
            l_v45_0 = l_v45_0 .. "%";
        end;
        if v40.isGridTile or v40.isUnifiedGameTile then
            return v6.createElement(v1, {
                playerCountText = v40.playerCountText, 
                ratingText = l_v45_0, 
                useLargerFont = v38.props.useLargerFont, 
                isUnifiedGameTile = v40.isUnifiedGameTile, 
                gameTileLayoutType = v40.gameTileLayoutType, 
                LayoutOrder = v38.props.LayoutOrder
            });
        else
            return v38:renderFullGameStats(v39, v40, l_v45_0, v41);
        end;
    else
        return l_withLocalization_0({
            longRatingText = {
                "Feature.GameDetails.RatingPercentOnly"; 
                percentRating = l_v45_0
            }
        })(function(v48) --[[ Line: 140 ]]
            -- upvalues: v6 (ref), v2 (ref), l_Images_0 (ref), v38 (copy), v40 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref)
            return v6.createElement(v2, {
                icon = l_Images_0["icons/status/games/rating_small"], 
                text = v48.longRatingText, 
                styleProps = {
                    iconSize = 15, 
                    padding = 4
                }, 
                useLargerFont = v38.props.useLargerFont, 
                isUnifiedGameTile = v40.isUnifiedGameTile, 
                shouldSizeToContentWidth = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v40.shouldSizeToContentWidth else nil
            });
        end);
    end;
end;
v21.renderFullGameStats = function(_, v50, v51, v52, v53) --[[ Line: 158 ]] --[[ Name: renderFullGameStats ]]
    -- upvalues: v6 (copy), l_ImageSetLabel_0 (copy), v19 (copy), v20 (copy)
    local l_playerCount_0 = v51.stats.playerCount;
    local v55 = nil;
    if l_playerCount_0 then
        v55 = v51.playerCountText;
    end;
    local l_Theme_1 = v50.Theme;
    local l_Font_1 = v50.Font;
    local l_Font_2 = l_Font_1.CaptionSubHeader.Font;
    local v59 = l_Font_1.BaseSize * l_Font_1.CaptionSubHeader.RelativeSize;
    local v60 = math.ceil(v59);
    local v61 = v59 + v50.Tokens.Global.Size_75;
    v60 = math.min(v60 + (v53 or 0), v61);
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        VoteIcon = v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v60), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            BackgroundTransparency = 1, 
            Image = v19, 
            ImageColor3 = l_Theme_1.TextDefault.Color, 
            ImageTransparency = l_Theme_1.TextDefault.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }), 
        Vote = v6.createElement("TextLabel", {
            Size = UDim2.new(0.35, 0, 0, v60), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.15, 0.5), 
            Text = v52, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextDefault.Color, 
            TextTransparency = l_Theme_1.TextDefault.Transparency, 
            TextSize = v59, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            UiTextSizeConstraint = v6.createElement("UITextSizeConstraint", {
                MaxTextSize = v61
            })
        }), 
        PlayerIcon = if v55 ~= nil then v6.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0.125, 0, 0, v60), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Image = v20, 
            ImageColor3 = l_Theme_1.TextDefault.Color, 
            ImageTransparency = l_Theme_1.TextDefault.Transparency, 
            ScaleType = Enum.ScaleType.Fit
        }) else nil, 
        PlayerCount = if v55 ~= nil then v6.createElement("TextLabel", {
            Size = UDim2.new(0.35, 0, 0, v60), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.65, 0.5), 
            Text = v55, 
            Font = l_Font_2, 
            TextColor3 = l_Theme_1.TextDefault.Color, 
            TextTransparency = l_Theme_1.TextDefault.Transparency, 
            TextSize = v59, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            UiTextSizeConstraint = v6.createElement("UITextSizeConstraint", {
                MaxTextSize = v61
            })
        }) else nil
    });
end;
v21.renderConcurrentUsersPill = function(_, v63, v64) --[[ Line: 243 ]] --[[ Name: renderConcurrentUsersPill ]]
    -- upvalues: v6 (copy), l_Colors_0 (copy), l_ImageSetLabel_0 (copy), v20 (copy)
    local l_playerCountText_0 = v64.playerCountText;
    local l_Font_3 = v63.Font;
    local l_Font_4 = l_Font_3.Footer.Font;
    local v68 = l_Font_3.BaseSize * l_Font_3.Footer.RelativeSize;
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
            Image = v20, 
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
            TextSize = v68, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        })
    });
end;
v21.render = function(v69) --[[ Line: 299 ]] --[[ Name: render ]]
    -- upvalues: l_withTextSizeOffset_0 (copy), l_withStyle_0 (copy)
    local l_stats_1 = v69.props.stats;
    if l_stats_1 == nil then
        return nil;
    else
        local function v73(v71, v72) --[[ Line: 305 ]]
            -- upvalues: l_stats_1 (copy), v69 (copy)
            if l_stats_1.isSponsored and l_stats_1.isShowSponsoredLabel then
                return v69:renderSponsored(v71);
            elseif l_stats_1.displayConcurrentUsersPill then
                return v69:renderConcurrentUsersPill(v71, v69.props);
            elseif v69.props.hideGameStats then
                return nil;
            else
                return v69:renderGameStats(v71, v69.props, v72);
            end;
        end;
        return l_withTextSizeOffset_0(function(v74) --[[ Line: 320 ]]
            -- upvalues: l_withStyle_0 (ref), v73 (copy)
            return l_withStyle_0(function(v75) --[[ Line: 321 ]]
                -- upvalues: v73 (ref), v74 (copy)
                return v73(v75, v74);
            end);
        end);
    end;
end;
local l_v21_0 = v21;
return function(v77) --[[ Line: 328 ]]
    -- upvalues: v3 (copy), v6 (copy), l_v21_0 (copy), v8 (copy)
    local v78 = v77.stats and v77.stats.playerCount or nil;
    local v79 = v3(v78);
    return v6.createElement(l_v21_0, v8.Dictionary.join(v77, {
        playerCountText = v79
    }));
end;