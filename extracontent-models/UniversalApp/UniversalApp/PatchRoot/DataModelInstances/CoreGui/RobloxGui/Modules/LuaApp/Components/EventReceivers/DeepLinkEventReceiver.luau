local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = CoreGui.RobloxGui.Modules
local AccessResponseEnum = require(CorePackages.Workspace.Packages.AmpUpsell).AmpEnums.AccessResponseEnum
local AppBrowserService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppBrowserService
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local AmpApiProvider = require(CorePackages.Workspace.Packages.AmpUpsell).AmpApiProvider
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local Cryo = require(CorePackages.Packages.Cryo)
local DeepLink = require(CorePackages.Workspace.Packages.DeepLink)
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local CloseCentralOverlay = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local LoginStatus = require(Modules.LuaApp.Enum.LoginStatus)
local NavigateBack = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateBack
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local NavigateIntoAvatarExperience = require(Modules.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience)
local NavigateIntoChat = require(CorePackages.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoChat
local ShowFAESocialUpsellOverlay = require(CorePackages.Workspace.Packages.SocialUpsell).Thunks.ShowFAESocialUpsellOverlay
local startFacialAgeEstimation = require(CorePackages.Workspace.Packages.SocialUpsell).Thunks.startFacialAgeEstimation
local NavigateIntoSquadLobbyIfExists = require(CorePackages.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoSquadLobbyIfExists
local Promise = require(Modules.LuaApp.Promise)
local ResetNavigationHistory = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local RetrievalStatus = require(Modules.LuaApp.Enum.RetrievalStatus)
local SetSearchParameters = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchType = require(Modules.LuaApp.Actions.SetSearchType)
local RoactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsShareLinks = require(Modules.LuaApp.Services.RoactAnalyticsShareLinks)
local RoactAnalyticsSocialProfileShare = require(Modules.LuaApp.Services.RoactAnalyticsSocialProfileShare)
local EnteredChatFromEntryPoint = require(CorePackages.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint
local QualifiedSignUpAttribution = require(CorePackages.Workspace.Packages.AffiliateLinks).QualifiedSignUpAttribution
local AuthenticatedVisitAttribution = require(CorePackages.Workspace.Packages.AffiliateLinks).AuthenticatedVisitAttribution
local SocialUpsellType = require(CorePackages.Workspace.Packages.SocialUpsell).Enums.SocialUpsellType
local UpsellComponent = require(CorePackages.Workspace.Packages.SocialUpsell).Analytics.Enum.UpsellComponent
local AppPage = require(Modules.LuaApp.AppPage)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local DeepLinkMap = require(Modules.LuaApp.DeepLinks.DeepLinkMap)
local DeepLinkParser = require(Modules.LuaApp.DeepLinks.DeepLinkParser)
local EventNetworking = require(script.Parent.EventNetworking)
local LaunchContext = require(Modules.LuaApp.Enum.LaunchContext)
local LaunchGame = require(CorePackages.Workspace.Packages.GameLaunch).LaunchGame
local ShareLinkTypes = require(Modules.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes)
local UniversalAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy
local GetFFlagEnableAffiliateLinksQualifiedSignUpTracking = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAffiliateLinksQualifiedSignUpTracking
local v51 = game:DefineFastFlag("DeeplinkNavDurationLog", false)
local GetFFlagEnableUnifiedWebViews = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews
local FFlagTCUpdateProfileCTAButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCUpdateProfileCTAButton
local refreshProfilePlatformActionInfo = require(CorePackages.Workspace.Packages.ProfilePlatform.refreshProfilePlatformActionInfo)
local v55 = game:DefineFastFlag("DeeplinkTelemetryCounters", false)
local v56 = game:DefineFastFlag("EnableExperienceInviteLinkTypeAttribution", false)
local v57 = game:DefineFastString("JoinCodePattern", ".*/join/([%w]+)")
local FFlagEnableSquadDeeplinkWithChatId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId
local FFlagEnableAmpWizardDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAmpWizardDeepLink
local OpenAmpWizardContainer = nil

if FFlagEnableAmpWizardDeepLink then
	OpenAmpWizardContainer = require(CorePackages.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer
end

local FFlagEnableAuthDeepLinkReceiver = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver
local FFlagEnableDeepLinkHistoryWithModalAPI = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableDeepLinkHistoryWithModalAPI
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local v64 = game:DefineFastFlag("EnableJoinLinkAttribution", false)
local simpleUrlDecode = require(CorePackages.Workspace.Packages.SocialCommon).Utils.simpleUrlDecode
local v66 = DeepLinkParser.new(DeepLinkMap)
local ParseQuery = require(CorePackages.Packages.StringUtilities).ParseQuery
local v68 = game:DefineFastString("SocialCommsRestrictionsNamespace", "social/CommunicationRestrictions")
local v69 = game:DefineFastString("EligibleForCommsAgeVerificationUpsellFeatureName", "EligibleForCommsAgeVerificationUpsell")
local v70 = game:DefineFastFlag("EnableDeepLinkWaitForNavigationUnlock2", false)
local FFlagEnableSearchDeepLink = require(Modules.LuaApp.Flags.FFlagEnableSearchDeepLink)
local FFlagEnableFlyoutSidePanel = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local useSetDrawerVisible = nil

if FFlagEnableFlyoutSidePanel then
	useSetDrawerVisible = require(CorePackages.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible
end

local PostAuthDeepLinkAvailableSignal = require(CorePackages.Workspace.Packages.AuthCommon).EventReceivers.PostAuthDeepLinkAvailableSignal
local PostAuthPendingLuaUrlAvailableSignal = require(CorePackages.Workspace.Packages.AuthCommon).EventReceivers.PostAuthPendingLuaUrlAvailableSignal

function getJoinCode(p1) -- line: 130
	-- upvalues: v57 (copy)
	return (p1:match(v57))
end

local function getShareLinkType(p2) -- line: 135
	-- upvalues: ShareLinkTypes (copy), HttpService (copy)
	local v89 = string.lower(p2)

	for k, v in pairs(ShareLinkTypes) do
		if v89:find("&type=" .. string.lower(v)) then
			return k
		end

		local v92 = HttpService:UrlEncode("&type=" .. v)
		local v93 = string.gsub(v92, "%%", "%%%%")

		if v89:find((string.lower(v93))) then
			return k
		end
	end

	return nil
end
local function getScreenAndParams(p3) -- line: 155
	-- upvalues: Cryo (copy)
	local v95 = p3[#p3]

	return v95.name, (Cryo.Dictionary.join(v95.extraProps or {}, {
		detail = v95.detail
	}))
end

local v78 = Roact.Component:extend("DeepLinkEventReceiver")

function v78.UpdateConnection(p4) -- line: 171
	-- upvalues: FFlagEnableAuthDeepLinkReceiver (copy), FFlagEnableDeepLinkHistoryWithModalAPI (copy), DeepLink (copy), v70 (copy), default (copy), TelemetryConfigs (copy), v51 (copy)
	if not FFlagEnableAuthDeepLinkReceiver then
		if p4.props.userLoggedOut or not p4.props.appLoadingStarted then
			p4.props.linking:stopListeningForLuaURLs()

			if FFlagEnableDeepLinkHistoryWithModalAPI then
				p4.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(DeepLink.DeepLinkLuaPostAuthReceiverStatus.Disconnected, nil)
			end
		else
			if FFlagEnableDeepLinkHistoryWithModalAPI then
				local v99 = p4.props.linking:getLastLuaURL()

				p4.deepLinkLuaHandlerStatusStore.setDeepLinkLuaPostAuthReceiverStatus(DeepLink.DeepLinkLuaPostAuthReceiverStatus.Ready, v99)
			end

			p4.props.linking:getAndClearLastPendingURL():andThen(function(p5) -- line: 191
				-- upvalues: p4 (copy)
				if not p5.hasPendingUrl then
					return
				end

				local url = p5.url
				local attributionUrl = p5.attributionUrl

				p4:logPendingLink(url, attributionUrl)
			end)
			p4.props.linking:listenForLuaURLs(function(p6, p7) -- line: 201
				-- upvalues: FFlagEnableDeepLinkHistoryWithModalAPI (copy), p4 (copy), v70 (copy), default (copy), TelemetryConfigs (copy), v51 (copy)
				if FFlagEnableDeepLinkHistoryWithModalAPI then
					p4.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(p6)
				end

				p4:logProcessedLink(p6, p7)

				if v70 and p4.props.navigationLocked then
					p4.pendingDeepLinkUrl = p6
					default:logRobloxTelemetryCounter(TelemetryConfigs.DeepLinkPendingDueToNavigationLockConfig, 1)
				else
					p4:navigate(p6)
				end

				if v51 then
					p4.props.loggingProtocol:logEvent("deeplink_navigation_begin")
				end
			end)
		end
	end

	if p4.props.userLoggedOut then
		local v100 = p4.props.linking:getLastLuaURL()

		if v100 then
			local t1 = {}

			for match, v103 in v100:gmatch("([^&=?]-)=([^&=?]+)") do
				t1[match] = v103:gsub("+", " "):gsub("%%(%x%x)", function(p8) -- line: 230
					return (string.char((tonumber(p8, 16))))
				end)
			end

			if t1.friendshipSourceType == "profileshare" then
				p4.props.socialProfileShareAnalytics.inviteePageLoad(t1.userId, "appSignIn")
			end
		end
	end
end
function v78.navigate(p9, p10) -- line: 242
	-- upvalues: FFlagEnableFlyoutSidePanel (copy), v66 (copy), LaunchGame (copy), FFlagTCUpdateProfileCTAButton (copy), Promise (copy), GetFFlagEnableUnifiedWebViews (copy), AvatarScreen (copy), getScreenAndParams (copy), AppPage (copy), FFlagEnableAmpWizardDeepLink (copy), FFlagEnableSearchDeepLink (copy)
	if FFlagEnableFlyoutSidePanel then
		p9.props.setDrawerVisible(false)
	end

	local currentHistory = p9.props.currentHistory
	local networking = p9.props.networking
	local t2 = {
		socialProfileShareAnalytics = p9.props.socialProfileShareAnalytics,
		shareLinksAnalytics = p9.props.shareLinksAnalytics
	}
	local ResolveLinkFromLinkId = p9.props.ResolveLinkFromLinkId
	local ResolveLinkFromLinkIdV2 = p9.props.ResolveLinkFromLinkIdV2
	local CloseCentralOverlay2 = p9.props.CloseCentralOverlay
	local v112 = v66:resolve(p10, {
		history = currentHistory,
		network = networking,
		analyticsImpls = t2,
		resolveLinkFromLinkId = ResolveLinkFromLinkId,
		resolveLinkFromLinkIdV2 = ResolveLinkFromLinkIdV2,
		launchGame = LaunchGame,
		closeCentralOverlay = CloseCentralOverlay2,
		RefreshProfilePlatformActionInfo = if not FFlagTCUpdateProfileCTAButton then nil else p9.props.RefreshProfilePlatformActionInfo
	})

	return Promise.resolve(v112):andThen(function(p11) -- line: 268
		-- upvalues: GetFFlagEnableUnifiedWebViews (copy), p9 (copy), AvatarScreen (copy), getScreenAndParams (copy), AppPage (copy), FFlagEnableAmpWizardDeepLink (copy), FFlagEnableSearchDeepLink (copy)
		if type(p11) == "table" and next(p11) then
			local v173 = p11[#p11]

			if not GetFFlagEnableUnifiedWebViews() and p9.props.browserService then
				p9.props.browserService:CloseBrowserWindow()
			end

			local AvatarExperienceLandingPage = AvatarScreen.AvatarExperienceLandingPage

			if v173 and (#v173 > 0 and (AvatarExperienceLandingPage and AvatarExperienceLandingPage == v173[1].name)) then
				local v175, v176 = getScreenAndParams(v173)

				p9.props.NavigateIntoAvatarExperience(v175, v176, true)

				return
			end

			local Chat = AppPage.Chat

			if v173 and (#v173 > 0 and (Chat and Chat == v173[1].name)) then
				p9.navigateIntoChat(getScreenAndParams(v173))

				return
			end

			local SquadLobby = AppPage.SquadLobby

			if v173 and (#v173 > 0 and (SquadLobby and SquadLobby == v173[1].name)) then
				p9.navigateIntoSquadLobbyIfExists(getScreenAndParams(v173))

				return
			end

			local FAE = AppPage.FAE

			if v173 and (#v173 > 0 and (FAE and FAE == v173[1].name)) then
				p9.navigateIntoFAE(getScreenAndParams(v173))

				return
			end

			local FAEUpsellOverlay = AppPage.FAEUpsellOverlay

			if v173 and (#v173 > 0 and (FAEUpsellOverlay and FAEUpsellOverlay == v173[1].name)) then
				p9.showFAEUpsellOverlay(getScreenAndParams(v173))

				return
			end

			if FFlagEnableAmpWizardDeepLink then
				local AmpWizardContainer = AppPage.AmpWizardContainer

				if v173 and (#v173 > 0 and (AmpWizardContainer and AmpWizardContainer == v173[1].name)) then
					p9.navigateIntoAmpWizard(getScreenAndParams(v173))

					return
				end
			end

			if FFlagEnableSearchDeepLink then
				local v182 = v173[#v173]
				local v183 = v182 and v182.extraProps

				if v182 and v182.name == AppPage.SearchPage and v183 then
					p9.props.SetSearchType(v182.detail, v183.searchType)
					p9.props.SetSearchParameters(v182.detail, {
						searchKeyword = v183.searchKeyword,
						isKeywordSuggestionEnabled = true
					})
				end
			end

			p9.props.ResetNavigationHistory(p11)
		end
	end)
end
function v78.logPendingLink(p12, p13, p14) -- line: 312
	-- upvalues: simpleUrlDecode (copy), ParseQuery (copy), getShareLinkType (copy), v64 (copy), v56 (copy), ShareLinkTypes (copy), GetFFlagEnableAffiliateLinksQualifiedSignUpTracking (copy), QualifiedSignUpAttribution (copy)
	local appAnalytics = p12.props.appAnalytics
	local _, v118 = unpack(string.split(simpleUrlDecode(p13), "?"))
	local v119 = ParseQuery(v118)
	local v120 = if not v119 or not v119.stamp then nil else v119.stamp[1]
	local v121 = getShareLinkType(p13)
	local v122 = nil

	if v64 then
		v122 = getJoinCode(p13)
	end

	appAnalytics.EventStream:setRBXEventStream("deepLinkEventReceiver", "PendingDeepLinkProcessed", {
		attributionUrl = p14,
		shareLinkType = v121,
		stamp = v120,
		url = p13,
		userDidLogIn = p12.loginTracking.userDidLogIn,
		userDidSignUp = p12.loginTracking.userDidSignUp
	})

	local s1 = "PendingLink"

	if p12.loginTracking.userDidLogIn then
		s1 = "PendingLinkAfterLogin"
	elseif p12.loginTracking.userDidSignUp then
		s1 = "PendingLinkAfterSignUp"
	end

	local v124 = v56 and v121 == "ExperienceInviteLinkType"

	if v121 ~= nil and s1 == "PendingLinkAfterSignUp" and ((v121 == ShareLinkTypes.ExperienceAffiliate or v124) and GetFFlagEnableAffiliateLinksQualifiedSignUpTracking()) then
		local networking = p12.props.networking
		local v126 = if not v119 or not v119.code then nil else v119.code[1]
		local ExperienceAffiliate = ShareLinkTypes.ExperienceAffiliate

		if v121 == "ExperienceInviteLinkType" then
			ExperienceAffiliate = ShareLinkTypes.ExperienceInviteLinkType
		end

		QualifiedSignUpAttribution.attribute(networking, v126, p13, ExperienceAffiliate)
	end

	if v122 ~= nil and s1 == "PendingLinkAfterSignUp" and v64 then
		local networking = p12.props.networking

		QualifiedSignUpAttribution.attributeJoinLink(networking, p13, v122)
	end

	appAnalytics.Diag:reportCounter(s1, 1)

	if v121 ~= nil then
		local v129 = s1 .. v121

		appAnalytics.Diag:reportCounter(v129, 1)
	end
end
function v78.logProcessedLink(p15, p16, p17) -- line: 370
	-- upvalues: simpleUrlDecode (copy), ParseQuery (copy), getShareLinkType (copy), ShareLinkTypes (copy), AuthenticatedVisitAttribution (copy), v55 (copy), default (copy)
	local appAnalytics = p15.props.appAnalytics
	local sessionService = p15.props.sessionService
	local userDidLogIn = p15.loginTracking.userDidLogIn
	local userDidSignUp = p15.loginTracking.userDidSignUp
	local _, v138 = unpack(string.split(simpleUrlDecode(p16), "?"))
	local v139 = ParseQuery(v138)
	local v140 = getShareLinkType(p16)
	local v141 = if not v139 or not v139.stamp then nil else v139.stamp[1]
	local v142 = if not v139 or not v139.utm then nil else v139.utm[1]
	local v143 = getJoinCode(p16)
	local RootSID = sessionService:GetRootSID()

	appAnalytics.EventStream:setRBXEventStream("deepLinkEventReceiver", "DeepLinkProcessed", {
		attributionUrl = p17,
		sessionId = RootSID,
		shareLinkType = v140,
		stamp = v141,
		url = p16,
		utm = v142,
		userDidLogIn = p15.loginTracking.userDidLogIn,
		userDidSignUp = p15.loginTracking.userDidSignUp
	})

	if v140 == ShareLinkTypes.ExperienceAffiliate and not userDidSignUp then
		local networking = p15.props.networking
		local v146 = if not v139 or not v139.code then nil else v139.code[1]
		local ExperienceAffiliate = ShareLinkTypes.ExperienceAffiliate

		AuthenticatedVisitAttribution.attribute(networking, v146, p16, ExperienceAffiliate, userDidLogIn)
	end

	if v143 ~= nil and not userDidSignUp then
		local networking = p15.props.networking

		AuthenticatedVisitAttribution.attributeJoinLink(networking, p16, v143, userDidLogIn)
	end

	if v55 then
		local t3 = {
			url = p16,
			attributionUrl = p17,
			shareLinkType = v140
		}
		local t4 = {
			eventName = "DeeplinkProcessed",
			backends = { default.TelemetryBackends.RobloxTelemetryCounter }
		}

		default:logRobloxTelemetryCounter(t4, 1, t3)
	end
end
function v78.init(p18) -- line: 422
	-- upvalues: FFlagEnableDeepLinkHistoryWithModalAPI (copy), DeepLink (copy), FFlagEnableAuthDeepLinkReceiver (copy), PostAuthDeepLinkAvailableSignal (copy), v70 (copy), default (copy), TelemetryConfigs (copy), v51 (copy), PostAuthPendingLuaUrlAvailableSignal (copy), FFlagEnableSquadDeeplinkWithChatId (copy), FFlagEnableAmpWizardDeepLink (copy)
	p18.loginTracking = {
		userDidLogIn = false,
		userDidSignUp = false
	}

	if FFlagEnableDeepLinkHistoryWithModalAPI then
		p18.deepLinkLuaHandlerStatusStore = DeepLink.DeepLinkLuaReceiverStatusStore(false)
	end

	p18:UpdateConnection()

	if FFlagEnableAuthDeepLinkReceiver then
		PostAuthDeepLinkAvailableSignal:connect(function(p19) -- line: 435
			-- upvalues: FFlagEnableDeepLinkHistoryWithModalAPI (copy), p18 (copy), v70 (copy), default (copy), TelemetryConfigs (copy), v51 (copy)
			if FFlagEnableDeepLinkHistoryWithModalAPI then
				p18.deepLinkLuaHandlerStatusStore.setLastDetectedPostAuthUrl(p19.url)
			end

			p18:logProcessedLink(p19.url, p19.attributionUrl)

			if v70 and p18.props.navigationLocked then
				p18.pendingDeepLinkUrl = p19.url
				default:logRobloxTelemetryCounter(TelemetryConfigs.DeepLinkPendingDueToNavigationLockConfig, 1)
			else
				p18:navigate(p19.url)
			end

			if v51 then
				p18.props.loggingProtocol:logEvent("deeplink_navigation_begin")
			end
		end)
		PostAuthPendingLuaUrlAvailableSignal:connect(function(p20) -- line: 460
			-- upvalues: p18 (copy)
			local url = p20.url
			local attributionUrl = p20.attributionUrl

			p18:logPendingLink(url, attributionUrl)
		end)
	end

	function p18.navigateIntoChat(_, p22) -- line: 467
		-- upvalues: p18 (copy)
		if not (p18.props.getCanSeeChatTab and p18.props.getCanSeeChatTab()) then
			return
		end

		local v190 = p22 and p22.entryPoint

		p18.props.EnteredChatFromEntryPoint(v190)

		local v191 = p22 and p22.detail

		p18.props.NavigateIntoChat({
			conversationId = v191
		}, true)
	end
	function p18.navigateIntoSquadLobbyIfExists(_, p24) -- line: 482
		-- upvalues: p18 (copy), FFlagEnableSquadDeeplinkWithChatId (copy)
		if not (p18.props.getCanSeeChatTab and p18.props.getCanSeeChatTab()) then
			return
		end

		local v194 = p24 and p24.detail
		local v195 = if not FFlagEnableSquadDeeplinkWithChatId then nil else p24 and p24.conversationId

		p18.props.NavigateIntoSquadLobbyIfExists({
			partyId = v194,
			conversationId = v195
		}, true)
	end
	function p18.navigateIntoFAE(_, p26) -- line: 495
		-- upvalues: p18 (copy)
		p18.props.NavigateIntoFAE(p26.source)
	end
	function p18.showFAEUpsellOverlay(_, p28) -- line: 499
		-- upvalues: p18 (copy)
		p18.props.ShowFAEUpsellOverlay(p28.source, p28.isPhase2)
	end

	if FFlagEnableAmpWizardDeepLink then
		function p18.navigateIntoAmpWizard(_, p30) -- line: 504
			-- upvalues: p18 (copy)
			p18.props.NavigateIntoAmpWizard(p30)
		end
	end
end
function v78.render(_) -- line: 510
end
function v78.didUpdate(p32, p33) -- line: 512
	-- upvalues: LaunchContext (copy), v70 (copy), default (copy), TelemetryConfigs (copy)
	if p33.userLoggedOut ~= p32.props.userLoggedOut and not p32.props.userLoggedOut then
		p32.loginTracking.userDidLogIn = p32.props.launchContext == LaunchContext.Login
		p32.loginTracking.userDidSignUp = p32.props.launchContext == LaunchContext.SignUp
	end

	p32:UpdateConnection()

	if v70 and (p33.navigationLocked and not p32.props.navigationLocked) and p32.pendingDeepLinkUrl then
		local pendingDeepLinkUrl = p32.pendingDeepLinkUrl

		p32.pendingDeepLinkUrl = nil
		default:logRobloxTelemetryCounter(TelemetryConfigs.DeepLinkProcessedAfterNavigationUnlockConfig, 1)
		p32:navigate(pendingDeepLinkUrl)
	end
end
function v78.willUnmount(p34) -- line: 538
	p34.props.linking:stopListeningForLuaURLs()
end

local v79 = RoactRodux.connect(function(p35, _) -- line: 542
	-- upvalues: RetrievalStatus (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), LoginStatus (copy)
	local v159 = p35.Startup.AppDataStatus ~= RetrievalStatus.NotStarted
	local v160 = if not p35.Users[p35.LocalUserId] then nil else p35.Users[p35.LocalUserId].name

	return {
		currentHistory = if not FFlagUseNavigationSelectors then p35.Navigation.history else Selectors.selectLegacyHistory(p35),
		launchContext = p35.LaunchContext,
		userLoggedOut = p35.AuthenticationStatus.status == LoginStatus.LOGGED_OUT,
		username = v160,
		appLoadingStarted = v159,
		navigationLocked = if not FFlagUseNavigationSelectors then p35.Navigation.lockNavigationActions else Selectors.selectNavigationLocked(p35)
	}
end, function(p37) -- line: 558
	-- upvalues: FFlagTCUpdateProfileCTAButton (copy), refreshProfilePlatformActionInfo (copy), CloseCentralOverlay (copy), EnteredChatFromEntryPoint (copy), NavigateIntoAvatarExperience (copy), NavigateIntoChat (copy), NavigateIntoSquadLobbyIfExists (copy), startFacialAgeEstimation (copy), SocialUpsellType (copy), NavigateBack (copy), AmpApiProvider (copy), v69 (copy), v68 (copy), AccessResponseEnum (copy), ShowFAESocialUpsellOverlay (copy), UpsellComponent (copy), FFlagEnableAmpWizardDeepLink (copy), OpenAmpWizardContainer (ref), FFlagEnableSearchDeepLink (copy), SetSearchParameters (copy), SetSearchType (copy), ResetNavigationHistory (copy), EventNetworking (copy)
	return {
		RefreshProfilePlatformActionInfo = if not FFlagTCUpdateProfileCTAButton then nil else function(s2: string) -- line: 561
			-- upvalues: p37 (copy), refreshProfilePlatformActionInfo (copy)
			return p37(refreshProfilePlatformActionInfo(s2))
		end,
		CloseCentralOverlay = function() --[[ CloseCentralOverlay ]] -- line: 565
			-- upvalues: p37 (copy), CloseCentralOverlay (copy)
			return p37(CloseCentralOverlay())
		end,
		EnteredChatFromEntryPoint = function(p38) --[[ EnteredChatFromEntryPoint ]] -- line: 568
			-- upvalues: p37 (copy), EnteredChatFromEntryPoint (copy)
			return p37(EnteredChatFromEntryPoint(p38))
		end,
		NavigateIntoAvatarExperience = function(p39, p40, p41) --[[ NavigateIntoAvatarExperience ]] -- line: 571
			-- upvalues: p37 (copy), NavigateIntoAvatarExperience (copy)
			return p37(NavigateIntoAvatarExperience(p39, p40, p41))
		end,
		NavigateIntoChat = function(p42, p43) --[[ NavigateIntoChat ]] -- line: 576
			-- upvalues: p37 (copy), NavigateIntoChat (copy)
			return p37(NavigateIntoChat(p42, p43))
		end,
		NavigateIntoSquadLobbyIfExists = function(p44, p45) --[[ NavigateIntoSquadLobbyIfExists ]] -- line: 579
			-- upvalues: p37 (copy), NavigateIntoSquadLobbyIfExists (copy)
			return p37(NavigateIntoSquadLobbyIfExists(p44, p45))
		end,
		NavigateIntoFAE = function(s3: string?) --[[ NavigateIntoFAE ]] -- line: 582
			-- upvalues: p37 (copy), startFacialAgeEstimation (copy), SocialUpsellType (copy), NavigateBack (copy)
			return p37(startFacialAgeEstimation(SocialUpsellType.FacialAgeEstimation .. (s3 or ""), function() -- line: 583
				-- upvalues: p37 (copy), NavigateBack (copy)
				p37(NavigateBack())
			end, function() -- line: 585
				-- upvalues: p37 (copy), NavigateBack (copy)
				p37(NavigateBack())
			end, s3))
		end,
		ShowFAEUpsellOverlay = function(s4: string?, b1: boolean?) --[[ ShowFAEUpsellOverlay ]] -- line: 589
			-- upvalues: AmpApiProvider (copy), v69 (copy), v68 (copy), AccessResponseEnum (copy), p37 (copy), ShowFAESocialUpsellOverlay (copy), SocialUpsellType (copy), UpsellComponent (copy)
			if AmpApiProvider.upsellFeatureAccess(v69, {}, v68).access == AccessResponseEnum.Granted then
				p37(ShowFAESocialUpsellOverlay({
					entryPointEventCtx = SocialUpsellType.FacialAgeEstimation .. (s4 or ""),
					upsellEntrySurface = s4 or "",
					upsellEntryComponent = UpsellComponent.PushNotifUI,
					b1
				}))
			end
		end,
		NavigateIntoAmpWizard = if not FFlagEnableAmpWizardDeepLink then nil else function(p46) -- line: 605
			-- upvalues: p37 (copy), OpenAmpWizardContainer (ref)
			return p37(OpenAmpWizardContainer(p46.featureName, function() -- line: 609
			end, nil, p46.entryPointEventCtx, nil, p46.nameSpace, nil, {
				returnPage = p46.returnPage
			}))
		end,
		SetSearchParameters = if not FFlagEnableSearchDeepLink then nil else function(p47, p48) -- line: 621
			-- upvalues: p37 (copy), SetSearchParameters (copy)
			return p37(SetSearchParameters(p47, p48))
		end,
		SetSearchType = if not FFlagEnableSearchDeepLink then nil else function(p49, p50) -- line: 626
			-- upvalues: p37 (copy), SetSearchType (copy)
			return p37(SetSearchType(p49, p50))
		end,
		ResetNavigationHistory = function(p51) --[[ ResetNavigationHistory ]] -- line: 630
			-- upvalues: p37 (copy), ResetNavigationHistory (copy)
			return p37(ResetNavigationHistory(nil, p51))
		end,
		ResolveLinkFromLinkId = function(p52, p53) --[[ ResolveLinkFromLinkId ]] -- line: 633
			-- upvalues: p37 (copy), EventNetworking (copy)
			return p37(EventNetworking.ShareLinksNetworking.ResolveLinkFromLinkId.API({
				linkId = p52,
				linkType = p53
			}))
		end,
		ResolveLinkFromLinkIdV2 = function(p54) --[[ ResolveLinkFromLinkIdV2 ]] -- line: 639
			-- upvalues: p37 (copy), EventNetworking (copy)
			return p37(EventNetworking.ShareLinksNetworking.ResolveLinkFromLinkIdV2.API({
				linkId = p54
			}))
		end
	}
end)(v78)
local v80 = UniversalAppPolicy.connect(function(p55) -- line: 646
	return {
		getCanSeeChatTab = p55.getCanSeeChatTab
	}
end)(v79)
local u81 = RoactServices.connect({
	appAnalytics = RoactAnalytics,
	browserService = if not GetFFlagEnableUnifiedWebViews() then AppBrowserService else nil,
	linking = AppLinking,
	loggingProtocol = AppLogging,
	networking = RoactNetworking,
	sessionService = AppSessionService,
	shareLinksAnalytics = RoactAnalyticsShareLinks,
	socialProfileShareAnalytics = RoactAnalyticsSocialProfileShare
})(v80)

if FFlagEnableFlyoutSidePanel then
	return function(p56) -- line: 663
		-- upvalues: useSetDrawerVisible (ref), Cryo (copy), Roact (copy), u81 (ref)
		local v164 = useSetDrawerVisible()
		local v165 = Cryo.Dictionary.join(p56, {
			setDrawerVisible = v164
		})

		return Roact.createElement(u81, v165)
	end
end

return u81
