local ExperienceService = game:GetService("ExperienceService")
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local VideoUtilsParent = VideoUtils.Parent

require(VideoUtilsParent.AppCommonLib)

local React = require(VideoUtilsParent.React)
local Responsive = require(VideoUtilsParent.Responsive)
local useLastInput = Responsive.useLastInput
local useNavigationFocus = require(VideoUtilsParent.Navigation).useNavigationFocus
local useSelector = require(VideoUtilsParent.RoactUtils).Hooks.RoactRodux.useSelector

require(VideoUtils.Analytics.VideoAnalyticsTypes)

local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local VideoPlaybackCoordinator = require(VideoUtils.VideoPlaybackCoordinator)
local VideoHoverPlaybackDetector = require(VideoUtils.VideoHoverPlaybackDetector)
local VideoViewportPlaybackDetector = require(VideoUtils.VideoViewportPlaybackDetector)

require(VideoUtils.ViewportVideoAutoplayController)

local FFlagLuaAppEdpMediaGalleryVideoPreview = require(VideoUtilsParent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryFullScreen = require(VideoUtilsParent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagVideoPlaybackDetectorCancelPendingScanTask = require(VideoUtilsParent.SharedFlags).FFlagVideoPlaybackDetectorCancelPendingScanTask
local FIntVideoPlaybackDetectorScanDebounceInMilliseconds = require(VideoUtilsParent.SharedFlags).FIntVideoPlaybackDetectorScanDebounceInMilliseconds
local FFlagLuaAppRefactorVideoPlaybackDetector = require(VideoUtilsParent.SharedFlags).FFlagLuaAppRefactorVideoPlaybackDetector
local FFlagLuaAppHomeTouchAutoplay = require(VideoUtilsParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local u20 = nil

if not FFlagLuaAppRefactorVideoPlaybackDetector then
	u20 = not FFlagVideoPlaybackDetectorCancelPendingScanTask and 0.5 or FIntVideoPlaybackDetectorScanDebounceInMilliseconds / 1000
end

return function(t1: {[any]: any}) --[[ VideoPlaybackDetector ]] -- line: 75
	-- upvalues: VideoPlaybackCoordinator (copy), React (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), useLastInput (copy), FFlagLuaAppRefactorVideoPlaybackDetector (copy), useNavigationFocus (copy), useSelector (copy), VideoEndReason (copy), Responsive (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), u20 (ref), FFlagVideoPlaybackDetectorCancelPendingScanTask (copy), AppLifecycleObserverService (copy), ExperienceService (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoHoverPlaybackDetector (copy), VideoViewportPlaybackDetector (copy)
	local v22 = t1.videoPlaybackCoordinator or VideoPlaybackCoordinator.default
	local v23, v24 = React.useState(false)
	local v25 = if not FFlagLuaAppEdpMediaGalleryVideoPreview then useLastInput() else nil
	local u26 = nil
	local u27 = nil
	local u28 = nil
	local u29 = nil

	if not FFlagLuaAppRefactorVideoPlaybackDetector then
		u26 = useNavigationFocus()

		local v30 = useSelector(function(p1) -- line: 90
			return p1.ScreenSize
		end)

		u27 = useSelector(function(p2) -- line: 94
			return p2.TopBar.topBarHeight
		end)
		u28 = useSelector(function(p3) -- line: 98
			return p3.GlobalGuiInset
		end)
		u29 = React.useMemo(function() -- line: 102
			-- upvalues: u27 (ref), v30 (copy), u28 (ref)
			return {
				min = Vector2.new(0, u27),
				max = Vector2.new(v30.X, v30.Y - u28.bottom)
			}
		end, {
			u27,
			v30,
			u28
		})
	end

	local v31 = React.useCallback(function(b1: boolean) -- line: 111
		-- upvalues: t1 (copy), v22 (copy)
		if t1.onPlaybackCandidate then
			t1.onPlaybackCandidate()
		end

		if t1.isVideoEligible then
			v22:requestPlayback(t1.videoKey, b1, t1.videoDwellTimeInSec, t1.itemIndex, t1.videoAnalytics)

			return
		end

		if t1.onVideoIneligible then
			t1.onVideoIneligible(v22.currentPlaybackSessionId)
		end
	end, {
		t1.videoKey,
		t1.itemIndex,
		t1.videoAnalytics,
		t1.isVideoEligible,
		t1.onVideoIneligible,
		t1.onPlaybackCandidate,
		t1.videoDwellTimeInSec,
		v22
	})
	local v32 = React.useCallback(function(s1: string) -- line: 141
		-- upvalues: v22 (copy), t1 (copy)
		v22:cancelPlayback(t1.videoKey, s1, t1.itemIndex, t1.videoAnalytics)
	end, {
		t1.videoKey,
		t1.itemIndex,
		t1.videoAnalytics,
		v22
	})

	React.useEffect(function() -- line: 153
		-- upvalues: t1 (copy), v23 (copy), v24 (copy), v22 (copy)
		local v38 = v22.playingVideoKey == t1.videoKey

		if v38 ~= v23 then
			t1.onPlaybackChange(v38)
			v24(v38)
		end

		local u39 = v22.changed:connect(function(p4) -- line: 165
			-- upvalues: t1 (copy), v23 (copy), v24 (copy)
			local v55 = p4 == t1.videoKey

			if v55 ~= v23 then
				t1.onPlaybackChange(v55)
				v24(v55)
			end
		end)

		return function() -- line: 169
			-- upvalues: u39 (ref)
			if u39 ~= nil then
				u39:disconnect()
				u39 = nil
			end
		end
	end, {
		t1.videoKey,
		t1.onPlaybackChange,
		v22,
		v23
	})

	if not FFlagLuaAppRefactorVideoPlaybackDetector then
		React.useEffect(function() -- line: 180
			-- upvalues: t1 (copy), v31 (copy), v32 (copy), VideoEndReason (copy)
			if not t1.isHoverSupported then
				return
			end

			if t1.isHovered then
				v31(false)

				return
			end

			v32(VideoEndReason.Unhovered)
		end, {
			t1.isHoverSupported,
			t1.isHovered,
			v31,
			v32
		})
		React.useEffect(function() -- line: 201
			-- upvalues: FFlagLuaAppEdpMediaGalleryVideoPreview (copy), t1 (copy), v25 (copy), Responsive (copy), v22 (copy), u26 (ref), FFlagLuaAppEdpMediaGalleryFullScreen (copy), u29 (ref), v31 (copy), v32 (copy), VideoEndReason (copy), u20 (ref), FFlagVideoPlaybackDetectorCancelPendingScanTask (copy), AppLifecycleObserverService (copy), ExperienceService (copy)
			if FFlagLuaAppEdpMediaGalleryVideoPreview then
				if not t1.autoplay then
					return nil
				end
			elseif v25 ~= Responsive.Input.Touch then
				return nil
			end

			local t2 = {}
			local u41 = nil

			if t1.itemFrameRef.current ~= nil then
				local current = t1.itemFrameRef.current
				local timestamp = nil
				local u44 = nil

				local function onItemFrameLayoutChange() -- line: 238
					-- upvalues: u44 (ref), timestamp (ref), u20 (ref), v22 (copy), u26 (ref), FFlagLuaAppEdpMediaGalleryFullScreen (copy), t1 (copy), u29 (ref), v31 (copy), v32 (copy), VideoEndReason (copy), FFlagVideoPlaybackDetectorCancelPendingScanTask (copy), u41 (ref)
					if u44 ~= nil then
						return
					end

					local n1 = 0

					if timestamp ~= nil then
						u44 = timestamp + u20
						n1 = u44 - tick()
					end

					if n1 > 0 then
						local thread = task.delay(n1, function() -- line: 251
							-- upvalues: u44 (ref), timestamp (ref), v22 (copy), u26 (ref), FFlagLuaAppEdpMediaGalleryFullScreen (copy), t1 (copy), u29 (ref), v31 (copy), v32 (copy), VideoEndReason (copy)
							u44 = nil
							timestamp = tick()

							if v22:isPlaybackCandidate(u26, if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.isItemOccluded, t1.itemFrameRef, u29, t1.videoVisiblePercent) then
								v31(true)

								return
							end

							v32(VideoEndReason.ExitViewport)
						end)

						if FFlagVideoPlaybackDetectorCancelPendingScanTask then
							u41 = thread

							return
						end
					else
						u44 = nil
						timestamp = tick()

						if v22:isPlaybackCandidate(u26, if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.isItemOccluded, t1.itemFrameRef, u29, t1.videoVisiblePercent) then
							v31(true)

							return
						end

						v32(VideoEndReason.ExitViewport)
					end
				end

				timestamp = tick()

				if v22:isPlaybackCandidate(u26, if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.isItemOccluded, t1.itemFrameRef, u29, t1.videoVisiblePercent) then
					v31(true)
				else
					v32(VideoEndReason.ExitViewport)
				end

				local connection = AppLifecycleObserverService.OnUnhide:Connect(function() -- line: 268
					-- upvalues: timestamp (ref), v22 (copy), u26 (ref), FFlagLuaAppEdpMediaGalleryFullScreen (copy), t1 (copy), u29 (ref), v31 (copy), v32 (copy), VideoEndReason (copy)
					timestamp = tick()

					if v22:isPlaybackCandidate(u26, if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.isItemOccluded, t1.itemFrameRef, u29, t1.videoVisiblePercent) then
						v31(true)

						return
					end

					v32(VideoEndReason.ExitViewport)
				end)
				local v47 = ExperienceService:RegisterForExperienceLeave(function() -- line: 274
					-- upvalues: timestamp (ref), v22 (copy), u26 (ref), FFlagLuaAppEdpMediaGalleryFullScreen (copy), t1 (copy), u29 (ref), v31 (copy), v32 (copy), VideoEndReason (copy)
					timestamp = tick()

					if v22:isPlaybackCandidate(u26, if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.isItemOccluded, t1.itemFrameRef, u29, t1.videoVisiblePercent) then
						v31(true)

						return
					end

					v32(VideoEndReason.ExitViewport)
				end)

				t2 = {
					current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onItemFrameLayoutChange),
					current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onItemFrameLayoutChange)
				}
				table.insert(t2, connection)
				table.insert(t2, v47)
			end

			return function() -- line: 287
				-- upvalues: FFlagVideoPlaybackDetectorCancelPendingScanTask (copy), u41 (ref), t2 (ref)
				if FFlagVideoPlaybackDetectorCancelPendingScanTask and u41 then
					task.cancel(u41)
					u41 = nil
				end

				for _, v59 in t2 do
					v59:Disconnect()
				end
			end
		end, {
			if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.isItemOccluded,
			if not FFlagLuaAppEdpMediaGalleryVideoPreview then nil else t1.autoplay,
			t1.itemFrameRef,
			t1.videoVisiblePercent,
			if not FFlagLuaAppEdpMediaGalleryVideoPreview then v25 else nil,
			u26,
			u29,
			v22,
			v31,
			v32
		})
	end

	React.useEffect(function() -- line: 315
		-- upvalues: FFlagLuaAppHomeTouchAutoplay (copy), t1 (copy), AppLifecycleObserverService (copy), VideoEndReason (copy), v32 (copy), ExperienceService (copy)
		local viewportVideoAutoplayController = nil
		local current = nil

		if FFlagLuaAppHomeTouchAutoplay then
			viewportVideoAutoplayController = t1.viewportVideoAutoplayController
			current = t1.itemFrameRef.current
		end

		local connection = AppLifecycleObserverService.OnHide:Connect(function() -- line: 324
			-- upvalues: FFlagLuaAppHomeTouchAutoplay (copy), viewportVideoAutoplayController (ref), VideoEndReason (copy), v32 (copy)
			if FFlagLuaAppHomeTouchAutoplay and viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(VideoEndReason.AppBackgrounded)

				return
			end

			v32(VideoEndReason.AppBackgrounded)
		end)
		local u51 = ExperienceService:RegisterForExperienceJoin(function() -- line: 334
			-- upvalues: FFlagLuaAppHomeTouchAutoplay (copy), viewportVideoAutoplayController (ref), VideoEndReason (copy), v32 (copy)
			if FFlagLuaAppHomeTouchAutoplay and viewportVideoAutoplayController then
				viewportVideoAutoplayController:reset(VideoEndReason.ExperienceLaunched)

				return
			end

			v32(VideoEndReason.ExperienceLaunched)
		end)

		return function() -- line: 343
			-- upvalues: FFlagLuaAppHomeTouchAutoplay (copy), viewportVideoAutoplayController (ref), current (ref), VideoEndReason (copy), v32 (copy), u51 (ref), connection (ref)
			if FFlagLuaAppHomeTouchAutoplay and (viewportVideoAutoplayController and current) then
				viewportVideoAutoplayController:resetIfActiveInstance(current, VideoEndReason.Unmounted)
			else
				v32(VideoEndReason.Unmounted)
			end

			if u51 then
				u51:Disconnect()
				u51 = nil
			end

			if connection then
				connection:Disconnect()
				connection = nil
			end
		end
	end, {
		v32,
		if not FFlagLuaAppHomeTouchAutoplay then nil else t1.viewportVideoAutoplayController,
		if not FFlagLuaAppHomeTouchAutoplay then nil else t1.itemFrameRef
	})

	if FFlagLuaAppRefactorVideoPlaybackDetector then
		if t1.isHoverSupported then
			return React.createElement(VideoHoverPlaybackDetector, {
				videoPlaybackCoordinator = v22,
				requestVideoPlayback = v31,
				cancelVideoPlayback = v32,
				isHovered = t1.isHovered
			})
		end

		if FFlagLuaAppEdpMediaGalleryVideoPreview and t1.autoplay or v25 == Responsive.Input.Touch then
			return React.createElement(VideoViewportPlaybackDetector, {
				videoPlaybackCoordinator = v22,
				requestVideoPlayback = v31,
				cancelVideoPlayback = v32,
				itemFrameRef = t1.itemFrameRef,
				isItemOccluded = t1.isItemOccluded,
				videoVisiblePercent = t1.videoVisiblePercent,
				viewportVideoAutoplayController = if not FFlagLuaAppHomeTouchAutoplay then nil else t1.viewportVideoAutoplayController
			})
		end

		return nil
	end

	return nil
end
