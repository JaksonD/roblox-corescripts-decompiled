local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("VideoUtils").Parent
local LoggingProtocol = require(Parent.LoggingProtocol)
local React = require(Parent.React)
local Responsive = require(Parent.Responsive)

require(Parent.AppCommonLib)

local LoadableVideoFrame = require(script.Parent.LoadableVideoFrame)
local RoundIconButton = require(script.Parent.RoundIconButton)
local VideoActions = require(script.Parent.Analytics.Enums).VideoActions

require(script.Parent.Analytics.VideoAnalyticsTypes)

local VideoLogger = require(script.Parent.Analytics.VideoLogger)
local VideoPlayerBottomOverlay = require(script.Parent.VideoPlayerBottomOverlay)
local reportWarning = require(Parent.DiscoveryAnalytics).Points.reportWarning
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppVideoTileDisableActivation = require(Parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppVideoTileHideCenterPlayButton = require(Parent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton
local v16 = game:DefineFastInt("VideoPlayerPlaybackEndThresholdInMs", 100) / 1000

return function(t1: {[any]: any}) --[[ VideoPlayer ]] -- line: 76
	-- upvalues: FFlagLuaAppEdpMediaGalleryFullScreen (copy), React (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), RunService (copy), reportWarning (copy), LoggingProtocol (copy), VideoLogger (copy), v16 (copy), Responsive (copy), VideoActions (copy), FFlagLuaAppVideoTileDisableActivation (copy), LoadableVideoFrame (copy), FFlagLuaAppVideoTileHideCenterPlayButton (copy), RoundIconButton (copy), VideoPlayerBottomOverlay (copy)
	local v18 = t1.showMuteButton or FFlagLuaAppEdpMediaGalleryFullScreen and (t1.showPlayButton or t1.showProgressBar)
	local v19, v20 = React.useState(false)
	local v21, v22 = React.useState(t1.muted)
	local v23 = React.useCallback(function(n1: number, n2: number) -- line: 84
		-- upvalues: v20 (copy), t1 (copy)
		v20(true)

		if t1.onVideoLoaded then
			t1.onVideoLoaded(n1, n2)
		end
	end, { t1.onVideoLoaded })

	React.useEffect(function() -- line: 92
		-- upvalues: t1 (copy), v21 (copy)
		if t1.onMutedChanged then
			t1.onMutedChanged(v21)
		end
	end, {
		t1.onMutedChanged,
		v21
	})

	local v24 = React.useCallback(function() -- line: 98
		-- upvalues: v22 (copy), t1 (copy)
		v22(function(p1) -- line: 99
			-- upvalues: t1 (copy)
			if t1.onMuteButtonActivated then
				t1.onMuteButtonActivated(p1)
			end

			return not p1
		end)
	end, { t1.onMuteButtonActivated })
	local v25 = React.useMemo(function() -- line: 107
		-- upvalues: t1 (copy), v21 (copy), v24 (copy)
		if t1.showMuteButton then
			return {
				muted = v21,
				onMuteButtonActivated = v24
			}
		end

		return nil
	end, {
		t1.showMuteButton,
		v21,
		v24
	})
	local u26 = nil

	if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen then
		u26 = React.useRef(nil)
	end

	local u27 = nil
	local u28 = nil

	if FFlagLuaAppEdpMediaGalleryFullScreen then
		local v29, v30 = React.useBinding(0)

		u27 = v29
		u28 = v30
	end

	if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen then
		React.useEffect(function() -- line: 129
			-- upvalues: u26 (ref), t1 (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), RunService (copy), u28 (ref)
			local current = u26.current

			if t1.shouldStartPlayback and ((FFlagLuaAppEdpMediaGalleryAutoAdvance and t1.onVideoProgressChanged or FFlagLuaAppEdpMediaGalleryFullScreen and t1.showProgressBar) and current) then
				local connection = RunService.RenderStepped:Connect(function() -- line: 137
					-- upvalues: FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), t1 (copy), current (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), u28 (ref)
					if FFlagLuaAppEdpMediaGalleryAutoAdvance and t1.onVideoProgressChanged then
						t1.onVideoProgressChanged(not (current.TimeLength > 0) and 0 or current.TimePosition / current.TimeLength)
					end

					if FFlagLuaAppEdpMediaGalleryFullScreen and t1.showProgressBar then
						u28(not (current.TimeLength > 0) and 0 or current.TimePosition / current.TimeLength)
					end
				end)

				return function() -- line: 151
					-- upvalues: connection (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), t1 (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), u28 (ref)
					connection:Disconnect()

					if FFlagLuaAppEdpMediaGalleryAutoAdvance and t1.onVideoProgressChanged then
						t1.onVideoProgressChanged(0)
					end

					if FFlagLuaAppEdpMediaGalleryFullScreen and t1.showProgressBar then
						u28(0)
					end
				end
			end

			return nil
		end, {
			t1.shouldStartPlayback,
			if not FFlagLuaAppEdpMediaGalleryAutoAdvance then nil else t1.onVideoProgressChanged,
			if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else t1.showProgressBar
		})
	end

	local u31 = nil
	local u32 = nil
	local u33 = nil
	local v34 = nil
	local v35 = nil
	local v36 = nil
	local v37 = nil

	if FFlagLuaAppEdpMediaGalleryFullScreen then
		local v38, v39 = React.useState(false)

		u31 = v38
		u32 = v39

		local v40 = React.useCallback(function(p2) -- line: 184
			-- upvalues: u26 (ref), reportWarning (copy), LoggingProtocol (copy), t1 (copy), VideoLogger (copy)
			local current = u26.current

			if not current then
				reportWarning(LoggingProtocol.default, "EventLogging", "reportVideoAction requires a valid videoFrame")

				return
			end

			local source = nil
			local sourceId = nil
			local v49 = nil

			if t1.videoAnalyticsContext then
				source = t1.videoAnalyticsContext.videoAnalyticsData.source
				sourceId = t1.videoAnalyticsContext.videoAnalyticsData.sourceId
				v49 = t1.videoAnalyticsContext.getPlaybackSessionId()

				if not source or not sourceId or not v49 then
					local v50 = source and "" or "source "
					local v51 = sourceId and "" or "sourceId "
					local v52 = v49 and "" or "playbackSessionId"

					reportWarning(LoggingProtocol.default, "EventLogging", `reportVideoAction requires a valid { v50 }{ v51 }{ v52 }`)
				end
			end

			VideoLogger.reportVideoAction(p2, nil, {
				videoAssetId = t1.video,
				source = source or "",
				sourceId = sourceId or "",
				playbackSessionId = v49 or "",
				videoAssetDuration = current.TimeLength,
				isVisible = true,
				isAudible = current.Volume ~= 0,
				volumeLevel = current.Volume ~= 0 and 1 or 0
			})
		end, {
			t1.video,
			t1.videoAnalyticsContext
		})

		u33 = React.useCallback(function() -- line: 225
			-- upvalues: u26 (ref), u31 (ref), v16 (copy)
			local current = u26.current

			if not current then
				return
			end

			if u31 then
				current:Pause()

				return
			end

			if math.abs(current.TimePosition - current.TimeLength) <= v16 then
				current.TimePosition = 0
			end

			current:Play()
		end, { u31 })
		v37 = Responsive.usePreferredInput() == Responsive.Input.Directional
		React.useEffect(function() -- line: 245
			-- upvalues: t1 (copy), u33 (ref), v24 (copy)
			local t2 = {}

			if t1.toggleVideoPlaybackSignal then
				table.insert(t2, t1.toggleVideoPlaybackSignal:connect(u33))
			end

			if t1.toggleMuteSignal then
				table.insert(t2, t1.toggleMuteSignal:connect(v24))
			end

			return function() -- line: 253
				-- upvalues: t2 (copy)
				for _, v61 in t2 do
					if v61 then
						v61:disconnect()
					end
				end
			end
		end, {
			t1.toggleVideoPlaybackSignal,
			t1.toggleMuteSignal,
			u33,
			v24
		})
		v34 = React.useCallback(function() -- line: 264
			-- upvalues: t1 (copy), u33 (ref)
			if t1.onVideoPlayerActivated then
				t1.onVideoPlayerActivated()

				return
			end

			u33()
		end, {
			t1.onVideoPlayerActivated,
			u33
		})
		v35 = React.useMemo(function() -- line: 274
			-- upvalues: t1 (copy), u31 (ref), u33 (ref)
			if t1.showPlayButton then
				return {
					isVideoPlaying = u31,
					onPlayButtonActivated = u33
				}
			end

			return nil
		end, {
			t1.showPlayButton,
			u31,
			u33
		})
		v36 = React.useMemo(function() -- line: 283
			-- upvalues: t1 (copy), u27 (ref)
			if t1.showProgressBar then
				return {
					progressBinding = u27
				}
			end

			return nil
		end, {
			t1.showProgressBar,
			u27
		})
		React.useEffect(function() -- line: 291
			-- upvalues: u26 (ref), t1 (copy), u32 (ref), v40 (copy), VideoActions (copy)
			local current = u26.current

			if not t1.shouldStartPlayback or not current then
				return nil
			end

			local connection = current.Played:Connect(function() -- line: 298
				-- upvalues: u32 (ref), v40 (copy), VideoActions (copy)
				u32(true)
				v40(VideoActions.play)
			end)
			local connection2 = current.Paused:Connect(function() -- line: 303
				-- upvalues: u32 (ref), v40 (copy), VideoActions (copy)
				u32(false)
				v40(VideoActions.pause)
			end)
			local connection3 = current.Ended:Connect(function() -- line: 308
				-- upvalues: u32 (ref)
				u32(false)
			end)

			return function() -- line: 312
				-- upvalues: connection (copy), connection2 (copy), connection3 (copy)
				connection:Disconnect()
				connection2:Disconnect()
				connection3:Disconnect()
			end
		end, {
			t1.shouldStartPlayback,
			v40
		})
		React.useEffect(function() -- line: 320
			-- upvalues: t1 (copy), v20 (copy), u32 (ref)
			if not t1.shouldStartPlayback then
				v20(false)
				u32(false)
			end

			return nil
		end, { t1.shouldStartPlayback })
	end

	return React.createElement(if not FFlagLuaAppVideoTileDisableActivation or not t1.disableActivation then not FFlagLuaAppEdpMediaGalleryFullScreen and "Frame" or "TextButton" else "Frame", {
		Size = t1.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = t1.ZIndex,
		Text = if not FFlagLuaAppVideoTileDisableActivation or not t1.disableActivation then if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else "" else nil,
		[React.Event.Activated] = if not FFlagLuaAppVideoTileDisableActivation or not t1.disableActivation then if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else v34 else nil,
		Selectable = false
	}, {
		Corner = if not t1.cornerRadius then nil else React.createElement("UICorner", {
			CornerRadius = UDim.new(0, t1.cornerRadius)
		}),
		Video = React.createElement(LoadableVideoFrame, {
			video = t1.video,
			thumbnail = t1.thumbnail,
			shouldStartPlayback = t1.shouldStartPlayback,
			muted = v21,
			looped = t1.looped,
			ScaleType = t1.ScaleType,
			cornerRadius = t1.cornerRadius,
			onVideoLoaded = v23,
			onVideoLooped = t1.onVideoLooped,
			onVideoEnded = if not FFlagLuaAppEdpMediaGalleryAutoAdvance then nil else t1.onVideoEnded,
			ref = if not FFlagLuaAppEdpMediaGalleryAutoAdvance and not FFlagLuaAppEdpMediaGalleryFullScreen then nil else u26
		}),
		PlayButton = if not FFlagLuaAppVideoTileHideCenterPlayButton or not t1.hideCenterPlayButton then if not FFlagLuaAppEdpMediaGalleryFullScreen or (not v19 or u31) then nil else React.createElement(RoundIconButton, {
			icon = "play-large",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			ZIndex = 2,
			Selectable = not v37 and nil,
			onActivated = u33
		}) else nil,
		BottomOverlay = if not v18 then nil else React.createElement(VideoPlayerBottomOverlay, {
			cornerRadius = t1.cornerRadius,
			ZIndex = 10,
			videoLoaded = v19,
			muteButtonConfig = v25,
			playButtonConfig = if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else v35,
			progressBarConfig = if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else v36
		})
	})
end
