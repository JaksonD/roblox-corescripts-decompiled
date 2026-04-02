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
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata;
local v13 = {
    new = function() --[[ Line: 22 ]] --[[ Name: new ]]
        return {};
    end, 
    mock = function(v11) --[[ Line: 28 ]] --[[ Name: mock ]]
        -- upvalues: l_OmniRecommendationsContentType_0 (copy)
        local v12 = {
            contentType = l_OmniRecommendationsContentType_0.Game, 
            contentId = v11 or "149757", 
            isSponsored = false
        };
        v12.isShowSponsoredLabel = v12.isSponsored;
        v12.adId = nil;
        v12.payerName = nil;
        v12.logoAssetId = nil;
        v12.logoAspectRatio = nil;
        v12.headline = nil;
        v12.subtitle = nil;
        v12.ctaText = nil;
        v12.tileVariant = nil;
        v12.badgePosition = nil;
        v12.badgeAnalyticsId = nil;
        v12.badgeType = nil;
        v12.badgeText = nil;
        v12.badgeIcon = nil;
        v12.badgeComponentType = nil;
        v12.componentType = nil;
        v12.alignmentType = nil;
        v12.minRowPadding = nil;
        v12.placeIdOverride = nil;
        v12.launchDataOverride = nil;
        v12.analyticsData = nil;
        v12.primaryWideImageAssetId = nil;
        v12.primaryWideImageListId = nil;
        v12.primaryWideVideoAssetId = nil;
        return v12;
    end
};
v13.fromGamesApiData = function(v14) --[[ Line: 60 ]] --[[ Name: fromGamesApiData ]]
    -- upvalues: v2 (copy), v13 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v14.universeId) ~= "number" and type(v14.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string");
    else
        local v15 = v13.new();
        v15.contentType = l_OmniRecommendationsContentType_0.Game;
        v15.contentId = tostring(v14.universeId);
        v15.isSponsored = v14.isSponsored;
        v15.isShowSponsoredLabel = nil;
        if v14.isShowSponsoredLabel == nil then
            v15.isShowSponsoredLabel = true;
        else
            v15.isShowSponsoredLabel = v14.isShowSponsoredLabel;
        end;
        v15.adId = v14.nativeAdData;
        return v2.success(v15);
    end;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v13.fromOmniAutocompleteApi = function(v16) --[[ Line: 83 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v2 (copy), v13 (copy), l_OmniRecommendationsContentType_0 (copy)
        if type(v16.universeId) ~= "number" and type(v16.universeId) ~= "string" then
            return v2.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string");
        else
            local v17 = v13.new();
            v17.contentType = l_OmniRecommendationsContentType_0.Game;
            v17.contentId = tostring(v16.universeId);
            return v2.success(v17);
        end;
    end;
end;
v13.fromExploreApiData = function(v18) --[[ Line: 100 ]] --[[ Name: fromExploreApiData ]]
    -- upvalues: v2 (copy), v13 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v18.universeId) ~= "number" and type(v18.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string");
    else
        local v19 = v13.new();
        v19.contentType = l_OmniRecommendationsContentType_0.Game;
        v19.contentId = tostring(v18.universeId);
        v19.isSponsored = v18.isSponsored;
        v19.adId = v18.nativeAdData;
        v19.isShowSponsoredLabel = nil;
        return v2.success(v19);
    end;
end;
if l_FFlagEnableTopSongsSort_0 then
    v13.songFromExploreApiData = function(v20) --[[ Line: 116 ]] --[[ Name: songFromExploreApiData ]]
        -- upvalues: v2 (copy), v13 (copy), l_OmniRecommendationsContentType_0 (copy)
        if type(v20.assetId) ~= "number" and type(v20.assetId) ~= "string" then
            return v2.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string");
        else
            local v21 = v13.new();
            v21.contentType = l_OmniRecommendationsContentType_0.Song;
            v21.contentId = tostring(v20.assetId);
            v21.isSponsored = false;
            return v2.success(v21);
        end;
    end;
end;
v13.fromOmniRecommendations = function(v22) --[[ Line: 131 ]] --[[ Name: fromOmniRecommendations ]]
    -- upvalues: v13 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v2 (copy)
    local v23 = v13.new();
    v23.contentType = v22.contentType;
    v23.contentId = tostring(v22.contentId);
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v22.contentMetadata then
        v23.adId = v22.contentMetadata.EncryptedAdTrackingData or nil;
        local v24 = false;
        if v23.adId ~= nil then
            v24 = v23.adId ~= "";
        end;
        v23.isSponsored = v24;
        v23.isShowSponsoredLabel = nil;
        v23.payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v22.contentMetadata.PayerName or nil else nil;
        v23.logoAssetId = v22.contentMetadata.LogoAssetId;
        v23.logoAspectRatio = v22.contentMetadata.LogoAspectRatio;
        v23.headline = v22.contentMetadata.Headline;
        v23.subtitle = v22.contentMetadata.Subtitle;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v23.ctaText = v22.contentMetadata.CtaText;
            v23.tileVariant = v22.contentMetadata.TileVariant;
            v23.badgePosition = v22.contentMetadata.badgePosition;
            v23.badgeAnalyticsId = v22.contentMetadata.badgeAnalyticsId;
            v23.badgeType = v22.contentMetadata.badgeType;
            v23.badgeText = v22.contentMetadata.badgeText;
            v23.badgeIcon = v22.contentMetadata.badgeIcon;
            v23.badgeComponentType = v22.contentMetadata.badgeComponentType;
        end;
        v23.componentType = v22.contentMetadata.ComponentType;
        v23.alignmentType = v22.contentMetadata.AlignmentType;
        v23.minRowPadding = v22.contentMetadata.MinRowPadding;
        v23.placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v22.contentMetadata.PlaceIdOverride then tostring(v22.contentMetadata.PlaceIdOverride) else nil;
        v23.launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v22.contentMetadata.LaunchDataOverride else nil;
        if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 then
            v23.primaryWideImageAssetId = if v22.contentMetadata.PrimaryWideImageAssetId and v22.contentMetadata.PrimaryWideImageAssetId ~= "" then v22.contentMetadata.PrimaryWideImageAssetId else nil;
            v23.primaryWideImageListId = v22.contentMetadata.PrimaryWideImageListId;
            v23.primaryWideVideoAssetId = v22.contentMetadata.PrimaryWideVideoAssetId;
        end;
    else
        v23.adId = v22.contentMetadata and v22.contentMetadata.EncryptedAdTrackingData or nil;
        local v25 = false;
        if v23.adId ~= nil then
            v25 = v23.adId ~= "";
        end;
        v23.isSponsored = v25;
        v23.isShowSponsoredLabel = nil;
        v23.payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v22.contentMetadata and v22.contentMetadata.PayerName or nil else nil;
        v23.placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v22.contentMetadata and v22.contentMetadata.PlaceIdOverride then tostring(v22.contentMetadata.PlaceIdOverride) else nil;
        v23.launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v22.contentMetadata and v22.contentMetadata.LaunchDataOverride or nil else nil;
        if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v22.contentMetadata then
            v23.primaryWideImageAssetId = if v22.contentMetadata.PrimaryWideImageAssetId and v22.contentMetadata.PrimaryWideImageAssetId ~= "" then v22.contentMetadata.PrimaryWideImageAssetId else nil;
            v23.primaryWideImageListId = v22.contentMetadata.PrimaryWideImageListId;
            v23.primaryWideVideoAssetId = v22.contentMetadata.PrimaryWideVideoAssetId;
        end;
    end;
    if l_FFlagLuaAppLogOmniAnalyticsData_0 then
        v23.analyticsData = v22.analyticsData;
    end;
    return v2.success(v23);
end;
return v13;