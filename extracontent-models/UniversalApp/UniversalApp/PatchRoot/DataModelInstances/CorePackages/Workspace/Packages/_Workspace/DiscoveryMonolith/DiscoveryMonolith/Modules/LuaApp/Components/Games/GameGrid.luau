local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local DiscoveryMonolithParent = DiscoveryMonolith.Parent
local UIBlox = require(DiscoveryMonolithParent.UIBlox)
local GridMetrics = UIBlox.App.Grid.GridMetrics
local useStyle = UIBlox.Core.Style.useStyle
local useTextSizeOffset = UIBlox.Core.Style.useTextSizeOffset
local getExperienceTileRelativeHeight = UIBlox.App.Tile.getExperienceTileRelativeHeight
local AspectRatioModeEnum = UIBlox.App.Tile.AspectRatioModeEnum
local Roact = require(DiscoveryMonolithParent.Roact)
local Cryo = require(DiscoveryMonolithParent.Cryo)
local GameTile = require(DiscoveryMonolithParent.GameTile)
local GameTileTypes = GameTile.GameTileTypes
local AppGameTile = GameTile.AppGameTile
local getTileBadgeByPositionConfigFromEntry = GameTile.getTileBadgeByPositionConfigFromEntry
local GameTileViewConfig = GameTile.GameTileViewConfig
local Symbol = require(DiscoveryMonolithParent.AppCommonLib).Symbol
local RoactRodux = require(DiscoveryMonolithParent.RoactRodux)
local FormFactor = require(DiscoveryMonolithParent.FormFactor).Enums.FormFactor
local OpenGameDetails = require(DiscoveryMonolithParent.GameDetail).OpenGameDetails
local withNavigation = require(DiscoveryMonolithParent.RoactNavigation).withNavigation
local useDesignTokens = require(DiscoveryMonolithParent.Style).useDesignTokens
local useTokens = require(DiscoveryMonolithParent.Foundation).Hooks.useTokens
local useUiModeInfo = require(DiscoveryMonolithParent.RobloxAppHooks).useUiModeInfo
local UiMode = require(DiscoveryMonolithParent.RobloxAppEnums).UiMode
local DiscoveryTypes = require(DiscoveryMonolithParent.DiscoveryTypes)
local GameTileConstants = GameTile.GameTileConstants
local Responsive = require(DiscoveryMonolithParent.Responsive)
local useBreakpointXOrSmaller = Responsive.useBreakpointXOrSmaller
local useCollectionLayout = require(DiscoveryMonolithParent.CollectionViews).useCollectionLayout
local SharedFlags = require(DiscoveryMonolithParent.SharedFlags)
local FFlagLuaAppCompositionSupport = SharedFlags.FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = SharedFlags.FFlagLuaAppCompositionAlways
local FFlagLuaAppGameTileLockedBadge = SharedFlags.FFlagLuaAppGameTileLockedBadge
local Modules = DiscoveryMonolith.Modules
local AppFeaturedGameTileTwoByTwo = require(Modules.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo)
local GridView = require(Modules.LuaApp.Components.Generic.GridView)
local GetFFlagLuaAppUpdateGameSortGridRowHeight10ft = require(Modules.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft)
local v38 = game:DefineFastFlag("LuaAppFixConsoleSeeAllGridContainment", false)
local v39 = Roact.PureComponent:extend("GameGrid")
local GAME_GRID_CHILD_PADDING = DiscoveryTypes.Constants.GAME_GRID_CHILD_PADDING
local GAME_GRID_TILE_FOOTER_HEIGHT = DiscoveryTypes.Constants.GAME_GRID_TILE_FOOTER_HEIGHT
local v42 = Symbol.named("TilePlaceHolder")
local Square = AspectRatioModeEnum.Square

v39.defaultProps = {
	friendFooterEnabled = false,
	useGridTiles = false,
	getItemMetrics = GridMetrics.getSmallMetrics,
	horizontalAlignment = Enum.HorizontalAlignment.Center,
	searchResultGrid = false,
	gameEmphasis = false,
	source = nil,
	showFriendActivity = false,
	gameTileLayoutType = GameTileTypes.GameTileLayoutType.Narrow
}

function v39.init(p1) -- line: 71
	-- upvalues: GameTileConstants (copy)
	function p1.navigateToGameDetails(p2, p3) -- line: 72
		-- upvalues: p1 (copy)
		p1.props.openGameDetails(p2, p3, p1.props.navigation)
	end

	p1.state = {
		numLinesForTitle = GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].titleTextLines,
		numLinesForMetadata = if not p1.props.metadataCompact then GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].metadataTextLines else GameTileConstants.TileTextLines[p1.props.gameTileLayoutType].largeMetadataTextLines
	}
end
function v39.didUpdate(p4, p5, _) -- line: 83
	-- upvalues: GameTileConstants (copy)
	if p5.metadataCompact ~= p4.props.metadataCompact then
		p4:setState({
			numLinesForMetadata = if not p4.props.metadataCompact then GameTileConstants.TileTextLines[p4.props.gameTileLayoutType].metadataTextLines else GameTileConstants.TileTextLines[p4.props.gameTileLayoutType].largeMetadataTextLines
		})
	end
end
function v39.renderItem(p7, p8, p9, p10, p11) -- line: 93
	-- upvalues: Roact (copy), AppFeaturedGameTileTwoByTwo (copy), v42 (copy), v38 (copy), UiMode (copy), AppGameTile (copy), FFlagLuaAppGameTileLockedBadge (copy), getTileBadgeByPositionConfigFromEntry (copy)
	local reportGameDetailOpened = p7.props.reportGameDetailOpened
	local reportExperienceLaunched = p7.props.reportExperienceLaunched
	local source = p7.props.source
	local hideGameStats = p7.props.hideGameStats

	if type(p8) == "table" and p8.featured then
		return Roact.createElement(AppFeaturedGameTileTwoByTwo, {
			layoutOrder = p10,
			entry = p8,
			size = p9,
			index = p8.realGameEntryIndex or p10,
			source = source,
			reportGameDetailOpened = reportGameDetailOpened,
			reportExperienceLaunched = reportExperienceLaunched,
			impressionsTag = p7.props.impressionsTag,
			launchExperienceEventContext = p7.props.launchExperienceEventContext
		})
	end

	if type(p8) == "userdata" and p8 == v42 then
		return Roact.createElement("Frame", {
			LayoutOrder = p10,
			Size = UDim2.new(0, p9.X, 0, p9.Y),
			BackgroundTransparency = 1
		})
	end

	local v60 = v38 and (p7.props.uiModeInfo and p7.props.uiModeInfo.uiMode == UiMode.TenFoot)

	return Roact.createElement(AppGameTile, {
		layoutOrder = p10,
		entry = p8,
		Size = UDim2.new(0, p9.X, 0, p9.Y),
		index = p8.realGameEntryIndex or p10,
		source = source,
		reportGameDetailOpened = reportGameDetailOpened,
		reportExperienceLaunched = reportExperienceLaunched,
		hideGameStats = hideGameStats,
		referralSource = p7.props.referralSource,
		rowNum = p11,
		showFriendActivity = p7.props.showFriendActivity,
		impressionsTag = p7.props.impressionsTag,
		friendFooterEnabled = if not p7.props.useGridTiles then nil else p7.props.friendFooterEnabled,
		useGridTile = p7.props.useGridTiles,
		launchExperienceEventContext = p7.props.launchExperienceEventContext,
		playerCountStyle = p7.props.playerCountStyle,
		isSponsoredFooterAllowed = p7.props.isSponsoredFooterAllowed,
		topicId = p7.props.topicId,
		gameTileLayoutType = p7.props.gameTileLayoutType,
		navigateToGameDetails = p7.navigateToGameDetails,
		playButtonStyle = p7.props.playButtonStyle,
		isContained = not not v60 or nil,
		textSizeOffset = p7.props.textSizeOffset,
		contentTextLineCount = p7.state.numLinesForTitle,
		metadataTextLineCount = p7.state.numLinesForMetadata,
		isNarrowScreenXSmall = p7.props.isNarrowScreenXSmall,
		badgeOverride = if not FFlagLuaAppGameTileLockedBadge then nil else getTileBadgeByPositionConfigFromEntry(p8)
	})
end
function v39.render(p12) -- line: 156
	-- upvalues: GridMetrics (copy), FFlagLuaAppCompositionSupport (copy), UiMode (copy), FormFactor (copy), GameTileViewConfig (copy), GAME_GRID_TILE_FOOTER_HEIGHT (copy), GAME_GRID_CHILD_PADDING (copy), GetFFlagLuaAppUpdateGameSortGridRowHeight10ft (copy), getExperienceTileRelativeHeight (copy), Square (copy), v42 (copy), Cryo (copy), Roact (copy), GridView (copy)
	local entries = p12.props.entries
	local propsLayoutOrder = p12.props.LayoutOrder
	local numberOfRowsToShow = p12.props.numberOfRowsToShow
	local windowSize = p12.props.windowSize
	local screenSize = p12.props.screenSize
	local horizontalAlignment = p12.props.horizontalAlignment
	local searchResultGrid = p12.props.searchResultGrid
	local t1 = nil
	local v70 = searchResultGrid and GridMetrics.getMediumMetrics or p12.props.getItemMetrics
	local itemWidth, v76, vector2

	if p12.props.useGridTiles then
		local itemsPerRow, gutter, verticalGap

		if FFlagLuaAppCompositionSupport and p12.props.appCompositionActive then
			local collectionLayout = p12.props.collectionLayout

			itemsPerRow = collectionLayout.itemsPerRow
			gutter = collectionLayout.gutter
			verticalGap = collectionLayout.verticalGap
		elseif p12.props.uiModeInfo.uiMode == UiMode.TenFoot then
			itemsPerRow = 5
			gutter = p12.props.designTokens.Global.Space_300
			verticalGap = 51
		elseif p12.props.formFactor == FormFactor.WIDE then
			itemsPerRow = 4
			gutter = 8
			verticalGap = 28
		else
			itemsPerRow = 2
			gutter = 8
			verticalGap = 28
		end

		itemWidth = GridMetrics.getMetricsForFixedColumns(windowSize.X, gutter, itemsPerRow).itemWidth
		v76 = GameTileViewConfig.getTileHeight(p12.props.designTokens, itemWidth, p12.props.gameTileLayoutType, false, false, false, p12.props.textSizeOffset, nil, p12.state.numLinesForTitle, p12.state.numLinesForMetadata)
		vector2 = Vector2.new(gutter, verticalGap)
	else
		local v78 = GAME_GRID_TILE_FOOTER_HEIGHT

		vector2 = Vector2.new(GAME_GRID_CHILD_PADDING, GAME_GRID_CHILD_PADDING * 2)

		if FFlagLuaAppCompositionSupport and p12.props.appCompositionActive then
			local collectionLayout = p12.props.collectionLayout

			vector2 = Vector2.new(collectionLayout.gutter, collectionLayout.verticalGap)
			itemWidth = GridMetrics.getMetricsForFixedColumns(windowSize.X, collectionLayout.gutter, collectionLayout.itemsPerRow).itemWidth
			v78 = GameTileViewConfig.getFooterHeight(p12.props.designTokens, false, false, false, p12.props.textSizeOffset, 0, p12.state.numLinesForTitle, p12.props.foundationTokens, true, p12.state.numLinesForMetadata)
		elseif p12.props.uiModeInfo.uiMode == UiMode.TenFoot then
			vector2 = Vector2.new(p12.props.cellSpacingHorizontal, p12.props.cellSpacingVertical)
			itemWidth = GridMetrics.getMetricsForFixedColumns(windowSize.X, vector2.X, 8).itemWidth
		else
			itemWidth = v70(windowSize.X, GAME_GRID_CHILD_PADDING).itemWidth
			v78 = GameTileViewConfig.getFooterHeight(p12.props.designTokens, false, false, false, p12.props.textSizeOffset, 0, p12.state.numLinesForTitle, p12.props.foundationTokens, true, p12.state.numLinesForMetadata)
		end

		if GetFFlagLuaAppUpdateGameSortGridRowHeight10ft() then
			v78 = getExperienceTileRelativeHeight(p12.props.style, Square, 2).Offset
		end

		v76 = math.floor(itemWidth + v78)
	end

	local vector2_2 = Vector2.new(itemWidth, v76)

	if searchResultGrid and #entries > 0 and p12.props.gameEmphasis then
		t1 = {}
		table.insert(t1, v42)
		table.insert(t1, v42)

		local v81 = math.floor((windowSize.X + vector2.X) / (vector2_2.X + vector2.X)) - 2
		local n1 = 2

		while n1 < v81 + 2 do
			if n1 <= #entries then
				table.insert(t1, Cryo.Dictionary.join(entries[n1], {
					realGameEntryIndex = n1
				}))
			else
				table.insert(t1, v42)
			end

			n1 += 1
		end

		table.insert(t1, Cryo.Dictionary.join(entries[1], {
			featured = true,
			realGameEntryIndex = 1
		}))
		table.insert(t1, v42)

		for i = n1, #entries do
			table.insert(t1, Cryo.Dictionary.join(entries[i], {
				realGameEntryIndex = i
			}))
		end
	end

	return Roact.createElement(GridView, {
		layoutOrder = propsLayoutOrder,
		items = t1 or entries,
		renderItem = function(...) --[[ renderItem ]] -- line: 321
			-- upvalues: p12 (copy)
			return p12:renderItem(...)
		end,
		windowAbsoluteSize = windowSize,
		screenSize = screenSize,
		itemAbsoluteSize = vector2_2,
		cellPaddingOffset = vector2,
		numberOfRowsToShow = numberOfRowsToShow,
		horizontalAlignment = horizontalAlignment,
		onItemsPerRowChanged = p12.props.onItemsPerRowChanged
	})
end

local v44 = withNavigation((RoactRodux.connect(function(p13, _) -- line: 334
	return {
		formFactor = p13.FormFactor
	}
end, function(p15) -- line: 338
	-- upvalues: OpenGameDetails (copy)
	return {
		openGameDetails = function(p16, p17, p18) --[[ openGameDetails ]] -- line: 340
			-- upvalues: p15 (copy), OpenGameDetails (copy)
			p15(OpenGameDetails(p16, p18, p17))
		end
	}
end)(v39)))

local function v45(p19) -- line: 349
	-- upvalues: useDesignTokens (copy), useTokens (copy), useUiModeInfo (copy), useTextSizeOffset (copy), useBreakpointXOrSmaller (copy), Responsive (copy), GameTileTypes (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), useCollectionLayout (copy), GameTile (copy), Cryo (copy), Roact (copy), v44 (copy)
	local v88 = useDesignTokens()
	local v89 = useTokens()
	local v90 = useUiModeInfo()
	local v91 = useTextSizeOffset()
	local v92 = useBreakpointXOrSmaller(Responsive.Keys.Small)
	local v93 = if not p19.gameTileLayoutType then v92 and v91 > 0 else v92 and (p19.gameTileLayoutType == GameTileTypes.GameTileLayoutType.Narrow and v91 > 0)
	local v94 = useBreakpointXOrSmaller(Responsive.Keys.XSmall)
	local v95 = FFlagLuaAppCompositionAlways or FFlagLuaAppCompositionSupport and p19.appCompositionEnabled
	local v96 = if not FFlagLuaAppCompositionSupport then nil else useCollectionLayout(GameTile.getGameTileCollectionItemSize(p19.gameTileLayoutType or GameTileTypes.GameTileLayoutType.Narrow))
	local v97 = Cryo.Dictionary.join(p19, {
		uiModeInfo = v90,
		cellSpacingHorizontal = v88.Global.Space_300,
		cellSpacingVertical = v88.Global.Space_400,
		designTokens = v88,
		textSizeOffset = v91,
		foundationTokens = v89,
		metadataCompact = v93,
		isNarrowScreenXSmall = v94,
		appCompositionActive = if not FFlagLuaAppCompositionSupport then nil else v95,
		collectionLayout = if not FFlagLuaAppCompositionSupport then nil else v96
	})

	return Roact.createElement(v44, v97)
end

if GetFFlagLuaAppUpdateGameSortGridRowHeight10ft() then
	local v46 = v45

	function v45(p20) -- line: 391
		-- upvalues: useStyle (copy), useTextSizeOffset (copy), Cryo (copy), Roact (copy), v46 (copy)
		local v99 = useStyle()
		local v100 = useTextSizeOffset()
		local v101 = Cryo.Dictionary.join(p20, {
			style = v99,
			textSizeOffset = v100
		})

		return Roact.createElement(v46, v101)
	end
end

return v45
