local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local DiscoveryMonolithParent = DiscoveryMonolith.Parent
local React = require(DiscoveryMonolithParent.React)
local t = require(DiscoveryMonolithParent.t)
local validateProps = require(DiscoveryMonolithParent.DiscoveryUtils).validateProps
local GameTile = require(DiscoveryMonolithParent.GameTile)
local GameTileConstants = GameTile.GameTileConstants
local getGameTileCollectionItemSize = GameTile.getGameTileCollectionItemSize

require(DiscoveryMonolithParent.VideoUtils)
require(DiscoveryMonolithParent.AppCommonLib)

local Responsive = require(DiscoveryMonolithParent.Responsive)
local usePreferredInput = Responsive.usePreferredInput
local useBreakpointXOrSmaller = Responsive.useBreakpointXOrSmaller
local useAppPolicy = require(DiscoveryMonolithParent.UniversalAppPolicy).useAppPolicy
local CollectionViews = require(DiscoveryMonolithParent.CollectionViews)
local CollectionCarousel = CollectionViews.CollectionCarousel
local useCollectionLayout = CollectionViews.useCollectionLayout
local GameCollections = require(DiscoveryMonolithParent.GameCollections)
local useCountdownSubtitleTextBinding = GameCollections.useCountdownSubtitleTextBinding
local useGetGameTileHeight = GameCollections.useGetGameTileHeight
local useRenderGameCollectionItem = GameCollections.useRenderGameCollectionItem
local useGameCollectionLayoutParams = GameCollections.useGameCollectionLayoutParams
local isSeeAllTileEnabled = GameCollections.isSeeAllTileEnabled
local useGameSortHeaderButtonParams = GameCollections.useGameSortHeaderButtonParams
local useIsHoldToPlayEnabledForGames = GameCollections.useIsHoldToPlayEnabledForGames
local WaitForPropWrapper = GameCollections.WaitForPropWrapper
local DiscoveryAnalytics = require(DiscoveryMonolithParent.DiscoveryAnalytics)
local useControllerBarFocusNavigationBindings = GameCollections.GameCollectionNavigationBindings.useControllerBarFocusNavigationBindings
local useGameSortAnalytics = GameCollections.useGameSortAnalytics
local GameSortImpressionsDetector = GameCollections.GameSortImpressionsDetector
local useGameSortData = GameCollections.useGameSortData
local useGameSortImpressionsParams = GameCollections.useGameSortImpressionsParams
local useGameSortTooltipParams = GameCollections.useGameSortTooltipParams
local AppPage = require(DiscoveryMonolithParent.RobloxAppEnums).AppPage
local ScrollDetector = require(DiscoveryMonolithParent.ScrollTelemetry).ScrollDetector
local FrameBoundsImpressionsTracker = require(DiscoveryMonolithParent.Impressions).FrameBoundsImpressionsTracker
local ScreenSizeImpressionsTracker = require(DiscoveryMonolithParent.Impressions).ScreenSizeImpressionsTracker
local HoldToPlayLauncher = require(DiscoveryMonolithParent.HoldToPlay).HoldToPlayLauncher
local useHoldToPlayStateAndCallbacks = require(DiscoveryMonolithParent.HoldToPlay).useHoldToPlayStateAndCallbacks
local useTextSizeOffset = require(DiscoveryMonolithParent.UIBlox).Core.Style.useTextSizeOffset
local HoverTileCoordinator = require(DiscoveryMonolithParent.GameTile).HoverTileCoordinator
local useVideoAnalytics = require(DiscoveryMonolithParent.GameTile).useVideoAnalytics
local DiscoveryTypes = require(DiscoveryMonolithParent.DiscoveryTypes)
local OmniFeedConstants = DiscoveryTypes.OmniFeedConstants
local Modules = DiscoveryMonolith.Modules
local useAmpUpsellAction = require(Modules.Personalization.Games.useAmpUpsellAction)
local useLoadGamesForSortFromGamesApi = require(Modules.Personalization.Games.useLoadGamesForSortFromGamesApi)
local useLoadMoreGames = require(Modules.Personalization.Games.useLoadMoreGames)
local SharedFlags = require(DiscoveryMonolithParent.SharedFlags)
local FFlagLuaAppHeaderButtonText = SharedFlags.FFlagLuaAppHeaderButtonText
local FFlagSearchOmniAutocompletePage = SharedFlags.FFlagSearchOmniAutocompletePage
local FFlagLuaAppGameTileWideVideoThumbnail = SharedFlags.FFlagLuaAppGameTileWideVideoThumbnail
local FFlagLuaAppHomeGameCarouselRemount = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppHomeGameCarouselRemount
local FFlagLuaAppAddTestIdsForGameCollections = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections
local FFlagLuaAppTileVideoDeviceMemoryBlocking = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking
local FFlagLuaAppUseFrameBoundsImpressions = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local FFlagLuaAppCompositionSupport = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppNarrowTileSmallerFooterFont = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppHomeTouchAutoplay = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameCarouselAmpUpsellAction = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction
local v63 = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else "gameCarousel"
local v64 = t.strictInterface({
	useGridTiles = t.optional(t.boolean),
	gameSortId = t.string,
	sortIndex = t.number,
	pageContext = t.string,
	scrollViewPositionChangedSignal = t.optional(t.table),
	friendFooterEnabled = t.optional(t.boolean),
	playerCountStyle = t.optional(t.string),
	isSponsoredFooterAllowed = t.optional(t.boolean),
	componentType = t.optional(t.string),
	hideSeeAll = t.optional(t.boolean),
	gameTileLayoutType = t.optional(t.string),
	infoText = t.optional(t.string),
	endTimestamp = t.optional(t.number),
	countdownString = t.optional(t.string),
	linkPath = t.optional(t.string),
	subtitleLinkPath = t.optional(t.string),
	ampUpsellFeatureName = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else t.optional(t.string),
	ampUpsellNamespace = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else t.optional(t.string),
	refreshFeed = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else t.optional(t.callback),
	gridSupportAllowed = t.optional(t.boolean),
	isHoverSupportEnabled = t.optional(t.boolean),
	startRow = t.optional(t.number),
	playButtonStyle = t.optional(t.string),
	sideMargin = if FFlagLuaAppCompositionAlways then nil else t.optional(t.number),
	backgroundMuralUrl = t.optional(t.string),
	headerButtonText = if not FFlagLuaAppHeaderButtonText then nil else t.optional(t.string),
	shouldHideTileMetadata = t.optional(t.boolean),
	shouldHideTileTitle = t.optional(t.boolean),
	containedTile = t.optional(t.boolean),
	shouldUseFrameBoundsForImpressions = if not FFlagSearchOmniAutocompletePage then nil else t.optional(t.boolean),
	layoutOverrides = if not FFlagSearchOmniAutocompletePage then nil else t.optional(t.table),
	numUpdatesToDelayImpressions = t.optional(t.number),
	selectionOrderBase = t.optional(t.number),
	defaultContainerSize = t.optional(t.Vector2),
	appCompositionEnabled = if not FFlagLuaAppCompositionSupport then nil else t.optional(t.boolean),
	onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t.optional(t.callback),
	videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else t.optional(t.table)
})

return React.memo(function(t1: {[any]: any}) --[[ GameCollectionCarousel ]] -- line: 161
	-- upvalues: validateProps (copy), v64 (copy), useAppPolicy (copy), usePreferredInput (copy), Responsive (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), useBreakpointXOrSmaller (copy), getGameTileCollectionItemSize (copy), React (copy), FFlagLuaAppHomeTouchAutoplay (copy), useGameSortData (copy), useLoadGamesForSortFromGamesApi (copy), DiscoveryTypes (copy), useLoadMoreGames (copy), useGameSortAnalytics (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), OmniFeedConstants (copy), useAmpUpsellAction (copy), v63 (copy), useGameSortHeaderButtonParams (copy), FFlagLuaAppHeaderButtonText (copy), useGameSortTooltipParams (copy), useGameSortImpressionsParams (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), useVideoAnalytics (copy), useIsHoldToPlayEnabledForGames (copy), useHoldToPlayStateAndCallbacks (copy), useControllerBarFocusNavigationBindings (copy), FFlagSearchOmniAutocompletePage (copy), useGameCollectionLayoutParams (copy), useCollectionLayout (copy), GameTileConstants (copy), useTextSizeOffset (copy), useGetGameTileHeight (copy), isSeeAllTileEnabled (copy), useRenderGameCollectionItem (copy), AppPage (copy), DiscoveryAnalytics (copy), FFlagLuaAppTileVideoDeviceMemoryBlocking (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), useCountdownSubtitleTextBinding (copy), HoverTileCoordinator (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy), GameSortImpressionsDetector (copy), FFlagLuaAppHomeGameCarouselRemount (copy), CollectionCarousel (copy), FFlagLuaAppAddTestIdsForGameCollections (copy), WaitForPropWrapper (copy), ScrollDetector (copy), HoldToPlayLauncher (copy)
	validateProps(v64, t1)

	local v66 = useAppPolicy(function(p1) -- line: 165
		return p1.useGridPageLayout()
	end)
	local v67 = usePreferredInput()
	local v68 = t1.isHoverSupportEnabled and (v66 and v67 == Responsive.Input.Pointer)
	local v69 = t1.gameTileLayoutType or "Narrow"
	local v70 = FFlagLuaAppCompositionAlways or FFlagLuaAppCompositionSupport and t1.appCompositionEnabled
	local v71 = nil
	local v72 = nil
	local v73 = nil

	if FFlagLuaAppNarrowTileSmallerFooterFont or (FFlagLuaAppNarrowTileHideRating or FFlagLuaAppNarrowTileHidePlayerCount) then
		local v74 = useBreakpointXOrSmaller(Responsive.Keys.Small)
		local v75 = v70 and (v69 == "Narrow" and v74)

		v71 = if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else v75
		v72 = if not FFlagLuaAppNarrowTileHideRating then nil else v75
		v73 = if not FFlagLuaAppNarrowTileHidePlayerCount then nil else v75
	end

	local v76 = if not v70 then nil else getGameTileCollectionItemSize(v69)
	local v77, v78 = React.useState(nil)
	local v79 = React.useRef(v77)

	v79.current = v77

	local v80 = React.useRef(nil)
	local v81 = nil
	local v82 = nil

	if FFlagLuaAppHomeTouchAutoplay then
		local v83 = if not FFlagLuaAppHomeTouchAutoplay or not t1.videoPlaybackContext then nil else t1.videoPlaybackContext.viewportVideoAutoplayController

		v81 = React.useCallback(function() -- line: 212
			-- upvalues: v83 (copy)
			if v83 then
				v83:onScrollStart()
			end
		end, { v83 })
		v82 = React.useCallback(function(n1: number) -- line: 217
			-- upvalues: v83 (copy), v79 (copy)
			if v83 then
				v83:onScrollSettled("X", n1, v79)
			end
		end, {
			v83,
			v79
		})
	end

	local v84 = useGameSortData(t1.gameSortId, t1.pageContext)
	local v85 = v84.gameSortContents and v84.gameSortContents.entries or {}
	local v86 = useLoadGamesForSortFromGamesApi(t1.gameSortId)

	React.useEffect(function() -- line: 236
		-- upvalues: v84 (copy), DiscoveryTypes (copy), v86 (copy)
		if v84.sort and v84.sort.dataSource == DiscoveryTypes.DataSourceType.ExploreApi then
			v86()
		end
	end, {
		t1.gameSortId,
		v84.sort
	})

	local v87 = useLoadMoreGames(v84.gameSortContents, v84.sort, v84.gameSortFetchingStatus, t1.pageContext, v84.sortIndex)
	local v88, v89, v90, v91 = useGameSortAnalytics(v84.sort, v84.isOmni, t1.sortIndex, t1.pageContext, v80, v85, #v85, t1.startRow)
	local v92 = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else React.useCallback(function() -- line: 263
		-- upvalues: t1 (copy), OmniFeedConstants (copy)
		if not t1.refreshFeed then
			return
		end

		t1.refreshFeed(OmniFeedConstants.OmniRecommendationsRequestIntent.AmpUpsellFeatureGranted)
	end, { t1.refreshFeed })
	local v93 = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else useAmpUpsellAction(t1.ampUpsellFeatureName, t1.ampUpsellNamespace, v92, v63)
	local v94, v95, v96 = useGameSortHeaderButtonParams(v90, v84.sort, v84.isOmni, v84.sortIndex, v84.gamesApiSortPageId, t1.gameSortId, t1.pageContext, t1.linkPath, t1.subtitleLinkPath, if not FFlagLuaAppHeaderButtonText then nil else t1.headerButtonText, if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else v93)
	local v97, v98 = useGameSortTooltipParams(v84.sort, v84.isOmni, t1.infoText)
	local v99, v100, v101 = useGameSortImpressionsParams(v84.sort, v84.isOmni, t1.sortIndex, t1.pageContext, t1.useGridTiles, t1.componentType, v84.gamesApiSortPageId, t1.gameSortId, t1.scrollViewPositionChangedSignal, nil, t1.startRow, v85)
	local v102 = `GameCarousel_{ t1.gameSortId }{ t1.sortIndex }`
	local v103 = nil

	if FFlagLuaAppGameTileWideVideoThumbnail then
		v103 = useVideoAnalytics(v84.sort, v84.isOmni, t1.pageContext, t1.sortIndex, v85)
	end

	local v104 = useIsHoldToPlayEnabledForGames()
	local v105 = useHoldToPlayStateAndCallbacks()
	local v106 = useControllerBarFocusNavigationBindings(v94, if not v104 then nil else v105.holdToPlayEventHandler)

	React.useEffect(function() -- line: 329
		-- upvalues: v106 (copy), v77 (copy)
		if v106 then
			v106(v77)
		end
	end, {
		v106,
		v77
	})

	local v107 = if not FFlagSearchOmniAutocompletePage or not t1.layoutOverrides then if not v66 then {
		sideMargin = t1.sideMargin
	} else nil else t1.layoutOverrides
	local v108 = useGameCollectionLayoutParams(v69, v77, false, v107, t1.defaultContainerSize)
	local itemsPerRow = nil

	if FFlagLuaAppCompositionSupport then
		itemsPerRow = useCollectionLayout(v76).itemsPerRow
	end

	local backgroundMuralUrl = t1.backgroundMuralUrl
	local v111 = t1.shouldHideTileTitle or false
	local v112 = t1.shouldHideTileMetadata or false
	local v113 = if t1.containedTile == nil then v66 and (not not t1.gridSupportAllowed and t1.gameTileLayoutType == "Narrow") or backgroundMuralUrl ~= nil and backgroundMuralUrl ~= "" else t1.containedTile
	local v114 = GameTileConstants.TileTextLines[v69] and GameTileConstants.TileTextLines[v69].titleTextLines
	local v115 = useTextSizeOffset()
	local v116 = useGetGameTileHeight(v68, v69, v113, v112, v111, v115, nil, v114, if not FFlagLuaAppNarrowTileHideRating and not FFlagLuaAppNarrowTileHidePlayerCount then nil else v72 or v73)
	local v117 = if not isSeeAllTileEnabled(t1.hideSeeAll, v108.maxTilesToShow, if not v70 then v108.numColumns else itemsPerRow, #v85, v94) then nil else v108.maxTilesToShow or #v85 + 1
	local v118 = if v69 ~= "Narrow" or t1.playerCountStyle then t1.playerCountStyle else GameTileConstants.PlayerCountStyleValues.Footer
	local v119 = useRenderGameCollectionItem(v118, t1.isSponsoredFooterAllowed, v69, t1.friendFooterEnabled, t1.pageContext == AppPage.Home, v102, v68, v88, v89, DiscoveryAnalytics.Constants.Context.ExperienceTile, nil, nil, v94, if not v84.isOmni or not v84.sort then nil else v84.sort.topicId, v117, nil, t1.playButtonStyle, v113, v111, v112, if not v104 then nil else v105.onHoldableFocused, if not v104 then nil else v105.onHoldableUnfocused, if not v104 then nil else v105.shouldDisableHoldable, v115, v114, nil, nil, if not FFlagLuaAppGameTileWideVideoThumbnail then nil else v103, nil, t1.selectionOrderBase, nil, nil, nil, if not FFlagLuaAppTileVideoDeviceMemoryBlocking then nil else t1.pageContext, nil, nil, nil, nil, nil, nil, nil, nil, if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t1.onTileImageLoaded, if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else v71, if not FFlagLuaAppNarrowTileHideRating then nil else v72, if not FFlagLuaAppNarrowTileHidePlayerCount then nil else v73, if not FFlagLuaAppHomeTouchAutoplay then nil else t1.videoPlaybackContext)
	local v120 = useCountdownSubtitleTextBinding(t1.endTimestamp, t1.countdownString, v84.sort and v84.sort.subtitle or "")
	local v121 = if not t1.endTimestamp or not t1.countdownString then v84.sort and v84.sort.subtitle or nil else v120
	local v122 = React.useCallback(function() -- line: 467
		-- upvalues: HoverTileCoordinator (copy)
		HoverTileCoordinator.default:reset()
	end, {})

	if not v84.gameSortDataFound then
		return nil
	end

	local v123 = if not FFlagSearchOmniAutocompletePage then React.createElement(GameSortImpressionsDetector, {
		parentRef = v80,
		pageContext = t1.pageContext,
		impressionsTag = v102,
		scrollViewPositionChangedSignal = v100,
		sendGameImpressions = v99,
		dataUpdatedTimestamp = v84.gameSortContents and v84.gameSortContents.updatedTimestamp or nil
	}) else not (not FFlagLuaAppUseFrameBoundsImpressions and not t1.shouldUseFrameBoundsForImpressions) and React.createElement(FrameBoundsImpressionsTracker, {
		parentRef = v80,
		pageContext = t1.pageContext,
		impressionsTag = v102,
		scrollViewPositionChangedSignal = v100,
		sendImpressions = v99,
		dataUpdatedTimestamp = v84.gameSortContents and v84.gameSortContents.updatedTimestamp or nil
	}) or React.createElement(ScreenSizeImpressionsTracker, {
		parentRef = v80,
		pageContext = t1.pageContext,
		impressionsTag = v102,
		scrollViewPositionChangedSignal = v100,
		sendImpressions = v99,
		dataUpdatedTimestamp = v84.gameSortContents and v84.gameSortContents.updatedTimestamp or nil
	})
	local v124 = (not FFlagLuaAppHomeGameCarouselRemount or t1.pageContext ~= AppPage.Home) and "GameCarousel" or `GameCarousel_{ t1.gameSortId }`

	return React.createElement(React.Fragment, nil, {
		[v124] = React.createElement(CollectionCarousel, {
			collectionItemSize = if not v70 then nil else v76,
			title = v84.sort and v84.sort.displayName or "",
			subtitle = v121,
			backgroundMuralUrl = backgroundMuralUrl,
			onViewableItemsChanged = v101,
			onChangeCanvasPosition = v101,
			containerRef = v78,
			scrollingFrameRef = v80,
			tooltipInfoText = v98,
			hideHeaderButton = t1.hideSeeAll,
			items = v85,
			onActivateHeader = v94,
			onActivateSubtitle = if not t1.subtitleLinkPath and (not FFlagLuaAppGameCarouselAmpUpsellAction or not v93) then nil else v96,
			onActivateInfoIcon = v97,
			renderItem = v119,
			getItemHeight = v116,
			numColumns = if not v70 then v108.numColumns else nil,
			fractionalItemAmount = if not v70 then v108.fractionalItemAmount else nil,
			columnGap = if not v70 then v108.columnGap else nil,
			sideMargin = if not v70 then v108.sideMargin else nil,
			maxItemsToShow = v108.maxTilesToShow,
			headerButtonText = v95,
			thresholdFromEnd = v108.loadMoreThreshold,
			onReachedThresholdFromEnd = v87,
			onScrollButtonEnter = v122,
			enableHoverOverflow = if not v70 then nil else v68,
			testId = if not FFlagLuaAppAddTestIdsForGameCollections or not t1.gameSortId then nil else `--{ t1.gameSortId }-game-collection-carousel`
		}),
		GameSortImpressionsDetector = React.createElement(WaitForPropWrapper, {
			waitForProp = t1.startRow,
			maxUpdatesToDelay = t1.numUpdatesToDelayImpressions,
			wrappedComponent = v123
		}),
		ScrollDetector = React.createElement(ScrollDetector, {
			scrollingFrameRef = v80,
			sendScrollEvent = v91,
			onScrollStart = if not FFlagLuaAppHomeTouchAutoplay then nil else v81,
			onScrollSettled = if not FFlagLuaAppHomeTouchAutoplay then nil else v82
		}),
		HoldToPlayLauncher = if not v104 or not v105.shouldRenderHoldToPlayLauncher then nil else React.createElement(HoldToPlayLauncher, {
			selectedIndex = v105.selectedIndex,
			selectedEntry = v105.selectedEntry,
			selectedNavigationUniverseId = v105.selectedNavigationUniverseId,
			holdState = v105.holdState,
			holdProgress = v105.holdProgress,
			cancelHold = v105.cancelHold,
			launchContext = DiscoveryAnalytics.Constants.Context.HoldToPlayLauncher,
			referralSource = t1.pageContext,
			reportExperienceLaunched = v89
		})
	})
end)
