local Songbird = script:FindFirstAncestor("Songbird")
local Cryo = require(Songbird.Parent.Cryo)
local Foundation = require(Songbird.Parent.Foundation)
local MediaPlayback = require(Songbird.Parent.MediaPlayback)
local React = require(Songbird.Parent.React)
local ReactUtils = require(Songbird.Parent.ReactUtils)
local SignalsReact = require(Songbird.Parent.SignalsReact)
local RoundIconButton = require(Songbird.Components.RoundIconButton)
local AudioPlaybackTimeline = require(Songbird.Components.AudioPlaybackTimeline)

require(Songbird.types)

local AnalyticActions = require(Songbird.Analytics.AnalyticActions)
local sendAudioPlayerAnalytics = require(Songbird.Analytics.sendAudioPlayerAnalytics)
local useStopSongOnPageNavigation = require(Songbird.Hooks.useStopSongOnPageNavigation)
local GetFFlagLuaAppPersistentMusicPlayer = require(Songbird.Parent.SharedFlags).GetFFlagLuaAppPersistentMusicPlayer
local GetFFlagAudioPlayerCanSkipTracks = require(Songbird.Parent.SharedFlags).GetFFlagAudioPlayerCanSkipTracks
local getAudioPlaybackStore = MediaPlayback.getAudioPlaybackStore
local useAudioStore = MediaPlayback.useAudioStore
local useCallback = React.useCallback
local useRef = React.useRef
local useEffect = React.useEffect
local createNextOrder = ReactUtils.createNextOrder
local usePrevious = ReactUtils.usePrevious
local useSignalState = SignalsReact.useSignalState
local useSignalBinding = SignalsReact.useSignalBinding
local t1 = {
	isNavigationFocus = true
}
local vector2 = Vector2.new(320, 320)

return function(t2: {[any]: any}) --[[ AudioPlayer ]] -- line: 58
	-- upvalues: Cryo (copy), t1 (copy), createNextOrder (copy), useAudioStore (copy), useSignalState (copy), useSignalBinding (copy), GetFFlagAudioPlayerCanSkipTracks (copy), getAudioPlaybackStore (copy), useCallback (copy), sendAudioPlayerAnalytics (copy), AnalyticActions (copy), useRef (copy), GetFFlagLuaAppPersistentMusicPlayer (copy), useStopSongOnPageNavigation (copy), usePrevious (copy), useEffect (copy), React (copy), Foundation (copy), vector2 (copy), AudioPlaybackTimeline (copy), RoundIconButton (copy)
	local v27 = Cryo.Dictionary.join(t1, t2)
	local v28 = createNextOrder()
	local v29 = useAudioStore(v27.audio.assetId)
	local v30 = useSignalState(v29.getIsPlaying)
	local v31 = useSignalState(v29.getIsElapsed)
	local v32 = useSignalState(v29.getDuration)
	local v33 = useSignalBinding(v29.getElapsed)
	local v34 = if not GetFFlagAudioPlayerCanSkipTracks() then nil else useSignalState(getAudioPlaybackStore)
	local v35 = if not GetFFlagAudioPlayerCanSkipTracks() then nil else useSignalState(v34.hasNextSong)
	local v36 = if not GetFFlagAudioPlayerCanSkipTracks() then nil else useSignalState(v34.hasPrevSong)
	local v37 = v35 or v36
	local v38 = useCallback(function(p1) -- line: 82
		-- upvalues: v27 (copy), sendAudioPlayerAnalytics (copy), v33 (copy)
		local v48 = v27.audio.assetId:gsub("rbxassetid://", "")
		local v49 = if not v27.audio.thumbnailAssetId then nil else v27.audio.thumbnailAssetId:gsub("rbxassetid://", "")

		sendAudioPlayerAnalytics({
			action = p1,
			songId = v48,
			thumbnailId = v49 or "-1",
			source = v27.analyticsSource,
			listenDurationSeconds = v33:getValue()
		})
	end, {
		v27.audio.assetId,
		v27.audio.thumbnail,
		v27.analyticsSource,
		v33
	})
	local v39 = useCallback(function() -- line: 109
		-- upvalues: v38 (copy), AnalyticActions (copy)
		v38(AnalyticActions.AudioElapsed)
		v38(AnalyticActions.AudioStopped)
	end, { v38 })
	local v40 = useRef(false)
	local v41 = useCallback(function() -- line: 116
		-- upvalues: v40 (copy), v30 (copy), v29 (copy)
		v40.current = v30
		v29.pause()
	end, {
		v29.pause,
		v30
	})
	local v42 = useCallback(function(n1: number) -- line: 121
		-- upvalues: v29 (copy), v32 (copy)
		v29.seek(v32 * n1)
	end, {
		v29.seek,
		v32
	})
	local v43 = useCallback(function() -- line: 125
		-- upvalues: v40 (copy), v29 (copy)
		if v40.current then
			v29.play()
		end
	end, { v29.play })
	local v44 = useCallback(function() -- line: 132
		-- upvalues: v30 (copy), v38 (copy), AnalyticActions (copy), v29 (copy), GetFFlagAudioPlayerCanSkipTracks (copy), v34 (copy), getAudioPlaybackStore (copy)
		if v30 then
			v38(AnalyticActions.AudioPause)
			v38(AnalyticActions.AudioStopped)
			v29.pause()

			return
		end

		v38(AnalyticActions.AudioPlay)

		if GetFFlagAudioPlayerCanSkipTracks() then
			v34.pauseAll()
		else
			getAudioPlaybackStore(false).pauseAll()
		end

		v29.play()
	end, {
		v29.play,
		v29.pause,
		v30,
		if not GetFFlagAudioPlayerCanSkipTracks() then nil else v34
	})

	if not GetFFlagLuaAppPersistentMusicPlayer() then
		local v45 = useCallback(function() -- line: 156
			-- upvalues: v38 (copy), AnalyticActions (copy)
			v38(AnalyticActions.AudioStopped)
		end, { v38 })

		useStopSongOnPageNavigation(v27.isNavigationFocus, v45)

		local v46 = usePrevious(v31)

		useEffect(function() -- line: 162
			-- upvalues: v31 (copy), v46 (copy), v39 (copy)
			if v31 and not v46 then
				v39()
			end
		end, { v31 })
	end

	return React.createElement(Foundation.View, {
		tag = "auto-xy col align-x-center gap-large",
		LayoutOrder = v27.LayoutOrder
	}, {
		AudioDetails = React.createElement(Foundation.View, {
			tag = "size-full-0 auto-y col align-x-center gap-xlarge"
		}, {
			AlbumArt = React.createElement(Foundation.Image, {
				tag = "size-full shrink bg-surface-100 radius-medium",
				sizeConstraint = {
					MaxSize = vector2
				},
				aspectRatio = 1,
				Image = v27.audio.thumbnail,
				LayoutOrder = v28()
			}),
			Info = React.createElement(Foundation.View, {
				tag = "size-full-0 auto-y grow col align-x-center gap-medium",
				LayoutOrder = v28()
			}, {
				Title = React.createElement(Foundation.Text, {
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = v27.audio.title,
					LayoutOrder = v28()
				}),
				Artist = React.createElement(Foundation.Text, {
					tag = "auto-xy text-body-large content-default text-truncate-end",
					Text = v27.audio.artist,
					LayoutOrder = v28()
				})
			})
		}),
		PlaybackProgress = React.createElement(AudioPlaybackTimeline, {
			LayoutOrder = v28(),
			duration = v32,
			elapsed = v33,
			onDragTimeline = v42,
			onDragTimelineStart = v41,
			onDragTimelineEnd = v43
		}),
		PlaybackControls = React.createElement(Foundation.View, {
			tag = "auto-xy row gap-medium align-y-center",
			LayoutOrder = v28()
		}, {
			PrevButton = if not GetFFlagAudioPlayerCanSkipTracks() or not v37 then nil else React.createElement(Foundation.IconButton, {
				icon = Foundation.Enums.IconName.SkipStartLarge,
				isDisabled = not v36,
				onActivated = v34.playPrevSong,
				LayoutOrder = v28()
			}),
			PlaybackToggleButton = if not GetFFlagAudioPlayerCanSkipTracks() then React.createElement(RoundIconButton, {
				icon = not v30 and "icons/controls/media-play-medium" or "icons/controls/media-pause-medium",
				onActivated = v44,
				LayoutOrder = v28()
			}) else React.createElement(Foundation.IconButton, {
				icon = if not v30 then Foundation.Enums.IconName.PlayLarge else Foundation.Enums.IconName.PauseLarge,
				isCircular = true,
				variant = Foundation.Enums.ButtonVariant.Emphasis,
				onActivated = v44,
				LayoutOrder = v28()
			}),
			NextButton = if not GetFFlagAudioPlayerCanSkipTracks() or not v37 then nil else React.createElement(Foundation.IconButton, {
				icon = Foundation.Enums.IconName.SkipEndLarge,
				isDisabled = not v35,
				onActivated = v34.playNextSong,
				LayoutOrder = v28()
			})
		})
	})
end
