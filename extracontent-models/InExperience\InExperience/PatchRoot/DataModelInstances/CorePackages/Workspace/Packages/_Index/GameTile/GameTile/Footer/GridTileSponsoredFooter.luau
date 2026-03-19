local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_SponsoredTooltipHover_0 = require(l_Parent_0.Ads).SponsoredTooltipHover;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_TooltipOrientation_0 = require(l_Parent_0.UIBlox).App.Dialog.Enum.TooltipOrientation;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v9 = require(l_script_FirstAncestor_0.Footer.getUserInputIsSelectionOnly);
local l_FFlagLuaAppUpdateAdMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUpdateAdMetadata;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v12 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrLarger_0 = v12.useBreakpointXOrLarger;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local v16 = {
    Sponsored = "Sponsored", 
    Ad = "Ad"
};
GridTileSponsoredFooter = function(v17) --[[ Line: 44 ]] --[[ Name: GridTileSponsoredFooter ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagLuaAppUpdateAdMetadata_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_useBreakpointXOrLarger_0 (copy), v12 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), v16 (copy), v4 (copy), v2 (copy), l_View_0 (copy), v1 (copy), l_SponsoredTooltipHover_0 (copy), l_TooltipOrientation_0 (copy), v9 (copy)
    local v18 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored", 
        adText = l_FFlagLuaAppUpdateAdMetadata_0 and "Feature.GamePage.Label.Ad" or nil
    });
    local v19 = v17.useLargerFont and 24 or 20;
    local v20 = if l_FFlagLuaAppSupportAdRatingFooter_0 then l_useBreakpointXOrLarger_0(v12.Keys.Medium) else nil;
    if l_FFlagLuaAppUpdateAdMetadata_0 and v17.enableSponsoredFeedback then
        local v21 = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v17.sponsoredFooterAdLabelText == v16.Sponsored then v18.sponsoredText else v18.adText;
        local v22 = if l_FFlagLuaAppSupportAdRatingFooter_0 then v4.createElement(v2, {
            text = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v21 else v18.adText, 
            useLargerFont = v17.useLargerFont, 
            isUnifiedGameTile = v17.isUnifiedGameTile, 
            shouldSizeToContentWidth = true
        }) else nil;
        if l_FFlagLuaAppSupportAdRatingFooter_0 and v20 and (v17.isSponsoredRatingFooterAllowed or l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v17.sponsoredFooterAdLabelText and v17.sponsoredFooterIncludeRatingContent) and v17.gameStatsElement then
            return v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y row align-y-center gap-xsmall clip"
            }, {
                AdLabelWrapper = v4.createElement(l_View_0, {
                    LayoutOrder = (not (l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v17.sponsoredFooterAdLabelText) or v17.sponsoredFooterAdLabelFirst) and 1 or 3, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BackgroundTransparency = 1
                }, {
                    Content = v22
                }), 
                DotSeparator = v4.createElement(v2, {
                    LayoutOrder = 2, 
                    text = "\226\128\162", 
                    useLargerFont = v17.useLargerFont, 
                    isUnifiedGameTile = v17.isUnifiedGameTile, 
                    shouldSizeToContentWidth = true
                }), 
                GameStatsWrapper = v4.createElement(l_View_0, {
                    LayoutOrder = (not (l_FFlagLuaAppSupportAdRatingFooterExperiment_0 and v17.sponsoredFooterAdLabelText) or v17.sponsoredFooterAdLabelFirst) and 3 or 1, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BackgroundTransparency = 1
                }, {
                    Content = v17.gameStatsElement
                })
            });
        elseif l_FFlagLuaAppSupportAdRatingFooter_0 then
            return v22;
        else
            return (v4.createElement(v2, {
                text = v18.adText, 
                useLargerFont = v17.useLargerFont, 
                isUnifiedGameTile = v17.isUnifiedGameTile
            }));
        end;
    else
        return v4.createElement(v1, {
            iconElement = v4.createElement(l_SponsoredTooltipHover_0, {
                tooltipOrientation = l_TooltipOrientation_0.Bottom, 
                onActivateTooltip = v17.onActivateSponsoredTooltip, 
                size = UDim2.fromOffset(v19, v19), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                selectable = v9(), 
                supportTenFootUi = true
            }), 
            text = v18.sponsoredText, 
            iconSize = v17.useLargerFont and 24 or 20, 
            useLargerFont = v17.useLargerFont, 
            isUnifiedGameTile = v17.isUnifiedGameTile, 
            gameTileLayoutType = v17.gameTileLayoutType, 
            isNarrowScreenXSmall = v17.isNarrowScreenXSmall
        });
    end;
end;
return GridTileSponsoredFooter;