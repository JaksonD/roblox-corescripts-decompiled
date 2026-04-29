local GamePlayButton = script:FindFirstAncestor("GamePlayButton")

require(GamePlayButton.PlayButtonTypes)

local GamePlayButtonParent = GamePlayButton.Parent
local React = require(GamePlayButtonParent.React)
local useRoactService = require(GamePlayButtonParent.RobloxAppHooks).useRoactService
local RoactServiceTags = require(GamePlayButtonParent.RoactServiceTags)
local RoactAnalytics = RoactServiceTags.RoactAnalytics
local AppEventIngestService = RoactServiceTags.AppEventIngestService
local AppGame = RoactServiceTags.AppGame
local RoactUtils = require(GamePlayButtonParent.RoactUtils)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local DiscoveryAnalytics = require(GamePlayButtonParent.DiscoveryAnalytics)
local gamePlayIntent = DiscoveryAnalytics.Events.gamePlayIntent
local joinGamePlayButton = DiscoveryAnalytics.Points.joinGamePlayButton
local GameVotesRodux = require(GamePlayButtonParent.GameVotesRodux)
local ReasonForNotVoteable = GameVotesRodux.Enums.ReasonForNotVoteable
local ClearUserGameVotes = GameVotesRodux.UserGameVotes.ClearUserGameVotes
local IsVRAppBuild = require(GamePlayButtonParent.AppCommonLib).IsVRAppBuild
local SplashScreenManager = require(GamePlayButtonParent.SplashScreenManager).SplashScreenManager
local LaunchGame = require(GamePlayButtonParent.GameLaunch).LaunchGame
local GetFFlagLuaAppEnableVirtualEventPlaceId = require(GamePlayButtonParent.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local FFlagLuaAppEnableStratusStreamingTestOnly = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppEnableStratusStreamingTestOnly
local NavigateToRoute = require(GamePlayButtonParent.NavigationRodux).Thunks.NavigateToRoute
local AppPage = require(GamePlayButtonParent.RobloxAppEnums).AppPage
local FFlagLuaAppEnablePlayButtonThrottle = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppEnablePlayButtonThrottle
local FIntLuaAppPlayButtonThrottleTimeSeconds = require(GamePlayButtonParent.SharedFlags).FIntLuaAppPlayButtonThrottleTimeSeconds
local FFlagLuaAppTwoByOneTileTelemetryFix = require(GamePlayButtonParent.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix

return function(p1, p2, p3, p4, p5, p6, t1: {[any]: any}?) -- line: 35
	-- upvalues: useRoactService (copy), RoactAnalytics (copy), AppEventIngestService (copy), AppGame (copy), useSelector (copy), useDispatch (copy), FFlagLuaAppEnablePlayButtonThrottle (copy), React (copy), FIntLuaAppPlayButtonThrottleTimeSeconds (copy), GetFFlagLuaAppEnableVirtualEventPlaceId (copy), gamePlayIntent (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), joinGamePlayButton (copy), FFlagLuaAppEnableStratusStreamingTestOnly (copy), NavigateToRoute (copy), AppPage (copy), IsVRAppBuild (copy), SplashScreenManager (copy), LaunchGame (copy), ReasonForNotVoteable (copy), ClearUserGameVotes (copy)
	local v35 = useRoactService(RoactAnalytics)
	local v36 = useRoactService(AppEventIngestService)
	local v37 = useRoactService(AppGame)
	local v38 = useSelector(function(p7) -- line: 48
		-- upvalues: p1 (copy)
		return p7.UserGameVotes[p1]
	end)
	local v39 = useDispatch()
	local v40 = if not FFlagLuaAppEnablePlayButtonThrottle then nil else React.useRef(0)

	return (React.useCallback(function(p8: ((...any) -> ...any)?) -- line: 55
		-- upvalues: FFlagLuaAppEnablePlayButtonThrottle (copy), v40 (copy), FIntLuaAppPlayButtonThrottleTimeSeconds (copy), GetFFlagLuaAppEnableVirtualEventPlaceId (copy), p2 (copy), p3 (copy), gamePlayIntent (copy), v36 (copy), p4 (copy), p1 (copy), t1 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), joinGamePlayButton (copy), v35 (copy), p5 (copy), FFlagLuaAppEnableStratusStreamingTestOnly (copy), v39 (copy), NavigateToRoute (copy), AppPage (copy), p6 (copy), IsVRAppBuild (copy), SplashScreenManager (copy), LaunchGame (copy), v37 (copy), v38 (copy), ReasonForNotVoteable (copy), ClearUserGameVotes (copy)
		if FFlagLuaAppEnablePlayButtonThrottle then
			local timestamp = tick()

			if timestamp - v40.current < FIntLuaAppPlayButtonThrottleTimeSeconds then
				return
			end

			v40.current = timestamp
		end

		if GetFFlagLuaAppEnableVirtualEventPlaceId() and (not p2 or not p3) or not GetFFlagLuaAppEnableVirtualEventPlaceId() and not p3 then
			return
		end

		if p8 ~= nil then
			p8()
		else
			gamePlayIntent(v36, "PlayButton", {
				placeId = if not GetFFlagLuaAppEnableVirtualEventPlaceId() then p3 else p2,
				rootPlaceId = tonumber(p3),
				referralSource = p4,
				universeId = p1,
				launchData = if not t1 or not t1.launchData then nil else t1.launchData,
				tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix or not t1 then nil else t1.tileType,
				nativeAdData = if not FFlagLuaAppTwoByOneTileTelemetryFix or not t1 then nil else t1.nativeAdData
			})
		end

		joinGamePlayButton(v35.InfluxDb, "gamePlayIntent", {
			isUniversalApp = true,
			referralSource = p4,
			placeId = if not GetFFlagLuaAppEnableVirtualEventPlaceId() then p3 else p2,
			ctx = p5
		})

		if FFlagLuaAppEnableStratusStreamingTestOnly then
			v39(NavigateToRoute({{
				name = AppPage.VideoServer,
				placeId = if not GetFFlagLuaAppEnableVirtualEventPlaceId() then p3 else p2,
				launchSource = p6,
				extraParams = t1
			}}))

			return
		end

		if IsVRAppBuild() then
			SplashScreenManager.initialize(36)
			wait(0.3)
		end

		LaunchGame(if not GetFFlagLuaAppEnableVirtualEventPlaceId() then p3 else p2, p6, t1, v37)

		if v38 and v38.reasonForNotVoteable == ReasonForNotVoteable.PlayGame then
			v39(ClearUserGameVotes(p1))
		end
	end, {
		v36,
		v35,
		v37,
		v38,
		p1,
		if not GetFFlagLuaAppEnableVirtualEventPlaceId() then nil else p2,
		p3,
		p4,
		p5,
		t1
	}))
end
