local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local SocialCarouselParent = SocialCarousel.Parent
local React = require(SocialCarouselParent.React)
local CollectionViews = require(SocialCarouselParent.CollectionViews)
local Localization = require(SocialCarouselParent.Localization)
local CollectionCarousel = CollectionViews.CollectionCarousel
local useCollectionLayoutParams = CollectionViews.useCollectionLayoutParams
local useCollectionLayout = CollectionViews.useCollectionLayout
local CollectionViewTypes = CollectionViews.CollectionViewTypes
local usePageSideMargin = CollectionViews.usePageSideMargin
local CollectionItemSize = CollectionViewTypes.CollectionItemSize
local useLocalization = Localization.Hooks.useLocalization
local TileComponents = require(SocialCarousel.Common.TileComponents)
local Constants = require(SocialCarousel.Common.Constants)
local useSocialCarouselContext = require(SocialCarousel.Contexts.useSocialCarouselContext)
local useTokens = require(SocialCarouselParent.Foundation).Hooks.useTokens
local useTilesSeenCollection = require(SocialCarousel.Analytics.useTilesSeenCollection)
local v18 = game:DefineFastFlag("FixCarouselTileSizeScaling", false)
local FFlagFlyoutHideFriendsHeader = require(SocialCarousel.Flags.FFlagFlyoutHideFriendsHeader)
local FlyoutSidePanelIXP = require(SocialCarouselParent.SharedExperimentDefinition).FlyoutSidePanelIXP
local SharedFlags = require(SocialCarouselParent.SharedFlags)
local FFlagConnectionsToFriendsRename = SharedFlags.FFlagConnectionsToFriendsRename
local FFlagEnableFlyoutFriendsHeaderFix = SharedFlags.FFlagEnableFlyoutFriendsHeaderFix
local FFlagLuaAppCompositionSupport = require(SocialCarouselParent.SharedFlags).FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = require(SocialCarouselParent.SharedFlags).FFlagLuaAppCompositionAlways

return function(t1: {[any]: any}) --[[ Carousel ]] -- line: 36
	-- upvalues: FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), v18 (copy), useTokens (copy), useSocialCarouselContext (copy), useTilesSeenCollection (copy), React (copy), FFlagConnectionsToFriendsRename (copy), Constants (copy), useLocalization (copy), usePageSideMargin (copy), useCollectionLayoutParams (copy), CollectionItemSize (copy), useCollectionLayout (copy), TileComponents (copy), CollectionCarousel (copy), FFlagFlyoutHideFriendsHeader (copy), FFlagEnableFlyoutFriendsHeaderFix (copy), FlyoutSidePanelIXP (copy)
	local v27 = FFlagLuaAppCompositionAlways or FFlagLuaAppCompositionSupport and t1.appCompositionEnabled
	local v28 = if not v18 then nil else useTokens()
	local v29 = useSocialCarouselContext()
	local v30 = useTilesSeenCollection()
	local v31, v32 = React.useState(nil)
	local v33 = React.useRef(nil)
	local v34 = React.useRef({
		startIndex = 1,
		endIndex = 1
	})
	local v35 = React.useRef(false)
	local v36 = React.useRef(nil)
	local v37 = React.useRef(nil)
	local v38 = if FFlagConnectionsToFriendsRename then if v29.friendCount ~= 0 then {
		Constants.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
		friendCount = v29.friendCount
	} else Constants.LOCALIZATION.FRIENDS_LABEL else if v29.friendCount ~= 0 then {
		Constants.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
		connectionCount = v29.friendCount
	} else Constants.LOCALIZATION.CONNECTIONS_LABEL
	local v39 = useLocalization({
		friendsLabel = v38
	})
	local v40 = if FFlagLuaAppCompositionAlways then nil else usePageSideMargin(v31)
	local v41 = useCollectionLayoutParams(CollectionItemSize.XSmall, v31, true, {
		sideMargin = if not v27 then v40 else nil
	})
	local itemsPerRow = nil

	if FFlagLuaAppCompositionSupport then
		itemsPerRow = useCollectionLayout(CollectionItemSize.XSmall).itemsPerRow
	end

	local v43 = if not v27 then v41.numColumns else itemsPerRow

	React.useEffect(function() -- line: 81
		-- upvalues: v43 (copy), v36 (copy), v35 (copy), v37 (copy)
		if v43 ~= v36.current then
			v36.current = v43
			v35.current = false

			if v37.current then
				pcall(task.cancel, v37.current)
			end

			v37.current = task.delay(0.2, function() -- line: 90
				-- upvalues: v35 (copy), v37 (copy)
				v35.current = true
				v37.current = nil
			end)
		end
	end, { if not FFlagLuaAppCompositionSupport then v41.numColumns else v43 })
	React.useEffect(function() -- line: 97
		-- upvalues: v37 (copy)
		return function() -- line: 98
			-- upvalues: v37 (copy)
			if v37.current then
				pcall(task.cancel, v37.current)
			end
		end
	end, {})

	local v44 = React.useCallback(function(n1: number) -- line: 105
		-- upvalues: v18 (copy), Constants (copy), v28 (copy)
		return n1 + if not v18 then Constants.TILE_TEXT_HEIGHT else Constants.TILE_TEXT_HEIGHT * v28.Config.UI.Scale
	end, {})
	local selectionOrderBase = v29.selectionOrderBase
	local v46 = React.useCallback(function(p1, p2, p3) -- line: 115
		-- upvalues: selectionOrderBase (copy), TileComponents (copy), t1 (copy)
		local v52 = if not selectionOrderBase then nil else selectionOrderBase + p2

		return TileComponents[p1.tileType](p1, p2, p3, v52, function(s1: string, n2: number) -- line: 122
			-- upvalues: t1 (copy), p1 (copy)
			if t1.onTileContentChanged then
				t1.onTileContentChanged(s1, n2, p1)
			end
		end), p1.tileType
	end, {
		selectionOrderBase,
		t1.onTileContentChanged
	})
	local v47 = React.useCallback(function(n3: number, n4: number) -- line: 137
		-- upvalues: v29 (copy), v31 (copy), v33 (copy), v35 (copy), v43 (copy), v34 (copy), v30 (copy)
		if v29.unifiedLogging then
			v29.unifiedLogging.onCollectionViewabilityChanged(n3, n4)
		end

		if v29.tiles and v31 and v33.current and v35.current then
			local current = v33.current
			local AbsoluteSize = v31.AbsoluteSize
			local CanvasPosition = current.CanvasPosition
			local v58 = AbsoluteSize.X / v43
			local CanvasPositionX = CanvasPosition.X
			local AbsoluteSizeX = AbsoluteSize.X
			local v61 = math.max(1, math.floor(CanvasPositionX / v58) + 1)
			local v62 = math.min(#v29.tiles, (math.ceil((CanvasPositionX + AbsoluteSizeX) / v58)))

			v34.current = {
				startIndex = v61,
				endIndex = v62
			}

			for i = v61, v62 do
				local v64 = v29.tiles[i]

				if v64 and v64.id then
					v30.addTileToCollection(v64.id, i, v64)
				end
			end
		end
	end, {
		t1.onViewableItemsChanged,
		v29.tiles,
		v31,
		v33,
		if not FFlagLuaAppCompositionSupport then v41 else v43,
		v30
	})

	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1
	}, {
		UIPadding = React.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = React.createElement(CollectionCarousel, {
			containerRef = v32,
			scrollingFrameRef = v33,
			LayoutOrder = 1,
			title = v39.friendsLabel,
			items = v29.tiles,
			renderItem = v46,
			getItemHeight = v44,
			collectionItemSize = if not v27 then nil else CollectionItemSize.XSmall,
			numColumns = if not v27 then v41.numColumns else nil,
			fractionalItemAmount = if not v27 then v41.fractionalItemAmount else nil,
			columnGap = if not v27 then v41.columnGap else nil,
			sideMargin = if not v27 then v41.sideMargin else nil,
			maxItemsToShow = v41.maxTilesToShow,
			thresholdFromEnd = v41.loadMoreThreshold,
			onViewableItemsChanged = v47,
			onChangeCanvasPosition = if not v29.unifiedLogging then nil else v29.unifiedLogging.onCollectionViewabilityChanged,
			onActivateHeader = t1.onActivateHeader,
			headerComponent = if not v29.hideCarouselHeader and (not FFlagFlyoutHideFriendsHeader or not if not FFlagEnableFlyoutFriendsHeaderFix then FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() else FlyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp()) then nil else React.createElement(React.Fragment, nil, {})
		}),
		ScreenSizeImpressionsTracker = if not v29.unifiedLogging then nil else v29.unifiedLogging.renderImpressionsTrackerComponent(v33)
	})
end
