local ContentProvider = game:GetService("ContentProvider")
local GameTile = script:FindFirstAncestor("GameTile")
local GridTileIconTextFooter = require(GameTile.Footer.GridTileIconTextFooter)
local GridTileFriendFooter = require(GameTile.Footer.GridTileFriendFooter).GridTileFriendFooter
local GridTileTextFooter = require(GameTile.Footer.GridTileTextFooter)
local GameStats = require(GameTile.Footer.GameStats)
local GridTileSponsoredFooter = require(GameTile.Footer.GridTileSponsoredFooter)
local GameTileThumbnailBadges = require(GameTile.Overlays.GameTileThumbnailBadges)
local sortFriendsByPresenceAndRecencyFactory = require(GameTile.sortFriendsByPresenceAndRecencyFactory)
local OpenCentralOverlayForPlacesList = require(GameTile.OpenCentralOverlayForPlacesList)
local GameTileView = require(GameTile.GameTileView)
local AppExperienceActionRow = require(GameTile.AppExperienceActionRow)
local GameTileConstants = require(GameTile.GameTileConstants)
local OpenSponsoredTooltip = require(GameTile.OpenSponsoredTooltip)
local GameTileTypes = require(GameTile.GameTileTypes)
local useIsHoveredTile = require(GameTile.useIsHoveredTile)
local HoverTileCoordinator = require(GameTile.HoverTileCoordinator)
local getGameTileLayoutData = require(GameTile.getGameTileLayoutData)
local GameTileViewConfig = require(GameTile.GameTileViewConfig)
local useHasInGameFriends = require(GameTile.useHasInGameFriends)
local useInGameUserIds = require(GameTile.useInGameUserIds)
local useValidTileBadges = require(GameTile.Overlays.useValidTileBadges)
local GameTileVideoThumbnail = require(GameTile.GameTileVideoThumbnail)
local VideoEndReason = require(GameTile.Video.Analytics.VideoEndReason)
local GameVideoPlaybackDetector = require(GameTile.Video.GameVideoPlaybackDetector)
local useHasVideoThumbnailSelector = require(GameTile.Video.useHasVideoThumbnailSelector)
local formatExperienceIcon = require(GameTile.formatExperienceIcon)
local formatExperienceRating = require(GameTile.formatExperienceRating)
local formatExperienceThumbnail = require(GameTile.formatExperienceThumbnail)
local HiddenTileContent = require(GameTile.HiddenGameTile.HiddenTileContent)
local ItemLayoutDataParsingUtils = require(GameTile.ItemLayoutDataParsingUtils)
local GameTileParent = GameTile.Parent
local GameCollectionItemTypes = require(GameTileParent.DiscoveryTypes).GameCollectionItemTypes
local AppBlox = require(GameTileParent.AppBlox)
local React = require(GameTileParent.React)
local Roact = require(GameTileParent.Roact)
local RoactRodux = require(GameTileParent.RoactRodux)
local Cryo = require(GameTileParent.Cryo)
local RoactServices = require(GameTileParent.RoactServices).RoactServices
local RoactNetworking = require(GameTileParent.RoactServiceTags).RoactNetworking
local VideoUtils = require(GameTileParent.VideoUtils)
local t = require(GameTileParent.t)
local UIBlox = require(GameTileParent.UIBlox)
local withStyle = UIBlox.Style.withStyle
local Images = UIBlox.App.ImageSet.Images
local AspectRatioModeEnum = UIBlox.App.Tile.AspectRatioModeEnum
local ImpressionsTagUtility = require(GameTileParent.Impressions).ImpressionsTagUtility
local useUiModeInfo = require(GameTileParent.RobloxAppHooks).useUiModeInfo
local useRoactService = require(GameTileParent.RobloxAppHooks).useRoactService
local UiMode = require(GameTileParent.RobloxAppEnums).UiMode
local memoize = require(GameTileParent.AppCommonLib).memoize
local IntervalPerformanceTracker = require(GameTileParent.IntervalPerformanceTracker).IntervalPerformanceTracker
local GameIconReducer = require(GameTileParent.GameIconRodux).GameIcons.GameIconReducer
local GameInfosReducer = require(GameTileParent.GameInfosRodux).GameInfosReducer
local useSelector = require(GameTileParent.RoactUtils).Hooks.RoactRodux.useSelector
local useTokens = require(GameTileParent.Foundation).Hooks.useTokens
local getOverflowMenuSignalStore = AppBlox.getOverflowMenuSignalStore
local useOverflowMenuOpen = AppBlox.useOverflowMenuOpen
local useTriggerFeedback = require(GameTileParent.InteractionFeedback).useTriggerFeedback
local DiscoveryAnalytics = require(GameTileParent.DiscoveryAnalytics)
local gameTileOverflowMenuAction = DiscoveryAnalytics.Events.gameTileOverflowMenuAction
local sponsoredGamesRecordClick = DiscoveryAnalytics.Requests.sponsoredGamesRecordClick
local Responsive = require(GameTileParent.Responsive)
local usePreferredInput = Responsive.usePreferredInput
local useTagAsViewportAutoplayCandidate = VideoUtils.useTagAsViewportAutoplayCandidate
local DiscoveryAppLaunchTracker = require(GameTileParent.AppLaunchTracker).DiscoveryAppLaunchTracker
local GetFFlagEnableNavigationPerformanceIntervals = require(GameTileParent.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals
local FFlagLuaAppGameTileInteractionFeedback = require(GameTileParent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local FFlagLuaAppMigrateGameTileHoverFixes = require(GameTileParent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local FFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(GameTileParent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local FFlagLuaAppUnifyPlayButtonTile = require(GameTileParent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppGameTileWideVideoThumbnail = require(GameTileParent.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(GameTileParent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryFullScreen = require(GameTileParent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppHomeUnifiedVideoEngagementEvents = require(GameTileParent.SharedFlags).FFlagLuaAppHomeUnifiedVideoEngagementEvents
local FFlagLuaAppGameDetailsAttributionFix = require(GameTileParent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local v77 = game:DefineFastFlag("LuaAppUseRatingFormatHelper2", false)
local FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix = require(GameTileParent.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix
local FFlagLuaAppGameTileOverflowMenuTelemetry = require(GameTileParent.SharedFlags).FFlagLuaAppGameTileOverflowMenuTelemetry
local FFlagLuaAppHapticTriggeredTelemetry = require(GameTileParent.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry
local FFlagLuaAppFixExplicitFeedbackTelemetry = require(GameTileParent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local FFlagLuaAppEnableWhyThisAdModal = require(GameTileParent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = require(GameTileParent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppUpdateAdMetadata = require(GameTileParent.SharedFlags).FFlagLuaAppUpdateAdMetadata
local FFlagLuaAppSupportSponsoredExplicitFeedback = require(GameTileParent.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppTileVideoDeviceMemoryBlocking = require(GameTileParent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local FFlagLuaAppSupportAdRatingFooter = require(GameTileParent.SharedFlags).FFlagLuaAppSupportAdRatingFooter
local FFlagLuaAppCustomSpawnNonNilCheck = require(GameTileParent.SharedFlags).FFlagLuaAppCustomSpawnNonNilCheck
local FFlagLuaAppFixTwoByOneOverflowMenuTelemetry = require(GameTileParent.SharedFlags).FFlagLuaAppFixTwoByOneOverflowMenuTelemetry
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(GameTileParent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppSupportAdRatingFooterExperiment = require(GameTileParent.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment
local FFlagLuaAppTwoByOneTileTelemetryFix = require(GameTileParent.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix
local FFlagLuaAppSupportPrimaryMediaContentMetadata = require(GameTileParent.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata
local FFlagLuaAppNarrowTileSmallerFooterFont = require(GameTileParent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(GameTileParent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(GameTileParent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local v97 = game:DefineFastFlag("LuaAppHasVideoThumbnailFix", false) and FFlagLuaAppSupportPrimaryMediaContentMetadata
local FIntLuaAppGameTileVideoDwellTimeInSec = require(GameTileParent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local FIntLuaAppGameTileVideoVisiblePercent = require(GameTileParent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local FFlagLuaAppHomeTouchAutoplay = require(GameTileParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppTileVideoCandidateOnly = require(GameTileParent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppVideoTileDisableActivation = require(GameTileParent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppFixHiddenTileVideoCleanup = require(GameTileParent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local VideoPlaybackCoordinator = require(GameTileParent.VideoUtils).VideoPlaybackCoordinator
local GameTileOverflowMenu = require(GameTile.GameTileOverflowMenu)
local getAvailableGameTileOverflowMenuItems = require(GameTile.getAvailableGameTileOverflowMenuItems)

game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130)

local v107 = Roact.PureComponent:extend("AppGameTile")

v107.validateProps = t.strictInterface({
	entry = t.table,
	reportGameDetailOpened = t.callback,
	reportExperienceLaunched = t.optional(t.callback),
	Size = t.optional(t.union(t.UDim2, t.table)),
	ZIndex = t.optional(t.number),
	useHoverTile = t.optional(t.boolean),
	hasBackground = t.boolean,
	useGridTile = t.boolean,
	playerCountStyle = t.optional(t.string),
	isSponsoredFooterAllowed = t.optional(t.boolean),
	isSponsoredRatingFooterAllowed = if not FFlagLuaAppSupportAdRatingFooter then nil else t.optional(t.boolean),
	useExperienceTileMetadata = t.boolean,
	hideGameStats = t.optional(t.boolean),
	gameTileLayoutType = t.optional(t.string),
	topicId = t.optional(t.string),
	playButtonStyle = t.optional(t.string),
	onGuiStateChanged = if not FFlagLuaAppGameTileInteractionFeedback then nil else t.optional(t.callback),
	isDisabled = t.optional(t.boolean),
	onActivated = if not FFlagLuaAppGameTileInteractionFeedback then nil else t.optional(t.callback),
	onSelectionGained = t.optional(t.callback),
	onSelectionLost = t.optional(t.callback),
	friendFooterEnabled = t.optional(t.boolean),
	index = t.optional(t.number),
	layoutOrder = t.optional(t.number),
	source = t.optional(t.string),
	referralSource = t.optional(t.string),
	onPeekViewClosed = t.optional(t.callback),
	rowNum = t.optional(t.number),
	showFriendActivity = t.boolean,
	contentTextLineCount = t.optional(t.number),
	metadataTextLineCount = t.optional(t.number),
	thumbnailAspectRatioOverride = t.optional(t.string),
	impressionsTag = t.optional(t.string),
	launchExperienceEventContext = t.optional(t.string),
	navigateToGameDetails = t.callback,
	isContained = t.optional(t.boolean),
	hideTitle = t.optional(t.boolean),
	hideMetadata = t.optional(t.boolean),
	textSizeOffset = t.optional(t.number),
	foundationTokens = t.optional(t.table),
	videoAnalytics = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else t.optional(t.table),
	videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else t.optional(t.table),
	SelectionOrder = t.optional(t.number),
	enableExplicitFeedback = t.optional(t.boolean),
	setGameHidden = t.optional(t.callback),
	appPage = t.optional(t.string),
	isHidden = t.optional(t.boolean),
	isNarrowScreenXSmall = t.optional(t.boolean),
	onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t.optional(t.callback),
	sponsoredUserCohort = if not FFlagLuaAppEnableWhyThisAdModal then nil else t.optional(t.string),
	enableSponsoredFeedback = t.optional(t.boolean),
	availableMenuItems = t.optional(t.table),
	enableReportAd = if not FFlagLuaAppEnableSponsoredReportAd then nil else t.optional(t.boolean),
	sponsoredFooterAdLabelText = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t.optional(t.string),
	sponsoredFooterAdLabelFirst = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t.optional(t.boolean),
	sponsoredFooterIncludeRatingContent = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t.optional(t.boolean),
	compactMetadataFormat = if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else t.optional(t.boolean),
	hideRating = if not FFlagLuaAppNarrowTileHideRating then nil else t.optional(t.boolean),
	hidePlayerCount = if not FFlagLuaAppNarrowTileHidePlayerCount then nil else t.optional(t.boolean),
	game = t.optional(t.table),
	universeId = t.string,
	navigationUniverseId = t.optional(t.string),
	name = t.string,
	totalUpVotes = t.number,
	totalDownVotes = t.number,
	friendActivityTitle = t.optional(t.string),
	friendVisitedString = t.optional(t.string),
	imageThumbnail = t.string,
	wideThumbnail = t.optional(t.string),
	videoThumbnail = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else t.optional(t.string),
	rating = t.optional(t.string),
	showAgeRating = t.optional(t.boolean),
	ageRatingText = t.optional(t.string),
	friendVisits = t.table,
	hidePlayButton = t.boolean,
	footerLayoutData = t.optional(t.table),
	openContextualMenu = t.callback,
	openSponsoredTooltip = t.callback,
	networking = t.callback,
	hoverRef = t.table,
	isHoverSupported = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else t.optional(t.boolean),
	isHovered = t.optional(t.boolean),
	isVideoPlaying = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else t.boolean,
	tileBadges = t.optional(t.table),
	users = t.optional(t.table),
	inGameUsersByGame = t.optional(t.table),
	hasInGameFriends = t.boolean,
	inGameUserIds = if not FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else t.table,
	badgeOverride = t.optional(t.table),
	forceHideAgeRatings = t.optional(t.boolean),
	onGameTileActivated = if not FFlagLuaAppGameDetailsAttributionFix then nil else t.optional(t.callback),
	recordSponsoredGameClick = if not FFlagLuaAppGameDetailsAttributionFix then nil else t.optional(t.callback),
	overflowMenuOpen = t.optional(t.boolean),
	hoverKey = t.optional(t.string),
	triggerFeedback = t.callback
})

local Narrow = GameTileTypes.GameTileLayoutType.Narrow

v107.defaultProps = {
	useHoverTile = false,
	hasBackground = false,
	useExperienceTileMetadata = false,
	useGridTile = false,
	thumbnailAspectRatioOverride = AspectRatioModeEnum.Square,
	gameTileLayoutType = Narrow,
	contentTextLineCount = GameTileConstants.TileTextLines[Narrow].titleTextLines,
	hideGameStats = false
}

function v107.init(p1) -- line: 267
	-- upvalues: DiscoveryAppLaunchTracker (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (copy), FFlagLuaAppFixExplicitFeedbackTelemetry (copy), gameTileOverflowMenuAction (copy), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy), FFlagLuaAppHapticTriggeredTelemetry (copy), getOverflowMenuSignalStore (copy), FFlagLuaAppGameDetailsAttributionFix (copy), HoverTileCoordinator (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoEndReason (copy), VideoPlaybackCoordinator (copy), Roact (copy), AppExperienceActionRow (copy), FFlagLuaAppUnifyPlayButtonTile (copy), sponsoredGamesRecordClick (copy), FFlagLuaAppGameTileInteractionFeedback (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), FFlagLuaAppCustomSpawnNonNilCheck (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervals (copy), IntervalPerformanceTracker (copy), Responsive (copy), ContentProvider (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), memoize (copy), sortFriendsByPresenceAndRecencyFactory (copy)
	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackTileInit()
	end

	p1.state = {
		isHovered = false,
		canDisplayFriendFooter = false,
		isSelected = false
	}
	p1.onMenuOpenChanged = if not FFlagLuaAppGameTileOverflowMenuTelemetry then nil else function(b1: boolean, s1: string?) -- line: 279
		-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (copy), p1 (copy), gameTileOverflowMenuAction (copy), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy)
		local t1 = {
			ctx = if not FFlagLuaAppFixExplicitFeedbackTelemetry then p1.props.appPage else nil,
			universeId = p1.props.universeId,
			sortId = p1.props.topicId,
			actionType = not b1 and "GameTileOverflowMenuOpened" or "GameTileOverflowMenuClosed",
			availableMenuItems = s1
		}

		gameTileOverflowMenuAction(t1, if not FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.props.appPage or if not FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then nil else "Unknown")
	end

	function p1.onTouchLongPress() -- line: 299
		-- upvalues: p1 (copy), FFlagLuaAppHapticTriggeredTelemetry (copy), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy), getOverflowMenuSignalStore (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (copy)
		if next(p1.props.availableMenuItems) ~= nil then
			if p1.props.triggerFeedback and not p1.props.overflowMenuOpen then
				local v212 = if not FFlagLuaAppHapticTriggeredTelemetry then nil else {
					universeId = p1.props.universeId,
					sortId = p1.props.topicId
				}

				p1.props.triggerFeedback("TileLongPress", "Press", if not FFlagLuaAppHapticTriggeredTelemetry then nil else p1.props.appPage or if not FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then nil else "Unknown", if not FFlagLuaAppHapticTriggeredTelemetry then nil else v212)
			end

			getOverflowMenuSignalStore().openMenu(p1.props.hoverKey)

			if FFlagLuaAppGameTileOverflowMenuTelemetry then
				local t2 = {}

				for v214, _ in p1.props.availableMenuItems do
					table.insert(t2, v214)
				end

				p1.onMenuOpenChanged(false, table.concat(t2, ","))
			end
		end
	end
	function p1.reportExperienceLaunchedFromActionBar(...) -- line: 333
		-- upvalues: FFlagLuaAppGameDetailsAttributionFix (copy), p1 (copy), HoverTileCoordinator (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoEndReason (copy), VideoPlaybackCoordinator (copy)
		if FFlagLuaAppGameDetailsAttributionFix then
			p1.props.recordSponsoredGameClick()
		else
			p1.recordSponsoredGameClick()
		end

		if p1.props.isHovered then
			HoverTileCoordinator.default:reset()
		end

		if p1.props.reportExperienceLaunched then
			p1.props.reportExperienceLaunched(...)
		end

		if FFlagLuaAppGameTileWideVideoThumbnail then
			if FFlagLuaAppHomeTouchAutoplay and p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
				p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReason.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)

				return
			end

			VideoPlaybackCoordinator.default:reset(VideoEndReason.ExperienceLaunched, nil, p1.props.navigationUniverseId, nil)
		end
	end
	function p1.renderAppExperienceActionRow(_) -- line: 372
		-- upvalues: Roact (copy), AppExperienceActionRow (copy), p1 (copy), FFlagLuaAppGameDetailsAttributionFix (copy), FFlagLuaAppUnifyPlayButtonTile (copy)
		return Roact.createElement(AppExperienceActionRow, {
			universeId = p1.props.navigationUniverseId,
			referralSource = p1.props.referralSource,
			launchSource = "ExperienceTile",
			reportExperienceLaunched = p1.reportExperienceLaunchedFromActionBar,
			openGameDetails = if not FFlagLuaAppGameDetailsAttributionFix then p1.onActivated else function() -- line: 379
				-- upvalues: p1 (copy)
				p1.props.onGameTileActivated(p1.isMounted)
			end,
			entry = p1.props.entry,
			launchExperienceEventContext = p1.props.launchExperienceEventContext,
			horizontalPadding = if not p1.props.useGridTile then nil else 0,
			index = p1.props.index,
			isUnifiedGameTileEnabled = not not FFlagLuaAppUnifyPlayButtonTile or nil,
			placeIdOverride = p1.props.entry.placeIdOverride,
			launchDataOverride = p1.props.entry.launchDataOverride
		})
	end
	function p1.onHoverChanged(p3) -- line: 393
		-- upvalues: p1 (copy)
		if p3 and p1.props.triggerFeedback then
			p1.props.triggerFeedback("Default", "Hover")
		end

		p1:setState({
			isHovered = p3
		})
	end

	p1.gameTileRef = Roact.createRef()

	function p1.getTilePosition() -- line: 405
		-- upvalues: p1 (copy)
		if p1.gameTileRef.current then
			return p1.gameTileRef.current.AbsolutePosition
		end

		return nil
	end
	function p1.getTileSize() -- line: 413
		-- upvalues: p1 (copy)
		if p1.gameTileRef.current then
			return p1.gameTileRef.current.AbsoluteSize
		end

		return nil
	end

	p1.recordSponsoredGameClick = not FFlagLuaAppGameDetailsAttributionFix and function() -- line: 423
		-- upvalues: p1 (copy), sponsoredGamesRecordClick (copy)
		local networking = p1.props.networking
		local entry = p1.props.entry

		if entry.isSponsored then
			sponsoredGamesRecordClick(networking, entry.adId)
		end
	end or nil
	p1.onActivated = not FFlagLuaAppGameDetailsAttributionFix and function() -- line: 434
		-- upvalues: p1 (copy), HoverTileCoordinator (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoEndReason (copy), VideoPlaybackCoordinator (copy), FFlagLuaAppGameTileInteractionFeedback (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), FFlagLuaAppCustomSpawnNonNilCheck (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervals (copy), IntervalPerformanceTracker (copy)
		if p1.props.isHovered then
			HoverTileCoordinator.default:reset()
		end

		if FFlagLuaAppGameTileWideVideoThumbnail then
			if FFlagLuaAppHomeTouchAutoplay and p1.props.videoPlaybackContext and p1.props.videoPlaybackContext.videoPlaybackCoordinator then
				p1.props.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReason.TileClicked, nil, p1.props.navigationUniverseId, nil)
			else
				VideoPlaybackCoordinator.default:reset(VideoEndReason.TileClicked, nil, p1.props.navigationUniverseId, nil)
			end
		end

		if p1.isMounted then
			if FFlagLuaAppGameTileInteractionFeedback and p1.props.onActivated then
				p1.props.onActivated()
			end

			local navigationUniverseId = p1.props.navigationUniverseId
			local t3 = {
				source = p1.props.source,
				index = p1.props.index,
				referralSource = p1.props.referralSource,
				onPeekViewClosed = p1.props.onPeekViewClosed,
				placeIdOverride = p1.props.entry.placeIdOverride,
				experienceJoinData = if not FFlagLuaAppTwoByOneTileTelemetryFix then if not not FFlagLuaAppCustomSpawnNonNilCheck and not p1.props.entry.launchDataOverride then nil else {
					launchData = p1.props.entry.launchDataOverride
				} else {
					launchData = if not not FFlagLuaAppCustomSpawnNonNilCheck and not p1.props.entry.launchDataOverride then nil else p1.props.entry.launchDataOverride,
					tileType = p1.props.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile,
					nativeAdData = p1.props.entry.adId
				}
			}

			if GetFFlagEnableNavigationPerformanceIntervals() then
				IntervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
			end

			p1.props.navigateToGameDetails(navigationUniverseId, t3)

			local index = p1.props.index

			p1.props.reportGameDetailOpened(index, navigationUniverseId)
			p1.recordSponsoredGameClick()
		end
	end or nil

	function p1.onFriendFooterActivated() -- line: 505
		-- upvalues: p1 (copy)
		if p1.isMounted then
			local game2 = p1.props.game
			local v224 = p1.getTileSize()

			p1.props.openContextualMenu(game2, v224, p1.getTilePosition())
		end
	end
	function p1.onActivateSponsoredTooltip() -- line: 513
		-- upvalues: p1 (copy), Responsive (copy)
		if p1.isMounted then
			p1.props.openSponsoredTooltip(Responsive.GetInputModeStore(false).getLastInputType(false))
		end
	end
	function p1.loadWideThumbnail() -- line: 521
		-- upvalues: p1 (copy), ContentProvider (copy)
		local wideThumbnail = p1.props.wideThumbnail

		if wideThumbnail ~= nil then
			task.spawn(function() -- line: 524
				-- upvalues: ContentProvider (copy), wideThumbnail (copy)
				ContentProvider:PreloadAsync({ wideThumbnail })
			end)
		end
	end
	function p1.getVisitedFriends() -- line: 530
		-- upvalues: p1 (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy)
		local t4 = {}
		local friendVisits = p1.props.friendVisits

		for i = 1, #friendVisits do
			local str = tostring(friendVisits[i].userId)

			if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
				table.insert(t4, str)
			elseif p1.props.users and p1.props.users[str] then
				local v230 = p1.props.users[str]

				table.insert(t4, {
					userId = str,
					displayName = v230.displayName
				})
			end
		end

		return t4
	end

	p1.getSortedFriends = memoize(function(p4, p5) -- line: 558
		-- upvalues: sortFriendsByPresenceAndRecencyFactory (copy)
		if not p4 or not p5 then
			return {}
		end

		local t5 = {}

		for _, v in pairs(p5) do
			local v236 = p4[v]

			if v236 and v236.isFriend then
				table.insert(t5, {
					userId = v236.id,
					displayName = v236.displayName
				})
			end
		end

		local v237 = sortFriendsByPresenceAndRecencyFactory("displayName")

		table.sort(t5, v237)

		return t5
	end)

	function p1.onSelectionGained() -- line: 580
		-- upvalues: p1 (copy)
		p1:setState({
			isSelected = true
		})

		if p1.props.onSelectionGained then
			p1.props.onSelectionGained(p1.props.entry, p1.props.index, p1.props.navigationUniverseId)
		end
	end
	function p1.onSelectionLost() -- line: 588
		-- upvalues: p1 (copy)
		p1:setState({
			isSelected = false
		})

		if p1.props.onSelectionLost then
			p1.props.onSelectionLost()
		end
	end
end
function v107.renderGridTilesFooter(p6) -- line: 614
	-- upvalues: FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), FFlagLuaAppSupportAdRatingFooter (copy), FFlagLuaAppSupportAdRatingFooterExperiment (copy), FFlagLuaAppMigrateGameTileFixConsoleMetadataText (copy), GameTileTypes (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), Roact (copy), GameStats (copy), GameTileConstants (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), React (copy), GridTileSponsoredFooter (copy), FFlagLuaAppUpdateAdMetadata (copy), GridTileTextFooter (copy), GridTileFriendFooter (copy), GridTileIconTextFooter (copy), Images (copy)
	local v114 = p6.props.useHoverTile or p6.props.useExperienceTileMetadata
	local friendFooterEnabled = p6.props.friendFooterEnabled
	local hasInGameFriends = p6.props.hasInGameFriends
	local v117 = if not FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else p6.props.inGameUserIds
	local users = p6.props.users
	local inGameUsersByGame = p6.props.inGameUsersByGame
	local v120 = if not FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then p6.getSortedFriends(users, inGameUsersByGame) else nil
	local v121 = friendFooterEnabled and if not FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then hasInGameFriends else v117 and #v117 > 0
	local v122 = p6.props.friendVisits and #p6.props.friendVisits > 0
	local footerLayoutData = p6.props.footerLayoutData
	local v124

	if footerLayoutData == nil then
		v124 = nil
	elseif footerLayoutData.type ~= "TextLabel" then
		v124 = nil
	else
		local text = footerLayoutData.text

		v124 = if text ~= nil then text.textLiteral else nil
	end

	local v126 = false

	if (p6.props.isHovered or p6.state.isSelected) and p6.props.ageRatingText and not p6.props.hidePlayButton then
		v124 = p6.props.ageRatingText
		v126 = true
	end

	local v127 = v124 ~= nil
	local entry = p6.props.entry
	local v129 = entry.isSponsored and (entry.isShowSponsoredLabel or (p6.props.isSponsoredFooterAllowed or (FFlagLuaAppSupportAdRatingFooter and p6.props.isSponsoredRatingFooterAllowed or FFlagLuaAppSupportAdRatingFooterExperiment and p6.props.sponsoredFooterAdLabelText ~= nil)))

	if FFlagLuaAppMigrateGameTileFixConsoleMetadataText and p6.props.gameTileLayoutType == GameTileTypes.GameTileLayoutType.Narrow and p6.props.useExperienceTileMetadata and (v129 or v127) or FFlagLuaAppNarrowTileSmallerFooterFont and p6.props.compactMetadataFormat then
		v114 = false
	end

	local v130 = if not FFlagLuaAppSupportAdRatingFooter then nil else Roact.createElement(GameStats, {
		stats = {
			totalUpVotes = p6.props.totalUpVotes,
			totalDownVotes = p6.props.totalDownVotes,
			playerCount = if p6.props.playerCountStyle ~= GameTileConstants.PlayerCountStyleValues.Footer or not not FFlagLuaAppSupportAdRatingFooterExperiment and v129 then nil else p6.props.entry.playerCount
		},
		isGridTile = p6.props.useGridTile,
		hideGameStats = p6.props.hideGameStats,
		useLargerFont = v114,
		isUnifiedGameTile = true,
		gameTileLayoutType = p6.props.gameTileLayoutType,
		shouldSizeToContentWidth = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else v129,
		compactMetadataFormat = if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else p6.props.compactMetadataFormat,
		hideRating = if not FFlagLuaAppNarrowTileHideRating then nil else p6.props.hideRating,
		hidePlayerCount = if not FFlagLuaAppNarrowTileHidePlayerCount then nil else p6.props.hidePlayerCount
	})

	if p6.props.hideMetadata then
		if p6.props.isHovered then
			if v129 then
				return React.createElement(GridTileSponsoredFooter, {
					useLargerFont = v114,
					onActivateSponsoredTooltip = p6.onActivateSponsoredTooltip,
					isUnifiedGameTile = true,
					gameTileLayoutType = p6.props.gameTileLayoutType,
					isNarrowScreenXSmall = p6.props.isNarrowScreenXSmall,
					enableSponsoredFeedback = if not FFlagLuaAppUpdateAdMetadata then nil else p6.props.enableSponsoredFeedback,
					isSponsoredRatingFooterAllowed = if not FFlagLuaAppSupportAdRatingFooter then nil else p6.props.isSponsoredRatingFooterAllowed,
					gameStatsElement = if not FFlagLuaAppSupportAdRatingFooter then nil else v130,
					sponsoredFooterAdLabelText = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else p6.props.sponsoredFooterAdLabelText,
					sponsoredFooterAdLabelFirst = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else p6.props.sponsoredFooterAdLabelFirst,
					sponsoredFooterIncludeRatingContent = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else p6.props.sponsoredFooterIncludeRatingContent
				})
			end

			if v126 then
				return React.createElement(GridTileTextFooter, {
					text = v124,
					useLargerFont = v114,
					isUnifiedGameTile = true
				})
			end
		end

		return nil
	end

	if v129 then
		return (React.createElement(GridTileSponsoredFooter, {
			useLargerFont = v114,
			onActivateSponsoredTooltip = p6.onActivateSponsoredTooltip,
			isUnifiedGameTile = true,
			gameTileLayoutType = p6.props.gameTileLayoutType,
			isNarrowScreenXSmall = p6.props.isNarrowScreenXSmall,
			enableSponsoredFeedback = if not FFlagLuaAppUpdateAdMetadata then nil else p6.props.enableSponsoredFeedback,
			isSponsoredRatingFooterAllowed = if not FFlagLuaAppSupportAdRatingFooter then nil else p6.props.isSponsoredRatingFooterAllowed,
			gameStatsElement = if not FFlagLuaAppSupportAdRatingFooter then nil else v130,
			sponsoredFooterAdLabelText = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else p6.props.sponsoredFooterAdLabelText,
			sponsoredFooterAdLabelFirst = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else p6.props.sponsoredFooterAdLabelFirst,
			sponsoredFooterIncludeRatingContent = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else p6.props.sponsoredFooterIncludeRatingContent
		}))
	end

	if v127 then
		return (React.createElement(GridTileTextFooter, {
			text = v124,
			useLargerFont = v114,
			isUnifiedGameTile = true
		}))
	end

	if v121 then
		if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			return (Roact.createElement(GridTileFriendFooter, {
				showOnlineBorder = false,
				useLargerFont = v114,
				friendUserIds = v117,
				onFriendFooterActivated = p6.onFriendFooterActivated
			}))
		end

		return (Roact.createElement(GridTileFriendFooter, {
			showOnlineBorder = false,
			friends = v120,
			useLargerFont = v114
		}))
	end

	if p6.props.friendVisitedString then
		return (Roact.createElement(GridTileIconTextFooter, {
			icon = Images["icons/menu/recent"],
			text = p6.props.friendVisitedString,
			iconSize = not v114 and 24 or 32,
			useLargerFont = v114
		}))
	end

	if v122 then
		if FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
			return (Roact.createElement(GridTileFriendFooter, {
				showOnlineBorder = false,
				friendUserIds = p6.getVisitedFriends(),
				useLargerFont = v114
			}))
		end

		return (Roact.createElement(GridTileFriendFooter, {
			showOnlineBorder = false,
			friends = p6.getVisitedFriends(),
			useLargerFont = v114
		}))
	end

	if FFlagLuaAppSupportAdRatingFooter then
		return v130
	end

	return (Roact.createElement(GameStats, {
		stats = {
			totalUpVotes = p6.props.totalUpVotes,
			totalDownVotes = p6.props.totalDownVotes,
			playerCount = if p6.props.playerCountStyle ~= GameTileConstants.PlayerCountStyleValues.Footer then nil else p6.props.entry.playerCount
		},
		isGridTile = p6.props.useGridTile,
		hideGameStats = p6.props.hideGameStats,
		useLargerFont = v114,
		isUnifiedGameTile = true,
		gameTileLayoutType = p6.props.gameTileLayoutType,
		compactMetadataFormat = if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else p6.props.compactMetadataFormat,
		hideRating = if not FFlagLuaAppNarrowTileHideRating then nil else p6.props.hideRating,
		hidePlayerCount = if not FFlagLuaAppNarrowTileHidePlayerCount then nil else p6.props.hidePlayerCount
	}))
end
function v107.renderContent(p7, p8, p9, _) -- line: 825
	-- upvalues: GameTileConstants (copy), GameTileViewConfig (copy), React (copy), GameStats (copy), HiddenTileContent (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), GameTileVideoThumbnail (copy), FFlagLuaAppVideoTileDisableActivation (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppGameDetailsAttributionFix (copy), FFlagLuaAppHomeUnifiedVideoEngagementEvents (copy), FFlagLuaAppHomeTouchAutoplay (copy), Roact (copy), GameTileThumbnailBadges (copy), GameTileOverflowMenu (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), GameTileView (copy), FFlagLuaAppMigrateGameTileHoverFixes (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppGameTileInteractionFeedback (copy), AppExperienceActionRow (copy), FFlagLuaAppUnifyPlayButtonTile (copy)
	local v135 = p7.props.Size or UDim2.fromScale(1, 1)
	local imageThumbnail = p7.props.imageThumbnail
	local onGameTileActivated = p7.props.onGameTileActivated
	local v138 = p7.props.playerCountStyle == GameTileConstants.PlayerCountStyleValues.Always or p7.props.isHovered and p7.props.playerCountStyle == GameTileConstants.PlayerCountStyleValues.Hover
	local v139 = GameTileViewConfig.getImageAspectRatio(p7.props.gameTileLayoutType)
	local v140 = p7:renderGridTilesFooter()
	local v141 = if not p7.props.hideTitle then p7.props.name else nil
	local v142 = if not v138 then nil else React.createElement(GameStats, {
		stats = {
			playerCount = p7.props.entry.playerCount,
			displayConcurrentUsersPill = true
		}
	})
	local playButtonHeight = GameTileViewConfig.getElementSizes(p9.Tokens, p7.props.textSizeOffset, p7.props.contentTextLineCount, p7.props.foundationTokens, true).playButtonHeight
	local v144 = if not p7.props.isHidden then if not FFlagLuaAppGameTileWideVideoThumbnail or not p7.props.videoThumbnail then nil else React.createElement(GameTileVideoThumbnail, {
		video = p7.props.videoThumbnail,
		image = imageThumbnail,
		playing = p7.props.isVideoPlaying,
		looped = true,
		Size = UDim2.fromScale(1, 1),
		isTileContained = p7.props.isContained,
		cornerRadius = p9.Tokens.Global.Space_100,
		ZIndex = -2,
		onActivated = if not FFlagLuaAppVideoTileDisableActivation then if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else if not FFlagLuaAppGameDetailsAttributionFix then p7.onActivated else function() -- line: 876
			-- upvalues: onGameTileActivated (copy), p7 (copy)
			onGameTileActivated(p7.isMounted)
		end else nil,
		itemIndex = p7.props.index,
		videoAnalytics = p7.props.videoAnalytics,
		universeId = if not FFlagLuaAppHomeUnifiedVideoEngagementEvents then nil else p7.props.universeId,
		videoPlaybackCoordinator = if not FFlagLuaAppHomeTouchAutoplay or not p7.props.videoPlaybackContext then nil else p7.props.videoPlaybackContext.videoPlaybackCoordinator
	}) else React.createElement(HiddenTileContent, {
		appPage = p7.props.appPage,
		collectionId = p7.props.topicId,
		setGameHidden = p7.props.setGameHidden,
		universeId = p7.props.universeId,
		parentRef = p7.props.hoverRef,
		isSponsored = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else p7.props.entry.isSponsored
	})
	local v145 = nil

	if FFlagLuaAppGameTileWideVideoThumbnail and not p7.props.isVideoPlaying then
		v145 = if not p7.props.tileBadges then v142 else Roact.createFragment({
			SocialFeaturePill = v142,
			Badge = React.createElement(GameTileThumbnailBadges, {
				tileBadgesByPosition = p7.props.tileBadges
			})
		})
	end

	local isHidden = p7.props.isHidden
	local v147 = if next(p7.props.availableMenuItems) == nil or (not p7.props.isHovered and (not p7.props.overflowMenuOpen and not p7.state.isSelected) or isHidden) then nil else React.createElement(GameTileOverflowMenu, {
		isHovered = p7.props.isHovered,
		isSelected = p7.state.isSelected,
		universeId = p7.props.universeId,
		collectionId = p7.props.topicId,
		appPage = p7.props.appPage,
		setGameHidden = p7.props.setGameHidden,
		menuKey = p7.props.hoverKey,
		menuOpen = p7.props.overflowMenuOpen,
		onMenuOpenChanged = if not FFlagLuaAppGameTileOverflowMenuTelemetry then nil else p7.onMenuOpenChanged,
		parentRef = p7.props.hoverRef,
		isSponsored = if not FFlagLuaAppEnableWhyThisAdModal then nil else p7.props.entry.isSponsored,
		payerName = if not FFlagLuaAppEnableWhyThisAdModal then nil else p7.props.entry.payerName,
		sponsoredUserCohort = if not FFlagLuaAppEnableWhyThisAdModal then nil else p7.props.sponsoredUserCohort,
		adId = if not FFlagLuaAppEnableSponsoredReportAd then nil else p7.props.entry.adId,
		availableMenuItems = p7.props.availableMenuItems
	})

	return React.createElement("Frame", {
		Size = v135,
		ZIndex = p7.props.ZIndex,
		BackgroundTransparency = 1,
		LayoutOrder = p7.props.layoutOrder,
		ref = p7.gameTileRef
	}, {
		Tile = React.createElement(GameTileView, {
			SelectionOrder = p7.props.SelectionOrder,
			Selectable = not isHidden,
			hoverPadding = if FFlagLuaAppMigrateGameTileHoverFixes or p7.props.useGridTile then nil else p9.Tokens.Global.Space_100,
			numLinesForTitle = p7.props.contentTextLineCount,
			numLinesForMetadata = p7.props.metadataTextLineCount,
			imageAspectRatio = v139,
			isContained = p7.props.isContained,
			containmentSidePadding = GameTileViewConfig.getContainmentSidePadding(p9.Tokens, p7.props.gameTileLayoutType, p7.props.foundationTokens),
			Size = UDim2.fromScale(1, 1),
			image = imageThumbnail,
			onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else p7.props.onTileImageLoaded,
			thumbnailComponent = v144,
			title = if not isHidden then v141 else nil,
			isDisabled = not not isHidden or p7.props.isDisabled,
			onActivated = if not FFlagLuaAppGameDetailsAttributionFix or isHidden then p7.onActivated else function() -- line: 964
				-- upvalues: onGameTileActivated (copy), p7 (copy)
				onGameTileActivated(p7.isMounted)
			end,
			onGuiStateChanged = if not FFlagLuaAppGameTileInteractionFeedback then nil else p7.props.onGuiStateChanged,
			onSelectionGained = p7.onSelectionGained,
			onSelectionLost = p7.onSelectionLost,
			onTouchLongPress = if isHidden then nil else p7.onTouchLongPress,
			reducedMotion = p8,
			isHovered = not isHidden and p7.props.isHovered,
			forwardRef = p7.props.hoverRef,
			hidePlayButton = not not isHidden or p7.props.hidePlayButton,
			hoverActionRow = if p7.props.hidePlayButton or isHidden then nil else React.createElement(AppExperienceActionRow, {
				universeId = p7.props.navigationUniverseId,
				referralSource = p7.props.referralSource,
				launchSource = "ExperienceTile",
				reportExperienceLaunched = p7.reportExperienceLaunchedFromActionBar,
				openGameDetails = if not FFlagLuaAppGameDetailsAttributionFix then p7.onActivated else function() -- line: 983
					-- upvalues: onGameTileActivated (copy), p7 (copy)
					onGameTileActivated(p7.isMounted)
				end,
				entry = p7.props.entry,
				launchExperienceEventContext = p7.props.launchExperienceEventContext,
				fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000,
				index = p7.props.index,
				horizontalPadding = 0,
				verticalPadding = 0,
				height = playButtonHeight,
				showButtonText = v139 > 1,
				isUnifiedGameTileEnabled = not not FFlagLuaAppUnifyPlayButtonTile or nil,
				placeIdOverride = p7.props.entry.placeIdOverride,
				launchDataOverride = p7.props.entry.launchDataOverride
			}),
			thumbnailOverlay = if not isHidden then if not FFlagLuaAppGameTileWideVideoThumbnail then if not p7.props.tileBadges then v142 else Roact.createFragment({
				SocialFeaturePill = v142,
				Badge = React.createElement(GameTileThumbnailBadges, {
					tileBadgesByPosition = p7.props.tileBadges
				})
			}) else v145 else nil,
			overflowMenu = v147,
			footerMetadata = if not isHidden then v140 else nil,
			isUnifiedGameTile = true,
			textSizeOffset = p7.props.textSizeOffset,
			hideMetadata = p7.props.hideMetadata
		})
	})
end
function v107.render(p11) -- line: 1021
	-- upvalues: DiscoveryAppLaunchTracker (copy), withStyle (copy)
	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackTileRender()
	end

	if p11.props.game == nil then
		return nil
	end

	return withStyle(function(p12) -- line: 1031
		-- upvalues: p11 (copy)
		local ReducedMotion = p12.Settings.ReducedMotion

		return p11:renderContent(ReducedMotion, p12, p11.props.foundationTokens)
	end)
end
function v107.didMount(p13) -- line: 1037
	-- upvalues: ImpressionsTagUtility (copy)
	p13.isMounted = true
	ImpressionsTagUtility.AddTag(p13.gameTileRef, p13.props.impressionsTag, p13.props.index)

	if not p13.props.useGridTile and (p13.props.friendFooterEnabled and p13.props.hasInGameFriends) then
		p13:setState({
			canDisplayFriendFooter = true
		})
	end

	if p13.props.useGridTile then
		p13.loadWideThumbnail()
	end
end
function v107.willUnmount(p14) -- line: 1052
	-- upvalues: ImpressionsTagUtility (copy)
	p14.isMounted = false
	ImpressionsTagUtility.RemoveTag(p14.gameTileRef, p14.props.impressionsTag, p14.props.index)
end
function v107.didUpdate(p15, p16) -- line: 1057
	-- upvalues: ImpressionsTagUtility (copy)
	if p16.impressionsTag ~= p15.props.impressionsTag or p16.index ~= p15.props.index then
		ImpressionsTagUtility.RemoveTag(p15.gameTileRef, p16.impressionsTag, p16.index)
		ImpressionsTagUtility.AddTag(p15.gameTileRef, p15.props.impressionsTag, p15.props.index)
	end

	if p15.props.useGridTile and p16.universeId ~= p15.props.universeId then
		p15.loadWideThumbnail()
	end

	if not p15.props.useGridTile and ((p16.friendFooterEnabled ~= p15.props.friendFooterEnabled or p16.hasInGameFriends ~= p15.props.hasInGameFriends) and p15.props.friendFooterEnabled and p15.props.hasInGameFriends) then
		p15:setState({
			canDisplayFriendFooter = true
		})
	end
end

local u109 = RoactRodux.connect(function(p17, p18) -- line: 1090
	-- upvalues: FFlagLuaAppGameDetailsAttributionFix (copy), GameInfosReducer (copy), GameTileConstants (copy), getGameTileLayoutData (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), ItemLayoutDataParsingUtils (copy), formatExperienceThumbnail (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), GameIconReducer (copy), formatExperienceIcon (copy), v77 (copy), formatExperienceRating (copy)
	local universeId = p18.entry.universeId
	local v158 = nil

	if not FFlagLuaAppGameDetailsAttributionFix then
		v158 = if not p18.entry.navigationUniverseId or (p18.entry.navigationUniverseId == "" or p18.entry.navigationUniverseId == "0") then p18.entry.universeId else p18.entry.navigationUniverseId
	end

	local v159 = p17.Personalization[GameInfosReducer.key][universeId]
	local v160 = v159 and v159.totalUpVotes or 0
	local v161 = v159 and v159.totalDownVotes or 0
	local v162 = v159 and v159.friendActivityTitle or nil
	local v163 = nil
	local v164 = v159 and v159.minimumAge or 0
	local v165 = v159 and v159.ageRecommendationDisplayName or ""
	local v166 = if p18.gameTileLayoutType ~= "Event" then p18.gameTileLayoutType == "Wide" and p18.playButtonStyle == GameTileConstants.PlayButtonStyleValues.Disabled else p18.playButtonStyle ~= GameTileConstants.PlayButtonStyleValues.Enabled
	local v167

	if v166 or p18.forceHideAgeRatings then
		v167 = false
	elseif v164 ~= 0 and v165 ~= "" then
		v167 = true
		v163 = v165
	else
		v167 = false
	end

	local v168 = getGameTileLayoutData(v159, p18.topicId)
	local v169 = ((if not FFlagLuaAppSupportPrimaryMediaContentMetadata or not p18.entry.primaryWideImageAssetId then ItemLayoutDataParsingUtils.getWideImageAssetId(v168) else p18.entry.primaryWideImageAssetId)) or (v159 and v159.primaryWideAssetId or nil)
	local v170 = formatExperienceThumbnail(v169, p18.entry.placeId)
	local v171 = nil

	if FFlagLuaAppGameTileWideVideoThumbnail then
		local v172 = if not FFlagLuaAppSupportPrimaryMediaContentMetadata or not p18.entry.primaryWideVideoAssetId then v168 and (v168.primaryMediaAsset and v168.primaryMediaAsset.wideVideoAssetId) else p18.entry.primaryWideVideoAssetId

		v171 = if not v172 then nil else `rbxassetid://{ v172 }`
	end

	local v173 = p17[GameIconReducer.key][universeId] and p17[GameIconReducer.key][universeId].url or nil
	local v174 = if not p18.useGridTile then formatExperienceIcon(v173, universeId) else v170
	local v175 = if not p18.useHoverTile and not p18.useExperienceTileMetadata then nil else if not v77 then if v160 + v161 ~= 0 then tostring((math.floor(v160 / (v160 + v161) * 100 + 0.5))) .. "%" else "--" else formatExperienceRating(v160, v161, nil, true)
	local v176 = v159 and v159.friendVisits or {}
	local v177 = if not v159 or v159.friendVisitedString == "" then nil else v159.friendVisitedString
	local v178 = v168 and v168.footer or nil
	local v179 = v168 and v168.title or (v159 and v159.name or "")

	return {
		game = v159,
		universeId = universeId,
		navigationUniverseId = if FFlagLuaAppGameDetailsAttributionFix then nil else v158,
		name = v179,
		totalUpVotes = v160,
		totalDownVotes = v161,
		imageThumbnail = v174,
		wideThumbnail = v170,
		videoThumbnail = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else v171,
		friendActivityTitle = v162,
		rating = v175,
		showAgeRating = v167,
		ageRatingText = v163,
		friendVisits = v176,
		friendVisitedString = v177,
		hidePlayButton = v166,
		footerLayoutData = v178
	}
end, function(p19) -- line: 1198
	-- upvalues: OpenCentralOverlayForPlacesList (copy), OpenSponsoredTooltip (copy)
	return {
		openContextualMenu = function(p20, p21, p22) --[[ openContextualMenu ]] -- line: 1200
			-- upvalues: p19 (copy), OpenCentralOverlayForPlacesList (copy)
			p19(OpenCentralOverlayForPlacesList(p20, p21, p22))
		end,
		openSponsoredTooltip = function(p23) --[[ openSponsoredTooltip ]] -- line: 1203
			-- upvalues: p19 (copy), OpenSponsoredTooltip (copy)
			return p19(OpenSponsoredTooltip(p23))
		end
	}
end)(v107)

if not FFlagLuaAppGameDetailsAttributionFix then
	u109 = RoactServices.connect({
		networking = RoactNetworking
	})(u109)
end

return function(p24) -- line: 1215
	-- upvalues: React (copy), useTokens (copy), useIsHoveredTile (copy), useUiModeInfo (copy), UiMode (copy), useValidTileBadges (copy), useSelector (copy), FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix (copy), useHasInGameFriends (copy), useInGameUserIds (copy), FFlagLuaAppFixHiddenTileVideoCleanup (copy), FFlagLuaAppGameDetailsAttributionFix (copy), useRoactService (copy), RoactNetworking (copy), sponsoredGamesRecordClick (copy), HoverTileCoordinator (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoEndReason (copy), VideoPlaybackCoordinator (copy), FFlagLuaAppGameTileInteractionFeedback (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), FFlagLuaAppCustomSpawnNonNilCheck (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervals (copy), IntervalPerformanceTracker (copy), useOverflowMenuOpen (copy), useTriggerFeedback (copy), getAvailableGameTileOverflowMenuItems (copy), FFlagLuaAppEnableSponsoredReportAd (copy), u109 (ref), Cryo (copy), useHasVideoThumbnailSelector (copy), v97 (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), useTagAsViewportAutoplayCandidate (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), usePreferredInput (copy), GameVideoPlaybackDetector (copy), Responsive (copy), FIntLuaAppGameTileVideoDwellTimeInSec (copy), FIntLuaAppGameTileVideoVisiblePercent (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (copy)
	local v182 = React.useRef(nil)
	local v183 = useTokens()
	local useHoverTile = p24.useHoverTile
	local v185 = `{ p24.impressionsTag or "" }_{ p24.index or "0" }_{ p24.gameTileLayoutType or "Narrow" }`

	if p24.impressionsTag == nil or p24.index == nil then
		useHoverTile = false
	end

	local v186 = useIsHoveredTile(v182, v185, useHoverTile)
	local v187 = useUiModeInfo().uiMode == UiMode.TenFoot
	local v188 = not not v187 or p24.useHoverTile
	local v189 = if p24.useExperienceTileMetadata == nil then v187 else p24.useExperienceTileMetadata
	local v190 = useValidTileBadges(p24.entry.universeId, p24.topicId, p24.badgeOverride)
	local v191 = useSelector(function(p25) -- line: 1238
		return p25.LocalUserId
	end)
	local v192 = nil

	if not FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then
		v192 = useSelector(function(p26) -- line: 1244
			return p26.Users
		end)
	end

	local v193 = useSelector(function(p27) -- line: 1249
		-- upvalues: p24 (copy)
		return p27.InGameUsersByGame[p24.entry.universeId]
	end)
	local v194 = useHasInGameFriends(v191, v192, v193)
	local v195 = if not FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else useInGameUserIds(v191, v193)
	local v196, v197 = React.useState(false)

	if FFlagLuaAppFixHiddenTileVideoCleanup then
		React.useEffect(function() -- line: 1261
			-- upvalues: p24 (copy), v197 (copy)
			if p24.isHidden then
				v197(false)
			end
		end, { p24.isHidden })
	end

	local u198 = nil
	local u199 = nil
	local v200 = nil
	local u201 = nil

	if FFlagLuaAppGameDetailsAttributionFix then
		u198 = useRoactService(RoactNetworking)
		u199 = if not p24.entry.navigationUniverseId or (p24.entry.navigationUniverseId == "" or p24.entry.navigationUniverseId == "0") then p24.entry.universeId else p24.entry.navigationUniverseId
		u201 = React.useCallback(function() -- line: 1282
			-- upvalues: p24 (copy), sponsoredGamesRecordClick (copy), u198 (ref)
			local entry = p24.entry

			if entry.isSponsored then
				sponsoredGamesRecordClick(u198, entry.adId)
			end
		end, {
			u198,
			p24.entry.isSponsored,
			p24.entry.adId
		})
		v200 = React.useCallback(function(p28) -- line: 1291
			-- upvalues: p24 (copy), HoverTileCoordinator (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), FFlagLuaAppHomeTouchAutoplay (copy), VideoEndReason (copy), u199 (ref), VideoPlaybackCoordinator (copy), FFlagLuaAppGameTileInteractionFeedback (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), FFlagLuaAppCustomSpawnNonNilCheck (copy), GameCollectionItemTypes (copy), GetFFlagEnableNavigationPerformanceIntervals (copy), IntervalPerformanceTracker (copy), u201 (ref)
			if p24.isHovered then
				HoverTileCoordinator.default:reset()
			end

			if FFlagLuaAppGameTileWideVideoThumbnail then
				if FFlagLuaAppHomeTouchAutoplay and p24.videoPlaybackContext and p24.videoPlaybackContext.videoPlaybackCoordinator then
					p24.videoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReason.TileClicked, nil, u199, nil)
				else
					VideoPlaybackCoordinator.default:reset(VideoEndReason.TileClicked, nil, u199, nil)
				end
			end

			if p28 then
				if FFlagLuaAppGameTileInteractionFeedback and p24.onActivated then
					p24.onActivated()
				end

				local t6 = {
					source = p24.source,
					index = p24.index,
					referralSource = p24.referralSource,
					onPeekViewClosed = p24.onPeekViewClosed,
					placeIdOverride = p24.entry.placeIdOverride,
					experienceJoinData = if not FFlagLuaAppTwoByOneTileTelemetryFix then if not not FFlagLuaAppCustomSpawnNonNilCheck and not p24.entry.launchDataOverride then nil else {
						launchData = p24.entry.launchDataOverride
					} else {
						launchData = if not not FFlagLuaAppCustomSpawnNonNilCheck and not p24.entry.launchDataOverride then nil else p24.entry.launchDataOverride,
						tileType = p24.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile,
						nativeAdData = p24.entry.adId
					}
				}

				if GetFFlagEnableNavigationPerformanceIntervals() then
					IntervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
				end

				p24.navigateToGameDetails(u199, t6)
				p24.reportGameDetailOpened(p24.index, u199)
				u201()
			end
		end, {
			p24.isHovered,
			p24.index,
			p24.videoAnalytics,
			p24.onActivated,
			p24.source,
			p24.referralSource,
			p24.onPeekViewClosed,
			p24.navigateToGameDetails,
			p24.reportGameDetailOpened,
			u199,
			u201,
			p24.entry.placeIdOverride,
			p24.entry.launchDataOverride,
			if not FFlagLuaAppHomeTouchAutoplay or not p24.videoPlaybackContext then nil else p24.videoPlaybackContext.videoPlaybackCoordinator
		})
	end

	local v202 = useOverflowMenuOpen(v185)
	local v203 = useTriggerFeedback()
	local v204 = React.useMemo(function() -- line: 1383
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), p24 (copy), FFlagLuaAppEnableSponsoredReportAd (copy)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = p24.entry.isSponsored,
			enableExplicitFeedback = p24.enableExplicitFeedback,
			enableSponsoredFeedback = p24.enableSponsoredFeedback,
			enableReportAd = if not FFlagLuaAppEnableSponsoredReportAd then nil else p24.enableReportAd
		})
	end, {
		p24.entry.isSponsored,
		p24.enableExplicitFeedback,
		p24.enableSponsoredFeedback,
		if not FFlagLuaAppEnableSponsoredReportAd then nil else p24.enableReportAd
	})
	local v205 = React.createElement(u109, Cryo.Dictionary.join(p24, {
		useExperienceTileMetadata = v189,
		hasBackground = v188,
		hoverRef = v182,
		isHoverSupported = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else useHoverTile,
		isHovered = v186,
		isVideoPlaying = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else v196,
		tileBadges = v190,
		foundationTokens = v183,
		users = v192,
		inGameUsersByGame = v193,
		hasInGameFriends = v194,
		inGameUserIds = if not FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix then nil else v195,
		networking = if not FFlagLuaAppGameDetailsAttributionFix then nil else u198,
		navigationUniverseId = if not FFlagLuaAppGameDetailsAttributionFix then nil else u199,
		onGameTileActivated = if not FFlagLuaAppGameDetailsAttributionFix then nil else v200,
		recordSponsoredGameClick = if not FFlagLuaAppGameDetailsAttributionFix then nil else u201,
		overflowMenuOpen = v202,
		hoverKey = v185,
		triggerFeedback = v203,
		availableMenuItems = v204
	}))

	if FFlagLuaAppGameTileWideVideoThumbnail then
		local v206 = useHasVideoThumbnailSelector(p24.entry.universeId, p24.topicId)
		local v207 = nil

		if v97 then
			v207 = p24.entry.primaryWideVideoAssetId ~= nil or v206
		elseif FFlagLuaAppSupportPrimaryMediaContentMetadata then
			v206 = p24.entry.primaryWideVideoAssetId ~= nil or v206
		end

		if FFlagLuaAppHomeTouchAutoplay then
			useTagAsViewportAutoplayCandidate(v182, p24.videoPlaybackContext, if not FFlagLuaAppTileVideoCandidateOnly then nil else if not v97 then v206 else v207, if not FFlagLuaAppFixHiddenTileVideoCleanup then nil else p24.isHidden)
		end

		local v208 = if not FFlagLuaAppEdpMediaGalleryVideoPreview then nil else usePreferredInput()

		if (not v97 and v206 or v97 and v207) and (not FFlagLuaAppHomeTouchAutoplay or not p24.isHidden) then
			return React.createElement(React.Fragment, {}, {
				GameTile = v205,
				VideoPlaybackDetector = React.createElement(GameVideoPlaybackDetector, {
					videoKey = v185,
					itemIndex = p24.index,
					universeId = p24.entry.universeId,
					tileRef = v182,
					isHoverSupported = useHoverTile,
					isHovered = v186,
					autoplay = if not FFlagLuaAppEdpMediaGalleryVideoPreview then nil else v208 == Responsive.Input.Touch,
					onPlaybackChange = v197,
					videoAnalytics = p24.videoAnalytics,
					videoDwellTimeInSec = FIntLuaAppGameTileVideoDwellTimeInSec,
					videoVisiblePercent = FIntLuaAppGameTileVideoVisiblePercent,
					pageContext = if not FFlagLuaAppTileVideoDeviceMemoryBlocking then nil else p24.appPage,
					videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else p24.videoPlaybackContext
				})
			})
		end
	end

	return v205
end
