local AdService = game:GetService("AdService")
local Players = game:GetService("Players")
local PlayWithRewardComponent2 = script:FindFirstAncestor("PlayWithRewardComponent")
local PlayWithRewardBlackoutCurtain = require(PlayWithRewardComponent2.PlayWithRewardBlackoutCurtain)
local PlayWithRewardCoachmark = require(PlayWithRewardComponent2.PlayWithRewardCoachmark)
local PlayWithRewardTelemetry = require(PlayWithRewardComponent2.PlayWithRewardTelemetry)
local shouldRenderPlayWithRewardBanner = require(PlayWithRewardComponent2.shouldRenderPlayWithRewardBanner)
local PlayWithRewardComponent2Parent = PlayWithRewardComponent2.Parent
local PlayWithRewardState = require(PlayWithRewardComponent2Parent.PlayWithRewardState)
local Foundation = require(PlayWithRewardComponent2Parent.Foundation)
local GamePlayButton = require(PlayWithRewardComponent2Parent.GamePlayButton)
local React = require(PlayWithRewardComponent2Parent.React)
local RobloxAppHooks = require(PlayWithRewardComponent2Parent.RobloxAppHooks)
local RobloxAppUpdate = require(PlayWithRewardComponent2Parent.RobloxAppUpdate)
local RoactServiceTags = require(PlayWithRewardComponent2Parent.RoactServiceTags)
local RoactUtils = require(PlayWithRewardComponent2Parent.RoactUtils)
local SharedFlags = require(PlayWithRewardComponent2Parent.SharedFlags)
local SetPlayWithRewardState = PlayWithRewardState.SetPlayWithRewardState
local Button = Foundation.Button
local Enums = Foundation.Enums
local Icon = Foundation.Icon
local FoundationImage = Foundation.Image
local Skeleton = Foundation.Skeleton
local FoundationText = Foundation.Text
local View = Foundation.View
local useTokens = Foundation.Hooks.useTokens
local PlayButtonReferralSource = GamePlayButton.PlayButtonReferralSource
local usePlayButtonLaunchGame = GamePlayButton.usePlayButtonLaunchGame
local RoactAnalytics = RoactServiceTags.RoactAnalytics
local AppUpdateService = RoactServiceTags.AppUpdateService
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useRoactService = RobloxAppHooks.useRoactService
local CheckForUpdate = RobloxAppUpdate.Thunks.CheckForUpdate
local EngineFeature = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly")
local EngineFeature2 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled")
local v36 = game:DefineFastInt("PlayWithRewardFallbackBannerProductImageAssetId", 0)
local v37 = game:DefineFastInt("LuaAppPlayWithRewardMobileEdpLayoutOrder", 120)
local FFlagEnablePlayWithRewardNonPeekviewEdp = SharedFlags.FFlagEnablePlayWithRewardNonPeekviewEdp

function PlayWithRewardComponent(t1: {[any]: any}) -- line: 63
	-- upvalues: useTokens (copy), useRoactService (copy), RoactAnalytics (copy), AppUpdateService (copy), useDispatch (copy), Players (copy), React (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), shouldRenderPlayWithRewardBanner (copy), usePlayButtonLaunchGame (copy), PlayButtonReferralSource (copy), PlayWithRewardTelemetry (copy), PlayWithRewardBlackoutCurtain (copy), SetPlayWithRewardState (copy), AdService (copy), v36 (copy), EngineFeature (copy), CheckForUpdate (copy), EngineFeature2 (copy), v37 (copy), Skeleton (copy), Icon (copy), Enums (copy), FoundationImage (copy), View (copy), FoundationText (copy), Button (copy), PlayWithRewardCoachmark (copy)
	local v40 = useTokens()
	local v41 = useRoactService(RoactAnalytics)
	local v42 = useRoactService(AppUpdateService)
	local v43 = useDispatch()
	local LocalPlayer = Players.LocalPlayer
	local v45 = React.useRef(nil)
	local v46 = React.useRef(false)
	local playWithRewardAdData = t1.playWithRewardAdData
	local v48 = tonumber(playWithRewardAdData and playWithRewardAdData.productId or 0) or 0
	local v49 = t1.flowId ~= "" and t1.isAdDataExpected
	local u50 = if not FFlagEnablePlayWithRewardNonPeekviewEdp then LocalPlayer ~= nil and (t1.flowId ~= "" and (t1.fetchedUniverseId ~= nil and (t1.fetchedUniverseId == t1.universeId and (playWithRewardAdData ~= nil and (playWithRewardAdData.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (playWithRewardAdData.experimentVariantData ~= nil and v48 ~= 0)))))) else shouldRenderPlayWithRewardBanner(t1.universeId, t1.flowId, t1.fetchedUniverseId, t1.playWithRewardAdData)
	local v51 = t1.placeIdOverride or t1.placeId
	local v52 = usePlayButtonLaunchGame(t1.universeId, v51, t1.placeId, PlayButtonReferralSource.PlayWithReward, "PlayWithRewardGameDetails", "PlayWithRewardButton", t1.experienceJoinData)

	React.useEffect(function() -- line: 108
		-- upvalues: u50 (ref), v46 (copy), PlayWithRewardTelemetry (copy), t1 (copy)
		if u50 then
			v46.current = true
			PlayWithRewardTelemetry.logPlayWithRewardButtonShown(t1.flowId, t1.universeId, "startShow")
		end

		return function() -- line: 114
			-- upvalues: v46 (copy), PlayWithRewardTelemetry (copy), t1 (copy)
			if v46.current then
				v46.current = false
				PlayWithRewardTelemetry.logPlayWithRewardButtonShown(t1.flowId, t1.universeId, "endShow")
			end
		end
	end, {
		u50,
		t1.flowId,
		t1.universeId
	})

	local v53 = not playWithRewardAdData and "" or playWithRewardAdData.productName
	local v54 = not playWithRewardAdData and "" or playWithRewardAdData.productImageAssetId
	local v55 = v54 == ""
	local v56 = React.useCallback(function() -- line: 127
		-- upvalues: PlayWithRewardTelemetry (copy), t1 (copy), PlayWithRewardBlackoutCurtain (copy), v43 (copy), SetPlayWithRewardState (copy), AdService (copy), v53 (copy), v55 (copy), v36 (copy), v54 (copy), v52 (copy), EngineFeature (copy), CheckForUpdate (copy), v42 (copy), EngineFeature2 (copy), v41 (copy)
		local function showAdThenLaunch() -- line: 128
			-- upvalues: PlayWithRewardTelemetry (copy), t1 (copy), PlayWithRewardBlackoutCurtain (copy), v43 (copy), SetPlayWithRewardState (copy), AdService (copy), v53 (copy), v55 (copy), v36 (copy), v54 (copy), v52 (copy)
			PlayWithRewardTelemetry.logPlayWithRewardBlackoutCurtainAction(t1.flowId, t1.universeId, "shown")
			PlayWithRewardBlackoutCurtain.show()
			PlayWithRewardTelemetry.logPlayWithRewardButtonClicked(t1.flowId, t1.universeId)

			local ok, result = pcall(function() -- line: 134
				-- upvalues: v43 (copy), SetPlayWithRewardState (copy), t1 (copy), PlayWithRewardTelemetry (copy), AdService (copy)
				v43(SetPlayWithRewardState(t1.flowId, t1.universeId, false, nil))
				PlayWithRewardTelemetry.logPlayWithRewardAdPlaybackAttempted(t1.flowId, t1.universeId)

				return AdService:ShowRewardedVideoAdAtClientAsync(t1.universeId)
			end)

			pcall(function() -- line: 140
				-- upvalues: PlayWithRewardTelemetry (copy), t1 (copy), result (copy), AdService (copy), ok (copy), v53 (copy), v55 (copy), v36 (copy), v54 (copy)
				PlayWithRewardTelemetry.logPlayWithRewardAdPlaybackStopped(t1.flowId, t1.universeId, (tostring(result)))
				AdService:SubmitAdNotification(tonumber(t1.universeId) or 0, ok and result ~= nil, result == Enum.ShowAdResult.ShowCompleted, v53, if not v55 then tonumber(v54) or v36 else v36)
			end)
			PlayWithRewardTelemetry.logPlayWithRewardBlackoutCurtainAction(t1.flowId, t1.universeId, "hidden")
			PlayWithRewardBlackoutCurtain.hide()

			if v52 then
				PlayWithRewardTelemetry.logPlayWithRewardGameJoinInitiated(t1.flowId, t1.universeId)
				v52(nil)
			end
		end

		if EngineFeature then
			v43(CheckForUpdate(v42, EngineFeature2, v41, showAdThenLaunch, {
				ctx = "PlayWithRewardGameDetails"
			}))

			return
		end

		showAdThenLaunch()
	end, {
		t1.flowId,
		t1.universeId,
		v43,
		v42,
		v41,
		v52,
		v54,
		v53,
		v55
	})
	local n1, XLarge, XLarge2, XLarge3, XLarge4, s1, s2, s3, s4, v66, s5, Size_1200

	if t1.useLargerStyles then
		n1 = 98
		XLarge = v40.Padding.XLarge
		XLarge2 = v40.Padding.XLarge
		XLarge3 = v40.Padding.XLarge
		XLarge4 = v40.Gap.XLarge
		s1 = "padding-top-large"
		s2 = "text-heading-small"
		s3 = "text-body-medium"
		s4 = "gap-xxsmall"
		v66 = true
		s5 = "size-1000-1200"
		Size_1200 = v40.Size.Size_1200
	else
		n1 = 66
		XLarge = v40.Padding.Medium
		XLarge2 = v40.Padding.Small
		XLarge3 = v40.Padding.Medium
		XLarge4 = v40.Gap.Medium
		s1 = "padding-top-medium"
		s2 = "text-title-medium"
		s3 = "text-body-small"
		s4 = ""
		v66 = false
		s5 = "size-800-1000"
		Size_1200 = v40.Size.Size_1000
	end

	local v69 = XLarge2 + n1 + XLarge4
	local v70 = v37

	if v49 then
		return React.createElement(Skeleton, {
			tag = s1,
			Size = UDim2.new(1, 0, 0, Size_1200 + XLarge * 2 + XLarge3),
			LayoutOrder = v70
		})
	end

	if not u50 then
		return nil
	end

	local titleText = playWithRewardAdData.experimentVariantData.titleText
	local subtitleText = playWithRewardAdData.experimentVariantData.subtitleText
	local buttonText = playWithRewardAdData.experimentVariantData.buttonText
	local coachmarkTitleText = playWithRewardAdData.experimentVariantData.coachmarkTitleText
	local coachmarkSubtitleText = playWithRewardAdData.experimentVariantData.coachmarkSubtitleText
	local showButton = playWithRewardAdData.experimentVariantData.showButton
	local v77 = not LocalPlayer and 0 or LocalPlayer.UserId
	local v78 = coachmarkTitleText ~= "" and coachmarkSubtitleText ~= ""
	local v79 = if not v55 then React.createElement(FoundationImage, {
		Size = UDim2.fromOffset(n1, n1),
		Position = UDim2.fromOffset(XLarge2, -XLarge3),
		Image = "rbxassetid://" .. v54,
		BackgroundTransparency = 1,
		ZIndex = 2
	}) else React.createElement(Icon, {
		name = Enums.IconName.GiftBox,
		size = n1,
		Position = UDim2.fromOffset(XLarge2, -XLarge3),
		ZIndex = 2
	})

	return React.createElement(View, {
		tag = `size-full-0 auto-y { s1 }`,
		LayoutOrder = v70
	}, {
		Banner = React.createElement(View, {
			tag = "size-full-0 auto-y radius-medium no-clip bg-shift-300",
			onActivated = if not showButton then v56 else nil,
			ref = v45
		}, {
			ProductImage = v79,
			ContentView = React.createElement(View, {
				tag = "row align-y-center gap-medium size-full-0 auto-y",
				padding = {
					left = UDim.new(0, v69),
					top = UDim.new(0, XLarge),
					right = UDim.new(0, XLarge),
					bottom = UDim.new(0, XLarge)
				}
			}, {
				TextContainer = React.createElement(View, {
					tag = `col fill auto-y { s4 }`,
					LayoutOrder = 1
				}, {
					RewardTitle = if titleText == "" then nil else React.createElement(FoundationText, {
						tag = `auto-xy text-wrap text-align-x-left content-emphasis { s2 }`,
						Text = titleText,
						LayoutOrder = 1
					}),
					RewardDescription = if subtitleText == "" then nil else React.createElement(FoundationText, {
						tag = `auto-xy text-wrap text-align-x-left content-emphasis { s3 }`,
						Text = subtitleText,
						LayoutOrder = 2
					})
				}),
				ClickableIndicator = if not showButton then React.createElement(View, {
					tag = `align-x-center align-y-center { s5 }`,
					LayoutOrder = 2
				}, {
					Icon = React.createElement(Icon, {
						name = Enums.IconName.ChevronLargeRight,
						style = v40.Color.Content.Emphasis,
						size = if not v66 then Enums.IconSize.Medium else Enums.IconSize.Large
					})
				}) else React.createElement(Button, {
					text = buttonText,
					onActivated = v56,
					variant = Enums.ButtonVariant.SoftEmphasis,
					size = if not v66 then Enums.InputSize.Medium else Enums.InputSize.Large,
					LayoutOrder = 2
				})
			})
		}),
		PlayWithRewardCoachmark = if not v78 then nil else React.createElement(PlayWithRewardCoachmark, {
			anchorRef = v45,
			flowId = t1.flowId,
			localUserId = v77,
			productId = v48,
			title = coachmarkTitleText,
			text = coachmarkSubtitleText,
			universeId = t1.universeId
		})
	})
end

return PlayWithRewardComponent
