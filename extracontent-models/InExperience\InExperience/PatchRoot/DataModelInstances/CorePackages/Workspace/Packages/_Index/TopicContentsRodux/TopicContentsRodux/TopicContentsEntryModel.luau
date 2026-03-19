local l_Parent_0 = script:FindFirstAncestor("TopicContentsRodux").Parent;
local l_OmniRecommendationsContentType_0 = require(l_Parent_0.DiscoveryTypes).OmniRecommendationsContentType;
local v2 = require(l_Parent_0.Result);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local v11 = {
    new = function() --[[ Line: 19 ]] --[[ Name: new ]]
        return {};
    end, 
    mock = function(v9) --[[ Line: 25 ]] --[[ Name: mock ]]
        -- upvalues: l_OmniRecommendationsContentType_0 (copy)
        local v10 = {
            contentType = l_OmniRecommendationsContentType_0.Game, 
            contentId = v9 or "149757", 
            isSponsored = false
        };
        v10.isShowSponsoredLabel = v10.isSponsored;
        v10.adId = nil;
        v10.payerName = nil;
        v10.logoAssetId = nil;
        v10.logoAspectRatio = nil;
        v10.headline = nil;
        v10.subtitle = nil;
        v10.ctaText = nil;
        v10.tileVariant = nil;
        v10.badgePosition = nil;
        v10.badgeAnalyticsId = nil;
        v10.badgeType = nil;
        v10.badgeText = nil;
        v10.badgeIcon = nil;
        v10.badgeComponentType = nil;
        v10.componentType = nil;
        v10.alignmentType = nil;
        v10.minRowPadding = nil;
        v10.placeIdOverride = nil;
        v10.launchDataOverride = nil;
        return v10;
    end
};
v11.fromGamesApiData = function(v12) --[[ Line: 53 ]] --[[ Name: fromGamesApiData ]]
    -- upvalues: v2 (copy), v11 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v12.universeId) ~= "number" and type(v12.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string");
    else
        local v13 = v11.new();
        v13.contentType = l_OmniRecommendationsContentType_0.Game;
        v13.contentId = tostring(v12.universeId);
        v13.isSponsored = v12.isSponsored;
        v13.isShowSponsoredLabel = nil;
        if v12.isShowSponsoredLabel == nil then
            v13.isShowSponsoredLabel = true;
        else
            v13.isShowSponsoredLabel = v12.isShowSponsoredLabel;
        end;
        v13.adId = v12.nativeAdData;
        return v2.success(v13);
    end;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v11.fromOmniAutocompleteApi = function(v14) --[[ Line: 76 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v2 (copy), v11 (copy), l_OmniRecommendationsContentType_0 (copy)
        if type(v14.universeId) ~= "number" and type(v14.universeId) ~= "string" then
            return v2.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string");
        else
            local v15 = v11.new();
            v15.contentType = l_OmniRecommendationsContentType_0.Game;
            v15.contentId = tostring(v14.universeId);
            return v2.success(v15);
        end;
    end;
end;
v11.fromExploreApiData = function(v16) --[[ Line: 93 ]] --[[ Name: fromExploreApiData ]]
    -- upvalues: v2 (copy), v11 (copy), l_OmniRecommendationsContentType_0 (copy)
    if type(v16.universeId) ~= "number" and type(v16.universeId) ~= "string" then
        return v2.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string");
    else
        local v17 = v11.new();
        v17.contentType = l_OmniRecommendationsContentType_0.Game;
        v17.contentId = tostring(v16.universeId);
        v17.isSponsored = v16.isSponsored;
        v17.adId = v16.nativeAdData;
        v17.isShowSponsoredLabel = nil;
        return v2.success(v17);
    end;
end;
if l_FFlagEnableTopSongsSort_0 then
    v11.songFromExploreApiData = function(v18) --[[ Line: 109 ]] --[[ Name: songFromExploreApiData ]]
        -- upvalues: v2 (copy), v11 (copy), l_OmniRecommendationsContentType_0 (copy)
        if type(v18.assetId) ~= "number" and type(v18.assetId) ~= "string" then
            return v2.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string");
        else
            local v19 = v11.new();
            v19.contentType = l_OmniRecommendationsContentType_0.Song;
            v19.contentId = tostring(v18.assetId);
            v19.isSponsored = false;
            return v2.success(v19);
        end;
    end;
end;
v11.fromOmniRecommendations = function(v20) --[[ Line: 124 ]] --[[ Name: fromOmniRecommendations ]]
    -- upvalues: v11 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), v2 (copy)
    local v21 = v11.new();
    v21.contentType = v20.contentType;
    v21.contentId = tostring(v20.contentId);
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v20.contentMetadata then
        v21.adId = v20.contentMetadata.EncryptedAdTrackingData or nil;
        local v22 = false;
        if v21.adId ~= nil then
            v22 = v21.adId ~= "";
        end;
        v21.isSponsored = v22;
        v21.isShowSponsoredLabel = nil;
        v21.payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v20.contentMetadata.PayerName or nil else nil;
        v21.logoAssetId = v20.contentMetadata.LogoAssetId;
        v21.logoAspectRatio = v20.contentMetadata.LogoAspectRatio;
        v21.headline = v20.contentMetadata.Headline;
        v21.subtitle = v20.contentMetadata.Subtitle;
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            v21.ctaText = v20.contentMetadata.CtaText;
            v21.tileVariant = v20.contentMetadata.TileVariant;
            v21.badgePosition = v20.contentMetadata.badgePosition;
            v21.badgeAnalyticsId = v20.contentMetadata.badgeAnalyticsId;
            v21.badgeType = v20.contentMetadata.badgeType;
            v21.badgeText = v20.contentMetadata.badgeText;
            v21.badgeIcon = v20.contentMetadata.badgeIcon;
            v21.badgeComponentType = v20.contentMetadata.badgeComponentType;
        end;
        v21.componentType = v20.contentMetadata.ComponentType;
        v21.alignmentType = v20.contentMetadata.AlignmentType;
        v21.minRowPadding = v20.contentMetadata.MinRowPadding;
        v21.placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v20.contentMetadata.PlaceIdOverride then tostring(v20.contentMetadata.PlaceIdOverride) else nil;
        v21.launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v20.contentMetadata.LaunchDataOverride else nil;
    else
        v21.adId = v20.contentMetadata and v20.contentMetadata.EncryptedAdTrackingData or nil;
        local v23 = false;
        if v21.adId ~= nil then
            v23 = v21.adId ~= "";
        end;
        v21.isSponsored = v23;
        v21.isShowSponsoredLabel = nil;
        v21.payerName = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v20.contentMetadata and v20.contentMetadata.PayerName or nil else nil;
        v21.placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v20.contentMetadata and v20.contentMetadata.PlaceIdOverride then tostring(v20.contentMetadata.PlaceIdOverride) else nil;
        v21.launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v20.contentMetadata and v20.contentMetadata.LaunchDataOverride or nil else nil;
    end;
    return v2.success(v21);
end;
return v11;