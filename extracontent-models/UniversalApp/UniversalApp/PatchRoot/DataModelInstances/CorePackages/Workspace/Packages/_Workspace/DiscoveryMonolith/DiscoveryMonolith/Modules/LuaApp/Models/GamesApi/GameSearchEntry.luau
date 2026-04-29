local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local DiscoveryMonolithParent = DiscoveryMonolith.Parent
local Result = require(DiscoveryMonolithParent.Result)
local Modules = DiscoveryMonolith.Modules
local GetFFlagShowCreatorNameOnEmphasisSearchTileIXP = require(Modules.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP)
local FFlagLuaAppEnableCustomSpawnSearch = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch
local FFlagLuaAppGameTileLockedBadge = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppGameTileLockedBadge
local t1 = {
	new = function() --[[ new ]] -- line: 34
		return {}
	end
}

function t1.mock(s1: string?, s2: string?) -- line: 40
	-- upvalues: t1 (copy), FFlagLuaAppEnableCustomSpawnSearch (copy)
	local v11 = t1.new()

	v11.name = "test name"
	v11.universeId = s1 or "149757"
	v11.placeId = s2 or "384314"
	v11.isSponsored = false
	v11.isShowSponsoredLabel = v11.isSponsored
	v11.adId = nil
	v11.playerCount = 150
	v11.creatorName = "test name"
	v11.creatorHasVerifiedBadge = false
	v11.topicId = "test_topic"
	v11.placeIdOverride = if not FFlagLuaAppEnableCustomSpawnSearch then nil else "123"
	v11.launchDataOverride = if not FFlagLuaAppEnableCustomSpawnSearch then nil else "test"
	v11.badgePosition = nil
	v11.badgeAnalyticsId = nil
	v11.badgeType = nil
	v11.badgeText = nil
	v11.badgeIcon = nil
	v11.badgeComponentType = nil

	return v11
end
function t1.fromJsonData(p1, p2) -- line: 63
	-- upvalues: Result (copy), t1 (copy), GetFFlagShowCreatorNameOnEmphasisSearchTileIXP (copy), FFlagLuaAppEnableCustomSpawnSearch (copy), FFlagLuaAppGameTileLockedBadge (copy)
	if p2 and (type(p1.universeId) ~= "number" and type(p1.universeId) ~= "string") then
		return Result.error("GameSearchEntry.fromJsonData expects universeId to be a number or a string for game contents")
	end

	if p2 and type(p1.placeId) ~= "number" and type(p1.placeId) ~= "string" then
		return Result.error("GameSearchEntry.fromJsonData expects placeId to be a number or a string for game contents")
	end

	local v14 = t1.new()

	v14.name = p1.name
	v14.topicId = p1.topicId

	if p2 then
		v14.universeId = tostring(p1.universeId)
		v14.placeId = tostring(p1.placeId)
		v14.isSponsored = p1.isSponsored
		v14.isShowSponsoredLabel = nil

		if p1.isShowSponsoredLabel == nil then
			v14.isShowSponsoredLabel = true
		else
			v14.isShowSponsoredLabel = p1.isShowSponsoredLabel
		end

		v14.adId = p1.nativeAdData
		v14.playerCount = p1.playerCount

		if GetFFlagShowCreatorNameOnEmphasisSearchTileIXP() then
			v14.creatorName = p1.creatorName
			v14.creatorHasVerifiedBadge = p1.creatorHasVerifiedBadge
		end

		if FFlagLuaAppEnableCustomSpawnSearch then
			local contentMetadata = p1.contentMetadata

			if contentMetadata then
				v14.placeIdOverride = if not contentMetadata.PlaceIdOverride then nil else tostring(contentMetadata.PlaceIdOverride)
				v14.launchDataOverride = contentMetadata.LaunchDataOverride
			end
		end

		if FFlagLuaAppGameTileLockedBadge then
			local contentMetadata = p1.contentMetadata

			if contentMetadata then
				v14.badgePosition = contentMetadata.badgePosition
				v14.badgeAnalyticsId = contentMetadata.badgeAnalyticsId
				v14.badgeType = contentMetadata.badgeType
				v14.badgeText = contentMetadata.badgeText
				v14.badgeIcon = contentMetadata.badgeIcon
				v14.badgeComponentType = contentMetadata.badgeComponentType
			end
		end
	end

	return Result.success(v14)
end

return t1
