local Parent = script:FindFirstAncestor("TopicContentsRodux").Parent
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local Result = require(Parent.Result)
local FFlagSearchOmniAutocompletePage = require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local FFlagLuaAppEnableHomepageTwoByOneTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppLogOmniAnalyticsData = require(Parent.SharedFlags).FFlagLuaAppLogOmniAnalyticsData
local FFlagLuaAppSupportPrimaryMediaContentMetadata = require(Parent.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata
local FFlagLuaAppGameTileLockedBadge = require(Parent.SharedFlags).FFlagLuaAppGameTileLockedBadge
local t2 = {
	new = function() --[[ new ]] -- line: 20
		return {}
	end,
	mock = function(s1: string?) --[[ mock ]] -- line: 26
		-- upvalues: OmniRecommendationsContentType (copy)
		local t1 = {
			contentType = OmniRecommendationsContentType.Game,
			contentId = s1 or "149757",
			isSponsored = false
		}

		t1.isShowSponsoredLabel = t1.isSponsored
		t1.adId = nil
		t1.payerName = nil
		t1.logoAssetId = nil
		t1.logoAspectRatio = nil
		t1.headline = nil
		t1.subtitle = nil
		t1.ctaText = nil
		t1.tileVariant = nil
		t1.badgePosition = nil
		t1.badgeAnalyticsId = nil
		t1.badgeType = nil
		t1.badgeText = nil
		t1.badgeIcon = nil
		t1.badgeComponentType = nil
		t1.componentType = nil
		t1.alignmentType = nil
		t1.minRowPadding = nil
		t1.placeIdOverride = nil
		t1.launchDataOverride = nil
		t1.analyticsData = nil
		t1.primaryWideImageAssetId = nil
		t1.primaryWideImageListId = nil
		t1.primaryWideVideoAssetId = nil

		return t1
	end
}

function t2.fromGamesApiData(p1) -- line: 58
	-- upvalues: Result (copy), t2 (copy), OmniRecommendationsContentType (copy), FFlagLuaAppGameTileLockedBadge (copy)
	if type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string" then
		return Result.error("TopicContentsEntryModel.fromGamesApiData expects universeId to be a number or a string")
	end

	local v15 = t2.new()

	v15.contentType = OmniRecommendationsContentType.Game
	v15.contentId = tostring(p1.universeId)
	v15.isSponsored = p1.isSponsored
	v15.isShowSponsoredLabel = nil

	if p1.isShowSponsoredLabel == nil then
		v15.isShowSponsoredLabel = true
	else
		v15.isShowSponsoredLabel = p1.isShowSponsoredLabel
	end

	v15.adId = p1.nativeAdData

	if FFlagLuaAppGameTileLockedBadge and p1.contentMetadata then
		local contentMetadata = p1.contentMetadata

		v15.badgePosition = contentMetadata.badgePosition
		v15.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		v15.badgeType = contentMetadata.badgeType
		v15.badgeText = contentMetadata.badgeText
		v15.badgeIcon = contentMetadata.badgeIcon
		v15.badgeComponentType = contentMetadata.badgeComponentType
	end

	return Result.success(v15)
end

if FFlagSearchOmniAutocompletePage then
	function t2.fromOmniAutocompleteApi(p2) -- line: 91
		-- upvalues: Result (copy), t2 (copy), OmniRecommendationsContentType (copy), FFlagLuaAppGameTileLockedBadge (copy)
		if type(p2.universeId) ~= "number" and type(p2.universeId) ~= "string" then
			return Result.error("TopicContentsEntryModel.fromOmniAutocomplete expects universeId to be a number or a string")
		end

		local v18 = t2.new()

		v18.contentType = OmniRecommendationsContentType.Game
		v18.contentId = tostring(p2.universeId)

		if FFlagLuaAppGameTileLockedBadge and p2.contentMetadata then
			local contentMetadata = p2.contentMetadata

			v18.badgePosition = contentMetadata.badgePosition
			v18.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
			v18.badgeType = contentMetadata.badgeType
			v18.badgeText = contentMetadata.badgeText
			v18.badgeIcon = contentMetadata.badgeIcon
			v18.badgeComponentType = contentMetadata.badgeComponentType
		end

		return Result.success(v18)
	end
end

function t2.fromExploreApiData(p3) -- line: 118
	-- upvalues: Result (copy), t2 (copy), OmniRecommendationsContentType (copy), FFlagLuaAppGameTileLockedBadge (copy)
	if type(p3.universeId) ~= "number" and type(p3.universeId) ~= "string" then
		return Result.error("TopicContentsEntryModel.fromExploreApiData expects universeId to be a number or a string")
	end

	local v21 = t2.new()

	v21.contentType = OmniRecommendationsContentType.Game
	v21.contentId = tostring(p3.universeId)
	v21.isSponsored = p3.isSponsored
	v21.adId = p3.nativeAdData
	v21.isShowSponsoredLabel = nil

	if FFlagLuaAppGameTileLockedBadge and p3.contentMetadata then
		local contentMetadata = p3.contentMetadata

		v21.badgePosition = contentMetadata.badgePosition
		v21.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
		v21.badgeType = contentMetadata.badgeType
		v21.badgeText = contentMetadata.badgeText
		v21.badgeIcon = contentMetadata.badgeIcon
		v21.badgeComponentType = contentMetadata.badgeComponentType
	end

	return Result.success(v21)
end

if FFlagEnableTopSongsSort then
	function t2.songFromExploreApiData(p4) -- line: 144
		-- upvalues: Result (copy), t2 (copy), OmniRecommendationsContentType (copy)
		if type(p4.assetId) ~= "number" and type(p4.assetId) ~= "string" then
			return Result.error("TopicContentsEntryModel.songFromExploreApiData expects assetId to be a number or a string")
		end

		local v24 = t2.new()

		v24.contentType = OmniRecommendationsContentType.Song
		v24.contentId = tostring(p4.assetId)
		v24.isSponsored = false

		return Result.success(v24)
	end
end

function t2.fromOmniRecommendations(p5) -- line: 159
	-- upvalues: t2 (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), FFlagLuaAppLogOmniAnalyticsData (copy), Result (copy)
	local v26 = t2.new()

	v26.contentType = p5.contentType
	v26.contentId = tostring(p5.contentId)

	if FFlagLuaAppEnableHomepageTwoByOneTile and p5.contentMetadata then
		v26.adId = p5.contentMetadata.EncryptedAdTrackingData or nil
		v26.isSponsored = v26.adId ~= nil and v26.adId ~= ""
		v26.isShowSponsoredLabel = nil
		v26.payerName = if not FFlagLuaAppEnableWhyThisAdModal then nil else p5.contentMetadata.PayerName or nil
		v26.logoAssetId = p5.contentMetadata.LogoAssetId
		v26.logoAspectRatio = p5.contentMetadata.LogoAspectRatio
		v26.headline = p5.contentMetadata.Headline
		v26.subtitle = p5.contentMetadata.Subtitle
		v26.ctaText = p5.contentMetadata.CtaText
		v26.tileVariant = p5.contentMetadata.TileVariant
		v26.badgePosition = p5.contentMetadata.badgePosition
		v26.badgeAnalyticsId = p5.contentMetadata.badgeAnalyticsId
		v26.badgeType = p5.contentMetadata.badgeType
		v26.badgeText = p5.contentMetadata.badgeText
		v26.badgeIcon = p5.contentMetadata.badgeIcon
		v26.badgeComponentType = p5.contentMetadata.badgeComponentType
		v26.componentType = p5.contentMetadata.ComponentType
		v26.alignmentType = p5.contentMetadata.AlignmentType
		v26.minRowPadding = p5.contentMetadata.MinRowPadding
		v26.placeIdOverride = if not p5.contentMetadata.PlaceIdOverride then nil else tostring(p5.contentMetadata.PlaceIdOverride)
		v26.launchDataOverride = p5.contentMetadata.LaunchDataOverride

		if FFlagLuaAppSupportPrimaryMediaContentMetadata then
			v26.primaryWideImageAssetId = if not p5.contentMetadata.PrimaryWideImageAssetId or p5.contentMetadata.PrimaryWideImageAssetId == "" then nil else p5.contentMetadata.PrimaryWideImageAssetId
			v26.primaryWideImageListId = p5.contentMetadata.PrimaryWideImageListId
			v26.primaryWideVideoAssetId = p5.contentMetadata.PrimaryWideVideoAssetId
		end
	else
		v26.adId = p5.contentMetadata and p5.contentMetadata.EncryptedAdTrackingData or nil
		v26.isSponsored = v26.adId ~= nil and v26.adId ~= ""
		v26.isShowSponsoredLabel = nil
		v26.payerName = if not FFlagLuaAppEnableWhyThisAdModal then nil else p5.contentMetadata and p5.contentMetadata.PayerName or nil
		v26.placeIdOverride = if not p5.contentMetadata or not p5.contentMetadata.PlaceIdOverride then nil else tostring(p5.contentMetadata.PlaceIdOverride)
		v26.launchDataOverride = p5.contentMetadata and p5.contentMetadata.LaunchDataOverride or nil

		if FFlagLuaAppSupportPrimaryMediaContentMetadata and p5.contentMetadata then
			v26.primaryWideImageAssetId = if not p5.contentMetadata.PrimaryWideImageAssetId or p5.contentMetadata.PrimaryWideImageAssetId == "" then nil else p5.contentMetadata.PrimaryWideImageAssetId
			v26.primaryWideImageListId = p5.contentMetadata.PrimaryWideImageListId
			v26.primaryWideVideoAssetId = p5.contentMetadata.PrimaryWideVideoAssetId
		end
	end

	if FFlagLuaAppLogOmniAnalyticsData then
		v26.analyticsData = p5.analyticsData
	end

	return Result.success(v26)
end

return t2
