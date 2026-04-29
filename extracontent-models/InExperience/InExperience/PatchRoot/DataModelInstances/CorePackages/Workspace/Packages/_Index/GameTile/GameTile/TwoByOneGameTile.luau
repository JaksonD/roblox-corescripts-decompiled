local GameTile = script:FindFirstAncestor("GameTile")
local getGameTileLayoutData = require(GameTile.getGameTileLayoutData)
local formatExperienceThumbnail = require(GameTile.formatExperienceThumbnail)
local useIsHoveredTile = require(GameTile.useIsHoveredTile)
local useNavigateToGameDetails = require(GameTile.useNavigateToGameDetails)
local GameTileOverflowMenu = require(GameTile.GameTileOverflowMenu)
local GameTileThumbnailBadges = require(GameTile.Overlays.GameTileThumbnailBadges)
local getAvailableGameTileOverflowMenuItems = require(GameTile.getAvailableGameTileOverflowMenuItems)
local TwoByOneGameTileTelemetry = require(GameTile.TwoByOneGameTileTelemetry)
local HiddenTileContent = require(GameTile.HiddenGameTile.HiddenTileContent)
local ItemLayoutDataParsingUtils = require(GameTile.ItemLayoutDataParsingUtils)
local HoverTileCoordinator = require(GameTile.HoverTileCoordinator)
local GameTileParent = GameTile.Parent
local React = require(GameTileParent.React)
local Foundation = require(GameTileParent.Foundation)
local ButtonSize = Foundation.Enums.ButtonSize
local useTokens = Foundation.Hooks.useTokens
local FoundationImage = Foundation.Image
local Responsive = require(GameTileParent.Responsive)
local useSelector = require(GameTileParent.RoactUtils).Hooks.RoactRodux.useSelector
local GameInfosReducer = require(GameTileParent.GameInfosRodux).GameInfosReducer
local AppBlox = require(GameTileParent.AppBlox)
local getOverflowMenuSignalStore = AppBlox.getOverflowMenuSignalStore
local useOverflowMenuOpen = AppBlox.useOverflowMenuOpen
local useTriggerFeedback = require(GameTileParent.InteractionFeedback).useTriggerFeedback
local ImpressionsTagUtility = require(GameTileParent.Impressions).ImpressionsTagUtility
local GetTextSize = require(GameTileParent.Style).GetTextSize
local GamePlayButton = require(GameTileParent.GamePlayButton)

require(GameTile.GameTileTypes)

local PlayButton = GamePlayButton.PlayButton
local useOnPlayButtonCallback = require(GameTileParent.GamePlayButton).useOnPlayButtonCallback
local usePlayButtonState = require(GameTileParent.GamePlayButton).usePlayButtonState
local useLocalization = require(GameTileParent.Localization).Hooks.useLocalization
local useRoactService = require(GameTileParent.RobloxAppHooks).useRoactService
local RoactServiceTags = require(GameTileParent.RoactServiceTags)
local RoactNetworking = RoactServiceTags.RoactNetworking
local AppSessionService = RoactServiceTags.AppSessionService
local RobloxAppSessionization = require(GameTileParent.RobloxAppSessionization)
local SetGamePlaySession = RobloxAppSessionization.SetGamePlaySession
local SessionType = RobloxAppSessionization.SessionType
local SharedFlags = require(GameTileParent.SharedFlags)
local DiscoveryAnalytics = require(GameTileParent.DiscoveryAnalytics)
local sponsoredGamesRecordClick = DiscoveryAnalytics.Requests.sponsoredGamesRecordClick
local GameCollectionItemTypes = require(GameTileParent.DiscoveryTypes).GameCollectionItemTypes
local useValidTileBadges = require(GameTile.Overlays.useValidTileBadges)
local useTagAsViewportAutoplayCandidate = require(GameTileParent.VideoUtils).useTagAsViewportAutoplayCandidate
local v46 = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600)
local v47 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20)
local v48 = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36)
local v49 = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30)
local v50 = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100)
local v51 = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50)
local v52 = game:DefineFastFlag("LuaAppTwoByOneTileHeadlineFontUpdate", false)
local FFlagLuaAppSupportSponsoredExplicitFeedback = SharedFlags.FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppCustomSpawnNonNilCheck = SharedFlags.FFlagLuaAppCustomSpawnNonNilCheck
local FFlagLuaAppFixExplicitFeedbackTelemetry = SharedFlags.FFlagLuaAppFixExplicitFeedbackTelemetry
local FFlagLuaAppHapticTriggeredTelemetry = SharedFlags.FFlagLuaAppHapticTriggeredTelemetry
local FFlagLuaAppFixTwoByOneOverflowMenuTelemetry = SharedFlags.FFlagLuaAppFixTwoByOneOverflowMenuTelemetry
local FFlagLuaAppTwoByOneTileTelemetryFix = SharedFlags.FFlagLuaAppTwoByOneTileTelemetryFix
local FFlagLuaAppSupportPrimaryMediaContentMetadata = SharedFlags.FFlagLuaAppSupportPrimaryMediaContentMetadata
local FFlagLuaAppHomeTouchAutoplay = SharedFlags.FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppTileVideoCandidateOnly = SharedFlags.FFlagLuaAppTileVideoCandidateOnly
local gameTileOverflowMenuAction = DiscoveryAnalytics.Events.gameTileOverflowMenuAction
local color3 = Color3.new(1, 1, 1)
local color3_2 = Color3.new(0, 0, 0)
local v65 = v47 / 100
local v66 = v48 / 100
local v67 = v49 / 100
local v68 = v50 / 100
local v69 = v51 / 100
local t1 = {
	JoinGame = "JoinGame",
	OpenEdp = "OpenEdp"
}
local t2 = {
	StandardLight = "StandardLight",
	OverMedia = "OverMedia"
}
local t3 = {
	Default = {
		ctaStyle = nil,
		onCtaActivation = t1.JoinGame,
		onTileActivation = t1.OpenEdp
	},
	Variant1 = {
		ctaStyle = nil,
		onCtaActivation = nil,
		onTileActivation = t1.JoinGame
	},
	Variant2 = {
		ctaStyle = t2.StandardLight,
		onCtaActivation = t1.OpenEdp,
		onTileActivation = t1.JoinGame
	},
	Variant3 = {
		ctaStyle = t2.OverMedia,
		onCtaActivation = t1.OpenEdp,
		onTileActivation = t1.JoinGame
	}
}

return function(t4: {[any]: any}) -- line: 165
	-- upvalues: useNavigateToGameDetails (copy), useRoactService (copy), RoactNetworking (copy), AppSessionService (copy), useLocalization (copy), t3 (copy), useTokens (copy), Responsive (copy), v46 (copy), v52 (copy), ButtonSize (copy), React (copy), GetTextSize (copy), t2 (copy), v65 (copy), v66 (copy), useValidTileBadges (copy), useTriggerFeedback (copy), useOverflowMenuOpen (copy), useIsHoveredTile (copy), sponsoredGamesRecordClick (copy), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy), getOverflowMenuSignalStore (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), FFlagLuaAppCustomSpawnNonNilCheck (copy), GameCollectionItemTypes (copy), TwoByOneGameTileTelemetry (copy), getAvailableGameTileOverflowMenuItems (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), FFlagLuaAppFixExplicitFeedbackTelemetry (copy), gameTileOverflowMenuAction (copy), FFlagLuaAppHapticTriggeredTelemetry (copy), SetGamePlaySession (copy), SessionType (copy), HoverTileCoordinator (copy), usePlayButtonState (copy), useOnPlayButtonCallback (copy), t1 (copy), useSelector (copy), GameInfosReducer (copy), getGameTileLayoutData (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), ItemLayoutDataParsingUtils (copy), formatExperienceThumbnail (copy), ImpressionsTagUtility (copy), FFlagLuaAppHomeTouchAutoplay (copy), useTagAsViewportAutoplayCandidate (copy), FFlagLuaAppTileVideoCandidateOnly (copy), HiddenTileContent (copy), v69 (copy), color3 (copy), v67 (copy), v68 (copy), color3_2 (copy), GameTileThumbnailBadges (copy), FoundationImage (copy), PlayButton (copy), GameTileOverflowMenu (copy)
	local v74 = useNavigateToGameDetails()
	local v75 = useRoactService(RoactNetworking)
	local v76 = useRoactService(AppSessionService)
	local v77 = useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		joinButtonText = "Common.VisitGame.Label.Play"
	})
	local v78 = if not t4.ctaText then v77.joinButtonText else t4.ctaText
	local v79 = t3[t4.tileVariant] or t3.Default
	local v80 = useTokens()
	local uDim = UDim.new(0, v80.Radius.Medium)
	local Medium, Medium2, v84, BodySmall, CaptionSmall, XXSmall, Small, Size_800, TitleSmall

	if Responsive.useResponsive({{
		Key = "Smaller",
		maxWidth = v46
	}}) == "Smaller" then
		Medium = v80.Padding.Medium
		Medium2 = v80.Padding.Medium
		v84 = if not v52 then v80.Typography.HeadingSmall else v80.Typography.TitleLarge
		BodySmall = v80.Typography.BodySmall
		CaptionSmall = v80.Typography.CaptionSmall
		XXSmall = v80.Gap.XXSmall
		Small = ButtonSize.Small
		Size_800 = v80.Size.Size_800
		TitleSmall = v80.Typography.TitleSmall
	else
		Medium = v80.Padding.Large
		Medium2 = v80.Padding.Large
		v84 = v80.Typography.HeadingMedium
		BodySmall = v80.Typography.BodyMedium
		CaptionSmall = v80.Typography.CaptionMedium
		XXSmall = v80.Gap.XSmall
		Small = ButtonSize.Medium
		Size_800 = v80.Size.Size_1000
		TitleSmall = v80.Typography.TitleMedium
	end

	local v91 = v80.Padding.Large * 4
	local v92 = React.useMemo(function() -- line: 214
		-- upvalues: GetTextSize (copy), v78 (copy), TitleSmall (ref), v91 (copy)
		local v132 = GetTextSize(v78, TitleSmall.FontSize, TitleSmall.Font, Vector2.new(1e999, 1e999))

		return UDim.new(0, v132.X + v91)
	end, {
		v78,
		TitleSmall,
		v91
	})
	local v93 = if v79.ctaStyle ~= t2.StandardLight then v80.LightMode.ActionOverMedia.Background.Color3 else v80.Color.Extended.White.White_20.Color3
	local v94 = if v79.ctaStyle ~= t2.StandardLight then v80.LightMode.ActionOverMedia.Background.Transparency else v80.Color.Extended.White.White_20.Transparency
	local num = tonumber(t4.logoAspectRatio)
	local v96 = (not num or not (num > 0)) and 1 or num
	local v97 = if v96 ~= 3 then v66 else v65
	local universeId = t4.universeId
	local placeId = t4.placeId
	local v100 = useValidTileBadges(universeId, t4.topicId, t4.badgeOverride)
	local hoverKey = t4.hoverKey
	local v102, v103 = React.useState(false)
	local v104 = React.useRef(nil)
	local v105 = useTriggerFeedback()
	local v106 = useOverflowMenuOpen(hoverKey)
	local v107 = useIsHoveredTile(v104, hoverKey, true)
	local v108 = React.useRef(false)
	local v109 = React.useCallback(function() -- line: 259
		-- upvalues: t4 (copy), sponsoredGamesRecordClick (copy), v75 (copy)
		if t4.isSponsored and t4.adId then
			sponsoredGamesRecordClick(v75, t4.adId)
		end
	end, {
		v75,
		t4.isSponsored,
		t4.adId
	})
	local v110 = React.useCallback(function() -- line: 265
		-- upvalues: v108 (copy)
		v108.current = false
	end, {})
	local v111 = if not FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then React.useCallback(function() -- line: 271
		-- upvalues: v108 (copy), v105 (copy), t4 (copy), getOverflowMenuSignalStore (copy), hoverKey (copy)
		local current = v108.current

		v108.current = true

		if current == false then
			v105("TwoByOneTileLongPress", "Press", t4.appPage, nil)
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey,
		t4.appPage,
		v105
	}) else nil
	local v112 = React.useCallback(function() -- line: 281
		-- upvalues: t4 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), FFlagLuaAppCustomSpawnNonNilCheck (copy), GameCollectionItemTypes (copy), v74 (copy), universeId (copy), TwoByOneGameTileTelemetry (copy)
		local t5 = {
			index = t4.index,
			placeIdOverride = t4.placeIdOverride,
			experienceJoinData = if not FFlagLuaAppTwoByOneTileTelemetryFix then if not not FFlagLuaAppCustomSpawnNonNilCheck and not t4.launchDataOverride then nil else {
				launchData = t4.launchDataOverride
			} else {
				launchData = if not not FFlagLuaAppCustomSpawnNonNilCheck and not t4.launchDataOverride then nil else t4.launchDataOverride,
				tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				nativeAdData = t4.adId
			}
		}

		v74(universeId, t5)
		TwoByOneGameTileTelemetry.logTwoByOneTileViewGameDetailsActivated()

		if t4.reportGameDetailOpened then
			if FFlagLuaAppTwoByOneTileTelemetryFix then
				t4.reportGameDetailOpened(t4.index, universeId)

				return
			end

			t4.reportGameDetailOpened(t4.index, universeId, GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile)
		end
	end, {
		v74,
		universeId,
		t4.index,
		t4.placeIdOverride,
		t4.launchDataOverride,
		t4.reportGameDetailOpened,
		if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t4.adId
	})
	local v113 = React.useCallback(function() -- line: 327
		-- upvalues: v103 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), t4 (copy)
		v103(true)

		if FFlagLuaAppTwoByOneTileTelemetryFix and t4.onSelectionGained then
			t4.onSelectionGained()
		end
	end, { if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t4.onSelectionGained })
	local v114 = React.useCallback(function() -- line: 339
		-- upvalues: v103 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), t4 (copy)
		v103(false)

		if FFlagLuaAppTwoByOneTileTelemetryFix and t4.onSelectionLost then
			t4.onSelectionLost()
		end
	end, { if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t4.onSelectionLost })
	local isSponsored = t4.isSponsored
	local v116 = React.useMemo(function() -- line: 351
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), isSponsored (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), t4 (copy)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = isSponsored,
			enableSponsoredFeedback = if not FFlagLuaAppSupportSponsoredExplicitFeedback then isSponsored else t4.enableSponsoredFeedback,
			enableReportAd = if not FFlagLuaAppSupportSponsoredExplicitFeedback then isSponsored else t4.enableReportAd,
			enableExplicitFeedback = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else t4.enableExplicitFeedback
		})
	end, {
		isSponsored,
		t4.enableSponsoredFeedback,
		t4.enableReportAd,
		t4.enableExplicitFeedback
	})
	local v117 = (v107 or (v102 or v106)) and next(v116) ~= nil
	local v118 = if not FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then nil else React.useCallback(function(b1: boolean, s1: string?) -- line: 367
		-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (copy), t4 (copy), universeId (copy), gameTileOverflowMenuAction (copy)
		local t6 = {
			ctx = if not FFlagLuaAppFixExplicitFeedbackTelemetry then t4.appPage else nil,
			universeId = universeId,
			sortId = t4.topicId,
			actionType = not b1 and "GameTileOverflowMenuOpened" or "GameTileOverflowMenuClosed",
			availableMenuItems = s1
		}

		gameTileOverflowMenuAction(t6, if not FFlagLuaAppFixExplicitFeedbackTelemetry then nil else t4.appPage or "Unknown")
	end, {
		universeId,
		t4.appPage,
		t4.topicId
	})

	if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then
		v111 = React.useCallback(function() -- line: 387
			-- upvalues: v108 (copy), v116 (copy), v105 (copy), v106 (copy), FFlagLuaAppHapticTriggeredTelemetry (copy), universeId (copy), t4 (copy), getOverflowMenuSignalStore (copy), hoverKey (copy), v118 (copy)
			local current = v108.current

			v108.current = true

			if current == false and next(v116) ~= nil then
				if v105 and not v106 then
					local v139 = if not FFlagLuaAppHapticTriggeredTelemetry then nil else {
						universeId = universeId,
						sortId = t4.topicId
					}

					v105("TwoByOneTileLongPress", "Press", if not FFlagLuaAppHapticTriggeredTelemetry then nil else t4.appPage or "Unknown", if not FFlagLuaAppHapticTriggeredTelemetry then nil else v139)
				end

				getOverflowMenuSignalStore().openMenu(hoverKey)

				local t7 = {}

				for v141, _ in v116 do
					table.insert(t7, v141)
				end

				v118(false, table.concat(t7, ","))
			end
		end, {
			hoverKey,
			t4.appPage,
			t4.topicId,
			v105,
			v116,
			v106,
			universeId,
			v118
		})
	end

	local v119 = React.useCallback(function() -- line: 429
		-- upvalues: v76 (copy), SetGamePlaySession (copy), SessionType (copy), v107 (copy), HoverTileCoordinator (copy), t4 (copy), placeId (copy), universeId (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy)
		if v76 then
			SetGamePlaySession(v76, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end

		if v107 then
			HoverTileCoordinator.default:reset()
		end

		if t4.reportExperienceLaunched then
			local t8 = {
				placeId = placeId,
				universeId = universeId,
				adId = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t4.adId,
				tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				placeIdOverride = t4.placeIdOverride,
				launchDataOverride = t4.launchDataOverride
			}

			t4.reportExperienceLaunched(t8, t4.appPage, GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, t4.index)
		end
	end, {
		v76,
		t4.reportExperienceLaunched,
		placeId,
		universeId,
		t4.appPage,
		t4.index,
		if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t4.adId,
		t4.placeIdOverride,
		t4.launchDataOverride,
		v107
	})
	local v120 = usePlayButtonState(v75, universeId)
	local v121 = useOnPlayButtonCallback(universeId, t4.appPage, "TwoByOneTile", nil, "TwoByOneTile", if not FFlagLuaAppTwoByOneTileTelemetryFix then if not t4.launchDataOverride then nil else {
		launchData = t4.launchDataOverride
	} else {
		launchData = t4.launchDataOverride,
		tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = t4.adId
	}, if not t4.placeIdOverride then t4.placeId else t4.placeIdOverride)
	local v122 = React.useCallback(function() -- line: 493
		-- upvalues: TwoByOneGameTileTelemetry (copy), v109 (copy)
		TwoByOneGameTileTelemetry.logTwoByOneTileGameJoinInitiated()
		TwoByOneGameTileTelemetry.logTwoByOneTileCtaActivated()
		v109()
	end, { v109 })
	local v123 = React.useCallback(function() -- line: 499
		-- upvalues: TwoByOneGameTileTelemetry (copy), v109 (copy), v112 (copy)
		TwoByOneGameTileTelemetry.logTwoByOneTileCtaActivated()
		v109()
		v112()
	end, {
		v109,
		v112
	})
	local v124 = React.useCallback(function() -- line: 505
		-- upvalues: TwoByOneGameTileTelemetry (copy), v121 (copy), v120 (copy), v119 (copy)
		TwoByOneGameTileTelemetry.logTwoByOneTileGameJoinInitiated()
		v121(v120.playButtonState, v119)
	end, {
		v121,
		v120.playButtonState,
		v119
	})
	local v125 = React.useCallback(function() -- line: 517
		-- upvalues: v108 (copy), v107 (copy), HoverTileCoordinator (copy), TwoByOneGameTileTelemetry (copy), v109 (copy), v79 (copy), t1 (copy), v112 (copy), v124 (copy)
		if v108.current then
			v108.current = false

			return
		end

		if v107 then
			HoverTileCoordinator.default:reset()
		end

		TwoByOneGameTileTelemetry.logTwoByOneTileActivated()
		v109()

		if v79.onTileActivation == t1.OpenEdp then
			v112()

			return
		end

		if v79.onTileActivation == t1.JoinGame then
			v124()
		end
	end, {
		v107,
		v79.onTileActivation,
		v112,
		v124,
		v109
	})
	local v126 = useSelector(function(p1) -- line: 545
		-- upvalues: GameInfosReducer (copy), universeId (copy)
		return p1.Personalization[GameInfosReducer.key][universeId]
	end)
	local v127 = getGameTileLayoutData(v126, t4.topicId)
	local v128 = ((if not FFlagLuaAppSupportPrimaryMediaContentMetadata or not t4.primaryWideImageAssetId then ItemLayoutDataParsingUtils.getWideImageAssetId(v127) else t4.primaryWideImageAssetId)) or (v126 and v126.primaryWideAssetId or nil)
	local v129 = formatExperienceThumbnail(v128, placeId, true)
	local v130 = v126 and v126.ageRecommendationDisplayName or nil
	local v131 = React.useRef(nil)

	React.useEffect(function() -- line: 559
		-- upvalues: ImpressionsTagUtility (copy), v131 (copy), t4 (copy)
		ImpressionsTagUtility.AddTag(v131, t4.impressionsTag, t4.index)

		return function() -- line: 561
			-- upvalues: ImpressionsTagUtility (copy), v131 (copy), t4 (copy)
			ImpressionsTagUtility.RemoveTag(v131, t4.impressionsTag, t4.index)
		end
	end, {
		t4.impressionsTag,
		t4.index
	})

	if FFlagLuaAppHomeTouchAutoplay then
		useTagAsViewportAutoplayCandidate(v131, t4.videoPlaybackContext, not FFlagLuaAppTileVideoCandidateOnly and nil)
	end

	if FFlagLuaAppSupportSponsoredExplicitFeedback and t4.isHidden then
		return React.createElement("Frame", {
			LayoutOrder = t4.layoutOrder,
			ZIndex = t4.zIndex,
			BackgroundTransparency = 1,
			ref = if not FFlagLuaAppHomeTouchAutoplay then nil else v131
		}, {
			TwoByOneTileContainer = React.createElement("TextButton", {
				Size = t4.size or UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ref = v104,
				Selectable = false
			}, {
				HiddenTileContent = React.createElement(HiddenTileContent, {
					appPage = t4.appPage,
					collectionId = t4.topicId,
					setGameHidden = t4.setGameHidden,
					universeId = universeId,
					parentRef = v104,
					isSponsored = isSponsored
				})
			})
		})
	end

	return React.createElement("Frame", {
		LayoutOrder = t4.layoutOrder,
		ZIndex = t4.zIndex,
		BackgroundTransparency = 1,
		ref = v131
	}, {
		TwoByOneTileContainer = React.createElement("TextButton", {
			Size = t4.size or UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ref = v104,
			[React.Event.TouchLongPress] = v111,
			[React.Event.Activated] = v125,
			[React.Event.SelectionGained] = v113,
			[React.Event.SelectionLost] = v114,
			[React.Change.GuiState] = v110
		}, {
			BackgroundImage = React.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = v129,
				ScaleType = Enum.ScaleType.Crop,
				ZIndex = 0
			}, {
				UICorner = React.createElement("UICorner", {
					CornerRadius = uDim
				})
			}),
			GradientOverlayLeft = React.createElement("Frame", {
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(v69, 0, 1, 0),
				BackgroundColor3 = color3,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 1
			}, {
				UICorner = React.createElement("UICorner", {
					CornerRadius = uDim
				}),
				UIGradientLeft = React.createElement("UIGradient", {
					Rotation = 0,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, v67),
						NumberSequenceKeypoint.new(1, v68)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, color3_2),
						ColorSequenceKeypoint.new(1, color3_2)
					})
				})
			}),
			GradientOverlayBottom = React.createElement("Frame", {
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, v69, 0),
				BackgroundColor3 = color3,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 1
			}, {
				UICorner = React.createElement("UICorner", {
					CornerRadius = uDim
				}),
				UIGradientBottom = React.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, v68),
						NumberSequenceKeypoint.new(1, v67)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, color3_2),
						ColorSequenceKeypoint.new(1, color3_2)
					})
				})
			}),
			TileBadge = v100 and React.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ZIndex = 2
			}, {
				Badge = React.createElement(GameTileThumbnailBadges, {
					tileBadgesByPosition = v100
				})
			}),
			ContentOverlay = React.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ZIndex = 3
			}, {
				UIPadding = React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, Medium),
					PaddingRight = UDim.new(0, Medium),
					PaddingTop = UDim.new(0, Medium2),
					PaddingBottom = UDim.new(0, Medium2)
				}),
				Logo = t4.logoImageAssetId and React.createElement(FoundationImage, {
					Position = UDim2.new(1, 0, 0, 0),
					AnchorPoint = Vector2.new(1, 0),
					Image = "rbxassetid://" .. tostring(t4.logoImageAssetId),
					Size = UDim2.new(1, 0, v97, 0),
					aspectRatio = v96
				}),
				HeaderFrame = React.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, 0, 0.47, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundTransparency = 1
				}, {
					UIListLayout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, XXSmall)
					}),
					Headline = React.createElement("TextLabel", {
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Text = t4.headline or "",
						Font = v84.Font,
						TextSize = v84.FontSize,
						TextColor3 = color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextWrapped = true
					}),
					Subtitle = React.createElement("TextLabel", {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Text = t4.subtitle or "",
						Font = BodySmall.Font,
						TextSize = BodySmall.FontSize,
						TextColor3 = color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextWrapped = true
					})
				}),
				JoinButtonContainer = v79.onCtaActivation == t1.JoinGame and React.createElement("Frame", {
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					JoinButton = React.createElement(PlayButton, {
						universeId = universeId,
						placeId = if not t4.placeIdOverride then placeId else t4.placeIdOverride,
						referralSource = t4.appPage,
						eventContext = "TwoByOneTile",
						launchSource = "TwoByOneTile",
						playableText = v78,
						hidePlayableIcon = true,
						buttonSize = Small,
						width = v92,
						onActivated = v122,
						reportExperienceLaunched = v119,
						experienceJoinData = if not t4.launchDataOverride then nil else {
							launchData = t4.launchDataOverride
						}
					})
				}),
				ViewGameDetailsButton = v79.onCtaActivation == t1.OpenEdp and React.createElement("TextButton", {
					Size = UDim2.new(v92.Scale, v92.Offset, 0, Size_800),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = v93,
					BackgroundTransparency = v94,
					Text = v78,
					TextColor3 = v80.LightMode.ActionOverMedia.Foreground.Color3,
					Font = TitleSmall.Font,
					TextSize = TitleSmall.FontSize,
					[React.Event.Activated] = v123
				}, {
					UICorner = React.createElement("UICorner", {
						CornerRadius = UDim.new(0, v80.Radius.Medium)
					})
				}),
				BottomRightLabel = React.createElement("TextLabel", {
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, CaptionSmall.FontSize * CaptionSmall.LineHeight),
					BackgroundTransparency = 1,
					Text = v130,
					TextSize = CaptionSmall.FontSize,
					Font = CaptionSmall.Font,
					TextColor3 = v80.Color.Extended.Gray.Gray_400.Color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				})
			}),
			OverflowMenuContainer = v117 and React.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ZIndex = 4
			}, {
				OverflowMenu = React.createElement(GameTileOverflowMenu, {
					isHovered = v107,
					isSelected = if not FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then nil else v102,
					universeId = universeId,
					collectionId = t4.topicId,
					appPage = t4.appPage,
					setGameHidden = t4.setGameHidden or function() -- line: 827
					end,
					menuKey = hoverKey,
					menuOpen = v106,
					onMenuOpenChanged = if not FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then nil else v118,
					parentRef = v104,
					isSponsored = t4.isSponsored,
					payerName = t4.payerName,
					sponsoredUserCohort = t4.sponsoredUserCohort,
					adId = t4.adId,
					availableMenuItems = v116
				})
			})
		})
	})
end
