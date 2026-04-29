local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local ScriptContext = game:GetService("ScriptContext")
local React = require(CorePackages.Packages.React)
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local UIBlox = require(CorePackages.Packages.UIBlox)
local LoadingStateContainer = UIBlox.App.Container.LoadingStateContainer
local RetrievalStatus = UIBlox.App.Loading.Enum.RetrievalStatus
local RoactNavigation = require(CorePackages.Packages.RoactNavigation)
local t = require(CorePackages.Packages.t)
local Cryo = require(CorePackages.Packages.Cryo)
local DiscoveryTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local GameSortGroups = DiscoveryTypes.GameSortGroups
local OmniFeedTypes = DiscoveryTypes.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypes.OmniFeedConstants
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAnalytics = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalytics
local AppStartupSequenceTag = require(CorePackages.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local AppPrefetch = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPrefetch
local AppAppLifecycleObserverService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppAppLifecycleObserverService
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local Promise = require(CorePackages.Packages.Promise)
local SetNetworkingErrorToast = require(CorePackages.Workspace.Packages.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local RetrievalStatus2 = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local feedScroll = require(CorePackages.Workspace.Packages.ScrollTelemetry).feedScroll
local FetchStatusRodux = require(CorePackages.Workspace.Packages.FetchStatusRodux)
local FetchStatusNamespace = FetchStatusRodux.FetchStatusNamespace
local FetchStatusReducer = FetchStatusRodux.FetchStatusReducer
local VerticalEfficiencyExperimentation = require(CorePackages.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation
local DiscoveryAppLaunchTracker = require(CorePackages.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local usePreferredInput = Responsive.usePreferredInput
local useIsSpatial = Responsive.useIsSpatial
local AppStartup = require(CorePackages.Workspace.Packages.AppStartup)
local SocialUpsell = require(CorePackages.Workspace.Packages.SocialUpsell)
local default = AppStartup.AppStartupSequence.default
local ServerDrivenUi = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local useCollectionLayoutConfig = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionLayoutConfig
local FeedVideoPlaybackContext = require(CorePackages.Workspace.Packages.VideoUtils).FeedVideoPlaybackContext
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local ApiFetchOmniRecommendations = Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations
local OmniFeedAutoRefresher = Modules.LuaApp.Components.Games.OmniFeedAutoRefresher
local RefreshGameSorts = Modules.LuaApp.Thunks.RefreshGameSorts
local FetchHomePageData = Modules.LuaApp.Thunks.FetchHomePageData
local FetchHomePageContactMethodModuleVariation = Modules.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation
local Modules2 = game:GetService("CoreGui").RobloxGui.Modules
local RefreshSiteAlertInfo = require(Modules2.LuaApp.Actions.RefreshSiteAlertInfo)
local AddLocalOmniItems = require(Modules2.Personalization.OmniFeed.DataStore.AddLocalOmniItems)
local PageSessionManager = require(Modules2.Personalization.Sessions.PageSessionManager)
local setHomePageSessionInfo = require(Modules2.Personalization.Sessions.setHomePageSessionInfo)
local OmniFeedViewLoadMore = require(Modules2.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore)
local ScrollingPerfTracker = require(Modules2.Personalization.Analytics.ScrollingPerfTracker)
local useBannerContainer = require(Modules2.LuaApp.Components.Banner.useBannerContainer)
local OptionalContactMethodUpsellTypes = require(Modules2.LuaApp.Enum.OptionalContactMethodUpsellTypes)
local HomeOmniFeedExperimentation = require(Modules2.Personalization.Home.HomeOmniFeed.HomeOmniFeedExperimentation)
local v63 = game:DefineFastInt("LuaAppHomeFeedProfilePosition", 1)
local v64 = game:DefineFastInt("LuaAppHomeFeedFriendsPosition", 1)
local v65 = game:DefineFastInt("LuaAppHomeFeedUpsellCardPosition", 1)
local v66 = game:DefineFastFlag("TriggerLuaAppInteractiveFromLua", false)
local EngineFeature = game:GetEngineFeature("TriggerReportLuaRequireCountFromLua")
local GetFFlagFixFetchNextOmniWithoutPageToken = Modules.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken
local GetFFlagEnableHomePageUpsellCard = Modules.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard
local GetFFlagEnableHomePageEmailUpsellCard = require(Modules2.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard)
local FFlagLuaAppMoveProfileIntoTopBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar
local FFlagLuaAppMoveProfileIntoTopBarIXP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP
local GetFFlagEnableVoiceTrialUpsellCard = require(Modules2.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard)
local FFlagLuaAppEnableRelativeGuiHomeForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeForAll
local FFlagLuaAppEnableRelativeGuiHomeWithIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeWithIxp
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlags.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlags.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppCompositionHome = SharedFlags.FFlagLuaAppCompositionHome
local FFlagLuaAppRfySignalApportioning = SharedFlags.FFlagLuaAppRfySignalApportioning
local FFlagEnableAppStoreAgeSignalsOnHomePage = SharedFlags.FFlagEnableAppStoreAgeSignalsOnHomePage
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = SharedFlags.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = SharedFlags.FFlagLuaAppHomeTouchAutoplay
local FFlagEnableIAFlyoutIXPHomeProfileRemoval = require(Modules2.Personalization.Flags.FFlagEnableIAFlyoutIXPHomeProfileRemoval)
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local v86 = game:DefineFastFlag("AppIaHomeOmniFeedFix", false)
local Home = AppPage.Home
local v88 = if not v86 then nil else {}
local v89 = Roact.PureComponent:extend("HomeOmniFeed")

v89.validateProps = t.strictInterface({
	canvasTopPadding = if not FFlagAppIaScrollAway then nil else t.optional(t.number),
	hasNextPage = t.optional(t.boolean),
	homeOmniFetchStatus = if not GetFFlagFixFetchNextOmniWithoutPageToken() then nil else t.optional(t.string),
	localUserId = t.string,
	homePageDataStatus = t.string,
	omniFeedItems = if not v86 then t.optional(t.table) else t.table,
	hasLocalOmniItems = t.optional(t.boolean),
	recommendationsRequestId = t.optional(t.string),
	omniSessionId = t.optional(t.string),
	omniItemsGlobalLayoutData = t.optional(t.table),
	screenSize = t.Vector2,
	formFactor = if not FFlagLuaAppMoveProfileIntoTopBar then nil else t.string,
	upsellCardVariation = t.optional(t.table),
	addLocalFeedItems = t.callback,
	refresh = t.callback,
	loadNext = t.optional(t.callback),
	fetchHomePageData = t.callback,
	fetchHomePageContactMethodModuleVariation = t.optional(t.callback),
	isOmni = t.optional(t.boolean),
	appAnalytics = t.any,
	networking = t.any,
	loggingProtocol = t.optional(t.any),
	prefetchProtocol = t.optional(t.any),
	sessionService = t.optional(t.any),
	appStartupSequence = t.any,
	eventIngest = t.any,
	appLifecycleObserverService = if not v66 then nil else t.optional(t.any),
	navigation = t.any,
	header = t.optional(t.any),
	headerHeight = t.number,
	relativeGuiEnabled = if not FFlagLuaAppEnableRelativeGuiHomeForAll and not FFlagLuaAppEnableRelativeGuiHomeWithIxp then nil else t.optional(t.boolean),
	shouldStopAfterOneGameSort = t.boolean,
	sduiContext = t.table,
	setScrollingFrame = if not FFlagLuaAppLayoutParamsInContext then nil else t.optional(t.callback),
	onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t.optional(t.callback),
	videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else t.optional(t.table),
	onScrollStart = if not FFlagLuaAppHomeTouchAutoplay then nil else t.optional(t.callback),
	onScrollSettled = if not FFlagLuaAppHomeTouchAutoplay then nil else t.optional(t.callback)
})

local function v90(p1, p2) -- line: 174
	-- upvalues: OptionalContactMethodUpsellTypes (copy), GetFFlagEnableHomePageEmailUpsellCard (copy), GetFFlagEnableVoiceTrialUpsellCard (copy)
	return p1 == OptionalContactMethodUpsellTypes.ContactMethodPhoneNumber or (p1 == OptionalContactMethodUpsellTypes.ContactMethodPhoneNumberVoiceOptIn or (p1 == OptionalContactMethodUpsellTypes.ContactMethodPhoneNumberEmailVerticalLayout or (p1 == OptionalContactMethodUpsellTypes.ContactMethodPhoneNumberEmailHorizontalLayout or (GetFFlagEnableHomePageEmailUpsellCard() and p1 == OptionalContactMethodUpsellTypes.ContactMethodEmail or (GetFFlagEnableVoiceTrialUpsellCard() and p1 == OptionalContactMethodUpsellTypes.VoiceWithoutPvTrial or p2 and (p2.upsellCardType ~= "" and p2.upsellCardV2Config ~= nil))))))
end

function v89.init(p3) -- line: 191
	-- upvalues: GetFFlagFixFetchNextOmniWithoutPageToken (copy), RetrievalStatus2 (copy), Promise (copy), Roact (copy), FFlagLuaAppLayoutParamsInContext (copy), feedScroll (copy), Home (copy), DiscoveryAppLaunchTracker (copy), v66 (copy), EngineFeature (copy), ScriptContext (copy), setHomePageSessionInfo (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FormFactor (copy), FFlagLuaAppMoveProfileIntoTopBarIXP (copy), VerticalEfficiencyExperimentation (copy), v63 (copy), FFlagEnableIAFlyoutIXPHomeProfileRemoval (copy), FlyoutSidePanelIXP (copy), OmniFeedTypes (copy), GetFFlagEnableHomePageUpsellCard (copy), v90 (copy), v65 (copy), OmniFeedConstants (copy), v64 (copy), RoactNavigation (copy)
	p3.props.loggingProtocol:logEventOnce("home_page_container_init")
	p3.isMounted = false

	function p3.loadNext() -- line: 196
		-- upvalues: p3 (copy), GetFFlagFixFetchNextOmniWithoutPageToken (copy), RetrievalStatus2 (copy), Promise (copy)
		local hasNextPage = p3.props.hasNextPage
		local loadNext = p3.props.loadNext

		if GetFFlagFixFetchNextOmniWithoutPageToken() then
			local homeOmniFetchStatus = p3.props.homeOmniFetchStatus

			if hasNextPage and loadNext and homeOmniFetchStatus ~= RetrievalStatus2.Fetching then
				return loadNext(p3.props.networking, p3.props.omniRecommendationsRequest, p3.props.loggingProtocol)
			end
		elseif hasNextPage and loadNext then
			return loadNext(p3.props.networking, p3.props.omniRecommendationsRequest, p3.props.loggingProtocol)
		end

		return Promise.resolve()
	end
	function p3.fetchHomePageData() -- line: 225
		-- upvalues: p3 (copy)
		return p3.props.fetchHomePageData(p3.props.networking, p3.props.omniRecommendationsRequest, p3.props.appAnalytics, p3.props.localUserId, p3.props.isOmni, p3.props.loggingProtocol, p3.props.prefetchProtocol)
	end
	function p3.fetchHomePageContactMethodModuleVariation() -- line: 237
		-- upvalues: p3 (copy)
		return p3.props.fetchHomePageContactMethodModuleVariation(p3.props.networking)
	end

	p3.scrollingFrameRef = Roact.createRef()

	if FFlagLuaAppLayoutParamsInContext then
		function p3.setScrollingFrameRef(p4) -- line: 243
			-- upvalues: p3 (copy)
			p3.scrollingFrameRef.current = p4

			if p3.props.setScrollingFrame then
				p3.props.setScrollingFrame(p4)
			end
		end
	end

	function p3.sendScrollEvent(n1: number, n2: number, n3: number) -- line: 251
		-- upvalues: p3 (copy), feedScroll (copy), Home (copy)
		local ScrollingDirectionY = Enum.ScrollingDirection.Y

		if ScrollingDirectionY then
			local n4 = 0

			if p3.scrollingFrameRef.current then
				n4 = p3.scrollingFrameRef.current.AbsoluteSize.Y
			end

			local t1 = {
				distance = n1,
				screenSizeX = p3.props.screenSize.X,
				screenSizeY = p3.props.screenSize.Y,
				scrollAreaSize = n4,
				scrollDepth = if not (n4 > 0) then nil else n1 / n4,
				startDepth = if not (n4 > 0) then nil else n3 / n4,
				startPos = n3,
				scrollDuration = n2
			}

			feedScroll(p3.props.eventIngest, Home, ScrollingDirectionY, t1)
		end
	end
	function p3.logHomePageInteractive(p5) -- line: 275
		-- upvalues: p3 (copy), DiscoveryAppLaunchTracker (copy), v66 (copy), EngineFeature (copy), ScriptContext (copy)
		if not p3.isMounted then
			return
		end

		if not p5 then
			return
		end

		if p3.props.appStartupSequence.isInteractive then
			return
		end

		if p5.AbsoluteSize.X > 1 and p5.AbsoluteSize.Y > 1 then
			p3.props.loggingProtocol:logEventOnce("home_page_interactive_legacy")
			task.defer(function() -- line: 290
				-- upvalues: p3 (copy), DiscoveryAppLaunchTracker (copy), v66 (copy), EngineFeature (copy), ScriptContext (copy)
				p3.props.loggingProtocol:logEventOnce("home_page_interactive")

				if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
					DiscoveryAppLaunchTracker.default:stopTracking()
				end

				if v66 and game:GetEngineFeature("LuaAppInteractiveSignalEnabled") then
					p3.props.appLifecycleObserverService:TriggerOnLuaAppInteractive()
				elseif EngineFeature then
					ScriptContext:ReportLuaRequireCount()
				end

				task.defer(function() -- line: 307
					-- upvalues: p3 (copy)
					p3.props.appStartupSequence:setInteractive()
				end)
			end)
		end
	end
	function p3.setHomePageSessionInfoFunc() -- line: 314
		-- upvalues: setHomePageSessionInfo (copy), p3 (copy)
		setHomePageSessionInfo(p3.props.sessionService, p3.props.recommendationsRequestId, p3.props.omniSessionId)
	end
	function p3.insertLocalFeedItem(p6, p7, p8, p9, p10) -- line: 318
		table.insert(p6, {
			orderIndex = p7,
			treatmentType = p8,
			treatmentProps = p9,
			numberOfRows = p10
		})
	end
	function p3.createLocalFeedItems() -- line: 327
		-- upvalues: p3 (copy), RetrievalStatus2 (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FormFactor (copy), FFlagLuaAppMoveProfileIntoTopBarIXP (copy), VerticalEfficiencyExperimentation (copy), v63 (copy), FFlagEnableIAFlyoutIXPHomeProfileRemoval (copy), FlyoutSidePanelIXP (copy), OmniFeedTypes (copy), GetFFlagEnableHomePageUpsellCard (copy), v90 (copy), v65 (copy), OmniFeedConstants (copy), v64 (copy)
		local homePageDataStatus = p3.props.homePageDataStatus

		if homePageDataStatus == RetrievalStatus2.NotStarted or homePageDataStatus == RetrievalStatus2.Fetching then
			return
		end

		local t2 = {}
		local v158 = nil

		if FFlagLuaAppMoveProfileIntoTopBar then
			v158 = p3.props.formFactor == FormFactor.COMPACT and (not FFlagLuaAppMoveProfileIntoTopBarIXP or VerticalEfficiencyExperimentation.getIsProfileMovedToTopBar())
		end

		if v63 > 0 and (not FFlagLuaAppMoveProfileIntoTopBar or not v158) and (not FFlagEnableIAFlyoutIXPHomeProfileRemoval or not FlyoutSidePanelIXP.isProfileEntryRemoved()) then
			p3.insertLocalFeedItem(t2, v63, OmniFeedTypes.UserInfo, {}, 0)
		end

		if GetFFlagEnableHomePageUpsellCard() and (p3.props.upsellCardVariation and (v90(p3.props.upsellCardVariation.upsellCardType, p3.props.upsellCardVariation) and v65 > 0)) then
			p3.insertLocalFeedItem(t2, v65, OmniFeedTypes.UpsellCard, {})
		end

		local omniItemsGlobalLayoutData = p3.props.omniItemsGlobalLayoutData

		if (not omniItemsGlobalLayoutData or omniItemsGlobalLayoutData[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] ~= "true" and omniItemsGlobalLayoutData[OmniFeedConstants.GlobalLayoutDataKeys.JYFRefresh] ~= true) and v64 > 0 then
			p3.insertLocalFeedItem(t2, v64, OmniFeedTypes.FriendCarousel, {})
		end

		p3.props.addLocalFeedItems(t2)
	end
	function p3.fetchDataIfNeeded() -- line: 393
		-- upvalues: p3 (copy), RetrievalStatus2 (copy)
		if p3.props.homePageDataStatus == RetrievalStatus2.NotStarted then
			p3.fetchHomePageData()
		end
	end

	p3._willFocusListener = p3.props.navigation.addListener(RoactNavigation.Events.WillFocus, function() -- line: 399
		-- upvalues: p3 (copy)
		p3.fetchDataIfNeeded()
	end)

	function p3.omniFeedRefresh(s1: string?) -- line: 403
		-- upvalues: p3 (copy)
		return p3.props.refresh(p3.props.networking, p3.props.omniRecommendationsRequest, p3.props.isOmni, s1, p3.props.loggingProtocol)
	end

	p3.fetchDataIfNeeded()
	p3.createLocalFeedItems()
end
function v89.render(p11) -- line: 418
	-- upvalues: RetrievalStatus2 (copy), Roact (copy), SocialUpsell (copy), FFlagEnableAppStoreAgeSignalsOnHomePage (copy), OmniFeedAutoRefresher (copy), AppPage (copy), GameSortGroups (copy), PageSessionManager (copy), Home (copy), LoadingStateContainer (copy), RetrievalStatus (copy), OmniFeedViewLoadMore (copy), FFlagLuaAppLayoutParamsInContext (copy), OmniFeedConstants (copy), FFlagLuaAppEnableRelativeGuiHomeForAll (copy), FFlagLuaAppEnableRelativeGuiHomeWithIxp (copy), FFlagAppIaScrollAway (copy), FFlagLuaAppCompositionHome (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy)
	local homePageDataStatus = p11.props.homePageDataStatus
	local isOmni = p11.props.isOmni

	if homePageDataStatus ~= RetrievalStatus2.NotStarted and homePageDataStatus ~= RetrievalStatus2.Fetching and not p11.props.hasLocalOmniItems then
		homePageDataStatus = RetrievalStatus2.Fetching
	end

	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	}, {
		SocialUpsellEventReceiver = Roact.createElement(SocialUpsell.SocialUpsellEventReceiver, {
			onAgeVerifiedChange = p11.fetchHomePageContactMethodModuleVariation,
			shouldRequestAppAgeSignals = FFlagEnableAppStoreAgeSignalsOnHomePage
		}),
		TokenRefreshComponent = Roact.createElement(OmniFeedAutoRefresher, {
			isOmni = isOmni,
			pageType = AppPage.Home,
			sortToRefresh = GameSortGroups.HomeGames
		}),
		PageSessionManager = Roact.createElement(PageSessionManager, {
			appPage = Home,
			setPageSession = p11.setHomePageSessionInfoFunc
		}),
		LoadingStateContainer = Roact.createElement(LoadingStateContainer, {
			dataStatus = RetrievalStatus.fromRawValue(homePageDataStatus),
			onRetry = p11.fetchHomePageData,
			renderOnLoaded = function() --[[ renderOnLoaded ]] -- line: 448
				-- upvalues: Roact (copy), OmniFeedViewLoadMore (copy), Home (copy), p11 (copy), FFlagLuaAppLayoutParamsInContext (copy), OmniFeedConstants (copy), FFlagLuaAppEnableRelativeGuiHomeForAll (copy), FFlagLuaAppEnableRelativeGuiHomeWithIxp (copy), FFlagAppIaScrollAway (copy), FFlagLuaAppCompositionHome (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy)
				return Roact.createElement(OmniFeedViewLoadMore, {
					pageContext = Home,
					refresh = p11.omniFeedRefresh,
					omniFeedItems = p11.props.omniFeedItems,
					impressionsTag = "FEEDITEM_IMPRESSIONS",
					onAbsoluteSizeChanged = p11.logHomePageInteractive,
					hasNextPage = p11.props.hasNextPage,
					loadNext = p11.loadNext,
					scrollingFrameRef = if not FFlagLuaAppLayoutParamsInContext then p11.scrollingFrameRef else p11.setScrollingFrameRef,
					analyticsContext = OmniFeedConstants.EventContext,
					header = p11.props.header,
					headerHeight = p11.props.headerHeight,
					sendScrollEvent = p11.sendScrollEvent,
					enableRelativeGui = if not FFlagLuaAppEnableRelativeGuiHomeForAll and not FFlagLuaAppEnableRelativeGuiHomeWithIxp then nil else p11.props.relativeGuiEnabled,
					shouldStopAfterOneGameSort = p11.props.shouldStopAfterOneGameSort,
					canvasTopPadding = if not FFlagAppIaScrollAway then nil else p11.props.canvasTopPadding,
					sduiContext = p11.props.sduiContext,
					appCompositionEnabled = not not FFlagLuaAppCompositionHome or nil,
					onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else p11.props.onTileImageLoaded,
					videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else p11.props.videoPlaybackContext,
					onScrollStart = if not FFlagLuaAppHomeTouchAutoplay then nil else p11.props.onScrollStart,
					onScrollSettled = if not FFlagLuaAppHomeTouchAutoplay then nil else p11.props.onScrollSettled
				})
			end
		})
	})
end
function v89.didUpdate(p12, p13, _) -- line: 486
	if not p12.props.hasLocalOmniItems or (p13.omniItemsGlobalLayoutData ~= p12.props.omniItemsGlobalLayoutData or p13.homePageDataStatus ~= p12.props.homePageDataStatus or p13.upsellCardVariation ~= p12.props.upsellCardVariation) then
		p12.createLocalFeedItems()
	end

	if p12.scrollingPerf then
		p12.scrollingPerf:setScrollingFrame(p12.scrollingFrameRef.current)
	end
end
function v89.didMount(p15) -- line: 508
	-- upvalues: ScrollingPerfTracker (copy)
	p15.isMounted = true
	p15.logHomePageInteractive(p15.scrollingFrameRef.current)

	if ScrollingPerfTracker then
		p15.scrollingPerf = ScrollingPerfTracker.new("HomeOmniFeed", {
			loggingProtocol = p15.props.loggingProtocol,
			analyticsService = p15.props.appAnalytics
		})
		p15.scrollingPerf:setScrollingFrame(p15.scrollingFrameRef.current)
	end
end
function v89.willUnmount(p16) -- line: 522
	if p16.scrollingPerf then
		p16.scrollingPerf:clean()
		p16.scrollingPerf = nil
	end

	p16.isMounted = false

	if p16._willFocusListener ~= nil then
		p16._willFocusListener.remove()
		p16._willFocusListener = nil
	end
end

local function useIsInteractive() -- line: 661
	-- upvalues: React (copy), default (copy)
	local v121, v122 = React.useState(default.isInteractive)

	React.useEffect(function() -- line: 664
		-- upvalues: v122 (copy), default (copy), v121 (copy)
		v122(default.isInteractive)

		if not v121 then
			local v180 = default.changed:connect(function() -- line: 668
				-- upvalues: v122 (copy), default (copy)
				v122(default.isInteractive)
			end)

			return function() -- line: 671
				-- upvalues: v180 (copy)
				v180:disconnect()
			end
		end

		return function() -- line: 675
		end
	end, { v121 })

	return v121
end

local v92 = RoactRodux.connect(function(p17, p18) -- line: 535
	-- upvalues: Players (copy), GetFFlagFixFetchNextOmniWithoutPageToken (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), AppPage (copy), Home (copy), v86 (copy), v88 (copy), FFlagLuaAppMoveProfileIntoTopBar (copy)
	local recommendationsId = nil
	local omniSessionId = nil
	local nextPageToken = nil
	local LocalUserId = p17.LocalUserId

	if not LocalUserId or LocalUserId == "" then
		LocalUserId = Players.LocalPlayer and Players.LocalPlayer.UserId or 0
	end

	local v113 = if not GetFFlagFixFetchNextOmniWithoutPageToken() or not p18.isOmni then nil else p17.Personalization[FetchStatusReducer.key][FetchStatusNamespace.OmniRecommendations][AppPage.Home]

	if p18.isOmni then
		local v114 = p17.OmniRecommendations[AppPage.Home]

		if v114 then
			recommendationsId = v114.recommendationsId
			omniSessionId = v114.omniSessionId
			nextPageToken = v114.nextPageToken
		end
	end

	local v115 = nextPageToken ~= nil and (nextPageToken ~= "" and p18.isOmni)
	local v116 = p17.Personalization.OrderedOmniItems[Home]
	local v117 = v116 and v116.allItems or if not v86 then {} else v88
	local v118 = not not v116 and (v116.hasLocalItems or false)
	local OmniItemsGlobalLayoutData = p17.Personalization.OmniItemsGlobalLayoutData

	return {
		localUserId = tostring(LocalUserId),
		homePageDataStatus = p17.Startup.HomePageDataStatus,
		homeOmniFetchStatus = if not GetFFlagFixFetchNextOmniWithoutPageToken() then nil else v113,
		screenSize = p17.ScreenSize,
		formFactor = if not FFlagLuaAppMoveProfileIntoTopBar then nil else p17.FormFactor,
		upsellCardVariation = p17.HomePageUpsellCardVariation,
		hasNextPage = v115,
		recommendationsRequestId = recommendationsId,
		omniSessionId = omniSessionId,
		omniFeedItems = v117,
		hasLocalOmniItems = v118,
		omniItemsGlobalLayoutData = OmniItemsGlobalLayoutData
	}
end, function(p19) -- line: 585
	-- upvalues: AddLocalOmniItems (copy), Home (copy), ApiFetchOmniRecommendations (copy), AppPage (copy), OmniFeedConstants (copy), RefreshSiteAlertInfo (copy), RefreshGameSorts (copy), GameSortGroups (copy), Promise (copy), SetNetworkingErrorToast (copy), FetchHomePageData (copy), FetchHomePageContactMethodModuleVariation (copy)
	return {
		addLocalFeedItems = function(p20) --[[ addLocalFeedItems ]] -- line: 587
			-- upvalues: p19 (copy), AddLocalOmniItems (copy), Home (copy)
			p19(AddLocalOmniItems(p20, Home))
		end,
		loadNext = function(p21, p22, p23) --[[ loadNext ]] -- line: 590
			-- upvalues: p19 (copy), ApiFetchOmniRecommendations (copy), AppPage (copy), OmniFeedConstants (copy)
			return p19(ApiFetchOmniRecommendations(p21, p22, AppPage.Home, true, nil, OmniFeedConstants.OmniRecommendationsRequestIntent.LoadMore, p23))
		end,
		refresh = function(p24, p25, b1: boolean?, s2: string, p26) --[[ refresh ]] -- line: 603
			-- upvalues: p19 (copy), RefreshSiteAlertInfo (copy), ApiFetchOmniRecommendations (copy), AppPage (copy), RefreshGameSorts (copy), GameSortGroups (copy), Promise (copy), SetNetworkingErrorToast (copy)
			p19(RefreshSiteAlertInfo())

			local v170 = if not b1 then RefreshGameSorts(p24, { GameSortGroups.HomeGames }, nil, nil) else ApiFetchOmniRecommendations(p24, p25, AppPage.Home, nil, nil, s2, p26)
			local t3 = { p19(v170) }

			return Promise.all(t3):andThen(function(p27) -- line: 626
				-- upvalues: Promise (copy)
				return Promise.resolve(p27)
			end, function(p28) -- line: 628
				-- upvalues: p19 (copy), SetNetworkingErrorToast (copy), Promise (copy)
				p19(SetNetworkingErrorToast(p28))

				return Promise.reject(p28)
			end)
		end,
		fetchHomePageData = function(p29, p30, p31, p32, p33, p34, p35) --[[ fetchHomePageData ]] -- line: 633
			-- upvalues: p19 (copy), FetchHomePageData (copy), OmniFeedConstants (copy)
			return p19(FetchHomePageData(p29, p30, p31, p32, p33, p34, p35, OmniFeedConstants.OmniRecommendationsRequestIntent.LogIn))
		end,
		fetchHomePageContactMethodModuleVariation = function(p36) --[[ fetchHomePageContactMethodModuleVariation ]] -- line: 655
			-- upvalues: p19 (copy), FetchHomePageContactMethodModuleVariation (copy)
			return p19(FetchHomePageContactMethodModuleVariation(p36))
		end
	}
end)(v89)
local v93 = RoactAppPolicy.connect(function(p37, _) -- line: 764
	return {
		isOmni = p37.getUseOmniRecommendation()
	}
end)(function(p39) -- line: 681
	-- upvalues: useBannerContainer (copy), FFlagLuaAppEnableRelativeGuiHomeForAll (copy), FFlagLuaAppEnableRelativeGuiHomeWithIxp (copy), HomeOmniFeedExperimentation (copy), FFlagLuaAppHomeTouchAutoplay (copy), usePreferredInput (copy), useIsSpatial (copy), Responsive (copy), React (copy), FeedVideoPlaybackContext (copy), useIsInteractive (copy), FFlagLuaAppLayoutParamsInContext (copy), useCollectionLayoutConfig (copy), ServerDrivenUi (copy), Home (copy), FFlagLuaAppRfySignalApportioning (copy), FFlagLuaAppCompositionHome (copy), Roact (copy), v92 (copy), Cryo (copy)
	local v124, v125 = useBannerContainer()
	local v126 = nil

	if FFlagLuaAppEnableRelativeGuiHomeForAll then
		v126 = true
	elseif FFlagLuaAppEnableRelativeGuiHomeWithIxp then
		v126 = HomeOmniFeedExperimentation.getRelativeGuiOnHomeEnabled()
	end

	local v127 = nil

	if FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp or FFlagLuaAppHomeTouchAutoplay then
		v127 = usePreferredInput()
	end

	if FFlagLuaAppEnableRelativeGuiHomeForAll or FFlagLuaAppEnableRelativeGuiHomeWithIxp then
		local v128 = useIsSpatial()

		if v127 == Responsive.Input.Directional or v128 then
			v126 = false
		end
	end

	local u129 = nil
	local v130 = nil
	local v131 = nil

	if FFlagLuaAppHomeTouchAutoplay then
		local v132 = v127 == Responsive.Input.Touch

		u129 = React.useMemo(function() -- line: 710
			-- upvalues: FeedVideoPlaybackContext (copy), v132 (copy)
			return FeedVideoPlaybackContext.new(v132)
		end, { v132 })
		v130 = React.useCallback(function() -- line: 714
			-- upvalues: u129 (ref)
			if u129.viewportVideoAutoplayController then
				u129.viewportVideoAutoplayController:onScrollStart()
			end
		end, { u129.viewportVideoAutoplayController })
		v131 = React.useCallback(function(n5: number) -- line: 719
			-- upvalues: u129 (ref)
			if u129.viewportVideoAutoplayController then
				u129.viewportVideoAutoplayController:onScrollSettled("Y", n5, nil)
			end
		end, { u129.viewportVideoAutoplayController })
	end

	local v133 = useIsInteractive()
	local v134, v135 = React.useState(nil)
	local v136 = if not FFlagLuaAppLayoutParamsInContext then nil else useCollectionLayoutConfig(v134)
	local v137 = ServerDrivenUi.useSduiContextFromRoduxAndProcessConfigs(Home, if not FFlagLuaAppLayoutParamsInContext then nil else v136)

	if FFlagLuaAppRfySignalApportioning then
		ServerDrivenUi.useApportioningPreprocessingFromOmniRecommendations(Home, v136, not not FFlagLuaAppCompositionHome or nil)
	end

	return Roact.createElement(v92, Cryo.Dictionary.join(p39, {
		sduiContext = v137,
		shouldStopAfterOneGameSort = not v133,
		header = v124,
		headerHeight = v125,
		setScrollingFrame = if not FFlagLuaAppLayoutParamsInContext then nil else v135,
		relativeGuiEnabled = if not FFlagLuaAppEnableRelativeGuiHomeForAll and not FFlagLuaAppEnableRelativeGuiHomeWithIxp then nil else v126,
		videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else u129,
		onScrollStart = if not FFlagLuaAppHomeTouchAutoplay then nil else v130,
		onScrollSettled = if not FFlagLuaAppHomeTouchAutoplay then nil else v131
	}))
end)
local v94 = RoactNavigation.withNavigation(v93)

return (RoactServices.connect({
	appAnalytics = RoactAnalytics,
	networking = RoactNetworking,
	loggingProtocol = AppLogging,
	prefetchProtocol = AppPrefetch,
	sessionService = AppSessionService,
	appStartupSequence = AppStartupSequenceTag,
	eventIngest = AppEventIngestService,
	appLifecycleObserverService = if not v66 then nil else AppAppLifecycleObserverService
})(v94))
