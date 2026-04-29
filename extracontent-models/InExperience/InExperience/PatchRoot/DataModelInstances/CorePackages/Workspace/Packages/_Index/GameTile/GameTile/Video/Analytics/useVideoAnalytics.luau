local GameTile = script:FindFirstAncestor("GameTile")
local GameTileParent = GameTile.Parent

require(GameTileParent.DiscoveryTypes)

local React = require(GameTileParent.React)
local mutedError = require(GameTileParent.Loggers).mutedError
local VideoActions = require(GameTileParent.VideoUtils).AnalyticsEnums.VideoActions
local VideoLogger = require(GameTileParent.VideoUtils).VideoLogger
local DiscoveryEventErrorLogger = require(GameTileParent.DiscoveryUtils).DiscoveryEventErrorLogger

require(GameTile.GameTileTypes)

local getGameTileLayoutData = require(GameTile.getGameTileLayoutData)
local FFlagLuaAppSupportPrimaryMediaContentMetadata = require(GameTileParent.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata
local FFlagLuaAppHomeUnifiedVideoEngagementEvents = require(GameTileParent.SharedFlags).FFlagLuaAppHomeUnifiedVideoEngagementEvents
local DiscoveryAnalytics = require(GameTile.Parent.DiscoveryAnalytics)
local discoveryVideoEndEvent = DiscoveryAnalytics.Events.discoveryVideoEndEvent
local discoveryVideoLoadEvent = DiscoveryAnalytics.Events.discoveryVideoLoadEvent
local discoveryVideoLoopEvent = DiscoveryAnalytics.Events.discoveryVideoLoopEvent
local discoveryVideoPlayEvent = DiscoveryAnalytics.Events.discoveryVideoPlayEvent

return function(p1, b1: boolean, s1: string, n1: number, t1: {[any]: any}?) --[[ useVideoAnalytics ]] -- line: 57
	-- upvalues: React (copy), mutedError (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), getGameTileLayoutData (copy), discoveryVideoPlayEvent (copy), FFlagLuaAppHomeUnifiedVideoEngagementEvents (copy), DiscoveryEventErrorLogger (copy), discoveryVideoLoadEvent (copy), VideoLogger (copy), VideoActions (copy), discoveryVideoLoopEvent (copy), discoveryVideoEndEvent (copy)
	local v26 = if p1 == nil then nil else if not b1 then p1.gameSetTypeId else p1.topicId
	local v27 = React.useCallback(function(n2: number?, s2: string?) -- line: 66
		-- upvalues: t1 (copy), mutedError (copy), v26 (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), getGameTileLayoutData (copy), discoveryVideoPlayEvent (copy), s1 (copy), n1 (copy)
		if n2 ~= nil and t1 ~= nil then
			local v33 = t1[n2]

			if not v33 then
				mutedError("reportVideoPlay requires a valid entry")
			end

			local v34 = v26
			local primaryWideVideoAssetId

			if FFlagLuaAppSupportPrimaryMediaContentMetadata and v33 and v33.primaryWideVideoAssetId then
				primaryWideVideoAssetId = v33.primaryWideVideoAssetId
			else
				local v36 = getGameTileLayoutData(v33, v34)

				primaryWideVideoAssetId = v36 and (v36.primaryMediaAsset and v36.primaryMediaAsset.wideVideoAssetId)
			end

			if not primaryWideVideoAssetId then
				mutedError("reportVideoPlay requires a valid videoAssetId")
			end

			discoveryVideoPlayEvent(s1, {
				videoAssetId = primaryWideVideoAssetId,
				videoPlaybackSessionId = s2 or "INVALID_SESSION_ID",
				universeId = v33.universeId,
				rootPlaceId = v33.placeId,
				gameSetTypeId = v26,
				sortPos = n1
			})
		end
	end, {
		s1,
		t1,
		v26,
		n1
	})
	local v28 = React.useCallback(function(n3: number?, s3: string?, n4: number, n5: number) -- line: 90
		-- upvalues: t1 (copy), mutedError (copy), v26 (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), getGameTileLayoutData (copy), FFlagLuaAppHomeUnifiedVideoEngagementEvents (copy), DiscoveryEventErrorLogger (copy), s1 (copy), discoveryVideoLoadEvent (copy), n1 (copy), VideoLogger (copy), VideoActions (copy)
		if n3 ~= nil and t1 ~= nil then
			local v41 = t1[n3]

			if not v41 then
				mutedError("reportVideoLoad requires a valid entry")
			end

			local v42 = v26
			local primaryWideVideoAssetId

			if FFlagLuaAppSupportPrimaryMediaContentMetadata and v41 and v41.primaryWideVideoAssetId then
				primaryWideVideoAssetId = v41.primaryWideVideoAssetId
			else
				local v44 = getGameTileLayoutData(v41, v42)

				primaryWideVideoAssetId = v44 and (v44.primaryMediaAsset and v44.primaryMediaAsset.wideVideoAssetId)
			end

			if not primaryWideVideoAssetId then
				mutedError("reportVideoLoad requires a valid videoAssetId")
			end

			if FFlagLuaAppHomeUnifiedVideoEngagementEvents and not v41.universeId then
				DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingUniverseId", `reportVideoLoad: entry at index { n3 } is missing universeId for unified "load" on page "{ s1 }"`, {
					index = n3,
					pageContext = s1,
					gameSortId = v26,
					placeId = v41.placeId,
					videoAssetId = primaryWideVideoAssetId
				})
			end

			discoveryVideoLoadEvent(s1, {
				videoAssetId = primaryWideVideoAssetId,
				videoPlaybackSessionId = s3 or "INVALID_SESSION_ID",
				totalDuration = n4,
				loadTime = n5,
				universeId = v41.universeId,
				rootPlaceId = v41.placeId,
				gameSetTypeId = v26,
				sortPos = n1
			})

			if FFlagLuaAppHomeUnifiedVideoEngagementEvents and v41.universeId and primaryWideVideoAssetId then
				VideoLogger.reportVideoAction(VideoActions.load, s1, {
					videoAssetId = primaryWideVideoAssetId,
					source = "universe",
					sourceId = tostring(v41.universeId),
					playbackSessionId = s3 or "INVALID_SESSION_ID"
				}, {
					loadTime = n5
				})
			end
		end
	end, {
		s1,
		t1,
		v26,
		n1
	})
	local v29 = React.useCallback(function(n6: number?, s4: string?) -- line: 140
		-- upvalues: t1 (copy), mutedError (copy), v26 (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), getGameTileLayoutData (copy), discoveryVideoLoopEvent (copy), s1 (copy), n1 (copy)
		if n6 ~= nil and t1 ~= nil then
			local v47 = t1[n6]

			if not v47 then
				mutedError("reportVideoLoop requires a valid entry")
			end

			local v48 = v26
			local primaryWideVideoAssetId

			if FFlagLuaAppSupportPrimaryMediaContentMetadata and v47 and v47.primaryWideVideoAssetId then
				primaryWideVideoAssetId = v47.primaryWideVideoAssetId
			else
				local v50 = getGameTileLayoutData(v47, v48)

				primaryWideVideoAssetId = v50 and (v50.primaryMediaAsset and v50.primaryMediaAsset.wideVideoAssetId)
			end

			if not primaryWideVideoAssetId then
				mutedError("reportVideoLoop requires a valid videoAssetId")
			end

			discoveryVideoLoopEvent(s1, {
				videoAssetId = primaryWideVideoAssetId,
				videoPlaybackSessionId = s4 or "INVALID_SESSION_ID",
				universeId = v47.universeId,
				rootPlaceId = v47.placeId,
				gameSetTypeId = v26,
				sortPos = n1
			})
		end
	end, {
		s1,
		t1,
		v26,
		n1
	})
	local v30 = React.useCallback(function(n7: number?, s5: string, s6: string?, n8: number, s7: string?) -- line: 164
		-- upvalues: t1 (copy), mutedError (copy), v26 (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), getGameTileLayoutData (copy), discoveryVideoEndEvent (copy), s1 (copy), n1 (copy)
		if n7 ~= nil and t1 ~= nil then
			local v56 = t1[n7]

			if not v56 then
				mutedError("reportVideoEnd requires a valid entry")
			end

			local v57 = v26
			local primaryWideVideoAssetId

			if FFlagLuaAppSupportPrimaryMediaContentMetadata and v56 and v56.primaryWideVideoAssetId then
				primaryWideVideoAssetId = v56.primaryWideVideoAssetId
			else
				local v59 = getGameTileLayoutData(v56, v57)

				primaryWideVideoAssetId = v59 and (v59.primaryMediaAsset and v59.primaryMediaAsset.wideVideoAssetId)
			end

			if not primaryWideVideoAssetId then
				mutedError("reportVideoEnd requires a valid videoAssetId")
			end

			discoveryVideoEndEvent(s1, {
				videoAssetId = primaryWideVideoAssetId,
				videoPlaybackSessionId = s6 or "INVALID_SESSION_ID",
				endReason = s5,
				playbackTime = n8,
				universeId = v56.universeId,
				rootPlaceId = v56.placeId,
				gameSetTypeId = v26,
				sortPos = n1,
				targetUniverseId = s7
			})
		end
	end, {
		s1,
		t1,
		v26,
		n1
	})

	return {
		reportVideoPlay = v27,
		reportVideoLoad = v28,
		reportVideoLoop = v29,
		reportVideoEnd = v30
	}
end
