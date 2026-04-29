local CorePackages = game:GetService("CorePackages")
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local useStyle = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local Promise = require(CorePackages.Packages.Promise)
local useUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local RobloxAppEnums = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local UiMode = RobloxAppEnums.UiMode
local AppPage = RobloxAppEnums.AppPage
local useLastInputMode = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useLastInputMode
local DiscoveryTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedTypes = DiscoveryTypes.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypes.OmniFeedConstants
local ViewportVideoAutoplaySync = require(CorePackages.Workspace.Packages.VideoUtils).ViewportVideoAutoplaySync
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local dependencyArray = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.dependencyArray
local useAnimateScrollViewToSelection = require(CorePackages.Workspace.Packages.AppBlox).useAnimateScrollViewToSelection
local ScrollDetector = require(CorePackages.Workspace.Packages.ScrollTelemetry).ScrollDetector
local useAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local DiscoveryAppLaunchTracker = require(CorePackages.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker
local isSduiGameOmniFeedItem = require(CorePackages.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem
local OmniFeedImpressionsDetector = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedImpressionsDetector
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RefreshScrollingFrameWithLoadMore = require(Modules.LuaApp.Components.RefreshScrollingFrameWithLoadMore)
local JoinYourFriendsRefreshEvent = require(Modules.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent)
local Constants = require(Modules.LuaApp.Constants)
local OmniFeedItemsContainer = require(script.Parent.OmniFeedItemsContainer)
local FIntLuaJoinYourFriendsRefreshInterval = require(Modules.Personalization.Flags.FIntLuaJoinYourFriendsRefreshInterval)
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlags.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlags.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppChartsStickyHeader = SharedFlags.FFlagLuaAppChartsStickyHeader
local FFlagExtendScrollingFramesBySafeInsets = SharedFlags.FFlagExtendScrollingFramesBySafeInsets
local FFlagLuaAppCompositionSupport = SharedFlags.FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = SharedFlags.FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = SharedFlags.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = SharedFlags.FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameCarouselAmpUpsellAction = SharedFlags.FFlagLuaAppGameCarouselAmpUpsellAction
local v42 = game:DefineFastInt("LuaAppOmniFeedInitialNumRows", 6)
local v43 = game:DefineFastInt("LuaAppOmniFeedLoadNumRows", 3)
local FStringLuaAppSortsWithDividers = SharedFlags.FStringLuaAppSortsWithDividers
local FFlagLuaAppUseSortsWithDividersFString = SharedFlags.FFlagLuaAppUseSortsWithDividersFString
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern

if FFlagLuaAppUseSortsWithDividersFString then
	for match in FStringLuaAppSortsWithDividers:gmatch("(%w+)") do
		({})[match] = true
	end
end

local v48 = game:DefineFastInt("LuaAppOmniFeedScrollAnimDurationMs", 400) / 1000
local v49 = if not FFlagLuaAppChartsStickyHeader then nil else {}

local function getNumItemsForRows(t1: {[any]: any}, n1: number, n2: number, b1: boolean?) -- line: 87
	-- upvalues: OmniFeedTypes (copy), isSduiGameOmniFeedItem (copy)
	local n3 = 0
	local n4 = 0

	for i = n1, #t1 do
		local v60 = t1[i]
		local v61 = v60 and (not not v60.treatmentProps and v60.treatmentProps.numberOfRows) or 1

		if v61 == -1 then
			v61 = 1
		end

		n4 += 1
		n3 += v61

		local topicId = nil

		if v60 then
			if v60.treatmentProps and v60.treatmentProps.topicId then
				topicId = v60.treatmentProps.topicId
			elseif v60.itemId and v60.itemId.topicId then
				topicId = v60.itemId.topicId
			end
		end

		if n2 <= n3 then
			return n4
		end

		if b1 then
			local treatmentType = v60.treatmentType

			if treatmentType == OmniFeedTypes.HomeGameGrid or (treatmentType == OmniFeedTypes.Carousel or (treatmentType == OmniFeedTypes.SearchGameGrid or isSduiGameOmniFeedItem(treatmentType, topicId))) then
				return n4
			end
		end
	end

	return n4
end

return function(t2: {[any]: any}) -- line: 161
	-- upvalues: useStyle (copy), useAppPolicy (copy), useUiModeInfo (copy), UiMode (copy), React (copy), Signal (copy), FFlagLuaAppLayoutParamsInContext (copy), useLastInputMode (copy), FFlagLuaAppChartsStickyHeader (copy), getNumItemsForRows (copy), v42 (copy), useDesignTokens (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useSelector (copy), OmniFeedConstants (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), Constants (copy), JoinYourFriendsRefreshEvent (copy), FIntLuaJoinYourFriendsRefreshInterval (copy), v49 (copy), useAnimateScrollViewToSelection (copy), v48 (copy), v43 (copy), DiscoveryAppLaunchTracker (copy), Roact (copy), RefreshScrollingFrameWithLoadMore (copy), Promise (copy), FFlagSearchOmniAutocompletePage (copy), FFlagAppIaScrollAway (copy), FFlagExtendScrollingFramesBySafeInsets (copy), OmniFeedItemsContainer (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), AppPage (copy), OmniFeedImpressionsDetector (copy), ViewportVideoAutoplaySync (copy), ScrollDetector (copy)
	local v65 = useStyle()
	local v66 = useAppPolicy(function(p1) -- line: 163
		return p1.useGridPageLayout()
	end)
	local v67 = useAppPolicy(function(p2) -- line: 166
		return p2.getMountAllOmniFeedItems()
	end)
	local v68 = useUiModeInfo().uiMode == UiMode.TenFoot
	local u69 = v66 and not v68
	local v70 = React.useRef(Signal.new())
	local v71 = React.useRef(Signal.new())
	local v72 = React.useRef(0)
	local v73 = React.useRef(false)
	local u74 = if not FFlagLuaAppLayoutParamsInContext then t2.scrollingFrameRef else nil
	local v75 = useLastInputMode() == "Cursor"
	local v76 = t2.shouldStopAfterOneGameSort and not v67
	local v77 = nil

	if FFlagLuaAppLayoutParamsInContext then
		u74 = React.useRef(nil)

		local _, v79 = React.useState(nil)
		local u80 = v79

		if type(t2.scrollingFrameRef) == "table" then
			u74 = t2.scrollingFrameRef
		end

		v77 = React.useCallback(function(p3) -- line: 194
			-- upvalues: u74 (ref), u80 (ref), t2 (copy)
			u74.current = p3
			u80(p3)

			if type(t2.scrollingFrameRef) == "function" then
				t2.scrollingFrameRef(p3)
			end
		end, { t2.scrollingFrameRef })
	end

	local v81 = if not FFlagLuaAppChartsStickyHeader then nil else React.useMemo(function() -- line: 204
		-- upvalues: t2 (copy)
		local t3 = {}

		for _, v112 in t2.omniFeedItems do
			if v112.pageSection == t2.omniFeedPageSection then
				table.insert(t3, v112)
			end
		end

		return t3
	end, {
		t2.omniFeedItems,
		t2.omniFeedPageSection
	})
	local v82, v83 = React.useState(function() -- line: 216
		-- upvalues: v67 (copy), FFlagLuaAppChartsStickyHeader (copy), v81 (copy), t2 (copy), getNumItemsForRows (copy), v42 (copy), v76 (copy)
		if v67 then
			return #if not FFlagLuaAppChartsStickyHeader then t2.omniFeedItems else v81
		end

		return (getNumItemsForRows(if not FFlagLuaAppChartsStickyHeader then t2.omniFeedItems else v81, 1, v42, v76))
	end)
	local pageContext = t2.pageContext
	local impressionsTag = t2.impressionsTag
	local omniFeedItems = t2.omniFeedItems
	local Theme = v65.Theme
	local _ = Theme.BackgroundDefault.Color
	local _ = Theme.BackgroundDefault.Transparency
	local v90 = not u69 and 0 or 4
	local v91 = useDesignTokens()
	local BackgroundColor = v91.LuaApps.App.Page.BackgroundColor
	local PageBackgroundTransparency = v91.LuaApps.App.Page.BackgroundTransparency
	local v94 = React.useMemo(function() -- line: 248
		-- upvalues: v91 (copy), u69 (ref)
		return v91.LuaApps.HomeOmniFeed.getLayoutSpacing(u69)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(u69, v91) else {
		u69,
		v91
	})
	local v95 = t2.topPadding or v94.topMargin
	local v96 = not t2.loadMoreButtonText and 80 or v91.Global.Size_600
	local v97 = t2.bottomPadding or v96
	local v98 = useSelector(function(p4) -- line: 260
		return p4.Personalization.OmniItemsGlobalLayoutData
	end)
	local v99 = v98 and (v98[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] == "true" or v98[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] == true)
	local v100 = if not FFlagLuaAppGameCarouselAmpUpsellAction then React.useCallback(function(b2: boolean?) -- line: 271
		-- upvalues: v72 (copy), v71 (copy), OmniFeedConstants (copy), t2 (copy)
		v72.current = tick()
		v71.current:fire()

		local v115 = if not b2 then OmniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh else OmniFeedConstants.OmniRecommendationsRequestIntent.FriendPresenceChange

		return t2.refresh(v115)
	end) else nil
	local v101 = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else React.useCallback(function(s1: string?) -- line: 283
		-- upvalues: v72 (copy), v71 (copy), t2 (copy), OmniFeedConstants (copy)
		v72.current = tick()
		v71.current:fire()

		return t2.refresh(s1 or OmniFeedConstants.OmniRecommendationsRequestIntent.ManualRefresh)
	end)

	React.useEffect(function() -- line: 303
		-- upvalues: v99 (copy), JoinYourFriendsRefreshEvent (copy), v73 (copy), v72 (copy), FIntLuaJoinYourFriendsRefreshInterval (copy), u74 (ref), Constants (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), v101 (copy), OmniFeedConstants (copy), v100 (copy)
		local connection = nil

		if v99 then
			connection = JoinYourFriendsRefreshEvent.Event:Connect(function() -- line: 306
				-- upvalues: v73 (copy), v72 (copy), FIntLuaJoinYourFriendsRefreshInterval (copy), u74 (ref), Constants (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), v101 (copy), OmniFeedConstants (copy), v100 (copy)
				if v73.current then
					return
				end

				local v123 = tick() - v72.current
				local v124 = FIntLuaJoinYourFriendsRefreshInterval - v123

				if v124 < 0 then
					v73.current = false

					if u74.current then
						local CanvasPositionY = u74.current.CanvasPosition.Y
						local JoinYourFriendsTileHeight = Constants.JoinYourFriendsTile.Height

						if CanvasPositionY >= 0 and CanvasPositionY <= JoinYourFriendsTileHeight then
							if FFlagLuaAppGameCarouselAmpUpsellAction then
								v101(OmniFeedConstants.OmniRecommendationsRequestIntent.FriendPresenceChange)

								return
							end

							v100(true)

							return
						end
					end
				else
					v73.current = true
					task.delay(v124, function() -- line: 317
						-- upvalues: v73 (copy), u74 (ref), Constants (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), v101 (copy), OmniFeedConstants (copy), v100 (copy)
						v73.current = false

						if u74.current then
							local CanvasPositionY = u74.current.CanvasPosition.Y
							local JoinYourFriendsTileHeight = Constants.JoinYourFriendsTile.Height

							if CanvasPositionY >= 0 and CanvasPositionY <= JoinYourFriendsTileHeight then
								if FFlagLuaAppGameCarouselAmpUpsellAction then
									v101(OmniFeedConstants.OmniRecommendationsRequestIntent.FriendPresenceChange)

									return
								end

								v100(true)
							end
						end
					end)
				end
			end)
		end

		return function() -- line: 323
			-- upvalues: connection (ref)
			if connection then
				connection:Disconnect()
				connection = nil
			end
		end
	end, { t2.refresh })

	local v102 = useSelector(function(p5) -- line: 331
		-- upvalues: pageContext (copy)
		return p5.OmniRecommendations[pageContext]
	end)
	local v103 = v102 and v102.sorts or if not FFlagLuaAppChartsStickyHeader then {} else v49
	local sduiContext = t2.sduiContext

	useAnimateScrollViewToSelection(u74, v48)

	local v105 = React.useCallback(function() -- line: 342
		-- upvalues: v70 (copy)
		v70.current:fire()
	end)

	local function u106() -- line: 347
		-- upvalues: v82 (copy), FFlagLuaAppChartsStickyHeader (copy), v81 (copy), omniFeedItems (copy), v67 (copy), getNumItemsForRows (copy), v43 (copy), v76 (copy), v83 (copy)
		if v82 < #if not FFlagLuaAppChartsStickyHeader then omniFeedItems else v81 then
			local v121 = if not v67 then v82 + getNumItemsForRows(if not FFlagLuaAppChartsStickyHeader then omniFeedItems else v81, v82 + 1, v43, v76) else #if not FFlagLuaAppChartsStickyHeader then omniFeedItems else v81

			v83(v121)

			return true
		end

		return false
	end

	React.useEffect(function() -- line: 371
		-- upvalues: v76 (copy), u106 (ref)
		if not v76 then
			u106()
		end
	end, {
		omniFeedItems,
		v76
	})

	if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
		DiscoveryAppLaunchTracker.default:trackFeedRender()
		DiscoveryAppLaunchTracker.default:trackNumFeedItems(v82)
	end

	return Roact.createElement(RefreshScrollingFrameWithLoadMore, {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		CanvasSize = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = BackgroundColor,
		BackgroundTransparency = PageBackgroundTransparency,
		BorderSizePixel = 0,
		ScrollBarThickness = if not t2.scrollBarThickness then v90 else t2.scrollBarThickness,
		onLoadMore = function() --[[ onLoadMore ]] -- line: 392
			-- upvalues: u106 (ref), Promise (copy), t2 (copy)
			if u106() then
				return Promise.reject()
			end

			local loadNext = t2.loadNext

			if loadNext then
				return loadNext()
			end

			return Promise.resolve()
		end,
		refresh = if not FFlagLuaAppGameCarouselAmpUpsellAction then v100 else v101,
		parentAppPage = pageContext,
		onAbsoluteSizeChangedCallback = t2.onAbsoluteSizeChanged,
		onCanvasSizeChangedCallback = v105,
		onCanvasPositionChangedCallback = v105,
		useAutomaticSizeContentFrame = true,
		[Roact.Ref] = if not FFlagLuaAppLayoutParamsInContext then u74 else v77,
		createEndOfScrollElement = t2.createEndOfScrollElement,
		onScrollDirectionChanged = t2.onScrollDirectionChanged,
		ScrollingEnabled = v75,
		onAbsoluteContentSizeChanged = if not FFlagSearchOmniAutocompletePage then nil else t2.onAbsoluteContentSizeChanged,
		loadMoreButtonText = if not t2.loadMoreButtonText or (not t2.hasNextPage or t2.loadNext == nil) then nil else t2.loadMoreButtonText,
		canvasTopPadding = if not FFlagAppIaScrollAway then nil else t2.canvasTopPadding,
		shouldExtendIntoSafeArea = if not FFlagExtendScrollingFramesBySafeInsets then nil else {
			left = false,
			top = false,
			right = true,
			bottom = true
		}
	}, {
		OmniFeed = React.createElement(OmniFeedItemsContainer, {
			omniFeedItems = omniFeedItems,
			pageContext = pageContext,
			sduiContext = sduiContext,
			impressionsTag = impressionsTag,
			numberOfItemsToBeRendered = v82,
			topMargin = v95,
			bottomMargin = v97,
			layoutPadding = v94.layoutPadding,
			onItemsUpdatedSignalRef = v70,
			refreshSignalRef = v71,
			scrollingFrameRef = u74,
			defaultContainerSize = t2.defaultContainerSize,
			sortsData = v103,
			hasNextPage = t2.hasNextPage,
			omniFeedPageSection = t2.omniFeedPageSection,
			enableRelativeGui = t2.enableRelativeGui,
			appCompositionEnabled = not not FFlagLuaAppCompositionAlways or if not FFlagLuaAppCompositionSupport then nil else t2.appCompositionEnabled,
			contentTag = if not FFlagLuaAppCompositionSupport then nil else t2.contentTag,
			onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t2.onTileImageLoaded,
			videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else t2.videoPlaybackContext,
			refreshFeed = if not FFlagLuaAppGameCarouselAmpUpsellAction or pageContext ~= AppPage.Home then nil else v101
		}),
		OmniFeedImpressionsDetector = React.createElement(OmniFeedImpressionsDetector, {
			onItemsUpdatedSignal = v70.current,
			impressionsTag = impressionsTag,
			omniFeedItems = omniFeedItems,
			eventContext = t2.analyticsContext
		}),
		ViewportVideoAutoplaySync = if not FFlagLuaAppHomeTouchAutoplay or (not t2.videoPlaybackContext or not t2.videoPlaybackContext.viewportVideoAutoplayController) then nil else React.createElement(ViewportVideoAutoplaySync, {
			viewportAutoplayController = t2.videoPlaybackContext.viewportVideoAutoplayController,
			scrollingFrameRef = u74
		}),
		ScrollDetector = if not t2.sendScrollEvent and (not FFlagLuaAppHomeTouchAutoplay or not t2.onScrollStart and not t2.onScrollSettled) then nil else React.createElement(ScrollDetector, {
			scrollingFrameRef = u74,
			sendScrollEvent = t2.sendScrollEvent,
			onScrollStart = if not FFlagLuaAppHomeTouchAutoplay then nil else t2.onScrollStart,
			onScrollSettled = if not FFlagLuaAppHomeTouchAutoplay then nil else t2.onScrollSettled
		})
	})
end
