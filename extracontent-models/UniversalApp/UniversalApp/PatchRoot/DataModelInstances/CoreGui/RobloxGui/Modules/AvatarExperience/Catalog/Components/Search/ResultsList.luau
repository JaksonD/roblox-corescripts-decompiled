local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local CollectionService = game:GetService("CollectionService")
local IXPService = game:GetService("IXPService")
local Modules = CoreGui.RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local SetCurrentToastMessage = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local Focusable = RoactGamepad.Focusable
local UIBlox = require(CorePackages.Packages.UIBlox)
local EmptyState = UIBlox.App.Indicator.EmptyState
local withStyle = UIBlox.Style.withStyle
local Promise = require(CorePackages.Packages.Promise)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local t = require(CorePackages.Packages.t)
local FitTextLabel = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Cryo = require(CorePackages.Packages.Cryo)
local mutedError = require(Modules.LuaApp.mutedError)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local withAdaptiveScrolling = AvatarExperienceCommon.Hooks.withAdaptiveScrolling
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local getTryOnItemReducerKey = AvatarExperienceCommon.Utils.getTryOnItemReducerKey
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local useSignalState = SignalsReact.useSignalState
local useFocusGuiObject = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local CatalogTilesLatencyTracker = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)

require(Modules.AvatarExperience.Catalog.Reducers.SearchCategories)

local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local AvatarRoute = AvatarExperienceNavigation.AvatarRoute.AvatarRoute
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local RetrievalStatus = require(Modules.LuaApp.Enum.RetrievalStatus)
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local tutils = require(CorePackages.Packages.tutils)
local withNavigation = require(CorePackages.Packages.RoactNavigation).withNavigation
local withAvatarRoute = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local DeepLinkUtils = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local ItemData = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local Constants2 = require(Modules.LuaApp.Constants)
local Analytics = require(Modules.AvatarExperience.Common.Services.Analytics)
local Analytics2 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ApiFetchCatalogSearch = require(Modules.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch)
local FetchAssetOrBundleInfo = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local ToggleTryOnThunk = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local FetchDataWithErrorToasts = require(Modules.LuaApp.Thunks.FetchDataWithErrorToasts)
local SignalConnection = require(Modules.LuaApp.Components.SignalConnection)
local withNamedRefs = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local WidgetList = require(Modules.AvatarExperience.Common.Components.WidgetList)
local selectIsFullView = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local selectFilterCount = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local getUseSelectorDeepEquals = AvatarExperienceCommon.Utils.getUseSelectorDeepEquals
local CatalogSduiFeedEntryPoint = AvatarExperienceCatalog.Components.CatalogSduiFeedEntryPoint
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)

require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)

local FilterUtils = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local ResultsListTopPanel = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsListTopPanel)
local CatalogResultListNavigationContainer = require(Modules.AvatarExperience.Catalog.Components.Search.CatalogResultListNavigation.CatalogResultListNavigationContainer)
local FFlagAXMigrateCatalogResultListNavigationToMVVM = AvatarExperienceFlags.FFlagAXMigrateCatalogResultListNavigationToMVVM
local ResultsListListHeader = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsListListHeader)
local WidgetConstants = AvatarExperienceCatalog.WidgetConstants
local Stores = require(Modules.AvatarExperience.Common.Components.WidgetList.Stores)
local AvatarExperienceScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector
local CatalogCategories = AvatarExperienceCommon.Enums.CatalogCategories
local TagBasedImpressionsDetector = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector
local useUnifiedEventImpressionsReporter = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter
local sendUnifiedEventLog = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLog
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local useAnimatedVisibility = AvatarExperienceCommon.Stores.AnimatedVisibilityStore.useAnimatedVisibility
local getShouldPageUseWidgetOnlyFetcher = AvatarExperienceCatalog.Utils.getShouldPageUseWidgetOnlyFetcher
local getAXMarketplaceWidgetStore = AvatarExperienceCatalog.Stores.getAXMarketplaceWidgetStore
local CartIdService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService
local FStringAXImpressionsEventName = require(Modules.AvatarExperience.Flags.FStringAXImpressionsEventName)
local SetResultsListFocusedWidget = require(Modules.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget)
local ClearResultsListFocusedWidget = require(Modules.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget)
local EquippedDeepLinkCatalogItem = require(Modules.AvatarExperience.Catalog.Actions.EquippedDeepLinkCatalogItem)
local ClearTryOns = require(Modules.AvatarExperience.Common.Actions.ClearTryOns)
local v88 = game:DefineFastFlag("AXFixResultListCrash", false)
local Constants3 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableCatalogTileLoadingLatency = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local v91 = game:DefineFastFlag("AXFixFlashingNoItemsFound", false)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlags.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXMigrateMainNavigationInputBindings = AvatarExperienceFlags.FFlagAXMigrateMainNavigationInputBindings
local FFlagAXItemDetailsIxpExposure = AvatarExperienceFlags.FFlagAXItemDetailsIxpExposure
local OrganicEventImpressionsReporter = require(Modules.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local useResultsListFocusNavigationBindings = require(script.Parent.useResultsListFocusNavigationBindings)
local useResultsAreSduiEnabled = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useResultsAreSduiEnabled)
local FFlagAXFixCatalogRefreshRendering = AvatarExperienceFlags.FFlagAXFixCatalogRefreshRendering
local FFlagUpdateNoInternetConnectionText = AvatarExperienceFlags.FFlagUpdateNoInternetConnectionText
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXAdaptiveScrollingFixForward = AvatarExperienceFlags.FFlagAXAdaptiveScrollingFixForward
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlags.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXHandleLooksWidgetCategories = AvatarExperienceFlags.FFlagAXHandleLooksWidgetCategories
local FFlagAXLooksWidgetContextForOrganicContent = AvatarExperienceFlags.FFlagAXLooksWidgetContextForOrganicContent
local v107 = FFlagAXCatalogCategoriesStore and game:DefineFastFlag("AXHidePillBarCheckSubcategory", false)
local FFlagAXHideMenuOnScroll = AvatarExperienceFlags.FFlagAXHideMenuOnScroll
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlags.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local FFlagAXReduceResultsListRerendersOnItemInfos = AvatarExperienceFlags.FFlagAXReduceResultsListRerendersOnItemInfos
local FFlagAXEnableTTIViaModule = AvatarExperienceFlags.FFlagAXEnableTTIViaModule
local FFlagAXEnableMilestoneTrackingForAvatarExperience = AvatarExperienceFlags.FFlagAXEnableMilestoneTrackingForAvatarExperience
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local AvatarExperienceTTIPerformance = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformance.TTIPerformanceManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformance.OrganicTTIMilestoneManager
local FFlagAXFixWidgetOnlyTabNoItemsFound = AvatarExperienceFlags.FFlagAXFixWidgetOnlyTabNoItemsFound
local FFlagAXShowCategoriesWhenNetworkFails = AvatarExperienceFlags.FFlagAXShowCategoriesWhenNetworkFails
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev
local v121 = game:DefineFastFlag("AXSkipTryOnHoistForLooks", false)

local function getTopMenuHeight(p1) -- line: 170
	return UDim2.fromOffset(0, p1)
end
local function getFeedSize(p2) -- line: 174
	return UDim2.new(1, 0, 1, -p2)
end

local v124 = Roact.PureComponent:extend("ResultsList")

v124.defaultProps = {
	navBarSizeY = 0
}
v124.validateProps = t.strictInterface({
	analyticsContext = t.string,
	layoutOrder = t.optional(t.number),
	fromSearch = t.boolean,
	itemsHeader = t.optional(t.table),
	frameRef = t.optional(t.table),
	scrollingFrameRef = t.optional(t.table),
	onRetry = t.callback,
	searchUuid = t.string,
	navBarSizeY = t.optional(t.number),
	navBarRef = t.optional(t.table),
	backToTopSignal = t.optional(t.table),
	multiTryOnBottomBarRef = t.optional(t.table),
	categoryInfo = t.optional(t.table),
	onCategoryOrSubcategoryChange = t.optional(t.callback),
	onCategoryOrSubcategoryChangeById = t.optional(t.callback),
	itemDetailsPeekViewRefs = t.table,
	showCloseIcon = t.optional(t.boolean),
	onCloseFocusedWidget = t.optional(t.callback),
	NextSelectionUp = t.optional(t.table),
	NextSelectionRight = t.optional(t.table),
	searchParameters = t.optional(t.table),
	searchInCatalog = t.optional(t.table),
	dataStatus = t.string,
	currentPage = t.optional(t.table),
	tryOnItems = t.optional(t.table),
	tryOnLookId = if not v121 then nil else t.optional(t.string),
	fullView = t.optional(t.userdata),
	focusedWidget = t.optional(t.table),
	hideTopBar = t.optional(t.boolean),
	widgetRequestId = t.optional(t.string),
	selectedCategoryId = t.optional(t.string),
	selectedSubcategoryId = t.optional(t.string),
	selectedSearchCategoryId = t.optional(t.string),
	selectedSearchSubcategoryId = t.optional(t.string),
	selectedCategory = if not FFlagAXCatalogCategoriesStore then nil else t.optional(t.table),
	selectedSearchCategory = if not FFlagAXCatalogCategoriesStore then nil else t.optional(t.table),
	selectedSearchSubcategory = if not v107 then nil else t.optional(t.table),
	widgetDataStatus = t.optional(t.string),
	hasWidgets = t.boolean,
	sortAndFilters = t.optional(t.table),
	externalNavigationRequestParams = t.table,
	itemInfos = t.table,
	analyticsMetadata = t.optional(t.table),
	filterCount = if not FFlagAXMoveAllTabToWidgetOnly then nil else t.number,
	dispatchLoadMore = t.callback,
	dispatchSetResultsListFocusedWidget = t.callback,
	dispatchClearResultsListFocusedWidget = t.callback,
	dispatchCatalogTilesLatencyStartTracker = if not GetFFlagEnableCatalogTileLoadingLatency() then nil else t.callback,
	fetchItemData = t.callback,
	handleDeepLinkEquipError = t.callback,
	equipCatalogDeepLinkItem = t.callback,
	catalogAnalytics = t.table,
	axAnalytics = t.table,
	networking = t.callback,
	avatarRoute = AvatarRoute.Interface,
	namedRefs = t.table,
	navigation = t.table,
	adaptiveScrolling = t.optional(t.any),
	visibilityRatioBinding = if not FFlagAXHideMenuOnScroll then nil else t.optional(t.table),
	focusNavigationBindingsRef = if not FFlagAXMigrateMainNavigationInputBindings then nil else t.callback,
	tagBasedImpressionsDetectorExtensions = if not FFlagAXItemDetailsIxpExposure then nil else t.table,
	hasProcessedMarketplaceFetcher = if not FFlagAXMoveAllTabToWidgetOnly then nil else t.boolean,
	isFetchingMarketplaceError = if not FFlagAXMoveAllTabToWidgetOnly and not FFlagAXCatalogCategoriesSDUI then nil else t.boolean,
	shouldPageUseWidgetOnly = if not FFlagAXMoveAllTabToWidgetOnly then nil else t.boolean,
	showSduiResults = if not FFlagAXMigrateAllTabToSduiDev then nil else t.boolean,
	context = if not FFlagAXMigrateAllTabToSduiDev then nil else t.optional(t.string)
})

function v124.init(p3) -- line: 280
	-- upvalues: Roact (copy), Signal (copy), RetrievalStatus (copy), Promise (copy), v88 (copy), mutedError (copy), FilterUtils (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), FFlagAXEnableTTIViaModule (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), TTIPerformanceManager (copy), OrganicTTIMilestoneManager (copy), TimeToInteractiveTracker (copy), Constants3 (copy)
	p3.state = {
		restorePreviousChildFocus = true,
		numItemsPerRow = 0,
		navBarSizeY = 0,
		showFailedState = false
	}
	p3.lastYPosition = 0
	p3.scrollingFrameRef = p3.props.scrollingFrameRef or Roact.createRef()
	p3.navBarRef = Roact.createRef()
	p3.topPanelRef = Roact.createRef()
	p3.gridRef = Roact.createRef()
	p3.pillBarRef = Roact.createRef()
	p3.emptyStateRef = Roact.createRef()
	p3.widgetFlatListRef = Roact.createRef()
	p3.topPanelHeightBinding = nil
	p3.updateTopPanelHeightBinding = nil

	local v131, v132 = Roact.createBinding(0)

	p3.topPanelHeightBinding = v131
	p3.updateTopPanelHeightBinding = v132
	p3.impressionsReported = {}
	p3.itemDetailsPeekViewRefs = p3.props.itemDetailsPeekViewRefs

	function p3.onNumItemsPerRowChanged(p4) -- line: 304
		-- upvalues: p3 (copy)
		p3:setState({
			numItemsPerRow = p4
		})
	end
	function p3.onNavBarSizeChanged(p5) -- line: 310
		-- upvalues: p3 (copy)
		if p5.Y ~= p3.state.navBarSizeY then
			p3:setState({
				navBarSizeY = p5.Y
			})
		end
	end

	p3.requestImpressionsSignal = Signal.new()

	function p3.onItemsListScroll(n1: number) -- line: 320
		-- upvalues: p3 (copy)
		p3.requestImpressionsSignal:fire()

		local v290 = p3.props.adaptiveScrolling or {}

		if v290.onCanvasYChanged then
			v290.onCanvasYChanged(n1)
		end
	end
	function p3.loadMore() -- line: 329
		-- upvalues: p3 (copy), RetrievalStatus (copy), Promise (copy), v88 (copy), mutedError (copy)
		if p3.props.dataStatus == RetrievalStatus.Fetching then
			p3.retryLoadMore = true

			return Promise.resolve("Currently fetching")
		end

		local catalogAnalytics = p3.props.catalogAnalytics
		local searchUuid = p3.props.searchUuid
		local searchInCatalog = p3.props.searchInCatalog
		local searchParameters = p3.props.searchParameters
		local dispatchLoadMore = p3.props.dispatchLoadMore

		if v88 and not searchInCatalog then
			searchInCatalog = {}
			mutedError(string.format("ResultsList: searchInCatalog is nil; searchUuid: %s", (tostring(searchUuid))))
		end

		local v296 = searchParameters and searchParameters.categoryInfo or nil

		return dispatchLoadMore(catalogAnalytics, searchInCatalog.keyword, searchUuid, v296, p3.props.networking)
	end
	function p3.onFocusGained() -- line: 361
		-- upvalues: p3 (copy)
		p3:setState({
			restorePreviousChildFocus = true
		})
	end
	function p3.scrollBackToTop() -- line: 367
		-- upvalues: p3 (copy)
		local current = p3.props.scrollingFrameRef.current

		if current then
			current:ScrollToTop()
		end
	end
	function p3.setFocusedWidget(p6) -- line: 374
		-- upvalues: p3 (copy)
		local v299 = if not p6 or not p6.template then nil else p6.template.title
		local v300 = (not p6 or not p6.template) and "" or p6.template.localizedTitle
		local v301 = (not p6 or not p6.template) and "" or p6.template.localizedDescription
		local v302 = if not p6 or not p6.template then nil else p6.template.description
		local v303 = if not p6 or not p6.template then nil else p6.template.tooltip
		local v304 = (not p6 or not p6.template) and "" or p6.template.localizedTooltip
		local t1 = {
			title = v299,
			localizedTitle = v300,
			description = v302,
			localizedDescription = v301,
			tooltip = v303,
			localizedTooltip = v304
		}

		p3.props.dispatchSetResultsListFocusedWidget(p3.props.searchUuid, p6.id, t1)
	end
	function p3.clearFocusedWidget() -- line: 399
		-- upvalues: p3 (copy)
		p3.props.dispatchClearResultsListFocusedWidget(p3.props.searchUuid)
	end
	function p3.shouldScrollBackToTopOfList(t2: {[any]: any}) -- line: 403
		-- upvalues: FilterUtils (copy)
		local searchChanged = t2.searchChanged
		local oldSortsAndFilter = t2.oldSortsAndFilter
		local newSortsAndFilter = t2.newSortsAndFilter

		return searchChanged or not FilterUtils.areSortAndFiltersEqual(oldSortsAndFilter, newSortsAndFilter)
	end

	if GetFFlagEnableCatalogTileLoadingLatency() then
		if FFlagAXEnableTTIViaModule then
			if FFlagAXEnableMilestoneTrackingForAvatarExperience then
				TTIPerformanceManager.Surface.Marketplace.Root.startTracking()

				if FFlagAXEnableMilestoneTrackingForAvatarExperience and OrganicTTIMilestoneManager then
					OrganicTTIMilestoneManager.L2.primaryDataStarted()
					OrganicTTIMilestoneManager.L3.networkFetch()
				end
			else
				TimeToInteractiveTracker.trackStart(Constants3.Counter.PREFIX .. Constants3.Counter.Latency.Organic.Tiles)
				TimeToInteractiveTracker.trackStart(Constants3.Counter.PREFIX .. Constants3.Counter.Latency.Organic.Thumbnails)
				TimeToInteractiveTracker.trackStart(Constants3.Counter.PREFIX .. Constants3.Counter.Latency.Widget.Tiles)
				TimeToInteractiveTracker.trackStart(Constants3.Counter.PREFIX .. Constants3.Counter.Latency.Widget.Thumbnails)
			end
		end

		p3.props.dispatchCatalogTilesLatencyStartTracker(p3.props.searchUuid)
	end
end
function v124.getNextSelectionRight(p7, p8, p9) -- line: 444
	-- upvalues: AvatarScreen (copy), Cryo (copy)
	local NextSelectionRight = p7.props.NextSelectionRight

	if p8 == AvatarScreen.ItemDetails and p9 then
		return p7.itemDetailsPeekViewRefs[p9]
	end

	if p8 == AvatarScreen.LookDetails then
		return p7.props.namedRefs[AvatarScreen.LookDetails]
	end

	if p7.props.tryOnItems and not Cryo.isEmpty(p7.props.tryOnItems) and p8 ~= AvatarScreen.SortAndFilters and p7.props.multiTryOnBottomBarRef and p7.props.multiTryOnBottomBarRef:getValue() ~= nil then
		NextSelectionRight = p7.props.multiTryOnBottomBarRef
	end

	return NextSelectionRight
end
function v124.renderResultsList(p10, p11, p12) -- line: 466
	-- upvalues: FFlagAXMoveAllTabToWidgetOnly (copy), RetrievalStatus (copy), CatalogConstants (copy), FFlagAXFixWidgetOnlyTabNoItemsFound (copy), AvatarScreen (copy), Constants2 (copy), v91 (copy), FFlagAXCatalogCategoriesStore (copy), CatalogUtils (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), CatalogCategories (copy), FFlagAXHandleLooksWidgetCategories (copy), FFlagAXLooksWidgetContextForOrganicContent (copy), withLocalization (copy), ImpressionEnums (copy), Roact (copy), OrganicEventImpressionsReporter (copy), FStringAXImpressionsEventName (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), AvatarExperienceScreenSizeImpressionsDetector (copy), WidgetConstants (copy), IXPService (copy), CollectionService (copy), v107 (copy), FFlagAXHideMenuOnScroll (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateMainNavigationInputBindings (copy), RoactGamepad (copy), SignalConnection (copy), FFlagAXMigrateCatalogResultListNavigationToMVVM (copy), CatalogResultListNavigationContainer (copy), ResultsListTopPanel (copy), FFlagAXMigrateAllTabToSduiDev (copy), React (copy), CatalogSduiFeedEntryPoint (copy), getFeedSize (copy), getTopMenuHeight (copy), FFlagAXShowCategoriesWhenNetworkFails (copy), EmptyState (copy), WidgetList (copy), FFlagAXAdaptiveScrollingFixForward (copy), ResultsListListHeader (copy), FitTextLabel (copy), TagBasedImpressionsDetector (copy)
	local searchInCatalog = p10.props.searchInCatalog
	local dataStatus = p10.props.dataStatus
	local v142 = if not FFlagAXMoveAllTabToWidgetOnly then nil else p10.props.shouldPageUseWidgetOnly
	local v143 = if not FFlagAXMoveAllTabToWidgetOnly then nil else v142 and p10.props.hasProcessedMarketplaceFetcher
	local key = p10.props.navigation.state.key
	local avatarRoute = p10.props.avatarRoute
	local name = avatarRoute.current.name
	local key2 = avatarRoute.current.key
	local entries = p10.state.entries
	local v149 = entries and #entries ~= 0
	local hasWidgets = p10.props.hasWidgets
	local widgetDataStatus = p10.props.widgetDataStatus
	local v152 = dataStatus == RetrievalStatus.Done and (not widgetDataStatus or widgetDataStatus == RetrievalStatus.Done)
	local u153 = entries and #entries or CatalogConstants.PageFetchLimit
	local u154 = not v152 or (v149 or (p10.props.hasWidgets or FFlagAXMoveAllTabToWidgetOnly and (v143 and p10.props.hasProcessedMarketplaceFetcher)))
	local v155 = nil

	if FFlagAXFixWidgetOnlyTabNoItemsFound then
		if v143 then
			v152 = p10.props.hasProcessedMarketplaceFetcher
		end

		v155 = v143 and (p10.props.hasProcessedMarketplaceFetcher and hasWidgets)
		u154 = not v152 or (v149 or (p10.props.hasWidgets or v155))
	end

	local v156 = searchInCatalog and searchInCatalog.hasMoreEntries or nil
	local v157 = v149 and v156
	local v158 = v149 and not v157 or (FFlagAXMoveAllTabToWidgetOnly and v143 or FFlagAXFixWidgetOnlyTabNoItemsFound and v155)
	local p11Font = p11.Font
	local BodyFont = p11Font.Body.Font
	local v161 = p11Font.BaseSize * p11Font.Body.RelativeSize
	local Theme = p11.Theme
	local TextMutedColor = Theme.TextMuted.Color
	local TextMutedTransparency = Theme.TextMuted.Transparency
	local v165 = name ~= AvatarScreen.ItemDetails and p12 ~= nil
	local u166 = nil
	local v167 = Constants2.ImpressionsEvents.AvatarItems .. (not key and "" or string.gsub(key, "[-{}]", ""))
	local u168 = not u154 and not hasWidgets

	if v91 and (not FFlagAXFixWidgetOnlyTabNoItemsFound or not v143) then
		u168 = u168 and (entries and #entries == 0)
	end

	local u169 = nil
	local selectedCategory, selectedSearchCategory

	if FFlagAXCatalogCategoriesStore then
		selectedCategory = p10.props.selectedCategory
		selectedSearchCategory = p10.props.selectedSearchCategory
	else
		selectedCategory = CatalogUtils.getCategoryId(p10.props.selectedCategoryId)
		selectedSearchCategory = CatalogUtils.getCategoryId(p10.props.selectedSearchCategoryId)
	end

	local v172 = ((if not FFlagAXRemoveCatalogCategoryNavKey then selectedCategory.NavigationKey == CatalogCategories.Avatars else selectedCategory.Id == CatalogCategories.Avatars:rawValue())) and avatarRoute.opaque.name == AvatarScreen.Catalog
	local v173 = ((if not FFlagAXRemoveCatalogCategoryNavKey then selectedSearchCategory.NavigationKey == CatalogCategories.Avatars else selectedSearchCategory.Id == CatalogCategories.Avatars:rawValue())) and avatarRoute.opaque.name == AvatarScreen.CatalogSearch
	local v174 = nil
	local v175 = nil

	if FFlagAXHandleLooksWidgetCategories then
		if avatarRoute.opaque.name == AvatarScreen.Catalog then
			if FFlagAXLooksWidgetContextForOrganicContent then
				if selectedCategory.LooksWidgetContextForOrganicContent ~= nil then
					v174 = true
				end
			elseif selectedCategory.ShowLooksAsOrganicContent ~= nil then
				v174 = true
			end
		end

		if avatarRoute.opaque.name == AvatarScreen.CatalogSearch then
			if FFlagAXLooksWidgetContextForOrganicContent then
				if selectedSearchCategory.LooksWidgetContextForOrganicContent ~= nil then
					v175 = true
				end
			elseif selectedSearchCategory.ShowLooksAsOrganicContent ~= nil then
				v175 = true
			end
		end
	end

	if (FFlagAXHandleLooksWidgetCategories and (v174 or v175) or not FFlagAXHandleLooksWidgetCategories and (v172 or v173)) and (entries and #entries == 0 and v156) then
		u169 = true
		u168 = false
		u153 = 0
	end

	local active = p10.props.focusedWidget.active
	local title = p10.props.focusedWidget.title
	local id = p10.props.focusedWidget.id
	local v179 = if not active then nil else title
	local t3 = {}
	local u181 = v158 or active

	return withLocalization({
		noItemsFound = "Feature.Catalog.Response.NoItemsFound",
		focusedWidgetTitle = if v179 == "" then nil else v179,
		emptyText = "Feature.DisplayName.ErrorMessage.SomethingWentWrong"
	})(function(p13) -- line: 614
		-- upvalues: p10 (copy), name (copy), key2 (copy), ImpressionEnums (copy), u166 (ref), Roact (copy), OrganicEventImpressionsReporter (copy), key (copy), FStringAXImpressionsEventName (copy), v167 (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), AvatarExperienceScreenSizeImpressionsDetector (copy), WidgetConstants (copy), t3 (copy), IXPService (copy), CollectionService (copy), FFlagAXCatalogCategoriesStore (copy), CatalogUtils (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), CatalogCategories (copy), FFlagAXHandleLooksWidgetCategories (copy), v107 (copy), FFlagAXLooksWidgetContextForOrganicContent (copy), FFlagAXHideMenuOnScroll (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateMainNavigationInputBindings (copy), v165 (copy), RoactGamepad (copy), p12 (copy), SignalConnection (copy), FFlagAXMigrateCatalogResultListNavigationToMVVM (copy), CatalogResultListNavigationContainer (copy), ResultsListTopPanel (copy), v149 (copy), FFlagAXMigrateAllTabToSduiDev (copy), React (copy), CatalogSduiFeedEntryPoint (copy), getFeedSize (copy), getTopMenuHeight (copy), FFlagAXShowCategoriesWhenNetworkFails (copy), EmptyState (copy), WidgetList (copy), entries (copy), u154 (ref), v157 (copy), u181 (ref), active (copy), id (copy), u153 (ref), FFlagAXAdaptiveScrollingFixForward (copy), ResultsListListHeader (copy), u168 (ref), FitTextLabel (copy), p11 (copy), v161 (copy), TextMutedColor (copy), TextMutedTransparency (copy), BodyFont (copy), u169 (ref), TagBasedImpressionsDetector (copy)
		local v311 = p10:getNextSelectionRight(name, key2)
		local v312 = if not p10.props.fromSearch then ImpressionEnums.MarketplaceSurfaceType.HOMEPAGE else ImpressionEnums.MarketplaceSurfaceType.SEARCH

		u166 = Roact.createElement(OrganicEventImpressionsReporter, {
			parentRef = p10.gridRef,
			pageFilter = function() --[[ pageFilter ]] -- line: 621
				-- upvalues: key (copy), key2 (copy)
				return key == key2
			end,
			onRequestImpressionsSignal = p10.requestImpressionsSignal,
			eventContext = FStringAXImpressionsEventName(),
			eventName = "marketplaceOrganicFELog",
			requestId = p10.props.widgetRequestId,
			impressionsTag = v167,
			impressionsSchema = "defaultItem",
			searchUuid = if not GetFFlagEnableCatalogTileLoadingLatency() then nil else p10.props.searchUuid,
			surface = v312,
			analyticsMetadata = p10.props.analyticsMetadata
		})

		local v313 = Roact.createElement(AvatarExperienceScreenSizeImpressionsDetector, {
			parentRef = p10.gridRef,
			pageFilter = function() --[[ pageFilter ]] -- line: 637
				-- upvalues: key (copy), key2 (copy)
				return key == key2
			end,
			onRequestImpressionsSignal = p10.requestImpressionsSignal,
			filterImpressionFunc = function(p14) --[[ filterImpressionFunc ]] -- line: 641
				-- upvalues: WidgetConstants (copy), t3 (copy)
				local WidgetConstantsWidgetExposureMetadataAttributeKey = p14:GetAttribute(WidgetConstants.WidgetExposureMetadata.AttributeKey)

				return WidgetConstantsWidgetExposureMetadataAttributeKey and not t3[WidgetConstantsWidgetExposureMetadataAttributeKey]
			end,
			onImpressionsDetected = function(p15) --[[ onImpressionsDetected ]] -- line: 645
				-- upvalues: WidgetConstants (copy), t3 (copy), IXPService (copy), p10 (copy)
				for _, v369 in p15 do
					local WidgetConstantsWidgetExposureMetadataAttributeKey = v369:GetAttribute(WidgetConstants.WidgetExposureMetadata.AttributeKey)

					t3[WidgetConstantsWidgetExposureMetadataAttributeKey] = true
					IXPService:LogUserLayerExposure(WidgetConstantsWidgetExposureMetadataAttributeKey)

					local impressionsReported = p10.impressionsReported

					if not impressionsReported[v369.Name] then
						p10.props.catalogAnalytics.widgetInteractionV2({}, WidgetConstants.ActionType.IMPRESSION)
						impressionsReported[v369.Name] = true
					end
				end
			end,
			collectObjectsFunc = function(_) --[[ collectObjectsFunc ]] -- line: 660
				-- upvalues: CollectionService (copy), WidgetConstants (copy)
				return CollectionService:GetTagged(WidgetConstants.WidgetExposureMetadata.TagName)
			end
		})
		local frameRef = p10.props.frameRef
		local backToTopSignal = p10.props.backToTopSignal
		local v316 = p10.props.adaptiveScrolling or {}
		local n2 = 0

		if p10.props.multiTryOnBottomBarRef then
			local v318 = p10.props.multiTryOnBottomBarRef:getValue()

			n2 = not v318 and 0 or v318.AbsoluteSize.Y
		end

		local routeName = p10.props.navigation.state.routeName
		local v320 = p10.props.namedRefs[routeName .. "TopPanel"]
		local v321 = if not FFlagAXCatalogCategoriesStore then CatalogUtils.getCategoryId(p10.props.selectedSearchCategoryId) else p10.props.selectedSearchCategory
		local v322 = if not FFlagAXRemoveCatalogCategoryNavKey then v321.NavigationKey == CatalogCategories.Avatars else v321.Id == CatalogCategories.Avatars:rawValue()

		if FFlagAXHandleLooksWidgetCategories then
			if v107 then
				local v323 = if not p10.props.selectedSearchSubcategory then v321 else p10.props.selectedSearchSubcategory

				v322 = if not FFlagAXLooksWidgetContextForOrganicContent then v323.ShowLooksAsOrganicContent ~= nil else v323.LooksWidgetContextForOrganicContent ~= nil
			else
				v322 = if not FFlagAXLooksWidgetContextForOrganicContent then v321.ShowLooksAsOrganicContent ~= nil else v321.LooksWidgetContextForOrganicContent ~= nil
			end
		end

		local v324 = if not FFlagAXHideMenuOnScroll or not p10.props.visibilityRatioBinding then nil else Roact.joinBindings({
			visibility = p10.props.visibilityRatioBinding,
			height = p10.topPanelHeightBinding
		}):map(function(t4: {[any]: any}) -- line: 716
			local v374 = math.floor((1 - t4.visibility) * -t4.height)

			return UDim2.fromOffset(0, v374)
		end)
		local v325 = if not FFlagAXHideMenuOnScroll or not p10.props.visibilityRatioBinding then nil else Roact.joinBindings({
			visibility = p10.props.visibilityRatioBinding,
			height = p10.topPanelHeightBinding
		}):map(function(t5: {[any]: any}) -- line: 726
			local v376 = t5.height * t5.visibility

			return UDim2.new(1, 0, 1, -v376)
		end)
		local v326 = if not FFlagAXHideMenuOnScroll or not p10.props.visibilityRatioBinding then nil else Roact.joinBindings({
			visibility = p10.props.visibilityRatioBinding,
			height = p10.topPanelHeightBinding
		}):map(function(t6: {[any]: any}) -- line: 736
			local v378 = t6.height * t6.visibility

			return UDim2.fromOffset(0, v378)
		end)

		return Roact.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ClipsDescendants = true,
			LayoutOrder = p10.props.layoutOrder,
			[Roact.Ref] = frameRef,
			defaultChild = p10.topPanelRef,
			NextSelectionUp = p10.props.NextSelectionUp,
			restorePreviousChildFocus = p10.state.restorePreviousChildFocus,
			inputBindings = if not FFlagAXMigrateAXToGlobalAutofocus and not FFlagAXMigrateMainNavigationInputBindings then v165 and {
				NavUp = RoactGamepad.Input.onBegin(Enum.KeyCode.ButtonB, function() -- line: 755
					-- upvalues: p12 (copy), p10 (copy)
					p12.moveFocusTo(p10.props.NextSelectionUp)
				end)
			} or nil else nil
		}, {
			BackToTopSignal = if not backToTopSignal then nil else Roact.createElement(SignalConnection, {
				signal = backToTopSignal,
				callback = p10.scrollBackToTop
			}),
			ScrollPanel = Roact.createElement(if not FFlagAXMigrateMainNavigationInputBindings then Focusable.Frame else "Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				ClipsDescendants = true,
				[Roact.Ref] = if not FFlagAXMigrateMainNavigationInputBindings then nil else p10.props.focusNavigationBindingsRef
			}, {
				TopPanel = Roact.createElement(Focusable.Frame, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					ZIndex = 2,
					ref = v320,
					Position = if not FFlagAXHideMenuOnScroll then nil else v324
				}, Roact.createElement(if not FFlagAXMigrateCatalogResultListNavigationToMVVM then ResultsListTopPanel else CatalogResultListNavigationContainer, {
					fromSearch = p10.props.fromSearch,
					catalogAnalytics = p10.props.catalogAnalytics,
					axAnalytics = p10.props.axAnalytics,
					searchUuid = p10.props.searchUuid,
					searchInCatalog = p10.props.searchInCatalog,
					hideTopBar = p10.props.hideTopBar,
					focusedWidget = p10.props.focusedWidget,
					showCloseIcon = p10.props.showCloseIcon,
					restorePreviousChildFocus = p10.state.restorePreviousChildFocus,
					topPanelRef = p10.topPanelRef,
					gridRef = p10.gridRef,
					hasEntries = v149,
					backToTopSignal = p10.props.backToTopSignal,
					onCategoryOrSubcategoryChange = p10.props.onCategoryOrSubcategoryChange,
					onCategoryOrSubcategoryChangeById = p10.props.onCategoryOrSubcategoryChangeById,
					updateHeightBinding = p10.updateTopPanelHeightBinding,
					onCloseFocusedWidget = p10.props.onCloseFocusedWidget,
					hidePillBar = v322
				})),
				ListFrame = Roact.createElement("Frame", {
					Size = FFlagAXHideMenuOnScroll and v325 or p10.topPanelHeightBinding:map(function(p17) -- line: 818
						return UDim2.new(1, 0, 1, -p17)
					end),
					Position = FFlagAXHideMenuOnScroll and v326 or p10.topPanelHeightBinding:map(function(p18) -- line: 823
						return UDim2.fromOffset(0, p18)
					end),
					BackgroundTransparency = 1
				}, if not FFlagAXMigrateAllTabToSduiDev or not p10.props.showSduiResults then if not FFlagAXShowCategoriesWhenNetworkFails or not p10.state.showFailedState then {
					WidgetList = Roact.createElement(WidgetList.WidgetList, {
						entries = entries,
						fromSearch = p10.props.fromSearch,
						bottomBarHeight = n2,
						showingEntries = u154,
						searchUuid = p10.props.searchUuid,
						loadMore = v157 and p10.loadMore or nil,
						hasMoreRows = v157,
						shouldCreateEndOfScrollElement = u181,
						itemDetailsPeekViewRefs = p10.itemDetailsPeekViewRefs,
						gridRef = p10.gridRef,
						flatListRef = p10.widgetFlatListRef,
						onScroll = p10.onItemsListScroll,
						focusedWidget = if not active then nil else id,
						onWidgetFocusAcquired = p10.setFocusedWidget,
						onWidgetFocusReleased = p10.clearFocusedWidget,
						requestImpressionsSignal = p10.requestImpressionsSignal,
						onNumItemsPerRowChanged = p10.onNumItemsPerRowChanged,
						NextSelectionRight = v311,
						NextSelectionUp = p10.topPanelRef,
						restorePreviousChildFocus = p10.state.restorePreviousChildFocus,
						onFocusGained = not p10.state.restorePreviousChildFocus and p10.onFocusGained or nil,
						numItemsExpected = u153,
						scrollingEnabled = if not v316.scrollingEnabledBinding then FFlagAXAdaptiveScrollingFixForward and true or v316.scrollingEnabled else v316.scrollingEnabledBinding:map(function(p19) -- line: 873
							return p19
						end),
						selectedCategoryIndex = if not FFlagAXCatalogCategoriesStore then p10.props.selectedCategoryIndex else nil,
						selectedSubcategoryIndex = if not FFlagAXCatalogCategoriesStore then p10.props.selectedSubcategoryIndex else nil,
						selectedSearchCategoryIndex = if not FFlagAXCatalogCategoriesStore then p10.props.selectedSearchCategoryIndex else nil,
						selectedSearchSubcategoryIndex = if not FFlagAXCatalogCategoriesStore then p10.props.selectedSearchSubcategoryIndex else nil,
						selectedCategoryId = if not FFlagAXCatalogCategoriesStore then p10.props.selectedCategoryId else nil,
						selectedSubcategoryId = if not FFlagAXCatalogCategoriesStore then p10.props.selectedSubcategoryId else nil,
						selectedSearchCategoryId = if not FFlagAXCatalogCategoriesStore then p10.props.selectedSearchCategoryId else nil,
						selectedSearchSubcategoryId = if not FFlagAXCatalogCategoriesStore then p10.props.selectedSearchSubcategoryId else nil,
						listHeaderComponent = Roact.createElement(ResultsListListHeader),
						pillBarVisible = not v322
					}),
					NoItemsFound = u168 and Roact.createElement(FitTextLabel, {
						width = UDim.new(1, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1,
						Position = UDim2.new(0.5, 0, 0, p11.Tokens.Global.Space_400),
						Text = p13.noItemsFound,
						TextSize = v161,
						TextColor3 = TextMutedColor,
						TextTransparency = TextMutedTransparency,
						Font = BodyFont
					}),
					AvatarsTabError = u169 and Roact.createElement("Frame", {
						LayoutOrder = p10.props.layoutOrder,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1
					}, {
						EmptyState = Roact.createElement(EmptyState, {
							onActivated = p10.loadMore,
							text = p13.emptyText,
							[Roact.Ref] = p10.emptyStateRef
						})
					})
				} else {
					EmptyState = Roact.createElement(EmptyState, {
						onActivated = p10.props.onRetry,
						text = p13.emptyText,
						[Roact.Ref] = p10.emptyStateRef
					})
				} else {
					SduiResults = React.createElement(CatalogSduiFeedEntryPoint, {
						context = p10.props.context or "",
						Size = FFlagAXHideMenuOnScroll and v325 or p10.topPanelHeightBinding:map(getFeedSize),
						Position = FFlagAXHideMenuOnScroll and v326 or p10.topPanelHeightBinding:map(getTopMenuHeight)
					})
				})
			}),
			ImpressionsReporter = u166,
			WidgetImpressionsReporter = v313,
			UnifiedImpressionsReporter = Roact.createElement(TagBasedImpressionsDetector, {
				parentRef = p10.gridRef,
				pageFilter = function() --[[ pageFilter ]] -- line: 939
					-- upvalues: key (copy), key2 (copy)
					return key == key2
				end,
				requestImpressionsSignal = p10.requestImpressionsSignal,
				extensions = p10.props.tagBasedImpressionsDetectorExtensions
			})
		})
	end)
end
function v124.render(p20) -- line: 949
	-- upvalues: FFlagAXShowCategoriesWhenNetworkFails (copy), withLocalization (copy), FFlagUpdateNoInternetConnectionText (copy), Roact (copy), EmptyState (copy), withStyle (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepad (copy)
	local showFailedState = p20.state.showFailedState

	if not FFlagAXShowCategoriesWhenNetworkFails and showFailedState then
		return withLocalization({
			emptyText = not FFlagUpdateNoInternetConnectionText and "Feature.EmptyStatePage.Message.NoInternet" or "Feature.DisplayName.ErrorMessage.SomethingWentWrong"
		})(function(p21) -- line: 957
			-- upvalues: Roact (copy), p20 (copy), EmptyState (copy)
			return Roact.createElement("Frame", {
				LayoutOrder = p20.props.layoutOrder,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1
			}, {
				EmptyState = Roact.createElement(EmptyState, {
					onActivated = p20.props.onRetry,
					text = p21.emptyText,
					[Roact.Ref] = p20.emptyStateRef
				})
			})
		end)
	end

	return withStyle(function(p22) -- line: 973
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), p20 (copy), RoactGamepad (copy)
		if FFlagAXMigrateAXToGlobalAutofocus then
			return p20:renderResultsList(p22)
		end

		return RoactGamepad.withFocusController(function(p23) -- line: 977
			-- upvalues: p20 (copy), p22 (copy)
			return p20:renderResultsList(p22, p23)
		end)
	end)
end
function v124.updateItems(p24, p25) -- line: 990
	-- upvalues: FFlagAXMoveAllTabToWidgetOnly (copy), DeepLinkUtils (copy), ItemData (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), sendUnifiedEventLog (copy), CartIdService (copy), FFlagAXFixCatalogRefreshRendering (copy), Roact (copy), Cryo (copy), v121 (copy), Constants (copy), FFlagAXMISEnableMultiShopping (copy), getTryOnItemReducerKey (copy)
	local searchInCatalog = p24.props.searchInCatalog
	local v187 = searchInCatalog and searchInCatalog.items or nil
	local v188 = not not FFlagAXMoveAllTabToWidgetOnly and p24.props.shouldPageUseWidgetOnly
	local v189 = if not FFlagAXMoveAllTabToWidgetOnly then nil else v188 and p24.props.hasProcessedMarketplaceFetcher
	local u190 = if not FFlagAXMoveAllTabToWidgetOnly or not v189 then v187 else {}

	if p24.props.externalNavigationRequestParams then
		if DeepLinkUtils.newValidEquipDeepLinkExists(p24.props.externalNavigationRequestParams) then
			local v191, v192 = DeepLinkUtils.parseItemIdAndItemType(p24.props.externalNavigationRequestParams)
			local v193 = ItemData(p24.props.itemInfos, v191, v192)

			if v193 then
				local v194 = DeepLinkUtils.parseItemSubType(v192, v193)

				if FFlagAXMISEnableMultiShoppingUnifiedEvents then
					local ASSET = nil

					if v192 == "Asset" then
						ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
					elseif v192 == "Bundle" then
						ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
					end

					sendUnifiedEventLog({
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
						cartId = CartIdService.getCartId(),
						itemId = v191,
						itemType = ASSET,
						assetType = if v192 ~= "Asset" then nil else v194,
						bundleType = if v192 ~= "Asset" then v194 else nil,
						organicItemPrice = v193.priceInRobux
					})
				end

				p24.props.equipCatalogDeepLinkItem(p24.props.networking, p24.props.catalogAnalytics, v192, v194, v191, true, p24.props.avatarRoute, p24.props.navigation, p24.props.widgetAnalyticsInfo)
			elseif not p24.props.externalNavigationRequestParams.wasItemEquipped then
				p24.props.fetchItemData(p24.props.networking, p24.props.catalogAnalytics, v191, v192):catch(function() -- line: 1048
					-- upvalues: p24 (copy), v191 (copy), v192 (copy), DeepLinkUtils (copy), u190 (ref)
					p24.props.handleDeepLinkEquipError(v191, v192)
					DeepLinkUtils.removeDeepLinkEntries(u190)
				end)
			end
		end

		if p24.props.externalNavigationRequestParams.wasItemEquipped then
			local tryOnItems = p24.props.tryOnItems
			local v197 = if not FFlagAXFixCatalogRefreshRendering or not p24.props.categoryInfo then nil else p24.props.categoryInfo
			local v198 = p24.props.searchParameters and p24.props.searchParameters.categoryInfo or (v197 or {})

			DeepLinkUtils.addEquippedItemToCatalogEntries(p24.props.externalNavigationRequestParams, tryOnItems, v198, u190)
		end
	end

	if not u190 then
		p24:setState({
			entries = Roact.None
		})

		return
	end

	local tryOnItems = p24.props.tryOnItems

	if p25 and not Cryo.isEmpty(tryOnItems) and (not FFlagAXMoveAllTabToWidgetOnly or not v189) and (not v121 or p24.props.tryOnLookId == nil) then
		local v200 = p24.props.searchParameters and p24.props.searchParameters.categoryInfo or {}
		local t7 = {}
		local n3 = 0

		if v200.AssetTypeIdStrings then
			for _, v204 in v200.AssetTypeIdStrings do
				t7 = Cryo.Dictionary.join(t7, {
					[v204] = Constants.ItemType.Asset
				})
			end

			n3 += #v200.AssetTypeIdStrings
		end

		if v200.BundleTypes then
			for _, v206 in v200.BundleTypes do
				t7 = Cryo.Dictionary.join(t7, {
					[v206] = Constants.ItemType.Bundle
				})
			end

			n3 += #v200.BundleTypes
		end

		local t8 = table.create(#u190)

		if n3 > 0 then
			for _, v209 in tryOnItems do
				if (not FFlagAXMISEnableMultiShopping or not v209.lookId) and v209.itemSubType and t7[v209.itemSubType] == v209.itemType then
					table.insert(t8, {
						id = tostring(v209.itemId),
						type = tostring(v209.itemType),
						encryptedAdTrackingData = nil
					})
				end
			end
		end

		for _, v211 in u190 do
			if not tryOnItems[getTryOnItemReducerKey(v211.id, v211.type)] then
				table.insert(t8, v211)
			end
		end

		p24:setState({
			entries = t8
		})
	elseif not Cryo.List.equals(p24.state.entries, u190) then
		p24:setState({
			entries = u190
		})
	end
end
function v124.didMount(p26) -- line: 1149
	p26:updateItems(true)
end
function v124.didUpdate(p27, p28, p29) -- line: 1154
	-- upvalues: RetrievalStatus (copy), FFlagAXMoveAllTabToWidgetOnly (copy), FFlagAXFixCatalogRefreshRendering (copy), Cryo (copy), FFlagAXCatalogCategoriesSDUI (copy), AvatarScreen (copy), Constants3 (copy)
	local v216 = p27.props.searchUuid ~= p28.searchUuid

	if p27.props.fromSearch then
		v216 = v216 or p28.categoryInfo ~= p27.props.categoryInfo or not p27.props.searchInCatalog
	end

	if v216 and p27.state.restorePreviousChildFocus ~= false then
		p27:setState({
			restorePreviousChildFocus = false
		})
	end

	if v216 or p27.state.numItemsPerRow ~= p29.numItemsPerRow then
		p27.requestImpressionsSignal:fire()
	end

	local v217 = p27.props.dataStatus == RetrievalStatus.Done and p28.dataStatus ~= RetrievalStatus.Done
	local v218 = if not FFlagAXMoveAllTabToWidgetOnly then nil else p27.props.hasProcessedMarketplaceFetcher
	local v219 = not not FFlagAXMoveAllTabToWidgetOnly and p27.props.shouldPageUseWidgetOnly
	local v220 = if not FFlagAXMoveAllTabToWidgetOnly then nil else v219 and v218
	local searchInCatalog = p27.props.searchInCatalog
	local v222 = searchInCatalog and searchInCatalog.items or nil

	if FFlagAXMoveAllTabToWidgetOnly and v220 and not v222 then
		v222 = {}
	end

	if FFlagAXFixCatalogRefreshRendering then
		local v223 = false

		if p27.props.externalNavigationRequestParams and p28.externalNavigationRequestParams then
			v223 = p27.props.externalNavigationRequestParams.wasItemEquipped ~= p28.externalNavigationRequestParams.wasItemEquipped
		elseif p27.props.externalNavigationRequestParams ~= p28.externalNavigationRequestParams then
			v223 = true
		end

		local v224 = p27.props.itemInfos ~= p28.itemInfos

		if FFlagAXMoveAllTabToWidgetOnly then
			local v225 = not Cryo.List.equals(p27.state.entries, v222)
			local v226 = p28.hasProcessedMarketplaceFetcher ~= p27.props.hasProcessedMarketplaceFetcher
			local v227 = v216 or v217

			if v223 or v224 or v227 and v225 or v226 and v225 then
				p27:updateItems(v216)
			end
		elseif v223 or v224 or (v216 or v217) and not Cryo.List.equals(p27.state.entries, v222) then
			p27:updateItems(v216)
		end
	else
		p27:updateItems(v216)
	end

	if p27.props.dataStatus == RetrievalStatus.Done and p28.dataStatus == RetrievalStatus.Fetching and p27.retryLoadMore then
		p27.retryLoadMore = false
		p27.loadMore()
	end

	if p27.shouldScrollBackToTopOfList({
		searchChanged = v216,
		oldSortsAndFilter = p28.sortAndFilters,
		newSortsAndFilter = p27.props.sortAndFilters
	}) and p27.widgetFlatListRef and p27.widgetFlatListRef.current then
		p27.widgetFlatListRef.current:scrollToOffset({
			offset = 0,
			animated = false
		})
	end

	local v228 = p27.props.dataStatus == RetrievalStatus.Failed
	local entries = p27.state.entries
	local v230 = entries and #entries ~= 0
	local v231 = v228 and not v230

	if FFlagAXCatalogCategoriesSDUI and p27.props.isFetchingMarketplaceError then
		v231 = p27.props.isFetchingMarketplaceError
	elseif FFlagAXMoveAllTabToWidgetOnly and p27.props.shouldPageUseWidgetOnly then
		v231 = p27.props.isFetchingMarketplaceError
	end

	if v231 ~= p29.showFailedState and v231 ~= p27.state.showFailedState then
		p27:setState({
			showFailedState = v231
		})

		if v231 then
			local catalogAnalytics = p27.props.catalogAnalytics

			if p27.props.navigation.state.routeName == AvatarScreen.CatalogSearch then
				catalogAnalytics.sendAXCounter(Constants3.Counter.Errors.NoInternetConnectionErrorSearchView)

				return
			end

			catalogAnalytics.sendAXCounter(Constants3.Counter.Errors.NoInternetConnectionErrorCatalogView)
		end
	end
end

local v125 = withNamedRefs((withAvatarRoute((RoactRodux.connect(function(p30, p31) --[[ mapStateToProps ]] -- line: 1306
	-- upvalues: Utils (copy), CatalogUtils (copy), Cryo (copy), FFlagAXMoveAllTabToWidgetOnly (copy), getAXMarketplaceWidgetStore (copy), PerformFetch (copy), FFlagAXFixWidgetOnlyTabNoItemsFound (copy), selectIsFullView (copy), AvatarScreen (copy), selectFilterCount (copy), FFlagAXCatalogCategoriesStore (copy), v121 (copy), FFlagAXReduceResultsListRerendersOnItemInfos (copy)
	local searchUuid = p31.searchUuid
	local categoryInfo = p31.categoryInfo
	local v237 = Utils.getSearchKey(p30, searchUuid)
	local v238 = false
	local v239 = nil
	local fromSearch = p31.fromSearch

	if searchUuid and fromSearch then
		local v241 = p30.SearchesParameters[searchUuid]
		local v242 = CatalogUtils.getQueryStringForSearchWidgets(v241)
		local v243 = p30.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v242]

		if v243 then
			local Details = v243.Details

			v238 = not not (typeof(Details) == "table" and next(Details) ~= nil) and (Cryo.isEmpty(categoryInfo) or (categoryInfo.ShowWidgets or false))
		end

		local v246

		if FFlagAXMoveAllTabToWidgetOnly then
			local v245 = getAXMarketplaceWidgetStore(false).getDebouncedScreenSize(false)

			v246 = CatalogUtils.getFetchWidgetInfoFetchKey(v242, nil, v245)
		else
			v246 = CatalogUtils.getFetchWidgetInfoFetchKey(v242)
		end

		v239 = PerformFetch.GetStatus(p30, v246)
	elseif FFlagAXFixWidgetOnlyTabNoItemsFound and categoryInfo and p31.shouldPageUseWidgetOnly then
		local WidgetContext = categoryInfo.WidgetContext

		if WidgetContext then
			local v248 = p30.AvatarExperience.Common.Widgets.ContextWidgetInfo[WidgetContext]

			if v248 then
				v238 = typeof(v248.Details) == "table" and next(v248.Details) ~= nil
			end
		end
	end

	local v249 = p30.AvatarExperience.ExternalNavigationRequest.params or {}

	return {
		fullView = selectIsFullView(p30, AvatarScreen.Catalog),
		searchParameters = p30.SearchesParameters[p31.searchUuid],
		sortAndFilters = p30.AvatarExperience.Catalog.SortAndFilters,
		filterCount = if not FFlagAXMoveAllTabToWidgetOnly then nil else selectFilterCount(p30),
		selectedCategoryId = if FFlagAXCatalogCategoriesStore then nil else p30.AvatarExperience.Catalog.Categories.categoryId,
		selectedSubcategoryId = if FFlagAXCatalogCategoriesStore then nil else p30.AvatarExperience.Catalog.Categories.subcategoryId,
		selectedSearchCategoryId = if not FFlagAXCatalogCategoriesStore then if not p30.AvatarExperience.Catalog.SearchCategories then nil else p30.AvatarExperience.Catalog.SearchCategories.categoryId else nil,
		selectedSearchSubcategoryId = if not FFlagAXCatalogCategoriesStore then if not p30.AvatarExperience.Catalog.SearchCategories then nil else p30.AvatarExperience.Catalog.SearchCategories.subcategoryId else nil,
		searchInCatalog = p30.Search.SearchesInCatalog[p31.searchUuid],
		dataStatus = PerformFetch.GetStatus(p30, v237),
		tryOnItems = p30.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems,
		tryOnLookId = if not v121 then nil else p30.AvatarExperience.AvatarScene.OutfitTryOn.LookId,
		focusedWidget = p30.AvatarExperience.Catalog.ResultsList[p31.searchUuid] and p30.AvatarExperience.Catalog.ResultsList[p31.searchUuid].focusedWidget or {},
		hideTopBar = not not p30.AvatarExperience.Catalog.ResultsList[p31.searchUuid] and (p30.AvatarExperience.Catalog.ResultsList[p31.searchUuid].hideTopBar or false),
		widgetRequestId = p30.AvatarExperience.Common.Widgets.WidgetInfo.RequestId,
		widgetDataStatus = v239,
		hasWidgets = v238,
		externalNavigationRequestParams = v249,
		itemInfos = if FFlagAXReduceResultsListRerendersOnItemInfos then nil else {
			AssetInfos = p30.AvatarExperience.Common.AssetInfos,
			BundleInfos = p30.AvatarExperience.Common.BundleInfos
		},
		analyticsMetadata = p30.AvatarExperience.AnalyticsMetadata
	}
end, function(p32) --[[ mapDispatchToProps ]] -- line: 1398
	-- upvalues: FetchDataWithErrorToasts (copy), ApiFetchCatalogSearch (copy), SetResultsListFocusedWidget (copy), ClearResultsListFocusedWidget (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), CatalogTilesLatencyTracker (copy), FetchAssetOrBundleInfo (copy), ToggleTryOnThunk (copy), EquippedDeepLinkCatalogItem (copy), SetCurrentToastMessage (copy), ClearTryOns (copy)
	local v251 = if not GetFFlagEnableCatalogTileLoadingLatency() then nil else function(p33) -- line: 1438
		-- upvalues: p32 (copy), CatalogTilesLatencyTracker (copy)
		return p32(CatalogTilesLatencyTracker.StartTracking(p33))
	end

	return {
		dispatchLoadMore = function(_, p35, p36, p37, p38) -- line: 1399
			-- upvalues: p32 (copy), FetchDataWithErrorToasts (copy), ApiFetchCatalogSearch (copy)
			return p32(FetchDataWithErrorToasts(ApiFetchCatalogSearch({
				searchKeyword = p35,
				searchUuid = p36,
				categoryInfo = p37
			}, p38)))
		end,
		dispatchSetResultsListFocusedWidget = function(p39, p40, p41) -- line: 1430
			-- upvalues: p32 (copy), SetResultsListFocusedWidget (copy)
			return p32(SetResultsListFocusedWidget(p39, p40, p41))
		end,
		dispatchClearResultsListFocusedWidget = function(p42) -- line: 1434
			-- upvalues: p32 (copy), ClearResultsListFocusedWidget (copy)
			return p32(ClearResultsListFocusedWidget(p42))
		end,
		dispatchCatalogTilesLatencyStartTracker = v251,
		fetchItemData = function(p43, p44, p45, p46) -- line: 1443
			-- upvalues: p32 (copy), FetchAssetOrBundleInfo (copy)
			return p32(FetchAssetOrBundleInfo(p43, p44, p45, p46))
		end,
		handleDeepLinkEquipError = function(p47, p48) -- line: 1480
			-- upvalues: p32 (copy), SetCurrentToastMessage (copy), EquippedDeepLinkCatalogItem (copy), ClearTryOns (copy)
			p32(SetCurrentToastMessage({
				toastMessage = "Feature.Avatar.Message.DeepLinkEquipFailed"
			}))
			p32(EquippedDeepLinkCatalogItem({
				itemId = p47,
				itemType = p48,
				wasItemEquipped = false,
				fetchItemFailed = true
			}))
			p32(ClearTryOns())
		end,
		equipCatalogDeepLinkItem = function(p49, p50, p51, p52, p53, p54, p55, p56, p57) -- line: 1447
			-- upvalues: p32 (copy), ToggleTryOnThunk (copy), EquippedDeepLinkCatalogItem (copy)
			p32(ToggleTryOnThunk(p49, p50, p51, p52, p53, p54, p55, p56, p57, true))
			p32(EquippedDeepLinkCatalogItem({
				itemId = p53,
				itemType = p51,
				wasItemEquipped = true,
				fetchItemFailed = false
			}))
		end
	}
end)(v124)))))
local u126 = withAdaptiveScrolling((withNavigation((RoactServices.connect({
	axAnalytics = Analytics,
	catalogAnalytics = Analytics2,
	networking = RoactNetworking
})(v125)))))

local function selectItemInfos(p58) -- line: 1518
	local AssetInfos = p58.AvatarExperience.Common.AssetInfos
	local BundleInfos = p58.AvatarExperience.Common.BundleInfos

	return {
		AssetInfos = AssetInfos,
		BundleInfos = BundleInfos
	}
end

return function(t9: {[any]: any}) --[[ ResultsListWrapper ]] -- line: 1567
	-- upvalues: FFlagAXMigrateMainNavigationInputBindings (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), useDispatch (copy), RoactGamepad (copy), useFocusGuiObject (copy), useSelector (copy), React (copy), ClearResultsListFocusedWidget (copy), useResultsListFocusNavigationBindings (copy), FFlagAXItemDetailsIxpExposure (copy), useUnifiedEventImpressionsReporter (copy), FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesStore (copy), useSignalState (copy), v107 (copy), FFlagAXHideMenuOnScroll (copy), useAnimatedVisibility (copy), SignalsReact (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMoveAllTabToWidgetOnly (copy), Stores (copy), getUseSelectorDeepEquals (copy), selectFilterCount (copy), getShouldPageUseWidgetOnlyFetcher (copy), FFlagAXReduceResultsListRerendersOnItemInfos (copy), selectItemInfos (copy), tutils (copy), FFlagAXMigrateAllTabToSduiDev (copy), useResultsAreSduiEnabled (copy), useAvatarRoute (copy), CatalogUtils (copy), u126 (ref)
	local v256 = table.clone(t9)

	if FFlagAXMigrateMainNavigationInputBindings then
		local v257 = nil

		if FFlagAXMigrateAXToGlobalAutofocus then
			function v257(p59) -- line: 1574
				return p59.AvatarExperience.Catalog.ResultsList
			end
		end

		local u258 = nil

		if FFlagAXMigrateAXToGlobalAutofocus then
			u258 = useDispatch()
		end

		local v259 = if not FFlagAXMigrateAXToGlobalAutofocus then RoactGamepad.useFocusController() else nil
		local v260 = if not FFlagAXMigrateAXToGlobalAutofocus then nil else useFocusGuiObject()
		local u261 = nil

		if FFlagAXMigrateAXToGlobalAutofocus then
			local v262 = useSelector(v257)
			local v263 = v262[t9.searchUuid] and v262[t9.searchUuid].focusedWidget

			u261 = not not v263 and v263.active
		end

		local v264 = React.useCallback(function(p60) -- line: 1593
			-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), u261 (ref), u258 (ref), ClearResultsListFocusedWidget (copy), t9 (copy), v260 (copy), v259 (copy)
			p60.cancelled = true

			if FFlagAXMigrateAXToGlobalAutofocus then
				if u261 then
					u258(ClearResultsListFocusedWidget(t9.searchUuid))

					if type(t9.onCloseFocusedWidget) == "function" then
						t9.onCloseFocusedWidget()

						return
					end
				elseif v260 and t9.NextSelectionUp and t9.NextSelectionUp.current then
					v260(t9.NextSelectionUp.current)

					return
				end
			else
				v259.moveFocusTo(t9.NextSelectionUp)
			end
		end, {
			if not FFlagAXMigrateAXToGlobalAutofocus then v259 else v260,
			t9.NextSelectionUp,
			if not FFlagAXMigrateAXToGlobalAutofocus then nil else u261,
			if not FFlagAXMigrateAXToGlobalAutofocus then nil else t9.searchUuid,
			if not FFlagAXMigrateAXToGlobalAutofocus then nil else u258,
			if not FFlagAXMigrateAXToGlobalAutofocus then nil else t9.onCloseFocusedWidget
		})

		v256.focusNavigationBindingsRef = useResultsListFocusNavigationBindings({
			onNavigateBack = v264
		}, t9.frameRef)
	end

	if FFlagAXItemDetailsIxpExposure then
		local v265 = useUnifiedEventImpressionsReporter()

		v256.tagBasedImpressionsDetectorExtensions = React.useMemo(function() -- line: 1625
			-- upvalues: v265 (copy)
			return { v265 }
		end, { v265 })
	end

	if FFlagAXCatalogCategoriesStore then
		local v266 = GetCatalogCategoriesStore.getCatalogSelectionStore()
		local v267 = useSignalState(v266.selectedCategoryId)
		local v268 = useSignalState(v266.selectedSubcategoryId)

		v256.selectedCategoryId = v267
		v256.selectedSubcategoryId = v268

		local v269 = GetCatalogCategoriesStore.getCatalogSearchSelectionStore()
		local v270 = useSignalState(v269.selectedCategoryId)
		local v271 = useSignalState(v269.selectedSubcategoryId)

		v256.selectedSearchCategoryId = v270
		v256.selectedSearchSubcategoryId = v271

		local v272 = useSignalState(v266.selectedCategory)

		v256.selectedCategory = v272

		local v273 = useSignalState(v269.selectedCategory)

		v256.selectedSearchCategory = v273

		if v107 then
			v256.selectedSearchSubcategory = useSignalState(v269.selectedSubcategory)
		end

		v256.categoryInfo = if not t9.fromSearch then v272 else v273
	end

	if FFlagAXHideMenuOnScroll then
		local v274 = useAnimatedVisibility()

		v256.visibilityRatioBinding = if not v274 then React.createBinding(1) else SignalsReact.useSignalBinding(v274.animatedMenusStore.getVisibilityRatio)
	end

	if FFlagAXCatalogCategoriesSDUI or FFlagAXMoveAllTabToWidgetOnly then
		local v275 = Stores.getFetchMarketplaceStore(false)
		local v276 = useSignalState(v275.getFetchingMarketplaceError)
		local v277 = if not FFlagAXCatalogCategoriesSDUI then nil else useSignalState(v275.getCatalogCategoriesError)

		v256.isFetchingMarketplaceError = v276

		if FFlagAXCatalogCategoriesSDUI then
			v256.isFetchingMarketplaceError = v276 or v277
		end

		if FFlagAXMoveAllTabToWidgetOnly then
			v256.hasProcessedMarketplaceFetcher = useSignalState(v275.getFetchingMarketplaceProcessed)

			local v278 = React.useCallback(function(p61) -- line: 1693
				-- upvalues: t9 (copy)
				return p61.SearchesParameters[t9.searchUuid]
			end, { t9.searchUuid })
			local v279 = useSelector(v278, getUseSelectorDeepEquals())
			local v280 = useSelector(selectFilterCount)

			v256.shouldPageUseWidgetOnly = getShouldPageUseWidgetOnlyFetcher(v256.categoryInfo, v280, v279 and v279.searchKeyword)
		end
	end

	if FFlagAXReduceResultsListRerendersOnItemInfos then
		v256.itemInfos = useSelector(selectItemInfos, tutils.shallowEqual)
	end

	if FFlagAXMigrateAllTabToSduiDev and FFlagAXCatalogCategoriesStore then
		local v281 = GetCatalogCategoriesStore.getCatalogSelectionStore()
		local v282 = useSignalState(v281.selectedCategoryId)
		local v283 = useSignalState(v281.selectedSubcategoryId)
		local v284 = useResultsAreSduiEnabled()
		local v285 = useAvatarRoute()
		local v286 = CatalogUtils.getContextForWidgetsById(v285.opaque.name, v282, v283)

		v256.showSduiResults = v284
		v256.context = v286
	end

	return React.createElement(u126, v256)
end
