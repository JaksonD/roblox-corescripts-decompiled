local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local AppCommonLib = require(Parent.AppCommonLib)
local CollectionViews = require(Parent.CollectionViews)
local Cryo = require(Parent.Cryo)
local DiscoveryAnalytics = require(Parent.DiscoveryAnalytics)
local Foundation = require(Parent.Foundation)
local GameCollections = require(Parent.GameCollections)
local Impressions = require(Parent.Impressions)
local Localization = require(Parent.Localization)
local React = require(Parent.React)
local RoactServiceTags = require(Parent.RoactServiceTags)
local RobloxAppHooks = require(Parent.RobloxAppHooks)
local ViewportUtils = require(Parent.ViewportUtils)
local SharedFlags = require(Parent.SharedFlags)
local Constants = require(script.Parent.Constants)
local TraversalExperienceCard = require(script.Parent.TraversalExperienceCard)
local TraversalTelemetry = require(script.Parent.TraversalTelemetry)
local v19 = game:DefineFastInt("MaxTraversalHistoryCardsPerRow709", 6)
local FFlagTraversalHistoryDiscoveryTelemetry = SharedFlags.FFlagTraversalHistoryDiscoveryTelemetry
local FFlagTraversalExpPagePaddingFixes = require(script.Parent.Flags).FFlagTraversalExpPagePaddingFixes
local FFlagTraversalPerfFixes = require(script.Parent.Flags).FFlagTraversalPerfFixes
local v23 = game:DefineFastFlag("TraversalUseDiscoveryCollectionViews", false)
local v24 = game:DefineFastFlag("TraversalUseXSmallCollectionItems", false)
local Signal = AppCommonLib.Signal
local CollectionLayoutCalculators = CollectionViews.CollectionLayoutCalculators
local CollectionItemSize = CollectionViews.CollectionViewTypes.CollectionItemSize
local gamePlayIntent = DiscoveryAnalytics.Events.gamePlayIntent
local IconButton = Foundation.IconButton
local IconName = Foundation.Enums.IconName
local FoundationText = Foundation.Text
local View = Foundation.View
local ScrollView = Foundation.ScrollView
local useTokens = Foundation.Hooks.useTokens
local SendGameImpressions = GameCollections.SendGameImpressions
local ImpressionsTrackerWithoutNavigation = Impressions.ImpressionsTrackerWithoutNavigation
local useViewportBounds = ViewportUtils.useViewportBounds
local useLocalization = Localization.Hooks.useLocalization
local AppEventIngestService = RoactServiceTags.AppEventIngestService
local RoactAnalytics = RoactServiceTags.RoactAnalytics
local useRoactService = RobloxAppHooks.useRoactService

local function getCardsPerRowAndCardWidth(t1: {[any]: any}) -- line: 71
	local availableWidth = t1.availableWidth
	local maxCardsPerRow = t1.maxCardsPerRow
	local minCardWidth = t1.minCardWidth
	local v47 = t1.cardGap or 0
	local v48 = math.floor((availableWidth + v47) / (minCardWidth + v47))
	local v49 = math.floor((availableWidth - v47 * (v48 - 1)) / v48)
	local v50 = math.floor((availableWidth - v47 * (maxCardsPerRow - 1)) / maxCardsPerRow)

	if v48 < 1 then
		return 1, minCardWidth
	end

	if v49 < v50 then
		return maxCardsPerRow, v50
	end

	return v48, v49
end

return React.memo(React.forwardRef(function(t2: {[any]: any}, p1) --[[ HistoryPage ]] -- line: 93
	-- upvalues: useRoactService (copy), AppEventIngestService (copy), RoactAnalytics (copy), useTokens (copy), useLocalization (copy), FFlagTraversalExpPagePaddingFixes (copy), React (copy), v23 (copy), v24 (copy), GuiService (copy), CollectionItemSize (copy), CollectionLayoutCalculators (copy), CollectionViews (copy), getCardsPerRowAndCardWidth (copy), v19 (copy), FFlagTraversalPerfFixes (copy), Signal (copy), Cryo (copy), TraversalExperienceCard (copy), Constants (copy), TraversalTelemetry (copy), FFlagTraversalHistoryDiscoveryTelemetry (copy), gamePlayIntent (copy), DiscoveryAnalytics (copy), useViewportBounds (copy), SendGameImpressions (copy), View (copy), IconButton (copy), IconName (copy), FoundationText (copy), ScrollView (copy), ImpressionsTrackerWithoutNavigation (copy)
	local v53 = useRoactService(AppEventIngestService)
	local v54 = useRoactService(RoactAnalytics)
	local v55 = useTokens()
	local v56 = useLocalization({
		historyTitle = "CoreScripts.TopBar.Traversal.History",
		historyDescription = "CoreScripts.InGameMenu.Traversal.HistoryDescription"
	})
	local v57 = if not FFlagTraversalExpPagePaddingFixes then v55.Gap.Small else v55.Gap.Large
	local XLarge = v55.Padding.XLarge
	local v59, v60 = React.useState(0)
	local v62, u63

	if v23 then
		local v61 = if not v24 or GuiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then CollectionItemSize.Small else CollectionItemSize.XSmall

		v62 = CollectionLayoutCalculators.calculateNumColumns(v59, 0, v57, v61, v55)
		u63 = CollectionViews.calculateItemWidth(v62, v57, 0, v59, 0)
	else
		local v64

		v62, v64 = getCardsPerRowAndCardWidth({
			availableWidth = v59,
			maxCardsPerRow = v19,
			minCardWidth = v55.Size.Size_2500,
			cardGap = v57
		})
		u63 = v64
	end

	local u65 = math.max(v62, 1)
	local v66 = math.floor(#t2.historyItems / u65)
	local u67 = nil
	local u68

	if FFlagTraversalPerfFixes then
		u68 = React.useRef(nil)
	else
		local v69, v70 = React.useState(nil)

		u68 = v69
		u67 = v70
	end

	local v71 = React.useRef({})
	local v72 = React.useCallback(function(p2, p3) -- line: 133
		-- upvalues: v71 (copy)
		v71.current[p2] = p3
	end, {})
	local v73 = React.useRef(nil)
	local v74 = React.useMemo(function() -- line: 137
		-- upvalues: Signal (copy)
		return Signal.new()
	end, {})
	local v75 = Cryo.List.map(t2.historyItems, function(p4, p5) -- line: 141
		-- upvalues: React (copy), TraversalExperienceCard (copy), Constants (copy), t2 (copy), TraversalTelemetry (copy), FFlagTraversalHistoryDiscoveryTelemetry (copy), gamePlayIntent (copy), v53 (copy), DiscoveryAnalytics (copy), u63 (ref), v72 (copy)
		return React.createElement(TraversalExperienceCard, {
			key = p5,
			name = p4.name,
			image = p4.image,
			impressionIndex = p5,
			impressionTag = Constants.CardImpressionTag,
			rating = p4.rating,
			onActivated = function() --[[ onActivated ]] -- line: 149
				-- upvalues: t2 (copy), TraversalTelemetry (copy), p4 (copy), p5 (copy), FFlagTraversalHistoryDiscoveryTelemetry (copy), gamePlayIntent (copy), v53 (copy), DiscoveryAnalytics (copy)
				if not t2.onCardItemActivated then
					return
				end

				TraversalTelemetry.sendHistoryPageExperienceTileClick({
					integration_id = "history_landing_game_tile",
					event_type = "click",
					destination_universe_id = tostring(p4.universeId),
					recency_pos = p5
				})

				if FFlagTraversalHistoryDiscoveryTelemetry then
					gamePlayIntent(v53, DiscoveryAnalytics.Constants.Context.InExpHistoryTile, {
						placeId = tostring(p4.placeId),
						universeId = tostring(p4.universeId),
						sortEntryIndex = tostring(p5)
					})
				end

				t2.onCardItemActivated(p4.universeId)
			end,
			width = u63,
			ref = function(p6) --[[ ref ]] -- line: 171
				-- upvalues: v72 (copy), p5 (copy)
				v72(p5, p6)
			end
		})
	end)
	local u76 = nil

	if FFlagTraversalPerfFixes then
		u76 = React.useRef(false)
	end

	React.useEffect(function() -- line: 183
		-- upvalues: FFlagTraversalPerfFixes (copy), u76 (ref), u68 (ref), v73 (copy), t2 (copy), v66 (copy), u65 (ref)
		if FFlagTraversalPerfFixes and u76.current then
			return
		end

		if not (if not FFlagTraversalPerfFixes then u68 else u68.current) or not v73.current or not t2.onLoadMoreHistory then
			return
		end

		local v86 = ((if not FFlagTraversalPerfFixes then u68 else u68.current)) * v66

		if v86 + (if not FFlagTraversalPerfFixes then u68 else u68.current) <= v73.current.AbsoluteSize.Y then
			if FFlagTraversalPerfFixes then
				u76.current = true

				local v87 = math.max(math.floor((v73.current.AbsoluteSize.Y - v86) / u68.current), 1) * u65

				t2.onLoadMoreHistory(v87)

				return
			end

			t2.onLoadMoreHistory(u65)
		end
	end, {
		if not FFlagTraversalPerfFixes then t2.historyItems else nil,
		t2.onLoadMoreHistory,
		if not FFlagTraversalPerfFixes then u68 else nil,
		u65,
		v66
	})

	local v77 = useViewportBounds()
	local v78 = React.useCallback(function(p7) -- line: 223
		-- upvalues: FFlagTraversalHistoryDiscoveryTelemetry (copy), t2 (copy), SendGameImpressions (copy), v53 (copy), v54 (copy), u65 (ref), v66 (copy)
		if FFlagTraversalHistoryDiscoveryTelemetry then
			local t3 = {}

			for v90, v91 in t2.historyItems do
				if v91 then
					table.insert(t3, {
						placeId = tostring(v91.placeId),
						universeId = tostring(v91.universeId),
						uiIndex = v90
					})
				end
			end

			SendGameImpressions.sendFromTraversalHistoryPage(v53, v54, p7, t3, u65, v66)
		end
	end, {
		t2.historyItems,
		v54,
		if not FFlagTraversalPerfFixes then v59 else nil,
		u65,
		v53,
		v66
	})
	local v79 = React.useCallback(function() -- line: 256
		-- upvalues: TraversalTelemetry (copy), t2 (copy)
		TraversalTelemetry.sendHistoryPageBackButtonClick({
			integration_id = "history_landing_back_button",
			event_type = "click"
		})
		t2.onHistoryClose()
	end, { t2.onHistoryClose })
	local v80 = React.useCallback(function(p8) -- line: 265
		-- upvalues: XLarge (copy), v60 (copy), v71 (copy), FFlagTraversalPerfFixes (copy), u68 (ref), u67 (ref)
		local v93 = p8.AbsoluteSize.X - 2 * XLarge

		v60(v93)

		if v71.current[1] then
			if FFlagTraversalPerfFixes then
				u68.current = v71.current[1].AbsoluteSize.Y

				return
			end

			u67(v71.current[1].AbsoluteSize.Y)
		end
	end, if not FFlagTraversalPerfFixes then {
		XLarge,
		v60,
		u67
	} else { XLarge })
	local v81 = React.useCallback(function(p9) -- line: 278
		-- upvalues: v74 (copy), t2 (copy), FFlagTraversalPerfFixes (copy), u68 (ref), u65 (ref)
		v74:fire()

		if not t2.onLoadMoreHistory or not if not FFlagTraversalPerfFixes then u68 else u68.current then
			return
		end

		local CanvasPositionY = p9.CanvasPosition.Y
		local AbsoluteWindowSizeY = p9.AbsoluteWindowSize.Y
		local AbsoluteCanvasSizeY = p9.AbsoluteCanvasSize.Y
		local v98 = if not FFlagTraversalPerfFixes then u68 else u68.current

		if AbsoluteCanvasSizeY <= CanvasPositionY + AbsoluteWindowSizeY + v98 then
			t2.onLoadMoreHistory(u65)
		end
	end, {
		t2.onLoadMoreHistory,
		if not FFlagTraversalPerfFixes then u68 else nil,
		u65,
		v74
	})

	return React.createElement(View, {
		tag = "col auto-xy size-full-0",
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, {
		TopContainer = if not FFlagTraversalExpPagePaddingFixes then React.createElement(IconButton, {
			icon = IconName.ChevronLargeLeft,
			onActivated = v79,
			ref = p1
		}) else React.createElement(View, {
			tag = "size-full-0 auto-y padding-x-small padding-bottom-large"
		}, {
			ChevronButton = React.createElement(IconButton, {
				icon = IconName.ChevronLargeLeft,
				onActivated = v79,
				ref = p1
			})
		}),
		Header = React.createElement(View, {
			tag = "col auto-y size-full-0 " .. (not FFlagTraversalExpPagePaddingFixes and "padding-left-medium padding-top-small padding-bottom-large" or ""),
			padding = if not FFlagTraversalExpPagePaddingFixes then nil else {
				left = UDim.new(0, XLarge),
				bottom = UDim.new(0, v55.Padding.XLarge)
			},
			LayoutOrder = 1
		}, {
			Title = React.createElement(FoundationText, {
				Text = v56.historyTitle,
				tag = "auto-xy text-heading-small text-truncate-split"
			}),
			Description = React.createElement(FoundationText, {
				Text = v56.historyDescription,
				tag = "auto-xy text-body-large text-truncate-split"
			})
		}),
		ScrollContent = React.createElement(ScrollView, {
			tag = "size-full shrink",
			padding = if not FFlagTraversalExpPagePaddingFixes then UDim.new(0, XLarge) else {
				left = UDim.new(0, XLarge),
				right = UDim.new(0, XLarge)
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, v57),
				Wraps = true
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			LayoutOrder = 2,
			onAbsoluteSizeChanged = v80,
			onCanvasPositionChanged = v81,
			scrollingFrameRef = v73,
			selection = {
				Selectable = false
			},
			selectionGroup = false
		}, v75),
		TraversalHistoryCardImpressionTracker = FFlagTraversalHistoryDiscoveryTelemetry and React.createElement(ImpressionsTrackerWithoutNavigation, {
			parentRef = v73,
			impressionsTag = Constants.CardImpressionTag,
			scrollViewPositionChangedSignal = v74,
			sendImpressions = v78,
			viewPortBounds = v77
		})
	})
end))
