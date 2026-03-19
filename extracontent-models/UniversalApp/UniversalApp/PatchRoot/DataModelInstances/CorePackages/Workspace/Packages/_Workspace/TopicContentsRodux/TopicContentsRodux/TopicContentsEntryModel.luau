local l_Parent_0 = script:FindFirstAncestor("TopicContentsRodux").Parent;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local v2 = require(l_Parent_0.Result);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local v12 = {
    new = function() --[[ Line: 20 ]] --[[ Name: new ]]
        return {};
    end, 
    mock = function(v10) --[[ Line: 26 ]] --[[ Name: mock ]]
        -- upvalues: l_OmniRecommendationsContentType_0 (copy)
        local v11 = {
            contentType = l_OmniRecommendationsContentType_0.Game, 
            contentId = v10 or "149757", 
            isSponsored = false
        };
        v11.isShowSponsoredLabel = v11.isSponsored;
        v11.adId = nil;
        v11.payerName = nil;
        v11.logoAssetId = nil;
        v11.logoAspectRatio = nil;
        v11.headline = nil;
        v11.subtitle = nil;
        v11.ctaText = nil;
        v11.tileVariant = nil;
        v11.badgePosition = nil;
        v11.badgeAnalyticsId = nil;
        v11.badgeType = nil;
        v11.badgeText = nil;
        v11.badgeIcon = nil;
        v11.badgeComponentType = nil;
        v11.componentType = nil;
        v11.alignmentType = nil;
        v11.minRowPadding = nil;
        v11.placeIdOverride = nil;
        v11.launchDataOverride = nil;
        v11.analyticsData = nil;
        return v11;
    end
};
v12.fromGamesApiData = function(v13) --[[ Line: 55 ]] --[[ Name: fromGamesApiData ]]
    -- upvalues: v2 (copy), v12 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v13.universeId) ~= "number" and type(v13.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string");
    else
        local v14 = v12.new();
        v14.contentType = l_OmniRecommendationsContentType_0.Game;
        v14.contentId = tostring(v13.universeId);
        v14.isSponsored = v13.isSponsored;
        v14.isShowSponsoredLabel = nil;
        if v13.isShowSponsoredLabel == nil then
            v14.isShowSponsoredLabel = true;
        else
            v14.isShowSponsoredLabel = v13.isShowSponsoredLabel;
        end;
        v14.adId = v13.nativeAdData;
        return v2.success(v14);
    end;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v12.fromOmniAutocompleteApi = function(v15) --[[ Line: 78 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v2 (copy), v12 (copy), l_OmniRecommendationsContentType_0 (copy)
        if type(v15.universeId) ~= "number" and type(v15.universeId) ~= "string" then
            return v2.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string");
        else
            local v16 = v12.new();
            v16.contentType = l_OmniRecommendationsContentType_0.Game;
            v16.contentId = tostring(v15.universeId);
            return v2.success(v16);
        end;
    end;
end;
v12.fromExploreApiData = function(v17) --[[ Line: 95 ]] --[[ Name: fromExploreApiData ]]
    -- upvalues: v2 (copy), v12 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v17.universeId) ~= "number" and type(v17.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string");
    else
        local v18 = v12.new();
        v18.contentType = l_OmniRecommendationsContentType_0.Game;
        v18.contentId = tostring(v17.universeId);
        v18.isSponsored = v17.isSponsored;
        v18.adId = v17.nativeAdData;
        v18.isShowSponsoredLabel = nil;
        return v2.success(v18);
    end;
end;
if l_FFlagEnableTopSongsSort_0 then
    v12.songFromExploreApiData = function(v19) --[[ Line: 111 ]] --[[ Name: songFromExploreApiData ]]
        -- upvalues: v2 (copy), v12 (copy), l_OmniRecommendationsContentType_0 (copy)
        if type(v19.assetId) ~= "number" and type(v19.assetId) ~= "string" then
            return v2.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string");
        else
            local v20 = v12.new();
            v20.contentType = l_OmniRecommendationsContentType_0.Song;
            v20.contentId = tostring(v19.assetId);
            v20.isSponsored = false;
            return v2.success(v20);
        end;
    end;
end;
v12.fromOmniRecommendations = function(v21) --[[ Line: 126 ]] --[[ Name: fromOmniRecommendations ]]
    -- upvalues: v12 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v2 (copy)
    local v22 = v12.new();
    v22.contentType = v21.contentType;
    v22.contentId = tostring(v21.contentId);
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v21.contentMetadata then
        v22.adId = v21.contentMetadata.EncryptedAdTrackingData or nil;
        local v23 = false;
        if v22.adId ~= nil then
            v23 = v22.adId ~= "";
        end;
        v22.isSponsored = v23;
        v22.isShowSponsoredLabel = nil;
        v22.payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v21.contentMetadata.PayerName or nil else nil;
        v22.logoAssetId = v21.contentMetadata.LogoAssetId;
        v22.logoAspectRatio = v21.contentMetadata.LogoAspectRatio;
        v22.headline = v21.contentMetadata.Headline;
        v22.subtitle = v21.contentMetadata.Subtitle;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v22.ctaText = v21.contentMetadata.CtaText;
            v22.tileVariant = v21.contentMetadata.TileVariant;
            v22.badgePosition = v21.contentMetadata.badgePosition;
            v22.badgeAnalyticsId = v21.contentMetadata.badgeAnalyticsId;
            v22.badgeType = v21.contentMetadata.badgeType;
            v22.badgeText = v21.contentMetadata.badgeText;
            v22.badgeIcon = v21.contentMetadata.badgeIcon;
            v22.badgeComponentType = v21.contentMetadata.badgeComponentType;
        end;
        v22.componentType = v21.contentMetadata.ComponentType;
        v22.alignmentType = v21.contentMetadata.AlignmentType;
        v22.minRowPadding = v21.contentMetadata.MinRowPadding;
        v22.placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v21.contentMetadata.PlaceIdOverride then tostring(v21.contentMetadata.PlaceIdOverride) else nil;
        v22.launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v21.contentMetadata.LaunchDataOverride else nil;
    else
        v22.adId = v21.contentMetadata and v21.contentMetadata.EncryptedAdTrackingData or nil;
        local v24 = false;
        if v22.adId ~= nil then
            v24 = v22.adId ~= "";
        end;
        v22.isSponsored = v24;
        v22.isShowSponsoredLabel = nil;
        v22.payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v21.contentMetadata and v21.contentMetadata.PayerName or nil else nil;
        v22.placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v21.contentMetadata and v21.contentMetadata.PlaceIdOverride then tostring(v21.contentMetadata.PlaceIdOverride) else nil;
        v22.launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v21.contentMetadata and v21.contentMetadata.LaunchDataOverride or nil else nil;
    end;
    if l_FFlagLuaAppLogOmniAnalyticsData_0 then
        v22.analyticsData = v21.analyticsData;
    end;
    return v2.success(v22);
end;
return v12;