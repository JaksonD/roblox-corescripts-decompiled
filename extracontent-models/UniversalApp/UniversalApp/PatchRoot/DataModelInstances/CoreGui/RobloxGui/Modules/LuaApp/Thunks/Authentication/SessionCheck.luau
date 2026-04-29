local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local MemStorageService = game:GetService("MemStorageService")
local GuiService = game:GetService("GuiService")
local LocalizationService = game:GetService("LocalizationService")
local Modules = CoreGui.RobloxGui.Modules
local GetUserAppLaunchInfo = require(Modules.LuaApp.Http.Requests.GetUserAppLaunchInfo)
local User = require(script.Parent.User)
local GetLocalUser = require(CorePackages.Workspace.Packages.UserLib).Thunks.GetLocalUser
local PromiseUtilities = require(Modules.LuaApp.PromiseUtilities)
local SetAuthenticationStatus = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local ResetNavigationHistory = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local FetchTheme = require(Modules.LuaApp.Thunks.FetchTheme)
local AppStorageUtilities = require(script.Parent.AppStorageUtilities)
local AppPage = require(Modules.LuaApp.AppPage)
local MemStorageKeys = require(Modules.LuaApp.Enum.MemStorageKeys)
local LoginStatus = require(Modules.LuaApp.Enum.LoginStatus)
local NotificationType = require(Modules.LuaApp.Enum.NotificationType)
local CloseAccountAuthenticationFailureOverlay = require(Modules.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay)
local OverlayType = require(Modules.LuaApp.Enum.OverlayType)
local ApiFetchUsersRoles = require(Modules.LuaApp.Thunks.ApiFetchUsersRoles)
local ReceivedUserCountryCode = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local HttpService = game:GetService("HttpService")
local default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local ContentProvider = game:GetService("ContentProvider")
local AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreAnalyticsEvents = AuthCommon.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommon.Analytics.KeystoreEventConstants
local KeystoreConstants = AuthCommon.Common.KeystoreConstants
local HandlePreHomePageRouting = require(CorePackages.Workspace.Packages.PreHomePage).HandlePreHomePageRouting
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagPreHomePageRoutingEnabled = SharedFlags.FFlagPreHomePageRoutingEnabled
local FFlagPasskeyUpsellEnabled = SharedFlags.FFlagPasskeyUpsellEnabled
local GetFFlagEnableMultiPageSignupExperiment = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local GetFFlagKeystoreAutoLoginAvailable = SharedFlags.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagDisableKeystoreUnderageDeletion = SharedFlags.GetFFlagDisableKeystoreUnderageDeletion
local GetFFlagAddPromCounterToKeystoreOps = SharedFlags.GetFFlagAddPromCounterToKeystoreOps
local TelemetryService = game:GetService("TelemetryService")
local KeystoreDeleteCredentialsTelemetryConfig = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs.KeystoreDeleteCredentialsTelemetryConfig
local ShowAccountAuthenticationFailureOverlay = require(Modules.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay)
local DeleteAllCredentialsFromKeystore = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local FetchLocale = require(Modules.LuaApp.Thunks.FetchLocale)
local PreloadApplicationData = require(Modules.LuaApp.Thunks.PreloadApplicationData)
local AppStartupSequenceTag = require(CorePackages.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag
local AppPrefetch = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPrefetch
local InvoluntaryLogoutAnalyticsEvents = AuthCommon.Analytics.InvoluntaryLogoutAnalyticsEvents
local EventStreamConstants = require(Modules.LuaApp.EventStreamConstants)

local function v49() -- line: 78
	-- upvalues: HttpService (copy), ContentProvider (copy), GetFFlagKeystoreAutoLoginAvailable (copy), DeleteAllCredentialsFromKeystore (copy), default (copy), KeystoreConstants (copy)
	local json = HttpService:JSONEncode({
		server = ContentProvider.BaseUrl
	})

	if GetFFlagKeystoreAutoLoginAvailable() then
		return DeleteAllCredentialsFromKeystore(json)
	end

	return default:deleteAllCredentialsFromiOSKeychain(default.CredentialsTypes.iosKeychainPassword, json, KeystoreConstants.KeystoreTimeout)
end
local function navigateToPostAuthPage(p1, p2, _, p4) -- line: 94
	-- upvalues: AppStorageUtilities (copy), GetFFlagEnableMultiPageSignupExperiment (copy), ResetNavigationHistory (copy), AppPage (copy), FFlagPreHomePageRoutingEnabled (copy), FFlagPasskeyUpsellEnabled (copy), HandlePreHomePageRouting (copy)
	if (not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or AppStorageUtilities.getSignupActionRequired()) == "auth" then
		if GetFFlagEnableMultiPageSignupExperiment() then
			p1:dispatch(ResetNavigationHistory({{
				name = AppPage.AddAuthMethodPage
			}}))

			return
		end

		AppStorageUtilities.setSignupActionRequired("")
		AppStorageUtilities.flush()
		p1:dispatch(ResetNavigationHistory({{
			name = p2
		}}))

		return
	end

	if FFlagPreHomePageRoutingEnabled or FFlagPasskeyUpsellEnabled then
		HandlePreHomePageRouting(p4, p1, ResetNavigationHistory):andThen(function(p5) -- line: 108
			-- upvalues: p1 (copy), ResetNavigationHistory (copy), p2 (copy)
			if not p5 then
				p1:dispatch(ResetNavigationHistory({{
					name = p2
				}}))
			end
		end)

		return
	end

	p1:dispatch(ResetNavigationHistory({{
		name = p2
	}}))
end
local function sessionCheck(p6, p7, p8, p9, _, p11) -- line: 123
	-- upvalues: InvoluntaryLogoutAnalyticsEvents (copy), EventStreamConstants (copy), FetchLocale (copy), AppPage (copy), AppStartupSequenceTag (copy), AppPrefetch (copy), PreloadApplicationData (copy), GetUserAppLaunchInfo (copy), User (copy), GetFFlagDisableKeystoreUnderageDeletion (copy), v49 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), OverlayType (copy), CloseAccountAuthenticationFailureOverlay (copy), navigateToPostAuthPage (copy), GetLocalUser (copy), ReceivedUserCountryCode (copy), AppStorageUtilities (copy), LocalizationService (copy), FetchTheme (copy), ApiFetchUsersRoles (copy), MemStorageService (copy), MemStorageKeys (copy), PromiseUtilities (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy), StatusCodes (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), ShowAccountAuthenticationFailureOverlay (copy), sessionCheck (copy)
	return function(p12) -- line: 124
		-- upvalues: InvoluntaryLogoutAnalyticsEvents (copy), EventStreamConstants (copy), FetchLocale (copy), p6 (copy), AppPage (copy), AppStartupSequenceTag (copy), AppPrefetch (copy), PreloadApplicationData (copy), p8 (copy), p9 (copy), p11 (copy), GetUserAppLaunchInfo (copy), User (copy), GetFFlagDisableKeystoreUnderageDeletion (copy), v49 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), OverlayType (copy), CloseAccountAuthenticationFailureOverlay (copy), p7 (copy), navigateToPostAuthPage (copy), GetLocalUser (copy), ReceivedUserCountryCode (copy), AppStorageUtilities (copy), LocalizationService (copy), FetchTheme (copy), ApiFetchUsersRoles (copy), MemStorageService (copy), MemStorageKeys (copy), PromiseUtilities (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy), StatusCodes (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), ShowAccountAuthenticationFailureOverlay (copy), sessionCheck (copy)
		local Moderation = p12:getState().Moderation

		if not not Moderation and (Moderation.userModerated or false) then
			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstants.Origin.LandingScreen, EventStreamConstants.Context.SessionCheckSkippedForModeratedUser)

			return
		end

		local v70 = FetchLocale(p6)
		local Home = AppPage.Home
		local v72 = AppStartupSequenceTag
		local v73 = AppPrefetch

		local function v74() -- line: 140
			-- upvalues: p12 (copy), PreloadApplicationData (copy), p6 (copy), p8 (copy), p9 (copy), p11 (copy), v72 (copy), v73 (copy)
			return p12:dispatch(PreloadApplicationData(p6, p6, p8, p9, p11, v72, v73))
		end

		return GetUserAppLaunchInfo(p6):andThen(function(p13) -- line: 154
			-- upvalues: InvoluntaryLogoutAnalyticsEvents (copy), EventStreamConstants (copy), User (copy), GetFFlagDisableKeystoreUnderageDeletion (copy), v49 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), p12 (copy), OverlayType (copy), CloseAccountAuthenticationFailureOverlay (copy), p7 (copy), navigateToPostAuthPage (copy), Home (copy), p6 (copy), GetLocalUser (copy), ReceivedUserCountryCode (copy), v70 (copy), AppStorageUtilities (copy), LocalizationService (copy), FetchTheme (copy), ApiFetchUsersRoles (copy), MemStorageService (copy), MemStorageKeys (copy), PromiseUtilities (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy)
			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstants.Origin.LandingScreen, EventStreamConstants.Context.SessionCheckSuccess)

			local v76 = User.fromUserInfoRequest(p13)

			if v76.userId ~= nil and (v76.userId ~= -1 and v76.isUnder13 == true and not GetFFlagDisableKeystoreUnderageDeletion()) then
				v49():andThen(function() -- line: 168
					-- upvalues: KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), v76 (copy)
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.underageDelete, (tostring(v76.userId)))
				end)
			end

			if p12:getState().CentralOverlay.OverlayType == OverlayType.AccountAuthenticationFailureOverlay then
				p12:dispatch(CloseAccountAuthenticationFailureOverlay())

				if v76:isEqual(p7) then
					InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstants.Origin.LandingScreen, EventStreamConstants.Context.SessionCheckLocalPlayerMatch)
					navigateToPostAuthPage(p12, Home, v76, p6)
				end
			end

			if not v76:isEqual(p7) then
				InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstants.Origin.LandingScreen, EventStreamConstants.Context.SessionCheckLocalPlayerMismatch)
				v76:setToLocalPlayer()
				v76:setToLocalStorage()
				p12:dispatch(GetLocalUser())
				p12:dispatch(ReceivedUserCountryCode(v76.countryCode))
				navigateToPostAuthPage(p12, Home, v76, p6)
			end

			local t1 = {}

			table.insert(t1, v70:andThen(function(p14) -- line: 205
				-- upvalues: AppStorageUtilities (copy), LocalizationService (copy)
				AppStorageUtilities.setRobloxLocaleId(p14.generalExperienceLocale)
				AppStorageUtilities.setGameLocaleId(p14.ugcLocale)
				LocalizationService:SetRobloxLocaleId(p14.generalExperienceLocale)
			end))

			local v78 = FetchTheme(p6, v76.userId)

			p12:dispatch(ApiFetchUsersRoles(p6))

			local v79 = (not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or AppStorageUtilities.getSignupActionRequired()) == "auth"

			table.insert(t1, v78:andThen(function(p15) -- line: 222
				-- upvalues: AppStorageUtilities (copy), v79 (copy), MemStorageService (copy), MemStorageKeys (copy)
				AppStorageUtilities.setAuthenticatedTheme(p15)

				if not v79 then
					MemStorageService:Fire(MemStorageKeys.ThemeUpdate, p15)
				end
			end))
			PromiseUtilities.Batch(t1):andThen(function() -- line: 232
				-- upvalues: AppStorageUtilities (copy)
				AppStorageUtilities.flush()
			end)

			local v80 = p12

			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstants.Origin.LandingScreen, EventStreamConstants.Context.SessionCheckDidLogin)
			GuiService:BroadcastNotification(v76:toJsonData(), NotificationType.DID_LOG_IN)
			v80:dispatch(SetAuthenticationStatus(LoginStatus.LOGGED_IN))
		end, function(p16) -- line: 236
			-- upvalues: StatusCodes (copy), InvoluntaryLogoutAnalyticsEvents (copy), EventStreamConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), v49 (copy), ShowAccountAuthenticationFailureOverlay (copy), p12 (copy), sessionCheck (copy), p6 (copy), p7 (copy), v70 (copy), Home (copy), v74 (copy)
			if p16.StatusCode == StatusCodes.UNAUTHORIZED then
				InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstants.Origin.LandingScreen, EventStreamConstants.Context.SessionCheckUnauthorized)
				KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.remoteLogoutDelete)

				if GetFFlagAddPromCounterToKeystoreOps() then
					TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, {
						customFields = {
							reason = "remote_logout"
						}
					}, 1)
				end

				v49()

				return
			end

			InvoluntaryLogoutAnalyticsEvents.sendImmediatelyPageLoadEvent(EventStreamConstants.Origin.LandingScreen, "ErrorCode: " .. tostring(p16.StatusCode) .. " Msg: " .. tostring(p16))
			ShowAccountAuthenticationFailureOverlay(p12, function() -- line: 258
				-- upvalues: sessionCheck (copy), p6 (copy), p7 (copy), v70 (copy), Home (copy), v74 (copy)
				sessionCheck(p6, p7, v70, true, Home, v74)
			end)
		end)
	end
end

return sessionCheck
