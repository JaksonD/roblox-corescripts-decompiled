local UserInputService, GuiService, MemStorageService, HttpService, LocalizationService, Cryo, Selectors, FFlagUseNavigationSelectors, Roact, RoactRodux, RoactNetworking, RoactServices, RoactAnalyticsAuthEvents, RoactAppExperiment, RoactAppPolicy, RoactAnalytics, ReactFocusNavigation, LinkingProtocol, AppLinking, AppPage, Login, LoginByCode, LoginByPasskey, LoginByOtp, LaunchApp, StartPasskeyAuthentication, NavigateDown, OpenCentralOverlayForLoginPasswordResetPrompt, SetLoginResult, SetBackNavigationDisabled, SetCentralOverlay, CrossDeviceLogin, DisclaimerLinks, OpenAccountSelector, Logout, OpenEmailOtp, CloseCentralOverlay, NavigateBack, GetIXPLayerParameters, LogoWithContentsLayout, DualLoginWithContentsLayout, CredentialLoginContainer, LoginCodePrompt, Alignment, MemStorageKeys, OverlayType, withStyle, withLocalization, AppBtidLayers, EventStreamConstants, Constants, AccountSwitcherConstants, LaunchContext, LinkButton, FlagSettings, RenderChallenge, LogoutAllLoggedInUsers, ResetAppState, GetFFlagLuaAppEnableDesktopDualLoginABTest, GetFIntLuaAppCredentialsProtocolAvailableTimeout, GetFFlagEnableOtpEmailLogin, GetFFlagShouldUsePeekViewForLoginDisambiguation, GetFFlagEnableCredentialsProtocolPasswords, GetFFlagAuthIntentLoggingAtLoginEnabled, FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues, FFlagEnableCredentialsV2InterfaceDetectionFix, default, AppLogging, useUiModeInfo, UiMode, Logger, AppStorageUtilities, OpenAccountSwitchingErrorOverlay, FFlagEnableLuaAccountSwitch, FFlagEnableKoreaKISACompliance, FFlagLuaEnableDidSwitchAccount, FFlagAuthSecExclusions, FFlagEnableAuthDeepLinkReceiver, PreAuthDeepLinkUrlStore, User, NotificationType, Promise, GetFFlagEnableVNGNewAppAvailableModal, v131, FFlagEnableVNGDUARSignupCompliance, GetFFlagEnableAccountSwitcherFoundationDesign, GetFFlagEnableAccountSwitcherRedesignIXP, GetFFlagEnableAccountSwitcherIXPTextGatingFix, FFlagEnableIosKeychainLoginLua, withNavigationProps, KeystoreAnalyticsEvents, KeystoreEventConstants, v145, v147, GetFFlagKeystoreAutoLoginAvailable, SystemThemeFeature, TelemetryConfigs, v163, v164, t1

do
	local ContentProvider, AppStorageService, AuthCommon, GetPasswordManagerUsageStore, LoginResult, AuthCanVerifyCredentials, isStringEmail, isStringPhone, enrolledInLuafiedRecoveryExperiment, Base64, TransitionAnimation, LoginErrorCodes, LocalStorageKey, CredentialType, StatusCodes, reportEphemeralCounter, AppLoginCounterNames, SharedFlags, Type, GetFFlagLuaAppWaitBeforeTwoStepRenderDev, GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev, GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin, TwoStepRequests, ActionType, GetFFlagEnableLoginAccountSelector, GetFIntLoginViewBottomPaddingPx, GetFFlagShouldEnableOtpDisambiguationPeekViewFix, GetFFlagAlwaysSaveCredentialsAfter2Sv, GetFFlagReportCrossAppLoginAttempt, FFlagPasswordManagerAwaitEnabled, v101, Constants2, CredentialsProtocolErrorCodes, DeleteAllCredentialsFromKeystore, v116, v117, FFlagEnablePasskeyLoginErrorLogging, FFlagEnablePWManagerLoginCheck, FFlagEnablePWManagerSignupCheck, FFlagEnableNavigateToLoginAfterLogoutAll, RbxAnalyticsService, GetFStringVNGDownloadNowUrl, GetUserByUsername, KeystoreConstants, AccountLinkingAlertType, TwoStepErrorCodes, getTwoStepLoginErrorKey, v146, GetFFlagBypassKeystoreLoginIxpV2, GetFFlagRemoveKeystoreIxpLogic, GetFFlagEnableLuafiedRecoveryFlow, FFlagDisableMemStorageServicePasswordEvent, FFlagEnableLoginV1ForcedUsernameOverride, GetFFlagCheckIsAvailableForKeystoreOperations, GetFFlagEnable2SVRecovery, v157

	do
		local Modules = game:GetService("CoreGui").RobloxGui.Modules
		local CorePackages = game:GetService("CorePackages")

		ContentProvider = game:GetService("ContentProvider")
		UserInputService = game:GetService("UserInputService")
		GuiService = game:GetService("GuiService")
		AppStorageService = game:GetService("AppStorageService")
		MemStorageService = game:GetService("MemStorageService")
		HttpService = game:GetService("HttpService")
		LocalizationService = game:GetService("LocalizationService")
		Cryo = require(CorePackages.Packages.Cryo)
		Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
		FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors

		do
			local Common = Modules.Common

			Roact = require(Common.Roact)
			RoactRodux = require(Common.RoactRodux)
		end

		RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
		RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
		RoactAnalyticsAuthEvents = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
		RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
		RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
		RoactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics)
		ReactFocusNavigation = require(CorePackages.Packages.ReactFocusNavigation)
		AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
		GetPasswordManagerUsageStore = AuthCommon.Stores.GetPasswordManagerUsageStore
		LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
		AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
		AppPage = require(Modules.LuaApp.AppPage)
		Login = require(Modules.LuaApp.Thunks.Authentication.Login)
		LoginByCode = require(Modules.LuaApp.Thunks.Authentication.LoginByCode)
		LoginByPasskey = require(Modules.LuaApp.Thunks.Authentication.LoginByPasskey)
		LoginByOtp = require(Modules.LuaApp.Thunks.Authentication.LoginByOtp)
		LoginResult = require(Modules.LuaApp.Models.Authentication.LoginResult)
		LaunchApp = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
		StartPasskeyAuthentication = require(Modules.LuaApp.Thunks.Authentication.StartPasskeyAuthentication)
		NavigateDown = require(Modules.LuaApp.Thunks.NavigateDown)
		OpenCentralOverlayForLoginPasswordResetPrompt = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt)
		SetLoginResult = require(Modules.LuaApp.Actions.Authentication.SetLoginResult)
		SetBackNavigationDisabled = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
		SetCentralOverlay = require(Modules.LuaApp.Actions.SetCentralOverlay)
		CrossDeviceLogin = require(Modules.LuaApp.Thunks.Authentication.CrossDeviceLogin)
		DisclaimerLinks = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
		OpenAccountSelector = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSelector)
		Logout = require(Modules.LuaApp.Thunks.Authentication.Logout)
		OpenEmailOtp = require(Modules.LuaApp.Thunks.Authentication.OpenEmailOtp)
		CloseCentralOverlay = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
		NavigateBack = require(Modules.LuaApp.Thunks.NavigateBack)
		AuthCanVerifyCredentials = require(Modules.LuaApp.Http.Requests.AuthCanVerifyCredentials)
		GetIXPLayerParameters = require(Modules.LuaApp.Http.Requests.GetIXPLayerParameters)
		LogoWithContentsLayout = require(Modules.LuaApp.Components.Authentication.LogoWithContentsLayout)
		DualLoginWithContentsLayout = require(Modules.LuaApp.Components.Authentication.DualLoginWithContentsLayout)
		isStringEmail = AuthCommon.Utils.isStringEmail
		isStringPhone = AuthCommon.Utils.isStringPhone
		enrolledInLuafiedRecoveryExperiment = AuthCommon.Experiments.enrolledInLuafiedRecoveryExperiment
		Base64 = require(Modules.LuaApp.Util.Base64)
		CredentialLoginContainer = require(Modules.LuaApp.Components.Authentication.CredentialLoginContainer)
		LoginCodePrompt = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt)
		TransitionAnimation = require(Modules.LuaApp.Enum.TransitionAnimation)
		LoginErrorCodes = require(Modules.LuaApp.Enum.LoginErrorCodes)
		Alignment = require(Modules.LuaApp.Enum.Alignment)
		LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
		MemStorageKeys = require(Modules.LuaApp.Enum.MemStorageKeys)
		OverlayType = require(Modules.LuaApp.Enum.OverlayType)
		CredentialType = require(Modules.LuaApp.Enum.CredentialType)

		do
			local UIBlox = require(CorePackages.Packages.UIBlox)

			withStyle = UIBlox.Style.withStyle
			withLocalization = require(Modules.LuaApp.withLocalization)
			StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
			reportEphemeralCounter = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
			AppLoginCounterNames = require(Modules.LuaApp.Analytics.Events.AppLoginCounterNames)
			AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
			EventStreamConstants = require(Modules.LuaApp.EventStreamConstants)
			Constants = require(Modules.LuaApp.Constants)
			AccountSwitcherConstants = require(CorePackages.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants
			LaunchContext = require(Modules.LuaApp.Enum.LaunchContext)
			LinkButton = UIBlox.App.Button.LinkButton
		end

		FlagSettings = require(Modules.LuaApp.FlagSettings)
		SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
		Type = require(Modules.LuaApp.Enum.Challenge.Type)
		GetFFlagLuaAppWaitBeforeTwoStepRenderDev = require(Modules.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev)
		GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev = require(Modules.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev)
		GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin = require(Modules.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin)
		RenderChallenge = require(Modules.LuaApp.Thunks.Challenge.RenderChallenge)
		TwoStepRequests = require(Modules.LuaApp.Http.Requests.TwoStepRequests)
		LogoutAllLoggedInUsers = require(Modules.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers)
		ResetAppState = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
		ActionType = require(Modules.LuaApp.Enum.Challenge.TwoStepVerification.ActionType)
		GetFFlagLuaAppEnableDesktopDualLoginABTest = SharedFlags.GetFFlagLuaAppEnableDesktopDualLoginABTest
		GetFFlagEnableLoginAccountSelector = require(Modules.LuaApp.Flags.GetFFlagEnableLoginAccountSelector)
		GetFIntLuaAppCredentialsProtocolAvailableTimeout = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
		GetFIntLoginViewBottomPaddingPx = require(Modules.LuaApp.Flags.GetFIntLoginViewBottomPaddingPx)
		GetFFlagEnableOtpEmailLogin = require(Modules.LuaApp.Flags.GetFFlagEnableOtpEmailLogin)
		GetFFlagShouldUsePeekViewForLoginDisambiguation = require(Modules.LuaApp.Flags.GetFFlagShouldUsePeekViewForLoginDisambiguation)
		GetFFlagShouldEnableOtpDisambiguationPeekViewFix = require(Modules.LuaApp.Flags.GetFFlagShouldEnableOtpDisambiguationPeekViewFix)
		GetFFlagEnableCredentialsProtocolPasswords = require(Modules.LuaApp.Flags.GetFFlagEnableCredentialsProtocolPasswords)
		GetFFlagAuthIntentLoggingAtLoginEnabled = require(Modules.LuaApp.Flags.GetFFlagAuthIntentLoggingAtLoginEnabled)
		GetFFlagAlwaysSaveCredentialsAfter2Sv = require(Modules.LuaApp.Flags.GetFFlagAlwaysSaveCredentialsAfter2Sv)
		GetFFlagReportCrossAppLoginAttempt = require(Modules.LuaApp.Flags.GetFFlagReportCrossAppLoginAttempt)
		FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlags.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
		FFlagPasswordManagerAwaitEnabled = SharedFlags.FFlagPasswordManagerAwaitEnabled
		FFlagEnableCredentialsV2InterfaceDetectionFix = SharedFlags.FFlagEnableCredentialsV2InterfaceDetectionFix
		v101 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1", false)

		local CredentialsProtocol = require(CorePackages.Workspace.Packages.CredentialsProtocol)

		Constants2 = CredentialsProtocol.Constants
		default = CredentialsProtocol.CredentialsProtocol.default
		CredentialsProtocolErrorCodes = CredentialsProtocol.CredentialsProtocolErrorCodes
		AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
		useUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
		UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
		Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
		AppStorageUtilities = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
		DeleteAllCredentialsFromKeystore = require(Modules.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore)
		OpenAccountSwitchingErrorOverlay = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay)
		FFlagEnableLuaAccountSwitch = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
		FFlagEnableKoreaKISACompliance = require(Modules.LuaApp.Flags.FFlagEnableKoreaKISACompliance)
		FFlagLuaEnableDidSwitchAccount = require(Modules.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount)
		v116 = game:DefineFastFlag("AwaitLoginCompletionForDisambiguationFlow", false)
		game:DefineFastFlag("LuaLoginManualCredentialValidation", false)
		v117 = game:DefineFastFlag("EnableLoginV1RegisterCredentialsFix", false)
		FFlagEnablePasskeyLoginErrorLogging = SharedFlags.FFlagEnablePasskeyLoginErrorLogging
		FFlagAuthSecExclusions = SharedFlags.FFlagAuthSecExclusions
		FFlagEnablePWManagerLoginCheck = SharedFlags.FFlagEnablePWManagerLoginCheck
		FFlagEnablePWManagerSignupCheck = SharedFlags.FFlagEnablePWManagerSignupCheck
		FFlagEnableAuthDeepLinkReceiver = SharedFlags.FFlagEnableAuthDeepLinkReceiver
		FFlagEnableNavigateToLoginAfterLogoutAll = SharedFlags.FFlagEnableNavigateToLoginAfterLogoutAll
		PreAuthDeepLinkUrlStore = AuthCommon.Stores.PreAuthDeepLinkUrlStore
		User = require(script.Parent.Parent.Parent.Thunks.Authentication.User)
		NotificationType = require(Modules.LuaApp.Enum.NotificationType)
		RbxAnalyticsService = game:GetService("RbxAnalyticsService")
		Promise = require(CorePackages.Packages.Promise)
		GetFFlagEnableVNGNewAppAvailableModal = require(Modules.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal)
		GetFStringVNGDownloadNowUrl = require(Modules.LuaApp.Flags.GetFStringVNGDownloadNowUrl)
		v131 = game:DefineFastFlag("FixLoginSelection", false)
		FFlagEnableVNGDUARSignupCompliance = require(Modules.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance)
		GetFFlagEnableAccountSwitcherFoundationDesign = SharedFlags.GetFFlagEnableAccountSwitcherFoundationDesign
		GetFFlagEnableAccountSwitcherRedesignIXP = SharedFlags.GetFFlagEnableAccountSwitcherRedesignIXP
		GetFFlagEnableAccountSwitcherIXPTextGatingFix = SharedFlags.GetFFlagEnableAccountSwitcherIXPTextGatingFix
		FFlagEnableIosKeychainLoginLua = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
		GetUserByUsername = AuthCommon.Thunks.GetUserByUsername
		withNavigationProps = require(CorePackages.Workspace.Packages.RobloxAppNavigation).withNavigationProps
		KeystoreConstants = AuthCommon.Common.KeystoreConstants
		KeystoreAnalyticsEvents = AuthCommon.Analytics.KeystoreAnalyticsEvents
		KeystoreEventConstants = AuthCommon.Analytics.KeystoreEventConstants
		AccountLinkingAlertType = AuthCommon.Enums.AccountLinkingAlertType
		TwoStepErrorCodes = AuthCommon.Enums.TwoStepErrorCodes
		getTwoStepLoginErrorKey = AuthCommon.Utils.getTwoStepLoginErrorKey
		v145 = game:DefineFastFlag("LoginButtonAutoDisabled", false)
		v146 = game:DefineFastFlag("EnableTwoStepLoginChallengeAnalytics", false)
		v147 = game:DefineFastFlag("DebugOTPBypass", false)
		GetFFlagBypassKeystoreLoginIxpV2 = SharedFlags.GetFFlagBypassKeystoreLoginIxpV2
		GetFFlagRemoveKeystoreIxpLogic = SharedFlags.GetFFlagRemoveKeystoreIxpLogic
		GetFFlagEnableLuafiedRecoveryFlow = SharedFlags.GetFFlagEnableLuafiedRecoveryFlow
		FFlagDisableMemStorageServicePasswordEvent = SharedFlags.FFlagDisableMemStorageServicePasswordEvent
		FFlagEnableLoginV1ForcedUsernameOverride = SharedFlags.FFlagEnableLoginV1ForcedUsernameOverride
		GetFFlagKeystoreAutoLoginAvailable = SharedFlags.GetFFlagKeystoreAutoLoginAvailable
		GetFFlagCheckIsAvailableForKeystoreOperations = SharedFlags.GetFFlagCheckIsAvailableForKeystoreOperations
		GetFFlagEnable2SVRecovery = require(CorePackages.Workspace.Packages.AccountRecovery).Flags.GetFFlagEnable2SVRecovery
		SystemThemeFeature = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
		v157 = game:DefineFastFlag("EnableAccountSwitchSignInThemeFix", false)
		TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
	end

	local KeystoreSaveCredentialsTelemetryConfig = TelemetryConfigs.KeystoreSaveCredentialsTelemetryConfig
	local TelemetryService = game:GetService("TelemetryService")
	local GetFFlagAddPromCounterToKeystoreOps = SharedFlags.GetFFlagAddPromCounterToKeystoreOps
	local PasskeyConstants = AuthCommon.Common.PasskeyConstants

	v163 = Roact.PureComponent:extend("LoginView")
	v164 = GetFIntLoginViewBottomPaddingPx()
	t1 = {
		CValue = 1,
		Password = 2
	}

	function v163.init(p1) -- line: 220
		-- upvalues: Roact (copy), v131 (copy), AppStorageService (copy), LocalStorageKey (copy), FFlagEnableLuaAccountSwitch (copy), FFlagEnableLoginV1ForcedUsernameOverride (copy), FFlagEnablePWManagerLoginCheck (copy), GetPasswordManagerUsageStore (copy), FFlagEnablePWManagerSignupCheck (copy), LoginErrorCodes (copy), t1 (copy), User (copy), AppStorageUtilities (copy), MemStorageService (copy), MemStorageKeys (copy), v157 (copy), SystemThemeFeature (copy), UserInputService (copy), AuthCanVerifyCredentials (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), HttpService (copy), Base64 (copy), default (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), EventStreamConstants (copy), PasskeyConstants (copy), FFlagEnablePasskeyLoginErrorLogging (copy), GetFFlagEnableOtpEmailLogin (copy), Type (copy), GetFFlagLuaAppWaitBeforeTwoStepRenderDev (copy), GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev (copy), v146 (copy), ActionType (copy), GetFFlagEnable2SVRecovery (copy), TwoStepRequests (copy), GetFFlagAlwaysSaveCredentialsAfter2Sv (copy), FFlagDisableMemStorageServicePasswordEvent (copy), GetFFlagEnableCredentialsProtocolPasswords (copy), FFlagPasswordManagerAwaitEnabled (copy), v101 (copy), TwoStepErrorCodes (copy), getTwoStepLoginErrorKey (copy), AccountLinkingAlertType (copy), isStringEmail (copy), isStringPhone (copy), v116 (copy), GetFFlagShouldEnableOtpDisambiguationPeekViewFix (copy), GetFFlagShouldUsePeekViewForLoginDisambiguation (copy), Promise (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), ContentProvider (copy), GetUserByUsername (copy), DeleteAllCredentialsFromKeystore (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), LoginResult (copy), GetFFlagEnableLoginAccountSelector (copy), Constants2 (copy), v117 (copy), LogoutAllLoggedInUsers (copy), AccountSwitcherConstants (copy), GuiService (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), StatusCodes (copy), Constants (copy), CredentialType (copy), GetFFlagEnableVNGNewAppAvailableModal (copy), GetFStringVNGDownloadNowUrl (copy), GetFFlagEnableLuafiedRecoveryFlow (copy), enrolledInLuafiedRecoveryExperiment (copy), AppPage (copy), TransitionAnimation (copy), GetFFlagReportCrossAppLoginAttempt (copy), RbxAnalyticsService (copy)
		local u172 = false

		p1.cvalueRef = Roact.createRef()
		p1.passwordRef = Roact.createRef()
		p1.loginButtonRef = Roact.createRef()
		p1.forgotLinkRef = Roact.createRef()
		p1.crossDeviceButtonRef = Roact.createRef()
		p1.emailOtpRef = Roact.createRef()

		if v131 then
			p1.focusRef = Roact.createRef()
		end

		local Item = AppStorageService:GetItem(LocalStorageKey.CredentialValue)

		if FFlagEnableLuaAccountSwitch then
			local Item2 = AppStorageService:GetItem(LocalStorageKey.AccountBlob)

			if Item2 and Item2 ~= "" then
				Item = ""
			end
		end

		if FFlagEnableLoginV1ForcedUsernameOverride and p1.props.forcedUsernameOverride then
			Item = p1.props.forcedUsernameOverride
		end

		local v175, v176 = Roact.createBinding(Item)

		p1.cvalueText = v175
		p1.updateCValueText = v176

		local v177, v178 = Roact.createBinding("")

		p1.passwordText = v177
		p1.updatePasswordText = v178
		p1.state = {
			errorKey = "",
			localizedErrorMessage = nil,
			errorCode = -1,
			loginButtonDisabled = true,
			isLoginInProgress = false,
			forceLoginByUsername = false,
			forgotLinkFocused = false,
			quickLoginButtonTextOverride = "",
			isDesktopDualLoginEnabled = false,
			isLoginByOtp = false,
			otpSessionToken = "",
			otpCode = "",
			isCredentialsProtocolRegisterPasswordAvailable = false
		}
		p1.passwordManagerUsageStore = if not FFlagEnablePWManagerLoginCheck then nil else GetPasswordManagerUsageStore(false)

		if FFlagEnablePWManagerSignupCheck and p1.passwordManagerUsageStore then
			p1.passwordManagerUsageStore.resetAll()
		elseif p1.passwordManagerUsageStore then
			p1.passwordManagerUsageStore.setLoggedinUsingSavedPassword(false)
			p1.passwordManagerUsageStore.setSavedPasswordAfterLogin(false)
		end

		p1.errorHandlingInfoList = {
			[LoginErrorCodes.IncorrectCValueOrPassword] = {
				textBoxesToClear = { t1.Password },
				newFocusedTextBox = t1.Password
			},
			[LoginErrorCodes.CValueAndPasswordRequired] = {
				textBoxesToClear = { t1.Password },
				newFocusedTextBox = t1.Password
			},
			[LoginErrorCodes.AccountLocked] = {
				textBoxesToClear = { t1.Password }
			},
			[LoginErrorCodes.MoreThanOneUsername] = {
				textBoxesToClear = {
					t1.CValue,
					t1.Password
				},
				newFocusedTextBox = t1.CValue,
				forceLoginByUsername = true
			},
			[LoginErrorCodes.AccountNotVerified] = {
				textBoxesToClear = {
					t1.CValue,
					t1.Password
				},
				forceLoginByUsername = true
			},
			[LoginErrorCodes.MultipleUsersPerCredential] = if not p1.props.appPolicy.getAccountDisambiguationDisabled() then nil else {
				textBoxesToClear = {
					t1.CValue,
					t1.Password
				},
				newFocusedTextBox = t1.CValue,
				forceLoginByUsername = true
			}
		}
		p1.isAlreadyAuthenticated = User.fromLocalStorage().userId ~= -1

		function resetDefaultTheme() -- line: 308
			-- upvalues: AppStorageUtilities (copy), MemStorageService (copy), MemStorageKeys (copy), v157 (copy), SystemThemeFeature (copy)
			local v229 = AppStorageUtilities.getAuthenticatedTheme()

			if v229 ~= "" then
				MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v229)
			end

			if v157 then
				SystemThemeFeature.ClearThemeOverride()
			end
		end
		function p1.updateIsLoginInProgress(p2) -- line: 318
			-- upvalues: p1 (copy)
			spawn(function() -- line: 319
				-- upvalues: p1 (copy), p2 (copy)
				local isLoginInProgress = p1.state.isLoginInProgress

				if p1.isMounted and isLoginInProgress ~= p2 then
					p1:setState({
						isLoginInProgress = p2
					})
				end
			end)
		end
		function p1.onTextBoxesChanged(p3) -- line: 329
			-- upvalues: p1 (copy)
			if not p1.cvalueRef.current or (not p1.passwordRef.current or not p1.isMounted) then
				return
			end

			local v232 = p3.Text:gsub("\t", "")

			if v232 ~= p3.Text then
				p3.Text = v232
			end

			p1:setState({
				loginButtonDisabled = #p1.cvalueRef.current.Text == 0 or #p1.passwordRef.current.Text == 0,
				errorKey = #p3.Text == 0 and p1.state.errorKey or "",
				errorCode = -1
			})
		end
		function p1.unfocusTextBoxes() -- line: 347
			-- upvalues: UserInputService (copy), p1 (copy)
			local FocusedTextBox = UserInputService:GetFocusedTextBox()

			if FocusedTextBox and (FocusedTextBox == p1.cvalueRef.current or FocusedTextBox == p1.passwordRef.current) then
				FocusedTextBox:ReleaseFocus()
			end
		end
		function p1.handleCaptchaResult(p4, p5) -- line: 356
			-- upvalues: p1 (copy)
			if p4 then
				p1.handleLoginWithFormData(p5)

				return
			end

			p1.updateIsLoginInProgress(false)
		end
		function p1.getCaptchaResultHandlerWithCode(p6, p7) -- line: 364
			-- upvalues: p1 (copy)
			return function(p8, p9) -- line: 365
				-- upvalues: p1 (copy), p6 (copy), p7 (copy)
				if p8 then
					p1.handleLoginWithCode(p6, p7, p9)

					return
				end

				p1.updateIsLoginInProgress(false)
			end
		end
		function p1.getSecurityQuestionsLoginWithCodeCallback(p10, p11) -- line: 374
			-- upvalues: p1 (copy)
			return function(p12) -- line: 375
				-- upvalues: p1 (copy), p10 (copy), p11 (copy)
				p1.handleLoginWithCode(p10, p11, nil, p12)
			end
		end
		function p1.getSecurityQuestionsLoginWithOtpCallback() -- line: 380
			-- upvalues: p1 (copy)
			return function(p13) -- line: 381
				-- upvalues: p1 (copy)
				p1.handleLoginWithOtp(p13, nil)
			end
		end
		function p1.getSecurityQuestionsLoginWithFormDataCallback() -- line: 386
			-- upvalues: p1 (copy)
			return function(p14) -- line: 387
				-- upvalues: p1 (copy)
				p1.handleLoginWithFormData(nil, p14)
			end
		end
		function p1.canVerifyCredentials(p15, p16, p17) -- line: 392
			-- upvalues: AuthCanVerifyCredentials (copy), p1 (copy)
			return AuthCanVerifyCredentials(p1.props.networking, p15, p16, p17):andThen(function(p18) -- line: 394
				return p18 and (p18.responseBody and p18.responseBody.canSend)
			end, function() -- line: 397
				return false
			end)
		end
		function p1.handleLoginWithCode(p19, p20, p21, p22) -- line: 403
			-- upvalues: p1 (copy), LoginErrorCodes (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy)
			p1.updateIsLoginInProgress(true)

			local setBackNavigationDisabled = p1.props.setBackNavigationDisabled

			p1.unfocusTextBoxes()
			setBackNavigationDisabled(true)

			local loginByCode = p1.props.loginByCode
			local v249 = p1.getCaptchaResultHandlerWithCode(p19, p20)
			local v250 = p1.getSecurityQuestionsLoginWithCodeCallback(p19, p20)

			return loginByCode(p1.props.networking, p19, p20, v249, p21, v250, p22):andThen(function(p23) -- line: 424
				-- upvalues: p1 (copy)
				p1.handleLoginResult(p23, nil)
			end, function(p24) -- line: 426
				-- upvalues: LoginErrorCodes (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), p1 (copy), p19 (copy), p20 (copy)
				if p24.errorCode ~= LoginErrorCodes.Captcha then
					reportEphemeralCounter(AppLoginCounterNames.FailureAuthCode, 1)
				end

				p1.handleLoginError(p24, p19, p20)
			end)
		end
		function p1.handleLoginWithPasskey(p25, p26) -- line: 434
			-- upvalues: FFlagEnableNavigateToLoginAfterLogoutAll (copy), u172 (ref), p1 (copy)
			if FFlagEnableNavigateToLoginAfterLogoutAll then
				u172 = false
			end

			p1.updateIsLoginInProgress(true)

			local setBackNavigationDisabled = p1.props.setBackNavigationDisabled

			p1.unfocusTextBoxes()
			setBackNavigationDisabled(true)

			return p1.props.loginByPasskey(p1.props.networking, p25, p26):andThen(function(p27) -- line: 445
				-- upvalues: p1 (copy)
				p1.handleLoginResult(p27, nil)
			end, function(p28) -- line: 447
				-- upvalues: p1 (copy), p25 (copy)
				p1.handleLoginError(p28, p25)
			end)
		end
		function p1.showPasskeyLoginPopup() -- line: 452
			-- upvalues: p1 (copy), HttpService (copy), UserInputService (copy), Base64 (copy), default (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), EventStreamConstants (copy), PasskeyConstants (copy)
			local networking = p1.props.networking

			return p1.props.startPasskeyAuthentication(networking):andThen(function(p29) -- line: 455
				-- upvalues: HttpService (copy), UserInputService (copy), Base64 (copy), default (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), p1 (copy), EventStreamConstants (copy), PasskeyConstants (copy)
				local data = HttpService:JSONDecode(p29.authenticationOptions)
				local sessionId = p29.sessionId
				local num = tonumber(data.publicKey.timeout)

				data.keyType = "platform"
				data.deviceBoundOnly = true

				if UserInputService:GetPlatform() ~= Enum.Platform.Android then
					data.publicKey.challenge = Base64.FromUrlSafeBase64(data.publicKey.challenge)
				end

				local json = HttpService:JSONEncode(data)

				default:getCredentials(default.CredentialsTypes.FIDO2, json, num):andThen(function(p30) -- line: 472
					-- upvalues: HttpService (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), p1 (copy), EventStreamConstants (copy), PasskeyConstants (copy), Base64 (copy), sessionId (copy)
					local data2 = HttpService:JSONDecode(p30)

					if data2 == nil or next(data2) == nil then
						Logger:info("Passkey credential signing failed. No result returned.")

						return
					end

					if data2.errorCode ~= nil then
						Logger:info("Passkey credential signing failed. Error {} (msg: {}) returned.", data2.errorCode, data2.errorMsg)

						local num2 = tonumber(data2.errorCode)
						local v466 = CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[num2 or -1] or string.format(CredentialsProtocolErrorCodes.UNMAPPED_ERROR_CODE, (tostring(data2.errorCode)))

						p1.props.authAnalytics.reportAuthClientError(EventStreamConstants.Context.PasskeyLoginAttempt, v466, PasskeyConstants.PASSKEY_FETCH_LOGIN_V1)

						return
					end

					Logger:info("Passkey credential signing completed. Attempting login.")
					data2.id = Base64.ToUrlSafeBase64(data2.id)
					data2.rawId = Base64.ToUrlSafeBase64(data2.rawId)
					data2.response.signature = Base64.ToUrlSafeBase64(data2.response.signature)
					data2.response.userHandle = Base64.ToUrlSafeBase64(data2.response.userHandle)
					data2.response.authenticatorData = Base64.ToUrlSafeBase64(data2.response.authenticatorData)
					data2.response.clientDataJSON = Base64.ToUrlSafeBase64(data2.response.clientDataJSON)
					p1.handleLoginWithPasskey(data2, sessionId)
				end, function(p31) -- line: 510
					-- upvalues: Logger (copy)
					Logger:warning("Passkey credential signing failed. Error: {}", p31)
				end)
			end, function(p32) -- line: 514
				-- upvalues: Logger (copy)
				Logger:warning("Fetching passkey login options failed with error code: {}", p32.errorCode)
			end)
		end
		function p1.showGenericCredentialLoginPopup(p33, p34) -- line: 519
			-- upvalues: p1 (copy), HttpService (copy), UserInputService (copy), Base64 (copy), Logger (copy), default (copy), FFlagEnablePasskeyLoginErrorLogging (copy), EventStreamConstants (copy), PasskeyConstants (copy)
			if not p33 and not p34 then
				return
			end

			local networking = p1.props.networking
			local startPasskeyAuthentication = p1.props.startPasskeyAuthentication
			local data = nil
			local sessionId = nil
			local num = nil
			local t2 = {}

			if p33 then
				startPasskeyAuthentication(networking):andThen(function(p35) -- line: 531
					-- upvalues: data (ref), HttpService (copy), sessionId (ref), num (ref), UserInputService (copy), Base64 (copy)
					data = HttpService:JSONDecode(p35.authenticationOptions)
					sessionId = p35.sessionId
					num = tonumber(data.publicKey.timeout)
					data.keyType = "platform"
					data.deviceBoundOnly = true

					if UserInputService:GetPlatform() ~= Enum.Platform.Android then
						data.publicKey.challenge = Base64.FromUrlSafeBase64(data.publicKey.challenge)
					end
				end, function(p36) -- line: 545
					-- upvalues: Logger (copy)
					Logger:warning("Fetching passkey login options failed with error code: {}", p36.errorCode)
				end):await()

				if data ~= nil then
					t2.FIDO2 = data
				end
			end

			if p34 then
				t2.password = {}
			end

			local json = HttpService:JSONEncode(t2)

			return default:getCredentials(default.CredentialsTypes.all, json, num / 1000):andThen(function(p37) -- line: 562
				-- upvalues: HttpService (copy), Logger (copy), FFlagEnablePasskeyLoginErrorLogging (copy), p1 (copy), EventStreamConstants (copy), PasskeyConstants (copy), default (copy), Base64 (copy), sessionId (ref)
				local data3 = HttpService:JSONDecode(p37)

				if data3 == nil or not data3.response and not data3.errorCode then
					Logger:info("Generic credential fetch failed. No result returned.")

					return
				end

				if data3.errorCode ~= nil then
					Logger:info("Generic credential fetch failed. Error {} (msg: {}) returned.", data3.errorCode, data3.errorMsg)

					if FFlagEnablePasskeyLoginErrorLogging and type(data3.errorMsg) == "string" then
						p1.props.authAnalytics.reportAuthClientError(EventStreamConstants.Context.PasskeyLoginAttempt, data3.errorMsg, PasskeyConstants.GENERIC_CREDENTIAL_FETCH_LOGIN_V1)

						return
					end
				else
					if data3.credentialType == default.CredentialsTypes.password then
						local username = data3.response.username
						local password = data3.response.password

						p1.updateCValueText(username)
						p1.updatePasswordText(password)
						p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstants.Context.CMPasswordLogin, EventStreamConstants.Button.SelectPassword)
						p1.updateIsLoginInProgress(true)
						p1.handleLoginWithFormData(nil, nil, nil, true)

						return
					end

					if data3.credentialType == default.CredentialsTypes.FIDO2 then
						data3.response.id = Base64.ToUrlSafeBase64(data3.response.id)
						data3.response.rawId = Base64.ToUrlSafeBase64(data3.response.rawId)
						data3.response.response.signature = Base64.ToUrlSafeBase64(data3.response.response.signature)
						data3.response.response.userHandle = Base64.ToUrlSafeBase64(data3.response.response.userHandle)
						data3.response.response.authenticatorData = Base64.ToUrlSafeBase64(data3.response.response.authenticatorData)
						data3.response.response.clientDataJSON = Base64.ToUrlSafeBase64(data3.response.response.clientDataJSON)
						p1.handleLoginWithPasskey(data3.response, sessionId)
					end
				end
			end, function(p38) -- line: 610
				-- upvalues: Logger (copy)
				Logger:warning("Generic credential signing failed. Error: {}", p38)
			end)
		end
		function p1.handleLoginWithOtp(p39, p40) -- line: 615
			-- upvalues: GetFFlagEnableOtpEmailLogin (copy), p1 (copy)
			if not GetFFlagEnableOtpEmailLogin() and p1.props.isLoginWithOtpEnabled then
				return
			end

			p1.updateIsLoginInProgress(true)

			local setBackNavigationDisabled = p1.props.setBackNavigationDisabled

			p1.unfocusTextBoxes()
			setBackNavigationDisabled(true)

			local loginByOtp = p1.props.loginByOtp
			local v268 = p1.getSecurityQuestionsLoginWithOtpCallback()

			return loginByOtp(p1.props.networking, p1.state.otpSessionToken, p1.state.otpCode, v268, p39, p40):andThen(function(p41) -- line: 638
				-- upvalues: p1 (copy)
				p1.handleLoginResult(p41, nil)
			end, function(p42) -- line: 640
				-- upvalues: p1 (copy)
				p1.handleLoginError(p42, p1.state.otpSessionToken, p1.state.otpCode)

				return p42.errorKey
			end)
		end
		function p1.validateFormCredentials(p43) -- line: 646
			return #p43:gsub("%s+", "") > 0
		end
		function p1.handleLoginWithFormData(p44, p45, p46, p47) -- line: 650
			-- upvalues: p1 (copy), LoginErrorCodes (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), u172 (ref), AppStorageService (copy), LocalStorageKey (copy), EventStreamConstants (copy), FFlagEnablePWManagerLoginCheck (copy), HttpService (copy)
			if not p1.cvalueRef.current or not p1.passwordRef.current then
				return
			end

			local currentText = p1.cvalueRef.current.Text
			local currentText2 = p1.passwordRef.current.Text

			if game:GetFastFlag("LuaLoginManualCredentialValidation") and not p1.validateFormCredentials(currentText) then
				p1.handleLoginError({
					errorKey = "Authentication.Login.Response.IncorrectUsernamePassword",
					errorCode = LoginErrorCodes.IncorrectCValueOrPassword
				}, currentText, currentText2)
				p1.updateCValueText("")

				return
			end

			local setBackNavigationDisabled = p1.props.setBackNavigationDisabled

			p1.unfocusTextBoxes()
			setBackNavigationDisabled(true)

			local login = p1.props.login
			local handleCaptchaResult = p1.handleCaptchaResult
			local networking = p1.props.networking
			local v280 = p1.getSecurityQuestionsLoginWithFormDataCallback()
			local forceLoginByUsername = p1.state.forceLoginByUsername

			if FFlagEnableNavigateToLoginAfterLogoutAll then
				u172 = true
			end

			return login(networking, currentText, currentText2, handleCaptchaResult, p44, v280, p45, p46, forceLoginByUsername):andThen(function(p48) -- line: 693
				-- upvalues: AppStorageService (copy), LocalStorageKey (copy), currentText (copy), p47 (copy), p1 (copy), EventStreamConstants (copy), FFlagEnablePWManagerLoginCheck (copy), HttpService (copy), currentText2 (copy)
				AppStorageService:SetItem(LocalStorageKey.CredentialValue, currentText)
				AppStorageService:flush()

				if p47 then
					p1.props.authAnalytics.reportAuthFormInteraction(EventStreamConstants.Context.CMPasswordLogin, nil, "success")

					if FFlagEnablePWManagerLoginCheck and p1.passwordManagerUsageStore then
						p1.passwordManagerUsageStore.setLoggedinUsingSavedPassword(true)
					end
				end

				local v440 = if p47 then nil else HttpService:JSONEncode({
					cvalue = currentText,
					password = currentText2,
					authType = "login"
				})

				p1.handleLoginResult(p48, v440)
			end, function(p49) -- line: 718
				-- upvalues: p47 (copy), p1 (copy), EventStreamConstants (copy), currentText (copy), currentText2 (copy)
				if p47 then
					p1.props.authAnalytics.reportAuthFormInteraction(EventStreamConstants.Context.CMPasswordLogin, nil, "error")
				end

				p1.handleLoginError(p49, currentText, currentText2)
			end)
		end
		function p1.renderSecurityQuestions(_, _, p52, p53) -- line: 731
			-- upvalues: p1 (copy), Type (copy)
			p1.props.renderChallenge({
				challengeType = Type.SecurityQuestions,
				challengeParameters = {
					sessionId = p53.sessionId,
					userId = p53.userId,
					onChallengeCompleted = function(p54) --[[ onChallengeCompleted ]] -- line: 737
						-- upvalues: p53 (copy), p52 (copy)
						local t3 = {
							sessionId = p53.sessionId,
							redemptionToken = p54.redemptionToken
						}

						p52(t3)
					end,
					onChallengeInvalidated = function(p55) --[[ onChallengeInvalidated ]] -- line: 744
						-- upvalues: p1 (copy)
						p1.updateIsLoginInProgress(false)

						if p1.isMounted then
							if p55.errorCode ~= 0 then
								p1:setState({
									errorKey = false,
									localizedErrorMessage = p55.errorMessage
								})

								return
							end

							p1:setState({
								errorKey = "Authentication.Login.Response.SomethingWentWrong"
							})
						end
					end
				},
				onChallengeAbandoned = function() --[[ onChallengeAbandoned ]] -- line: 762
					-- upvalues: p1 (copy)
					p1.updateIsLoginInProgress(false)
				end,
				onChallengeLoadFailed = function() --[[ onChallengeLoadFailed ]] -- line: 765
					-- upvalues: p1 (copy)
					p1.updateIsLoginInProgress(false)

					if p1.isMounted then
						p1:setState({
							errorKey = "Authentication.Login.Response.SomethingWentWrong"
						})
					end
				end,
				forceWebViewVisible = true
			})
		end
		function p1.renderTwoStepChallenge(p56, p57) -- line: 778
			-- upvalues: p1 (copy), GetFFlagLuaAppWaitBeforeTwoStepRenderDev (copy), GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev (copy), v146 (copy), EventStreamConstants (copy), Type (copy), ActionType (copy), GetFFlagEnable2SVRecovery (copy), TwoStepRequests (copy), GetFFlagAlwaysSaveCredentialsAfter2Sv (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), MemStorageKeys (copy), GetFFlagEnableCredentialsProtocolPasswords (copy), FFlagPasswordManagerAwaitEnabled (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), FFlagEnableLuaAccountSwitch (copy), v101 (copy), HttpService (copy), TwoStepErrorCodes (copy), getTwoStepLoginErrorKey (copy), AccountLinkingAlertType (copy)
			local launchApp = p1.props.launchApp
			local networking = p1.props.networking
			local appPolicy = p1.props.appPolicy
			local analytics = p1.props.analytics
			local omniRecommendationsRequest = p1.props.omniRecommendationsRequest
			local ticket = p56.twoStepVerificationData.ticket
			local id = p56.user.id
			local handleLoginCompletionWithAccountSwitching = p1.props.handleLoginCompletionWithAccountSwitching
			local clearApp = p1.props.clearApp

			if GetFFlagLuaAppWaitBeforeTwoStepRenderDev() then
				wait(GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev())
			end

			if v146 then
				p1.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.TwoStepLoginChallengeRenderInitiated, ticket)
			end

			p1.props.renderChallenge({
				challengeType = Type.TwoStepVerification,
				challengeParameters = {
					actionType = ActionType.Login,
					challengeId = ticket,
					userId = id,
					allowRememberDevice = true,
					clientSupports2svRecovery = not not GetFFlagEnable2SVRecovery(),
					onChallengeCompleted = function(p58) --[[ onChallengeCompleted ]] -- line: 808
						-- upvalues: v146 (copy), p1 (copy), EventStreamConstants (copy), ticket (copy), TwoStepRequests (copy), networking (copy), id (copy), GetFFlagAlwaysSaveCredentialsAfter2Sv (copy), p57 (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), MemStorageKeys (copy), GetFFlagEnableCredentialsProtocolPasswords (copy), FFlagPasswordManagerAwaitEnabled (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), FFlagEnableLuaAccountSwitch (copy), handleLoginCompletionWithAccountSwitching (copy), omniRecommendationsRequest (copy), analytics (copy), appPolicy (copy), clearApp (copy), launchApp (copy), v101 (copy), HttpService (copy), TwoStepErrorCodes (copy), getTwoStepLoginErrorKey (copy), AccountLinkingAlertType (copy)
						if v146 then
							p1.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.TwoStepLoginChallengeCompleted, ticket)
						end

						TwoStepRequests.login(networking, id, ticket, p58.verificationToken, p58.rememberDevice):andThen(function(p59) -- line: 816
							-- upvalues: GetFFlagAlwaysSaveCredentialsAfter2Sv (copy), p57 (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), MemStorageKeys (copy), GetFFlagEnableCredentialsProtocolPasswords (copy), p1 (copy), FFlagPasswordManagerAwaitEnabled (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), FFlagEnableLuaAccountSwitch (copy), handleLoginCompletionWithAccountSwitching (copy), networking (copy), omniRecommendationsRequest (copy), analytics (copy), appPolicy (copy), clearApp (copy), launchApp (copy)
							if GetFFlagAlwaysSaveCredentialsAfter2Sv() and p57 then
								if not FFlagDisableMemStorageServicePasswordEvent then
									MemStorageService:Fire(MemStorageKeys.AuthenticatedCredentials, p57)
								end

								if GetFFlagEnableCredentialsProtocolPasswords() and p1.state.isCredentialsProtocolRegisterPasswordAvailable then
									if FFlagPasswordManagerAwaitEnabled then
										p1.credentialsProtocolRegisterPassword(p57):await()
									else
										p1.credentialsProtocolRegisterPassword(p57)
									end
								end
							end

							reportEphemeralCounter(AppLoginCounterNames.Success, 1)

							if FFlagEnableLuaAccountSwitch then
								handleLoginCompletionWithAccountSwitching(networking, omniRecommendationsRequest, analytics, appPolicy, p59.responseBody.accountBlob, clearApp, launchApp)

								return
							end

							launchApp(networking, omniRecommendationsRequest, analytics, appPolicy)
						end, function(p60) -- line: 852
							-- upvalues: FFlagDisableMemStorageServicePasswordEvent (copy), GetFFlagAlwaysSaveCredentialsAfter2Sv (copy), p57 (copy), MemStorageService (copy), MemStorageKeys (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v101 (copy), HttpService (copy), TwoStepErrorCodes (copy), getTwoStepLoginErrorKey (copy), p1 (copy), AccountLinkingAlertType (copy)
							if not FFlagDisableMemStorageServicePasswordEvent and (not GetFFlagAlwaysSaveCredentialsAfter2Sv() and p57) then
								MemStorageService:Fire(MemStorageKeys.AuthenticatedCredentials, p57)
							end

							reportEphemeralCounter(AppLoginCounterNames.Failure, 1)

							local s1 = "Authentication.Login.Response.SomethingWentWrong"

							if v101 then
								local _, result = pcall(function() -- line: 867
									-- upvalues: HttpService (copy), p60 (copy)
									return HttpService:JSONDecode(p60.Body).errors[1].code
								end)

								if result == TwoStepErrorCodes.IllegalChildAccountLinking then
									reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
								else
									reportEphemeralCounter(AppLoginCounterNames.FailureUnknownError, 1)
								end

								s1 = getTwoStepLoginErrorKey(result)
							else
								reportEphemeralCounter(AppLoginCounterNames.FailureUnknownError, 1)
							end

							p1.updateIsLoginInProgress(false)

							if p1.isMounted then
								p1:setState({
									errorKey = s1
								})
							end

							if p60 and p60.Body then
								local data = HttpService:JSONDecode(p60.Body)
								local v474 = data and (data.errors and (data.errors[1] and data.errors[1].code))
								local v475 = data and (data.errors and (data.errors[1] and data.errors[1].userFacingMessage))

								if v474 == TwoStepErrorCodes.AccountLinkingRequired then
									p1.props.showAccountLinkingAlert(AccountLinkingAlertType.IncompatibleAccounts, v475)
								end

								if v474 == TwoStepErrorCodes.AccountLinkingFailed then
									p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInConnectionFailure)
								end
							end
						end)
					end,
					onChallengeInvalidated = function(p61) --[[ onChallengeInvalidated ]] -- line: 910
						-- upvalues: v146 (copy), p1 (copy), EventStreamConstants (copy), ticket (copy)
						if v146 then
							p1.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.TwoStepLoginChallengeInvalidated, ticket)
						end

						p1.updateIsLoginInProgress(false)

						if p1.isMounted then
							if p61.errorCode ~= 0 then
								p1:setState({
									errorKey = false,
									localizedErrorMessage = p61.errorMessage
								})

								return
							end

							p1:setState({
								errorKey = "Authentication.Login.Response.SomethingWentWrong"
							})
						end
					end
				},
				onChallengeAbandoned = function() --[[ onChallengeAbandoned ]] -- line: 934
					-- upvalues: v146 (copy), p1 (copy), EventStreamConstants (copy), ticket (copy)
					if v146 then
						p1.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.TwoStepLoginChallengeAbandoned, ticket)
					end

					p1.updateIsLoginInProgress(false)
				end,
				onChallengeLoadFailed = function() --[[ onChallengeLoadFailed ]] -- line: 943
					-- upvalues: v146 (copy), p1 (copy), EventStreamConstants (copy), ticket (copy)
					if v146 then
						p1.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.TwoStepLoginChallengeLoadFailed, ticket)
					end

					p1.updateIsLoginInProgress(false)

					if p1.isMounted then
						p1:setState({
							errorKey = "Authentication.Login.Response.SomethingWentWrong"
						})
					end
				end,
				forceWebViewVisible = true
			})
		end
		function p1.handleMultipleUsersPerCredentialError(p62) -- line: 963
			-- upvalues: p1 (copy), EventStreamConstants (copy), isStringEmail (copy), isStringPhone (copy), v116 (copy), GetFFlagShouldEnableOtpDisambiguationPeekViewFix (copy), GetFFlagShouldUsePeekViewForLoginDisambiguation (copy)
			local s2 = ""

			if p1.state.isLoginByOtp then
				s2 = EventStreamConstants.Context.DisambiguationOTP
			elseif isStringEmail(p1.props.cvalue) then
				s2 = EventStreamConstants.Context.DisambiguationEmail
			elseif isStringPhone(p1.props.cvalue) then
				s2 = EventStreamConstants.Context.DisambiguationPhone
			end

			local t4 = {
				origin = EventStreamConstants.Context.Login,
				context = s2,
				users = p62,
				onAccountSelection = function(p63) --[[ onAccountSelection ]] -- line: 977
					-- upvalues: p1 (copy), v116 (copy)
					if p1.state.isLoginByOtp then
						if v116 then
							p1.handleLoginWithOtp(nil, p63):await()

							return
						end

						p1.handleLoginWithOtp(nil, p63)

						return
					end

					if v116 then
						p1.handleLoginWithFormData(nil, nil, p63):await()

						return
					end

					p1.handleLoginWithFormData(nil, nil, p63)
				end,
				onAccountSelectionAbandoned = function() --[[ onAccountSelectionAbandoned ]] -- line: 992
					-- upvalues: p1 (copy)
					p1.updateIsLoginInProgress(false)
					p1.state.otpSessionToken = ""
					p1.state.otpCode = ""
					p1.state.isLoginByOtp = false
					p1.props.closeCentralOverlay()
				end,
				titleTextKey = "Authentication.Login.Label.AccountSelectorTitle",
				helpTextKey = "Authentication.Login.Description.AccountSelectorHelp",
				screenSize = p1.props.screenSize
			}

			if GetFFlagShouldEnableOtpDisambiguationPeekViewFix() and GetFFlagShouldUsePeekViewForLoginDisambiguation() then
				p1.props.closeCentralOverlay()
			end

			p1.props.openAccountSelector(t4)
		end
		function p1.performKeystoreOperations(p64, p65) -- line: 1011
			-- upvalues: Promise (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), p1 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), DeleteAllCredentialsFromKeystore (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy)
			return Promise.new(function(p66, p67) -- line: 1015
				-- upvalues: FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), p65 (ref), GetFFlagRemoveKeystoreIxpLogic (copy), p1 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), p64 (copy), DeleteAllCredentialsFromKeystore (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), Promise (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy)
				if (FFlagEnableIosKeychainLoginLua or GetFFlagKeystoreAutoLoginAvailable()) == false or p65 == nil then
					p66()

					return
				end

				local v450 = not not GetFFlagRemoveKeystoreIxpLogic() or (p1.props.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2())
				local json = HttpService:JSONEncode({
					server = ContentProvider.BaseUrl
				})

				p65 = HttpService:JSONDecode(p65)
				GetUserByUsername(p64, p65.cvalue)():andThen(function(p68) -- line: 1037
					-- upvalues: p67 (copy), GetFFlagKeystoreAutoLoginAvailable (copy), DeleteAllCredentialsFromKeystore (copy), json (copy), default (copy), KeystoreConstants (copy)
					if not p68 or not p68.id then
						return p67("Invalid usernameInfo")
					end

					if GetFFlagKeystoreAutoLoginAvailable() then
						return DeleteAllCredentialsFromKeystore(json):andThen(function() -- line: 1043
							-- upvalues: p68 (copy)
							return p68
						end)
					end

					return default:deleteAllCredentialsFromiOSKeychain(default.CredentialsTypes.iosKeychainPassword, json, KeystoreConstants.KeystoreTimeout):andThen(function() -- line: 1051
						-- upvalues: p68 (copy)
						return p68
					end)
				end):andThen(function(p69) -- line: 1056
					-- upvalues: GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), HttpService (copy), ContentProvider (copy), p65 (ref), v450 (copy), KeystoreConstants (copy), GetFFlagKeystoreAutoLoginAvailable (copy), default (copy), Promise (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy)
					local json2

					if GetFFlagRemoveKeystoreIxpLogic() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(p69.id)))

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
								customFields = {
									result = "attempt"
								}
							}, 1)
						end

						json2 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(p65.cvalue),
							userId = tostring(p69.id),
							password = tostring(p65.password)
						})
					else
						local Experiment

						if v450 == true then
							Experiment = KeystoreConstants.Experiment
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsExperimentGroup, (tostring(p69.id)))
						else
							Experiment = KeystoreConstants.Control
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsControlGroup, (tostring(p69.id)))
						end

						json2 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(p65.cvalue),
							userId = tostring(p69.id),
							password = tostring(p65.password),
							experimentGroup = tostring(Experiment)
						})
					end

					if GetFFlagKeystoreAutoLoginAvailable() then
						local v480 = default:isAvailable(default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(p70) -- line: 1107
							-- upvalues: default (copy), json2 (ref), KeystoreConstants (copy), Promise (copy)
							if p70 and (p70.keystore and p70.keystore.isAvailable) then
								return default:registerCredentials(default.CredentialsTypes.keystore, json2, KeystoreConstants.KeystoreTimeout)
							end

							return Promise.resolve(nil)
						end)

						if GetFFlagCheckIsAvailableForKeystoreOperations() then
							return v480
						end

						return default:registerCredentials(default.CredentialsTypes.keystore, json2, KeystoreConstants.KeystoreTimeout)
					end

					return default:registerCredentials(default.CredentialsTypes.iosKeychainPassword, json2, KeystoreConstants.KeystoreTimeout)
				end):andThen(function(_) -- line: 1139
					-- upvalues: p66 (copy)
					p66()
				end):catch(function(p72) -- line: 1142
					-- upvalues: GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), p67 (copy)
					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
							customFields = {
								result = "error"
							}
						}, 1)
					end

					p67(p72)
				end)
			end)
		end
		function p1.handleLoginResult(p73, p74) -- line: 1155
			-- upvalues: p1 (copy), LoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), MemStorageKeys (copy), GetFFlagEnableCredentialsProtocolPasswords (copy), FFlagPasswordManagerAwaitEnabled (copy), FFlagEnableLuaAccountSwitch (copy), SystemThemeFeature (copy), GetFFlagEnableLoginAccountSelector (copy)
			p1.props.setBackNavigationDisabled(false)

			local setLoginResult = p1.props.setLoginResult
			local launchApp = p1.props.launchApp
			local networking = p1.props.networking
			local appPolicy = p1.props.appPolicy
			local analytics = p1.props.analytics
			local omniRecommendationsRequest = p1.props.omniRecommendationsRequest

			if p1.passwordRef.current then
				p1.passwordRef.current.Text = ""
			end

			local clearApp = p1.props.clearApp
			local handleLoginCompletionWithAccountSwitching = p1.props.handleLoginCompletionWithAccountSwitching

			p1.performKeystoreOperations(networking, p74):finally(function() -- line: 1173
				-- upvalues: LoginResult (copy), p73 (copy), setLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), p1 (copy), p74 (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), MemStorageKeys (copy), GetFFlagEnableCredentialsProtocolPasswords (copy), FFlagPasswordManagerAwaitEnabled (copy), FFlagEnableLuaAccountSwitch (copy), handleLoginCompletionWithAccountSwitching (copy), networking (copy), omniRecommendationsRequest (copy), analytics (copy), appPolicy (copy), clearApp (copy), launchApp (copy), SystemThemeFeature (copy), GetFFlagEnableLoginAccountSelector (copy)
				if LoginResult.hasTwoStepData(p73) then
					setLoginResult(p73)
					reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function() -- line: 1180
						-- upvalues: p1 (copy), p73 (copy), p74 (copy)
						p1.renderTwoStepChallenge(p73, p74)
					end)
				else
					if p74 then
						if not FFlagDisableMemStorageServicePasswordEvent then
							MemStorageService:Fire(MemStorageKeys.AuthenticatedCredentials, p74)
						end

						if GetFFlagEnableCredentialsProtocolPasswords() and p1.state.isCredentialsProtocolRegisterPasswordAvailable then
							if FFlagPasswordManagerAwaitEnabled then
								p1.credentialsProtocolRegisterPassword(p74):await()
							else
								p1.credentialsProtocolRegisterPassword(p74)
							end
						end
					end

					reportEphemeralCounter(AppLoginCounterNames.Success, 1)

					if FFlagEnableLuaAccountSwitch then
						handleLoginCompletionWithAccountSwitching(networking, omniRecommendationsRequest, analytics, appPolicy, p73.accountBlob, clearApp, launchApp)
					else
						launchApp(networking, omniRecommendationsRequest, analytics, appPolicy)
						SystemThemeFeature.ClearThemeOverride()
					end
				end

				if GetFFlagEnableLoginAccountSelector() then
					p1.props.closeCentralOverlay()
				end
			end)
		end
		function p1.credentialsProtocolRegisterPassword(p75) -- line: 1228
			-- upvalues: HttpService (copy), default (copy), Constants2 (copy), v117 (copy), FFlagEnablePWManagerLoginCheck (copy), p1 (copy), EventStreamConstants (copy), Logger (copy)
			local data = HttpService:JSONDecode(p75)

			if data.cvalue == nil or data.password == nil then
				return
			end

			local t5 = {
				username = data.cvalue,
				password = data.password
			}
			local json = HttpService:JSONEncode(t5)

			return default:registerCredentials(default.CredentialsTypes.password, json, Constants2.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(p76) -- line: 1245
				-- upvalues: v117 (copy), HttpService (copy), FFlagEnablePWManagerLoginCheck (copy), p1 (copy), EventStreamConstants (copy), Logger (copy)
				if v117 and p76 then
					local data4 = HttpService:JSONDecode(p76)

					if data4.errorCode == nil then
						if FFlagEnablePWManagerLoginCheck and p1.passwordManagerUsageStore then
							p1.passwordManagerUsageStore.setSavedPasswordAfterLogin(true)
						end

						p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstants.Context.CMPasswordLogin, EventStreamConstants.Button.SavePassword)
						Logger:info("Successfully registered password.")

						return
					end

					Logger:warning("Error registering password: " .. tostring(data4.errorMsg))

					return
				end

				if p76.errorCode == nil then
					p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstants.Context.CMPasswordLogin, EventStreamConstants.Button.SavePassword)
					Logger:info("Successfully registered password.")

					return
				end

				Logger:warning("Error registering password: " .. tostring(p76.errorMsg))
			end, function(p77) -- line: 1273
				-- upvalues: Logger (copy)
				Logger:warning("Error registering password: " .. tostring(p77))
			end)
		end
		function p1.logoutAllLoggedInUsersCallback() -- line: 1279
			-- upvalues: p1 (copy), AppStorageUtilities (copy), User (copy), LogoutAllLoggedInUsers (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), LoginResult (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageService (copy), LocalStorageKey (copy), AccountSwitcherConstants (copy), GuiService (copy)
			local networking = p1.props.networking
			local v318 = AppStorageUtilities.getAccountBlob()
			local v319 = User.fromLocalStorage().userId ~= -1

			p1:setState({
				errorKey = false,
				loginButtonDisabled = true,
				isLoginInProgress = false
			})
			LogoutAllLoggedInUsers(networking, v318):await()

			local v320 = false

			if FFlagEnableNavigateToLoginAfterLogoutAll and p1.pendingLoginRetryCredentials then
				local pendingLoginRetryCredentials = p1.pendingLoginRetryCredentials

				p1.pendingLoginRetryCredentials = nil

				if pendingLoginRetryCredentials.isPasswordLogin then
					local ok, result = pcall(function() -- line: 1299
						-- upvalues: p1 (copy), networking (copy), pendingLoginRetryCredentials (copy)
						return p1.props.login(networking, pendingLoginRetryCredentials.cvalue, pendingLoginRetryCredentials.password):expect()
					end)

					if ok and result and not LoginResult.hasTwoStepData(result) then
						if FFlagEnableLuaAccountSwitch then
							p1.props.handleLoginCompletionWithAccountSwitching(networking, p1.props.omniRecommendationsRequest, p1.props.analytics, p1.props.appPolicy, result.accountBlob, p1.props.clearApp, p1.props.launchApp)

							return
						end

						p1.props.launchApp(networking, p1.props.omniRecommendationsRequest, p1.props.analytics, p1.props.appPolicy)

						return
					end
				elseif type(pendingLoginRetryCredentials.cvalue) == "table" then
					v320 = true
				end
			end

			if v319 == true then
				p1.props.resetAppState()
				AppStorageService:SetItem(LocalStorageKey.CredentialValue, "")
				AppStorageService:flush()

				if FFlagEnableNavigateToLoginAfterLogoutAll then
					local v324 = if not v320 then AccountSwitcherConstants.AccountSwitcherPendingLoginAfterLogoutAll else AccountSwitcherConstants.AccountSwitcherPendingPasskeyLoginV1AfterLogoutAll

					AppStorageUtilities.setAccountSwitchStatus(v324)
					AppStorageUtilities.flush()
				end

				p1.props.logoutWithoutShowConfirmation(networking, GuiService)
			end

			p1:setState({
				loginButtonDisabled = false
			})
			p1.props.closeCentralOverlay()
		end
		function p1.handleLoginError(p78, p79, p80) -- line: 1351
			-- upvalues: FFlagEnableNavigateToLoginAfterLogoutAll (copy), u172 (ref), p1 (copy), GetFFlagEnableLoginAccountSelector (copy), LoginErrorCodes (copy), GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), StatusCodes (copy), FFlagEnableLuaAccountSwitch (copy), AppStorageUtilities (copy), Constants (copy), isStringEmail (copy), CredentialType (copy), GetFFlagEnableVNGNewAppAvailableModal (copy), GetFStringVNGDownloadNowUrl (copy), AccountLinkingAlertType (copy)
			local v328 = false

			if FFlagEnableNavigateToLoginAfterLogoutAll then
				v328 = u172
				u172 = false
			end

			local v329 = if not v328 then (not p1.cvalueRef or not p1.cvalueRef.current) and "" or p1.cvalueRef.current.Text or "" else type(p79) ~= "string" and "" or p79

			p1.props.setBackNavigationDisabled(false)

			local forceLoginByUsername = p1.state.forceLoginByUsername
			local v331 = p1.errorHandlingInfoList[p78.errorCode]

			if v331 then
				forceLoginByUsername = v331.forceLoginByUsername or forceLoginByUsername
			end

			local v332 = false
			local v333 = GetFFlagEnableLoginAccountSelector() and (p78.errorCode == LoginErrorCodes.MultipleUsersPerCredential and not p1.props.appPolicy.getAccountDisambiguationDisabled())
			local v334 = p1.props.appPolicy.getLinkedAuthEndpointsEnabled() and (p78.errorCode == LoginErrorCodes.AccountLinkingRequired or p78.errorCode == LoginErrorCodes.AccountLinkingFailed)
			local v335 = GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and p78.errorCode == LoginErrorCodes.SecurityQuestions

			if v333 or v335 or p78.errorCode == LoginErrorCodes.Captcha then
				v332 = true
			end

			reportEphemeralCounter(AppLoginCounterNames.Failure, 1)

			if p78.errorCode == LoginErrorCodes.Captcha then
				reportEphemeralCounter(AppLoginCounterNames.FailureCaptcha, 1)
			elseif p78.errorCode == LoginErrorCodes.IncorrectCValueOrPassword then
				reportEphemeralCounter(AppLoginCounterNames.FailureCredentials, 1)
			elseif p78.errorCode == LoginErrorCodes.AccountLocked then
				reportEphemeralCounter(AppLoginCounterNames.FailurePasswordReset, 1)
			elseif p78.errorCode == LoginErrorCodes.CTypeNotSupported then
				reportEphemeralCounter(AppLoginCounterNames.FailureBadRequest, 1)
			elseif p78.errorCode == LoginErrorCodes.CValueAndPasswordRequired then
				reportEphemeralCounter(AppLoginCounterNames.FailureBadRequest, 1)
			elseif v335 then
				reportEphemeralCounter(AppLoginCounterNames.FailureSecurityQuestions, 1)
			elseif p78.errorCode == LoginErrorCodes.MultipleUsersPerCredential then
				reportEphemeralCounter(AppLoginCounterNames.FailureMultipleUsersPerCredential, 1)
			elseif p78.HttpError == Enum.HttpError.OK and p78.StatusCode == StatusCodes.TOO_MANY_REQUESTS then
				reportEphemeralCounter(AppLoginCounterNames.FailureThrottled, 1)
			elseif p78.HttpError == Enum.HttpError.OK and p78.StatusCode == StatusCodes.REQUEST_TIMEOUT then
				reportEphemeralCounter(AppLoginCounterNames.FailureTimeout, 1)
			elseif p78.HttpError == Enum.HttpError.OK and p78.StatusCode == StatusCodes.BAD_REQUEST then
				reportEphemeralCounter(AppLoginCounterNames.FailureBadRequest, 1)
			elseif p78.HttpError == Enum.HttpError.OK and p78.StatusCode == StatusCodes.NOT_FOUND then
				reportEphemeralCounter(AppLoginCounterNames.FailureNotFound, 1)
			elseif p78.HttpError == Enum.HttpError.OK and p78.StatusCode == StatusCodes.INTERNAL_SERVER_ERROR then
				reportEphemeralCounter(AppLoginCounterNames.FailureInternalServerError, 1)
			else
				reportEphemeralCounter(AppLoginCounterNames.FailureUnknownError, 1)
			end

			if FFlagEnableLuaAccountSwitch == true and p78.errorCode == LoginErrorCodes.EmptyAccountSwitchBlobRequired then
				p1:setState({
					errorKey = false
				})

				if FFlagEnableNavigateToLoginAfterLogoutAll then
					p1.pendingLoginRetryCredentials = {
						cvalue = p79,
						password = p80,
						isPasswordLogin = v328
					}
					AppStorageUtilities.setAccountSwitchTargetUsername(v329)
				end

				p1.props.openAccountSwitchingErrorOverlay(not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Header.LogoutAllAccounts" or "Authentication.AccountSwitch.Header.SignOutOtherAccounts", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Description.LogoutConfirmation" or "Authentication.AccountSwitch.Description.ContinueSignOutOthers", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Action.LogoutAllAccounts" or "Authentication.AccountSwitch.Action.Continue", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, Constants.Auth.AccountSwitcherLoginEmptyBlobRequiredError, p79 or nil)
			end

			if FFlagEnableLuaAccountSwitch == true and p78.errorCode == LoginErrorCodes.ParentEmptyAccountSwitchBlobRequired then
				p1:setState({
					errorKey = false
				})

				if FFlagEnableNavigateToLoginAfterLogoutAll then
					p1.pendingLoginRetryCredentials = {
						cvalue = p79,
						password = p80,
						isPasswordLogin = v328
					}
					AppStorageUtilities.setAccountSwitchTargetUsername(v329)
				end

				p1.props.openAccountSwitchingErrorOverlay(not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Header.LogoutAllAccounts" or "Authentication.AccountSwitch.Header.SignOutOtherAccounts", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Description.ParentLogoutConfirmation" or "Authentication.AccountSwitch.Description.ContinueSignOutOthers", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Action.LogoutAllAccounts" or "Authentication.AccountSwitch.Action.Continue", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, Constants.Auth.AccountSwitcherParentLoginEmptyBlobRequiredError, p79 or nil)
			end

			if p78.errorCode == LoginErrorCodes.AccountLocked then
				p1.props.openPasswordResetPrompt()
			end

			if p78.errorCode == LoginErrorCodes.AccountNotVerified and isStringEmail(p79) and p1.canVerifyCredentials(CredentialType.Email, p79, p80) then
				p1.props.openEmailVerificationPrompt(p79, p80, p1.closeVerificationEmailModal)
			end

			if GetFFlagEnableVNGNewAppAvailableModal() and p78.errorCode == LoginErrorCodes.GlobalAppAccessDeniedVNG and p1.isMounted then
				p1.props.openNewAppAvailableModal(function() -- line: 1497
					-- upvalues: GetFStringVNGDownloadNowUrl (copy), p1 (copy)
					local v455 = GetFStringVNGDownloadNowUrl()

					p1.props.linking:openURL(v455)
				end)
			end

			if GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin() and p78.errorCode == LoginErrorCodes.SecurityQuestions and p78.securityQuestionsData and p78.securityQuestionsCallback then
				task.spawn(function() -- line: 1506
					-- upvalues: p1 (copy), p79 (copy), p80 (copy), p78 (copy)
					if p1.isMounted then
						p1.renderSecurityQuestions(p79, p80, p78.securityQuestionsCallback, p78.securityQuestionsData)
					end
				end)
			end

			if v333 then
				if p78.usersData then
					p1.handleMultipleUsersPerCredentialError(p78.usersData)
				end
			elseif p78.errorCode == LoginErrorCodes.MultipleUsersPerCredential then
				p78.errorKey = "Authentication.Login.Response.MoreThanOneUsername"
			end

			if p78.errorCode == LoginErrorCodes.PlatformNotSupported then
				p78.errorKey = "Authentication.Login.Error.PlatformAccountConnectionFailure"
			end

			if v334 then
				if p78.errorCode == LoginErrorCodes.AccountLinkingRequired then
					p1.props.showAccountLinkingAlert(AccountLinkingAlertType.IncompatibleAccounts, p78.userFacingMessage)
				elseif p78.errorCode == LoginErrorCodes.AccountLinkingFailed then
					p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInConnectionFailure)
				end
			end

			spawn(function() -- line: 1539
				-- upvalues: p1 (copy), p78 (copy), forceLoginByUsername (ref)
				if p1.isMounted then
					p1:setState({
						errorKey = p78.errorKey,
						errorCode = p78.errorCode,
						forceLoginByUsername = forceLoginByUsername
					})
				end
			end)
			p1.updateIsLoginInProgress(v332)
		end
		function p1.onLoginButtonActivated() -- line: 1552
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			if p1.state.loginButtonDisabled then
				return
			end

			if p1.state.isLoginInProgress then
				return
			end

			p1.updateIsLoginInProgress(true)
			p1.props.authAnalytics.reportLogInButtonClicked(EventStreamConstants.Context.LoginScreen)
			p1.handleLoginWithFormData()
		end
		function p1.onForgetButtonActivated() -- line: 1566
			-- upvalues: p1 (copy), EventStreamConstants (copy), GetFFlagEnableLuafiedRecoveryFlow (copy), enrolledInLuafiedRecoveryExperiment (copy), AppPage (copy), ContentProvider (copy), TransitionAnimation (copy)
			if p1.state.isLoginInProgress then
				return
			end

			p1.unfocusTextBoxes()
			p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstants.Context.LoginForm, EventStreamConstants.Button.ForgotPassword)
			p1.props.authAnalytics.reportForgotPasswordButtonClicked(EventStreamConstants.Context.LoginScreen)

			if GetFFlagEnableLuafiedRecoveryFlow() and enrolledInLuafiedRecoveryExperiment() then
				p1.props.navigateToPage({
					name = AppPage.AccountRecovery,
					extraProps = {
						identifier = p1.cvalueRef and (not not p1.cvalueRef.current and p1.cvalueRef.current.Text) or (p1.cvalueText and p1.cvalueText:getValue() or ""),
						recoverPassword = true
					}
				})

				return
			end

			if p1.props.appPolicy.shouldUseExternalBrowserForDisclaimerLinks() then
				p1.props.linking:openURL(ContentProvider.BaseUrl .. "login/forgot-password-or-username")

				return
			end

			p1.props.navigateToPage({
				name = AppPage.GenericWebPage,
				detail = ContentProvider.BaseUrl .. "login/forgot-password-or-username",
				extraProps = {
					title = "",
					transitionAnimation = TransitionAnimation.SlideInFromRight
				}
			})
		end
		function p1.onCrossDeviceLoginActivated() -- line: 1604
			-- upvalues: p1 (copy), EventStreamConstants (copy), GetFFlagReportCrossAppLoginAttempt (copy), RbxAnalyticsService (copy)
			if p1.state.isLoginInProgress then
				return
			end

			p1.unfocusTextBoxes()
			p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstants.Context.LoginForm, EventStreamConstants.Button.QuickLogin)
			p1.props.authAnalytics.reportButtonClicked(EventStreamConstants.Context.Login, EventStreamConstants.Button.LoginOtherDevice)

			if p1.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton() then
				if GetFFlagReportCrossAppLoginAttempt() then
					RbxAnalyticsService:ReportCounter("CrossAppLoginAttempt", 1)
				end

				p1.props.openCrossAppLoginPrompt(p1.handleLoginWithCode)

				return
			end

			p1.props.openCrossDeviceLoginPrompt(p1.handleLoginWithCode)
		end
		function p1.topButtonActivatedTracking() -- line: 1629
			-- upvalues: FFlagEnableLuaAccountSwitch (copy), p1 (copy), EventStreamConstants (copy)
			if FFlagEnableLuaAccountSwitch == true and p1.isAlreadyAuthenticated == true then
				resetDefaultTheme()
			end

			p1.props.authAnalytics.reportDismissCornerXButtonClicked(EventStreamConstants.Context.LoginScreen)
		end
		function p1.onEmailOtpLoginAbandoned() -- line: 1636
			-- upvalues: p1 (copy)
			p1.state.isLoginByOtp = false
		end
		function p1.onEmailOtpLoginCompleted(p81, p82) -- line: 1640
			-- upvalues: p1 (copy)
			p1.state.otpSessionToken = p81
			p1.state.otpCode = p82

			return p1.handleLoginWithOtp(nil, nil)
		end
		function p1.onEmailOtpLoginActivated() -- line: 1646
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			if p1.state.isLoginInProgress then
				return
			end

			p1.unfocusTextBoxes()

			local t6 = {
				origin = "login",
				codeLength = 6,
				enterEmailTitleKey = "Authentication.Login.Label.GetOneTimeCode",
				enterEmailDescriptionKey = "Authentication.Login.Description.GetOneTimeCodeHelp",
				enterCodeTitleKey = "Authentication.Login.Label.EnterOneTimeCode",
				enterCodeDescriptionKey = "Authentication.Login.Description.EnterOneTimeCodeHelpV2",
				onSubmitCode = p1.onEmailOtpLoginCompleted,
				onModalAbandoned = p1.onEmailOtpLoginAbandoned,
				screenSize = p1.props.screenSize
			}

			p1.props.openEmailOtp(t6)
			p1.state.isLoginByOtp = true
			p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstants.Context.LoginForm, EventStreamConstants.Button.EmailOtp)
			p1.props.authAnalytics.reportButtonClicked(EventStreamConstants.Context.Login, EventStreamConstants.Button.OneTimePasscode)
		end
		function p1.closeVerificationEmailModal(p83) -- line: 1674
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1.updateCValueText(p83)

				if p83 ~= "" and p1.passwordRef.current then
					p1.passwordRef.current:CaptureFocus()
				end

				p1:setState({
					errorCode = -1,
					errorKey = "",
					forceLoginByUsername = false
				})
			end
		end

		p1.events = {}
		p1.props.authAnalytics.reportScreenLoaded(EventStreamConstants.Context.LoginScreen)
	end
end

function v163.didMount(p84) -- line: 1692
	-- upvalues: EventStreamConstants (copy), GetFFlagAuthIntentLoggingAtLoginEnabled (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), FFlagEnableLuaAccountSwitch (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), FFlagEnableVNGDUARSignupCompliance (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), v145 (copy), UiMode (copy), UserInputService (copy), v131 (copy), GuiService (copy), AppPage (copy), HttpService (copy), GetFFlagLuaAppEnableDesktopDualLoginABTest (copy), GetIXPLayerParameters (copy), GetFFlagEnableCredentialsProtocolPasswords (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), FFlagEnableCredentialsV2InterfaceDetectionFix (copy), Logger (copy), LocalizationService (copy), TelemetryConfigs (copy)
	p84.isMounted = true
	p84.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.LoginForm)

	if GetFFlagAuthIntentLoggingAtLoginEnabled() then
		local v180 = if not FFlagEnableAuthDeepLinkReceiver then LinkingProtocol:getLastLuaURL() else PreAuthDeepLinkUrlStore.getUrl()

		p84.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.LoginScreen, v180)
	end

	if FFlagEnableLuaAccountSwitch == true and p84.isAlreadyAuthenticated == true then
		MemStorageService:Fire(MemStorageKeys.ThemeUpdate, "dark")
	end

	SystemThemeFeature.SetDarkThemeOverride()

	if FFlagEnableVNGDUARSignupCompliance and p84.props.appPolicy.getLoginUsernameOnly() then
		p84:setState({
			forceLoginByUsername = true
		})
	end

	if FFlagEnableIosKeychainLoginLua or GetFFlagKeystoreAutoLoginAvailable() then
		if p84.props.usernameFromIosKeychain then
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.autoPopulatedUsername)
			p84.updateCValueText(p84.props.usernameFromIosKeychain)
		end

		if p84.props.passwordFromIosKeychain then
			KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.autoPopulatedPassword)
			p84.updatePasswordText(p84.props.passwordFromIosKeychain)
		end

		if v145 then
			p84:setState({
				loginButtonDisabled = not (p84.props.usernameFromIosKeychain and p84.props.passwordFromIosKeychain)
			})
		else
			p84:setState({
				loginButtonDisabled = false
			})
		end
	end

	local function isWithinBounds(p85, p86) -- line: 1745
		-- upvalues: p84 (copy), UiMode (copy)
		if p84.props.uiModeInfo.uiMode == UiMode.VR then
			error("Input position is not supported in VR")
		end

		local AbsolutePosition = p86.AbsolutePosition
		local AbsoluteSize = p86.AbsoluteSize

		return p85.X > AbsolutePosition.X and (p85.X < AbsolutePosition.X + AbsoluteSize.X and (p85.Y > AbsolutePosition.Y and p85.Y < AbsolutePosition.Y + AbsoluteSize.Y))
	end
	local function getNextSelectedObject(p87) -- line: 1758
		-- upvalues: UserInputService (copy), v131 (copy), p84 (copy)
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
			if v131 then
				return p84.focusRef and (p84.focusRef.current and p84.focusRef.current.NextSelectionUp)
			end

			return p87.NextSelectionUp
		end

		if v131 then
			return p84.focusRef and (p84.focusRef.current and p84.focusRef.current.NextSelectionDown)
		end

		return p87.NextSelectionDown
	end
	local function getNewSelectedObject() -- line: 1776
		-- upvalues: v131 (copy), p84 (copy), GuiService (copy), getNextSelectedObject (copy)
		local v345 = if not v131 then GuiService.SelectedObject else p84.focusRef and p84.focusRef.current
		local v346 = getNextSelectedObject(v345)

		if v346 == p84.loginButtonRef.current and p84.state.loginButtonDisabled then
			v346 = getNextSelectedObject(v346)
		end

		if p84.isMounted then
			p84:setState({
				forgotLinkFocused = v346 == p84.forgotLinkRef.current
			})
		end

		return v346
	end

	table.insert(p84.events, UserInputService.InputBegan:connect(function(p88, _) -- line: 1797
		-- upvalues: p84 (copy), AppPage (copy), v131 (copy), GuiService (copy), getNewSelectedObject (copy)
		if p84.props.currentPageName ~= AppPage.Login then
			return
		end

		if p88.UserInputType == Enum.UserInputType.Keyboard then
			if p88.KeyCode == Enum.KeyCode.Return then
				if p84.state.forgotLinkFocused then
					p84.onForgetButtonActivated()

					return
				end

				p84.onLoginButtonActivated()

				return
			end

			if p88.KeyCode == Enum.KeyCode.Tab then
				local v349 = if not v131 then GuiService.SelectedObject else p84.focusRef and p84.focusRef.current

				if not v349 then
					return
				end

				local v350 = getNewSelectedObject()

				if not v350 then
					return
				end

				if v349:IsA("TextBox") and v349.ManualFocusRelease then
					v349:ReleaseFocus()
				end

				if v131 then
					p84.focusRef.current = v350
				else
					GuiService.SelectedObject = v350
				end

				if v350:IsA("TextBox") then
					v350:CaptureFocus()
				end
			end
		end
	end))
	table.insert(p84.events, UserInputService.InputEnded:connect(function(p90, _) -- line: 1842
		-- upvalues: p84 (copy), AppPage (copy), UiMode (copy), UserInputService (copy), isWithinBounds (copy)
		if p84.props.currentPageName ~= AppPage.Login then
			return
		end

		if p84.props.uiModeInfo.uiMode == UiMode.VR then
			return
		end

		if p90.UserInputType == Enum.UserInputType.MouseButton1 or p90.UserInputType == Enum.UserInputType.Touch then
			local p90Position = p90.Position
			local FocusedTextBox = UserInputService:GetFocusedTextBox()

			if not p84.cvalueRef.current or not p84.passwordRef.current then
				return
			end

			if not FocusedTextBox then
				return
			end

			local v355 = isWithinBounds(p90Position, p84.cvalueRef.current)
			local v356 = isWithinBounds(p90Position, p84.passwordRef.current)

			if FocusedTextBox == p84.cvalueRef.current and v356 then
				p84.cvalueRef.current:ReleaseFocus()
				p84.passwordRef.current:CaptureFocus()

				return
			end

			if FocusedTextBox == p84.passwordRef.current and v355 then
				p84.passwordRef.current:ReleaseFocus()
				p84.cvalueRef.current:CaptureFocus()

				return
			end

			if not v355 and not v356 and (FocusedTextBox == p84.cvalueRef.current or FocusedTextBox == p84.passwordRef.current) then
				FocusedTextBox:ReleaseFocus()
			end
		end
	end))
	table.insert(p84.events, UserInputService.TextBoxFocused:connect(function(p92) -- line: 1884
		-- upvalues: p84 (copy), AppPage (copy), v131 (copy), GuiService (copy)
		if p84.props.currentPageName ~= AppPage.Login then
			return
		end

		if p84.state.isLoginInProgress then
			p92:ReleaseFocus()

			return
		end

		if v131 then
			p84.focusRef.current = p92

			return
		end

		GuiService.SelectedObject = p92
	end))
	table.insert(p84.events, UserInputService.TextBoxFocusReleased:connect(function(_) -- line: 1903
		-- upvalues: p84 (copy), AppPage (copy), v131 (copy), GuiService (copy)
		if p84.props.currentPageName ~= AppPage.Login then
			return
		end

		if v131 then
			p84.focusRef.current = nil

			return
		end

		GuiService.SelectedObject = nil
	end))
	table.insert(p84.events, MemStorageService:bind(MemStorageKeys.AutoFillCredentials, function(p94) -- line: 1918
		-- upvalues: p84 (copy), AppPage (copy), HttpService (copy)
		if p84.props.currentPageName ~= AppPage.Login then
			return
		end

		if p84.state.isLoginInProgress then
			return
		end

		local data = HttpService:JSONDecode(p94)

		if data then
			p84.updateCValueText(data.cvalue)
			p84.updatePasswordText(data.password)
		end
	end))

	if GetFFlagLuaAppEnableDesktopDualLoginABTest() then
		GetIXPLayerParameters(p84.props.networking, "PlayerApp.Login", { "isDesktopDualLoginEnabled" }):andThen(function(p95) -- line: 1935
			-- upvalues: p84 (copy)
			local v362 = p95 and p95.responseBody

			if v362 and p84.isMounted then
				local isDesktopDualLoginEnabled = v362.isDesktopDualLoginEnabled

				if isDesktopDualLoginEnabled then
					p84:setState({
						isDesktopDualLoginEnabled = isDesktopDualLoginEnabled
					})
				end
			end
		end, function() -- line: 1946
		end)
	end

	if GetFFlagEnableCredentialsProtocolPasswords() then
		local u184 = false
		local u185 = false
		local u186 = false

		default:isAvailable(default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p96) -- line: 1959
			-- upvalues: u184 (ref), FFlagEnableCredentialsV2InterfaceDetectionFix (copy), u185 (ref), u186 (ref), p84 (copy)
			if p96.FIDO2 ~= nil then
				u184 = p96.FIDO2.isAvailable and p96.FIDO2.supportsDeviceBoundOnly

				if FFlagEnableCredentialsV2InterfaceDetectionFix then
					u185 = p96.password and p96.password.isAvailable
					u186 = p96.password ~= nil
				else
					u185 = p96.password.isAvailable
					u186 = true
				end

				if p84.isMounted then
					p84:setState({
						isCredentialsProtocolRegisterPasswordAvailable = u185
					})
				end
			else
				u184 = p96.isAvailable and p96.supportsDeviceBoundOnly
			end

			if u186 then
				p84.showGenericCredentialLoginPopup(u184, u185)

				return
			end

			if u184 then
				p84.showPasskeyLoginPopup()
			end
		end):catch(function(p97) -- line: 1990
			-- upvalues: Logger (copy)
			Logger:warning("Error checking for available credential types. Error: {}", p97)
		end):finally(function() -- line: 1993
			-- upvalues: p84 (copy), EventStreamConstants (copy), u185 (ref), u184 (ref)
			p84.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.CMPasswordLogin, (tostring(u185)))
			p84.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.PasskeyLogin, u184 == nil and "timeout" or tostring(u184))
		end)
	else
		local u187 = false

		default:isAvailable(default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p98) -- line: 2007
			-- upvalues: u187 (ref), p84 (copy)
			u187 = p98.isAvailable and p98.supportsDeviceBoundOnly

			if u187 then
				p84.showPasskeyLoginPopup()
			end
		end):catch(function(p99) -- line: 2013
			warn("Error checking if FIDO2 passkeys is available. Error: ", p99)
		end):finally(function() -- line: 2016
			-- upvalues: p84 (copy), EventStreamConstants (copy), u187 (ref)
			p84.props.authAnalytics.reportAuthPageload(EventStreamConstants.Context.PasskeyLogin, u187 == nil and "timeout" or tostring(u187))
		end)
	end

	if LocalizationService.RobloxLocaleId:match("^en") then
		GetIXPLayerParameters(p84.props.networking, "PlayerApp.Login", { "CrossDeviceButtonText" }):andThen(function(p100) -- line: 2027
			-- upvalues: p84 (copy)
			local v369 = p100 and p100.responseBody

			if v369 and p84.isMounted then
				local CrossDeviceButtonText = v369.CrossDeviceButtonText

				if CrossDeviceButtonText then
					p84:setState({
						quickLoginButtonTextOverride = CrossDeviceButtonText
					})
				end
			end
		end, function() -- line: 2038
		end)
	end

	p84.props.loggingProtocol:logEventOnce("login_view_did_mount")
	p84.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.LoginPageMountTelemetryConfig, 1, {
		version = 1
	})
end
function v163.willUnmount(p101) -- line: 2051
	-- upvalues: FFlagEnableLuaAccountSwitch (copy)
	if FFlagEnableLuaAccountSwitch == true and p101.isAlreadyAuthenticated == true then
		resetDefaultTheme()
	end

	p101.unfocusTextBoxes()

	for _, v in ipairs(p101.events) do
		v:Disconnect()
	end

	p101.events = {}
	p101.isMounted = false
end
function v163.didUpdate(p102, _, p104) -- line: 2066
	-- upvalues: t1 (copy)
	if p102.state.errorCode == -1 then
		return
	end

	local isLoginInProgress = p102.state.isLoginInProgress

	if p104.isLoginInProgress and not isLoginInProgress then
		local v195 = p102.errorHandlingInfoList[p102.state.errorCode]

		if not v195 then
			return
		end

		if v195.textBoxesToClear then
			for _, v in pairs(v195.textBoxesToClear) do
				if v == t1.CValue then
					p102.updateCValueText("")
				elseif v == t1.Password then
					p102.updatePasswordText("")
				end
			end
		end

		if v195.newFocusedTextBox == t1.CValue and p102.cvalueRef.current then
			p102.cvalueRef.current:CaptureFocus()

			return
		end

		if v195.newFocusedTextBox == t1.Password and p102.passwordRef.current then
			p102.passwordRef.current:CaptureFocus()
		end
	end
end
function v163.render(p105) -- line: 2098
	-- upvalues: UiMode (copy), GetFFlagLuaAppEnableDesktopDualLoginABTest (copy), FFlagEnableVNGDUARSignupCompliance (copy), FFlagAuthSecExclusions (copy), GetFFlagEnableOtpEmailLogin (copy), FFlagEnableKoreaKISACompliance (copy), withStyle (copy), FlagSettings (copy), withLocalization (copy), DualLoginWithContentsLayout (copy), LogoWithContentsLayout (copy), Roact (copy), Alignment (copy), CredentialLoginContainer (copy), LoginCodePrompt (copy), LinkButton (copy), DisclaimerLinks (copy), v164 (copy)
	local v199 = p105.state.errorKey ~= "" and p105.state.errorKey or nil
	local v200 = p105.state.errorKey == false and p105.state.localizedErrorMessage or nil
	local u201 = not p105.props.appPolicy.getWebViewSupport() and p105.props.uiModeInfo.uiMode ~= UiMode.VR
	local v202 = p105.props.uiModeInfo.uiMode == UiMode.TenFoot or p105.props.uiModeInfo.uiMode == UiMode.VR
	local v203 = GetFFlagLuaAppEnableDesktopDualLoginABTest() and p105.state.isDesktopDualLoginEnabled
	local v204 = v202 or p105.props.appPolicy.getEnableDualLogin() and v203
	local v205 = p105.props.appPolicy.getDisableEmailOTPLogin() and (FFlagEnableVNGDUARSignupCompliance or FFlagAuthSecExclusions)
	local v206 = GetFFlagEnableOtpEmailLogin() and (p105.props.isLoginWithOtpEnabled and not v205)
	local v207 = p105.props.appPolicy.getUseVNGUserAgreementPopup()
	local v208 = FFlagEnableKoreaKISACompliance and p105.props.appPolicy.getUseKoreaKISAUserAgreementPopup()
	local v209 = FFlagEnableVNGDUARSignupCompliance and p105.props.appPolicy.getDisableLoginForgotButton()

	return withStyle(function(p106) -- line: 2125
		-- upvalues: FlagSettings (copy), v204 (copy), FFlagAuthSecExclusions (copy), p105 (copy), u201 (ref), withLocalization (copy), v199 (copy), v202 (copy), DualLoginWithContentsLayout (copy), LogoWithContentsLayout (copy), UiMode (copy), Roact (copy), Alignment (copy), CredentialLoginContainer (copy), v200 (copy), v207 (copy), v208 (copy), v206 (copy), LoginCodePrompt (copy), v209 (copy), LinkButton (copy), DisclaimerLinks (copy), v164 (copy)
		local u372 = FlagSettings.CrossDeviceLoginRolloutEnabledForDevice() and not v204

		if FFlagAuthSecExclusions and p105.props.appPolicy.getExcludeCrossDeviceSignIn() then
			u372 = false
		end

		local v373 = p105.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton()

		if p105.props.appPolicy.getDisableRegularLogin() == false then
			u201 = false
		end

		return withLocalization({
			localizedError = v199,
			logInText = "Authentication.Login.Action.SignIn",
			forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized",
			cvaluePlaceholder = not p105.state.forceLoginByUsername and "Authentication.Login.Label.UsernameEmailPhone" or "Authentication.Login.Label.Username",
			passwordPlaceholder = "CommonUI.Messages.Label.Password",
			twoStepHeader = "Authentication.TwoStepVerification.Label.TwoStepVerification",
			crossDeviceLoginHeader = "Authentication.CrossDevice.Heading.QuickLogin",
			loginWithExistingAccountButtonText = "Authentication.CrossDevice.Heading.QuickLogin",
			orText = "CommonUI.Messages.Label.OR"
		})(function(p107) -- line: 2152
			-- upvalues: p105 (copy), v373 (copy), v202 (copy), DualLoginWithContentsLayout (copy), LogoWithContentsLayout (copy), UiMode (copy), Roact (copy), Alignment (copy), v204 (copy), CredentialLoginContainer (copy), u372 (ref), v200 (copy), u201 (ref), v207 (copy), v208 (copy), v206 (copy), p106 (copy), LoginCodePrompt (copy), v209 (copy), LinkButton (copy), DisclaimerLinks (copy), v164 (copy)
			local v457 = p105.state.quickLoginButtonTextOverride ~= "" and p105.state.quickLoginButtonTextOverride or p107.crossDeviceLoginHeader

			if v373 then
				v457 = p107.loginWithExistingAccountButtonText
			end

			local v458 = if not v202 then LogoWithContentsLayout else DualLoginWithContentsLayout
			local v459 = v202 and p105.props.uiModeInfo.uiMode ~= UiMode.VR

			return Roact.createElement(v458, {
				ContentAlign = Alignment.Top,
				topButtonActivatedTracking = p105.topButtonActivatedTracking,
				topButtonEnabled = not p105.state.isLoginInProgress,
				statusBarHeight = p105.props.statusBarHeight,
				globalGuiInset = p105.props.globalGuiInset,
				screenSize = p105.props.screenSize,
				isDualLayout = v204,
				navigateBack = if not v202 then nil else p105.props.navigateBack,
				buttonRef = p105.props.containerRef
			}, {
				UIListLayout = v204 and Roact.createElement("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}) or Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 15)
				}),
				Form = if not v204 then Roact.createElement(CredentialLoginContainer, {
					crossDeviceLoginEnabled = u372,
					quickLoginButtonText = v457,
					loginWithExistingAccountVariantEnabled = v373,
					handleLoginWithFormDataCallback = p105.handleLoginWithFormData,
					updateIsLoginInProgress = p105.updateIsLoginInProgress,
					cvalueText = p105.cvalueText,
					passwordText = p105.passwordText,
					onTextBoxesChanged = p105.onTextBoxesChanged,
					buttonRef = p105.props.defaultRef,
					cvalueRef = p105.cvalueRef,
					passwordRef = p105.passwordRef,
					loginButtonRef = p105.loginButtonRef,
					forgotLinkRef = p105.forgotLinkRef,
					crossDeviceButtonRef = p105.crossDeviceButtonRef,
					emailOtpRef = p105.emailOtpRef,
					localizedError = p107.localizedError,
					localizedErrorMessage = v200,
					forceLoginByUsername = p105.state.forceLoginByUsername or v202,
					onCrossDeviceLoginActivated = p105.onCrossDeviceLoginActivated,
					onEmailOtpActivated = p105.onEmailOtpLoginActivated,
					loginButtonDisabled = p105.state.loginButtonDisabled,
					isLoginInProgress = p105.state.isLoginInProgress,
					authAnalytics = p105.props.authAnalytics,
					disableRegularLogin = u201,
					showLinkAccountText = p105.props.appPolicy.getUseSingleSignOn(),
					showForgotButton = not u201 and (v204 and not v202),
					onForgetButtonActivated = p105.onForgetButtonActivated,
					maxSizeX = not v204 and 360 or 1e999,
					showDisclaimerLinks = v204 and (not v202 and not (v207 or v208)),
					showDisclaimerButtons = v204 and (v202 and not v207),
					showCredentialHeader = v204 and not v202,
					isDualLayout = v204,
					isTenFootUiMode = v202,
					emailOtpEnabled = v206
				}) else Roact.createElement("Frame", {
					Size = UDim2.new(0.5, 0, 1, 0),
					LayoutOrder = 1,
					BackgroundTransparency = 1
				}, {
					FormContent = Roact.createElement(CredentialLoginContainer, {
						Size = UDim2.new(0, 0, 1, 0),
						crossDeviceLoginEnabled = u372,
						quickLoginButtonText = v457,
						loginWithExistingAccountVariantEnabled = v373,
						handleLoginWithFormDataCallback = p105.handleLoginWithFormData,
						updateIsLoginInProgress = p105.updateIsLoginInProgress,
						cvalueText = p105.cvalueText,
						passwordText = p105.passwordText,
						onTextBoxesChanged = p105.onTextBoxesChanged,
						buttonRef = p105.props.defaultRef,
						cvalueRef = p105.cvalueRef,
						passwordRef = p105.passwordRef,
						loginButtonRef = p105.loginButtonRef,
						forgotLinkRef = p105.forgotLinkRef,
						crossDeviceButtonRef = p105.crossDeviceButtonRef,
						emailOtpRef = p105.emailOtpRef,
						localizedError = p107.localizedError,
						localizedErrorMessage = v200,
						forceLoginByUsername = p105.state.forceLoginByUsername or v202,
						onCrossDeviceLoginActivated = p105.onCrossDeviceLoginActivated,
						onEmailOtpActivated = p105.onEmailOtpLoginActivated,
						loginButtonDisabled = p105.state.loginButtonDisabled,
						isLoginInProgress = p105.state.isLoginInProgress,
						authAnalytics = p105.props.authAnalytics,
						disableRegularLogin = u201,
						showLinkAccountText = v459,
						showForgotButton = not u201 and not v202,
						onForgetButtonActivated = p105.onForgetButtonActivated,
						maxSizeX = 1e999,
						showDisclaimerLinks = not v202 and not (v207 or v208),
						showDisclaimerButtons = v202 and not v207,
						showCredentialHeader = not v202,
						isDualLayout = true,
						isTenFootUiMode = v202,
						emailOtpEnabled = v206,
						LayoutOrder = 2
					})
				}),
				Divider = v204 and Roact.createElement("Frame", {
					LayoutOrder = 2,
					Size = UDim2.new(0, p106.Tokens.Global.Size_500, 1, 0),
					BackgroundTransparency = 1
				}, {
					Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, p106.Tokens.Global.Size_150)
					}),
					Roact.createElement("Frame", {
						Size = UDim2.new(0, p106.Tokens.Global.Size_25, 0.5, 0),
						BackgroundTransparency = 0,
						BackgroundColor3 = p106.Tokens.Global.Color.Smoke.Color3,
						LayoutOrder = 1
					}),
					Roact.createElement("TextLabel", {
						Text = p107.orText,
						TextSize = p106.Tokens.Global.Size_200,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextTransparency = 0,
						TextColor3 = p106.Tokens.Global.Color.Smoke.Color3,
						BackgroundTransparency = 1,
						LayoutOrder = 2
					}),
					Roact.createElement("Frame", {
						Size = UDim2.new(0, p106.Tokens.Global.Size_25, 0.5, 0),
						BackgroundTransparency = 0,
						BackgroundColor3 = p106.Tokens.Global.Color.Smoke.Color3,
						LayoutOrder = 3
					})
				}) or nil,
				LoginCode = v204 and Roact.createElement("Frame", {
					Size = UDim2.new(0.5, 0, 1, 0),
					LayoutOrder = 3,
					BackgroundTransparency = 1
				}, { Roact.createElement(LoginCodePrompt, {
					loginCallback = p105.handleLoginWithCode,
					isOverlay = false,
					hideDeviceCode = not v202,
					showLockIcon = not v202,
					isDualLayout = true
				}) }),
				Forgot = if u201 or (v204 or v209) then nil else Roact.createElement(LinkButton, {
					text = p107.forgotText,
					size = UDim2.new(0, 0, 0, 30),
					fontStyle = "Footer",
					onActivated = p105.onForgetButtonActivated,
					colorStyleDefault = "TextDefault",
					colorStyleHover = "TextDefault"
				}),
				DisclaimerLinks = if v204 or (v207 or v208) then nil else Roact.createElement(DisclaimerLinks, {
					fillDirection = Enum.FillDirection.Vertical,
					LayoutOrder = 60
				}),
				Padding = not v204 and Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, v164),
					LayoutOrder = 61
				}) or nil
			})
		end)
	end)
end

local v166 = RoactServices.connect({
	networking = RoactNetworking,
	analytics = RoactAnalytics,
	authAnalytics = RoactAnalyticsAuthEvents,
	loggingProtocol = AppLogging,
	linking = AppLinking
})(v163)
local v167 = RoactRodux.connect(function(p108, _) -- line: 2356
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	local v212

	if FFlagUseNavigationSelectors then
		v212 = Selectors.selectCurrentPageName(p108)
	else
		local v213 = p108.Navigation.history[#p108.Navigation.history]

		v212 = v213[#v213].name
	end

	return {
		currentPageName = v212,
		screenSize = p108.ScreenSize,
		statusBarHeight = p108.TopBar.statusBarHeight,
		globalGuiInset = p108.GlobalGuiInset
	}
end, function(p110) -- line: 2370
	-- upvalues: Login (copy), LoginByCode (copy), LoginByPasskey (copy), LoginByOtp (copy), LaunchApp (copy), LaunchContext (copy), ResetAppState (copy), Promise (copy), User (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), Constants (copy), AppStorageUtilities (copy), FFlagLuaEnableDidSwitchAccount (copy), GuiService (copy), NotificationType (copy), SetBackNavigationDisabled (copy), NavigateDown (copy), SetLoginResult (copy), OpenCentralOverlayForLoginPasswordResetPrompt (copy), SetCentralOverlay (copy), OverlayType (copy), GetFFlagEnableVNGNewAppAvailableModal (copy), CrossDeviceLogin (copy), OpenAccountSelector (copy), GetFFlagShouldUsePeekViewForLoginDisambiguation (copy), OpenEmailOtp (copy), CloseCentralOverlay (copy), RenderChallenge (copy), StartPasskeyAuthentication (copy), LogoutAllLoggedInUsers (copy), Logout (copy), OpenAccountSwitchingErrorOverlay (copy), NavigateBack (copy)
	return {
		login = function(...) --[[ login ]] -- line: 2372
			-- upvalues: p110 (copy), Login (copy)
			return p110(Login(...))
		end,
		loginByCode = function(...) --[[ loginByCode ]] -- line: 2375
			-- upvalues: p110 (copy), LoginByCode (copy)
			return p110(LoginByCode(...))
		end,
		loginByPasskey = function(...) --[[ loginByPasskey ]] -- line: 2378
			-- upvalues: p110 (copy), LoginByPasskey (copy)
			return p110(LoginByPasskey(...))
		end,
		loginByOtp = function(...) --[[ loginByOtp ]] -- line: 2381
			-- upvalues: p110 (copy), LoginByOtp (copy)
			return p110(LoginByOtp(...))
		end,
		launchApp = function(p111, p112, p113, p114) --[[ launchApp ]] -- line: 2384
			-- upvalues: p110 (copy), LaunchApp (copy), LaunchContext (copy)
			return p110(LaunchApp(p111, p112, p113, p114, LaunchContext.Login))
		end,
		clearApp = function() --[[ clearApp ]] -- line: 2390
			-- upvalues: p110 (copy), ResetAppState (copy), Promise (copy)
			p110(ResetAppState())

			return Promise.resolve(true)
		end,
		handleLoginCompletionWithAccountSwitching = function(p115, p116, p117, p118, p119, p120, p121) --[[ handleLoginCompletionWithAccountSwitching ]] -- line: 2395
			-- upvalues: User (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), Constants (copy), AppStorageUtilities (copy), FFlagLuaEnableDidSwitchAccount (copy), GuiService (copy), NotificationType (copy)
			if User.fromLocalStorage().userId ~= -1 then
				p120():andThen(function(_) -- line: 2406
					-- upvalues: FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), Constants (copy), AppStorageUtilities (copy), p119 (copy), FFlagLuaEnableDidSwitchAccount (copy), GuiService (copy), NotificationType (copy)
					local v461 = if not FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then Constants.Auth.AccountSwitcherSwitchedStatus else AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus

					AppStorageUtilities.setAccountSwitchStatus(v461)
					AppStorageUtilities.setAccountBlob(p119)
					AppStorageUtilities.flush()

					if FFlagLuaEnableDidSwitchAccount then
						GuiService:BroadcastNotification("", NotificationType.DID_SWITCH_ACCOUNT)

						return
					end

					GuiService:BroadcastNotification("", NotificationType.DID_LOG_OUT)
				end, function(_) -- line: 2418
					-- upvalues: AppStorageUtilities (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), p119 (copy), p121 (copy), p115 (copy), p116 (copy), p117 (copy), p118 (copy)
					AppStorageUtilities.setAccountSwitchStatus(not FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues and "switched" or AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus)
					AppStorageUtilities.setAccountBlob(p119)
					AppStorageUtilities.flush()
					p121(p115, p116, p117, p118)
				end)

				return
			end

			AppStorageUtilities.setAccountBlob(p119)
			AppStorageUtilities.flush()
			p121(p115, p116, p117, p118)
		end,
		setBackNavigationDisabled = function(p124) --[[ setBackNavigationDisabled ]] -- line: 2435
			-- upvalues: p110 (copy), SetBackNavigationDisabled (copy)
			return p110(SetBackNavigationDisabled(p124))
		end,
		navigateToPage = function(p125) --[[ navigateToPage ]] -- line: 2438
			-- upvalues: p110 (copy), NavigateDown (copy)
			return p110(NavigateDown(p125))
		end,
		setLoginResult = function(p126) --[[ setLoginResult ]] -- line: 2441
			-- upvalues: p110 (copy), SetLoginResult (copy)
			p110(SetLoginResult(p126))
		end,
		openPasswordResetPrompt = function() --[[ openPasswordResetPrompt ]] -- line: 2444
			-- upvalues: p110 (copy), OpenCentralOverlayForLoginPasswordResetPrompt (copy)
			p110(OpenCentralOverlayForLoginPasswordResetPrompt())
		end,
		openEmailVerificationPrompt = function(p127, p128, p129) --[[ openEmailVerificationPrompt ]] -- line: 2447
			-- upvalues: p110 (copy), SetCentralOverlay (copy), OverlayType (copy)
			p110(SetCentralOverlay(OverlayType.LoginEmailVerificationPrompt, {
				credentialValue = p127,
				password = p128,
				onClose = p129
			}))
		end,
		openNewAppAvailableModal = function(p130) --[[ openNewAppAvailableModal ]] -- line: 2454
			-- upvalues: GetFFlagEnableVNGNewAppAvailableModal (copy), p110 (copy), SetCentralOverlay (copy), OverlayType (copy)
			if GetFFlagEnableVNGNewAppAvailableModal() then
				p110(SetCentralOverlay(OverlayType.NewAppAvailableModal, {
					onButtonActivated = p130
				}))
			end
		end,
		openCrossDeviceLoginPrompt = function(p131) --[[ openCrossDeviceLoginPrompt ]] -- line: 2461
			-- upvalues: p110 (copy), CrossDeviceLogin (copy)
			p110(CrossDeviceLogin.OpenLoginCodePrompt({
				loginCallback = p131,
				isOverlay = true
			}))
		end,
		openCrossAppLoginPrompt = function(p132) --[[ openCrossAppLoginPrompt ]] -- line: 2467
			-- upvalues: p110 (copy), CrossDeviceLogin (copy)
			p110(CrossDeviceLogin.OpenLoginCodePrompt({
				loginCallback = p132,
				isOverlay = true,
				isCrossApp = true
			}))
		end,
		openAccountSelector = function(p133) --[[ openAccountSelector ]] -- line: 2474
			-- upvalues: p110 (copy), OpenAccountSelector (copy), GetFFlagShouldUsePeekViewForLoginDisambiguation (copy)
			p110(OpenAccountSelector(p133, GetFFlagShouldUsePeekViewForLoginDisambiguation(), false))
		end,
		openEmailOtp = function(p134) --[[ openEmailOtp ]] -- line: 2479
			-- upvalues: p110 (copy), OpenEmailOtp (copy)
			p110(OpenEmailOtp(p134))
		end,
		closeCentralOverlay = function() --[[ closeCentralOverlay ]] -- line: 2482
			-- upvalues: p110 (copy), CloseCentralOverlay (copy)
			return p110(CloseCentralOverlay())
		end,
		resetAppState = function() --[[ resetAppState ]] -- line: 2485
			-- upvalues: p110 (copy), ResetAppState (copy)
			return p110(ResetAppState())
		end,
		renderChallenge = function(p135, p136) --[[ renderChallenge ]] -- line: 2488
			-- upvalues: p110 (copy), RenderChallenge (copy)
			return p110(RenderChallenge(p135, p136))
		end,
		startPasskeyAuthentication = function(p137) --[[ startPasskeyAuthentication ]] -- line: 2491
			-- upvalues: p110 (copy), StartPasskeyAuthentication (copy)
			return p110(StartPasskeyAuthentication(p137))
		end,
		logoutAllLoggedInUsers = function(p138, p139) --[[ logoutAllLoggedInUsers ]] -- line: 2494
			-- upvalues: p110 (copy), LogoutAllLoggedInUsers (copy)
			return p110(LogoutAllLoggedInUsers(p138, p139))
		end,
		logoutWithoutShowConfirmation = function(p140, p141) --[[ logoutWithoutShowConfirmation ]] -- line: 2497
			-- upvalues: p110 (copy), Logout (copy)
			return p110(Logout(p140, p141))
		end,
		openAccountSwitchingErrorOverlay = function(p142, p143, p144, p145, p146, p147, p148, p149) --[[ openAccountSwitchingErrorOverlay ]] -- line: 2500
			-- upvalues: p110 (copy), OpenAccountSwitchingErrorOverlay (copy)
			return p110(OpenAccountSwitchingErrorOverlay(p142, p143, p144, p145, p146, p147, p148, p149))
		end,
		navigateBack = function() --[[ navigateBack ]] -- line: 2523
			-- upvalues: p110 (copy), NavigateBack (copy)
			return p110(NavigateBack())
		end,
		showAccountLinkingAlert = function(p150, p151) --[[ showAccountLinkingAlert ]] -- line: 2526
			-- upvalues: p110 (copy), SetCentralOverlay (copy), OverlayType (copy)
			return p110(SetCentralOverlay(OverlayType.AccountLinkingAlert, {
				alertType = p150,
				userFacingMessage = p151
			}))
		end
	}
end)(v166)
local v168 = RoactAppPolicy.connect(function(p152, _) -- line: 2535
	return {
		appPolicy = p152
	}
end)(v167)
local v169 = RoactAppExperiment.connectBrowserTrackerLayer({
	AppBtidLayers.LoginLayer,
	AppBtidLayers.AccountSwitcherLayer
}, function(p154, _) -- line: 2544
	-- upvalues: AppBtidLayers (copy), GetFFlagEnableAccountSwitcherIXPTextGatingFix (copy), GetFFlagEnableAccountSwitcherRedesignIXP (copy), GetFFlagEnableAccountSwitcherFoundationDesign (copy), v147 (copy)
	local v219 = p154[AppBtidLayers.LoginLayer] or {}
	local v222

	if GetFFlagEnableAccountSwitcherIXPTextGatingFix() then
		local v220 = p154[AppBtidLayers.AccountSwitcherLayer] or {}
		local v221 = not GetFFlagEnableAccountSwitcherRedesignIXP() or v220.enableAccountSwitcherFoundationDesign == true

		v222 = GetFFlagEnableAccountSwitcherFoundationDesign() and v221
	else
		v222 = GetFFlagEnableAccountSwitcherFoundationDesign()
	end

	return {
		isLoginWithOtpEnabled = v147 or v219.IsLoginWithOtpEnabled,
		shouldLoginWithKeystoreCredentials = v219.shouldLoginWithKeystoreCredentials,
		showAccountSwitcherFoundationDesign = v222
	}
end)(v168)
local u170 = withNavigationProps(function(_, p157) -- line: 2565
	return p157
end)(v169)

return function(p158) --[[ LoginViewFn ]] -- line: 2569
	-- upvalues: useUiModeInfo (copy), ReactFocusNavigation (copy), Roact (copy), u170 (ref), Cryo (copy)
	local v226 = useUiModeInfo()
	local v227, v228 = ReactFocusNavigation.useDefaultFocusBehavior()

	return Roact.createElement(u170, Cryo.Dictionary.join({
		uiModeInfo = v226,
		defaultRef = v227,
		containerRef = v228
	}, p158))
end
