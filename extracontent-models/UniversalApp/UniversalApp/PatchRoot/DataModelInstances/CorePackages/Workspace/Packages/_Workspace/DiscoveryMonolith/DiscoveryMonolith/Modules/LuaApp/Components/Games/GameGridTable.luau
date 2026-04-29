local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local DiscoveryMonolithParent = DiscoveryMonolith.Parent
local React = require(DiscoveryMonolithParent.React)
local useSelector = require(DiscoveryMonolithParent.RoactUtils).Hooks.RoactRodux.useSelector
local LuauPolyfill = require(DiscoveryMonolithParent.LuauPolyfill)
local UIBlox = require(DiscoveryMonolithParent.UIBlox)
local ResponsiveGrid = UIBlox.App.Container.Grid.ResponsiveGrid
local ResponsiveLayoutProvider = UIBlox.Core.Layout.Responsive.ResponsiveLayoutProvider
local GameTile = require(DiscoveryMonolithParent.GameTile)
local GameTileConstants = GameTile.GameTileConstants
local GameTileLayoutType = GameTile.GameTileTypes.GameTileLayoutType
local GameTileViewConfig = GameTile.GameTileViewConfig
local AppGameTile = GameTile.AppGameTile
local getTileBadgeByPositionConfigFromEntry = GameTile.getTileBadgeByPositionConfigFromEntry
local LayoutConfig = require(DiscoveryMonolithParent.RobloxAppEnums).LayoutConfig
local useResponsiveLayout = UIBlox.Core.Layout.Responsive.useResponsiveLayout
local useTextSizeOffset = UIBlox.Core.Style.useTextSizeOffset
local useDispatch = require(DiscoveryMonolithParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(DiscoveryMonolithParent.Navigation).useNavigation
local OpenGameDetails = require(DiscoveryMonolithParent.GameDetail).OpenGameDetails
local useDesignTokens = require(DiscoveryMonolithParent.Style).useDesignTokens
local useTokens = require(DiscoveryMonolithParent.Foundation).Hooks.useTokens
local useGameCollectionLayoutParams = require(DiscoveryMonolithParent.GameCollections).useGameCollectionLayoutParams
local useCollectionLayout = require(DiscoveryMonolithParent.CollectionViews).useCollectionLayout
local Responsive = require(DiscoveryMonolithParent.Responsive)
local useBreakpointXOrSmaller = Responsive.useBreakpointXOrSmaller
local DiscoveryEventErrorLogger = require(DiscoveryMonolithParent.DiscoveryUtils).DiscoveryEventErrorLogger
local Modules = DiscoveryMonolith.Modules
local AppFeaturedGameTileTwoByTwo = require(Modules.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo)
local SharedFlags = require(DiscoveryMonolithParent.SharedFlags)
local FFlagLuaAppCompositionSupport = SharedFlags.FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = SharedFlags.FFlagLuaAppCompositionAlways
local FFlagLuaAppGameTileLockedBadge = SharedFlags.FFlagLuaAppGameTileLockedBadge
local v34 = game:DefineFastFlag("LuaAppFixGameGridTableNilRelativeHeight", false)

local function getCellSpan(t1: {[any]: any}) -- line: 73
	if t1.featured then
		return 2
	end

	return 1
end

return function(t2: {[any]: any}) --[[ GameGridTable ]] -- line: 77
	-- upvalues: LayoutConfig (copy), useTokens (copy), React (copy), LuauPolyfill (copy), useDispatch (copy), useNavigation (copy), OpenGameDetails (copy), useTextSizeOffset (copy), useResponsiveLayout (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), useCollectionLayout (copy), GameTile (copy), GameTileLayoutType (copy), useGameCollectionLayoutParams (copy), useBreakpointXOrSmaller (copy), Responsive (copy), useDesignTokens (copy), GameTileConstants (copy), GameTileViewConfig (copy), v34 (copy), DiscoveryEventErrorLogger (copy), AppFeaturedGameTileTwoByTwo (copy), AppGameTile (copy), FFlagLuaAppGameTileLockedBadge (copy), getTileBadgeByPositionConfigFromEntry (copy), useSelector (copy), ResponsiveGrid (copy), getCellSpan (copy), ResponsiveLayoutProvider (copy)
	local v38 = if not t2.useGridTiles then LayoutConfig.Kind.Experiences.WithFooter else LayoutConfig.Kind.Experiences.GridTile
	local v39 = useTokens()
	local v40 = t2.entries or {}
	local v41 = t2.gameEmphasis or false
	local v42 = React.useMemo(function() -- line: 89
		-- upvalues: LuauPolyfill (copy), v40 (copy), v41 (copy)
		return LuauPolyfill.Array.map(v40, function(p1, p2) -- line: 90
			-- upvalues: LuauPolyfill (copy), v41 (copy)
			return LuauPolyfill.Object.assign({
				index = p2,
				featured = p2 == 1 and v41
			}, p1)
		end)
	end, {
		v40,
		v41
	})
	local v43 = useDispatch()
	local v44 = useNavigation()
	local v45 = React.useCallback(function(p3, p4) -- line: 101
		-- upvalues: v43 (copy), OpenGameDetails (copy), v44 (copy)
		v43(OpenGameDetails(p3, v44, p4))
	end, { v44 })
	local v46 = t2.windowSize or Vector2.one
	local v47 = useTextSizeOffset()
	local source = t2.source
	local referralSource = t2.referralSource
	local hideGameStats = t2.hideGameStats
	local v51 = t2.useHoverTile == nil or t2.useHoverTile
	local reportGameDetailOpened = t2.reportGameDetailOpened
	local reportExperienceLaunched = t2.reportExperienceLaunched
	local v54 = t2.showFriendActivity or false
	local u55 = useResponsiveLayout("relativeHeight", v38)
	local v56 = FFlagLuaAppCompositionAlways or FFlagLuaAppCompositionSupport and t2.appCompositionEnabled
	local v57 = if not FFlagLuaAppCompositionSupport then nil else useCollectionLayout(GameTile.getGameTileCollectionItemSize(t2.gameTileLayoutType or GameTileLayoutType.Narrow))
	local v58 = t2.enableCollectionLayout or v56
	local v59, v60 = React.useState(nil)
	local v61 = useGameCollectionLayoutParams(t2.gameTileLayoutType or GameTileLayoutType.Narrow, v59, false)
	local v62 = React.useRef(1)
	local v63 = useResponsiveLayout("columns", v38)
	local v64 = if not v56 then if not v58 then v63 else v61.numColumns else v57.itemsPerRow
	local v65 = useBreakpointXOrSmaller(Responsive.Keys.XSmall)

	React.useEffect(function() -- line: 139
		-- upvalues: v62 (copy), v64 (copy), t2 (copy)
		if v62.current ~= v64 then
			v62.current = v64

			if t2.onItemsPerRowChanged then
				t2.onItemsPerRowChanged(v64)
			end
		end
	end, {
		v64,
		v62,
		t2.onItemsPerRowChanged
	})

	local v66 = useDesignTokens()
	local v67 = GameTileConstants.TileTextLines[t2.gameTileLayoutType or GameTileLayoutType.Narrow]
	local v68 = GameTileViewConfig.getFooterHeight(v66, true, false, false, v47, nil, v67.titleTextLines, v39, true)

	if v34 and (u55 == nil or u55.Scale == nil) then
		DiscoveryEventErrorLogger.reportError("GameGridTable_NilRelativeHeight", "relativeHeight is nil", {
			rowKind = tostring(v38),
			relativeHeightType = typeof(u55),
			relativeHeightValue = tostring(u55),
			responsiveLayoutColumns = tostring(v63),
			useGridTiles = tostring(t2.useGridTiles or false),
			enableCollectionLayout = tostring(t2.enableCollectionLayout or false),
			gameTileLayoutType = tostring(t2.gameTileLayoutType or "nil")
		})
	else
		u55 = UDim.new(u55.Scale, v68)
	end

	local v69 = React.useCallback(function(t3: {[any]: any}, p5) -- line: 177
		-- upvalues: React (copy), AppFeaturedGameTileTwoByTwo (copy), source (copy), reportGameDetailOpened (copy), reportExperienceLaunched (copy), t2 (copy), AppGameTile (copy), hideGameStats (copy), referralSource (copy), v54 (copy), v51 (copy), v45 (copy), v47 (copy), v65 (copy), FFlagLuaAppGameTileLockedBadge (copy), getTileBadgeByPositionConfigFromEntry (copy)
		if t3.featured then
			return React.createElement(AppFeaturedGameTileTwoByTwo, {
				entry = t3,
				index = t3.realGameEntryIndex or t3.index,
				source = source,
				reportGameDetailOpened = reportGameDetailOpened,
				reportExperienceLaunched = reportExperienceLaunched,
				hasBackground = true,
				hasActionRow = true,
				isDynamic = true,
				impressionsTag = t2.impressionsTag,
				launchExperienceEventContext = t2.launchExperienceEventContext
			})
		end

		return React.createElement(AppGameTile, {
			entry = t3,
			index = t3.realGameEntryIndex or t3.index,
			source = source,
			reportGameDetailOpened = reportGameDetailOpened,
			reportExperienceLaunched = reportExperienceLaunched,
			hideGameStats = hideGameStats,
			referralSource = referralSource,
			rowNum = math.ceil(t3.index / (p5.columns or 1)),
			showFriendActivity = v54,
			playerCountStyle = t2.playerCountStyle,
			isSponsoredFooterAllowed = t2.isSponsoredFooterAllowed,
			useHoverTile = v51,
			useGridTile = t2.useGridTiles,
			friendFooterEnabled = not not t2.useGridTiles or nil,
			impressionsTag = t2.impressionsTag,
			launchExperienceEventContext = t2.launchExperienceEventContext,
			topicId = t2.topicId,
			gameTileLayoutType = t2.gameTileLayoutType,
			navigateToGameDetails = v45,
			playButtonStyle = t2.playButtonStyle,
			isContained = true,
			textSizeOffset = v47,
			isNarrowScreenXSmall = v65,
			badgeOverride = if not FFlagLuaAppGameTileLockedBadge then nil else getTileBadgeByPositionConfigFromEntry(t3)
		})
	end, {
		source,
		referralSource,
		hideGameStats,
		v54,
		reportGameDetailOpened,
		reportExperienceLaunched,
		t2.impressionsTag,
		t2.launchExperienceEventContext,
		t2.playerCountStyle,
		t2.useGridTiles,
		t2.isSponsoredFooterAllowed,
		t2.playButtonStyle,
		v65
	})
	local v70 = if not t2.screenSize then v46.Y else t2.screenSize.Y
	local v71 = useSelector(function(p6) -- line: 241
		if p6.ScreenSize then
			return p6.ScreenSize.X
		end

		return nil
	end)
	local v72 = useResponsiveLayout("verticalGutter", v38)
	local v73 = if not v56 then v72 else v57.verticalGap
	local v74 = if not v56 then v61.columnGap else v57.gutter
	local v75 = if not v56 then v61.sideMargin else 0
	local v76 = React.useMemo(function() -- line: 254
		-- upvalues: v58 (copy), v66 (copy), FFlagLuaAppCompositionSupport (copy), v64 (copy), v74 (copy), v75 (copy), v73 (copy), u55 (ref)
		if not v58 then
			return nil
		end

		local Layout = v66.LuaApps.Layout

		if FFlagLuaAppCompositionSupport and not Layout then
			return nil
		end

		local grid = Layout.grid
		local tiles = Layout.tiles

		return {
			columns = v64,
			gutter = v74,
			margin = v75,
			verticalGutter = v73,
			relativeHeight = u55,
			hoverTileTopOffset = tiles.hover.topOffset,
			hoverTileBottomOffset = tiles.hover.bottomOffset,
			hoverTileHorizontalOffset = tiles.hover.horizontalOffset,
			scrollableMaxTilesPerRow = grid.default.scrollableMaxTilesPerRow
		}
	end, {
		v58,
		v66.LuaApps.Layout,
		v64,
		v74,
		v75,
		v73,
		u55
	})
	local v77 = React.createElement(ResponsiveGrid, {
		ref = v60,
		kind = v38,
		data = v42,
		renderItem = v69,
		layoutOrder = t2.LayoutOrder,
		getCellColspan = getCellSpan,
		getCellRowspan = getCellSpan,
		relativeHeight = u55,
		absoluteWindowTop = -v70,
		absoluteWindowHeight = v70 * 3,
		enableDeferredRefPropEvents = true
	})

	if v58 then
		v77 = React.createElement(ResponsiveLayoutProvider, {
			width = v71,
			config = v76
		}, {
			ResponsiveGrid = v77
		})
	end

	return v77
end
