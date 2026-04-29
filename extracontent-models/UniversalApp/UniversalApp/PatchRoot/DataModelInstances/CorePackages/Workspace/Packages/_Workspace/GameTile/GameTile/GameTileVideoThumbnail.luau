local GameTile = script:FindFirstAncestor("GameTile")
local GameTileParent = GameTile.Parent
local React = require(GameTileParent.React)
local VideoUtils = require(GameTileParent.VideoUtils)
local VideoPlayer = VideoUtils.VideoPlayer
local VideoPlaybackCoordinator = VideoUtils.VideoPlaybackCoordinator

require(GameTile.GameTileTypes)

local FFlagLuaAppEdpMediaGalleryFullScreen = require(GameTileParent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppHomeUnifiedVideoEngagementEvents = require(GameTileParent.SharedFlags).FFlagLuaAppHomeUnifiedVideoEngagementEvents
local FFlagLuaAppHomeTouchAutoplay = require(GameTileParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppVideoTileDisableActivation = require(GameTileParent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppVideoTileHideCenterPlayButton = require(GameTileParent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton

return function(t1: {[any]: any}) --[[ GameTileVideoThumbnail ]] -- line: 40
	-- upvalues: React (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoPlaybackCoordinator (copy), FFlagLuaAppHomeUnifiedVideoEngagementEvents (copy), VideoPlayer (copy), FFlagLuaAppVideoTileHideCenterPlayButton (copy), FFlagLuaAppVideoTileDisableActivation (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy)
	local v13 = React.useCallback(function(n1: number, n2: number) -- line: 42
		-- upvalues: t1 (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoPlaybackCoordinator (copy)
		if t1.videoAnalytics then
			t1.videoAnalytics.reportVideoLoad(t1.itemIndex, if not FFlagLuaAppHomeTouchAutoplay or not t1.videoPlaybackCoordinator then VideoPlaybackCoordinator.default.currentPlaybackSessionId else t1.videoPlaybackCoordinator.currentPlaybackSessionId, n1, n2)
		end
	end, {
		t1.itemIndex,
		t1.videoAnalytics,
		if not FFlagLuaAppHomeTouchAutoplay then nil else t1.videoPlaybackCoordinator
	})
	local v14 = React.useCallback(function() -- line: 62
		-- upvalues: t1 (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoPlaybackCoordinator (copy)
		if t1.videoAnalytics then
			t1.videoAnalytics.reportVideoLoop(t1.itemIndex, if not FFlagLuaAppHomeTouchAutoplay or not t1.videoPlaybackCoordinator then VideoPlaybackCoordinator.default.currentPlaybackSessionId else t1.videoPlaybackCoordinator.currentPlaybackSessionId)
		end
	end, {
		t1.itemIndex,
		t1.videoAnalytics,
		if not FFlagLuaAppHomeTouchAutoplay then nil else t1.videoPlaybackCoordinator
	})
	local v15 = nil

	if FFlagLuaAppHomeUnifiedVideoEngagementEvents then
		v15 = React.useMemo(function() -- line: 82
			-- upvalues: t1 (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoPlaybackCoordinator (copy)
			return {
				videoAnalyticsData = {
					source = "universe",
					sourceId = t1.universeId
				},
				getPlaybackSessionId = function() --[[ getPlaybackSessionId ]] -- line: 88
					-- upvalues: FFlagLuaAppHomeTouchAutoplay (copy), t1 (copy), VideoPlaybackCoordinator (copy)
					if FFlagLuaAppHomeTouchAutoplay and t1.videoPlaybackCoordinator then
						return t1.videoPlaybackCoordinator.currentPlaybackSessionId
					end

					return VideoPlaybackCoordinator.default.currentPlaybackSessionId
				end
			}
		end, {
			t1.universeId,
			if not FFlagLuaAppHomeTouchAutoplay then nil else t1.videoPlaybackCoordinator
		})
	end

	return React.createElement(VideoPlayer, {
		video = t1.video,
		thumbnail = t1.image,
		shouldStartPlayback = t1.playing,
		muted = true,
		looped = t1.looped,
		Size = t1.Size,
		ScaleType = if not t1.isTileContained then nil else Enum.ScaleType.Tile,
		ZIndex = t1.ZIndex,
		cornerRadius = t1.cornerRadius,
		hideCenterPlayButton = not not FFlagLuaAppVideoTileHideCenterPlayButton or nil,
		disableActivation = not not FFlagLuaAppVideoTileDisableActivation or nil,
		onVideoLoaded = v13,
		onVideoLooped = v14,
		onVideoPlayerActivated = if not FFlagLuaAppVideoTileDisableActivation then if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.onActivated else nil,
		videoAnalyticsContext = if not FFlagLuaAppHomeUnifiedVideoEngagementEvents then nil else v15
	})
end
