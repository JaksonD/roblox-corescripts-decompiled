local GameCollections = script:FindFirstAncestor("GameCollections")
local useControllerBarFocusNavigationBindings = require(GameCollections.GameCollectionNavigationBindings).useControllerBarFocusNavigationBindings
local useGetGameTileHeight = require(GameCollections.useGetGameTileHeight)
local useIsHoldToPlayEnabledForGames = require(GameCollections.useIsHoldToPlayEnabledForGames)
local useRenderGameCollectionItem = require(GameCollections.useRenderGameCollectionItem)
local useGameCollectionLayoutParams = require(GameCollections.useGameCollectionLayoutParams)
local useGameSortAnalytics = require(GameCollections.useGameSortAnalytics)
local GameSortImpressionsDetector = require(GameCollections.Impressions.GameSortImpressionsDetector)
local useGameSortData = require(GameCollections.useGameSortData)
local useGameSortImpressionsParams = require(GameCollections.Impressions.useGameSortImpressionsParams)
local useGameSortTooltipParams = require(GameCollections.useGameSortTooltipParams)
local WaitForPropWrapper = require(GameCollections.Impressions.WaitForPropWrapper)
local useSizeAdjustedEntries = require(GameCollections.useSizeAdjustedEntries)
local GameCollectionsParent = GameCollections.Parent
local React = require(GameCollectionsParent.React)
local SignalsReact = require(GameCollectionsParent.SignalsReact)
local t = require(GameCollectionsParent.t)
local validateProps = require(GameCollectionsParent.DiscoveryUtils).validateProps
local GameTile = require(GameCollectionsParent.GameTile)
local getGameTileCollectionItemSize = GameTile.getGameTileCollectionItemSize
local getGameTileHiddenStore = GameTile.getGameTileHiddenStore
local GameTileConstants = GameTile.GameTileConstants

require(GameCollectionsParent.VideoUtils)
require(GameCollectionsParent.AppCommonLib)

local Responsive = require(GameCollectionsParent.Responsive)
local usePreferredInput = Responsive.usePreferredInput
local useBreakpointXOrSmaller = Responsive.useBreakpointXOrSmaller
local useAppPolicy = require(GameCollectionsParent.UniversalAppPolicy).useAppPolicy
local CollectionGrid = require(GameCollectionsParent.CollectionViews).CollectionGrid
local useCollectionLayout = require(GameCollectionsParent.CollectionViews).useCollectionLayout
local AppPage = require(GameCollectionsParent.RobloxAppEnums).AppPage
local DiscoveryAnalytics = require(GameCollectionsParent.DiscoveryAnalytics)
local useTextSizeOffset = require(GameCollectionsParent.UIBlox).Core.Style.useTextSizeOffset
local HoldToPlay = require(GameCollectionsParent.HoldToPlay)
local HoldToPlayLauncher = HoldToPlay.HoldToPlayLauncher
local useHoldToPlayStateAndCallbacks = HoldToPlay.useHoldToPlayStateAndCallbacks

require(GameCollectionsParent.DiscoveryTypes)

local Cryo = require(GameCollectionsParent.Cryo)

require(GameCollectionsParent.CollectionViews)

local FFlagLuaAppEnableWhyThisAdModal = require(GameCollectionsParent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableHomepageTwoByOneTile = require(GameCollectionsParent.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile
local FFlagLuaAppEnableSponsoredReportAd = require(GameCollectionsParent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppAddTestIdsForGameCollections = require(GameCollectionsParent.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections
local FFlagLuaAppSupportAdRatingFooter = require(GameCollectionsParent.SharedFlags).FFlagLuaAppSupportAdRatingFooter
local FFlagLuaAppSupportAdRatingFooterExperiment = require(GameCollectionsParent.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment
local FFlagLuaAppCompositionSupport = require(GameCollectionsParent.SharedFlags).FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = require(GameCollectionsParent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(GameCollectionsParent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppNarrowTileSmallerFooterFont = require(GameCollectionsParent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(GameCollectionsParent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(GameCollectionsParent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppFixSearchImpressions = require(GameCollectionsParent.SharedFlags).FFlagLuaAppFixSearchImpressions
local FFlagLuaAppFixCompositionSizeOverrideGap = require(GameCollectionsParent.SharedFlags).FFlagLuaAppFixCompositionSizeOverrideGap
local FFlagLuaAppHomeTouchAutoplay = require(GameCollectionsParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local v51 = t.strictInterface({
	entries = t.optional(t.table),
	title = t.optional(t.string),
	headerComponent = t.optional(t.table),
	verticalScrollingFrameRef = t.table,
	maxNumRows = t.optional(t.number),
	useGridTiles = t.optional(t.boolean),
	gameSortId = t.string,
	sortIndex = t.number,
	pageContext = t.string,
	scrollViewPositionChangedSignal = t.optional(t.table),
	friendFooterEnabled = t.optional(t.boolean),
	playerCountStyle = t.optional(t.string),
	isSponsoredFooterAllowed = t.optional(t.boolean),
	componentType = t.optional(t.string),
	gameTileLayoutType = t.optional(t.string),
	infoText = t.optional(t.string),
	linkPath = t.optional(t.string),
	gridSupportAllowed = t.optional(t.boolean),
	isHoverSupportEnabled = t.optional(t.boolean),
	onItemsPerRowChanged = t.optional(t.callback),
	startRow = t.optional(t.number),
	playButtonStyle = t.optional(t.string),
	sideMargin = if FFlagLuaAppCompositionAlways then nil else t.optional(t.number),
	shouldHideTileMetadata = t.optional(t.boolean),
	shouldHideTileTitle = t.optional(t.boolean),
	containedTile = t.optional(t.boolean),
	numUpdatesToDelayImpressions = t.optional(t.number),
	selectionOrderBase = t.optional(t.number),
	enableExplicitFeedback = t.optional(t.boolean),
	sponsoredUserCohort = if not FFlagLuaAppEnableWhyThisAdModal then nil else t.optional(t.string),
	enableSponsoredFeedback = t.optional(t.boolean),
	enableReportAd = if not FFlagLuaAppEnableSponsoredReportAd then nil else t.optional(t.boolean),
	searchParams = t.optional(t.table),
	layoutOverrides = t.optional(t.table),
	isSponsoredRatingFooterAllowed = if not FFlagLuaAppSupportAdRatingFooter then nil else t.optional(t.boolean),
	launchExperienceEventContextOverride = t.optional(t.string),
	sponsoredFooterAdLabelText = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t.optional(t.string),
	sponsoredFooterAdLabelFirst = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t.optional(t.boolean),
	sponsoredFooterIncludeRatingContent = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t.optional(t.boolean),
	appCompositionEnabled = if not FFlagLuaAppCompositionSupport then nil else t.optional(t.boolean),
	onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t.optional(t.callback),
	videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else t.optional(t.table)
})

return React.memo(function(t1: {[any]: any}) --[[ GameCollectionGrid ]] -- line: 175
	-- upvalues: validateProps (copy), v51 (copy), useAppPolicy (copy), usePreferredInput (copy), Responsive (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), useBreakpointXOrSmaller (copy), getGameTileCollectionItemSize (copy), React (copy), useGameSortData (copy), Cryo (copy), useGameCollectionLayoutParams (copy), FFlagLuaAppFixCompositionSizeOverrideGap (copy), useCollectionLayout (copy), useSizeAdjustedEntries (copy), useGameSortAnalytics (copy), FFlagLuaAppHomeTouchAutoplay (copy), GameTile (copy), useGameSortTooltipParams (copy), useGameSortImpressionsParams (copy), FFlagLuaAppFixSearchImpressions (copy), useIsHoldToPlayEnabledForGames (copy), useHoldToPlayStateAndCallbacks (copy), useControllerBarFocusNavigationBindings (copy), useTextSizeOffset (copy), GameTileConstants (copy), useGetGameTileHeight (copy), getGameTileHiddenStore (copy), SignalsReact (copy), useRenderGameCollectionItem (copy), AppPage (copy), DiscoveryAnalytics (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), FFlagLuaAppSupportAdRatingFooter (copy), FFlagLuaAppSupportAdRatingFooterExperiment (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), GameSortImpressionsDetector (copy), CollectionGrid (copy), FFlagLuaAppAddTestIdsForGameCollections (copy), WaitForPropWrapper (copy), HoldToPlayLauncher (copy)
	validateProps(v51, t1)

	local v53 = useAppPolicy(function(p1) -- line: 179
		return p1.useGridPageLayout()
	end)
	local v54 = usePreferredInput()
	local v55 = v54 ~= Responsive.Input.Directional and 2 or 4
	local v56 = v54 ~= Responsive.Input.Directional and 1 or 4
	local v57 = t1.isHoverSupportEnabled and (v53 and v54 == Responsive.Input.Pointer)
	local v58 = t1.gameTileLayoutType or "Narrow"
	local v59 = FFlagLuaAppCompositionAlways or FFlagLuaAppCompositionSupport and t1.appCompositionEnabled
	local v60 = nil
	local v61 = nil
	local v62 = nil

	if FFlagLuaAppNarrowTileSmallerFooterFont or (FFlagLuaAppNarrowTileHideRating or FFlagLuaAppNarrowTileHidePlayerCount) then
		local v63 = useBreakpointXOrSmaller(Responsive.Keys.Small)
		local v64 = v59 and (v58 == "Narrow" and v63)

		v60 = if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else v64
		v61 = if not FFlagLuaAppNarrowTileHideRating then nil else v64
		v62 = if not FFlagLuaAppNarrowTileHidePlayerCount then nil else v64
	end

	local v65 = if not v59 then nil else getGameTileCollectionItemSize(v58)
	local v66, v67 = React.useState(nil)
	local v68 = React.useRef(v66)

	v68.current = v66

	local v69 = useGameSortData(t1.gameSortId, t1.pageContext, t1.searchParams and t1.searchParams.searchUuid)
	local v70 = React.useMemo(function() -- line: 226
		-- upvalues: v53 (copy), t1 (copy), Cryo (copy)
		local v103 = if not v53 then t1.sideMargin else nil

		if not t1.layoutOverrides and not v103 then
			return nil
		end

		return Cryo.Dictionary.join(t1.layoutOverrides or {}, {
			sideMargin = if not t1.layoutOverrides or not t1.layoutOverrides.sideMargin then v103 else t1.layoutOverrides.sideMargin
		})
	end, {
		t1.layoutOverrides,
		v53,
		t1.sideMargin
	})
	local v71 = useGameCollectionLayoutParams(v58, v66, false, v70)
	local itemsPerRow = nil
	local v74

	if FFlagLuaAppFixCompositionSizeOverrideGap and FFlagLuaAppCompositionSupport then
		local v73 = useCollectionLayout(v65)

		itemsPerRow = v73.itemsPerRow
		v74 = useSizeAdjustedEntries(t1.entries, if not v59 then v71.columnGap else v73.gutter, if not v59 then v71.verticalPadding else v73.verticalGap)
	else
		v74 = useSizeAdjustedEntries(t1.entries, v71.columnGap, v71.verticalPadding)

		if FFlagLuaAppCompositionSupport then
			itemsPerRow = useCollectionLayout(v65).itemsPerRow
		end
	end

	local v75 = if not v59 then v71.numColumns or 0 else itemsPerRow or 0
	local v76, v77 = useGameSortAnalytics(v69.sort, v69.isOmni, t1.sortIndex, t1.pageContext, nil, v74, v75, t1.startRow)
	local v78 = nil

	if FFlagLuaAppHomeTouchAutoplay then
		v78 = GameTile.useVideoAnalytics(v69.sort, v69.isOmni, t1.pageContext, t1.sortIndex, v74)
	end

	local v79, v80 = useGameSortTooltipParams(v69.sort, v69.isOmni, t1.infoText)
	local v81, v82, v83 = useGameSortImpressionsParams(v69.sort, v69.isOmni, t1.sortIndex, t1.pageContext, t1.useGridTiles, t1.componentType, v69.gamesApiSortPageId, t1.gameSortId, t1.scrollViewPositionChangedSignal, v75, t1.startRow, v74, t1.searchParams)
	local v84 = if not FFlagLuaAppFixSearchImpressions or not t1.searchParams then nil else t1.searchParams.searchUuid
	local v85 = if not FFlagLuaAppFixSearchImpressions then `GameGrid_{ t1.gameSortId }_{ t1.sortIndex }` else React.useMemo(function() -- line: 311
		-- upvalues: t1 (copy), v84 (copy)
		local v104 = `GameGrid_{ t1.pageContext }`

		if v84 then
			v104 ..= ("_%*"):format(v84)
		end

		return v104 .. `_{ t1.gameSortId }_{ t1.sortIndex }`
	end, {
		t1.pageContext,
		v84,
		t1.gameSortId,
		t1.sortIndex
	})
	local v86 = useIsHoldToPlayEnabledForGames()
	local v87 = useHoldToPlayStateAndCallbacks()
	local v88 = useControllerBarFocusNavigationBindings(nil, if not v86 then nil else v87.holdToPlayEventHandler)

	React.useEffect(function() -- line: 338
		-- upvalues: v88 (copy), v66 (copy)
		if v88 then
			v88(v66)
		end
	end, {
		v88,
		v66
	})

	local v89 = t1.shouldHideTileTitle or false
	local v90 = t1.shouldHideTileMetadata or false
	local v91 = t1.containedTile or false
	local v92 = useTextSizeOffset()
	local v93 = GameTileConstants.TileTextLines[v58] and GameTileConstants.TileTextLines[v58].titleTextLines
	local v94 = useGetGameTileHeight(v57, v58, v91, v90, v89, v92, nil, v93, if not FFlagLuaAppNarrowTileHideRating and not FFlagLuaAppNarrowTileHidePlayerCount then nil else v61 or v62)
	local v95 = getGameTileHiddenStore(t1.gameSortId)
	local v96 = SignalsReact.useSignalState(v95.getHiddenGames)
	local setGameHidden = v95.setGameHidden
	local v98 = if v58 ~= "Narrow" or t1.playerCountStyle then t1.playerCountStyle else GameTileConstants.PlayerCountStyleValues.Footer
	local v99 = useRenderGameCollectionItem(v98, t1.isSponsoredFooterAllowed, v58, t1.friendFooterEnabled, t1.pageContext == AppPage.Home, v85, v57, v76, v77, if not t1.launchExperienceEventContextOverride then DiscoveryAnalytics.Constants.Context.ExperienceTile else t1.launchExperienceEventContextOverride, nil, nil, nil, if not v69.isOmni then nil else t1.gameSortId, nil, nil, t1.playButtonStyle, v91, v89, v90, if not v86 then nil else v87.onHoldableFocused, if not v86 then nil else v87.onHoldableUnfocused, if not v86 then nil else v87.shouldDisableHoldable, v92, v93, nil, nil, if not FFlagLuaAppHomeTouchAutoplay then nil else v78, nil, t1.selectionOrderBase, t1.enableExplicitFeedback, v96, setGameHidden, t1.pageContext, if not FFlagLuaAppEnableWhyThisAdModal then nil else t1.sponsoredUserCohort, t1.enableSponsoredFeedback, if not FFlagLuaAppEnableSponsoredReportAd then nil else t1.enableReportAd, if not FFlagLuaAppEnableHomepageTwoByOneTile then nil else #v74, if not FFlagLuaAppSupportAdRatingFooter then nil else t1.isSponsoredRatingFooterAllowed, if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t1.sponsoredFooterAdLabelText, if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t1.sponsoredFooterAdLabelFirst, if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else t1.sponsoredFooterIncludeRatingContent, if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t1.onTileImageLoaded, if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else v60, if not FFlagLuaAppNarrowTileHideRating then nil else v61, if not FFlagLuaAppNarrowTileHidePlayerCount then nil else v62, if not FFlagLuaAppHomeTouchAutoplay then nil else t1.videoPlaybackContext)

	if not FFlagLuaAppCompositionAlways then
		local v100 = React.useRef(0)

		React.useEffect(function() -- line: 437
			-- upvalues: v59 (copy), v71 (copy), v100 (copy), t1 (copy)
			if not v59 and v71.numColumns ~= v100.current then
				v100.current = v71.numColumns

				if t1.onItemsPerRowChanged then
					t1.onItemsPerRowChanged(v71.numColumns)
				end
			end
		end, {
			v71.numColumns,
			t1.onItemsPerRowChanged,
			v100,
			if not FFlagLuaAppCompositionSupport then nil else v59
		})
	end

	if not v69.gameSortDataFound then
		return nil
	end

	local v101 = React.createElement(GameSortImpressionsDetector, {
		parentRef = v68,
		pageContext = t1.pageContext,
		impressionsTag = v85,
		scrollViewPositionChangedSignal = v82,
		sendGameImpressions = v81,
		dataUpdatedTimestamp = v69.gameSortContents and v69.gameSortContents.updatedTimestamp or nil
	})

	return React.createElement(React.Fragment, nil, {
		GameGrid = React.createElement(CollectionGrid, {
			collectionItemSize = if not v59 then nil else v65,
			title = t1.title,
			subtitle = v69.sort and v69.sort.subtitle or nil,
			onViewableItemsChanged = v83,
			containerRef = v67,
			tooltipInfoText = v80,
			hideHeaderButton = true,
			items = v74,
			onActivateInfoIcon = v79,
			verticalScrollingFrameRef = t1.verticalScrollingFrameRef,
			renderItem = v99,
			getItemHeight = v94,
			numColumns = if not v59 then v71.numColumns else nil,
			columnGap = if not v59 then v71.columnGap else nil,
			sideMargin = if not v59 then v71.sideMargin else nil,
			verticalPadding = if not v59 then v71.verticalPadding else nil,
			maxNumRows = t1.maxNumRows,
			bufferRowsBelowScreen = v55,
			bufferRowsAboveScreen = v56,
			headerComponent = t1.headerComponent,
			testId = if not FFlagLuaAppAddTestIdsForGameCollections or not t1.gameSortId then nil else `--{ t1.gameSortId }-game-collection-grid`
		}),
		GameSortImpressionsDetector = React.createElement(WaitForPropWrapper, {
			waitForProp = t1.startRow,
			maxUpdatesToDelay = t1.numUpdatesToDelayImpressions,
			wrappedComponent = v101
		}),
		HoldToPlayLauncher = if not v86 or not v87.shouldRenderHoldToPlayLauncher then nil else React.createElement(HoldToPlayLauncher, {
			selectedIndex = v87.selectedIndex,
			selectedEntry = v87.selectedEntry,
			selectedNavigationUniverseId = v87.selectedNavigationUniverseId,
			holdState = v87.holdState,
			holdProgress = v87.holdProgress,
			cancelHold = v87.cancelHold,
			launchContext = DiscoveryAnalytics.Constants.Context.HoldToPlayLauncher,
			referralSource = t1.pageContext,
			reportExperienceLaunched = v77
		})
	})
end)
