local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local useSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Stores = require(Modules.AvatarExperience.Common.Components.WidgetList.Stores)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local PageObjectManagerContext = require(Modules.AvatarExperience.Common.Context.PageObjectManagerContext)
local useGetCategoryInfo = require(Modules.AvatarExperience.Catalog.Hooks.useGetCategoryInfo)
local useGetSelectedCategoryAndSubcategoryId = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local useCatalogCategoriesFetcher = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useCatalogCategoriesFetcher)
local CatalogCategories = AvatarExperienceCommon.Enums.CatalogCategories
local Constants = require(Modules.AvatarExperience.Common.Constants)
local AXPrefetchMarketplaceIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local RobloxAppEnums = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local fetchCatalogSearchWithSponsoredItems = require(script.Parent.Parent.Utils.fetchCatalogSearchWithSponsoredItems)
local MarketplaceSubscriptionRefetchUtils = require(script.Parent.Parent.Utils.MarketplaceSubscriptionRefetchUtils)
local getSearchKeywordFromSearchesParameters = MarketplaceSubscriptionRefetchUtils.getSearchKeywordFromSearchesParameters
local getShouldFetchCatalogOrganicAfterWidgets = MarketplaceSubscriptionRefetchUtils.getShouldFetchCatalogOrganicAfterWidgets
local fetchHydratedWidgets = require(script.Parent.Parent.Utils.fetchHydratedWidgets)
local FetchSponsoredItems = require(Modules.AvatarExperience.Catalog.Thunks.FetchSponsoredItems)
local ApiFetchCatalogSearch = require(Modules.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch)
local GetCatalogCategoriesFromStore = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local mutedError = require(Modules.LuaApp.mutedError)
local RemoveSearchInCatalog = require(Modules.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog)
local ClearWidgetInfo = require(Modules.AvatarExperience.Catalog.Actions.ClearWidgetInfo)
local SetSearchParameters = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchType = require(Modules.LuaApp.Actions.SetSearchType)
local SetSearchTime = require(Modules.LuaApp.Actions.SetSearchTime)
local CatalogTilesLatencyTracker = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)

require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)

local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXFixPrefetchMarketplaceStartupCrash = AvatarExperienceFlags.FFlagAXFixPrefetchMarketplaceStartupCrash
local FFlagAXUnifiedMarketplaceResultsFetcher = AvatarExperienceFlags.FFlagAXUnifiedMarketplaceResultsFetcher
local FFlagAXPrefetchOnlyWithinTTL = AvatarExperienceFlags.FFlagAXPrefetchOnlyWithinTTL
local GetFFlagEnableCatalogTileLoadingLatency = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local FFlagAXResetFetchMarketplaceLogic = AvatarExperienceFlags.FFlagAXResetFetchMarketplaceLogic
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlags.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev
local FFlagAXFixHydratedWidgetsParams = AvatarExperienceFlags.FFlagAXFixHydratedWidgetsParams
local FFlagAXDefaultCatalogCategoryId = AvatarExperienceFlags.FFlagAXDefaultCatalogCategoryId
local FFlagAXEnableTTIViaModule = AvatarExperienceFlags.FFlagAXEnableTTIViaModule
local FFlagAXEnableMilestoneTrackingForAvatarExperience = AvatarExperienceFlags.FFlagAXEnableMilestoneTrackingForAvatarExperience
local FFlagAXMarketplaceSubscriptionRefetchListener = AvatarExperienceFlags.FFlagAXMarketplaceSubscriptionRefetchListener
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local AvatarExperienceTTIPerformance = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformance.TTIPerformanceManager
local WidgetsPercievedTTIManager = AvatarExperienceTTIPerformance.WidgetsPercievedTTIManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformance.OrganicTTIMilestoneManager
local sendAXCounterV2 = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2

function selectSortAndFilters(p1) -- line: 158
	-- upvalues: FFlagAXFixPrefetchMarketplaceStartupCrash (copy)
	if FFlagAXFixPrefetchMarketplaceStartupCrash and (not p1.AvatarExperience or not p1.AvatarExperience.Catalog) then
		return nil
	end

	return p1.AvatarExperience.Catalog.SortAndFilters
end

return function(t1: {[any]: any}?) --[[ useMarketplaceResultsFetcher ]] -- line: 208
	-- upvalues: AXPrefetchMarketplaceIXP (copy), IxpUtils (copy), useDispatch (copy), FFlagAXResetFetchMarketplaceLogic (copy), useSelector (copy), React (copy), PageObjectManagerContext (copy), useRoactService (copy), RoactNetworking (copy), Stores (copy), useSignalState (copy), FFlagAXPrefetchOnlyWithinTTL (copy), FFlagAXMoveAllTabToWidgetOnly (copy), FFlagAXCatalogCategoriesSDUI (copy), useGetCategoryInfo (copy), useGetSelectedCategoryAndSubcategoryId (copy), FFlagAXDefaultCatalogCategoryId (copy), Constants (copy), CatalogCategories (copy), FFlagAXFixHydratedWidgetsParams (copy), GetCatalogCategoriesFromStore (copy), Utils (copy), mutedError (copy), useStore (copy), FFlagAXUnifiedMarketplaceResultsFetcher (copy), useCatalogCategoriesFetcher (copy), FFlagAXFixPrefetchMarketplaceStartupCrash (copy), RemoveSearchInCatalog (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), FFlagAXEnableTTIViaModule (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), TTIPerformanceManager (copy), TimeToInteractiveTracker (copy), Constants2 (copy), CatalogTilesLatencyTracker (copy), SetSearchType (copy), RobloxAppEnums (copy), FFlagAXMarketplaceSubscriptionRefetchListener (copy), SetSearchParameters (copy), CatalogUtils (copy), AvatarScreen (copy), ClearWidgetInfo (copy), FetchSponsoredItems (copy), CatalogConstants (copy), Logging (copy), getSearchKeywordFromSearchesParameters (copy), ApiFetchCatalogSearch (copy), WidgetsPercievedTTIManager (copy), SetSearchTime (copy), OrganicTTIMilestoneManager (copy), FFlagAXMigrateAllTabToSduiDev (copy), sendAXCounterV2 (copy), fetchHydratedWidgets (copy), getShouldFetchCatalogOrganicAfterWidgets (copy), fetchCatalogSearchWithSponsoredItems (copy)
	local v64 = if not AXPrefetchMarketplaceIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser)
	local v65 = useDispatch()
	local v66 = if not FFlagAXResetFetchMarketplaceLogic then nil else useSelector(selectSortAndFilters)
	local v67 = if not FFlagAXResetFetchMarketplaceLogic then nil else React.useContext(PageObjectManagerContext.Consumer)
	local v68 = useRoactService(RoactNetworking)
	local v69 = Stores.getFetchMarketplaceStore(false)
	local v70 = useSignalState(v69.getFetchingMarketplace)
	local v71 = useSignalState(v69.getFetchedMarketplace)
	local v72 = if not FFlagAXPrefetchOnlyWithinTTL then nil else useSignalState(v69.getFetchedMarketplaceTimestamp)
	local setFetchingMarketplaceInProgress = v69.setFetchingMarketplaceInProgress
	local setFetchedMarketplaceCompleted = v69.setFetchedMarketplaceCompleted
	local v75 = if not FFlagAXMoveAllTabToWidgetOnly and not FFlagAXCatalogCategoriesSDUI then nil else v69.setFetchingMarketplaceErrorOccured
	local v76 = if not FFlagAXCatalogCategoriesSDUI then nil else v69.setCatalogCategoriesErrorOccured
	local v77 = if not FFlagAXMoveAllTabToWidgetOnly then nil else v69.setFetchingMarketplaceProcessed
	local v78 = useGetCategoryInfo()
	local v79, v80 = useGetSelectedCategoryAndSubcategoryId()
	local v81 = v79 or if not FFlagAXDefaultCatalogCategoryId then CatalogCategories.Recommended:rawValue() else Constants.DefaultCatalogCategoryId
	local u82 = if not t1 or FFlagAXFixHydratedWidgetsParams then v78 else t1.categoryInfo
	local v83 = if not t1 then v81 else t1.categoryId
	local v84 = if not t1 then v80 else t1.subcategoryId

	if FFlagAXFixHydratedWidgetsParams then
		local v85 = GetCatalogCategoriesFromStore()

		u82 = Utils.getCategoryInfoById(v85, v83, v84)

		if not u82 then
			mutedError("[useMarketplaceResultsFetcher] categoryInfo is nil for categoryId: " .. tostring(v83) .. " and subcategoryId: " .. tostring(v84))
			u82 = v78
		end
	end

	local v86 = if not t1 then u82.SearchUuid else t1.searchUuid
	local v87 = useStore()
	local v88, v89 = React.useState(false)
	local u90 = nil
	local u91 = nil
	local u92 = nil
	local u93 = nil
	local u94 = nil
	local u95 = nil
	local u96 = nil
	local u97 = nil
	local u98 = nil
	local u99 = nil

	if FFlagAXMoveAllTabToWidgetOnly then
		local v100, v101 = React.useState(false)

		u90 = v100
		u91 = v101

		local v102, v103 = React.useState(false)

		u92 = v102
		u93 = v103

		local v104, v105 = React.useState(false)

		u94 = v104
		u95 = v105

		local v106, v107 = React.useState(false)

		u96 = v106
		u97 = v107

		local v108, v109 = React.useState(false)

		u98 = v108
		u99 = v109
	end

	local v110, v111 = React.useState(false)
	local v112 = (v64 or FFlagAXUnifiedMarketplaceResultsFetcher) and (not v70 and v86 ~= nil)
	local u113 = nil

	if FFlagAXCatalogCategoriesSDUI then
		u113 = useCatalogCategoriesFetcher()
	end

	local v114 = if not FFlagAXResetFetchMarketplaceLogic then nil else React.useCallback(function() -- line: 310
		-- upvalues: FFlagAXFixPrefetchMarketplaceStartupCrash (copy), v66 (copy), FFlagAXMoveAllTabToWidgetOnly (copy), u91 (ref), u93 (ref), u95 (ref), u97 (ref), u99 (ref), v89 (copy), v111 (copy), v67 (copy), v86 (copy), v65 (copy), RemoveSearchInCatalog (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), FFlagAXEnableTTIViaModule (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), TTIPerformanceManager (copy), TimeToInteractiveTracker (copy), Constants2 (copy), CatalogTilesLatencyTracker (copy), SetSearchType (copy), RobloxAppEnums (copy), FFlagAXMarketplaceSubscriptionRefetchListener (copy), v87 (copy), SetSearchParameters (copy), u82 (ref), v83 (copy), v84 (copy), CatalogUtils (copy), AvatarScreen (copy), ClearWidgetInfo (copy), setFetchingMarketplaceInProgress (copy)
		if FFlagAXFixPrefetchMarketplaceStartupCrash and v66 == nil then
			return
		end

		if FFlagAXMoveAllTabToWidgetOnly then
			u91(false)
			u93(false)
			u95(false)
			u97(false)
			u99(false)
		else
			v89(false)
		end

		v111(false)

		if v67 then
			v67:storePageObject(v86, nil)
		end

		v65(RemoveSearchInCatalog(v86))

		if GetFFlagEnableCatalogTileLoadingLatency() then
			if FFlagAXEnableTTIViaModule then
				if FFlagAXEnableMilestoneTrackingForAvatarExperience then
					TTIPerformanceManager.Surface.Marketplace.Root.startTracking()
				else
					TimeToInteractiveTracker.trackStart(Constants2.Counter.PREFIX .. Constants2.Counter.Latency.Organic.Tiles)
					TimeToInteractiveTracker.trackStart(Constants2.Counter.PREFIX .. Constants2.Counter.Latency.Organic.Thumbnails)
					TimeToInteractiveTracker.trackStart(Constants2.Counter.PREFIX .. Constants2.Counter.Latency.Widget.Tiles)
					TimeToInteractiveTracker.trackStart(Constants2.Counter.PREFIX .. Constants2.Counter.Latency.Widget.Thumbnails)
				end
			end

			v65(CatalogTilesLatencyTracker.StartTracking(v86))
		end

		v65(SetSearchType(v86, RobloxAppEnums.SearchTypes.Catalog))

		local searchKeyword = nil

		if FFlagAXMarketplaceSubscriptionRefetchListener then
			local v120 = v87:getState()
			local v121 = if not v120.SearchesParameters or not v86 then nil else v120.SearchesParameters[v86]

			if v121 then
				searchKeyword = v121.searchKeyword
			end
		end

		v65(SetSearchParameters(v86, {
			categoryInfo = u82,
			catalogSort = v66.CatalogSort,
			catalogSortAggregation = v66.CatalogSortAggregation,
			minPrice = v66.PriceRange.minPrice,
			maxPrice = v66.PriceRange.maxPrice,
			selectedTopics = v66.SelectedTopics,
			creatorFilter = v66.CreatorFilter,
			salesTypeFilter = v66.SalesTypeFilter,
			unavailableItemFilter = v66.UnavailableItemFilter,
			wearTimeFilter = v66.WearTimeFilter,
			searchKeyword = if not FFlagAXMarketplaceSubscriptionRefetchListener then nil else searchKeyword
		}))

		local v122 = nil
		local v123 = v83
		local v124 = v84

		if v123 then
			local v125 = if type(v123) ~= "string" then if type(v123) ~= "number" then nil else tostring(v123) else v123
			local v126 = if type(v124) ~= "string" then if type(v124) ~= "number" then nil else tostring(v124) else v124

			if v125 then
				v122 = CatalogUtils.getContextForWidgetsById(AvatarScreen.Catalog, v125, v126)
			end
		end

		if v122 then
			v65(ClearWidgetInfo(nil, v122))
		end

		v65(ClearWidgetInfo(nil, nil))
		setFetchingMarketplaceInProgress()
	end, {
		v67,
		v86,
		v66,
		u82,
		v83,
		v84,
		setFetchingMarketplaceInProgress,
		if not FFlagAXMarketplaceSubscriptionRefetchListener then nil else v87,
		if not FFlagAXMarketplaceSubscriptionRefetchListener then nil else v65
	})
	local v115 = if not FFlagAXMoveAllTabToWidgetOnly then nil else React.useCallback(function() -- line: 438
		-- upvalues: u82 (ref), v65 (copy), FetchSponsoredItems (copy), v68 (copy), CatalogConstants (copy), u93 (ref), u97 (ref), Logging (copy)
		if u82.ShowSponsored then
			local v127 = v65(FetchSponsoredItems(v68, CatalogConstants.SponsoredItemsCategoryRecommended, CatalogConstants.SponsoredItemsToFetch))

			if v127 and v127.andThen then
				v127:andThen(function() -- line: 449
					-- upvalues: u93 (ref), u97 (ref)
					u93(true)
					u97(true)
				end, function(p2) -- line: 452
					-- upvalues: Logging (copy), u97 (ref)
					Logging.warn("useMarketplaceResultsFetcher: Fetch sponsored items failed: " .. tostring(p2))
					u97(true)
				end)

				return
			end

			u97(true)

			return
		end

		u97(true)
	end, {
		u82,
		v68,
		v65,
		u93,
		u97
	})
	local v116 = if not FFlagAXMoveAllTabToWidgetOnly then nil else React.useCallback(function() -- line: 472
		-- upvalues: v86 (copy), u82 (ref), FFlagAXMarketplaceSubscriptionRefetchListener (copy), getSearchKeywordFromSearchesParameters (copy), v87 (copy), v65 (copy), ApiFetchCatalogSearch (copy), v68 (copy), u91 (ref), u95 (ref), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), Logging (copy)
		local t2 = {
			searchUuid = v86,
			categoryInfo = u82,
			recordSearchTime = true
		}

		if FFlagAXMarketplaceSubscriptionRefetchListener then
			local v129 = getSearchKeywordFromSearchesParameters(v87, v86)

			if v129 then
				t2.searchKeyword = v129
			end
		end

		local v130 = v65(ApiFetchCatalogSearch(t2, v68))

		if v130 and v130.andThen then
			v130:andThen(function() -- line: 486
				-- upvalues: u91 (ref), u95 (ref), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy)
				u91(true)
				u95(true)

				if FFlagAXEnableMilestoneTrackingForAvatarExperience and WidgetsPercievedTTIManager then
					WidgetsPercievedTTIManager.L3.requestFetchCatalogSearchOrganic()
				end
			end, function(p3) -- line: 494
				-- upvalues: Logging (copy), u95 (ref)
				Logging.warn("useMarketplaceResultsFetcher: Fetch catalog search failed: " .. tostring(p3))
				u95(true)
			end)

			return
		end

		u95(true)
	end, {
		v86,
		u82,
		v65,
		v68,
		u91,
		u95,
		if not FFlagAXMarketplaceSubscriptionRefetchListener then nil else v87
	})
	local v117 = if not FFlagAXMoveAllTabToWidgetOnly then nil else React.useCallback(function() -- line: 513
		-- upvalues: v65 (copy), SetSearchTime (copy), v86 (copy)
		v65(SetSearchTime(v86, tick()))
	end, {
		v65,
		v86
	})
	local v118 = React.useCallback(function() -- line: 523
		-- upvalues: v112 (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), OrganicTTIMilestoneManager (copy), FFlagAXResetFetchMarketplaceLogic (copy), v114 (copy), setFetchingMarketplaceInProgress (copy), FFlagAXMoveAllTabToWidgetOnly (copy), v117 (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), u113 (ref), sendAXCounterV2 (copy), Constants (copy), v76 (copy), fetchHydratedWidgets (copy), v65 (copy), v68 (copy), u82 (ref), v87 (copy), FFlagAXFixHydratedWidgetsParams (copy), v83 (copy), v84 (copy), v115 (copy), v111 (copy), u99 (ref), FFlagAXMarketplaceSubscriptionRefetchListener (copy), getSearchKeywordFromSearchesParameters (copy), v86 (copy), getShouldFetchCatalogOrganicAfterWidgets (copy), v116 (copy), u95 (ref), v75 (copy), fetchCatalogSearchWithSponsoredItems (copy), v89 (copy)
		if not v112 then
			return
		end

		if FFlagAXEnableMilestoneTrackingForAvatarExperience then
			if WidgetsPercievedTTIManager then
				WidgetsPercievedTTIManager.L2.primaryDataStarted()
			end

			if OrganicTTIMilestoneManager then
				OrganicTTIMilestoneManager.L2.primaryDataStarted()
			end
		end

		if FFlagAXResetFetchMarketplaceLogic then
			v114()
		else
			setFetchingMarketplaceInProgress()
		end

		if FFlagAXMoveAllTabToWidgetOnly then
			v117()

			if FFlagAXCatalogCategoriesSDUI and not FFlagAXMigrateAllTabToSduiDev then
				u113():andThen(function() -- line: 554
				end, function(p4) -- line: 556
					-- upvalues: sendAXCounterV2 (copy), Constants (copy), v76 (copy)
					warn("fetchCatalogCategories error", p4)

					local ok, result = pcall(function() -- line: 558
						-- upvalues: p4 (copy)
						return (string.sub(tostring(p4), 1, 100))
					end)

					sendAXCounterV2(Constants.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
						error = not ok and "unknown" or result
					})
					v76()
				end)
			end

			if FFlagAXEnableMilestoneTrackingForAvatarExperience then
				if WidgetsPercievedTTIManager then
					WidgetsPercievedTTIManager.L3.networkFetch()
				end

				if OrganicTTIMilestoneManager then
					OrganicTTIMilestoneManager.L3.networkFetch()
				end
			end

			local v131 = fetchHydratedWidgets(v65, v68, u82, v87, if not FFlagAXFixHydratedWidgetsParams then nil else v83, if not FFlagAXFixHydratedWidgetsParams then nil else v84)

			v115()

			if v131 and v131.andThen then
				v131:andThen(function(p5) -- line: 590
					-- upvalues: v111 (copy), u99 (ref), FFlagAXMarketplaceSubscriptionRefetchListener (copy), getSearchKeywordFromSearchesParameters (copy), v87 (copy), v86 (copy), getShouldFetchCatalogOrganicAfterWidgets (copy), v116 (copy), u95 (ref)
					v111(true)
					u99(true)

					if FFlagAXMarketplaceSubscriptionRefetchListener then
						local v140 = p5 and (p5.configuration and (p5.configuration.customizedDataMap and p5.configuration.customizedDataMap.disableOrganicContentFetch))
						local v141 = getSearchKeywordFromSearchesParameters(v87, v86)

						if getShouldFetchCatalogOrganicAfterWidgets(v140, v141) then
							v116()

							return
						end

						u95(true)

						return
					end

					if not p5 or not p5.configuration or not p5.configuration.customizedDataMap or not p5.configuration.customizedDataMap.disableOrganicContentFetch then
						v116()

						return
					end

					u95(true)
				end, function(_) -- line: 627
					-- upvalues: u95 (ref), v75 (copy)
					u95(true)
					v75()
				end)

				return
			end
		else
			if FFlagAXCatalogCategoriesSDUI and not FFlagAXMigrateAllTabToSduiDev then
				u113():andThen(function() -- line: 637
				end, function(p7) -- line: 639
					-- upvalues: sendAXCounterV2 (copy), Constants (copy), v76 (copy)
					warn("fetchCatalogCategories error", p7)

					local ok, result = pcall(function() -- line: 641
						-- upvalues: p7 (copy)
						return (string.sub(tostring(p7), 1, 100))
					end)

					sendAXCounterV2(Constants.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
						error = not ok and "unknown" or result
					})
					v76()
				end)
			end

			if FFlagAXEnableMilestoneTrackingForAvatarExperience then
				if WidgetsPercievedTTIManager then
					WidgetsPercievedTTIManager.L3.networkFetch()
				end

				if OrganicTTIMilestoneManager then
					OrganicTTIMilestoneManager.L3.networkFetch()
				end
			end

			local v132 = if not FFlagAXMarketplaceSubscriptionRefetchListener then fetchCatalogSearchWithSponsoredItems(v65, v68, v86, u82) else fetchCatalogSearchWithSponsoredItems(v65, v68, v86, u82, getSearchKeywordFromSearchesParameters(v87, v86))
			local v133 = fetchHydratedWidgets(v65, v68, u82, v87, if not FFlagAXFixHydratedWidgetsParams then nil else v83, if not FFlagAXFixHydratedWidgetsParams then nil else v84)

			if v132 and v132.andThen then
				v132:andThen(function() -- line: 690
					-- upvalues: v89 (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy)
					v89(true)

					if FFlagAXEnableMilestoneTrackingForAvatarExperience and WidgetsPercievedTTIManager then
						WidgetsPercievedTTIManager.L3.requestFetchCatalogSearch()
					end
				end)
			end

			if v133 and v133.andThen then
				v133:andThen(function() -- line: 702
					-- upvalues: v111 (copy)
					v111(true)
				end)
			end
		end
	end, {
		v112,
		v86,
		setFetchingMarketplaceInProgress,
		v65,
		if not FFlagAXResetFetchMarketplaceLogic then nil else v114,
		v68,
		u82,
		if not FFlagAXFixHydratedWidgetsParams then nil else v83,
		if not FFlagAXFixHydratedWidgetsParams then nil else v84,
		v87,
		v89,
		if not FFlagAXMoveAllTabToWidgetOnly then nil else u91,
		if not FFlagAXMoveAllTabToWidgetOnly then nil else v117,
		if not FFlagAXMoveAllTabToWidgetOnly then nil else u99,
		if not FFlagAXMoveAllTabToWidgetOnly then nil else u95,
		if not FFlagAXMoveAllTabToWidgetOnly then nil else v75,
		v111
	})

	if FFlagAXMoveAllTabToWidgetOnly then
		React.useEffect(function() -- line: 730
			-- upvalues: v110 (copy), u90 (ref), u92 (ref), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), OrganicTTIMilestoneManager (copy), setFetchedMarketplaceCompleted (copy), u98 (ref), u94 (ref), u96 (ref), v77 (copy)
			if v110 and (u90 and u92) then
				if FFlagAXEnableMilestoneTrackingForAvatarExperience then
					if WidgetsPercievedTTIManager then
						WidgetsPercievedTTIManager.L2.dataProcessingStarted()
					end

					if OrganicTTIMilestoneManager then
						OrganicTTIMilestoneManager.L2.dataProcessingStarted()
					end
				end

				setFetchedMarketplaceCompleted()

				if FFlagAXEnableMilestoneTrackingForAvatarExperience then
					if WidgetsPercievedTTIManager then
						WidgetsPercievedTTIManager.L2.dataProcessingCompleted()
					end

					if OrganicTTIMilestoneManager then
						OrganicTTIMilestoneManager.L2.dataProcessingCompleted()
					end
				end
			end

			if u98 and u94 and u96 then
				v77()
			end
		end, {
			v110,
			u90,
			u92,
			u98,
			u94,
			u96
		})
	else
		React.useEffect(function() -- line: 767
			-- upvalues: v88 (copy), v110 (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), OrganicTTIMilestoneManager (copy), setFetchedMarketplaceCompleted (copy)
			if v88 and v110 then
				if FFlagAXEnableMilestoneTrackingForAvatarExperience then
					if WidgetsPercievedTTIManager then
						WidgetsPercievedTTIManager.L3.responseReceived()
						WidgetsPercievedTTIManager.L2.dataProcessingStarted()
					end

					if OrganicTTIMilestoneManager then
						OrganicTTIMilestoneManager.L3.responseReceived()
						OrganicTTIMilestoneManager.L2.dataProcessingStarted()
					end
				end

				setFetchedMarketplaceCompleted()

				if FFlagAXEnableMilestoneTrackingForAvatarExperience then
					if WidgetsPercievedTTIManager then
						WidgetsPercievedTTIManager.L2.dataProcessingCompleted()
					end

					if OrganicTTIMilestoneManager then
						OrganicTTIMilestoneManager.L2.dataProcessingCompleted()
					end
				end
			end
		end, {
			v88,
			v110
		})
	end

	return {
		fetchMarketplace = v118,
		hasFetched = v71,
		isFetching = v70,
		fetchedMarketplaceTimestamp = if not FFlagAXPrefetchOnlyWithinTTL then nil else v72
	}
end
