local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local React = require(CorePackages.Packages.React)
local Promise = require(CorePackages.Packages.Promise)
local useSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local Stores = require(Modules.AvatarExperience.Common.Components.WidgetList.Stores)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local useGetCategoryInfo = require(Modules.AvatarExperience.Catalog.Hooks.useGetCategoryInfo)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local FetchSponsoredItems = require(Modules.AvatarExperience.Catalog.Thunks.FetchSponsoredItems)
local GetCatalogCategoriesFromStore = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local mutedError = require(CorePackages.Workspace.Packages.Loggers).mutedError
local Constants = require(Modules.AvatarExperience.Common.Constants)
local sendAXCounterV2 = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local SetSearchTime = require(Modules.LuaApp.Actions.SetSearchTime)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPrefetchOnlyWithinTTL = AvatarExperienceFlags.FFlagAXPrefetchOnlyWithinTTL
local FFlagAXEnableMilestoneTrackingForAvatarExperience = AvatarExperienceFlags.FFlagAXEnableMilestoneTrackingForAvatarExperience
local FIntAXPrefetchWidgetHydrationRowsPortrait = AvatarExperienceFlags.FIntAXPrefetchWidgetHydrationRowsPortrait
local FIntAXPrefetchWidgetHydrationRowsLandscape = AvatarExperienceFlags.FIntAXPrefetchWidgetHydrationRowsLandscape
local selectIsPortrait = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local AvatarExperienceTTIPerformance = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local WidgetsPercievedTTIManager = AvatarExperienceTTIPerformance.WidgetsPercievedTTIManager
local OrganicTTIMilestoneManager = AvatarExperienceTTIPerformance.OrganicTTIMilestoneManager
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local fetchCatalogPage = AvatarExperienceCatalog.Sdui.fetchCatalogPage
local getAXMarketplaceWidgetStore = AvatarExperienceCatalog.Stores.getAXMarketplaceWidgetStore
local SduiLoadTimer = require(CorePackages.Workspace.Packages.SduiSharedUtilities).SduiLoadTimer
local SetHydratedWidgetData = require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData)
local WebApi = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local hydrateCatalogSortEntities = AvatarExperienceCatalog.Sdui.hydrateCatalogSortEntities

return function(t1: {[any]: any}) --[[ useMarketplaceResultsFetcherSdui ]] -- line: 81
	-- upvalues: useDispatch (copy), useRoactService (copy), RoactNetworking (copy), useStore (copy), Stores (copy), useSignalState (copy), FFlagAXPrefetchOnlyWithinTTL (copy), useGetCategoryInfo (copy), GetCatalogCategoriesFromStore (copy), Utils (copy), mutedError (copy), React (copy), FetchSponsoredItems (copy), CatalogConstants (copy), Logging (copy), Promise (copy), getAXMarketplaceWidgetStore (copy), HttpService (copy), SduiLoadTimer (copy), AvatarScreen (copy), fetchCatalogPage (copy), selectIsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsLandscape (copy), hydrateCatalogSortEntities (copy), SetHydratedWidgetData (copy), WebApi (copy), SetSearchTime (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), OrganicTTIMilestoneManager (copy), sendAXCounterV2 (copy), Constants (copy)
	local v40 = useDispatch()
	local v41 = useRoactService(RoactNetworking)
	local v42 = useStore()
	local v43 = Stores.getFetchMarketplaceStore(false)
	local v44 = useSignalState(v43.getFetchingMarketplace)
	local v45 = useSignalState(v43.getFetchedMarketplace)
	local v46 = if not FFlagAXPrefetchOnlyWithinTTL then nil else useSignalState(v43.getFetchedMarketplaceTimestamp)
	local setFetchingMarketplaceInProgress = v43.setFetchingMarketplaceInProgress
	local setFetchedMarketplaceCompleted = v43.setFetchedMarketplaceCompleted
	local setFetchingMarketplaceErrorOccured = v43.setFetchingMarketplaceErrorOccured
	local setFetchingMarketplaceProcessed = v43.setFetchingMarketplaceProcessed
	local v51 = useGetCategoryInfo()
	local categoryId = t1.categoryId
	local subcategoryId = t1.subcategoryId
	local v54 = GetCatalogCategoriesFromStore()
	local v55 = Utils.getCategoryInfoById(v54, categoryId, subcategoryId)

	if not v55 then
		mutedError("[useMarketplaceResultsFetcherSdui] categoryInfo is nil for categoryId: " .. tostring(categoryId) .. " and subcategoryId: " .. tostring(subcategoryId))
		v55 = v51
	end

	local SearchUuid = v55.SearchUuid
	local ShowSponsored = v55.ShowSponsored
	local WidgetContext = v55.WidgetContext
	local v59 = React.useCallback(function() -- line: 131
		-- upvalues: v40 (copy), FetchSponsoredItems (copy), v41 (copy), CatalogConstants (copy), Logging (copy), Promise (copy)
		local v61 = v40(FetchSponsoredItems(v41, CatalogConstants.SponsoredItemsCategoryRecommended, CatalogConstants.SponsoredItemsToFetch))

		if v61 and v61.andThen then
			return v61:catch(function(p1) -- line: 141
				-- upvalues: Logging (copy), Promise (copy)
				Logging.warn("useMarketplaceResultsFetcherSdui: Fetch sponsored items failed: " .. tostring(p1))

				return Promise.reject(p1)
			end)
		end

		return Promise.resolve()
	end, {
		v41,
		v40
	})
	local v60 = React.useCallback(function() -- line: 159
		-- upvalues: getAXMarketplaceWidgetStore (copy), HttpService (copy), SduiLoadTimer (copy), AvatarScreen (copy), fetchCatalogPage (copy), WidgetContext (copy), Promise (copy), v42 (copy), selectIsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsLandscape (copy), hydrateCatalogSortEntities (copy), v40 (copy), v41 (copy), SetHydratedWidgetData (copy), WebApi (copy), setFetchingMarketplaceErrorOccured (copy)
		local v62 = getAXMarketplaceWidgetStore(false).getDebouncedScreenSize(false)
		local guid = HttpService:GenerateGUID(true)
		local v64 = SduiLoadTimer.createLoadTimer(AvatarScreen.Catalog)
		local v65 = fetchCatalogPage({
			requestId = guid,
			context = WidgetContext or "",
			screenSize = v62
		}, v64)

		if typeof(v65) ~= "table" or typeof(v65.andThen) ~= "function" then
			return Promise.resolve()
		end

		return v65:andThen(function() -- line: 183
			-- upvalues: v42 (copy), selectIsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsPortrait (copy), FIntAXPrefetchWidgetHydrationRowsLandscape (copy), hydrateCatalogSortEntities (copy), v40 (copy), v41 (copy), SetHydratedWidgetData (copy), WebApi (copy)
			local v68 = v42:getState()
			local v69 = if not selectIsPortrait(v68) then FIntAXPrefetchWidgetHydrationRowsLandscape else FIntAXPrefetchWidgetHydrationRowsPortrait

			hydrateCatalogSortEntities(v40, v41, SetHydratedWidgetData, WebApi, v69)
		end, function(p2) -- line: 197
			-- upvalues: setFetchingMarketplaceErrorOccured (copy), Promise (copy)
			setFetchingMarketplaceErrorOccured()

			return Promise.reject(p2)
		end)
	end, {
		WidgetContext,
		v42,
		v40,
		v41,
		setFetchingMarketplaceErrorOccured
	})

	return {
		fetchMarketplace = React.useCallback(function() -- line: 212
			-- upvalues: setFetchingMarketplaceInProgress (copy), v40 (copy), SetSearchTime (copy), SearchUuid (copy), v60 (copy), ShowSponsored (copy), v59 (copy), Promise (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), OrganicTTIMilestoneManager (copy), setFetchedMarketplaceCompleted (copy), sendAXCounterV2 (copy), Constants (copy), setFetchingMarketplaceProcessed (copy)
			setFetchingMarketplaceInProgress()
			v40(SetSearchTime(SearchUuid, tick()))

			local t2 = { v60() }

			if ShowSponsored then
				table.insert(t2, v59())
			end

			Promise.all(t2):andThen(function() -- line: 234
				-- upvalues: FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), OrganicTTIMilestoneManager (copy), setFetchedMarketplaceCompleted (copy)
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
			end):catch(function(p3) -- line: 253
				-- upvalues: sendAXCounterV2 (copy), Constants (copy)
				local ok, result = pcall(function() -- line: 254
					-- upvalues: p3 (copy)
					return (string.sub(tostring(p3), 1, 100))
				end)

				sendAXCounterV2(Constants.Counter.Catalog.Errors.FetchMarketplaceSduiError, {
					error = not ok and "unknown" or result
				})
			end)
			Promise.allSettled(t2):finally(function() -- line: 264
				-- upvalues: setFetchingMarketplaceProcessed (copy)
				if setFetchingMarketplaceProcessed then
					setFetchingMarketplaceProcessed()
				end
			end)

			if FFlagAXEnableMilestoneTrackingForAvatarExperience then
				if WidgetsPercievedTTIManager then
					WidgetsPercievedTTIManager.L3.networkFetch()
				end

				if OrganicTTIMilestoneManager then
					OrganicTTIMilestoneManager.L3.networkFetch()
				end
			end
		end, {
			SearchUuid,
			setFetchingMarketplaceInProgress,
			setFetchedMarketplaceCompleted,
			setFetchingMarketplaceProcessed,
			v40,
			v60,
			v59,
			ShowSponsored
		}),
		hasFetched = v45,
		isFetching = v44,
		fetchedMarketplaceTimestamp = if not FFlagAXPrefetchOnlyWithinTTL then nil else v46
	}
end
