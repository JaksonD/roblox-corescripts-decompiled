local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v3 = require(l_Parent_0.React);
local l_TwoByOneGameTile_0 = require(l_Parent_0.GameTile).TwoByOneGameTile;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v1.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = v1.FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local v12 = v3.memo(function(v8) --[[ Line: 41 ]]
    -- upvalues: l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v3 (copy), l_TwoByOneGameTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy)
    local v9 = -((v8.maxItemIndex or 0) + 1);
    local v10 = if v8.zIndex then v8.zIndex + v9 else v9;
    local v11 = nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and v8.item.badgePosition and v8.item.badgeAnalyticsId and v8.item.badgeType and (v8.item.badgeText or v8.item.badgeIcon) then
        v11 = {
            [v8.item.badgePosition] = {
                {
                    analyticsId = v8.item.badgeAnalyticsId, 
                    tileBadgeType = v8.item.badgeType, 
                    text = v8.item.badgeText, 
                    icons = if v8.item.badgeIcon then {
                        v8.item.badgeIcon
                    } else nil, 
                    tileBadgeComponentType = v8.item.badgeComponentType
                }
            }
        };
    end;
    return v3.createElement(l_TwoByOneGameTile_0, {
        size = v8.item.sizeOverride, 
        layoutOrder = v8.index, 
        zIndex = v10, 
        universeId = v8.item.universeId, 
        placeId = v8.item.placeId, 
        topicId = v8.topicId, 
        logoImageAssetId = v8.item.logoAssetId, 
        logoAspectRatio = v8.item.logoAspectRatio, 
        headline = v8.item.headline, 
        subtitle = v8.item.subtitle, 
        ctaText = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v8.item.ctaText else nil, 
        tileVariant = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v8.item.tileVariant else nil, 
        badgeOverride = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v11 else nil, 
        payerName = v8.item.payerName, 
        adId = v8.item.adId, 
        isSponsored = v8.item.isSponsored, 
        sponsoredUserCohort = v8.sponsoredUserCohort, 
        appPage = v8.appPage, 
        setGameHidden = v8.setGameHidden, 
        isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v8.isHidden else nil, 
        hoverKey = ("TwoByOneTile_%*_%*_%*"):format(v8.impressionsTag or "", v8.index or "0", v8.item.universeId), 
        impressionsTag = v8.impressionsTag, 
        index = v8.index, 
        reportGameDetailOpened = v8.reportGameDetailOpened, 
        reportExperienceLaunched = v8.reportExperienceLaunched, 
        enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v8.enableSponsoredFeedback else nil, 
        enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v8.enableReportAd else nil, 
        enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v8.enableExplicitFeedback else nil, 
        placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v8.item.placeIdOverride else nil, 
        launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v8.item.launchDataOverride else nil
    });
end);
return function(v13) --[[ Line: 107 ]]
    -- upvalues: v3 (copy), v12 (copy), l_GameCollectionItemTypes_0 (copy)
    return v3.createElement(v12, v13), l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile;
end;