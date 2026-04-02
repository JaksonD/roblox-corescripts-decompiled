local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v3 = require(l_Parent_0.React);
local l_TwoByOneGameTile_0 = require(l_Parent_0.GameTile).TwoByOneGameTile;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v1.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = v1.FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = v1.FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = v1.FFlagLuaAppSupportPrimaryMediaContentMetadata;
local v15 = v3.memo(function(v10) --[[ Line: 41 ]]
    -- upvalues: l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), v3 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_TwoByOneGameTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy)
    local v11 = -((v10.maxItemIndex or 0) + 1);
    local v12 = if v10.zIndex then v10.zIndex + v11 else v11;
    local v13 = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v3.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v10 (copy)
        if v10.onSelectionGained then
            v10.onSelectionGained(v10.item, v10.index, v10.item.universeId);
        end;
    end, {
        v10.onSelectionGained, 
        v10.item, 
        v10.index
    }) else nil;
    local v14 = nil;
    if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and v10.item.badgePosition and v10.item.badgeAnalyticsId and v10.item.badgeType and (v10.item.badgeText or v10.item.badgeIcon) then
        v14 = {
            [v10.item.badgePosition] = {
                {
                    analyticsId = v10.item.badgeAnalyticsId, 
                    tileBadgeType = v10.item.badgeType, 
                    text = v10.item.badgeText, 
                    icons = if v10.item.badgeIcon then {
                        v10.item.badgeIcon
                    } else nil, 
                    tileBadgeComponentType = v10.item.badgeComponentType
                }
            }
        };
    end;
    return v3.createElement(l_TwoByOneGameTile_0, {
        size = v10.item.sizeOverride, 
        layoutOrder = v10.index, 
        zIndex = v12, 
        universeId = v10.item.universeId, 
        placeId = v10.item.placeId, 
        topicId = v10.topicId, 
        logoImageAssetId = v10.item.logoAssetId, 
        logoAspectRatio = v10.item.logoAspectRatio, 
        headline = v10.item.headline, 
        subtitle = v10.item.subtitle, 
        ctaText = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v10.item.ctaText else nil, 
        tileVariant = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v10.item.tileVariant else nil, 
        badgeOverride = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v14 else nil, 
        payerName = v10.item.payerName, 
        adId = v10.item.adId, 
        isSponsored = v10.item.isSponsored, 
        sponsoredUserCohort = v10.sponsoredUserCohort, 
        appPage = v10.appPage, 
        setGameHidden = v10.setGameHidden, 
        isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v10.isHidden else nil, 
        hoverKey = ("TwoByOneTile_%*_%*_%*"):format(v10.impressionsTag or "", v10.index or "0", v10.item.universeId), 
        impressionsTag = v10.impressionsTag, 
        index = v10.index, 
        reportGameDetailOpened = v10.reportGameDetailOpened, 
        reportExperienceLaunched = v10.reportExperienceLaunched, 
        enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v10.enableSponsoredFeedback else nil, 
        enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v10.enableReportAd else nil, 
        enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v10.enableExplicitFeedback else nil, 
        placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v10.item.placeIdOverride else nil, 
        launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v10.item.launchDataOverride else nil, 
        onSelectionGained = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v13 else nil, 
        onSelectionLost = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v10.onSelectionLost else nil, 
        primaryWideImageAssetId = if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 then v10.item.primaryWideImageAssetId else nil
    });
end);
return function(v16) --[[ Line: 120 ]]
    -- upvalues: v3 (copy), v15 (copy), l_GameCollectionItemTypes_0 (copy)
    return v3.createElement(v15, v16), l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile;
end;