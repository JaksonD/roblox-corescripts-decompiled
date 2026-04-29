local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)

require(CorePackages.Packages.React)

local RoactRodux = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local UIBlox = require(CorePackages.Packages.UIBlox)
local t = require(CorePackages.Packages.t)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local RobloxAppEnums = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local NamedRefConstants = require(Modules.AvatarExperience.Common.NamedRefConstants)
local withStyle = UIBlox.Style.withStyle

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local AvatarRoute = AvatarExperienceNavigation.AvatarRoute.AvatarRoute
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local AvatarExperienceExperiments = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments)
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local sendAXCounterV2 = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ResultsList = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsList)
local RemoveSearchInCatalog = require(Modules.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog)
local SetSearchParameters = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchType = require(Modules.LuaApp.Actions.SetSearchType)
local withContextValue = require(Modules.AvatarExperience.Common.withContextValue)
local PageObjectManagerContext = require(Modules.AvatarExperience.Common.Context.PageObjectManagerContext)
local withAvatarRoute = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local Utils = require(Modules.AvatarExperience.AvatarEditor.Utils)
local DeepLinkUtils = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local ClearSelectedTopics = require(Modules.AvatarExperience.Catalog.Actions.ClearSelectedTopics)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local FetchCatalogSearchWithSponsoredItems = require(Modules.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems)
local FetchWidgetInfo = require(Modules.AvatarExperience.Catalog.Thunks.FetchWidgetInfo)
local Utils2 = require(Modules.AvatarExperience.Common.Utils)
local withNamedRefs = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local ResetSortAndFilters = require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters)
local ResetSortAndFiltersThunk = require(Modules.AvatarExperience.Catalog.Thunks.ResetSortAndFiltersThunk)
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local getAXMarketplaceWidgetStore = AvatarExperienceCatalog.Stores.getAXMarketplaceWidgetStore
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local FFlagAXRemoveDupSearchCall = require(Modules.AvatarExperience.Flags.FFlagAXRemoveDupSearchCall)
local FFlagAXResetAnalyticsMetadataOnFilterReset = require(Modules.AvatarExperience.Flags.FFlagAXResetAnalyticsMetadataOnFilterReset)
local CatalogTilesLatencyTracker = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local GetFFlagEnableCatalogTileLoadingLatency = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local v50 = Roact.PureComponent:extend("NavigationItemsView")
local FFlagAXEnableCatalogCreatorHttpLink = require(Modules.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlags.FFlagAXEditorSubcategoryFilters
local AXPrefetchMarketplaceIXP = AvatarExperienceExperiments.AXPrefetchMarketplaceIXP
local useMarketplaceResultsFetcher = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useMarketplaceResultsFetcher)
local useMarketplaceResultsFetcherSdui = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useMarketplaceResultsFetcherSdui)
local useDispatchPendingCatalogDeepLink = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useDispatchPendingCatalogDeepLink)
local useResultsAreSduiEnabled = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useResultsAreSduiEnabled)
local useGetSelectedCategoryAndSubcategoryId = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local FFlagAXUnifiedMarketplaceResultsFetcher = AvatarExperienceFlags.FFlagAXUnifiedMarketplaceResultsFetcher
local FFlagAXPrefetchOnlyWithinTTL = AvatarExperienceFlags.FFlagAXPrefetchOnlyWithinTTL
local FIntAXPrefetchTTL = AvatarExperienceFlags.FIntAXPrefetchTTL
local AXRecentlyViewedSearchItemsIXPTest = AvatarExperienceCommon.Experiments.AXRecentlyViewedSearchItemsIXPTest
local AXCatalogRealTimeRecommendationsIXP = AvatarExperienceExperiments.AXCatalogRealTimeRecommendationsIXP
local v64 = game:DefineFastInt("AXCatalogExitReEnterRefreshInterval", 60)
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local FFlagAXPassScreenSizeToWidgetApi = AvatarExperienceFlags.FFlagAXPassScreenSizeToWidgetApi
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlags.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXDefaultCatalogCategoryId = AvatarExperienceFlags.FFlagAXDefaultCatalogCategoryId
local FFlagAXEnableTTIViaModule = AvatarExperienceFlags.FFlagAXEnableTTIViaModule
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev
local FFlagAXEnableMilestoneTrackingForAvatarExperience = AvatarExperienceFlags.FFlagAXEnableMilestoneTrackingForAvatarExperience
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local AvatarExperienceTTIPerformance = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformance.TTIPerformanceManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformance.OrganicTTIMilestoneManager
local CatalogCategories = AvatarExperienceCommon.Enums.CatalogCategories
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local useSignalState = SignalsReact.useSignalState
local selectFilterCount = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local getShouldPageUseWidgetOnlyFetcher = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.getShouldPageUseWidgetOnlyFetcher
local t1 = {
	[AvatarScreen.AvatarEditor] = true,
	[AvatarScreen.ProfilePictureEditorEmotes] = true,
	[AvatarScreen.MySharedAvatars] = true,
	[AvatarScreen.SearchLandingFocusedWidgetPage] = not not AXRecentlyViewedSearchItemsIXPTest.isEnabled() or nil
}

v50.validateProps = t.strictInterface({
	defaultChildRef = t.optional(t.table),
	NextSelectionUp = t.optional(t.table),
	NextSelectionRight = t.optional(t.table),
	multiTryOnBottomBarRef = t.optional(t.table),
	itemDetailsPeekViewRefs = t.table,
	categoryId = t.string,
	subcategoryId = t.optional(t.string),
	minPrice = t.number,
	maxPrice = t.number,
	selectedTopics = t.optional(t.table),
	catalogSort = t.string,
	catalogSortAggregation = t.string,
	searchParameters = t.optional(t.table),
	searchTime = t.optional(t.number),
	searchUuid = t.string,
	categoryInfo = t.table,
	creatorFilter = t.string,
	salesTypeFilter = t.string,
	unavailableItemFilter = t.string,
	wearTimeFilter = t.optional(t.string),
	widgetFetchTime = t.optional(t.number),
	externalNavigationRequest = if not FFlagAXEnableCatalogCreatorHttpLink then nil else t.table,
	isRecentMarketplaceUser = if not AXPrefetchMarketplaceIXP.isEnabled() then nil else t.optional(t.boolean),
	screenSize = if not FFlagAXPassScreenSizeToWidgetApi then nil else t.string,
	filterCount = if not FFlagAXPassScreenSizeToWidgetApi then nil else t.number,
	setSearchType = t.callback,
	setSearchParameters = t.callback,
	dispatchSearch = t.callback,
	fetchWidgetInfo = t.callback,
	dispatchRemoveSearch = t.callback,
	clearSelectedTopics = t.callback,
	resetSortAndFilters = t.callback,
	dispatchCatalogTilesLatencyStartTracker = if not GetFFlagEnableCatalogTileLoadingLatency() then nil else t.callback,
	pageObjectManager = t.optional(t.table),
	avatarRoute = AvatarRoute.Interface,
	namedRefs = t.table,
	networking = t.callback,
	catalogAnalytics = t.table,
	hasPrefetchedMarketplace = if not AXPrefetchMarketplaceIXP.isEnabled() and not FFlagAXUnifiedMarketplaceResultsFetcher then nil else t.optional(t.boolean),
	isPrefetchingMarketplace = if not AXPrefetchMarketplaceIXP.isEnabled() and not FFlagAXUnifiedMarketplaceResultsFetcher then nil else t.optional(t.boolean),
	fetchMarketplace = if not AXPrefetchMarketplaceIXP.isEnabled() and not FFlagAXUnifiedMarketplaceResultsFetcher then nil else t.optional(t.callback),
	fetchedMarketplaceTimestamp = if not FFlagAXPrefetchOnlyWithinTTL then nil else t.optional(t.number)
})

local v84 = if not AXCatalogRealTimeRecommendationsIXP.isEnabled() then nil else function(p1) -- line: 192
	-- upvalues: AvatarScreen (copy), FFlagAXDefaultCatalogCategoryId (copy), Constants2 (copy), CatalogCategories (copy)
	if p1.avatarRoute.opaque.name ~= AvatarScreen.Catalog then
		return false
	end

	local categoryInfo = p1.categoryInfo

	if not categoryInfo then
		return false
	end

	return categoryInfo.Id == if not FFlagAXDefaultCatalogCategoryId then CatalogCategories.Recommended:rawValue() else Constants2.DefaultCatalogCategoryId
end

function v50.init(p2) -- line: 214
	-- upvalues: AvatarScreen (copy), NamedRefConstants (copy), Roact (copy), Signal (copy), AXPrefetchMarketplaceIXP (copy), AXCatalogRealTimeRecommendationsIXP (copy), RobloxAppEnums (copy), CatalogUtils (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy)
	p2.itemsListRef = p2.props.namedRefs[AvatarScreen.Catalog .. NamedRefConstants.ItemsList]
	p2.scrollingFrameRef = Roact.createRef()
	p2.navBarRef = Roact.createRef()
	p2.backToTopSignal = Signal.new()
	p2:setState({
		restorePreviousChildFocus = true,
		isInitialPrefetch = if not AXPrefetchMarketplaceIXP.isEnabled() then nil else p2.props.isInitialPrefetch,
		hasEnteredAvatarExperience = not AXCatalogRealTimeRecommendationsIXP.isEnabled() and nil
	})

	if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
		p2.lastMarketplaceFetchTime = 0
	end

	function p2.dispatchInitialSearch() -- line: 231
		-- upvalues: p2 (copy), RobloxAppEnums (copy)
		local dispatchSearch = p2.props.dispatchSearch
		local setSearchParameters = p2.props.setSearchParameters
		local categoryInfo = p2.props.categoryInfo
		local searchUuid = p2.props.searchUuid

		p2.props.setSearchType(searchUuid, RobloxAppEnums.SearchTypes.Catalog)
		setSearchParameters(searchUuid, categoryInfo, p2.props.catalogSort, p2.props.catalogSortAggregation, p2.props.minPrice, p2.props.maxPrice, p2.props.selectedTopics)

		return dispatchSearch(p2.props.networking, searchUuid, categoryInfo)
	end
	function p2.fetchWidgetInfo(p3, p4) -- line: 251
		-- upvalues: CatalogUtils (copy), p2 (copy)
		local v169 = nil

		if p3 then
			v169 = CatalogUtils.getContextForWidgetsById(p2.props.avatarRoute.opaque.name, p3, p4)
		end

		return p2.props.fetchWidgetInfo(p2.props.networking, nil, v169)
	end

	if FFlagAXCatalogCategoriesSDUI then
		function p2.initialSearch() -- line: 265
			-- upvalues: FFlagAXUnifiedMarketplaceResultsFetcher (copy), p2 (copy), AXCatalogRealTimeRecommendationsIXP (copy)
			if FFlagAXUnifiedMarketplaceResultsFetcher then
				p2.props.fetchMarketplace()

				if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
					p2.lastMarketplaceFetchTime = os.time()

					return
				end
			else
				p2.dispatchInitialSearch()
			end
		end
	end
end

if AXPrefetchMarketplaceIXP.isEnabled() then
	function v50.hasPrefetchedMarketplace(p5) -- line: 282
		-- upvalues: IxpUtils (copy), AXPrefetchMarketplaceIXP (copy), sendAXCounterV2 (copy), Constants (copy), FFlagAXPrefetchOnlyWithinTTL (copy), FIntAXPrefetchTTL (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), FFlagAXEnableTTIViaModule (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), TTIPerformanceManager (copy), TimeToInteractiveTracker (copy), AXCatalogRealTimeRecommendationsIXP (copy)
		local v93 = IxpUtils.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser)
		local v94 = IxpUtils.readTestVariable(AXPrefetchMarketplaceIXP.UserIsInExperiment)

		if not p5.props.isRecentMarketplaceUser then
			return false
		end

		sendAXCounterV2(Constants.Counter.PrefetchMarketplace.enteredMarketplaceAndIsRecentUser)

		if v94 then
			local v95 = not FFlagAXPrefetchOnlyWithinTTL or (not p5.props.fetchedMarketplaceTimestamp or os.time() - p5.props.fetchedMarketplaceTimestamp <= FIntAXPrefetchTTL)

			if not v95 then
				return false
			end

			sendAXCounterV2(Constants.Counter.PrefetchMarketplace.inExperimentAndIsRecentUserAndEnteredMarketplace)
			IxpUtils.logExperimentExposure(AXPrefetchMarketplaceIXP)

			if v93 and v95 then
				if GetFFlagEnableCatalogTileLoadingLatency() then
					if FFlagAXEnableTTIViaModule then
						if FFlagAXEnableMilestoneTrackingForAvatarExperience then
							TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
						else
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Organic.Tiles)
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Organic.Thumbnails)
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Widget.Tiles)
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Widget.Thumbnails)
						end
					end

					p5.props.dispatchCatalogTilesLatencyStartTracker(p5.props.searchUuid)
				end

				if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
					p5.lastMarketplaceFetchTime = os.time()
				end

				p5:setState({
					isInitialPrefetch = true
				})

				return true
			end
		end

		return false
	end
end

function v50.didMount(p6) -- line: 368
	-- upvalues: AXPrefetchMarketplaceIXP (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), AXCatalogRealTimeRecommendationsIXP (copy)
	if AXPrefetchMarketplaceIXP.isEnabled() and p6:hasPrefetchedMarketplace() then
		return
	end

	if FFlagAXUnifiedMarketplaceResultsFetcher then
		p6.props.fetchMarketplace()

		if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
			p6.lastMarketplaceFetchTime = os.time()

			return
		end
	else
		p6.dispatchInitialSearch()
		p6.fetchWidgetInfo(p6.props.categoryId, p6.props.subcategoryId)
	end
end
function v50.searchResultsAreOld(p7, _, p9, p10) -- line: 393
	local v101 = if not p10 then p7.props.searchTime else p10.searchTime

	if not p9.TimeToRefresh or (not (p9.TimeToRefresh >= 0) or not v101) then
		return false
	end

	return tick() - v101 > p9.TimeToRefresh
end
function v50.updateSearchParams(p11, p12) -- line: 403
	-- upvalues: GetFFlagEnableCatalogTileLoadingLatency (copy), FFlagAXEnableTTIViaModule (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), TTIPerformanceManager (copy), OrganicTTIMilestoneManager (copy), TimeToInteractiveTracker (copy), Constants (copy), FFlagAXPassScreenSizeToWidgetApi (copy), getShouldPageUseWidgetOnlyFetcher (copy)
	local categoryInfo = p12.categoryInfo
	local searchUuid = p12.searchUuid
	local dispatchSearch = p11.props.dispatchSearch
	local setSearchParameters = p11.props.setSearchParameters
	local fetchWidgetInfo = p11.fetchWidgetInfo
	local v109 = p12.categoryId ~= p11.props.categoryId or p12.subcategoryId ~= p11.props.subcategoryId
	local v110 = p12.wearTimeFilter ~= p11.props.wearTimeFilter

	if v109 or (p12.catalogSort ~= p11.props.catalogSort or p12.catalogSortAggregation ~= p11.props.catalogSortAggregation or p12.minPrice ~= p11.props.minPrice or p12.maxPrice ~= p11.props.maxPrice or p12.selectedTopics ~= p11.props.selectedTopics or p12.creatorFilter ~= p11.props.creatorFilter or p12.salesTypeFilter ~= p11.props.salesTypeFilter or p12.unavailableItemFilter ~= p11.props.unavailableItemFilter or v110) then
		if v109 then
			p11.props.clearSelectedTopics()

			local v111 = p11.props.searchParameters[searchUuid]

			if v111 == nil then
				setSearchParameters(searchUuid, categoryInfo, p12.catalogSort, p12.catalogSortAggregation, p12.minPrice, p12.maxPrice, p12.selectedTopics, p12.creatorFilter, p12.salesTypeFilter, p12.unavailableItemFilter, p12.wearTimeFilter)

				if GetFFlagEnableCatalogTileLoadingLatency() then
					if FFlagAXEnableTTIViaModule then
						if FFlagAXEnableMilestoneTrackingForAvatarExperience then
							TTIPerformanceManager.Surface.Marketplace.Root.startTracking()

							if OrganicTTIMilestoneManager then
								OrganicTTIMilestoneManager.L2.primaryDataStarted()
								OrganicTTIMilestoneManager.L3.networkFetch()
							end
						else
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Organic.Tiles)
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Organic.Thumbnails)
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Widget.Tiles)
							TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Widget.Thumbnails)
						end
					end

					p11.props.dispatchCatalogTilesLatencyStartTracker(searchUuid)
				end

				dispatchSearch(p11.props.networking, searchUuid, categoryInfo)
				fetchWidgetInfo(p12.categoryId, p12.subcategoryId)
			else
				local v112 = p11:searchResultsAreOld(searchUuid, categoryInfo, p12) or (v111.catalogSort and v111.catalogSort ~= p12.catalogSort or (v111.catalogSortAggregation and v111.catalogSortAggregation ~= p12.catalogSortAggregation or (v111.minPrice and v111.minPrice ~= p12.minPrice or (v111.maxPrice and v111.maxPrice ~= p12.maxPrice or (v111.selectedTopics and v111.selectedTopics ~= p12.selectedTopics or (v111.creatorFilter and v111.creatorFilter ~= p12.creatorFilter or (v111.salesTypeFilter and v111.salesTypeFilter ~= p12.salesTypeFilter or v111.unavailableItemFilter and v111.unavailableItemFilter ~= p12.unavailableItemFilter)))))))
				local v113 = if not FFlagAXPassScreenSizeToWidgetApi then nil else getShouldPageUseWidgetOnlyFetcher(p12.categoryInfo, p12.filterCount, v111 and v111.searchKeyword)

				if FFlagAXPassScreenSizeToWidgetApi and v113 then
					v112 = false
				end

				if v112 then
					if p11:searchResultsAreOld(searchUuid, categoryInfo, p12) then
						p11.props.catalogAnalytics.sendAXCounter(Constants.Counter.CatalogRefresh.StaleResults)
					end

					p11.props.pageObjectManager:storePageObject(searchUuid, nil)
					p11.props.dispatchRemoveSearch(searchUuid)

					if GetFFlagEnableCatalogTileLoadingLatency() then
						if FFlagAXEnableTTIViaModule then
							if FFlagAXEnableMilestoneTrackingForAvatarExperience then
								TTIPerformanceManager.Surface.Marketplace.Root.startTracking()

								if OrganicTTIMilestoneManager then
									OrganicTTIMilestoneManager.L2.primaryDataStarted()
									OrganicTTIMilestoneManager.L3.networkFetch()
								end
							else
								TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Organic.Tiles)
								TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Organic.Thumbnails)
								TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Widget.Tiles)
								TimeToInteractiveTracker.trackStart(Constants.Counter.PREFIX .. Constants.Counter.Latency.Widget.Thumbnails)
							end
						end

						p11.props.dispatchCatalogTilesLatencyStartTracker(searchUuid)
					end

					setSearchParameters(searchUuid, categoryInfo, p12.catalogSort, p12.catalogSortAggregation, p12.minPrice, p12.maxPrice, p12.selectedTopics, p12.creatorFilter, p12.salesTypeFilter, p12.unavailableItemFilter, p12.wearTimeFilter)
					dispatchSearch(p11.props.networking, searchUuid, categoryInfo)
					fetchWidgetInfo(p12.categoryId, p12.subcategoryId)
				end
			end
		else
			p11.props.pageObjectManager:storePageObject(searchUuid, nil)
			p11.props.dispatchRemoveSearch(searchUuid)
			setSearchParameters(searchUuid, categoryInfo, p12.catalogSort, p12.catalogSortAggregation, p12.minPrice, p12.maxPrice, p12.selectedTopics, p12.creatorFilter, p12.salesTypeFilter, p12.unavailableItemFilter, p12.wearTimeFilter)
			dispatchSearch(p11.props.networking, searchUuid, categoryInfo)
		end

		if p11.scrollingFrameRef.current then
			p11.scrollingFrameRef.current.CanvasPosition = Vector2.new()
		end
	end
end
function v50.willUpdate(p13, p14) -- line: 611
	-- upvalues: AvatarScreen (copy), FFlagAXRemoveDupSearchCall (copy)
	if p13.props.avatarRoute.opaque.name == AvatarScreen.Catalog and p14.avatarRoute.opaque.name ~= AvatarScreen.Catalog then
		p13.props.clearSelectedTopics()
		p13.props.resetSortAndFilters()
	end

	if p13.props.avatarRoute.opaque.name ~= AvatarScreen.Catalog and p14.avatarRoute.opaque.name == AvatarScreen.Catalog then
		p13.props.clearSelectedTopics()
	end

	if FFlagAXRemoveDupSearchCall and p14.avatarRoute.opaque.name ~= AvatarScreen.Catalog then
		return
	end

	p13:updateSearchParams(p14)
end
function v50.renderWithStyle(p15, p16) -- line: 635
	-- upvalues: Roact (copy), Focusable (copy), ResultsList (copy), CatalogConstants (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXCatalogCategoriesStore (copy), FFlagAXMoveAllTabToWidgetOnly (copy)
	local Theme = p16.Theme
	local defaultChildRef = p15.props.defaultChildRef
	local NextSelectionUp = p15.props.NextSelectionUp

	return Roact.createElement(Focusable.Frame, {
		BackgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		[Roact.Ref] = defaultChildRef,
		restorePreviousChildFocus = p15.state.restorePreviousChildFocus,
		defaultChild = p15.navBarRef,
		NextSelectionRight = p15.props.NextSelectionRight
	}, {
		ListLayout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		ResultsList = Roact.createElement(ResultsList, {
			frameRef = p15.itemsListRef,
			navBarRef = p15.navBarRef,
			analyticsContext = CatalogConstants.AnalyticsContext.Catalog,
			fromSearch = false,
			searchUuid = p15.props.searchUuid,
			layoutOrder = 2,
			scrollingFrameRef = p15.scrollingFrameRef,
			onRetry = if not FFlagAXCatalogCategoriesSDUI then p15.dispatchInitialSearch else p15.initialSearch,
			NextSelectionUp = NextSelectionUp,
			backToTopSignal = p15.backToTopSignal,
			multiTryOnBottomBarRef = p15.props.multiTryOnBottomBarRef,
			itemDetailsPeekViewRefs = p15.props.itemDetailsPeekViewRefs,
			categoryInfo = if not FFlagAXCatalogCategoriesStore then if not FFlagAXMoveAllTabToWidgetOnly then nil else p15.props.categoryInfo else nil
		})
	})
end
function v50.render(p17) -- line: 678
	-- upvalues: withStyle (copy)
	return withStyle(function(p18) -- line: 679
		-- upvalues: p17 (copy)
		return p17:renderWithStyle(p18)
	end)
end

if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
	function v50.handleExitAndReEnterAvatarExperience(p19, p20) -- line: 685
		-- upvalues: v84 (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), v64 (copy), IxpUtils (copy), AXCatalogRealTimeRecommendationsIXP (copy), sendAXCounterV2 (copy), Constants (copy)
		local isVisible = p19.props.avatarRoute.isVisible
		local isVisible2 = p20.avatarRoute.isVisible

		if isVisible and not p19.state.hasEnteredAvatarExperience then
			p19:setState({
				hasEnteredAvatarExperience = true
			})
		end

		if isVisible and (not isVisible2 and p19.state.hasEnteredAvatarExperience) and v84(p19.props) and FFlagAXUnifiedMarketplaceResultsFetcher and p19.props.fetchMarketplace then
			local timestamp = os.time()

			if timestamp - p19.lastMarketplaceFetchTime >= v64 then
				if IxpUtils.readTestVariable(AXCatalogRealTimeRecommendationsIXP.UserIsInExperiment) then
					IxpUtils.logExperimentExposure(AXCatalogRealTimeRecommendationsIXP)
				end

				sendAXCounterV2(Constants.Counter.FetchMarketplace.ExitAndReEnterRefreshCounter)

				if IxpUtils.readTestVariable(AXCatalogRealTimeRecommendationsIXP.EnabledForUser) then
					sendAXCounterV2(Constants.Counter.FetchMarketplace.ExitAndReEnterRefreshTreatment)
					p19.props.fetchMarketplace()
					p19.lastMarketplaceFetchTime = timestamp

					return
				end
			end
		end
	end
end

function v50.didUpdate(p21, p22) -- line: 735
	-- upvalues: AvatarScreen (copy), t1 (copy), AXCatalogRealTimeRecommendationsIXP (copy), FFlagAXPassScreenSizeToWidgetApi (copy), getShouldPageUseWidgetOnlyFetcher (copy), FFlagAXEnableCatalogCreatorHttpLink (copy), DeepLinkUtils (copy), AXPrefetchMarketplaceIXP (copy), IxpUtils (copy), sendAXCounterV2 (copy), Constants (copy)
	local name = p21.props.avatarRoute.current.name
	local name2 = p22.avatarRoute.current.name

	if name == AvatarScreen.Catalog then
		if not p21.state.restorePreviousChildFocus then
			p21:setState({
				restorePreviousChildFocus = true
			})
		end
	elseif t1[name] and name2 == AvatarScreen.Catalog and p21.state.restorePreviousChildFocus then
		p21:setState({
			restorePreviousChildFocus = false
		})
	end

	if AXCatalogRealTimeRecommendationsIXP.isEnabled() then
		p21:handleExitAndReEnterAvatarExperience(p22)
	end

	local v131 = if not FFlagAXPassScreenSizeToWidgetApi or not p21.props.searchParameters then nil else p21.props.searchParameters[p21.props.searchUuid]
	local v132 = if not FFlagAXPassScreenSizeToWidgetApi then nil else getShouldPageUseWidgetOnlyFetcher(p21.props.categoryInfo, p21.props.filterCount, v131 and v131.searchKeyword)

	if FFlagAXPassScreenSizeToWidgetApi and p21.props.screenSize and p22.screenSize and p21.props.screenSize ~= p22.screenSize and v132 then
		p21.props.fetchMarketplace()
	end

	if p22.avatarRoute.opaque.name == AvatarScreen.CatalogSearch and p21.props.avatarRoute.opaque.name == AvatarScreen.Catalog then
		if FFlagAXEnableCatalogCreatorHttpLink then
			if p21.props.externalNavigationRequest == p22.externalNavigationRequest and not DeepLinkUtils.catalogDeepLinkExists(p21.props.externalNavigationRequest) then
				p21.props.resetSortAndFilters()
			end
		else
			p21.props.resetSortAndFilters()
		end
	end

	local v133 = p21.props.categoryInfo and p21.props.categoryInfo.ShowWidgets
	local v134 = p22.categoryInfo and p22.categoryInfo.ShowWidgets
	local v135 = v133 and not v134
	local v136 = name == AvatarScreen.Catalog and name2 == AvatarScreen.AvatarExperienceLandingPage

	if v135 or v136 then
		if FFlagAXPassScreenSizeToWidgetApi and v132 then
			p21.props.fetchMarketplace()
		else
			p21.fetchWidgetInfo(p21.props.categoryId, p21.props.subcategoryId)
		end
	end

	local v137 = if not AXPrefetchMarketplaceIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser)
	local v138 = if not v137 then nil else p22.isPrefetchingMarketplace and not p22.hasPrefetchedMarketplace
	local v139 = if not v137 then nil else not p21.props.isPrefetchingMarketplace and not p21.props.hasPrefetchedMarketplace

	if v137 then
		if p21.props.hasPrefetchedMarketplace and p21.state.isInitialPrefetch then
			sendAXCounterV2(Constants.Counter.PrefetchMarketplace.inTreatmentAndHasPrefetchedMarketplace)
			p21:setState({
				isInitialPrefetch = false
			})
		end

		if v138 and v139 and p21.state.isInitialPrefetch then
			sendAXCounterV2(Constants.Counter.PrefetchMarketplace.enteredMarketplaceButPrefetchFailed)
			p21.dispatchInitialSearch()
			p21.fetchWidgetInfo(p21.props.categoryId, p21.props.subcategoryId)
			p21:setState({
				isInitialPrefetch = false
			})
		end
	end
end

local v85 = withNamedRefs((withAvatarRoute((withContextValue(RoactRodux.connect(function(p23, p24) --[[ mapStateToProps ]] -- line: 855
	-- upvalues: FFlagAXCatalogCategoriesStore (copy), Utils2 (copy), FFlagAXEditorSubcategoryFilters (copy), Utils (copy), AXPrefetchMarketplaceIXP (copy), FFlagAXEnableCatalogCreatorHttpLink (copy), FFlagAXPassScreenSizeToWidgetApi (copy), selectFilterCount (copy)
	local categoryId, subcategoryId

	if FFlagAXCatalogCategoriesStore then
		categoryId = p24.categoryId
		subcategoryId = p24.subcategoryId
	else
		categoryId = p23.AvatarExperience.Catalog.Categories.categoryId
		subcategoryId = p23.AvatarExperience.Catalog.Categories.subcategoryId
	end

	local v144 = if not FFlagAXCatalogCategoriesStore then Utils2.getCatalogCategoryInfoFromState(p23) else p24.categoryInfo
	local subButton = p23.AvatarExperience.AvatarEditor.Categories.subButton
	local v146 = if not FFlagAXEditorSubcategoryFilters then nil else p23.AvatarExperience.AvatarEditor.Categories.subcategoryFilter
	local v147, _ = Utils.getSearchUuidAndAssetTypes(v144, subButton, if not FFlagAXEditorSubcategoryFilters then nil else v146)
	local v149 = if not AXPrefetchMarketplaceIXP.isEnabled() then nil else p23.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser

	return {
		categoryInfo = v144,
		categoryId = categoryId,
		subcategoryId = subcategoryId,
		minPrice = p23.AvatarExperience.Catalog.SortAndFilters.PriceRange.minPrice,
		maxPrice = p23.AvatarExperience.Catalog.SortAndFilters.PriceRange.maxPrice,
		selectedTopics = if FFlagAXCatalogCategoriesStore and v144 == nil or not v144.ShowTopics then nil else p23.AvatarExperience.Catalog.SortAndFilters.SelectedTopics,
		catalogSort = p23.AvatarExperience.Catalog.SortAndFilters.CatalogSort,
		catalogSortAggregation = p23.AvatarExperience.Catalog.SortAndFilters.CatalogSortAggregation,
		creatorFilter = p23.AvatarExperience.Catalog.SortAndFilters.CreatorFilter,
		salesTypeFilter = p23.AvatarExperience.Catalog.SortAndFilters.SalesTypeFilter,
		unavailableItemFilter = p23.AvatarExperience.Catalog.SortAndFilters.UnavailableItemFilter,
		wearTimeFilter = p23.AvatarExperience.Catalog.SortAndFilters.WearTimeFilter,
		searchParameters = p23.SearchesParameters,
		searchTime = p23.SearchTimes and p23.SearchTimes[v147] or nil,
		searchUuid = v147,
		widgetFetchTime = p23.AvatarExperience.Common.Widgets.WidgetInfo.FetchTime,
		externalNavigationRequest = if not FFlagAXEnableCatalogCreatorHttpLink then nil else p23.AvatarExperience.ExternalNavigationRequest,
		isRecentMarketplaceUser = v149,
		filterCount = if not FFlagAXPassScreenSizeToWidgetApi then nil else selectFilterCount(p23)
	}
end, function(p25) --[[ mapDispatchToProps ]] -- line: 915
	-- upvalues: SetSearchType (copy), SetSearchParameters (copy), FetchCatalogSearchWithSponsoredItems (copy), FetchWidgetInfo (copy), RemoveSearchInCatalog (copy), ClearSelectedTopics (copy), FFlagAXResetAnalyticsMetadataOnFilterReset (copy), ResetSortAndFiltersThunk (copy), ResetSortAndFilters (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), CatalogTilesLatencyTracker (copy)
	return {
		setSearchType = function(p26, p27) --[[ setSearchType ]] -- line: 917
			-- upvalues: p25 (copy), SetSearchType (copy)
			return p25(SetSearchType(p26, p27))
		end,
		setSearchParameters = function(p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38) --[[ setSearchParameters ]] -- line: 921
			-- upvalues: p25 (copy), SetSearchParameters (copy)
			return p25(SetSearchParameters(p28, {
				categoryInfo = p29,
				catalogSort = p30,
				catalogSortAggregation = p31,
				minPrice = p32,
				maxPrice = p33,
				selectedTopics = p34,
				creatorFilter = p35,
				salesTypeFilter = p36,
				unavailableItemFilter = p37,
				wearTimeFilter = p38
			}))
		end,
		dispatchSearch = function(p39, p40, p41) --[[ dispatchSearch ]] -- line: 948
			-- upvalues: p25 (copy), FetchCatalogSearchWithSponsoredItems (copy)
			return p25(FetchCatalogSearchWithSponsoredItems(p39, {
				searchUuid = p40,
				categoryInfo = p41,
				recordSearchTime = true
			}))
		end,
		fetchWidgetInfo = function(p42, p43, p44) --[[ fetchWidgetInfo ]] -- line: 956
			-- upvalues: p25 (copy), FetchWidgetInfo (copy)
			return p25(FetchWidgetInfo(p42, p43, p44))
		end,
		dispatchRemoveSearch = function(p45) --[[ dispatchRemoveSearch ]] -- line: 960
			-- upvalues: p25 (copy), RemoveSearchInCatalog (copy)
			p25(RemoveSearchInCatalog(p45))
		end,
		clearSelectedTopics = function() --[[ clearSelectedTopics ]] -- line: 964
			-- upvalues: p25 (copy), ClearSelectedTopics (copy)
			p25(ClearSelectedTopics())
		end,
		resetSortAndFilters = function() --[[ resetSortAndFilters ]] -- line: 968
			-- upvalues: FFlagAXResetAnalyticsMetadataOnFilterReset (copy), p25 (copy), ResetSortAndFiltersThunk (copy), ResetSortAndFilters (copy)
			if FFlagAXResetAnalyticsMetadataOnFilterReset then
				p25(ResetSortAndFiltersThunk())

				return
			end

			p25(ResetSortAndFilters())
		end,
		dispatchCatalogTilesLatencyStartTracker = if not GetFFlagEnableCatalogTileLoadingLatency() then nil else function(p46) -- line: 977
			-- upvalues: p25 (copy), CatalogTilesLatencyTracker (copy)
			p25(CatalogTilesLatencyTracker.StartTracking(p46))
		end
	}
end)(v50), PageObjectManagerContext.Consumer, "pageObjectManager")))))
local u86 = RoactServices.connect({
	networking = RoactNetworking,
	catalogAnalytics = Analytics
})(v85)

if AXPrefetchMarketplaceIXP.isEnabled() or FFlagAXUnifiedMarketplaceResultsFetcher or FFlagAXCatalogCategoriesStore or FFlagAXPassScreenSizeToWidgetApi then
	return function(p47) --[[ NavigationItemsViewWrapper ]] -- line: 1000
		-- upvalues: AXPrefetchMarketplaceIXP (copy), IxpUtils (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), useMarketplaceResultsFetcher (copy), FFlagAXPrefetchOnlyWithinTTL (copy), FFlagAXMigrateAllTabToSduiDev (copy), useDispatchPendingCatalogDeepLink (copy), useGetSelectedCategoryAndSubcategoryId (copy), useMarketplaceResultsFetcherSdui (copy), Constants2 (copy), useResultsAreSduiEnabled (copy), FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesStore (copy), useSignalState (copy), FFlagAXPassScreenSizeToWidgetApi (copy), getAXMarketplaceWidgetStore (copy), SignalsReact (copy), Roact (copy), u86 (ref)
		local v152 = if not AXPrefetchMarketplaceIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser)
		local v153 = if not AXPrefetchMarketplaceIXP.isEnabled() and not FFlagAXUnifiedMarketplaceResultsFetcher then nil else useMarketplaceResultsFetcher()
		local v154 = table.clone(p47)

		if (v152 or FFlagAXUnifiedMarketplaceResultsFetcher) and v153 then
			v154.hasPrefetchedMarketplace = v153.hasFetched
			v154.isPrefetchingMarketplace = v153.isFetching
			v154.fetchMarketplace = v153.fetchMarketplace
			v154.fetchedMarketplaceTimestamp = if not FFlagAXPrefetchOnlyWithinTTL then nil else v153.fetchedMarketplaceTimestamp
		end

		if FFlagAXMigrateAllTabToSduiDev then
			useDispatchPendingCatalogDeepLink()

			local v155, _ = useGetSelectedCategoryAndSubcategoryId()
			local v157 = useMarketplaceResultsFetcherSdui({
				categoryId = v155 or Constants2.DefaultCatalogCategoryId
			})

			if useResultsAreSduiEnabled() then
				v154.hasPrefetchedMarketplace = v157.hasFetched
				v154.isPrefetchingMarketplace = v157.isFetching
				v154.fetchedMarketplaceTimestamp = v157.fetchedMarketplaceTimestamp
				v154.fetchMarketplace = v157.fetchMarketplace
			end
		end

		if FFlagAXCatalogCategoriesStore then
			local v158 = GetCatalogCategoriesStore.getCatalogSelectionStore()
			local v159 = useSignalState(v158.selectedCategoryId)
			local v160 = useSignalState(v158.selectedSubcategoryId)
			local v161 = useSignalState(v158.selectedCategoryInfo)

			v154.categoryId = v159
			v154.subcategoryId = v160
			v154.categoryInfo = v161
		end

		if FFlagAXPassScreenSizeToWidgetApi then
			local v162 = getAXMarketplaceWidgetStore(false)

			v154.screenSize = SignalsReact.useSignalState(v162.getDebouncedScreenSize)
		end

		return Roact.createElement(u86, v154)
	end
end

return u86
