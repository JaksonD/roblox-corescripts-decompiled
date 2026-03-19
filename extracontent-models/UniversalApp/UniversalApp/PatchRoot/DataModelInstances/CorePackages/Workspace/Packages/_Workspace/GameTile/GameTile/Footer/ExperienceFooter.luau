local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.Footer.CoPlayFooter);
local v2 = require(l_script_FirstAncestor_0.Footer.usePlayerCountText);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_StatGroup_0 = v6.App.Indicator.StatGroup;
local l_TextFooter_0 = v6.App.Tile.ExperienceTileMetadata.TextFooter;
local l_CoPlayFooter_0 = v6.App.Tile.ExperienceTileMetadata.CoPlayFooter;
local l_SocialProofFooter_0 = v6.App.Tile.ExperienceTileMetadata.SocialProofFooter;
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_SponsoredTooltipHover_0 = require(l_Parent_0.Ads).SponsoredTooltipHover;
local v18 = require(l_Parent_0.ArgCheck);
local v19 = require(l_script_FirstAncestor_0.Footer.getUserInputIsSelectionOnly);
local v20 = UDim2.fromScale(1, 1);
return function(v21) --[[ Line: 27 ]]
    -- upvalues: v18 (copy), v2 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v19 (copy), v5 (copy), l_StyledTextLabel_0 (copy), l_SponsoredTooltipHover_0 (copy), l_TooltipOrientation_0 (copy), v20 (copy), l_CoPlayFooter_0 (copy), l_Colors_0 (copy), v1 (copy), l_TextFooter_0 (copy), l_SocialProofFooter_0 (copy), l_StatGroup_0 (copy)
    if v21.automaticSize then
        v18.isNotNil(v21.size, "If props.automaticSize is defined, props.size should also be defined.  Otherwise size falls back to a 1, 1 scale for this component.");
    end;
    local v22 = v21.isSponsored and v21.isShowSponsoredLabel;
    local l_isStatsOnly_0 = v21.isStatsOnly;
    local l_isPlayable_0 = v21.isPlayable;
    local l_requiresPurchase_0 = v21.requiresPurchase;
    local v26 = v21.rating or "";
    local v27 = v21.playingCount or 0;
    local l_coPlayFriends_0 = v21.coPlayFriends;
    local l_showAgeRating_0 = v21.showAgeRating;
    local l_ageRatingTextLabel_0 = v21.ageRatingTextLabel;
    local l_useExperienceTileMetadata_0 = v21.useExperienceTileMetadata;
    local l_onActivateSponsoredTooltip_0 = v21.onActivateSponsoredTooltip;
    local v33 = v2(v27);
    local v34 = l_useStyle_0();
    local l_Font_0 = v34.Font;
    local l_Theme_0 = v34.Theme;
    local l_Global_0 = l_useDesignTokens_0().Global;
    local v38 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored", 
        notPlayableText = "Feature.ExperienceDetails.Label.NotPlayable", 
        ageRatingText = l_ageRatingTextLabel_0 or nil, 
        friendsText = l_useExperienceTileMetadata_0 and "CommonUI.Features.Label.Friends" or nil
    });
    if not l_isStatsOnly_0 then
        if v22 then
            local v39 = v19();
            local v40 = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Layout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 4)
                }), 
                SponsoredText = v5.createElement(l_StyledTextLabel_0, {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    automaticSize = Enum.AutomaticSize.X, 
                    size = UDim2.new(0, 0, 1, 0), 
                    lineHeight = 1, 
                    text = v38.sponsoredText, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    richText = false, 
                    layoutOrder = 1
                }), 
                SponsoredTooltip = v5.createElement(l_SponsoredTooltipHover_0, {
                    tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                    onActivateTooltip = l_onActivateSponsoredTooltip_0, 
                    size = UDim2.new(0, 16, 0, 16), 
                    color = l_Theme_0.TextEmphasis.Color, 
                    layoutOrder = 2, 
                    selectable = v39
                })
            });
            if l_useExperienceTileMetadata_0 then
                return (v5.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = v34.Tokens.Semantic.Color.Ui.Default.Color3, 
                    BackgroundTransparency = v34.Tokens.Semantic.Color.Ui.Default.Transparency, 
                    BorderSizePixel = 0
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    Text = v5.createElement("TextLabel", {
                        Size = UDim2.new(0, 0, 1, 0), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v38.sponsoredText, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v34.Font.CaptionHeader.Font, 
                        TextSize = v34.Font.BaseSize * v34.Font.CaptionHeader.RelativeSize, 
                        TextColor3 = v34.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                        TextTransparency = v34.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                        LayoutOrder = 1
                    }), 
                    SponsoredTooltip = v5.createElement(l_SponsoredTooltipHover_0, {
                        tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                        onActivateTooltip = l_onActivateSponsoredTooltip_0, 
                        size = UDim2.new(0, 16, 0, 16), 
                        color = v34.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                        layoutOrder = 2, 
                        selectable = v39, 
                        supportTenFootUi = true
                    })
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v34.Tokens.Semantic.Radius.Small)
                    })
                }));
            else
                return v5.createElement("Frame", {
                    Size = v21.size or v20, 
                    Position = v21.position, 
                    AnchorPoint = v21.anchorPoint, 
                    LayoutOrder = v21.layoutOrder, 
                    BackgroundTransparency = l_Theme_0.UIDefault.Transparency, 
                    BackgroundColor3 = l_Theme_0.UIDefault.Color, 
                    AutomaticSize = v21.automaticSize
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    SponsoredLabel = v40
                });
            end;
        elseif l_coPlayFriends_0 and next(l_coPlayFriends_0) then
            if l_useExperienceTileMetadata_0 then
                return v5.createElement(l_CoPlayFooter_0, {
                    users = l_coPlayFriends_0, 
                    labelText = v38.friendsText, 
                    showEmphasisBorder = true, 
                    faceGroupCount = 2, 
                    styleProps = {
                        faceWidth = l_Global_0.Size_250, 
                        faceHeight = l_Global_0.Size_250, 
                        faceGroupGap = -l_Global_0.Space_75, 
                        containerGap = l_Global_0.Space_50, 
                        badgeBorderWidth = 3, 
                        badgeHeight = l_Global_0.Size_250, 
                        fontStyle = v34.Font.CaptionHeader, 
                        badgeSpacingLeading = l_Global_0.Space_50, 
                        badgeSpacingTrailing = l_Global_0.Space_50, 
                        badgeBackgroundColor = {
                            Color = l_Colors_0.Smoke, 
                            Transparency = 0
                        }, 
                        badgeContentColor = {
                            Color = l_Colors_0.White, 
                            Transparency = 0
                        }
                    }
                });
            else
                local v41 = v5.createElement(v1, {
                    friends = l_coPlayFriends_0
                });
                return v5.createElement("Frame", {
                    Size = v21.size or v20, 
                    Position = v21.position, 
                    AnchorPoint = v21.anchorPoint, 
                    LayoutOrder = v21.layoutOrder, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = v21.automaticSize
                }, {
                    CoPlayFooter = v41
                });
            end;
        elseif l_showAgeRating_0 then
            local v42 = if v21.localizedAgeRatingTextLabel then v21.localizedAgeRatingTextLabel else v38.ageRatingText;
            if l_useExperienceTileMetadata_0 then
                return v5.createElement(l_TextFooter_0, {
                    text = v42
                });
            else
                return v5.createElement("Frame", {
                    Size = v21.size or v20, 
                    Position = v21.position, 
                    AnchorPoint = v21.anchorPoint, 
                    LayoutOrder = v21.layoutOrder, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = v21.automaticSize
                }, {
                    UIPadding = v5.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 2), 
                        PaddingRight = UDim.new(0, 0), 
                        PaddingBottom = UDim.new(0, 2), 
                        PaddingLeft = UDim.new(0, 0)
                    }), 
                    AgeRatingLabel = v5.createElement(l_StyledTextLabel_0, {
                        colorStyle = l_Theme_0.TextEmphasis, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        size = UDim2.new(1, 0, 2, 0), 
                        lineHeight = 1, 
                        text = v42, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        richText = false
                    })
                });
            end;
        elseif v21.showFriendActivity and not l_useExperienceTileMetadata_0 then
            local l_Font_1 = l_Font_0.Body.Font;
            local v44 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            return v5.createElement("TextLabel", {
                Size = v21.size or v20, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                Font = l_Font_1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Text = v21.friendActivityTitle, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextSize = v44, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                BackgroundTransparency = 1
            });
        elseif l_isPlayable_0 == false and not l_requiresPurchase_0 then
            if l_useExperienceTileMetadata_0 then
                return v5.createElement(l_TextFooter_0, {
                    text = v38.notPlayableText
                });
            else
                return v5.createElement("Frame", {
                    Size = v21.size or v20, 
                    Position = v21.position, 
                    AnchorPoint = v21.anchorPoint, 
                    LayoutOrder = v21.layoutOrder, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = v21.automaticSize
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    PlayabilityLabel = v5.createElement(l_StyledTextLabel_0, {
                        colorStyle = l_Theme_0.TextMuted, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        size = UDim2.new(1, 0, 1, 0), 
                        lineHeight = 1, 
                        text = v38.notPlayableText, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        richText = false
                    })
                });
            end;
        end;
    end;
    if l_useExperienceTileMetadata_0 then
        return v5.createElement(l_SocialProofFooter_0, {
            ratingText = v26, 
            playingText = v33
        });
    else
        local v45 = v5.createElement(l_StatGroup_0, {
            ratingText = v26, 
            playingText = v33
        });
        return v5.createElement("Frame", {
            Size = v21.size or v20, 
            Position = v21.position, 
            AnchorPoint = v21.anchorPoint, 
            LayoutOrder = v21.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = v21.automaticSize
        }, {
            ExperienceStats = v45
        });
    end;
end;