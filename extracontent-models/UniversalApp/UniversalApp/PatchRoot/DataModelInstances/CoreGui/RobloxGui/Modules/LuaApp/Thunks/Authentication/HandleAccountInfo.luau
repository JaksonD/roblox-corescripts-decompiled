local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local MemStorageService = game:GetService("MemStorageService")
local GuiService = game:GetService("GuiService")
local LocalizationService = game:GetService("LocalizationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Modules = CoreGui.RobloxGui.Modules
local GetUserAppLaunchInfo = require(Modules.LuaApp.Http.Requests.GetUserAppLaunchInfo)
local User = require(script.Parent.User)
local GetLocalUser = require(CorePackages.Workspace.Packages.UserLib).Thunks.GetLocalUser
local PromiseUtilities = require(Modules.LuaApp.PromiseUtilities)
local SetAuthenticationStatus = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local ResetNavigationHistory = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local FetchTheme = require(Modules.LuaApp.Thunks.FetchTheme)
local ClearApp = require(script.Parent.ClearApp)
local AppStorageUtilities = require(script.Parent.AppStorageUtilities)
local AppPage = require(Modules.LuaApp.AppPage)
local MemStorageKeys = require(Modules.LuaApp.Enum.MemStorageKeys)
local LoginStatus = require(Modules.LuaApp.Enum.LoginStatus)
local NotificationType = require(Modules.LuaApp.Enum.NotificationType)
local reportEphemeralCounter = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local AppSessionCheckCounterNames = require(Modules.LuaApp.Analytics.Events.AppSessionCheckCounterNames)
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local CloseAccountAuthenticationFailureOverlay = require(Modules.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay)
local OverlayType = require(Modules.LuaApp.Enum.OverlayType)
local ResetOnNoAccountInfoFound = require(Modules.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound)
local DeleteAllCredentialsFromKeystore = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local ShowAccountAuthenticationFailureOverlay = require(Modules.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay)
local ApiFetchUsersRoles = require(Modules.LuaApp.Thunks.ApiFetchUsersRoles)
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
local ReceivedUserCountryCode = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local v34 = game:GetEngineFeature("AppTracing") and game:GetService("TracerService") or nil
local luaLogoutReasonNames = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local GetFFlagPasskeySignupEnabled = require(Modules.LuaApp.Flags.GetFFlagPasskeySignupEnabled)
local GetFFlagEnableMultiPageSignupExperiment = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local v38 = game:DefineFastFlag("EnableLaunchAppCheckForAccountSwitchGameParams", false)
local FFlagEnableIosKeychainLoginLua = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
local v40 = game:DefineFastFlag("FixDeeplinkingInCachedRoutingCases", false)
local HttpService = game:GetService("HttpService")
local default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local ContentProvider = game:GetService("ContentProvider")
local AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreAnalyticsEvents = AuthCommon.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommon.Analytics.KeystoreEventConstants
local KeystoreConstants = AuthCommon.Common.KeystoreConstants
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local KeystoreDeleteCredentialsTelemetryConfig = TelemetryConfigs.KeystoreDeleteCredentialsTelemetryConfig
local TelemetryService = game:GetService("TelemetryService")
local default2 = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local HandlePreHomePageRouting = require(CorePackages.Workspace.Packages.PreHomePage).HandlePreHomePageRouting
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagPreHomePageRoutingEnabled = SharedFlags.FFlagPreHomePageRoutingEnabled
local FFlagPasskeyUpsellEnabled = SharedFlags.FFlagPasskeyUpsellEnabled
local FFlagEnableMagicLogin = SharedFlags.FFlagEnableMagicLogin
local FFlagEnablePostAuthRoutingInAllCases = SharedFlags.FFlagEnablePostAuthRoutingInAllCases
local GetFFlagKeystoreAutoLoginAvailable = SharedFlags.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagDisableKeystoreUnderageDeletion = SharedFlags.GetFFlagDisableKeystoreUnderageDeletion
local GetFFlagAddPromCounterToKeystoreOps = SharedFlags.GetFFlagAddPromCounterToKeystoreOps
local SetMagicLoginAdvertisement = require(CorePackages.Workspace.Packages.LoginV2).Thunks.SetMagicLoginAdvertisement
local FFlagEnableRecordLogin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableRecordLogin
local updateLoginEntryData = AuthCommon.Utils.updateLoginEntryData

local function navigateToPostAuthLandingPage(p1, p2, p3, p4, p5) -- line: 92
	-- upvalues: v40 (copy), LinkingProtocol (copy), AppStorageUtilities (copy), ResetNavigationHistory (copy), AppPage (copy), GetFFlagPasskeySignupEnabled (copy), GetFFlagEnableMultiPageSignupExperiment (copy), FFlagPreHomePageRoutingEnabled (copy), FFlagPasskeyUpsellEnabled (copy), HandlePreHomePageRouting (copy)
	local v74 = not not v40 and (LinkingProtocol:getLastLuaURL() ~= nil and LinkingProtocol:getLastLuaURL() ~= "")
	local v75 = not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or AppStorageUtilities.getSignupActionRequired()

	if p2 and p4.isUnder13 then
		p1:dispatch(ResetNavigationHistory({{
			name = AppPage.UAppBlock
		}}))

		return
	end

	if v75 == "auth" then
		if GetFFlagPasskeySignupEnabled() or GetFFlagEnableMultiPageSignupExperiment() then
			p1:dispatch(ResetNavigationHistory({{
				name = AppPage.AddAuthMethodPage
			}}))

			return
		end

		AppStorageUtilities.setSignupActionRequired("")
		AppStorageUtilities.flush()
		p1:dispatch(ResetNavigationHistory({{
			name = p3
		}}))

		return
	end

	if FFlagPreHomePageRoutingEnabled or FFlagPasskeyUpsellEnabled then
		HandlePreHomePageRouting(p5, p1, ResetNavigationHistory):andThen(function(p6) -- line: 116
			-- upvalues: v74 (copy), p1 (copy), ResetNavigationHistory (copy), p3 (copy)
			if not p6 and not v74 then
				p1:dispatch(ResetNavigationHistory({{
					name = p3
				}}))
			end
		end)

		return
	end

	if v40 then
		if not v74 then
			p1:dispatch(ResetNavigationHistory({{
				name = p3
			}}))

			return
		end
	else
		p1:dispatch(ResetNavigationHistory({{
			name = p3
		}}))
	end
end
local function v65() -- line: 130
	-- upvalues: HttpService (copy), ContentProvider (copy), GetFFlagKeystoreAutoLoginAvailable (copy), DeleteAllCredentialsFromKeystore (copy), default (copy), KeystoreConstants (copy)
	local json = HttpService:JSONEncode({
		server = ContentProvider.BaseUrl
	})

	if GetFFlagKeystoreAutoLoginAvailable() then
		return DeleteAllCredentialsFromKeystore(json)
	end

	return default:deleteAllCredentialsFromiOSKeychain(default.CredentialsTypes.iosKeychainPassword, json, KeystoreConstants.KeystoreTimeout)
end
local function handleAccountInfo(p7, p8, p9, p10, p11, p12, p13, p14, p15, p16) -- line: 145
	-- upvalues: v34 (copy), GetUserAppLaunchInfo (copy), RbxAnalyticsService (copy), reportEphemeralCounter (copy), AppSessionCheckCounterNames (copy), v38 (copy), AppStorageUtilities (copy), ExperienceService (copy), User (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagDisableKeystoreUnderageDeletion (copy), v65 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), FFlagEnableRecordLogin (copy), updateLoginEntryData (copy), OverlayType (copy), CloseAccountAuthenticationFailureOverlay (copy), FFlagEnablePostAuthRoutingInAllCases (copy), navigateToPostAuthLandingPage (copy), ClearApp (copy), GetLocalUser (copy), ReceivedUserCountryCode (copy), RoactAppExperiment (copy), LocalizationService (copy), FetchTheme (copy), ApiFetchUsersRoles (copy), GetFFlagPasskeySignupEnabled (copy), MemStorageService (copy), MemStorageKeys (copy), PromiseUtilities (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy), FFlagEnableMagicLogin (copy), SetMagicLoginAdvertisement (copy), StatusCodes (copy), default2 (copy), TelemetryConfigs (copy), GetFFlagKeystoreAutoLoginAvailable (copy), ResetOnNoAccountInfoFound (copy), luaLogoutReasonNames (copy), ShowAccountAuthenticationFailureOverlay (copy), handleAccountInfo (copy)
	local s1 = ""

	if v34 then
		s1 = v34:StartSpan("luaAccountInfo", "")
	end

	if p14 then
		p14:logEventOnce("lua_auth_request_begin")
	end

	GetUserAppLaunchInfo(p7):andThen(function(p17) -- line: 165
		-- upvalues: p14 (copy), v34 (copy), s1 (ref), RbxAnalyticsService (copy), reportEphemeralCounter (copy), AppSessionCheckCounterNames (copy), v38 (copy), AppStorageUtilities (copy), ExperienceService (copy), User (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagDisableKeystoreUnderageDeletion (copy), v65 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), FFlagEnableRecordLogin (copy), updateLoginEntryData (copy), p11 (copy), OverlayType (copy), CloseAccountAuthenticationFailureOverlay (copy), FFlagEnablePostAuthRoutingInAllCases (copy), p8 (copy), navigateToPostAuthLandingPage (copy), p15 (copy), p12 (copy), p7 (copy), p10 (copy), ClearApp (copy), p16 (ref), GetLocalUser (copy), ReceivedUserCountryCode (copy), RoactAppExperiment (copy), p13 (copy), p9 (copy), LocalizationService (copy), FetchTheme (copy), ApiFetchUsersRoles (copy), GetFFlagPasskeySignupEnabled (copy), MemStorageService (copy), MemStorageKeys (copy), PromiseUtilities (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy), FFlagEnableMagicLogin (copy), SetMagicLoginAdvertisement (copy)
		if p14 then
			p14:logEventOnce("lua_auth_request_end")
		end

		if v34 and s1 ~= "" then
			v34:FinishSpan(s1)
		end

		RbxAnalyticsService:ReportCounter("Network_AccountInfo_Ok")
		reportEphemeralCounter(AppSessionCheckCounterNames.Success, 1)

		if v38 then
			local v91 = AppStorageUtilities.getAccountSwitchStartupGameParams()

			if v91 then
				AppStorageUtilities.clearAccountSwitchStartupGameParams()
				AppStorageUtilities.flush()
				ExperienceService:LaunchExperience(v91, "AuthTicket", nil)
			end
		end

		local v92 = User.fromUserInfoRequest(p17)

		if FFlagEnableIosKeychainLoginLua and v92.userId ~= nil and v92.userId ~= -1 and v92.isUnder13 == true and not GetFFlagDisableKeystoreUnderageDeletion() then
			v65():andThen(function() -- line: 198
				-- upvalues: KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), v92 (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy)
				KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.underageDelete, (tostring(v92.userId)))

				if GetFFlagAddPromCounterToKeystoreOps() then
					TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, {
						customFields = {
							reason = "underage"
						}
					}, 1)
				end
			end)
		end

		if FFlagEnableRecordLogin then
			pcall(function() -- line: 214
				-- upvalues: updateLoginEntryData (copy), v92 (copy)
				updateLoginEntryData(v92.userId, {
					displayName = v92.displayName
				})
			end)
		end

		if p11:getState().CentralOverlay.OverlayType == OverlayType.AccountAuthenticationFailureOverlay then
			p11:dispatch(CloseAccountAuthenticationFailureOverlay())

			if not FFlagEnablePostAuthRoutingInAllCases and v92:isEqual(p8) then
				navigateToPostAuthLandingPage(p11, p15, p12, v92, p7)
			end
		end

		if not v92:isEqual(p8) then
			v92:setToLocalPlayer()
			v92:setToLocalStorage()

			if p10 then
				p11:dispatch(ClearApp())
				p16 = false
			end

			p11:dispatch(GetLocalUser())
			p11:dispatch(ReceivedUserCountryCode(v92.countryCode))

			if not FFlagEnablePostAuthRoutingInAllCases then
				navigateToPostAuthLandingPage(p11, p15, p12, v92, p7)
			end

			RoactAppExperiment.initializeUserLayers(v92.userId)
		end

		if FFlagEnablePostAuthRoutingInAllCases then
			navigateToPostAuthLandingPage(p11, p15, p12, v92, p7)
		end

		if not p16 then
			p16 = true
			p13()
		end

		local t1 = {}

		table.insert(t1, p9:andThen(function(p18) -- line: 280
			-- upvalues: AppStorageUtilities (copy), LocalizationService (copy)
			AppStorageUtilities.setRobloxLocaleId(p18.generalExperienceLocale)
			AppStorageUtilities.setGameLocaleId(p18.ugcLocale)
			LocalizationService:SetRobloxLocaleId(p18.generalExperienceLocale)
		end))

		local v94 = FetchTheme(p7, v92.userId)

		p11:dispatch(ApiFetchUsersRoles(p7))

		local v95 = (not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or AppStorageUtilities.getSignupActionRequired()) == "auth" and GetFFlagPasskeySignupEnabled()

		table.insert(t1, v94:andThen(function(p19) -- line: 298
			-- upvalues: AppStorageUtilities (copy), v95 (copy), MemStorageService (copy), MemStorageKeys (copy)
			AppStorageUtilities.setAuthenticatedTheme(p19)

			if not v95 then
				MemStorageService:Fire(MemStorageKeys.ThemeUpdate, p19)
			end
		end))
		PromiseUtilities.Batch(t1):andThen(function() -- line: 308
			-- upvalues: AppStorageUtilities (copy)
			AppStorageUtilities.flush()
		end)

		local v96 = p11

		GuiService:BroadcastNotification(v92:toJsonData(), NotificationType.DID_LOG_IN)
		v96:dispatch(SetAuthenticationStatus(LoginStatus.LOGGED_IN))

		if FFlagEnableMagicLogin then
			SetMagicLoginAdvertisement(true)
		end
	end, function(p20) -- line: 316
		-- upvalues: RbxAnalyticsService (copy), StatusCodes (copy), reportEphemeralCounter (copy), AppSessionCheckCounterNames (copy), default2 (copy), TelemetryConfigs (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), v65 (copy), v38 (copy), AppStorageUtilities (copy), ResetOnNoAccountInfoFound (copy), p10 (copy), p11 (copy), p7 (copy), p9 (copy), luaLogoutReasonNames (copy), ShowAccountAuthenticationFailureOverlay (copy), handleAccountInfo (copy), p8 (copy), p12 (copy), p13 (copy)
		if p20.HttpError ~= Enum.HttpError.ConnectFail then
			RbxAnalyticsService:ReportCounter("Network_AccountInfo_Error")
		else
			RbxAnalyticsService:ReportCounter("Network_AccountInfo_None")
		end

		if p20.StatusCode == StatusCodes.UNAUTHORIZED then
			reportEphemeralCounter(AppSessionCheckCounterNames.Failure401Unauthenticated, 1)
		else
			reportEphemeralCounter(AppSessionCheckCounterNames.FailureUnknownError, 1)
		end

		reportEphemeralCounter(AppSessionCheckCounterNames.Failure, 1)

		if p20.StatusCode == StatusCodes.UNAUTHORIZED then
			pcall(function() -- line: 332
				-- upvalues: default2 (copy), TelemetryConfigs (copy)
				default2:logRobloxTelemetryCounter(TelemetryConfigs.NoCookieForCachedUserTelemetryConfig, 1)
			end)

			if FFlagEnableIosKeychainLoginLua or GetFFlagKeystoreAutoLoginAvailable() then
				KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.remoteLogoutDelete)

				if GetFFlagAddPromCounterToKeystoreOps() then
					TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, {
						customFields = {
							reason = "remote_logout"
						}
					}, 1)
				end

				v65()
			end

			if v38 then
				AppStorageUtilities.clearAccountSwitchStartupGameParams()
				AppStorageUtilities.flush()
			end

			ResetOnNoAccountInfoFound(p10, p11, p7, p9, luaLogoutReasonNames.UnauthorizedAutoLogin, nil, nil, false)

			return
		end

		ShowAccountAuthenticationFailureOverlay(p11, function() -- line: 372
			-- upvalues: handleAccountInfo (copy), p7 (copy), p8 (copy), p9 (copy), p10 (copy), p11 (copy), p12 (copy), p13 (copy)
			handleAccountInfo(p7, p8, p9, p10, p11, p12, p13)
		end)
	end)
end

return handleAccountInfo
