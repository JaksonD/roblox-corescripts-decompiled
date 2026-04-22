local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v3 = require(l_Parent_0.React);
local l_TwoByOneGameTile_0 = require(l_Parent_0.GameTile).TwoByOneGameTile;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = v1.FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = v1.FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = v1.FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = v1.FFlagLuaAppSupportPrimaryMediaContentMetadata;
local v14 = v3.memo(function(v9) --[[ Line: 39 ]]
    -- upvalues: l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), v3 (copy), l_TwoByOneGameTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy)
    local v10 = -((v9.maxItemIndex or 0) + 1);
    local v11 = if v9.zIndex then v9.zIndex + v10 else v10;
    local v12 = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v3.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v9 (copy)
        if v9.onSelectionGained then
            v9.onSelectionGained(v9.item, v9.index, v9.item.universeId);
        end;
    end, {
        v9.onSelectionGained, 
        v9.item, 
        v9.index
    }) else nil;
    local v13 = nil;
    if v9.item.badgePosition and v9.item.badgeAnalyticsId and v9.item.badgeType and (v9.item.badgeText or v9.item.badgeIcon) then
        v13 = {
            [v9.item.badgePosition] = {
                {
                    analyticsId = v9.item.badgeAnalyticsId, 
                    tileBadgeType = v9.item.badgeType, 
                    text = v9.item.badgeText, 
                    icons = if v9.item.badgeIcon then {
                        v9.item.badgeIcon
                    } else nil, 
                    tileBadgeComponentType = v9.item.badgeComponentType
                }
            }
        };
    end;
    return v3.createElement(l_TwoByOneGameTile_0, {
        size = v9.item.sizeOverride, 
        layoutOrder = v9.index, 
        zIndex = v11, 
        universeId = v9.item.universeId, 
        placeId = v9.item.placeId, 
        topicId = v9.topicId, 
        logoImageAssetId = v9.item.logoAssetId, 
        logoAspectRatio = v9.item.logoAspectRatio, 
        headline = v9.item.headline, 
        subtitle = v9.item.subtitle, 
        ctaText = v9.item.ctaText, 
        tileVariant = v9.item.tileVariant, 
        badgeOverride = v13, 
        payerName = v9.item.payerName, 
        adId = v9.item.adId, 
        isSponsored = v9.item.isSponsored, 
        sponsoredUserCohort = v9.sponsoredUserCohort, 
        appPage = v9.appPage, 
        setGameHidden = v9.setGameHidden, 
        isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v9.isHidden else nil, 
        hoverKey = ("TwoByOneTile_%*_%*_%*"):format(v9.impressionsTag or "", v9.index or "0", v9.item.universeId), 
        impressionsTag = v9.impressionsTag, 
        index = v9.index, 
        reportGameDetailOpened = v9.reportGameDetailOpened, 
        reportExperienceLaunched = v9.reportExperienceLaunched, 
        enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v9.enableSponsoredFeedback else nil, 
        enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v9.enableReportAd else nil, 
        enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v9.enableExplicitFeedback else nil, 
        placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v9.item.placeIdOverride else nil, 
        launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v9.item.launchDataOverride else nil, 
        onSelectionGained = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v12 else nil, 
        onSelectionLost = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v9.onSelectionLost else nil, 
        primaryWideImageAssetId = if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 then v9.item.primaryWideImageAssetId else nil
    });
end);
return function(v15) --[[ Line: 117 ]]
    -- upvalues: v3 (copy), v14 (copy), l_GameCollectionItemTypes_0 (copy)
    return v3.createElement(v14, v15), l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile;
end;