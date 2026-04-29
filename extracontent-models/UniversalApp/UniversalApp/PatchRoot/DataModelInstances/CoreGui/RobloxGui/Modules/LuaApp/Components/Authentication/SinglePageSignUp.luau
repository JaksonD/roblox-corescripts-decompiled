local UserInputService, Roact, React, RoactRodux, RobloxLocaleIdKey, Responsive, usePreferredInput, useBreakpointXOrSmaller, ReactFocusNavigation, AppGuiService, RoactAnalyticsAuthEvents, RoactAnalytics, RoactServices, RoactNetworking, RoactAppPolicy, RoactAppExperiment, DisplayNameCounters, Cryo, Button, ButtonType, Constants, withStyle, withLocalization, withNavigationProps, DisclaimerLinksVariant, UnderAgeInteractiveAlert, FitChildren, FitTextLabel, FullscreenPageWithSafeArea, AuthBirthdayBar, AuditContentContext, CollapsingTextInputValidator, SignUpGenderSelector, TitleAndParagraph, DisclaimerLinks, ContactInfoField, BirthdayField, BackgroundFill, FormFactor, NavigateBack, SetBackNavigationDisabled, useSignUpPageNavigationBindings, SetCentralOverlay, OverlayType, UsernameValidator, PasswordValidator, ApiFetchAuthMetaData, SignUpV2, FFlagEnableLuaAccountSwitch, MemStorageService, MemStorageKeys, OpenAccountSwitchingErrorOverlay, CloseCentralOverlay, ResetAppState, Logout, OpenKISAPopUpAgreements, AnalyticsEvents, EventConstants, OpenEmailOtp, ImageSetLabel, GetImageData, ImageSetButton, DateHelper, UsernameValidationContext, EventStreamConstants, AppBtidLayers, InputValidity, default, LinkingProtocol, UiModeStyleProvider, Foundation, Checkbox, InputSize, View, FoundationText, useTokens, useDispatch, GetFFlagEnableTextFieldContentType, GetFFlagMinimalSignupAuthEnabled, GetFFlagPasswordlessSignupAuthEnabled, GetFFlagPasskeySignupEnabled, FFlagFoundationStylingOnSignUp, GetFFlagAuthIntentLoggingAtSignupEnabled, GetFIntLuaLoginGenderSelector, GetFFlagIsAltAttemptLoggingAtSignup, GetFIntLuaAppCredentialsProtocolAvailableTimeout, EngineFeature, SuggestionsFrame, UsernameSuggestor, AppLogging, OpenCentralOverlayForAgreeToPhoneNumberVerification, OpenCentralOverlayForPhoneNumberVerification, SetNetworkingErrorToast, ToastType, SetCurrentToastMessage, v136, reportEphemeralCounter, UserAgreementsCounterNames, SignUpPageView, DisplayNameField, v142, v143, v144, v145, v146, v147, v149, FFlagEnableAuthDeepLinkReceiver, PreAuthDeepLinkUrlStore, TelemetryConfigs, GetFFlagEnablePreferredInputForSignUp, FFlagEnableSignUpExitModal, v156, FFlagHideBackButtonOnSignUpPage, v159, v160, GetFFlagEnableAccountSwitcherFoundationDesign, GetFFlagEnableAccountSwitcherRedesignIXP, GetFFlagEnableAccountSwitcherIXPTextGatingFix, GetFFlagEnableAuditForSinglePageSignUp, FFlagEnableSignupFoundationalizeBackgroundAndText, v166, uDim2, v168, vector2, GetFFlagLuaAppSignUpPageRefactor, v171

do
	local Modules = game:GetService("CoreGui").RobloxGui.Modules
	local CorePackages = game:GetService("CorePackages")

	UserInputService = game:GetService("UserInputService")

	local GuiService = game:GetService("GuiService")
	local AppStorageService = game:GetService("AppStorageService")
	local HttpService = game:GetService("HttpService")
	local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey

	Roact = require(CorePackages.Packages.Roact)
	React = require(CorePackages.Packages.React)
	RoactRodux = require(CorePackages.Packages.RoactRodux)
	RobloxLocaleIdKey = require(CorePackages.Workspace.Packages.Localization).RobloxLocaleIdKey
	Responsive = require(CorePackages.Workspace.Packages.Responsive)
	usePreferredInput = Responsive.usePreferredInput
	useBreakpointXOrSmaller = Responsive.useBreakpointXOrSmaller
	ReactFocusNavigation = require(CorePackages.Packages.ReactFocusNavigation)
	AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
	RoactAnalyticsAuthEvents = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
	RoactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics)
	RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
	RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
	RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
	RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
	DisplayNameCounters = require(script.Parent.Enum.DisplayNameCounters)
	Cryo = require(CorePackages.Packages.Cryo)

	local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
	local AccountLinkingAlertType, GetCredentialsAvailabilityStore, GetMetaDataFromShareLink, User, AppStorageUtilities, LogoutAllLoggedInUsers, FFlagEnableKoreaKISACompliance, FFlagBypassIXPKoreaCompliance, FFlagBypassGUACKoreaCompliance, KISAComplianceUtils, ValidateCode, Constants2, Promise, Images, Birthday, Constants3, CredentialType, UserGender, SignUpV2ErrorCodes, VerifiedSignupErrorCodes, UsernameIssue, IssueCondition, ExperienceService, GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled, GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled, GetFFlagAuthIntentLoggingForGameJoinEnabled, FFlagKoreaKISAUnderAgeNumber, GetFFlagCredProtocolRegisterPasswordOnSignup, t1, GetVerifiedSignupChallenge, GetFFlagEnableSignupBirthdayExperiments, FFlagSignupDisplayNameLogging

	do
		local AuthCommon

		do
			local UIBlox = require(CorePackages.Packages.UIBlox)

			Button = UIBlox.App.Button.Button
			ButtonType = UIBlox.App.Button.Enum.ButtonType
			Constants = UIBlox.App.Style.Constants
			withStyle = UIBlox.Style.withStyle
			withLocalization = require(Modules.LuaApp.withLocalization)
			withNavigationProps = require(CorePackages.Workspace.Packages.RobloxAppNavigation).withNavigationProps
			AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
			DisclaimerLinksVariant = AuthCommon.Enums.DisclaimerLinksVariant
			UnderAgeInteractiveAlert = require(Modules.LuaApp.Components.Authentication.UnderAgeInteractiveAlert)
			FitChildren = require(Modules.LuaApp.FitChildren)
			FitTextLabel = require(Modules.LuaApp.Components.FitTextLabel)
			FullscreenPageWithSafeArea = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
			AuthBirthdayBar = require(Modules.LuaApp.Components.Authentication.AuthBirthdayBar)
			AuditContentContext = AuthCommon.Stores.AuditContentContext.AuditContentContext
			CollapsingTextInputValidator = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
			SignUpGenderSelector = require(Modules.LuaApp.Components.Authentication.SignUpGenderSelector)
			TitleAndParagraph = require(Modules.LuaApp.Components.Authentication.TitleAndParagraph)
			DisclaimerLinks = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
			ContactInfoField = require(Modules.LuaApp.Components.Authentication.ContactInfoField)
			BirthdayField = require(Modules.LuaApp.Components.Authentication.Birthday.BirthdayField)
			BackgroundFill = AuthCommon.Components.BackgroundFill
			AccountLinkingAlertType = AuthCommon.Enums.AccountLinkingAlertType
			GetCredentialsAvailabilityStore = AuthCommon.Stores.GetCredentialsAvailabilityStore
			FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
			NavigateBack = require(Modules.LuaApp.Thunks.NavigateBack)
			SetBackNavigationDisabled = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
			useSignUpPageNavigationBindings = AuthCommon.Hooks.useSignUpPageNavigationBindings
			SetCentralOverlay = require(Modules.LuaApp.Actions.SetCentralOverlay)
			OverlayType = require(Modules.LuaApp.Enum.OverlayType)
			UsernameValidator = require(Modules.LuaApp.Thunks.Authentication.UsernameValidator)
			PasswordValidator = require(Modules.LuaApp.Thunks.Authentication.PasswordValidator)
			GetMetaDataFromShareLink = require(Modules.LuaApp.Thunks.Authentication.AuthIntent.GetMetaDataFromShareLink)
			ApiFetchAuthMetaData = require(Modules.LuaApp.Thunks.Authentication.AuthIntent.ApiFetchAuthMetaData)
			SignUpV2 = require(Modules.LuaApp.Thunks.Authentication.SignUpV2)
			FFlagEnableLuaAccountSwitch = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
			User = require(script.Parent.Parent.Parent.Thunks.Authentication.User)
			MemStorageService = game:GetService("MemStorageService")
			MemStorageKeys = require(Modules.LuaApp.Enum.MemStorageKeys)
			AppStorageUtilities = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
			OpenAccountSwitchingErrorOverlay = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay)
			CloseCentralOverlay = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
			LogoutAllLoggedInUsers = require(Modules.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers)
			ResetAppState = require(Modules.LuaApp.Thunks.Authentication.ResetAppState)
			Logout = require(Modules.LuaApp.Thunks.Authentication.Logout)
			FFlagEnableKoreaKISACompliance = require(Modules.LuaApp.Flags.FFlagEnableKoreaKISACompliance)
			FFlagBypassIXPKoreaCompliance = require(Modules.LuaApp.Flags.FFlagBypassIXPKoreaCompliance)
			FFlagBypassGUACKoreaCompliance = require(Modules.LuaApp.Flags.FFlagBypassGUACKoreaCompliance)
			OpenKISAPopUpAgreements = require(Modules.LuaApp.Thunks.Authentication.OpenKISAPopUpAgreements)
			KISAComplianceUtils = require(CorePackages.Workspace.Packages.AuthCompliance).KISAComplianceUtils
			AnalyticsEvents = require(CorePackages.Workspace.Packages.AuthCompliance).Analytics.AnalyticsEvents
			EventConstants = require(CorePackages.Workspace.Packages.AuthCompliance).Analytics.EventConstants
			OpenEmailOtp = require(Modules.LuaApp.Thunks.Authentication.OpenEmailOtp)
			ValidateCode = require(CorePackages.Workspace.Packages.OtpLogin).Thunks.ValidateCode
			Constants2 = require(CorePackages.Workspace.Packages.OtpLogin).Constants
			Promise = require(CorePackages.Packages.Promise)
			ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
			GetImageData = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
			Images = UIBlox.App.ImageSet.Images
			ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
		end

		Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday
		DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
		UsernameValidationContext = require(Modules.LuaApp.Enum.UsernameValidationContext)
		EventStreamConstants = require(Modules.LuaApp.EventStreamConstants)
		Constants3 = require(Modules.LuaApp.Constants)
		AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
		CredentialType = require(Modules.LuaApp.Components.Authentication.Enum.CredentialType)
		UserGender = require(Modules.LuaApp.Components.Authentication.Enum.UserGender)
		SignUpV2ErrorCodes = require(Modules.LuaApp.Components.Authentication.Enum.SignUpV2ErrorCodes)
		InputValidity = require(Modules.LuaApp.Components.Authentication.Enum.InputValidity)
		VerifiedSignupErrorCodes = require(Modules.LuaApp.Components.Authentication.Enum.VerifiedSignupErrorCodes)
		UsernameIssue = require(Modules.LuaApp.Components.Authentication.Enum.UsernameIssue)
		IssueCondition = require(Modules.LuaApp.Components.Authentication.Enum.IssueCondition)
		default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
		LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
		ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
		UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
		Foundation = require(CorePackages.Packages.Foundation)
		Checkbox = Foundation.Checkbox
		InputSize = Foundation.Enums.InputSize
		View = Foundation.View
		FoundationText = Foundation.Text
		useTokens = Foundation.Hooks.useTokens
		useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
		GetFFlagEnableTextFieldContentType = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType
		GetFFlagMinimalSignupAuthEnabled = require(Modules.LuaApp.Flags.GetFFlagMinimalSignupAuthEnabled)
		GetFFlagPasswordlessSignupAuthEnabled = require(Modules.LuaApp.Flags.GetFFlagPasswordlessSignupAuthEnabled)
		GetFFlagPasskeySignupEnabled = require(Modules.LuaApp.Flags.GetFFlagPasskeySignupEnabled)
		FFlagFoundationStylingOnSignUp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFoundationStylingOnSignUp
		GetFFlagAuthIntentLoggingAtSignupEnabled = require(Modules.LuaApp.Flags.GetFFlagAuthIntentLoggingAtSignupEnabled)
		GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled = require(Modules.LuaApp.Flags.GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled)
		GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled = require(Modules.LuaApp.Flags.GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled)
		GetFIntLuaLoginGenderSelector = require(Modules.LuaApp.Flags.GetFIntLuaLoginGenderSelector)
		GetFFlagAuthIntentLoggingForGameJoinEnabled = require(Modules.LuaApp.Flags.GetFFlagAuthIntentLoggingForGameJoinEnabled)
		GetFFlagIsAltAttemptLoggingAtSignup = require(Modules.LuaApp.Flags.GetFFlagIsAltAttemptLoggingAtSignup)
		FFlagKoreaKISAUnderAgeNumber = require(Modules.LuaApp.Flags.FFlagKoreaKISAUnderAgeNumber)
		GetFIntLuaAppCredentialsProtocolAvailableTimeout = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
		GetFFlagCredProtocolRegisterPasswordOnSignup = require(Modules.LuaApp.Flags.GetFFlagCredProtocolRegisterPasswordOnSignup)

		local v124 = game:DefineFastFlag("UsePackageFetchSignupUserAgreements", false)

		EngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
		SuggestionsFrame = require(Modules.LuaApp.Components.Authentication.SuggestionsFrame)
		UsernameSuggestor = require(Modules.LuaApp.Thunks.Authentication.UsernameSuggestor)
		t1 = {
			suggestionsShown = "usernameSuggestionsShown",
			suggestableInput = "suggestableUsernameInput",
			refreshButton = "usernameSuggestionRefreshButton"
		}
		AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
		OpenCentralOverlayForAgreeToPhoneNumberVerification = require(Modules.LuaApp.Thunks.Authentication.OpenCentralOverlayForAgreeToPhoneNumberVerification)
		OpenCentralOverlayForPhoneNumberVerification = require(Modules.LuaApp.Thunks.Authentication.OpenCentralOverlayForPhoneNumberVerification)
		GetVerifiedSignupChallenge = require(Modules.LuaApp.Thunks.Authentication.GetVerifiedSignupChallenge)
		SetNetworkingErrorToast = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
		ToastType = require(Modules.LuaApp.Enum.ToastType)
		SetCurrentToastMessage = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
		v136 = if not v124 then require(Modules.LuaApp.Http.Requests.FetchSignupUserAgreements) else require(CorePackages.Workspace.Packages.UserAgreements).FetchSignupUserAgreements
		reportEphemeralCounter = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
		UserAgreementsCounterNames = require(CorePackages.Workspace.Packages.UserAgreements).UserAgreementsCounterNames
		SignUpPageView = require(Modules.LuaApp.Components.Authentication.SignUpPageView)
		DisplayNameField = require(Modules.LuaApp.Components.Authentication.DisplayNameField)
		GetFFlagEnableSignupBirthdayExperiments = require(Modules.LuaApp.Flags.GetFFlagEnableSignupBirthdayExperiments)
		v142 = game:DefineFastFlag("DisplayNamesOnSignupExperiment_v3", false)
		v143 = game:DefineFastFlag("MoveCredentialsProtocolCheckToDidMount", false)
		v144 = game:DefineFastFlag("HideUsernameAutofillSignupExperiment", false)
		v145 = game:DefineFastFlag("EnableDisplayNamesOnSignupExperimentv1_Dev", false)
		v146 = game:DefineFastInt("DisplayNameEligabilityAgeYears", 17)
		v147 = game:DefineFastFlag("DisplayNamesDiagLogging", false)
		FFlagSignupDisplayNameLogging = require(Modules.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging)
		v149 = game:DefineFastFlag("DisablePasskeySignupForLuaDeepLinks", false)
		FFlagEnableAuthDeepLinkReceiver = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAuthDeepLinkReceiver
		PreAuthDeepLinkUrlStore = AuthCommon.Stores.PreAuthDeepLinkUrlStore
	end

	TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs

	local FFlagEnableVNGDUARSignupCompliance = require(Modules.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance)

	GetFFlagEnablePreferredInputForSignUp = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnablePreferredInputForSignUp
	FFlagEnableSignUpExitModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSignUpExitModal
	v156 = game:DefineFastFlag("FixSignUpConditionalHooks", false)
	FFlagHideBackButtonOnSignUpPage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagHideBackButtonOnSignUpPage

	local FFlagUseBirthdayDropdownForGamepad = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBirthdayDropdownForGamepad

	v159 = game:DefineFastFlag("SignUpPageThemeSwitchFix", false)
	v160 = game:DefineFastFlag("UseBreakpointOnSignUp", false)
	GetFFlagEnableAccountSwitcherFoundationDesign = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign
	GetFFlagEnableAccountSwitcherRedesignIXP = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP
	GetFFlagEnableAccountSwitcherIXPTextGatingFix = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherIXPTextGatingFix
	GetFFlagEnableAuditForSinglePageSignUp = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp
	FFlagEnableSignupFoundationalizeBackgroundAndText = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSignupFoundationalizeBackgroundAndText
	v166 = game:DefineFastFlag("UseLongFormSignupComplianceTextByDefault", false)
	uDim2 = UDim2.new(0, 36, 0, 36)
	v168 = Images["icons/navigation/close"]
	vector2 = Vector2.new(540, 1080)
	game:DefineFastFlag("LuaVerifiedSignup2", false)
	game:DefineFastFlag("LuaVerifiedSignupExperiment2", false)
	GetFFlagLuaAppSignUpPageRefactor = require(Modules.LuaApp.Flags.GetFFlagLuaAppSignUpPageRefactor)
	v171 = Roact.PureComponent:extend("SinglePageSignUp")

	function v171.init(p1) -- line: 264
		-- upvalues: GetCredentialsAvailabilityStore (copy), InputValidity (copy), UserGender (copy), Roact (copy), FFlagEnableLuaAccountSwitch (copy), User (copy), AppStorageUtilities (copy), MemStorageService (copy), MemStorageKeys (copy), LogoutAllLoggedInUsers (copy), AppStorageService (copy), LocalStorageKey (copy), GuiService (copy), v159 (copy), FFlagEnableVNGDUARSignupCompliance (copy), FFlagEnableKoreaKISACompliance (copy), FFlagBypassGUACKoreaCompliance (copy), FFlagBypassIXPKoreaCompliance (copy), AnalyticsEvents (copy), EventConstants (copy), KISAComplianceUtils (copy), Cryo (copy), GetFFlagMinimalSignupAuthEnabled (copy), GetFFlagPasswordlessSignupAuthEnabled (copy), GetFFlagPasskeySignupEnabled (copy), GetFFlagEnableSignupBirthdayExperiments (copy), v142 (copy), FFlagUseBirthdayDropdownForGamepad (copy), EventStreamConstants (copy), ArgCheck (copy), Birthday (copy), DateHelper (copy), t1 (copy), UsernameIssue (copy), IssueCondition (copy), FFlagSignupDisplayNameLogging (copy), GetVerifiedSignupChallenge (copy), CredentialType (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), v149 (copy), GetFFlagCredProtocolRegisterPasswordOnSignup (copy), VerifiedSignupErrorCodes (copy), SignUpV2ErrorCodes (copy), Constants3 (copy), AccountLinkingAlertType (copy), GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled (copy), GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled (copy), GetMetaDataFromShareLink (copy), HttpService (copy), GetFFlagAuthIntentLoggingForGameJoinEnabled (copy), ExperienceService (copy), v147 (copy), reportEphemeralCounter (copy), DisplayNameCounters (copy), UserAgreementsCounterNames (copy), FFlagKoreaKISAUnderAgeNumber (copy), v146 (copy), Constants2 (copy), ValidateCode (copy), Promise (copy), v143 (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy)
		local v179 = GetCredentialsAvailabilityStore(false)
		local v180 = v179.getFido2Available(false)
		local v181 = v179.getPasswordsAvailable(false)

		p1.state = {
			birthday = nil,
			shouldHideBirthdayEntry = false,
			username = "",
			displayName = "",
			password = "",
			birthdayValid = InputValidity.Unvalidated,
			usernameValid = InputValidity.Unvalidated,
			passwordValid = InputValidity.Unvalidated,
			displayNameValid = InputValidity.Unvalidated,
			isSignUpButtonEnabled = false,
			isSignUpInProgress = false,
			gender = UserGender.Unknown,
			onScreenKeyboardHeight = 0,
			isUsernameAnimating = false,
			isPasswordAnimating = false,
			birthdayFocused = false,
			contactMethod = "",
			emailInput = "",
			emailValid = false,
			phoneCountryCode = {},
			phoneInput = "",
			phoneValid = false,
			verifiedSignupVoucher = "",
			isCountryCodeSearchVisible = false,
			hidePassword = nil,
			agreements = {},
			passkeysAvailable = v180,
			isCredentialsProtocolRegisterPasswordAvailable = v181,
			pillClicked = false,
			issueCondition = nil,
			suggestionControlState = nil,
			loadingSuggestions = false,
			signUpError = false,
			shouldShowUnderAgeAlert = false,
			shouldShowVngTosAlert = false,
			showU13AccountSwitcherAlert = false,
			showParentAccountSwitcherAlert = false,
			hasSetIneligibleAgeAtLeastOnce = false,
			recommendedUsername = nil,
			hasEditedUsername = false,
			bypassDisplayNameField = false,
			isUsernameFocused = false,
			otpSessionToken = "",
			otpCode = "",
			signupAgreementsChecked = false
		}
		p1.backButtonRef = Roact.createRef()
		p1.isAlreadyAuthenticated = false

		if FFlagEnableLuaAccountSwitch == true then
			p1.isAlreadyAuthenticated = User.fromLocalStorage().userId ~= -1
		end

		function p1.resetDefaultTheme() -- line: 328
			-- upvalues: AppStorageUtilities (copy), MemStorageService (copy), MemStorageKeys (copy)
			local v271 = AppStorageUtilities.getAuthenticatedTheme()

			if v271 ~= "" then
				MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v271)
			end
		end
		function p1.logoutAllLoggedInUsersCallback() -- line: 336
			-- upvalues: p1 (copy), AppStorageUtilities (copy), User (copy), LogoutAllLoggedInUsers (copy), AppStorageService (copy), LocalStorageKey (copy), GuiService (copy)
			local networking = p1.props.networking
			local v273 = AppStorageUtilities.getAccountBlob()
			local v274 = User.fromLocalStorage().userId ~= -1

			p1:setState({
				signUpError = false,
				isSignUpButtonEnabled = false,
				isSignUpInProgress = false
			})
			LogoutAllLoggedInUsers(networking, v273):await()

			if v274 == true then
				p1.props.resetAppState()
				AppStorageService:SetItem(LocalStorageKey.CredentialValue, "")
				AppStorageService:Flush()
				p1.props.logoutWithoutShowConfirmation(networking, GuiService)
			end

			p1:setState({
				signUpError = false
			})
			p1.props.closeCentralOverlay()
		end
		function p1.closeOverlayAndDisableSwitcherErrors() -- line: 364
			-- upvalues: p1 (copy)
			p1.props.closeCentralOverlay()
		end
		function p1.onCloseButtonClicked() -- line: 368
			-- upvalues: v159 (copy), FFlagEnableLuaAccountSwitch (copy), p1 (copy)
			if not v159 and (FFlagEnableLuaAccountSwitch == true and p1.isAlreadyAuthenticated == true) then
				p1.resetDefaultTheme()
			end

			p1.props.navigateBack()
		end
		function p1.getShouldShowVNGAgreements() -- line: 380
			-- upvalues: p1 (copy)
			return p1.props.appPolicy.getUseVNGUserAgreementPopup()
		end
		function p1.getShouldBlockVNGU12SignUpOnClientSide() -- line: 384
			-- upvalues: p1 (copy)
			return p1.props.appPolicy.getBlockVNGU12SignUpOnClientSide()
		end
		function p1.getShouldUseAgeInput() -- line: 388
			-- upvalues: p1 (copy), FFlagEnableVNGDUARSignupCompliance (copy)
			return p1.props.appPolicy.getUseAgeInput() and FFlagEnableVNGDUARSignupCompliance
		end
		function p1.getShouldShowKISAAgreements() -- line: 392
			-- upvalues: FFlagEnableKoreaKISACompliance (copy), p1 (copy), FFlagBypassGUACKoreaCompliance (copy), FFlagBypassIXPKoreaCompliance (copy)
			return FFlagEnableKoreaKISACompliance and ((p1.props.appPolicy.getUseKoreaKISAUserAgreementPopup() or FFlagBypassGUACKoreaCompliance) and (p1.props.shouldShowKoreanKISASignUpFlow or FFlagBypassIXPKoreaCompliance))
		end
		function p1.getShouldAddParentalConsentAgreementId() -- line: 398
			-- upvalues: p1 (copy)
			return p1.props.appPolicy.getParentalConsentAgreementId()
		end
		function p1.getSignupCheckboxDisabled() -- line: 402
			-- upvalues: p1 (copy)
			return p1.props.appPolicy.getSignupCheckboxDisabled()
		end
		function p1.launchKISATermsOfService(p2, p3) -- line: 406
			-- upvalues: p1 (copy), AnalyticsEvents (copy), EventConstants (copy), KISAComplianceUtils (copy), Cryo (copy)
			local t2 = {
				agreements = p1.state.agreements,
				onAgreeFunction = function(p4) --[[ onAgreeFunction ]] -- line: 410
					-- upvalues: AnalyticsEvents (copy), EventConstants (copy), KISAComplianceUtils (copy), Cryo (copy), p2 (copy), p1 (copy), p3 (copy)
					AnalyticsEvents.sendButtonClickEvent(EventConstants.ctx.kisaAgreements, EventConstants.origin.signup, EventConstants.btn.agree)

					local v471 = KISAComplianceUtils.getAgreedUserAgreements(p4)
					local v472 = Cryo.Dictionary.join(p2, {
						agreementIds = v471
					})
					local v473 = p1.getShouldAddParentalConsentAgreementId()

					if p3 and (v473 and v473 ~= "") then
						table.insert(v472.agreementIds, v473)
					end

					p1.requestSignUp(v472)
				end,
				onAbandonFunction = p1.onAbandonKISASignUpFlow,
				isUnderAgeFlow = p3
			}

			p1.props.openKISAUserAgreements(t2)
		end
		function p1.getIsSignUpButtonEnabled() -- line: 435
			-- upvalues: p1 (copy), GetFFlagMinimalSignupAuthEnabled (copy), GetFFlagPasswordlessSignupAuthEnabled (copy), GetFFlagPasskeySignupEnabled (copy), GetFFlagEnableSignupBirthdayExperiments (copy), InputValidity (copy), v142 (copy), FFlagUseBirthdayDropdownForGamepad (copy)
			local birthday = p1.state.birthday
			local username = p1.state.username
			local password = p1.state.password
			local displayName = p1.state.displayName
			local birthdayValid = p1.state.birthdayValid
			local usernameValid = p1.state.usernameValid
			local passwordValid = p1.state.passwordValid
			local displayNameValid = p1.state.displayNameValid
			local validBirthday = p1.state.validBirthday
			local v287 = p1.props.shouldUseMinimalSignup and GetFFlagMinimalSignupAuthEnabled()
			local v288 = p1.props.shouldUsePasswordlessSignup and GetFFlagPasswordlessSignupAuthEnabled()

			if GetFFlagPasskeySignupEnabled() and (p1.props.shouldUsePasskeySignup and not p1.state.passkeysAvailable) then
				v288 = false
			end

			local v289 = GetFFlagEnableSignupBirthdayExperiments() and (p1.props.birthdayPickerVariant and p1.props.birthdayPickerVariant > 0)

			if not p1.getSignupCheckboxDisabled() and p1.props.shouldRequireSignupCheckbox and not p1.state.signupAgreementsChecked then
				return false
			end

			local v290 = usernameValid ~= InputValidity.Valid or (passwordValid ~= InputValidity.Valid or not not v289 and birthdayValid ~= InputValidity.Valid) or if not v142 or not p1.isDisplayNameFieldRequired() then nil else displayNameValid ~= InputValidity.Valid

			if FFlagUseBirthdayDropdownForGamepad and birthday and validBirthday == false then
				return false
			end

			if v287 and birthday then
				if v289 and birthdayValid ~= InputValidity.Valid then
					return false
				end

				return true
			end

			if v288 and birthday and username ~= "" and usernameValid == InputValidity.Valid then
				if v289 and birthdayValid ~= InputValidity.Valid then
					return false
				end

				return true
			end

			if not birthday or v290 or username == "" or password == "" or (v142 and (p1.isDisplayNameFieldRequired() and displayName == "") or nil) then
				return false
			end

			if validBirthday == false then
				return false
			end

			return true
		end
		function p1.updateState(p5) -- line: 520
			-- upvalues: p1 (copy)
			spawn(function() -- line: 521
				-- upvalues: p1 (copy), p5 (copy)
				if p1.isMounted then
					p1:setState(p5)
				end
			end)
		end
		function p1.getHidePassword() -- line: 531
			-- upvalues: p1 (copy)
			if p1.state.hidePassword == nil then
				return not p1.props.arePasswordFieldsPlaintext
			end

			return p1.state.hidePassword
		end
		function p1.passwordVisibilityToggleCallback() -- line: 538
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			local v292 = p1.getHidePassword()

			if v292 then
				p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.ShowPassword)
			else
				p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.HidePassword)
			end

			p1:setState({
				hidePassword = not v292
			})
		end
		function p1.onBirthdaySelected(p6, p7) -- line: 556
			-- upvalues: ArgCheck (copy), Birthday (copy), p1 (copy), EventStreamConstants (copy)
			ArgCheck.assert(Birthday.is(p6), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.")
			p1.updateState({
				birthday = p6,
				validBirthday = p7
			})

			if p1.useVerifiedSignup() then
				p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.ConfirmBirthday)
			end

			p1.updateSignUpFieldFilled()
		end
		function p1.onAgeChanged(p8) -- line: 577
			-- upvalues: p1 (copy), InputValidity (copy), Birthday (copy), DateHelper (copy)
			local num = tonumber(p8)

			if num == nil or num < 1 or num > 99 then
				p1.updateState({
					birthday = nil,
					birthdayValid = InputValidity.Invalid
				})

				return
			end

			local v297 = DateTime.now():ToLocalTime()
			local v298 = Birthday.new({
				Year = v297.Year - num,
				Month = v297.Month,
				Day = v297.Day
			})

			if v298.Month == 2 and v298.Day == 29 and not DateHelper:isLeapYear(v298.Year) then
				v298.Day = 28
			end

			if DateHelper:isValidDate(v298.Month, v298.Day, v298.Year) then
				p1.updateState({
					birthday = v298,
					birthdayValid = InputValidity.Valid
				})

				return
			end

			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidity.Invalid
			})
		end
		function p1.onAgeAndMonthChanged(p9, p10) -- line: 608
			-- upvalues: p1 (copy), InputValidity (copy), Birthday (copy), DateHelper (copy)
			if p9 == nil or (p9 < 1 or p9 > 99) then
				p1.updateState({
					birthday = nil,
					birthdayValid = InputValidity.Invalid
				})

				return
			end

			local v301 = DateTime.now():ToLocalTime().Year - p9
			local v302 = Birthday.new({
				Year = v301,
				Month = p10,
				Day = DateHelper:getLastDayOfTheMonthInYear(p10, v301)
			})

			if DateHelper:isValidDate(v302.Month, v302.Day, v302.Year) then
				p1.updateState({
					birthday = v302,
					birthdayValid = InputValidity.Valid
				})

				return
			end

			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidity.Invalid
			})
		end
		function p1.onMonthAndYearChanged(p11, p12) -- line: 636
			-- upvalues: p1 (copy), InputValidity (copy), Birthday (copy), DateHelper (copy)
			local v305 = DateTime.now():ToLocalTime()

			if p12 == nil or (p12 < v305.Year - 100 or p12 > v305.Year) then
				p1.updateState({
					birthday = nil,
					birthdayValid = InputValidity.Invalid
				})

				return
			end

			local v306 = Birthday.new({
				Year = p12,
				Month = p11,
				Day = DateHelper:getLastDayOfTheMonthInYear(p11, p12)
			})

			if DateHelper:isValidDate(v306.Month, v306.Day, v306.Year) then
				p1.updateState({
					birthday = v306,
					birthdayValid = InputValidity.Valid
				})

				return
			end

			p1.updateState({
				birthday = nil,
				birthdayValid = InputValidity.Invalid
			})
		end
		function p1.usernameSuggestionClicked(p13, p14) -- line: 664
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			p1.props.authEventAnalytics.reportUsernameSuggestionClicked(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.UsernameSuggestion, p13, p14)
		end
		function p1.logRefreshButtonClicked() -- line: 673
			-- upvalues: p1 (copy), EventStreamConstants (copy), t1 (copy)
			p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstants.Context.SinglePageSignUpScreen, t1.refreshButton)
		end
		function p1.usernameSuggestionsShown(p15, p16) -- line: 680
			-- upvalues: p1 (copy), EventStreamConstants (copy), t1 (copy)
			p1.props.authEventAnalytics.reportInteractWithActionAndSection(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Field.Username, EventStreamConstants.ActionType.Shown, t1.suggestionsShown, p15, p16)
		end
		function p1.logSuggestableUsername(p17) -- line: 691
			-- upvalues: p1 (copy), EventStreamConstants (copy), t1 (copy)
			p1.props.authEventAnalytics.reportInteractWithAction(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Field.Username, EventStreamConstants.ActionType.Shown, t1.suggestableInput, p17)
		end
		function p1.shouldSuggest() -- line: 701
			-- upvalues: p1 (copy), UsernameIssue (copy), IssueCondition (copy)
			local v312 = false
			local issueCondition = p1.state.issueCondition

			if issueCondition then
				v312 = issueCondition[UsernameIssue.AlreadyInUse] == IssueCondition.Problematic

				for k, v in pairs(issueCondition) do
					if k ~= UsernameIssue.AlreadyInUse and v == IssueCondition.Problematic then
						return false
					end
				end
			end

			return v312
		end
		function p1.onBirthdayFocused(p18) -- line: 716
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1:setState({
					birthdayFocused = p18
				})
			end
		end
		function p1.onUsernameTextChanged(p19, p20) -- line: 724
			-- upvalues: v142 (copy), p1 (copy)
			local v319 = nil

			if v142 and (p1.shouldShowDisplayNameField() and not p1.state.hasEditedUsername) then
				v319 = p19 ~= p1.state.recommendedUsername
			end

			p1.updateState({
				username = p19,
				usernameValid = p20,
				hasEditedUsername = if not v142 then nil else v319
			})

			if p1.shouldSuggest() then
				p1.logSuggestableUsername(p19)
			end

			p1.updateSignUpFieldFilled()
		end
		function p1.updateSignUpFieldFilled() -- line: 746
			-- upvalues: p1 (copy)
			if p1.props.signUpStarted == nil then
				return
			end

			local v320 = false

			if p1.state.username ~= "" or p1.state.password ~= "" or p1.state.birthday ~= nil then
				v320 = true
			end

			if v320 ~= p1.state.signUpStarted then
				p1.props.setSignUpStarted(v320)
			end
		end
		function p1.onDisplayNameTextChanged(p21, p22) -- line: 761
			-- upvalues: p1 (copy)
			p1.updateState({
				displayName = p21,
				displayNameValid = p22
			})
		end
		function p1.updateBypassDisplayNameField(b1: boolean) -- line: 768
			-- upvalues: p1 (copy)
			p1:setState({
				bypassDisplayNameField = b1
			})
		end
		function p1.onUsernameTextValidated(p23, p24) -- line: 774
			-- upvalues: p1 (copy), InputValidity (copy), EventStreamConstants (copy)
			p1.onUsernameTextChanged(p23, p24)

			if p24 == InputValidity.Valid then
				p1.props.authEventAnalytics.reportInteractWithAction(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Field.Username, EventStreamConstants.ActionType.Submit, p24, p23)
			end
		end
		function p1.onPasswordTextChanged(p25, p26) -- line: 787
			-- upvalues: p1 (copy)
			p1.updateState({
				password = p25,
				passwordValid = p26
			})
			p1.updateSignUpFieldFilled()
		end

		p1.cachedScrollCanvasPositionY = 0
		p1.cachedScrollCanvasInitialSizeY = 0

		local v182, v183 = Roact.createBinding(0)

		p1.scrollCanvasTargetPositionY = v182
		p1.updateScrollCanvasTargetPositionY = v183
		p1.scrollingFrameRef = Roact.createRef()
		p1.ageTextFieldRef = Roact.createRef()
		p1.usernameTextFieldRef = Roact.createRef()
		p1.displayNameTextFieldRef = if not v142 then nil else Roact.createRef()
		p1.passwordTextFieldRef = Roact.createRef()
		p1.passwordFrameRef = Roact.createRef()

		function p1.onDisplayNameTextChangeCompletedFromKeyboard() -- line: 807
			-- upvalues: p1 (copy), FFlagSignupDisplayNameLogging (copy), EventStreamConstants (copy)
			task.spawn(function() -- line: 808
				-- upvalues: p1 (copy), FFlagSignupDisplayNameLogging (copy), EventStreamConstants (copy)
				if p1.displayNameTextFieldRef.current then
					p1.displayNameTextFieldRef.current:ReleaseFocus()
				end

				task.defer(function() -- line: 813
					-- upvalues: p1 (copy)
					if p1.usernameTextFieldRef.current then
						p1.usernameTextFieldRef.current:CaptureFocus()
					end
				end)

				if FFlagSignupDisplayNameLogging then
					p1.props.authEventAnalytics.reportAuthButtonClick(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.DisplayNameNext, EventStreamConstants.State.KeyboardInput)
				end
			end)
		end
		function p1.onUsernameTextChangeCompletedFromKeyboard() -- line: 829
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			spawn(function() -- line: 830
				-- upvalues: p1 (copy), EventStreamConstants (copy)
				if p1.usernameTextFieldRef.current then
					p1.usernameTextFieldRef.current:ReleaseFocus()
				end

				if p1.passwordTextFieldRef.current then
					p1.passwordTextFieldRef.current:CaptureFocus()
				end

				p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.UsernameNext)
			end)
		end
		function p1.onPasswordTextChangeCompletedFromKeyboard() -- line: 845
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			spawn(function() -- line: 846
				-- upvalues: p1 (copy), EventStreamConstants (copy)
				if p1.passwordTextFieldRef.current then
					p1.passwordTextFieldRef.current:ReleaseFocus()
				end

				p1.props.authEventAnalytics.reportButtonClicked(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.PasswordNext)
			end)
		end
		function p1.cacheScrollCanvasInitialSizeIfNecessary() -- line: 860
			-- upvalues: p1 (copy)
			if p1.cachedScrollCanvasInitialSizeY == 0 then
				local currentParent = p1.scrollingFrameRef.current.Parent
				local CanvasSize = p1.scrollingFrameRef.current.CanvasSize
				local v330 = currentParent and currentParent.AbsoluteSize or Vector2.new(0, 0)

				p1.cachedScrollCanvasInitialSizeY = CanvasSize.Y.Scale * v330.Y + CanvasSize.Y.Offset
			end
		end
		function p1.agreeToPhoneNumberVerification() -- line: 870
			-- upvalues: p1 (copy), GetVerifiedSignupChallenge (copy)
			local agreeToPhoneNumberVerification = p1.props.agreeToPhoneNumberVerification
			local networking = p1.props.networking
			local v333 = p1.state.phoneCountryCode.prefix .. "," .. p1.state.phoneInput .. "," .. p1.state.phoneCountryCode.code

			agreeToPhoneNumberVerification(networking, function() -- line: 879
				-- upvalues: GetVerifiedSignupChallenge (copy), networking (copy), v333 (copy), p1 (copy)
				GetVerifiedSignupChallenge(networking, v333):andThen(function(p27) -- line: 880
					-- upvalues: p1 (copy), v333 (copy)
					local challenge = p27.challenge

					p1.verifyPhoneNumber(challenge, p1.state.phoneInput, v333)
				end, function(p28) -- line: 883
					-- upvalues: p1 (copy)
					if p28 == "Authentication.TwoStepVerification.Response.TooManyAttempts" or (p28 == "Authentication.SignUp.Response.PhoneNumberAlreadyLinked" or p28 == "Authentication.SignUp.Response.InvalidPhoneNumber") then
						p1.props.showErrorMessageToast(p28)

						return
					end

					p1.props.showErrorToast()
				end)
			end, p1.state.phoneInput)
		end
		function p1.onSignUpClick() -- line: 898
			-- upvalues: p1 (copy), CredentialType (copy)
			if p1.useVerifiedSignup() and p1.state.contactMethod == CredentialType.PhoneNumber then
				p1.agreeToPhoneNumberVerification()

				return
			end

			p1.onSignUpButtonActivated()
		end
		function p1.verifyPhoneNumber(p29, p30, p31) -- line: 906
			-- upvalues: p1 (copy)
			p1.props.verifyPhoneNumber(p1.props.networking, p1.verifyPhoneNumberCallback, p29, p30, p31, p1.useEmailOptionClickedCallback)
		end
		function p1.verifyPhoneNumberCallback(p32) -- line: 921
			-- upvalues: p1 (copy)
			p1.verifiedSignupVoucher = p32
			p1.onSignUpButtonActivated()
		end
		function p1.useEmailOptionClickedCallback() -- line: 926
			-- upvalues: p1 (copy), CredentialType (copy)
			p1:setState({
				contactMethod = CredentialType.Email
			})
		end
		function p1.phoneCountryCodeSelectorCallback(p33) -- line: 932
			-- upvalues: p1 (copy)
			p1:setState({
				isCountryCodeSearchVisible = p33
			})
		end
		function p1.onTextBoxFocused(vector2_2: Vector2) -- line: 940
			-- upvalues: p1 (copy)
			p1.cacheScrollCanvasInitialSizeIfNecessary()

			local v340 = math.clamp(p1.scrollingFrameRef.current.CanvasPosition.Y, 0, p1.cachedScrollCanvasInitialSizeY)

			if p1.isMounted then
				local v341 = vector2_2.Y - p1.scrollingFrameRef.current.absolutePosition.Y + v340

				p1.updateScrollCanvasTargetPositionY(v341)
			end
		end
		function p1.onTextBoxFocusLost() -- line: 951
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1.updateScrollCanvasTargetPositionY(0)
			end
		end
		function p1.onUsernameTextBoxFocusLost() -- line: 957
			-- upvalues: p1 (copy)
			p1.onTextBoxFocusLost()
			p1.updateState({
				isUsernameFocused = false
			})
		end
		function p1.onAnimationStateChangeCallback(p34, p35) -- line: 967
			-- upvalues: p1 (copy)
			if p34 == Enum.TextInputType.Password then
				p1:setState({
					isPasswordAnimating = p35
				})

				return
			end

			p1:setState({
				isUsernameAnimating = p35
			})
		end
		function p1.onFocusedTextBoxPositionChanged(p36) -- line: 981
			-- upvalues: p1 (copy)
			if p1.state.isUsernameAnimating or p1.state.isPasswordAnimating then
				p1.onTextBoxFocused(p36)
			end
		end
		function p1.getScrollingFrameCanvasPosition(p37) -- line: 990
			-- upvalues: p1 (copy)
			if p37 > 0 then
				return Vector2.new(0, p37)
			end

			if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
				return p1.scrollingFrameRef.current.CanvasPosition
			end

			return Vector2.new(0, 0)
		end
		function p1.onUsernameTextBoxFocused(p38) -- line: 1002
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			p1:setState({
				isUsernameFocused = true
			})
			p1.props.authEventAnalytics.reportUsernameFocus(EventStreamConstants.Context.SinglePageSignUpScreen)
			p1.onTextBoxFocused(p38)
		end
		function p1.onDisplayNameTextBoxFocused(p39) -- line: 1012
			-- upvalues: FFlagSignupDisplayNameLogging (copy), p1 (copy), EventStreamConstants (copy)
			if FFlagSignupDisplayNameLogging then
				p1.props.authEventAnalytics.reportDisplayNameFocus(EventStreamConstants.Context.SinglePageSignUpScreen)
			end

			p1.onTextBoxFocused(p39)
		end
		function p1.onPasswordTextBoxFocused(p40) -- line: 1020
			-- upvalues: p1 (copy), EventStreamConstants (copy)
			p1.props.authEventAnalytics.reportPasswordFocus(EventStreamConstants.Context.SinglePageSignUpScreen)
			p1.onTextBoxFocused(p40)
		end
		function p1.updateIsSignUpInProgress(p41) -- line: 1025
			-- upvalues: p1 (copy)
			spawn(function() -- line: 1026
				-- upvalues: p1 (copy), p41 (copy)
				if p1.isMounted then
					p1:setState({
						isSignUpInProgress = p41
					})
				end
			end)
		end
		function p1.requestSignUp(p42, p43) -- line: 1035
			-- upvalues: p1 (copy), CredentialType (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), v149 (copy), GetFFlagPasskeySignupEnabled (copy), GetFFlagCredProtocolRegisterPasswordOnSignup (copy), VerifiedSignupErrorCodes (copy), SignUpV2ErrorCodes (copy), FFlagEnableLuaAccountSwitch (copy), Constants3 (copy), AccountLinkingAlertType (copy)
			local networking = p1.props.networking
			local guiService = p1.props.guiService
			local analytics = p1.props.analytics
			local appPolicy = p1.props.appPolicy
			local omniRecommendationsRequest = p1.props.omniRecommendationsRequest
			local authEventAnalytics = p1.props.authEventAnalytics
			local signUp = p1.props.signUp
			local setBackNavigationDisabled = p1.props.setBackNavigationDisabled
			local v360 = p1.useVerifiedSignup() and p1.state.contactMethod == CredentialType.PhoneNumber
			local v361 = if not FFlagEnableAuthDeepLinkReceiver then LinkingProtocol:getLastLuaURL() else PreAuthDeepLinkUrlStore.getUrl()
			local v362 = v149 and (v361 ~= nil and v361 ~= "")
			local v363 = not p1.state.passkeysAvailable or v362
			local v364 = GetFFlagPasskeySignupEnabled()

			signUp(networking, omniRecommendationsRequest, guiService, function(p44, p45) -- line: 1046
				-- upvalues: setBackNavigationDisabled (copy), p1 (copy), p42 (copy)
				if p44 then
					setBackNavigationDisabled(true)
					p1.requestSignUp(p42, p45)

					return
				end

				p1.updateIsSignUpInProgress(false)
			end, p43, analytics, appPolicy, p42, v360, p1.props.shouldUsePasskeySignup and (v364 and (game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v363)), p1.props.shouldAutomaticallyPromptForPasskey, GetFFlagCredProtocolRegisterPasswordOnSignup() and p1.state.isCredentialsProtocolRegisterPasswordAvailable, authEventAnalytics, p1.props.isIosAuthServiceEnabled):andThen(function() -- line: 1100
				-- upvalues: setBackNavigationDisabled (copy)
				setBackNavigationDisabled(false)
			end, function(p46) -- line: 1104
				-- upvalues: setBackNavigationDisabled (copy), v360 (copy), VerifiedSignupErrorCodes (copy), p1 (copy), SignUpV2ErrorCodes (copy), FFlagEnableLuaAccountSwitch (copy), Constants3 (copy), AccountLinkingAlertType (copy)
				setBackNavigationDisabled(false)

				if v360 then
					if p46 ~= VerifiedSignupErrorCodes.Captcha then
						p1.updateIsSignUpInProgress(false)
						p1:setState({
							signUpError = true
						})
					end
				else
					if p46 ~= SignUpV2ErrorCodes.Captcha then
						p1.updateIsSignUpInProgress(false)
						p1:setState({
							signUpError = true
						})
					end

					if p46 == SignUpV2ErrorCodes.VNGAgeUnder12 then
						p1:setState({
							shouldShowUnderAgeAlert = true
						})
					end

					if FFlagEnableLuaAccountSwitch == true and p46 == SignUpV2ErrorCodes.EmptyAccountSwitchBlobRequired then
						p1.props.openAccountSwitchingErrorOverlay(not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Header.LogoutAllAccounts" or "Authentication.AccountSwitch.Header.SignOutOtherAccounts", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Description.LogoutConfirmation" or "Authentication.AccountSwitch.Description.ContinueSignOutOthers", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Action.LogoutAllAccounts" or "Authentication.AccountSwitch.Action.Continue", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, Constants3.Auth.AccountSwitcherSignupEmptyBlobRequiredError, p1.state.username)
						p1:setState({
							signUpError = false
						})
					end

					if FFlagEnableLuaAccountSwitch == true and p46 == SignUpV2ErrorCodes.ParentEmptyAccountSwitchBlobRequired then
						p1.props.openAccountSwitchingErrorOverlay(not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Header.LogoutAllAccounts" or "Authentication.AccountSwitch.Header.SignOutOtherAccounts", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Description.ParentLogoutConfirmation" or "Authentication.AccountSwitch.Description.ContinueSignOutOthers", not p1.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Action.LogoutAllAccounts" or "Authentication.AccountSwitch.Action.Continue", "Authentication.CrossDevice.Action.CancelLogin", p1.logoutAllLoggedInUsersCallback, p1.props.closeCentralOverlay, Constants3.Auth.AccountSwitcherParentSignupEmptyBlobRequiredError, p1.state.username)
						p1:setState({
							signUpError = false
						})
					end
				end

				if p46 == SignUpV2ErrorCodes.AccountLinkingRequired then
					p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInAlreadyLinked)

					return
				end

				if p46 == SignUpV2ErrorCodes.AccountLinkingFailed then
					p1.props.showAccountLinkingAlert(AccountLinkingAlertType.RetryLogInGenericError)
				end
			end)
		end
		function p1.onSignUpButtonActivated() -- line: 1190
			-- upvalues: p1 (copy), EventStreamConstants (copy), GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled (copy), GetMetaDataFromShareLink (copy), HttpService (copy), GetFFlagAuthIntentLoggingForGameJoinEnabled (copy), ExperienceService (copy), v147 (copy), reportEphemeralCounter (copy), DisplayNameCounters (copy), v142 (copy), CredentialType (copy), UserAgreementsCounterNames (copy), FFlagKoreaKISAUnderAgeNumber (copy)
			local setBackNavigationDisabled = p1.props.setBackNavigationDisabled
			local birthday = p1.state.birthday
			local username = p1.state.username
			local password = p1.state.password
			local gender = p1.state.gender
			local v370 = p1.getIsSignUpButtonEnabled()
			local locale = p1.locale
			local emailInput = p1.state.emailInput

			if v370 then
				p1.props.authEventAnalytics.reportSignUpButtonClicked(EventStreamConstants.Context.SinglePageSignUpScreen)

				if p1.getShouldBlockVNGU12SignUpOnClientSide() then
					local v373 = p1.getUserAge()

					if v373 == nil or v373 < 12 then
						p1:setState({
							shouldShowUnderAgeAlert = true
						})

						return
					end
				end

				if GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled() then
					local v374 = if not FFlagEnableAuthDeepLinkReceiver then LinkingProtocol:getLastLuaURL() else PreAuthDeepLinkUrlStore.getUrl()
					local s1 = ""

					if GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled() and v374 and string.find(v374, "share") then
						local v376, v377, v378 = v374:match("code=(.-)&type=(.-)&stamp=(.*)")

						if not v378 then
							v376, v377 = v374:match("code=(.-)&type=(.*)")
						end

						if v376 and v377 then
							GetMetaDataFromShareLink(p1.props.networking, v376, v377):andThen(function(p47) -- line: 1241
								-- upvalues: s1 (ref), HttpService (copy)
								if p47 and p47 ~= nil then
									s1 = HttpService:JSONEncode(p47)
								end
							end, function(p48) -- line: 1245
								warn("Error fetching share link metadata: ", p48)
							end):await()
						end
					elseif GetFFlagAuthIntentLoggingForGameJoinEnabled() then
						local PendingJoinAttempt = ExperienceService:GetPendingJoinAttempt()

						if PendingJoinAttempt and PendingJoinAttempt ~= nil then
							s1 = HttpService:JSONEncode(PendingJoinAttempt)
						end
					end

					p1.props.authEventAnalytics.reportAuthButtonClick(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Button.SignUp, s1, v374, p1.isAltAttempt)
				end

				if v147 and p1.props.shouldSeeDisplayNamesOnSignup then
					if username == p1.state.recommendedUsername then
						reportEphemeralCounter(DisplayNameCounters.SignUpWithRecommendedUsernames, 1)
					elseif p1.state.hasEditedUsername then
						reportEphemeralCounter(DisplayNameCounters.SignUpWithEditedUsernames, 1)
					end

					if p1.state.bypassDisplayNameField then
						reportEphemeralCounter(DisplayNameCounters.SignupBypassingDisplayNames, 1)
					end
				end

				p1.updateIsSignUpInProgress(true)
				setBackNavigationDisabled(true)
				p1:setState({
					signUpError = false
				})

				local t3 = {
					birthday = birthday and birthday:FormatForEndpoint() or "",
					username = username,
					password = password,
					displayName = if not v142 or not p1.isDisplayNameFieldRequired() then nil else p1.state.displayName,
					gender = gender,
					locale = locale,
					capturedAuditContent = p1.props.capturedAuditContent,
					additionalAuditContent = p1.props.additionalAuditContent
				}
				local v381 = p1.useVerifiedSignup()

				if v381 and p1.state.contactMethod == CredentialType.Email then
					t3.email = emailInput
				elseif v381 and p1.state.contactMethod == CredentialType.PhoneNumber then
					t3.verifiedSignupVoucher = p1.verifiedSignupVoucher
				end

				if p1.props.appPolicy.getAddUserAgreementIdsToSignupRequest() then
					local agreements = p1.state.agreements

					if #agreements > 0 then
						local t4 = {}

						for _, v in ipairs(agreements) do
							table.insert(t4, v.id)
						end

						t3.agreementIds = t4
					else
						reportEphemeralCounter(UserAgreementsCounterNames.AgreementsIdsEmptyOnSignup, 1)
					end
				end

				if p1.getShouldShowVNGAgreements() then
					p1.props.showVNGUserAgreementsPopup(p1.state.agreements, function(p49) -- line: 1316
						-- upvalues: t3 (copy), p1 (copy)
						local v484 = t3
						local t5 = {}

						for _, v in ipairs(p49) do
							table.insert(t5, v.id)
						end

						v484.agreementIds = t5
						p1.requestSignUp(t3)
					end, function() -- line: 1319
						-- upvalues: p1 (copy), setBackNavigationDisabled (copy)
						p1.updateIsSignUpInProgress(false)
						setBackNavigationDisabled(false)
					end)

					return
				end

				if p1.getShouldShowKISAAgreements() then
					local v386 = p1.getUserAge()

					if v386 and v386 < FFlagKoreaKISAUnderAgeNumber then
						p1.launchParentSignUpOtp(t3)

						return
					end

					p1.launchKISATermsOfService(t3, false)

					return
				end

				p1.requestSignUp(t3)
			end
		end
		function p1.onGenderChanged(p50) -- line: 1338
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1.updateState({
					gender = p50
				})
			end
		end
		function p1.validUsernameEntered(_) -- line: 1346
			-- upvalues: p1 (copy), InputValidity (copy)
			return p1.state.username ~= "" and p1.state.usernameValid ~= InputValidity.Invalid
		end
		function p1.validPasswordEntered() -- line: 1350
			-- upvalues: p1 (copy), InputValidity (copy)
			return p1.state.password ~= "" and p1.state.passwordValid ~= InputValidity.Invalid
		end
		function p1.useVerifiedSignup() -- line: 1354
			-- upvalues: p1 (copy), GuiService (copy)
			return game:GetFastFlag("LuaVerifiedSignup2") or game:GetFastFlag("LuaVerifiedSignupExperiment2") and (p1.props.useVerifiedSignupPage and not GuiService:IsTenFootInterface())
		end
		function p1.useUsernameSuggestions() -- line: 1361
			-- upvalues: p1 (copy)
			return p1.props.shouldUseUsernameSuggestions
		end
		function p1.useRefreshButton() -- line: 1365
			-- upvalues: p1 (copy)
			return p1.props.enableRefreshButton
		end
		function p1.getBirthdayVariant() -- line: 1369
			-- upvalues: p1 (copy), GetFFlagEnableSignupBirthdayExperiments (copy)
			if p1.getShouldUseAgeInput() then
				return 1
			end

			if GetFFlagEnableSignupBirthdayExperiments() and p1.props.birthdayPickerVariant ~= nil then
				return p1.props.birthdayPickerVariant
			end

			return 0
		end
		function p1.SetContactMethod(p52) -- line: 1379
			-- upvalues: p1 (copy)
			p1.updateState({
				contactMethod = p52
			})
		end
		function p1.SetPhoneNumber(p53, p54, p55) -- line: 1385
			-- upvalues: p1 (copy)
			p1.updateState({
				phoneCountryCode = p53,
				phoneInput = p54,
				phoneValid = p55
			})
		end
		function p1.SetEmail(p56, p57) -- line: 1393
			-- upvalues: p1 (copy)
			p1.updateState({
				emailInput = p56,
				emailValid = p57
			})
		end
		function p1.updatePillClicked() -- line: 1401
			-- upvalues: p1 (copy)
			p1.updateState({
				pillClicked = true
			})
		end
		function p1.resetPillClicked() -- line: 1407
			-- upvalues: p1 (copy)
			p1.updateState({
				pillClicked = false
			})
		end
		function p1.updateIssueCondition(p58) -- line: 1413
			-- upvalues: p1 (copy)
			p1.updateState({
				issueCondition = p58
			})
		end
		function p1.updateSuggestionControlState(_, p60) -- line: 1419
			-- upvalues: p1 (copy)
			p1.updateState({
				suggestionControlState = p60
			})
		end
		function p1.loadSuggestions() -- line: 1425
			-- upvalues: p1 (copy)
			p1.updateState({
				loadingSuggestions = true
			})
		end
		function p1.finishSuggestions() -- line: 1429
			-- upvalues: p1 (copy)
			p1.updateState({
				loadingSuggestions = false
			})
		end
		function p1.onSignUpContentFrameCanvasSizeChange(_) -- line: 1433
			-- upvalues: p1 (copy)
			local v399 = p1.scrollCanvasTargetPositionY:getValue()

			p1.scrollingFrameRef.current.CanvasPosition = p1.getScrollingFrameCanvasPosition(v399)
		end
		function p1.getUserAge() -- line: 1438
			-- upvalues: p1 (copy)
			if p1.state.birthday then
				return p1.state.birthday:GetAgeInYears()
			end

			return nil
		end
		function p1.getUsernamePlaceholder(t6: {[any]: any}) -- line: 1446
			-- upvalues: p1 (copy), v146 (copy)
			if p1.props.shouldSeeDisplayNamesOnSignup then
				if not p1.state.birthday then
					return ""
				end

				if p1.getUserAge() >= v146 and not p1.state.hasSetIneligibleAgeAtLeastOnce then
					return t6.agedUpUsernamePlaceholder
				end

				return t6.usernamePlaceholder
			end

			return t6.usernamePlaceholder
		end
		function p1.shouldShowUsernameField() -- line: 1470
			-- upvalues: p1 (copy), v146 (copy)
			if p1.props.shouldSeeDisplayNamesOnSignup then
				if not p1.state.birthday or p1.getUserAge() < v146 or p1.state.hasSetIneligibleAgeAtLeastOnce then
					return true
				end

				return p1.state.recommendedUsername ~= nil
			end

			return true
		end
		function p1.shouldShowDisplayNameField() -- line: 1486
			-- upvalues: p1 (copy), v146 (copy)
			return p1.props.shouldSeeDisplayNamesOnSignup and (p1.state.birthday and (p1.getUserAge() >= v146 and not p1.state.hasSetIneligibleAgeAtLeastOnce))
		end
		function p1.isDisplayNameFieldRequired() -- line: 1493
			-- upvalues: p1 (copy)
			return p1.shouldShowDisplayNameField() and not p1.state.bypassDisplayNameField
		end
		function p1.isValidDisplayNameEntered() -- line: 1497
			-- upvalues: p1 (copy), InputValidity (copy)
			return p1.state.displayName ~= "" and p1.state.displayNameValid ~= InputValidity.Invalid
		end
		function p1.setUsernameRecommendation(s2: string) -- line: 1501
			-- upvalues: p1 (copy)
			p1:setState(function(p62) -- line: 1502
				-- upvalues: s2 (copy)
				return {
					recommendedUsername = if p62.recommendedUsername == nil or s2 ~= "" then s2 else nil
				}
			end)
		end
		function p1.getUsernameGuidanceText(t7: {[any]: any}) -- line: 1512
			-- upvalues: p1 (copy)
			if p1.shouldShowDisplayNameField() and (p1.state.recommendedUsername ~= "" and p1.state.recommendedUsername ~= nil and not p1.state.hasEditedUsername and not p1.state.isUsernameFocused) then
				return t7.autogeneratedUsernameGuidance
			end

			return nil
		end
		function p1.validateOtpCode(p63, p64, p65) -- line: 1524
			-- upvalues: p1 (copy), Constants2 (copy), ValidateCode (copy), Promise (copy)
			p1.state.otpSessionToken = p63
			p1.state.otpCode = p64

			local networking = p1.props.networking
			local t8 = {
				origin = Constants2.otpServiceOriginSignup,
				contactType = Constants2.otpServiceContactType,
				passCode = p1.state.otpCode,
				otpSessionToken = p1.state.otpSessionToken
			}
			local t9 = {
				otpSessionToken = tostring(p1.state.otpSessionToken),
				otpContactType = Constants2.otpServiceContactType
			}

			return ValidateCode(networking, t8)():andThen(function(_) -- line: 1544
				-- upvalues: p1 (copy), p65 (copy), t9 (copy)
				p1.props.closeCentralOverlay()
				p65.otpSession = t9
				p1.launchKISATermsOfService(p65, true)
			end):catch(function(p67) -- line: 1549
				-- upvalues: Promise (copy)
				return Promise.reject(p67)
			end)
		end
		function p1.onAbandonKISASignUpFlow() -- line: 1554
			-- upvalues: AnalyticsEvents (copy), EventConstants (copy), p1 (copy)
			AnalyticsEvents.sendButtonClickEvent(EventConstants.ctx.kisaAgreements, EventConstants.origin.signup, EventConstants.btn.cancel)
			p1.updateIsSignUpInProgress(false)
		end
		function p1.launchParentSignUpOtp(p68) -- line: 1564
			-- upvalues: Constants2 (copy), p1 (copy)
			local t10 = {
				origin = Constants2.otpServiceOriginSignup,
				codeLength = 6,
				enterEmailTitleKey = Constants2.translationKeys.parentEmailTitleKey,
				enterEmailDescriptionKey = Constants2.translationKeys.sendParentVerificationCodeKey,
				enterCodeTitleKey = Constants2.translationKeys.oneTimeCodeTitleKey,
				enterCodeDescriptionKey = Constants2.translationKeys.oneTimeCodeHelpDescriptionKey,
				complianceCheckboxMessageKey = Constants2.translationKeys.parentalConsentModalDescriptionKey,
				onSubmitCode = function(p69, p70) --[[ onSubmitCode ]] -- line: 1575
					-- upvalues: p1 (copy), p68 (copy)
					return p1.validateOtpCode(p69, p70, p68)
				end,
				onModalAbandoned = p1.onAbandonKISASignUpFlow,
				screenSize = p1.props.screenSize
			}

			p1.props.openEmailOtp(t10)
		end

		if not v143 then
			default:isAvailable(default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p71) -- line: 1588
				-- upvalues: p1 (copy), EventStreamConstants (copy)
				local v412 = p71.isAvailable or false
				local v413 = false

				if p71.password and p71.password.isAvailable then
					v413 = true
				end

				if p1.isMounted then
					p1:setState({
						passkeysAvailable = v412,
						isCredentialsProtocolRegisterPasswordAvailable = v413
					})
				end

				p1.props.authEventAnalytics.reportAuthPageload(EventStreamConstants.Context.PasskeySignup, (tostring(v412)))
				p1.props.authEventAnalytics.reportAuthPageload(EventStreamConstants.Context.CMPasswordSignup, (tostring(v413)))
			end):catch(function(p72) -- line: 1614
				warn("Error checking for available credential types. Error: ", p72)
			end)
		end

		p1.isMounted = false
	end
end

function v171.didMount(p73) -- line: 1622
	-- upvalues: v143 (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), EventStreamConstants (copy), v159 (copy), FFlagEnableLuaAccountSwitch (copy), MemStorageService (copy), MemStorageKeys (copy), UserInputService (copy), reportEphemeralCounter (copy), UserAgreementsCounterNames (copy), v136 (copy), TelemetryConfigs (copy), GetFFlagAuthIntentLoggingAtSignupEnabled (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), GetFFlagIsAltAttemptLoggingAtSignup (copy), ApiFetchAuthMetaData (copy)
	p73.isMounted = true
	p73.isAltAttempt = nil

	if v143 then
		default:isAvailable(default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p74) -- line: 1629
			-- upvalues: p73 (copy), EventStreamConstants (copy)
			local v416 = p74.isAvailable or false
			local v417 = false

			if p74.password and p74.password.isAvailable then
				v417 = true
			end

			if p73.isMounted then
				p73:setState({
					passkeysAvailable = v416,
					isCredentialsProtocolRegisterPasswordAvailable = v417
				})
			end

			p73.props.authEventAnalytics.reportAuthPageload(EventStreamConstants.Context.PasskeySignup, (tostring(v416)))
			p73.props.authEventAnalytics.reportAuthPageload(EventStreamConstants.Context.CMPasswordSignup, (tostring(v417)))
		end):catch(function(p75) -- line: 1655
			warn("Error checking for available credential types. Error: ", p75)
		end)
	end

	if not v159 and FFlagEnableLuaAccountSwitch == true and p73.isAlreadyAuthenticated == true then
		MemStorageService:Fire(MemStorageKeys.ThemeUpdate, "dark")
	end

	p73.keyboardVisibleChanged = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() -- line: 1672
		-- upvalues: UserInputService (copy), p73 (copy)
		local v419 = UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0

		p73:setState({
			onScreenKeyboardHeight = v419
		})
	end)

	local v185 = p73.props.appPolicy.getAddUserAgreementIdsToSignupRequest()
	local v186 = p73.getShouldShowVNGAgreements()
	local v187 = p73.getShouldShowKISAAgreements()

	if v185 or v186 or v187 then
		v136(p73.props.networking, p73.props.analytics):andThen(function(p76) -- line: 1685
			-- upvalues: reportEphemeralCounter (copy), UserAgreementsCounterNames (copy), p73 (copy)
			if not p76 then
				reportEphemeralCounter(UserAgreementsCounterNames.FetchAgreementsHttpRequestFailureOnSignup, 1)

				return
			end

			if #p76 > 0 then
				p73.updateState({
					agreements = p76
				})

				return
			end

			reportEphemeralCounter(UserAgreementsCounterNames.FetchAgreementsEmptyResponseOnSignup, 1)
		end, function() -- line: 1702
		end)
	end

	p73.props.authEventAnalytics.reportScreenLoaded(EventStreamConstants.Context.SinglePageSignUpScreen)
	p73.props.loggingProtocol:logEventOnce("signup_page_did_mount")
	p73.props.loggingProtocol:logRobloxTelemetryCounter(TelemetryConfigs.SignupPageMountTelemetryConfig, 1, {
		version = 1
	})

	if GetFFlagAuthIntentLoggingAtSignupEnabled() then
		local v188 = if not FFlagEnableAuthDeepLinkReceiver then LinkingProtocol:getLastLuaURL() else PreAuthDeepLinkUrlStore.getUrl()

		if GetFFlagIsAltAttemptLoggingAtSignup() then
			ApiFetchAuthMetaData(p73.props.networking):andThen(function(p77) -- line: 1720
				-- upvalues: p73 (copy), EventStreamConstants (copy), v188 (copy)
				if p77 and p77.IsAltBrowserTracker ~= nil then
					p73.isAltAttempt = p77.IsAltBrowserTracker
					p73.props.authEventAnalytics.reportAuthPageload(EventStreamConstants.Context.SinglePageSignUpScreen, v188, p73.isAltAttempt)
				end
			end, function(_) -- line: 1729
				-- upvalues: p73 (copy), EventStreamConstants (copy), v188 (copy)
				warn("Error auth metadata: ", error)
				p73.props.authEventAnalytics.reportAuthPageload(EventStreamConstants.Context.SinglePageSignUpScreen, v188, p73.isAltAttempt)
			end)
		else
			p73.props.authEventAnalytics.reportAuthPageload(EventStreamConstants.Context.SinglePageSignUpScreen, v188, p73.isAltAttempt)
		end
	end

	if p73.props.focusedGuiObject and p73.backButtonRef and p73.backButtonRef.current then
		p73.props.focusGuiObject(p73.backButtonRef.current)
	end
end
function v171.willUnmount(p79) -- line: 1751
	-- upvalues: FFlagEnableLuaAccountSwitch (copy)
	p79.isMounted = false
	p79.isAltAttempt = nil

	if FFlagEnableLuaAccountSwitch == true and p79.isAlreadyAuthenticated == true then
		p79.resetDefaultTheme()
	end

	if p79.keyboardVisibleChanged then
		p79.keyboardVisibleChanged:disconnect()
		p79.keyboardVisibleChanged = nil
	end
end
function v171.didUpdate(p80, _, p82) -- line: 1765
	-- upvalues: v142 (copy), v146 (copy), v147 (copy), reportEphemeralCounter (copy), DisplayNameCounters (copy)
	if p80.props.focusedGuiObject and (p80.props.birthdayContainerRef.current and p80.props.focusedGuiObject:IsDescendantOf(p80.props.birthdayContainerRef.current)) then
		p80.updateScrollCanvasTargetPositionY(10)
	else
		p80.updateScrollCanvasTargetPositionY(0)
	end

	if v142 and p80.state.birthday ~= nil and not p80.state.hasSetIneligibleAgeAtLeastOnce and p80.getUserAge() < v146 then
		p80:setState({
			hasSetIneligibleAgeAtLeastOnce = true
		})
	end

	if v147 and p80.props.shouldSeeDisplayNamesOnSignup then
		if p80.state.recommendedUsername ~= "" and p80.state.hasEditedUsername and p80.state.hasEditedUsername ~= p82.hasEditedUsername then
			reportEphemeralCounter(DisplayNameCounters.ReccomendedNameEdited, 1)
		end

		if p80.state.recommendedUsername ~= nil and p80.state.recommendedUsername ~= "" and p80.state.hasEditedUsername == true and p80.state.username == "" and p82.username ~= "" and p80.props.shouldSeeDisplayNamesOnSignup then
			reportEphemeralCounter(DisplayNameCounters.ReccomendedNameManuallyCleared, 1)
		end

		if p80.state.birthday ~= nil and p82.birthday ~= nil and p80.state.birthday ~= p82.birthday then
			if p80.getUserAge() >= v146 and p82.birthday:GetAgeInYears() < v146 then
				reportEphemeralCounter(DisplayNameCounters.BirthdayChangedToAboveDisplayAge, 1)
			end

			if p80.getUserAge() < v146 and p82.birthday:GetAgeInYears() >= v146 then
				reportEphemeralCounter(DisplayNameCounters.BirthdayChangedToAboveDisplayAge, 1)
			end
		end
	end
end
function v171.render(p83) -- line: 1827
	-- upvalues: v159 (copy), FFlagEnableLuaAccountSwitch (copy), Roact (copy), UiModeStyleProvider (copy), Constants (copy), GetFFlagLuaAppSignUpPageRefactor (copy)
	if v159 and (FFlagEnableLuaAccountSwitch and p83.isAlreadyAuthenticated) then
		return Roact.createElement(UiModeStyleProvider, {
			style = {
				themeName = Constants.ThemeName.Dark,
				fontName = Constants.FontName.Gotham
			}
		}, {
			Child = if not GetFFlagLuaAppSignUpPageRefactor() then p83:renderDeprecated() else p83:renderWithView()
		})
	end

	if GetFFlagLuaAppSignUpPageRefactor() then
		return p83:renderWithView()
	end

	return p83:renderDeprecated()
end
function v171.renderWithView(p84) -- line: 1846
	-- upvalues: withLocalization (copy), RobloxLocaleIdKey (copy), Roact (copy), SignUpPageView (copy), UsernameValidator (copy), PasswordValidator (copy)
	local v195 = p84.getIsSignUpButtonEnabled()

	return withLocalization({})(function(p85) -- line: 1849
		-- upvalues: p84 (copy), RobloxLocaleIdKey (copy), Roact (copy), SignUpPageView (copy), v195 (copy), UsernameValidator (copy), PasswordValidator (copy)
		p84.locale = p85[RobloxLocaleIdKey]

		return Roact.createElement(SignUpPageView, {
			navigateBack = p84.props.navigateBack,
			useVerifiedSignup = p84.useVerifiedSignup,
			useUsernameSuggestions = p84.useUsernameSuggestions,
			useRefreshButton = p84.useRefreshButton,
			onGenderChanged = p84.onGenderChanged,
			getHidePassword = p84.getHidePassword,
			passwordVisibilityToggleCallback = p84.passwordVisibilityToggleCallback,
			onBirthdaySelected = p84.onBirthdaySelected,
			onBirthdayFocused = p84.onBirthdayFocused,
			onSignUpClick = p84.onSignUpClick,
			usernameSuggestionClicked = p84.usernameSuggestionClicked,
			usernameSuggestionsShown = p84.usernameSuggestionsShown,
			shouldSuggest = p84.shouldSuggest,
			updateIssueCondition = p84.updateIssueCondition,
			updateSuggestionControlState = p84.updateSuggestionControlState,
			logRefreshButtonClicked = p84.logRefreshButtonClicked,
			loadSuggestions = p84.loadSuggestions,
			finishSuggestions = p84.finishSuggestions,
			validUsernameEntered = p84.validUsernameEntered,
			validPasswordEntered = p84.validPasswordEntered,
			onUsernameTextBoxFocused = p84.onUsernameTextBoxFocused,
			onPasswordTextBoxFocused = p84.onPasswordTextBoxFocused,
			onUsernameTextChanged = p84.onUsernameTextChanged,
			onUsernameTextValidated = p84.onUsernameTextValidated,
			onPasswordTextChanged = p84.onPasswordTextChanged,
			onTextBoxFocusLost = p84.onTextBoxFocusLost,
			onFocusedTextBoxPositionChanged = p84.onFocusedTextBoxPositionChanged,
			onAnimationStateChangeCallback = p84.onAnimationStateChangeCallback,
			onUsernameTextChangeCompletedFromKeyboard = p84.onUsernameTextChangeCompletedFromKeyboard,
			onPasswordTextChangeCompletedFromKeyboard = p84.onPasswordTextChangeCompletedFromKeyboard,
			phoneCountryCodeSelectorCallback = p84.phoneCountryCodeSelectorCallback,
			SetContactMethod = p84.SetContactMethod,
			SetPhoneNumber = p84.SetPhoneNumber,
			SetEmail = p84.SetEmail,
			isUsernameAnimating = p84.state.isUsernameAnimating,
			isPasswordAnimating = p84.state.isPasswordAnimating,
			birthday = p84.state.birthday,
			username = p84.state.username,
			isSignUpInProgress = p84.state.isSignUpInProgress,
			onScreenKeyboardHeight = p84.state.onScreenKeyboardHeight,
			usernameValid = p84.state.usernameValid,
			passwordValid = p84.state.passwordValid,
			issueCondition = p84.state.issueCondition,
			loadingSuggestions = p84.state.loadingSuggestions,
			isSignUpButtonEnabled = v195,
			birthdayFocused = p84.state.birthdayFocused,
			isCountryCodeSearchVisible = p84.state.isCountryCodeSearchVisible,
			contactMethod = p84.state.contactMethod,
			signUpError = p84.state.signUpError,
			UsernameValidator = UsernameValidator,
			PasswordValidator = PasswordValidator,
			signUpContentFrameRef = p84.scrollingFrameRef,
			ageTextFieldRef = p84.ageTextFieldRef,
			usernameTextFieldRef = p84.usernameTextFieldRef,
			passwordTextFieldRef = p84.passwordTextFieldRef,
			passwordFrameRef = p84.passwordFrameRef,
			onSignUpContentFrameCanvasSizeChange = p84.onSignUpContentFrameCanvasSizeChange,
			scrollCanvasTargetPositionY = p84.scrollCanvasTargetPositionY,
			updateScrollCanvasTargetPositionY = p84.updateScrollCanvasTargetPositionY,
			getScrollingFrameCanvasPosition = p84.getScrollingFrameCanvasPosition
		})
	end)
end
function v171.renderDeprecated(p86) -- line: 1935
	-- upvalues: FormFactor (copy), GetFFlagEnableTextFieldContentType (copy), FFlagFoundationStylingOnSignUp (copy), v142 (copy), DisclaimerLinksVariant (copy), GetFFlagMinimalSignupAuthEnabled (copy), GetFFlagPasswordlessSignupAuthEnabled (copy), FFlagEnableAuthDeepLinkReceiver (copy), PreAuthDeepLinkUrlStore (copy), LinkingProtocol (copy), v149 (copy), GetFFlagPasskeySignupEnabled (copy), v144 (copy), v168 (copy), withStyle (copy), withLocalization (copy), RobloxLocaleIdKey (copy), v166 (copy), Roact (copy), FullscreenPageWithSafeArea (copy), BackgroundFill (copy), UnderAgeInteractiveAlert (copy), ImageSetLabel (copy), GetImageData (copy), vector2 (copy), ImageSetButton (copy), uDim2 (copy), FoundationText (copy), FitTextLabel (copy), FitChildren (copy), AuthBirthdayBar (copy), v159 (copy), FFlagEnableLuaAccountSwitch (copy), GetFFlagEnableAuditForSinglePageSignUp (copy), BirthdayField (copy), InputValidity (copy), ContactInfoField (copy), DateHelper (copy), React (copy), DisplayNameField (copy), CollapsingTextInputValidator (copy), UsernameValidator (copy), UsernameValidationContext (copy), SuggestionsFrame (copy), UsernameSuggestor (copy), EngineFeature (copy), PasswordValidator (copy), GetFIntLuaLoginGenderSelector (copy), SignUpGenderSelector (copy), Foundation (copy), Button (copy), ButtonType (copy), View (copy), Checkbox (copy), EventStreamConstants (copy), InputSize (copy), TitleAndParagraph (copy), DisclaimerLinks (copy)
	local birthday = p86.state.birthday
	local username = p86.state.username
	local v199 = p86.getIsSignUpButtonEnabled()
	local isSignUpInProgress = p86.state.isSignUpInProgress
	local gender = p86.state.gender
	local v202 = p86.props.formFactor == FormFactor.WIDE
	local isCompactView = p86.props.isCompactView
	local n1 = 0
	local n2 = 0
	local v206 = p86.state.onScreenKeyboardHeight > 0
	local contactMethod = p86.state.contactMethod
	local foundationTokens = p86.props.foundationTokens
	local shouldUseFoundationBackgroundColor = p86.props.shouldUseFoundationBackgroundColor
	local v210 = GetFFlagEnableTextFieldContentType() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions
	local u211 = not p86.validUsernameEntered()
	local v212 = p86.useVerifiedSignup()
	local v213 = (not v202 or not v212) and 0 or 12
	local s3 = "Authentication.SignUp.Label.ErrorsWithUsername"
	local s4 = "Authentication.SignUp.Label.ErrorsWithPassword"
	local v216 = p86.useUsernameSuggestions()
	local v217 = p86.useRefreshButton()
	local v218 = FFlagFoundationStylingOnSignUp and isCompactView

	if not birthday then
		s3 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst"
		s4 = s3
		u211 = true
	elseif v142 and p86.isDisplayNameFieldRequired() and not p86.isValidDisplayNameEntered() then
		u211 = true
		s4 = "Authentication.SignUp.Response.AgedUpDisplayNameSetFirst"
	elseif u211 then
		s4 = "Authentication.SignUp.Response.UsernameMustBeSetFirst"
	end

	if v202 then
		if v206 then
			n1 = p86.state.onScreenKeyboardHeight + 10
		else
			n1 = 48
			n2 = 24
		end
	end

	local Default = nil

	if v218 then
		Default = DisclaimerLinksVariant.Default
	end

	local v220 = GetFFlagMinimalSignupAuthEnabled()
	local v221 = p86.props.shouldUseMinimalSignup and v220
	local v222 = p86.props.shouldHideGenderOption and v220
	local v223 = p86.props.shouldAutofocusOnBirthday and v220
	local v224 = GetFFlagPasswordlessSignupAuthEnabled()
	local u225 = p86.props.shouldUsePasswordlessSignup and v224
	local v226 = p86.getShouldShowVNGAgreements()
	local v227 = p86.getShouldShowKISAAgreements()
	local v228 = if not FFlagEnableAuthDeepLinkReceiver then LinkingProtocol:getLastLuaURL() else PreAuthDeepLinkUrlStore.getUrl()
	local v229 = v149 and (v228 ~= nil and v228 ~= "")
	local v230 = not p86.state.passkeysAvailable or v229

	if GetFFlagPasskeySignupEnabled() and p86.props.shouldUsePasskeySignup and v230 then
		u225 = false
	end

	local v231 = v144 and p86.props.shouldDisableUsernameAutofill
	local v232 = GetFFlagPasskeySignupEnabled()
	local v233 = p86.props.shouldUsePasskeySignup and (v232 and (game:GetEngineFeature("SignupActionRequiredKeyAvailable") and not v230))
	local v234 = v168

	return withStyle(function(t11: {[any]: any}) -- line: 2046
		-- upvalues: withLocalization (copy), v142 (copy), p86 (copy), RobloxLocaleIdKey (copy), v221 (copy), v202 (copy), v218 (copy), foundationTokens (copy), v166 (copy), v233 (copy), Roact (copy), FullscreenPageWithSafeArea (copy), shouldUseFoundationBackgroundColor (copy), BackgroundFill (copy), isSignUpInProgress (copy), UnderAgeInteractiveAlert (copy), ImageSetLabel (copy), n1 (ref), n2 (ref), GetImageData (copy), vector2 (copy), ImageSetButton (copy), uDim2 (copy), v234 (copy), FoundationText (copy), FitTextLabel (copy), FitChildren (copy), v213 (copy), AuthBirthdayBar (copy), v212 (copy), v223 (copy), v159 (copy), FFlagEnableLuaAccountSwitch (copy), GetFFlagEnableAuditForSinglePageSignUp (copy), BirthdayField (copy), InputValidity (copy), ContactInfoField (copy), birthday (copy), DateHelper (copy), contactMethod (copy), React (copy), DisplayNameField (copy), CollapsingTextInputValidator (copy), s3 (ref), v231 (copy), v210 (copy), v216 (copy), UsernameValidator (copy), UsernameValidationContext (copy), SuggestionsFrame (copy), UsernameSuggestor (copy), v217 (copy), u225 (ref), s4 (ref), u211 (ref), EngineFeature (copy), PasswordValidator (copy), username (copy), v222 (copy), GetFIntLuaLoginGenderSelector (copy), SignUpGenderSelector (copy), gender (copy), Foundation (copy), v199 (copy), Button (copy), ButtonType (copy), View (copy), Checkbox (copy), EventStreamConstants (copy), InputSize (copy), v226 (copy), v227 (copy), TitleAndParagraph (copy), DisclaimerLinks (copy), FFlagFoundationStylingOnSignUp (copy), Default (ref), v206 (copy)
		return withLocalization({
			signUpText = "Authentication.SignUp.Action.CreateAccount",
			continueText = "Authentication.SignUp.Action.Continue",
			usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse",
			agedUpUsernamePlaceholder = "Authentication.Login.Label.AgedUpUsername",
			passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder",
			autogeneratedUsernameGuidance = if not v142 then nil else "Feature.DisplayName.Label.GeneratedUserName",
			usernameHelperTitleText = "Authentication.SignUp.Heading.PickAUsername",
			usernameHelperDescriptionText = "Authentication.SignUp.Description.UsernameHelp",
			signUpAgreementFullCopyCheckboxText = "Authentication.SignUp.Description.AgreeToTermsWithGuardian.NoParameters",
			signUpAgreementShortCopyCheckboxText = "Authentication.SignUp.Description.SignUpAgreement.ShortCopy"
		})(function(p87) -- line: 2060
			-- upvalues: p86 (copy), RobloxLocaleIdKey (copy), v221 (copy), v202 (copy), v218 (copy), foundationTokens (copy), v142 (copy), v166 (copy), v233 (copy), Roact (copy), FullscreenPageWithSafeArea (copy), shouldUseFoundationBackgroundColor (copy), t11 (copy), BackgroundFill (copy), isSignUpInProgress (copy), UnderAgeInteractiveAlert (copy), ImageSetLabel (copy), n1 (ref), n2 (ref), GetImageData (copy), vector2 (copy), ImageSetButton (copy), uDim2 (copy), v234 (copy), FoundationText (copy), FitTextLabel (copy), FitChildren (copy), v213 (copy), AuthBirthdayBar (copy), v212 (copy), v223 (copy), v159 (copy), FFlagEnableLuaAccountSwitch (copy), GetFFlagEnableAuditForSinglePageSignUp (copy), BirthdayField (copy), InputValidity (copy), ContactInfoField (copy), birthday (copy), DateHelper (copy), contactMethod (copy), React (copy), DisplayNameField (copy), CollapsingTextInputValidator (copy), s3 (ref), v231 (copy), v210 (copy), v216 (copy), UsernameValidator (copy), UsernameValidationContext (copy), SuggestionsFrame (copy), UsernameSuggestor (copy), v217 (copy), u225 (ref), s4 (ref), u211 (ref), EngineFeature (copy), PasswordValidator (copy), username (copy), v222 (copy), GetFIntLuaLoginGenderSelector (copy), SignUpGenderSelector (copy), gender (copy), Foundation (copy), v199 (copy), Button (copy), ButtonType (copy), View (copy), Checkbox (copy), EventStreamConstants (copy), InputSize (copy), v226 (copy), v227 (copy), TitleAndParagraph (copy), DisclaimerLinks (copy), FFlagFoundationStylingOnSignUp (copy), Default (ref), v206 (copy)
			p86.locale = p87[RobloxLocaleIdKey]

			local v494 = not v221
			local v495 = not v202 and 48 or 25
			local uDim2_2 = UDim2.new(0.5, 0, 0, 49)

			if v218 then
				v495 += foundationTokens.Padding.Medium
				uDim2_2 = UDim2.new(0.5, 0, 0, 1 + foundationTokens.Padding.Medium)
			end

			if v142 then
				v494 = p86.shouldShowUsernameField() and not v221
			end

			local v497 = not p86.getSignupCheckboxDisabled() and p86.props.shouldRequireSignupCheckbox
			local v498 = not v166 and "Authentication.SignUp.Description.VerificationPage.CreateAccount" or "Authentication.SignUp.Description.SignUpAgreement.FullCopy.CreateAccount"

			if v233 then
				v498 = "Authentication.SignUp.Description.VerificationPageMultiStep"
			else
				local signUpText = p87.signUpText
				local t12 = nil
				local v501 = p86.props.appPolicy.getPlatformAccountName()

				if v501 and p86.props.appPolicy.getUseSingleSignOn() then
					t12 = {
						"Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName",
						platform = v501,
						ctaButton = signUpText
					}
				end

				if t12 then
					local signUpText2 = p87.signUpText

					v498 = nil

					local v503 = p86.props.appPolicy.getPlatformAccountName()

					if v503 and p86.props.appPolicy.getUseSingleSignOn() then
						v498 = {
							"Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName",
							platform = v503,
							ctaButton = signUpText2
						}
					end
				end
			end

			local s5 = ""

			if not p86.getSignupCheckboxDisabled() then
				if p86.props.signupLegalDisclaimerTextVariant == 1 then
					if v497 then
						s5 = p87.signUpAgreementFullCopyCheckboxText
					else
						v498 = not v233 and "Authentication.SignUp.Description.SignupAgreement.FullCopy.CreateAccount" or "Authentication.SignUp.Description.SignUpAgreement.FullCopy.Continue"
					end
				elseif p86.props.signupLegalDisclaimerTextVariant == 2 and v497 then
					s5 = p87.signUpAgreementShortCopyCheckboxText
				end
			end

			local v505 = p86.props.shouldShowBackButton == nil or p86.props.shouldShowBackButton

			return Roact.createElement(FullscreenPageWithSafeArea, {
				BackgroundTransparency = 1,
				includeStatusBar = true,
				buttonRef = p86.props.containerRef,
				renderFullscreenBackground = function() --[[ renderFullscreenBackground ]] -- line: 2120
					-- upvalues: Roact (copy), v202 (copy), shouldUseFoundationBackgroundColor (copy), foundationTokens (copy), t11 (copy), BackgroundFill (copy)
					return Roact.createElement("Frame", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = not v202 and 0 or 1,
						BackgroundColor3 = if not shouldUseFoundationBackgroundColor then t11.Theme.BackgroundUIDefault.Color else foundationTokens.Color.Surface.Surface_0.Color3
					}, {
						Background = v202 and Roact.createElement(BackgroundFill, {
							Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
						}),
						Mask = v202 and Roact.createElement("ImageLabel", {
							ZIndex = 2,
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundColor3 = Color3.new(0, 0, 0),
							BackgroundTransparency = 0.5
						})
					})
				end
			}, {
				UserInputSink = isSignUpInProgress and Roact.createElement("ImageButton", {
					ZIndex = 2,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = ""
				}),
				UnderAgeAlert = p86.state.shouldShowUnderAgeAlert and Roact.createElement(UnderAgeInteractiveAlert, {
					ZIndex = 3,
					onDismiss = function() --[[ onDismiss ]] -- line: 2149
						-- upvalues: p86 (copy)
						p86:setState({
							shouldShowUnderAgeAlert = false
						})
					end
				}),
				Container = Roact.createElement(ImageSetLabel, {
					Size = UDim2.new(1, 0, 1, -n1),
					Position = UDim2.new(0.5, 0, 0, n2),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = if not shouldUseFoundationBackgroundColor then t11.Theme.BackgroundUIDefault.Color else foundationTokens.Color.Surface.Surface_0.Color3,
					ClipsDescendants = true
				}, {
					SizeConstraint = Roact.createElement("UISizeConstraint", {
						MaxSize = vector2
					}),
					HeaderFrame = Roact.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, 48),
						Position = UDim2.new(0.5, 0, 0, 0),
						AnchorPoint = Vector2.new(0.5, 0),
						BackgroundTransparency = 1
					}, {
						BackButton = v505 and Roact.createElement(ImageSetButton, {
							Size = uDim2,
							AutoButtonColor = false,
							BorderSizePixel = 0,
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 12, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							ScaleType = Enum.ScaleType.Fit,
							Image = v234,
							ImageColor3 = t11.Theme.UIEmphasis.Color,
							ImageTransparency = 0,
							[Roact.Event.Activated] = p86.onCloseButtonClicked,
							[Roact.Ref] = p86.backButtonRef
						}),
						Title = p87.signUpText and if not v218 then Roact.createElement(FitTextLabel, {
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							fitAxis = FitChildren.FitAxis.Height,
							BackgroundTransparency = 1,
							Text = p87.signUpText or "",
							TextWrapped = true,
							Font = t11.Font.CaptionHeader.Font,
							TextSize = t11.Font.BaseSize * t11.Font.Header1.RelativeSize,
							TextColor3 = t11.Theme.TextEmphasis.Color,
							TextTransparency = t11.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Center
						}) else Roact.createElement(FoundationText, {
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							Text = p87.signUpText or "",
							fontStyle = foundationTokens.Typography.HeadingSmall,
							TextXAlignment = Enum.TextXAlignment.Center
						})
					}),
					Divider = not v218 and Roact.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, 1),
						Position = UDim2.new(0.5, 0, 0, 48),
						AnchorPoint = Vector2.new(0.5, 0),
						BackgroundTransparency = not shouldUseFoundationBackgroundColor and 0 or 1,
						BackgroundColor3 = t11.Theme.UIEmphasis.Color
					}),
					SignUpContentFrame = Roact.createElement(FitChildren.FitScrollingFrame, {
						Size = UDim2.new(1, 0, 1, -(49 + v213)),
						Position = uDim2_2,
						AnchorPoint = Vector2.new(0.5, 0),
						fitFields = {
							CanvasSize = FitChildren.FitAxis.Height
						},
						ScrollBarThickness = 0,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Selectable = false,
						ScrollingEnabled = not (p86.state.isUsernameAnimating or p86.state.isPasswordAnimating),
						CanvasPosition = p86.scrollCanvasTargetPositionY:map(function(p88) -- line: 2239
							-- upvalues: p86 (copy)
							return p86.getScrollingFrameCanvasPosition(p88)
						end),
						[Roact.Ref] = p86.scrollingFrameRef,
						[Roact.Change.CanvasSize] = function(_) -- line: 2243
							-- upvalues: p86 (copy)
							local v511 = p86.scrollCanvasTargetPositionY:getValue()

							p86.scrollingFrameRef.current.CanvasPosition = p86.getScrollingFrameCanvasPosition(v511)
						end
					}, {
						ContentPadding = Roact.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 24),
							PaddingRight = UDim.new(0, 24),
							PaddingTop = UDim.new(0, v495)
						}),
						ListLayout = Roact.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 5)
						}),
						BirthdayBar = p86.getBirthdayVariant() == 0 and Roact.createElement(AuthBirthdayBar, {
							layoutOrder = 1,
							onBirthdaySelected = p86.onBirthdaySelected,
							onBirthdayFocused = p86.onBirthdayFocused,
							autoFocusOnMount = v212 or v223,
							buttonRef = p86.props.defaultRef,
							preferredInput = p86.props.preferredInput,
							birthdayContainerRef = p86.props.birthdayContainerRef,
							forceDarkTheme = v159 and (FFlagEnableLuaAccountSwitch and p86.isAlreadyAuthenticated),
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUp()
						}),
						AgeInput = p86.getBirthdayVariant() ~= 0 and Roact.createElement(BirthdayField, {
							layoutOrder = 1,
							variant = p86.getBirthdayVariant(),
							textInputHeight = 36,
							hasBirthdayError = p86.state.birthdayValid == InputValidity.Invalid,
							onAgeChange = p86.onAgeChanged,
							onAgeAndMonthChange = p86.onAgeAndMonthChanged,
							onMonthAndYearChange = p86.onMonthAndYearChanged,
							ageTextFieldRef = p86.ageTextFieldRef,
							screenSize = p86.props.screenSize
						}),
						ContactInfoField = v212 and Roact.createElement(ContactInfoField, {
							layoutOrder = 2,
							Under13 = birthday and DateHelper:isRecentOrFutureDate(birthday.Month, birthday.Day, birthday.Year + 13),
							SetContactMethod = p86.SetContactMethod,
							SetPhoneNumber = p86.SetPhoneNumber,
							SetEmail = p86.SetEmail,
							contactMethod = contactMethod,
							phoneCountryCodeSelectorCallback = p86.phoneCountryCodeSelectorCallback
						}),
						BackgroundPanel = v212 and Roact.createElement("Frame", {
							Size = UDim2.new(0, 0, 0, 6),
							LayoutOrder = 3,
							BackgroundTransparency = 1
						}, {
							LightPanel = Roact.createElement("Frame", {
								BorderSizePixel = 0,
								Size = UDim2.new(0, 100000, 0, 100000),
								Position = UDim2.new(0, 0, 1, 0),
								BackgroundColor3 = t11.Theme.UIDefault.Color,
								AnchorPoint = Vector2.new(0.5, 0)
							})
						}),
						DisplayName = if not v142 or not p86.shouldShowDisplayNameField() then nil else React.createElement(DisplayNameField, {
							authEventAnalytics = p86.props.authEventAnalytics,
							birthday = not birthday and "" or birthday:FormatForEndpoint(),
							bypassDisplayNameField = p86.state.bypassDisplayNameField,
							focusedTextBoxPositionChangedCallback = p86.onFocusedTextBoxPositionChanged,
							layoutOrder = 4,
							onAnimationStateChangeCallback = p86.onAnimationStateChangeCallback,
							onDisplayNameTextChanged = p86.onDisplayNameTextChanged,
							onReturnPressedFromOnScreenKeyboard = p86.onDisplayNameTextChangeCompletedFromKeyboard,
							pillClicked = p86.state.pillClicked,
							resetPillClicked = p86.resetPillClicked,
							returnKeyType = Enum.ReturnKeyType.Next,
							setUsernameRecommendation = p86.setUsernameRecommendation,
							shouldDisableRecommendation = p86.state.hasEditedUsername,
							textBoxFocusedCallback = p86.onDisplayNameTextBoxFocused,
							textBoxFocusLostCallback = p86.onTextBoxFocusLost,
							textBoxRef = p86.displayNameTextFieldRef,
							updateBypassDisplayNameField = p86.updateBypassDisplayNameField,
							updatePillClicked = p86.updatePillClicked
						}),
						UsernameValidator = v494 and Roact.createElement(CollapsingTextInputValidator, {
							layoutOrder = not v142 and 4 or 5,
							titleTextKey = "Authentication.Login.Label.Username",
							summaryErrorTextKey = s3,
							prerequisiteMet = not not birthday,
							textInputType = if not v231 then v210 else nil,
							onInputTextChanged = p86.onUsernameTextChanged,
							onInputTextValidated = v216 and p86.onUsernameTextValidated or p86.onUsernameTextChanged,
							validator = UsernameValidator,
							prefilledText = if not v142 then nil else p86.state.recommendedUsername,
							placeholderText = if not v142 then p87.usernamePlaceholder else p86.getUsernamePlaceholder(p87),
							validatorAdditionalProps = {
								birthday = birthday and birthday:FormatForEndpoint() or "",
								context = UsernameValidationContext.Signup
							},
							textBoxFocusedCallback = p86.onUsernameTextBoxFocused,
							textBoxFocusLostCallback = if not v142 then p86.onTextBoxFocusLost else p86.onUsernameTextBoxFocusLost,
							focusedTextBoxPositionChangedCallback = p86.onFocusedTextBoxPositionChanged,
							returnKeyType = Enum.ReturnKeyType.Next,
							onReturnPressedFromOnScreenKeyboard = p86.onUsernameTextChangeCompletedFromKeyboard,
							onAnimationStateChangeCallback = p86.onAnimationStateChangeCallback,
							textBoxRef = p86.usernameTextFieldRef,
							pillClicked = p86.state.pillClicked,
							updatePillClicked = p86.updatePillClicked,
							resetPillClicked = p86.resetPillClicked,
							issueCondition = p86.state.issueCondition,
							updateIssueCondition = p86.updateIssueCondition,
							loadingSuggestions = p86.state.loadingSuggestions,
							paddingBottomOverride = if not v142 or (not p86.props.shouldSeeDisplayNamesOnSignup or not p86.getUsernameGuidanceText(p87)) then nil else -5,
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUp()
						}),
						UsernameGuidanceText = if not v142 or (not p86.props.shouldSeeDisplayNamesOnSignup or not p86.getUsernameGuidanceText(p87)) then nil else Roact.createElement("Frame", {
							Size = UDim2.new(1, 0, 0, 1),
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundTransparency = 1,
							LayoutOrder = 5
						}, {
							Padding = Roact.createElement("UIPadding", {
								PaddingBottom = UDim.new(0, 5)
							}),
							Label = Roact.createElement("TextLabel", {
								AutomaticSize = Enum.AutomaticSize.Y,
								BackgroundTransparency = 1,
								Font = t11.Font.CaptionBody.Font,
								Size = UDim2.new(1, 0, 0, 0),
								Text = p86.getUsernameGuidanceText(p87),
								TextColor3 = t11.Theme.TextDefault.Color,
								TextSize = t11.Font.BaseSize * t11.Font.CaptionBody.RelativeSize,
								TextWrapped = true,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Top
							})
						}),
						SuggestionsFrame = v494 and (v216 and Roact.createElement(SuggestionsFrame, {
							layoutOrder = not v142 and 4 or 5,
							textBoxRef = p86.usernameTextFieldRef,
							usernameValid = p86.state.usernameValid,
							birthday = birthday and birthday:FormatForEndpoint() or "",
							suggest = UsernameSuggestor,
							context = UsernameValidationContext.Signup,
							pillClicked = p86.state.pillClicked,
							updatePillClicked = p86.updatePillClicked,
							resetPillClicked = p86.resetPillClicked,
							issueCondition = p86.state.issueCondition,
							usernameSuggestionClicked = p86.usernameSuggestionClicked,
							usernameSuggestionsShown = p86.usernameSuggestionsShown,
							shouldSuggest = p86.shouldSuggest,
							updateSuggestionControlState = p86.updateSuggestionControlState,
							useRefreshButton = v217,
							logRefreshButtonClicked = p86.logRefreshButtonClicked,
							loadSuggestions = p86.loadSuggestions,
							finishSuggestions = p86.finishSuggestions,
							loadingSuggestions = p86.state.loadingSuggestions,
							padding = {
								PaddingLeft = UDim.new(0, 24),
								PaddingRight = UDim.new(0, 24)
							}
						})),
						PasswordValidator = not v221 and (not u225 and Roact.createElement(CollapsingTextInputValidator, {
							disabled = p86.state.birthdayFocused,
							layoutOrder = not v142 and 5 or 6,
							titleTextKey = "CommonUI.Messages.Label.Password",
							summaryErrorTextKey = s4,
							prerequisiteMet = not u211,
							textInputType = EngineFeature and Enum.TextInputType.NewPassword or Enum.TextInputType.Password,
							onInputTextChanged = p86.onPasswordTextChanged,
							onInputTextValidated = p86.onPasswordTextChanged,
							validator = PasswordValidator,
							placeholderText = p87.passwordPlaceholder,
							validatorAdditionalProps = {
								username = username
							},
							returnKeyType = Enum.ReturnKeyType.Next,
							textBoxFocusedCallback = p86.onPasswordTextBoxFocused,
							textBoxFocusLostCallback = p86.onTextBoxFocusLost,
							focusedTextBoxPositionChangedCallback = p86.onFocusedTextBoxPositionChanged,
							onReturnPressedFromOnScreenKeyboard = p86.onPasswordTextChangeCompletedFromKeyboard,
							onAnimationStateChangeCallback = p86.onAnimationStateChangeCallback,
							textBoxRef = p86.passwordTextFieldRef,
							centralOverlayBlocksInput = v212,
							captureFocusOnTapStart = not p86.state.isCountryCodeSearchVisible
						})),
						GenderSelector = not v222 and (GetFIntLuaLoginGenderSelector() ~= 2 and Roact.createElement(SignUpGenderSelector, {
							layoutOrder = not v142 and 7 or 8,
							gender = gender,
							onGenderChanged = p86.onGenderChanged,
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUp()
						})),
						Spacing = Roact.createElement("Frame", {
							LayoutOrder = not v142 and 8 or 9,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 38)
						}),
						SignUpButton = if not v218 then Roact.createElement(Button, {
							buttonType = ButtonType.PrimaryContextual,
							layoutOrder = not v142 and 9 or 10,
							size = UDim2.new(1, 0, 0, 36),
							text = if not v233 then p87.signUpText else p87.continueText,
							isDisabled = not v199,
							isLoading = isSignUpInProgress,
							onActivated = p86.onSignUpClick
						}) else Roact.createElement(Foundation.Button, {
							variant = Foundation.Enums.ButtonVariant.Emphasis,
							LayoutOrder = not v142 and 9 or 10,
							text = if not v233 then p87.signUpText else p87.continueText,
							size = Foundation.Enums.InputSize.Medium,
							width = UDim.new(1, 0),
							isDisabled = not v199,
							isLoading = isSignUpInProgress,
							onActivated = p86.onSignUpClick
						}),
						CheckboxContainer = v497 and React.createElement(View, {
							tag = "auto-xy padding-x-xxlarge padding-y-large row gap-medium",
							LayoutOrder = not v142 and 10 or 11
						}, {
							SignUpAgreementCheckbox = React.createElement(Checkbox, {
								isChecked = p86.state.signupAgreementsChecked,
								isDisabled = false,
								onActivated = function() --[[ onActivated ]] -- line: 2500
									-- upvalues: p86 (copy), EventStreamConstants (copy)
									p86.props.authEventAnalytics.reportAuthFormInteraction(EventStreamConstants.Context.SinglePageSignUpScreen, EventStreamConstants.Field.TosCheckbox, (tostring(not p86.state.signupAgreementsChecked)))
									p86:setState({
										signupAgreementsChecked = not p86.state.signupAgreementsChecked
									})
								end,
								size = InputSize.Small,
								LayoutOrder = 1,
								label = ""
							}),
							Text = React.createElement(FoundationText, {
								tag = "text-body-small text-align-x-left text-wrap auto-xy shrink",
								LayoutOrder = 2,
								Text = s5
							})
						}),
						DisclaimerText = not (v226 or (v227 or v497)) and Roact.createElement(TitleAndParagraph, {
							layoutOrder = not v142 and 10 or 11,
							textXAlignment = Enum.TextXAlignment.Center,
							paragraphTextKeys = { v498 },
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUp()
						}),
						DisclaimerLinks = not (v226 or v227) and Roact.createElement(DisclaimerLinks, {
							LayoutOrder = not v142 and 11 or 12,
							variant = if not FFlagFoundationStylingOnSignUp then nil else Default,
							enableAuditContentCapture = GetFFlagEnableAuditForSinglePageSignUp()
						}),
						ScrollPadding = v206 and Roact.createElement("Frame", {
							LayoutOrder = not v142 and 12 or 13,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, p86.state.onScreenKeyboardHeight * 2)
						})
					}),
					Footer = v212 and (v202 and Roact.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, 12),
						Position = UDim2.new(0, 0, 1, -12),
						BackgroundTransparency = 1,
						ClipsDescendants = true
					}, {
						Rounding = Roact.createElement(ImageSetLabel, {
							Size = UDim2.new(1, 0, 2, 0),
							Position = UDim2.new(0, 0, -1, 0),
							BackgroundTransparency = 1,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(9, 9, 9, 9),
							Image = GetImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
							ImageColor3 = t11.Theme.UIDefault.Color
						})
					}))
				})
			})
		end)
	end)
end

local v172 = RoactRodux.connect(function(p90, _) -- line: 2571
	return {
		formFactor = p90.FormFactor,
		screenSize = p90.ScreenSize
	}
end, function(p92) -- line: 2576
	-- upvalues: SignUpV2 (copy), OpenCentralOverlayForAgreeToPhoneNumberVerification (copy), AnalyticsEvents (copy), EventConstants (copy), OpenKISAPopUpAgreements (copy), SetBackNavigationDisabled (copy), NavigateBack (copy), SetNetworkingErrorToast (copy), OpenCentralOverlayForPhoneNumberVerification (copy), SetCurrentToastMessage (copy), ToastType (copy), SetCentralOverlay (copy), OverlayType (copy), CloseCentralOverlay (copy), OpenAccountSwitchingErrorOverlay (copy), ResetAppState (copy), Logout (copy), OpenEmailOtp (copy)
	return {
		signUp = function(p93, p94, p95, p96, p97, p98, p99, p100, p101, p102, p103, p104, p105, p106) --[[ signUp ]] -- line: 2578
			-- upvalues: p92 (copy), SignUpV2 (copy)
			return p92(SignUpV2(p93, p94, p95, p96, p97, p98, p99, p100, p101, p102, p103, p104, p105, p106))
		end,
		agreeToPhoneNumberVerification = function(_, p108, p109) --[[ agreeToPhoneNumberVerification ]] -- line: 2613
			-- upvalues: p92 (copy), OpenCentralOverlayForAgreeToPhoneNumberVerification (copy)
			return p92(OpenCentralOverlayForAgreeToPhoneNumberVerification({
				verificationChallengeCallback = p108,
				phoneNumber = p109
			}))
		end,
		openKISAUserAgreements = function(p110) --[[ openKISAUserAgreements ]] -- line: 2620
			-- upvalues: AnalyticsEvents (copy), EventConstants (copy), p92 (copy), OpenKISAPopUpAgreements (copy)
			AnalyticsEvents.sendPageLoadEvent(EventConstants.ctx.kisaAgreements, EventConstants.origin.signup)

			return p92(OpenKISAPopUpAgreements(p110))
		end,
		setBackNavigationDisabled = function(p111) --[[ setBackNavigationDisabled ]] -- line: 2625
			-- upvalues: p92 (copy), SetBackNavigationDisabled (copy)
			return p92(SetBackNavigationDisabled(p111))
		end,
		navigateBack = function() --[[ navigateBack ]] -- line: 2628
			-- upvalues: p92 (copy), NavigateBack (copy)
			return p92(NavigateBack())
		end,
		showErrorToast = function() --[[ showErrorToast ]] -- line: 2631
			-- upvalues: p92 (copy), SetNetworkingErrorToast (copy)
			return p92(SetNetworkingErrorToast({
				HttpError = Enum.HttpError.OK
			}))
		end,
		verifyPhoneNumber = function(_, p113, p114, p115, p116, p117) --[[ verifyPhoneNumber ]] -- line: 2634
			-- upvalues: p92 (copy), OpenCentralOverlayForPhoneNumberVerification (copy)
			return p92(OpenCentralOverlayForPhoneNumberVerification({
				verifyPhoneNumberCallback = p113,
				phoneNumber = p115,
				deliveryTarget = p116,
				challenge = p114,
				useEmailOptionClickedCallback = p117
			}))
		end,
		showErrorMessageToast = function(p118) --[[ showErrorMessageToast ]] -- line: 2650
			-- upvalues: p92 (copy), SetCurrentToastMessage (copy), ToastType (copy)
			return p92(SetCurrentToastMessage({
				toastType = ToastType.NetworkingError,
				toastMessage = p118
			}))
		end,
		showVNGUserAgreementsPopup = function(p119, p120, p121) --[[ showVNGUserAgreementsPopup ]] -- line: 2656
			-- upvalues: p92 (copy), SetCentralOverlay (copy), OverlayType (copy)
			return p92(SetCentralOverlay(OverlayType.VNGUserAgreementsPopup, {
				agreements = p119,
				isSignup = true,
				agreementAccepted = p120,
				agreementDeclined = p121
			}, {
				DisableBackButtonClose = true
			}))
		end,
		showVNGDCForm = function() --[[ showVNGDCForm ]] -- line: 2666
			-- upvalues: p92 (copy), SetCentralOverlay (copy), OverlayType (copy)
			p92(SetCentralOverlay(OverlayType.VngContactInfoFormWebviewPopup, {}, {
				DisableBackButtonClose = true
			}))
		end,
		closeCentralOverlay = function() --[[ closeCentralOverlay ]] -- line: 2671
			-- upvalues: p92 (copy), CloseCentralOverlay (copy)
			return p92(CloseCentralOverlay())
		end,
		openAccountSwitchingErrorOverlay = function(p122, p123, p124, p125, p126, p127, p128, p129) --[[ openAccountSwitchingErrorOverlay ]] -- line: 2674
			-- upvalues: p92 (copy), OpenAccountSwitchingErrorOverlay (copy)
			return p92(OpenAccountSwitchingErrorOverlay(p122, p123, p124, p125, p126, p127, p128, p129, true))
		end,
		resetAppState = function() --[[ resetAppState ]] -- line: 2696
			-- upvalues: p92 (copy), ResetAppState (copy)
			return p92(ResetAppState())
		end,
		logoutWithoutShowConfirmation = function(p130, p131) --[[ logoutWithoutShowConfirmation ]] -- line: 2699
			-- upvalues: p92 (copy), Logout (copy)
			return p92(Logout(p130, p131))
		end,
		openEmailOtp = function(p132) --[[ openEmailOtp ]] -- line: 2703
			-- upvalues: p92 (copy), OpenEmailOtp (copy)
			p92(OpenEmailOtp(p132))
		end,
		showAccountLinkingAlert = function(p133) --[[ showAccountLinkingAlert ]] -- line: 2706
			-- upvalues: p92 (copy), SetCentralOverlay (copy), OverlayType (copy)
			return p92(SetCentralOverlay(OverlayType.AccountLinkingAlert, {
				alertType = p133
			}))
		end
	}
end)(v171)
local v173 = RoactServices.connect({
	networking = RoactNetworking,
	guiService = AppGuiService,
	authEventAnalytics = RoactAnalyticsAuthEvents,
	analytics = RoactAnalytics,
	loggingProtocol = AppLogging
})(v172)
local v174 = RoactAppPolicy.connect(function(p134, _) -- line: 2722
	return {
		appPolicy = p134
	}
end)(v173)
local v175 = RoactAppExperiment.connectBrowserTrackerLayer({
	AppBtidLayers.SignupLayer,
	AppBtidLayers.IosPasswordSavingLayer,
	AppBtidLayers.AccountSwitcherLayer
}, function(p136, _) -- line: 2732
	-- upvalues: AppBtidLayers (copy), v142 (copy), v145 (copy), GetFFlagEnableAccountSwitcherIXPTextGatingFix (copy), GetFFlagEnableAccountSwitcherRedesignIXP (copy), GetFFlagEnableAccountSwitcherFoundationDesign (copy)
	local v242 = p136[AppBtidLayers.SignupLayer] or {}
	local v243 = p136[AppBtidLayers.IosPasswordSavingLayer] or {}
	local v244 = if not v142 then nil else v242.shouldSeeDisplayNamesOnSignup

	if v145 then
		v244 = true
	end

	local v247

	if GetFFlagEnableAccountSwitcherIXPTextGatingFix() then
		local v245 = p136[AppBtidLayers.AccountSwitcherLayer] or {}
		local v246 = not GetFFlagEnableAccountSwitcherRedesignIXP() or v245.enableAccountSwitcherFoundationDesign == true

		v247 = GetFFlagEnableAccountSwitcherFoundationDesign() and v246
	else
		v247 = GetFFlagEnableAccountSwitcherFoundationDesign()
	end

	return {
		useVerifiedSignupPage = v242.contactMethodRequired,
		arePasswordFieldsPlaintext = v242.ArePasswordFieldsPlaintext,
		shouldUseUsernameSuggestions = v242.usernameSuggestionsEnabled,
		enableRefreshButton = v242.suggestionRefreshButtonEnabled,
		shouldUseMinimalSignup = v242.shouldUseMinimalSignup,
		shouldHideGenderOption = v242.shouldHideGenderOption,
		shouldAutofocusOnBirthday = v242.shouldAutofocusOnBirthday,
		shouldUsePasswordlessSignup = v242.shouldUsePasswordlessSignup,
		shouldUsePasskeySignup = v242.shouldUsePasskeySignup,
		shouldAutomaticallyPromptForPasskey = v242.shouldAutomaticallyPromptForPasskey,
		birthdayPickerVariant = v242.birthdayPickerVariant,
		shouldSeeDisplayNamesOnSignup = v244,
		shouldShowKoreanKISASignUpFlow = v242.shouldShowKoreanKISASignUpFlow,
		shouldDisableUsernameAutofill = v242.shouldDisableUsernameAutofill,
		shouldRequireSignupCheckbox = v242.shouldRequireSignupCheckbox,
		signupLegalDisclaimerTextVariant = v242.signupLegalDisclaimerTextVariant,
		isIosAuthServiceEnabled = v243.enableNewIosPasswordSaving or false,
		showAccountSwitcherFoundationDesign = v247
	}
end)(v174)
local u176 = withNavigationProps(function(_, p139) -- line: 2776
	return p139
end)(v175)

local function SinglePageSignUpWithAuditContent(p140) -- line: 2781
	-- upvalues: AuditContentContext (copy), Roact (copy), u176 (ref), Cryo (copy)
	local v251 = AuditContentContext.useAuditContentContext()

	return Roact.createElement(u176, Cryo.Dictionary.join(p140, {
		capturedAuditContent = v251.capturedAuditContent,
		additionalAuditContent = v251.additionalAuditContent
	}))
end

return function(p141) -- line: 2793
	-- upvalues: ReactFocusNavigation (copy), v160 (copy), useBreakpointXOrSmaller (copy), Responsive (copy), FFlagFoundationStylingOnSignUp (copy), FFlagEnableSignupFoundationalizeBackgroundAndText (copy), useTokens (copy), RoactAppExperiment (copy), AppBtidLayers (copy), React (copy), GetFFlagEnablePreferredInputForSignUp (copy), usePreferredInput (copy), FFlagEnableSignUpExitModal (copy), v156 (copy), useDispatch (copy), NavigateBack (copy), SetCentralOverlay (copy), OverlayType (copy), CloseCentralOverlay (copy), useSignUpPageNavigationBindings (copy), GetFFlagEnableAuditForSinglePageSignUp (copy), Roact (copy), AuditContentContext (copy), SinglePageSignUpWithAuditContent (copy), Cryo (copy), FFlagHideBackButtonOnSignUpPage (copy), u176 (ref)
	local v253 = ReactFocusNavigation.useFocusedGuiObject()
	local v254 = ReactFocusNavigation.useFocusGuiObject()
	local v255 = if not v160 then nil else useBreakpointXOrSmaller(Responsive.Keys.Medium)
	local v256 = if not FFlagFoundationStylingOnSignUp and not FFlagEnableSignupFoundationalizeBackgroundAndText then nil else useTokens()
	local v257 = RoactAppExperiment.useBrowserTrackerExperiment({ AppBtidLayers.AuthenticationStylingLayer }, function(p142) -- line: 2803
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldUseFoundationBackgroundColor = (p142[AppBtidLayers.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
		}
	end)
	local v258 = FFlagEnableSignupFoundationalizeBackgroundAndText and v257.shouldUseFoundationBackgroundColor
	local v259, v260 = React.useState(false)
	local v261 = if not GetFFlagEnablePreferredInputForSignUp() then nil else usePreferredInput()
	local v262 = FFlagEnableSignUpExitModal and v261 == Responsive.Input.Directional
	local v265

	if v156 then
		local v263 = useDispatch()
		local v264 = React.useCallback(function() -- line: 2821
			-- upvalues: v262 (copy), v259 (copy), v263 (copy), NavigateBack (copy), SetCentralOverlay (copy), OverlayType (copy), CloseCentralOverlay (copy), v254 (copy), v253 (copy)
			if not v262 then
				return
			end

			if not v259 then
				v263(NavigateBack())

				return
			end

			v263(SetCentralOverlay(OverlayType.SignUpExitModal, {
				onClose = function() --[[ onClose ]] -- line: 2830
					-- upvalues: v263 (copy), CloseCentralOverlay (copy), v254 (copy), v253 (copy)
					v263(CloseCentralOverlay())
					v263(function() -- line: 2832
						-- upvalues: v254 (copy), v253 (copy)
						v254(v253)
					end)
				end,
				onConfirm = function() --[[ onConfirm ]] -- line: 2836
					-- upvalues: v263 (copy), CloseCentralOverlay (copy), NavigateBack (copy)
					v263(CloseCentralOverlay())
					v263(NavigateBack())
				end
			}))
		end, {
			v259,
			v262,
			v253,
			v254,
			v263
		})

		v265 = useSignUpPageNavigationBindings(if not v262 then nil else v264)
	elseif v262 then
		local v266 = useDispatch()
		local v267 = React.useCallback(function() -- line: 2855
			-- upvalues: v259 (copy), v266 (copy), NavigateBack (copy), SetCentralOverlay (copy), OverlayType (copy), CloseCentralOverlay (copy), v254 (copy), v253 (copy)
			if not v259 then
				v266(NavigateBack())

				return
			end

			v266(SetCentralOverlay(OverlayType.SignUpExitModal, {
				onClose = function() --[[ onClose ]] -- line: 2861
					-- upvalues: v266 (copy), CloseCentralOverlay (copy), v254 (copy), v253 (copy)
					v266(CloseCentralOverlay())
					v266(function() -- line: 2863
						-- upvalues: v254 (copy), v253 (copy)
						v254(v253)
					end)
				end,
				onConfirm = function() --[[ onConfirm ]] -- line: 2867
					-- upvalues: v266 (copy), CloseCentralOverlay (copy), NavigateBack (copy)
					v266(CloseCentralOverlay())
					v266(NavigateBack())
				end
			}))
		end, { v259 })

		v265 = useSignUpPageNavigationBindings(v267)
	else
		v265 = useSignUpPageNavigationBindings()
	end

	local v268, v269 = ReactFocusNavigation.useDefaultFocusBehavior(v265)
	local v270 = React.useRef(nil)

	if GetFFlagEnableAuditForSinglePageSignUp() then
		return Roact.createElement(AuditContentContext.Provider, nil, {
			SignUpPage = Roact.createElement(SinglePageSignUpWithAuditContent, Cryo.Dictionary.join(p141, {
				signUpStarted = if not v262 then nil else v259,
				setSignUpStarted = if not v262 then nil else v260,
				shouldShowBackButton = if not FFlagHideBackButtonOnSignUpPage then nil else not v262,
				preferredInput = v261,
				focusedGuiObject = v253,
				focusGuiObject = v254,
				defaultRef = v268,
				containerRef = v269,
				birthdayContainerRef = v270,
				isCompactView = v255,
				foundationTokens = v256,
				shouldUseFoundationBackgroundColor = v258
			}))
		})
	end

	return Roact.createElement(u176, Cryo.Dictionary.join(p141, {
		signUpStarted = if not v262 then nil else v259,
		setSignUpStarted = if not v262 then nil else v260,
		shouldShowBackButton = if not FFlagHideBackButtonOnSignUpPage then nil else not v262,
		preferredInput = v261,
		focusedGuiObject = v253,
		focusGuiObject = v254,
		defaultRef = v268,
		containerRef = v269,
		birthdayContainerRef = v270,
		isCompactView = v255,
		foundationTokens = v256,
		shouldUseFoundationBackgroundColor = v258
	}))
end
