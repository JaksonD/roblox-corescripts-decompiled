local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local IXPService = game:GetService("IXPService")
local LocalizationService = game:GetService("LocalizationService")
local Cryo = require(CorePackages.Packages.Cryo)
local Promise = require(Modules.LuaApp.Promise)
local PromiseUtilities = require(Modules.LuaApp.PromiseUtilities)
local RetrievalStatus = require(Modules.LuaApp.Enum.RetrievalStatus)
local NetworkProfiler = require(CorePackages.Workspace.Packages.Http).NetworkProfiler
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local WaitUntilIXPUserInit = require(Modules.LuaApp.Thunks.WaitUntilIXPUserInit)
local HttpCanceller = require(CorePackages.Workspace.Packages.Http).NetworkLayers.HttpCanceller
local OmniFeedConstants = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedConstants
local Modules2 = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local FetchGamesPageData = Modules2.LuaApp.Thunks.FetchGamesPageData
local FetchHomePageData = Modules2.LuaApp.Thunks.FetchHomePageData
local FetchUserDataForHomePage = Modules2.LuaApp.Thunks.FetchUserDataForHomePage
local FetchNotificationCount = require(Modules.LuaApp.Thunks.FetchNotificationCount)
local ApiFetchSiteMessage = require(Modules.LuaApp.Thunks.ApiFetchSiteMessage)
local ApiFetchAutocompleteLocalCache = require(Modules.LuaApp.Thunks.ApiFetchAutocompleteLocalCache)
local ApiFetchEconomyCurrency = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local ReportToDiagByCountryCode = require(CorePackages.Workspace.Packages.Analytics).ReportToDiagByCountryCode
local usersFriendsPresenceOnAppStartup = require(Modules.LuaApp.Analytics.Events.usersFriendsPresenceOnAppStartup)
local FlagSettings = require(Modules.LuaApp.FlagSettings)
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange

local function startStandardAppFirstClassPagePreloadOperations(p1) -- line: 41
	-- upvalues: RetrievalStatus (copy), FetchHomePageData (copy), OmniFeedConstants (copy), Promise (copy), PromiseUtilities (copy)
	local networkImpl = p1.networkImpl
	local analytics = p1.analytics
	local store = p1.store
	local userId = p1.userId
	local loggingProtocol = p1.loggingProtocol
	local omniRecommendationsRequest = p1.omniRecommendationsRequest
	local prefetchProtocol = p1.prefetchProtocol
	local t1 = {}

	if store:getState().Startup.HomePageDataStatus == RetrievalStatus.NotStarted then
		if loggingProtocol then
			loggingProtocol:logEventOnce("preload_loading_home")
		end

		table.insert(t1, (store:dispatch(FetchHomePageData(networkImpl, omniRecommendationsRequest, analytics, userId, p1.policyData.getUseOmniRecommendation(), loggingProtocol, prefetchProtocol, OmniFeedConstants.OmniRecommendationsRequestIntent.LogIn, nil, true))))
	elseif store:getState().Startup.FetchHomePageDataStatusAll == RetrievalStatus.Fetching then
		if loggingProtocol then
			loggingProtocol:logEventOnce("preload_home_already_loading")
		end

		local u39 = nil

		table.insert(t1, (Promise.new(function(p2, p3) -- line: 79
			-- upvalues: u39 (ref), store (copy), RetrievalStatus (copy)
			u39 = store.changed:connect(function(p4, p5) -- line: 80
				-- upvalues: RetrievalStatus (copy), u39 (ref), p2 (copy), p3 (copy)
				if p5.Startup.FetchHomePageDataStatusAll == RetrievalStatus.Fetching and p4.Startup.FetchHomePageDataStatusAll ~= p5.Startup.FetchHomePageDataStatusAll then
					if u39 ~= nil then
						u39:disconnect()
						u39 = nil
					end

					if p4.Startup.FetchHomePageDataStatusAll == RetrievalStatus.Done then
						p2()

						return
					end

					p3()
				end
			end)
		end)))
	end

	return PromiseUtilities.Batch(t1):andThen(function(p6) -- line: 101
		-- upvalues: loggingProtocol (copy), PromiseUtilities (copy), t1 (copy)
		if loggingProtocol then
			loggingProtocol:logEventOnce("preload_first_class_end")
		end

		local failureCount = PromiseUtilities.CountResults(p6).failureCount

		if failureCount ~= 0 then
			warn(string.format("%d of %d first-class preloading operations failed!", failureCount, #t1))

			if loggingProtocol then
				loggingProtocol:logEventOnce("preload_first_class_error")
			end
		end
	end)
end
local function startStandardAppSecondClassPagePreloadOperations(p7) -- line: 116
	-- upvalues: FetchUserDataForHomePage (copy), FetchNotificationCount (copy), LocalizationService (copy), WaitUntilIXPUserInit (copy), IXPService (copy), AppUserLayers (copy), ApiFetchAutocompleteLocalCache (copy), FlagSettings (copy), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), RetrievalStatus (copy), FetchGamesPageData (copy), Cryo (copy), ApiFetchEconomyCurrency (copy), ApiFetchSiteMessage (copy), PromiseUtilities (copy)
	if p7.loggingProtocol then
		p7.loggingProtocol:logEventOnce("preload_second_class_begin")
	end

	local networkImpl = p7.networkImpl
	local analytics = p7.analytics
	local store = p7.store
	local platform = p7.platform
	local t2 = {}

	store:dispatch(FetchUserDataForHomePage(networkImpl, p7.userId))
	table.insert(t2, store:dispatch(FetchNotificationCount(networkImpl)))

	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local userId = p7.userId

	table.insert(t2, (store:dispatch(WaitUntilIXPUserInit(IXPService, userId)):andThen(function() -- line: 136
		-- upvalues: IXPService (copy), AppUserLayers (copy), store (copy), ApiFetchAutocompleteLocalCache (copy), networkImpl (copy), RobloxLocaleId (copy)
		local variationId = IXPService:GetUserLayerVariables(AppUserLayers.SearchAutocompleteLayer).variationId

		return store:dispatch(ApiFetchAutocompleteLocalCache.Fetch(networkImpl, 0, RobloxLocaleId, variationId))
	end)))

	if FlagSettings.IsLuaGamesPagePreloadingEnabled(platform) and ((if not FFlagLuaAppChartsResetFetchingStatusOnFilterChange then store:getState().Startup.GamesPageDataStatus else store:getState().Startup.GamesPageDataStatus.status)) == RetrievalStatus.NotStarted then
		table.insert(t2, (store:dispatch(FetchGamesPageData(networkImpl, analytics, nil))))
	end

	local u48 = Cryo.Dictionary.join(t2, {})
	local v49 = store:dispatch(ApiFetchEconomyCurrency(networkImpl, p7.userId, true))

	table.insert(u48, v49)
	table.insert(u48, store:dispatch(ApiFetchSiteMessage(networkImpl)))

	return PromiseUtilities.Batch(u48):andThen(function(p8) -- line: 167
		-- upvalues: PromiseUtilities (copy), u48 (ref)
		local failureCount = PromiseUtilities.CountResults(p8).failureCount

		if failureCount ~= 0 then
			warn(string.format("%d of %d second-class preloading operations failed!", failureCount, #u48))
		end
	end)
end

return function(p9, _, p11, p12, p13, p14, p15) -- line: 176
	-- upvalues: HttpCanceller (copy), Players (copy), startStandardAppFirstClassPagePreloadOperations (copy), NetworkProfiler (copy), ReportToDiagByCountryCode (copy), usersFriendsPresenceOnAppStartup (copy), startStandardAppSecondClassPagePreloadOperations (copy), Promise (copy)
	return function(p16) -- line: 185
		-- upvalues: p13 (copy), HttpCanceller (copy), p9 (copy), p11 (copy), p12 (copy), Players (copy), p15 (copy), startStandardAppFirstClassPagePreloadOperations (copy), NetworkProfiler (copy), ReportToDiagByCountryCode (copy), usersFriendsPresenceOnAppStartup (copy), p14 (copy), startStandardAppSecondClassPagePreloadOperations (copy), Promise (copy)
		if p13 then
			p13:logEventOnce("preload_first_class_begin")
		end

		local v65 = HttpCanceller.currentSession()
		local t3 = {
			networkImpl = p9,
			analytics = p11,
			store = p16,
			policyData = p12,
			platform = p16:getState().Platform,
			userId = tostring(Players.LocalPlayer.UserId),
			loggingProtocol = p13,
			prefetchProtocol = p15
		}

		return startStandardAppFirstClassPagePreloadOperations(t3):andThen(function() -- line: 201
			-- upvalues: NetworkProfiler (copy), ReportToDiagByCountryCode (copy), usersFriendsPresenceOnAppStartup (copy), p16 (copy), p11 (copy), v65 (copy), HttpCanceller (copy), p14 (copy), startStandardAppSecondClassPagePreloadOperations (copy), t3 (copy), Promise (copy)
			NetworkProfiler:report(ReportToDiagByCountryCode)
			usersFriendsPresenceOnAppStartup(p16:getState(), p11)

			if v65 ~= HttpCanceller.currentSession() then
				return
			end

			if not p14 or p14.isInteractive then
				return startStandardAppSecondClassPagePreloadOperations(t3)
			end

			return Promise.new(function(p17) -- line: 217
				-- upvalues: p14 (copy), v65 (copy), HttpCanceller (copy), startStandardAppSecondClassPagePreloadOperations (copy), t3 (copy)
				local u70 = nil

				u70 = p14.changed:connect(function() -- line: 219
					-- upvalues: p14 (copy), u70 (ref), v65 (copy), HttpCanceller (copy), p17 (copy), startStandardAppSecondClassPagePreloadOperations (copy), t3 (copy)
					if p14.isInteractive then
						if u70 ~= nil then
							u70:disconnect()
							u70 = nil
						end

						if v65 ~= HttpCanceller.currentSession() then
							return
						end

						p17(startStandardAppSecondClassPagePreloadOperations(t3))
					end
				end)
			end)
		end)
	end
end
