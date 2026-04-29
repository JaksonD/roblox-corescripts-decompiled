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
local ShowAccountAuthenticationFailureOverlay = require(Modules.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay)
local DeleteAllCredentialsFromKeystore = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
local ApiFetchUsersRoles = require(Modules.LuaApp.Thunks.ApiFetchUsersRoles)
local ReceivedUserCountryCode = require(CorePackages.Workspace.Packages.CountryCode).ReceivedUserCountryCode
local v31 = game:GetEngineFeature("AppTracing") and game:GetService("TracerService") or nil
local luaLogoutReasonNames = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local GetFFlagPasskeySignupEnabled = require(Modules.LuaApp.Flags.GetFFlagPasskeySignupEnabled)
local GetFFlagEnableMultiPageSignupExperiment = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local FFlagEnableIosKeychainLoginLua = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
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
local GetFFlagKeystoreAutoLoginAvailable = SharedFlags.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagDisableKeystoreUnderageDeletion = SharedFlags.GetFFlagDisableKeystoreUnderageDeletion
local GetFFlagAddPromCounterToKeystoreOps = SharedFlags.GetFFlagAddPromCounterToKeystoreOps

local function navigateToPostAuthLandingPage(p1, p2, p3, p4, p5) -- line: 81
	-- upvalues: AppStorageUtilities (copy), ResetNavigationHistory (copy), AppPage (copy), GetFFlagPasskeySignupEnabled (copy), GetFFlagEnableMultiPageSignupExperiment (copy), FFlagPreHomePageRoutingEnabled (copy), FFlagPasskeyUpsellEnabled (copy), HandlePreHomePageRouting (copy)
	local v68 = not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or AppStorageUtilities.getSignupActionRequired()

	if p2 and p4.isUnder13 then
		p1:dispatch(ResetNavigationHistory({{
			name = AppPage.UAppBlock
		}}))

		return
	end

	if v68 == "auth" then
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
		HandlePreHomePageRouting(p5, p1, ResetNavigationHistory):andThen(function(p6) -- line: 102
			-- upvalues: p1 (copy), ResetNavigationHistory (copy), p3 (copy)
			if not p6 then
				p1:dispatch(ResetNavigationHistory({{
					name = p3
				}}))
			end
		end)

		return
	end

	p1:dispatch(ResetNavigationHistory({{
		name = p3
	}}))
end
local function clearAuthFailureOverlayOnSuccess(p7, p8, p9, p10, p11, p12) -- line: 112
	-- upvalues: OverlayType (copy), CloseAccountAuthenticationFailureOverlay (copy), navigateToPostAuthLandingPage (copy)
	if p7:getState().CentralOverlay.OverlayType == OverlayType.AccountAuthenticationFailureOverlay then
		p7:dispatch(CloseAccountAuthenticationFailureOverlay())

		if p8:isEqual(p9) then
			navigateToPostAuthLandingPage(p7, p10, p11, p8, p12)
		end
	end
end
local function handleUserMismatchAndUpdatePreloadStarted(p13, p14, p15, p16, p17, p18, p19, p20) -- line: 134
	-- upvalues: ClearApp (copy), GetLocalUser (copy), ReceivedUserCountryCode (copy), navigateToPostAuthLandingPage (copy), RoactAppExperiment (copy)
	if not p13:isEqual(p14) then
		p13:setToLocalPlayer()
		p13:setToLocalStorage()

		if p16 then
			p15:dispatch(ClearApp())
			p17 = false
		end

		p15:dispatch(GetLocalUser())
		p15:dispatch(ReceivedUserCountryCode(p13.countryCode))
		navigateToPostAuthLandingPage(p15, p18, p19, p13, p20)
		RoactAppExperiment.initializeUserLayers(p13.userId)
	end

	return p17
end
local function fetchAndApplyUserSettings(p21, p22, p23, p24) -- line: 166
	-- upvalues: AppStorageUtilities (copy), LocalizationService (copy), FetchTheme (copy), ApiFetchUsersRoles (copy), GetFFlagPasskeySignupEnabled (copy), MemStorageService (copy), MemStorageKeys (copy), PromiseUtilities (copy)
	local t1 = {}

	table.insert(t1, p21:andThen(function(p25) -- line: 170
		-- upvalues: AppStorageUtilities (copy), LocalizationService (copy)
		AppStorageUtilities.setRobloxLocaleId(p25.generalExperienceLocale)
		AppStorageUtilities.setGameLocaleId(p25.ugcLocale)
		LocalizationService:SetRobloxLocaleId(p25.generalExperienceLocale)
	end))

	local v88 = FetchTheme(p22, p23.userId)

	p24:dispatch(ApiFetchUsersRoles(p22))

	local v89 = (not game:GetEngineFeature("SignupActionRequiredKeyAvailable") and "" or AppStorageUtilities.getSignupActionRequired()) == "auth" and GetFFlagPasskeySignupEnabled()

	table.insert(t1, v88:andThen(function(p26) -- line: 188
		-- upvalues: AppStorageUtilities (copy), v89 (copy), MemStorageService (copy), MemStorageKeys (copy)
		AppStorageUtilities.setAuthenticatedTheme(p26)

		if not v89 then
			MemStorageService:Fire(MemStorageKeys.ThemeUpdate, p26)
		end
	end))
	PromiseUtilities.Batch(t1):andThen(function() -- line: 198
		-- upvalues: AppStorageUtilities (copy)
		AppStorageUtilities.flush()
	end)
end
local function v58() -- line: 203
	-- upvalues: HttpService (copy), ContentProvider (copy), GetFFlagKeystoreAutoLoginAvailable (copy), DeleteAllCredentialsFromKeystore (copy), default (copy), KeystoreConstants (copy)
	local json = HttpService:JSONEncode({
		server = ContentProvider.BaseUrl
	})

	if GetFFlagKeystoreAutoLoginAvailable() then
		return DeleteAllCredentialsFromKeystore(json)
	end

	return default:deleteAllCredentialsFromiOSKeychain(default.CredentialsTypes.iosKeychainPassword, json, KeystoreConstants.KeystoreTimeout)
end
local function handleUnderageKeychainDeletion(p27) -- line: 218
	-- upvalues: FFlagEnableIosKeychainLoginLua (copy), GetFFlagDisableKeystoreUnderageDeletion (copy), v58 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy)
	if FFlagEnableIosKeychainLoginLua and (p27.userId ~= nil and p27.userId ~= -1 and p27.isUnder13 == true and not GetFFlagDisableKeystoreUnderageDeletion()) then
		v58():andThen(function() -- line: 226
			-- upvalues: KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), p27 (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy)
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.underageDelete, (tostring(p27.userId)))

			if GetFFlagAddPromCounterToKeystoreOps() then
				TelemetryService:LogCounter(KeystoreDeleteCredentialsTelemetryConfig, {
					customFields = {
						reason = "underage"
					}
				}, 1)
			end
		end)
	end
end
local function handleUnauthorizedError(p28, p29, p30, p31) -- line: 252
	-- upvalues: default2 (copy), TelemetryConfigs (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreDeleteCredentialsTelemetryConfig (copy), v58 (copy), ResetOnNoAccountInfoFound (copy), luaLogoutReasonNames (copy)
	spawn(function() -- line: 253
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

		v58()
	end

	ResetOnNoAccountInfoFound(p28, p29, p30, p31, luaLogoutReasonNames.UnauthorizedAutoLogin, nil, nil, false)
end

function handleAccountInfoFromLua(p32, p33, p34, p35, p36, p37, p38, p39, p40, p41) -- line: 337
	-- upvalues: v31 (copy), GetUserAppLaunchInfo (copy), reportEphemeralCounter (copy), AppSessionCheckCounterNames (copy), User (copy), handleUnderageKeychainDeletion (copy), clearAuthFailureOverlayOnSuccess (copy), handleUserMismatchAndUpdatePreloadStarted (copy), fetchAndApplyUserSettings (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy), StatusCodes (copy), handleUnauthorizedError (copy), ShowAccountAuthenticationFailureOverlay (copy)
	local s1 = ""

	if v31 then
		s1 = v31:StartSpan("luaAccountInfo", "")
	end

	if p39 then
		p39:logEventOnce("lua_auth_request_begin")
	end

	GetUserAppLaunchInfo(p33):andThen(function(p42) -- line: 357
		-- upvalues: p39 (copy), v31 (copy), s1 (ref), reportEphemeralCounter (copy), AppSessionCheckCounterNames (copy), User (copy), handleUnderageKeychainDeletion (copy), clearAuthFailureOverlayOnSuccess (copy), p36 (copy), p32 (copy), p40 (copy), p37 (copy), p33 (copy), p41 (ref), handleUserMismatchAndUpdatePreloadStarted (copy), p35 (copy), p38 (copy), fetchAndApplyUserSettings (copy), p34 (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy)
		if p39 then
			p39:logEventOnce("lua_auth_request_end")
		end

		if v31 and s1 ~= "" then
			v31:FinishSpan(s1)
		end

		reportEphemeralCounter(AppSessionCheckCounterNames.Success, 1)

		local v147 = User.fromUserInfoRequest(p42)

		handleUnderageKeychainDeletion(v147)
		clearAuthFailureOverlayOnSuccess(p36, v147, p32, p40, p37, p33)
		p41 = handleUserMismatchAndUpdatePreloadStarted(v147, p32, p36, p35, p41, p40, p37, p33)

		if not p41 then
			p41 = true
			p38()
		end

		fetchAndApplyUserSettings(p34, p33, v147, p36)

		local v148 = p36

		GuiService:BroadcastNotification(v147:toJsonData(), NotificationType.DID_LOG_IN)
		v148:dispatch(SetAuthenticationStatus(LoginStatus.LOGGED_IN))
	end, function(p43) -- line: 408
		-- upvalues: p35 (copy), p36 (copy), p33 (copy), p34 (copy), p32 (copy), p37 (copy), p38 (copy), StatusCodes (copy), reportEphemeralCounter (copy), AppSessionCheckCounterNames (copy), handleUnauthorizedError (copy), ShowAccountAuthenticationFailureOverlay (copy)
		local StatusCode = p43.StatusCode
		local v151 = p35
		local v152 = p36
		local v153 = p33
		local v154 = p34
		local v155 = p32
		local v156 = p37
		local v157 = p38

		if StatusCode == StatusCodes.UNAUTHORIZED then
			reportEphemeralCounter(AppSessionCheckCounterNames.Failure401Unauthenticated, 1)
		else
			reportEphemeralCounter(AppSessionCheckCounterNames.FailureUnknownError, 1)
		end

		reportEphemeralCounter(AppSessionCheckCounterNames.Failure, 1)

		if StatusCode == StatusCodes.UNAUTHORIZED then
			handleUnauthorizedError(v151, v152, v153, v154)

			return
		end

		ShowAccountAuthenticationFailureOverlay(v152, function() -- line: 295
			-- upvalues: v155 (copy), v153 (copy), v154 (copy), v151 (copy), v152 (copy), v156 (copy), v157 (copy)
			handleAccountInfoFromLua(v155, v153, v154, v151, v152, v156, v157)
		end)
	end)
end
function handleSessionCheckSuccess(p44, p45, p46, p47, p48, p49, p50, _, p52, p53) -- line: 422
	-- upvalues: User (copy), handleUnderageKeychainDeletion (copy), clearAuthFailureOverlayOnSuccess (copy), handleUserMismatchAndUpdatePreloadStarted (copy), fetchAndApplyUserSettings (copy), GuiService (copy), NotificationType (copy), SetAuthenticationStatus (copy), LoginStatus (copy)
	local v134 = User.fromLocalStorage()

	handleUnderageKeychainDeletion(v134)
	clearAuthFailureOverlayOnSuccess(p48, v134, p45, p52, p49, p44)

	if not handleUserMismatchAndUpdatePreloadStarted(v134, p45, p48, p47, p53, p52, p49, p44) then
		p50()
	end

	fetchAndApplyUserSettings(p46, p44, v134, p48)
	GuiService:BroadcastNotification(v134:toJsonData(), NotificationType.DID_LOG_IN)
	p48:dispatch(SetAuthenticationStatus(LoginStatus.LOGGED_IN))
end
function handleSessionCheckFailure(p54, p55, p56, p57, p58, p59, p60, p61) -- line: 473
	-- upvalues: StatusCodes (copy), reportEphemeralCounter (copy), AppSessionCheckCounterNames (copy), handleUnauthorizedError (copy), ShowAccountAuthenticationFailureOverlay (copy)
	if p54 == StatusCodes.UNAUTHORIZED then
		reportEphemeralCounter(AppSessionCheckCounterNames.Failure401Unauthenticated, 1)
	else
		reportEphemeralCounter(AppSessionCheckCounterNames.FailureUnknownError, 1)
	end

	reportEphemeralCounter(AppSessionCheckCounterNames.Failure, 1)

	if p54 == StatusCodes.UNAUTHORIZED then
		handleUnauthorizedError(p55, p56, p57, p58)

		return
	end

	ShowAccountAuthenticationFailureOverlay(p56, function() -- line: 295
		-- upvalues: p59 (copy), p57 (copy), p58 (copy), p55 (copy), p56 (copy), p60 (copy), p61 (copy)
		handleAccountInfoFromLua(p59, p57, p58, p55, p56, p60, p61)
	end)
end

return {
	handleSessionCheckSuccess = handleSessionCheckSuccess,
	handleSessionCheckFailure = handleSessionCheckFailure,
	handleAccountInfoFromLua = handleAccountInfoFromLua
}
