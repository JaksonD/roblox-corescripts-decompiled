local GameTile = script:FindFirstAncestor("GameTile")
local GameTileParent = GameTile.Parent
local React = require(GameTileParent.React)
local RetrievalStatus = require(GameTileParent.Http).Enum.RetrievalStatus
local RoactNetworking = require(GameTileParent.RoactServiceTags).RoactNetworking
local RoactUtils = require(GameTileParent.RoactUtils)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useRoactService = require(GameTileParent.RobloxAppHooks).useRoactService
local useIsVideoEligible = require(GameTile.Video.useIsVideoEligible)
local VideoUtils = require(GameTileParent.VideoUtils)
local VideoPlaybackDetector = VideoUtils.VideoPlaybackDetector
local VideoEndReason = VideoUtils.AnalyticsEnums.VideoEndReason
local useCanDevicePlayVideoPreview = VideoUtils.useCanDevicePlayVideoPreview
local FetchGamePlayabilityAndProductInfo = require(GameTileParent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(GameTileParent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppTileVideoDeviceMemoryBlocking = require(GameTileParent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local v18 = game:DefineFastFlag("LuaAppGameTileVideoManufacturerDeny", false)
local v19 = game:DefineFastFlag("LuaAppGameTileVideoDeviceDeny", false)
local v20 = game:DefineFastFlag("LuaAppGameTileVideoMaxMemoryDeny", false)
local v21 = game:DefineFastFlag("LuaAppGameTileVideoAvailableRamDeny", false)
local v22 = game:DefineFastInt("LuaAppGameTileVideoMaxMemoryThresholdMb", -1)
local v23 = game:DefineFastInt("LuaAppGameTileVideoAvailableRamThresholdMb", -1)
local v24 = game:DefineFastString("LuaAppGameTileVideoManufacturerPipeDenyList", "")
local v25 = game:DefineFastString("LuaAppGameTileVideoDevicePipeDenyList", "")
local FFlagLuaAppHomeTouchAutoplay = require(GameTileParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local t1 = nil

if FFlagLuaAppTileVideoDeviceMemoryBlocking then
	t1 = {
		enableManufacturerDeny = v18,
		enableDeviceDeny = v19,
		enableMaxMemoryDeny = v20,
		enableAvailableRamDeny = v21,
		maxMemoryThresholdMb = v22,
		availableRamThresholdMb = v23,
		manufacturerDenyList = v24,
		deviceDenyList = v25
	}
end

return function(t2: {[any]: any}) --[[ GameVideoPlaybackDetector ]] -- line: 70
	-- upvalues: useDispatch (copy), useRoactService (copy), RoactNetworking (copy), useSelector (copy), FetchGamePlayabilityAndProductInfo (copy), useIsVideoEligible (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (copy), React (copy), useCanDevicePlayVideoPreview (copy), t1 (ref), RetrievalStatus (copy), VideoEndReason (copy), VideoPlaybackDetector (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppHomeTouchAutoplay (copy)
	local v29 = useDispatch()
	local v30 = useRoactService(RoactNetworking)
	local v31 = useSelector(function(p1) -- line: 74
		-- upvalues: FetchGamePlayabilityAndProductInfo (copy), t2 (copy)
		return FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p1, t2.universeId)
	end)
	local v32 = useIsVideoEligible(t2.universeId)
	local u33 = nil
	local u34 = nil
	local v35 = nil

	if FFlagLuaAppTileVideoDeviceMemoryBlocking then
		local v36, v37 = React.useState(false)

		u33 = v37
		u34 = useCanDevicePlayVideoPreview(t1, t2.universeId, t2.pageContext)
		v35 = v32 and v36
	end

	local v38 = React.useCallback(function(p2) -- line: 92
		-- upvalues: t2 (copy), v31 (copy), RetrievalStatus (copy), VideoEndReason (copy)
		if t2.videoAnalytics and v31 == RetrievalStatus.Done then
			t2.videoAnalytics.reportVideoEnd(t2.itemIndex, VideoEndReason.PlayabilityCheckFailed, p2, -1)
		end
	end, {
		t2.videoAnalytics,
		v31
	})
	local v39 = React.useCallback(function() -- line: 99
		-- upvalues: v31 (copy), RetrievalStatus (copy), v29 (copy), FetchGamePlayabilityAndProductInfo (copy), v30 (copy), t2 (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (copy), u33 (ref), u34 (ref)
		if v31 == RetrievalStatus.NotStarted or v31 == RetrievalStatus.Failed then
			v29(FetchGamePlayabilityAndProductInfo.Fetch(v30, t2.universeId))
		end

		if FFlagLuaAppTileVideoDeviceMemoryBlocking then
			u33(u34())
		end
	end, {
		t2.universeId,
		v31,
		v29,
		v30,
		u34
	})

	return React.createElement(VideoPlaybackDetector, {
		videoKey = t2.videoKey,
		itemIndex = t2.itemIndex,
		itemFrameRef = t2.tileRef,
		isHoverSupported = t2.isHoverSupported,
		isHovered = t2.isHovered,
		autoplay = if not FFlagLuaAppEdpMediaGalleryVideoPreview then nil else t2.autoplay,
		videoPlaybackCoordinator = if not FFlagLuaAppHomeTouchAutoplay or not t2.videoPlaybackContext then nil else t2.videoPlaybackContext.videoPlaybackCoordinator,
		onPlaybackChange = t2.onPlaybackChange,
		videoAnalytics = t2.videoAnalytics,
		videoDwellTimeInSec = t2.videoDwellTimeInSec,
		videoVisiblePercent = t2.videoVisiblePercent,
		isVideoEligible = if not FFlagLuaAppTileVideoDeviceMemoryBlocking then v32 else v35,
		onVideoIneligible = v38,
		onPlaybackCandidate = v39,
		viewportVideoAutoplayController = if not FFlagLuaAppHomeTouchAutoplay or not t2.videoPlaybackContext then nil else t2.videoPlaybackContext.viewportVideoAutoplayController
	})
end
