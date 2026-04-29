local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local MemStorageService = game:GetService("MemStorageService")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local React = require(CorePackages.Packages.React)
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppOmniRecommendationsRequest = require(CorePackages.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest
local RoactAnalyticsAuthEvents = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local RoactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics)
local EventStreamConstants = require(Modules.LuaApp.EventStreamConstants)
local Promise = require(Modules.LuaApp.Promise)
local useAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local ReactFocusNavigation = require(CorePackages.Packages.ReactFocusNavigation)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local usePreferredInput = Responsive.usePreferredInput
local UIBlox = require(CorePackages.Packages.UIBlox)
local useStyle = UIBlox.Core.Style.useStyle
local DarkTheme = UIBlox.App.Style.Themes.DarkTheme
local Images = UIBlox.App.ImageSet.Images
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local FullscreenPageWithSafeArea = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local CollapsingTextInputValidator = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
local PasswordValidator = require(Modules.LuaApp.Thunks.Authentication.PasswordValidator)
local InputValidity = require(Modules.LuaApp.Components.Authentication.Enum.InputValidity)
local Button = UIBlox.App.Button.Button
local LinkButton = UIBlox.App.Button.LinkButton
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
local DividerWithText = AuthCommon.Components.DividerWithText
local TextInputBoxWithBorder = AuthCommon.Components.TextInputBoxWithBorder
local AuthStatefulRoundCornerBorder = AuthCommon.Components.AuthStatefulRoundCornerBorder
local GetPasswordManagerUsageStore = AuthCommon.Stores.GetPasswordManagerUsageStore
local MultiPageSignupText = require(Modules.LuaApp.Components.Authentication.MultiPageSignupText)
local PageWithDisclaimerLinks = require(Modules.LuaApp.Components.Authentication.PageWithDisclaimerLinks)
local Foundation = require(CorePackages.Packages.Foundation)
local Button2 = Foundation.Button
local ButtonVariant = Foundation.Enums.ButtonVariant
local ButtonSize = Foundation.Enums.ButtonSize
local InputSize = Foundation.Enums.InputSize
local IconName = Foundation.Enums.IconName
local IconButton = Foundation.IconButton
local View = Foundation.View
local useTokens = Foundation.Hooks.useTokens
local Logout = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LaunchApp = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local RegisterPasskey = require(Modules.LuaApp.Thunks.Authentication.RegisterPasskey)
local AppStorageUtilities = require(Modules.LuaApp.Thunks.Authentication.AppStorageUtilities)
local luaLogoutReasonNames = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local SetPassword = require(Modules.LuaApp.Thunks.Authentication.SetPassword)
local User = require(Modules.LuaApp.Thunks.Authentication.User)
local UpdateUserEmail = require(Modules.LuaApp.Thunks.Authentication.EmailVerification.UpdateUserEmail)
local isStringEmail = require(Modules.LuaApp.Util.isStringEmail)
local MemStorageKeys = require(Modules.LuaApp.Enum.MemStorageKeys)
local CredentialsProtocol = require(CorePackages.Workspace.Packages.CredentialsProtocol)
local Constants = CredentialsProtocol.Constants
local default = CredentialsProtocol.CredentialsProtocol.default
local GetUserAppLaunchInfo = require(CorePackages.Workspace.Packages.AuthCommon).Http.Requests.GetUserAppLaunchInfo
local GetAccountCreationMetadata = require(CorePackages.Workspace.Packages.AuthSignup).Requests.GetAccountCreationMetadata
local LaunchContext = require(CorePackages.Workspace.Packages.AppStartup).Enums.LaunchContext
local SystemThemeFeature = require(Modules.LuaApp.Components.EventReceivers.SystemThemeFeature)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local IosAuthServiceExperiment = require(Modules.LuaApp.Experiment.IosAuthServiceExperiment)
local ToastRodux = require(CorePackages.Workspace.Packages.ToastRodux)
local SetCurrentToastMessage = ToastRodux.Actions.SetCurrentToastMessage
local ToastType = ToastRodux.Enums.ToastType
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagEnableSavePasswordAfterRecovery = SharedFlags.GetFFlagEnableSavePasswordAfterRecovery
local FFlagEnablePWManagerSignupCheck = SharedFlags.FFlagEnablePWManagerSignupCheck
local FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment = SharedFlags.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment
local FFlagEnableSignupFoundationalizeBackgroundAndText = SharedFlags.FFlagEnableSignupFoundationalizeBackgroundAndText
local FFlagEnableAddAuthMethodPageEmailSignup = SharedFlags.FFlagEnableAddAuthMethodPageEmailSignup
local v82 = game:DefineFastFlag("EnableAuthlessSignup", false)
local v83 = game:DefineFastFlag("CheckAndEnforceALNetworkCheck", false)
local v84 = game:DefineFastFlag("UseMultiPageSignupTextOnAddAuthMethodPage", false)
local v85 = game:DefineFastFlag("ShouldSkipPasskeySignupAutoFocus", false)
local v86 = game:DefineFastInt("LuaAppCmPasswordRegistrationDelay", 2)
local v87 = game:DefineFastFlag("PasskeySignupAndroidIterationEnabled", false)
local v88 = game:DefineFastFlag("EnableAuthedUsernameCMFix", false)
local EngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
local v90 = game:DefineFastFlag("AddAuthMethodUpdatedText", false)
local v91 = game:DefineFastString("AddAuthMethodEmailPlaceholder", "example@email.com")
local v92 = game:DefineFastFlag("EnableAddAuthMethodPageEmailSignupSetIsUnder13", false)
local v93 = game:DefineFastFlag("EnableAddAuthMethodPagePasskeyOrOTPText", false)
local v94 = game:DefineFastFlag("EnableStandardPasskeyButton", false)
local v95 = not v84 and 60 or 24
local t1 = {
	passwordFirst = {
		password = 4,
		spacing = 5,
		continue = 6,
		divider = 7,
		passkeyV2 = 8,
		passkeyNonV2 = 7
	},
	passkeyFirst = {
		password = 6,
		spacing = 7,
		continue = 8,
		divider = 5,
		passkey = 4
	},
	showCreatePasswordButton = {
		passkey = 4,
		divider = 5,
		createPasswordButton = 6
	},
	showCreatePasswordButtonPasswordFirst = {
		createPasswordButton = 4,
		divider = 5,
		passkey = 6
	},
	showPasswordSectionOnly = {
		password = 4,
		spacing = 5,
		continue = 6
	}
}

if FFlagEnableAddAuthMethodPageEmailSignup then
	t1.passwordFirst = {
		password = 4,
		spacing = 5,
		continue = 6,
		divider = 8,
		passkeyV2 = 9,
		passkeyNonV2 = 8
	}
end

local GetFIntLuaAppCredentialsProtocolAvailableTimeout = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local GetFFlagEnableMultiPageSignupExperiment = require(Modules.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment)
local PasskeyUpsell = require(CorePackages.Workspace.Packages.PasskeyUpsell)
local PasskeyUpsellScreen = PasskeyUpsell.Components.PasskeyUpsellScreen
local PasskeyUpsellSource = PasskeyUpsell.Enums.PasskeyUpsellSource
local FFlagAddReasonToEveryLogout = SharedFlags.FFlagAddReasonToEveryLogout
local FFlagDisableMemStorageServicePasswordEvent = SharedFlags.FFlagDisableMemStorageServicePasswordEvent
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local default2 = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local iosAuthServiceSignupPasswordSave = require(Modules.LuaApp.Analytics.Events.Auth.iosAuthServiceSignupPasswordSave)
local GetTextBoundsParams = Instance.new("GetTextBoundsParams")

GetTextBoundsParams.Text = "_unused"
GetTextBoundsParams.Font = Font.fromEnum(AppFonts.default:getDefault())
GetTextBoundsParams.Size = 19
GetTextBoundsParams.Width = 0
TextService:GetTextBoundsAsync(GetTextBoundsParams)

return function(_: {[any]: any}) -- line: 166
	-- upvalues: useRoactService (copy), RoactNetworking (copy), AppGuiService (copy), RoactAnalyticsAuthEvents (copy), RoactAnalytics (copy), AppOmniRecommendationsRequest (copy), useAppPolicy (copy), FFlagEnablePWManagerSignupCheck (copy), GetPasswordManagerUsageStore (copy), React (copy), RoactAppExperiment (copy), AppBtidLayers (copy), FFlagEnableSignupFoundationalizeBackgroundAndText (copy), GetFFlagEnableMultiPageSignupExperiment (copy), v87 (copy), FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment (copy), FFlagEnableAddAuthMethodPageEmailSignup (copy), v93 (copy), v82 (copy), v83 (copy), v94 (copy), IosAuthServiceExperiment (copy), useStyle (copy), useTokens (copy), useDispatch (copy), ReactFocusNavigation (copy), usePreferredInput (copy), AppStorageUtilities (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), InputValidity (copy), isStringEmail (copy), v88 (copy), Players (copy), EventStreamConstants (copy), UpdateUserEmail (copy), LaunchApp (copy), LaunchContext (copy), SetPassword (copy), FFlagDisableMemStorageServicePasswordEvent (copy), HttpService (copy), iosAuthServiceSignupPasswordSave (copy), default (copy), Constants (copy), Logger (copy), GetFFlagEnableSavePasswordAfterRecovery (copy), Promise (copy), v86 (copy), SetCurrentToastMessage (copy), ToastType (copy), RegisterPasskey (copy), Logout (copy), luaLogoutReasonNames (copy), v85 (copy), Responsive (copy), default2 (copy), TelemetryConfigs (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), GetUserAppLaunchInfo (copy), v92 (copy), User (copy), FFlagAddReasonToEveryLogout (copy), GuiService (copy), GetAccountCreationMetadata (copy), PasskeyUpsellScreen (copy), PasskeyUpsellSource (copy), withLocalization (copy), v90 (copy), t1 (copy), Button2 (copy), ButtonVariant (copy), Foundation (copy), InputSize (copy), Button (copy), ButtonType (copy), LinkButton (copy), FullscreenPageWithSafeArea (copy), DarkTheme (copy), PageWithDisclaimerLinks (copy), ImageSetButton (copy), Images (copy), View (copy), IconButton (copy), IconName (copy), ButtonSize (copy), v95 (copy), v84 (copy), MultiPageSignupText (copy), CollapsingTextInputValidator (copy), EngineFeature (copy), PasswordValidator (copy), TextInputBoxWithBorder (copy), AuthStatefulRoundCornerBorder (copy), v91 (copy), DividerWithText (copy)
	local v109 = useRoactService(RoactNetworking)
	local v110 = useRoactService(AppGuiService)
	local v111 = useRoactService(RoactAnalyticsAuthEvents)
	local v112 = useRoactService(RoactAnalytics)
	local v113 = useRoactService(AppOmniRecommendationsRequest)
	local v114 = useAppPolicy(function(p1) -- line: 172
		return p1
	end)
	local v115 = if not FFlagEnablePWManagerSignupCheck then nil else GetPasswordManagerUsageStore(false)

	if FFlagEnablePWManagerSignupCheck then
		React.useEffect(function() -- line: 181
			-- upvalues: v115 (copy)
			if v115 then
				v115.resetAll()
			end
		end, { v115 })
	end

	local v116, v117 = React.useState(true)
	local v118 = RoactAppExperiment.useBrowserTrackerExperiment({ AppBtidLayers.AuthenticationStylingLayer }, function(p2) -- line: 192
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldUseFoundationBackgroundColor = (p2[AppBtidLayers.AuthenticationStylingLayer] or {}).shouldUseFoundationBackgroundColor
		}
	end)
	local v119 = FFlagEnableSignupFoundationalizeBackgroundAndText and v118.shouldUseFoundationBackgroundColor
	local v120 = RoactAppExperiment.useBrowserTrackerExperiment({ AppBtidLayers.SignupLayer }, function(p3) -- line: 204
		-- upvalues: AppBtidLayers (copy)
		local v191 = p3[AppBtidLayers.SignupLayer] or {}

		return {
			shouldUseV2FallbackScreen = v191.shouldUseV2FallbackScreen,
			shouldSuppressPasskeyOnAddAuthMethodPage = v191.shouldSuppressPasskeyOnAddAuthMethodPage,
			shouldWaitForPasswordRegistration = v191.shouldWaitForPasswordRegistration,
			shouldDelayPasswordRegistration = v191.shouldDelayPasswordRegistration,
			showPasskeyNudgingHeader = v191.showPasskeyNudgingHeader,
			showPasskeyBeforePassword = v191.showPasskeyBeforePassword,
			showPasskeyNudgingParagraph = v191.showPasskeyNudgingParagraph,
			shouldRemoveOrDivider = v191.shouldRemoveOrDivider,
			shouldUsePrimaryPasskeyButton = v191.shouldUsePrimaryPasskeyButton,
			shouldUseSecondaryPasswordNextButton = v191.shouldUseSecondaryPasswordNextButton,
			showPasskeyIconOnAddAuthMethodPage = v191.showPasskeyIconOnAddAuthMethodPage,
			showPasswordLockIconOnAddAuthMethodPage = v191.showPasswordLockIconOnAddAuthMethodPage,
			showPasskeyEducationalPage = v191.showPasskeyEducationalPage,
			shouldShowCreateAPasswordButton = v191.shouldShowCreateAPasswordButton,
			shouldDisablePasswordFocus = v191.shouldDisablePasswordFocus,
			shouldShowEmailSignupO13 = v191.shouldShowEmailSignupO13,
			shouldShowEmailSignupU13 = v191.shouldShowEmailSignupU13,
			shouldShowPasskeyOrOTPText = v191.shouldShowPasskeyOrOTPText,
			shouldShowSetupLaterInCornerWhenEmailProvided = v191.shouldShowSetupLaterInCornerWhenEmailProvided,
			shouldShowSetupLaterInBottomRowWhenEmailProvided = v191.shouldShowSetupLaterInBottomRowWhenEmailProvided,
			shouldUseStandardPasskeyButton = v191.shouldUseStandardPasskeyButton
		}
	end)
	local shouldUseV2FallbackScreen = v120.shouldUseV2FallbackScreen
	local v122 = GetFFlagEnableMultiPageSignupExperiment() and v120.shouldSuppressPasskeyOnAddAuthMethodPage
	local v123 = v87 and v120.shouldWaitForPasswordRegistration
	local v124 = v87 and v120.shouldDelayPasswordRegistration
	local v125 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.showPasskeyNudgingHeader
	local v126 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.showPasskeyBeforePassword
	local v127 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.showPasskeyNudgingParagraph
	local v128 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.shouldRemoveOrDivider
	local v129 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.shouldUsePrimaryPasskeyButton
	local v130 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.shouldUseSecondaryPasswordNextButton
	local v131 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.showPasskeyIconOnAddAuthMethodPage
	local v132 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.showPasswordLockIconOnAddAuthMethodPage
	local v133 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.showPasskeyEducationalPage
	local v134 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.shouldShowCreateAPasswordButton
	local v135 = FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment and v120.shouldDisablePasswordFocus
	local v136 = FFlagEnableAddAuthMethodPageEmailSignup and if not v116 then v120.shouldShowEmailSignupO13 else v120.shouldShowEmailSignupU13
	local v137 = v93 and v120.shouldShowPasskeyOrOTPText
	local v138, v139 = React.useState(false)
	local v140 = v82 and v136

	if v83 then
		v140 = v140 and v138
	end

	local v141 = v140 and v120.shouldShowSetupLaterInCornerWhenEmailProvided
	local v142 = v140 and v120.shouldShowSetupLaterInBottomRowWhenEmailProvided
	local v143 = v94 and v120.shouldUseStandardPasskeyButton
	local v144 = v136 and v116
	local v145, v146 = React.useState(true)
	local v147, v148 = React.useState(false)
	local v149, v150 = React.useState(true)
	local v151, v152 = React.useState("")
	local v153, v154 = React.useState("")
	local v155, v156 = React.useState("")
	local v157, v158 = React.useState(false)
	local v159, v160 = React.useState("")
	local v161, v162 = React.useState(false)
	local v163, v164 = React.useState(true)
	local v165, v166 = React.useState(false)
	local v167, v168 = React.useState(false)
	local v169 = React.useRef(nil)
	local v170 = React.useRef(nil)
	local v171 = IosAuthServiceExperiment.useIsIosAuthServiceEnabled()
	local v172 = useStyle()
	local v173 = useTokens()
	local v174 = useDispatch()
	local v175 = ReactFocusNavigation.useFocusGuiObject()
	local v176 = usePreferredInput()

	local function v177() -- line: 334
		-- upvalues: v146 (copy), v145 (copy)
		v146(not v145)
	end
	local function v178(p4, p5) -- line: 338
		-- upvalues: v152 (copy), v162 (copy), InputValidity (copy)
		v152(p4)
		v162(p5 == InputValidity.Valid)
	end
	local function v179(p6) -- line: 343
		-- upvalues: v154 (copy), isStringEmail (copy), v156 (copy), v158 (copy), v162 (copy)
		local p6Text = p6.Text

		v154(p6Text)

		local v197 = isStringEmail((tostring(p6Text)))

		if v197 or p6Text == "" then
			v156("")
			v158(false)
		else
			v156("")
			v158(true)
		end

		v162(v197)
	end
	local function v180() -- line: 375
		-- upvalues: v162 (copy), v111 (copy), EventStreamConstants (copy), v136 (copy), v174 (copy), UpdateUserEmail (copy), v109 (copy), v153 (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), LaunchApp (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), v156 (copy), v158 (copy), SetPassword (copy), v151 (copy), v88 (copy), v159 (copy), Players (copy), shouldUseV2FallbackScreen (copy), v165 (copy), v171 (copy), FFlagDisableMemStorageServicePasswordEvent (copy), HttpService (copy), iosAuthServiceSignupPasswordSave (copy), default (copy), Constants (copy), Logger (copy), v115 (copy), GetFFlagEnableSavePasswordAfterRecovery (copy), v123 (copy), v124 (copy), Promise (copy), v86 (copy), SetCurrentToastMessage (copy), ToastType (copy), v172 (copy)
		v162(false)
		v111.reportAuthButtonClick(EventStreamConstants.Context.PasskeySignupPasswordFallback, EventStreamConstants.Button.Continue)

		if v136 then
			v111.reportAuthButtonClick(EventStreamConstants.Context.SignupEmailOnAddAuthMethod, EventStreamConstants.Button.SubmitEmail)
			v174(UpdateUserEmail(v109, v153, nil)):andThen(function() -- line: 389
				-- upvalues: v111 (copy), EventStreamConstants (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), v162 (copy)
				v111.reportAuthModalShown(EventStreamConstants.Context.SignupEmailOnAddAuthMethod, EventStreamConstants.State.Success)
				AppStorageUtilities.setSignupActionRequired("")
				AppStorageUtilities.setPasskeySignupUsername("")
				AppStorageUtilities.flush()

				local v217 = AppStorageUtilities.getAuthenticatedTheme()

				if v217 ~= "" then
					v168(true)
					MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v217)
				end

				SystemThemeFeature.ClearThemeOverride()
				v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))
				v162(true)
			end, function(p7) -- line: 401
				-- upvalues: v111 (copy), EventStreamConstants (copy), v156 (copy), v158 (copy), v162 (copy)
				local v219 = p7 and (not not p7.Message and (p7.Message ~= "" and p7.Message)) or ""

				v111.reportAuthClientError(EventStreamConstants.Context.SignupEmailOnAddAuthMethod, v219)
				v156(v219)
				v158(true)
				v162(true)
			end)

			return
		end

		SetPassword(v109, v151):andThen(function(_) -- line: 414
			-- upvalues: AppStorageUtilities (copy), v88 (copy), v159 (copy), Players (copy), shouldUseV2FallbackScreen (copy), v151 (copy), v165 (copy), v171 (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), MemStorageKeys (copy), HttpService (copy), v111 (copy), EventStreamConstants (copy), iosAuthServiceSignupPasswordSave (copy), default (copy), Constants (copy), Logger (copy), v115 (copy), GetFFlagEnableSavePasswordAfterRecovery (copy), v168 (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), v162 (copy), v123 (copy), v124 (copy), Promise (copy), v86 (copy)
			AppStorageUtilities.setSignupActionRequired("")
			AppStorageUtilities.setPasskeySignupUsername("")
			AppStorageUtilities.flush()

			local v221

			if v88 and (v159 and v159 ~= "") then
				v221 = v159
			else
				local v222 = AppStorageUtilities.getPasskeySignupUsername()

				v221 = if not v222 or v222 == "" then not Players.LocalPlayer and "" or (Players.LocalPlayer.Name or "") else v222
			end

			local v223 = v221

			if shouldUseV2FallbackScreen and v223 and v151 then
				local v224 = v165 and v171

				if not FFlagDisableMemStorageServicePasswordEvent and not v224 then
					MemStorageService:Fire(MemStorageKeys.AuthenticatedCredentials, HttpService:JSONEncode({
						cvalue = v223,
						password = v151,
						authType = "signup"
					}))
				end

				if v165 then
					local t3 = {
						username = v223,
						password = v151
					}
					local json = HttpService:JSONEncode(t3)

					local function v227() -- line: 445
						-- upvalues: v111 (copy), EventStreamConstants (copy), iosAuthServiceSignupPasswordSave (copy), v223 (copy), default (copy), json (copy), Constants (copy), HttpService (copy), Logger (copy), v115 (copy), GetFFlagEnableSavePasswordAfterRecovery (copy), v171 (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), v162 (copy)
						v111.reportAuthButtonClick(EventStreamConstants.Context.IosAuthServicePasswordFallback, EventStreamConstants.Button.IosAuthServiceSavePasswordAttempted)
						iosAuthServiceSignupPasswordSave.reportAttempted(v223)

						return default:registerCredentials(default.CredentialsTypes.password, json, Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(p9) -- line: 459
							-- upvalues: HttpService (copy), Logger (copy), v115 (copy), v111 (copy), EventStreamConstants (copy), iosAuthServiceSignupPasswordSave (copy), v223 (copy), GetFFlagEnableSavePasswordAfterRecovery (copy), v171 (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), v162 (copy)
							local v243 = if not p9 then {} else HttpService:JSONDecode(p9)

							if v243 and v243.errorCode == nil then
								Logger:info("Successfully registered password.")

								if v115 then
									v115.setPasswordManagerMediatedSignup(true)
								end

								v111.reportAuthButtonClick(EventStreamConstants.Context.CMPasswordPasskeyFallback, EventStreamConstants.Button.SavePassword)
								v111.reportAuthButtonClick(EventStreamConstants.Context.IosAuthServicePasswordFallback, EventStreamConstants.Button.IosAuthServiceSavePasswordSuccess)
								iosAuthServiceSignupPasswordSave.reportSuccess(v223)
							else
								Logger:warning("Error registering password: " .. tostring(v243.errorMsg))
								v111.reportAuthButtonClick(EventStreamConstants.Context.IosAuthServicePasswordFallback, EventStreamConstants.Button.IosAuthServiceSavePasswordFailure, v243.errorMsg or "unknown")
								iosAuthServiceSignupPasswordSave.reportFailure(v223, v243.errorMsg or "unknown")
							end

							if GetFFlagEnableSavePasswordAfterRecovery() and v171 then
								local v244 = AppStorageUtilities.getAuthenticatedTheme()

								if v244 ~= "" then
									v168(true)
									MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v244)
								end

								SystemThemeFeature.ClearThemeOverride()
								v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))
								v162(true)
							end
						end, function(p10) -- line: 508
							-- upvalues: Logger (copy), v111 (copy), EventStreamConstants (copy), iosAuthServiceSignupPasswordSave (copy), v223 (copy), GetFFlagEnableSavePasswordAfterRecovery (copy), v171 (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), v162 (copy)
							Logger:warning("Error registering password: " .. tostring(p10))
							v111.reportAuthButtonClick(EventStreamConstants.Context.IosAuthServicePasswordFallback, EventStreamConstants.Button.IosAuthServiceSavePasswordFailure, (tostring(p10)))
							iosAuthServiceSignupPasswordSave.reportFailure(v223, (tostring(p10)))

							if GetFFlagEnableSavePasswordAfterRecovery() and v171 then
								local v246 = AppStorageUtilities.getAuthenticatedTheme()

								if v246 ~= "" then
									v168(true)
									MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v246)
								end

								SystemThemeFeature.ClearThemeOverride()
								v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))
								v162(true)
							end
						end)
					end

					if GetFFlagEnableSavePasswordAfterRecovery() and v171 then
						return v227()
					end

					local v228

					if v123 then
						v228 = v227()
						v228:await()
					else
						v228 = if not v124 then v227() else Promise.delay(v86):andThen(v227)
					end

					return v228:andThen(function() -- line: 555
						-- upvalues: AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), v162 (copy)
						local v241 = AppStorageUtilities.getAuthenticatedTheme()

						if v241 ~= "" then
							v168(true)
							MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v241)
						end

						SystemThemeFeature.ClearThemeOverride()
						v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))
						v162(true)
					end)
				end

				v111.reportAuthButtonClick(EventStreamConstants.Context.IosAuthServicePasswordFallback, EventStreamConstants.Button.IosAuthServiceSavePasswordSkipped, EventStreamConstants.State.IosAuthServiceProtocolNotAvailable)
				iosAuthServiceSignupPasswordSave.reportSkipped(EventStreamConstants.State.IosAuthServiceProtocolNotAvailable)
			end

			local v229 = AppStorageUtilities.getAuthenticatedTheme()

			if v229 ~= "" then
				v168(true)
				MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v229)
			end

			SystemThemeFeature.ClearThemeOverride()
			v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))
			v162(true)

			return Promise.resolve()
		end, function(_) -- line: 588
			-- upvalues: v174 (copy), SetCurrentToastMessage (copy), ToastType (copy), v172 (copy), v162 (copy)
			v174(SetCurrentToastMessage({
				toastType = ToastType.NetworkingError,
				toastMessage = "Authentication.Login.Response.SomethingWentWrong",
				toastIconColorStyle = {
					Color = v172.Theme.Alert.Color,
					Transparency = 0
				},
				slideIn = true
			}))
			v162(true)
		end)
	end
	local function v181() -- line: 603
		-- upvalues: v163 (copy), v164 (copy), v111 (copy), EventStreamConstants (copy), RegisterPasskey (copy), v109 (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), Promise (copy)
		if not v163 then
			return
		end

		v164(false)
		v111.reportAuthButtonClick(EventStreamConstants.Context.PasskeySignupPasswordFallback, EventStreamConstants.Button.SetupPasskey)

		return RegisterPasskey(v109):andThen(function(_) -- line: 615
			-- upvalues: v111 (copy), EventStreamConstants (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy), Promise (copy)
			v111.reportAuthModalShown(EventStreamConstants.Context.SignupPasswordFallbackPasskeyCreated, "success")
			AppStorageUtilities.setSignupActionRequired("")
			AppStorageUtilities.setPasskeySignupUsername("")
			AppStorageUtilities.flush()

			local v232 = AppStorageUtilities.getAuthenticatedTheme()

			if v232 ~= "" then
				v168(true)
				MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v232)
			end

			SystemThemeFeature.ClearThemeOverride()
			v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))

			return Promise.resolve()
		end, function(p13) -- line: 627
			-- upvalues: v111 (copy), EventStreamConstants (copy), v164 (copy), Promise (copy)
			if p13.name then
				v111.reportAuthModalShown(EventStreamConstants.Context.SignupPasswordFallbackPasskeyCreated, p13.name)

				if type(p13.body) == "string" then
					v111.reportAuthClientError(EventStreamConstants.Context.SignupPasswordFallbackPasskeyCreated, p13.body, p13.source)
				end
			else
				v111.reportAuthModalShown(EventStreamConstants.Context.SignupPasswordFallbackPasskeyCreated, "unknown")
			end

			v164(true)

			return Promise.resolve()
		end)
	end
	local function v182() -- line: 654
		-- upvalues: v111 (copy), EventStreamConstants (copy), AppStorageUtilities (copy), v174 (copy), Logout (copy), v109 (copy), v110 (copy), luaLogoutReasonNames (copy)
		v111.reportAuthButtonClick(EventStreamConstants.Context.PasskeySignupPasswordFallback, EventStreamConstants.Button.Close)
		AppStorageUtilities.setSignupActionRequired("")
		AppStorageUtilities.setPasskeySignupUsername("")
		AppStorageUtilities.flush()
		v174(Logout(v109, v110, luaLogoutReasonNames.MultiStepSignupCanceled))
	end

	React.useEffect(function() -- line: 666
		-- upvalues: v85 (copy), v169 (copy), v135 (copy), v170 (copy), v176 (copy), Responsive (copy), v175 (copy), v111 (copy), EventStreamConstants (copy), v136 (copy), default2 (copy), TelemetryConfigs (copy)
		if not v85 and v169.current then
			if v135 and v170.current then
				if v176 == Responsive.Input.Directional then
					v175(v170.current)
				end
			else
				v169.current:CaptureFocus()
			end
		end

		v111.reportAuthPageload(EventStreamConstants.Context.PasskeySignupPasswordFallback)

		if v136 then
			v111.reportAuthPageload(EventStreamConstants.Context.SignupEmailOnAddAuthMethod)
		end

		default2:logRobloxTelemetryCounter(TelemetryConfigs.AddAuthMethodPageMountTelemetryConfig, 1)
	end, {})
	React.useEffect(function() -- line: 692
		-- upvalues: v167 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy)
		if not v167 then
			MemStorageService:Fire(MemStorageKeys.ThemeUpdate, "dark")
			SystemThemeFeature.SetDarkThemeOverride()
		end
	end, { v172 })
	React.useEffect(function() -- line: 701
		-- upvalues: shouldUseV2FallbackScreen (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), v111 (copy), EventStreamConstants (copy), v166 (copy), Logger (copy)
		if shouldUseV2FallbackScreen then
			default:isAvailable(default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p14) -- line: 708
				-- upvalues: v111 (copy), EventStreamConstants (copy), v166 (copy)
				local v235 = false

				if p14.password and p14.password.isAvailable then
					v235 = true
				end

				v111.reportAuthPageload(EventStreamConstants.Context.CMPasswordPasskeySignup, (tostring(v235)))
				v166(v235)
			end):catch(function(p15) -- line: 722
				-- upvalues: Logger (copy)
				Logger:warning("Error checking for available credential types. Error: ", p15)
			end)
		end
	end, { shouldUseV2FallbackScreen })
	React.useEffect(function() -- line: 728
		-- upvalues: GetUserAppLaunchInfo (copy), v109 (copy), v88 (copy), v160 (copy), v92 (copy), v117 (copy), User (copy), AppStorageUtilities (copy), FFlagAddReasonToEveryLogout (copy), v174 (copy), Logout (copy), GuiService (copy), luaLogoutReasonNames (copy)
		GetUserAppLaunchInfo(v109):andThen(function(p16) -- line: 729
			-- upvalues: v88 (copy), v160 (copy), v92 (copy), v117 (copy), User (copy), AppStorageUtilities (copy), FFlagAddReasonToEveryLogout (copy), v174 (copy), Logout (copy), v109 (copy), GuiService (copy), luaLogoutReasonNames (copy)
			local name = nil

			if p16 and p16.responseBody then
				name = p16.responseBody.name
			end

			if name and name ~= "" then
				if v88 then
					v160(name)
				end

				if v92 then
					v117(User.fromUserInfoRequest(p16).isUnder13)

					return
				end
			else
				AppStorageUtilities.setSignupActionRequired("")
				AppStorageUtilities.setPasskeySignupUsername("")
				AppStorageUtilities.flush()

				if FFlagAddReasonToEveryLogout then
					v174(Logout(v109, GuiService, luaLogoutReasonNames.MultiStepSignupResetIncompleteState))

					return
				end

				v174(Logout(v109, GuiService))
			end
		end):catch(function(_) -- line: 750
			-- upvalues: AppStorageUtilities (copy), FFlagAddReasonToEveryLogout (copy), v174 (copy), Logout (copy), v109 (copy), GuiService (copy), luaLogoutReasonNames (copy)
			AppStorageUtilities.setSignupActionRequired("")
			AppStorageUtilities.setPasskeySignupUsername("")
			AppStorageUtilities.flush()

			if FFlagAddReasonToEveryLogout then
				v174(Logout(v109, GuiService, luaLogoutReasonNames.MultiStepSignupResetIncompleteState))

				return
			end

			v174(Logout(v109, GuiService))
		end)
	end, {})
	React.useEffect(function() -- line: 760
		-- upvalues: v83 (copy), EventStreamConstants (copy), GetAccountCreationMetadata (copy), v109 (copy), v139 (copy), v111 (copy)
		if v83 then
			local ALError = EventStreamConstants.State.ALError

			GetAccountCreationMetadata(v109):andThen(function(p18) -- line: 764
				-- upvalues: ALError (ref), EventStreamConstants (copy), v139 (copy)
				if p18 and (p18.responseBody and p18.responseBody.isEligibleForALSignup == true) then
					ALError = EventStreamConstants.State.ALCheckSuccess
					v139(true)

					return
				end

				ALError = EventStreamConstants.State.ALCheckFail
			end):catch(function() -- line: 772
				-- upvalues: ALError (ref), EventStreamConstants (copy)
				ALError = EventStreamConstants.State.ALError
			end):finally(function() -- line: 775
				-- upvalues: v111 (copy), EventStreamConstants (copy), ALError (ref)
				v111.reportAuthPageload(EventStreamConstants.Context.AddAuthMethodPage, ALError)
			end)
		end
	end, {
		v109,
		v111.reportAuthPageload
	})

	local v183

	if v88 and v159 and v159 ~= "" then
		v183 = v159
	else
		local v184 = AppStorageUtilities.getPasskeySignupUsername()

		v183 = if not v184 or v184 == "" then not Players.LocalPlayer and "" or (Players.LocalPlayer.Name or "") else v184
	end

	local v185 = v183
	local v186 = React.useCallback(function(p19) -- line: 784
		-- upvalues: v111 (copy), EventStreamConstants (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy)
		v111.reportAuthButtonClick(EventStreamConstants.Context.PasskeySignupPasswordFallback, p19)
		AppStorageUtilities.setSignupActionRequired("")
		AppStorageUtilities.setPasskeySignupUsername("")
		AppStorageUtilities.flush()

		local v201 = AppStorageUtilities.getAuthenticatedTheme()

		if v201 ~= "" then
			v168(true)
			MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v201)
		end

		SystemThemeFeature.ClearThemeOverride()
		v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))
	end, {
		v114,
		v111.reportAuthButtonClick,
		v174,
		v109,
		v113,
		function() -- line: 315
			-- upvalues: AppStorageUtilities (copy)
			AppStorageUtilities.setSignupActionRequired("")
			AppStorageUtilities.setPasskeySignupUsername("")
			AppStorageUtilities.flush()
		end,
		function() -- line: 323
			-- upvalues: AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy)
			local v192 = AppStorageUtilities.getAuthenticatedTheme()

			if v192 ~= "" then
				v168(true)
				MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v192)
			end

			SystemThemeFeature.ClearThemeOverride()
		end,
		v112
	})

	if v133 and not v147 then
		return (React.createElement(PasskeyUpsellScreen, {
			resetNavigationHistory = function(_) --[[ resetNavigationHistory ]] -- line: 807
				-- upvalues: v111 (copy), EventStreamConstants (copy), AppStorageUtilities (copy), v168 (copy), MemStorageService (copy), MemStorageKeys (copy), SystemThemeFeature (copy), v174 (copy), LaunchApp (copy), v109 (copy), v113 (copy), v112 (copy), v114 (copy), LaunchContext (copy)
				v111.reportAuthModalShown(EventStreamConstants.Context.SignupPasswordFallbackPasskeyCreatedFromEducation, "success")
				AppStorageUtilities.setSignupActionRequired("")
				AppStorageUtilities.setPasskeySignupUsername("")
				AppStorageUtilities.flush()

				local v203 = AppStorageUtilities.getAuthenticatedTheme()

				if v203 ~= "" then
					v168(true)
					MemStorageService:Fire(MemStorageKeys.ThemeUpdate, v203)
				end

				SystemThemeFeature.ClearThemeOverride()
				v174(LaunchApp(v109, v113, v112, v114, LaunchContext.SignUp))
			end,
			onDismiss = function() --[[ onDismiss ]] -- line: 818
				-- upvalues: v148 (copy)
				v148(true)
			end,
			source = PasskeyUpsellSource.AddAuthMethodPage
		}))
	end

	local v187 = v172.Font.BaseSize * v172.Font.Header1.RelativeSize

	return withLocalization({
		userGreetingHeaderText = {
			"Authentication.SignUp.Heading.UserGreetingWithName",
			username = v185
		},
		userGreetingHeaderTextWithPasskeyPassword = {
			"Authentication.SignUp.Heading.UserGreetingWithNameAndPasskeyPassword",
			username = v185
		},
		userPasswordOnlyGreetingHeaderText = {
			"Authentication.SignUp.Title",
			username = v185
		},
		continueText = "Authentication.SignUp.Label.Continue",
		doneText = "CommonUI.Controls.Action.Done",
		passwordHint = "Authentication.SignUp.Label.Use8CharPassword",
		signUpLabel = "Authentication.SignUp.Action.CreateAccount",
		oneMoreStepText = "Authentication.SignUp.Description.OneMoreStep",
		setUpPasskeyLabel = "Authentication.SignUp.Label.SetUpPasskey",
		createAPasskeyLabel = "Authentication.SignUp.Action.CreateAPasskey",
		createAPasswordButtonText = "Authentication.SignUp.Heading.PasswordPage",
		createAPasswordText = "Authentication.SignUp.Description.CreateAPassword",
		ensureNeverLoseAccountText = "Authentication.SignUp.Description.EnsureNeverLoseAccount",
		dividerText = "Authentication.SignUp.Description.Or",
		secureAccountWithPasskeyText = "Authentication.SignUp.Description.SecureAccountWithPasskeyText",
		createdAccountChooseSigninText = "Authentication.SignUp.Header.CreatedAccountChooseSignin",
		createAccountPasskeyEmphasisDescriptionText = "Authentication.SignUp.Description.CreateAccountPasskeyEmphasisDescription",
		emailLabelText = "Authentication.SignUp.Label.EnterYourEmail",
		parentEmailLabelText = "Authentication.SignUp.Label.EnterYourParentsEmail",
		invalidEmailText = "Feature.VerificationUpsell.Message.InvalidEmailAddress",
		parentEmailDisclaimerText = "Authentication.SignUp.Description.ParentEmailDisclaimer",
		createPasskeyOrOTPText = "Authentication.SignUp.Description.CreatePasskeyOrOTP",
		setupLaterText = "Authentication.SignUp.Action.SetupLater"
	})(function(p21) -- line: 855
		-- upvalues: shouldUseV2FallbackScreen (copy), v185 (copy), v134 (copy), v149 (copy), v125 (copy), v90 (copy), v127 (copy), v137 (copy), GetFFlagEnableMultiPageSignupExperiment (copy), v122 (copy), v126 (copy), t1 (copy), v129 (copy), React (copy), Button2 (copy), ButtonVariant (copy), v131 (copy), Foundation (copy), v181 (copy), v163 (copy), InputSize (copy), v170 (copy), v143 (copy), Button (copy), ButtonType (copy), LinkButton (copy), v130 (copy), v132 (copy), v150 (copy), FullscreenPageWithSafeArea (copy), v119 (copy), v173 (copy), DarkTheme (copy), PageWithDisclaimerLinks (copy), v144 (copy), ImageSetButton (copy), Images (copy), v182 (copy), View (copy), IconButton (copy), IconName (copy), ButtonSize (copy), v172 (copy), v187 (copy), v82 (copy), v141 (copy), v186 (copy), EventStreamConstants (copy), v95 (copy), v84 (copy), MultiPageSignupText (copy), v136 (copy), CollapsingTextInputValidator (copy), EngineFeature (copy), v178 (copy), PasswordValidator (copy), v145 (copy), v177 (copy), v169 (copy), TextInputBoxWithBorder (copy), v157 (copy), AuthStatefulRoundCornerBorder (copy), v179 (copy), v116 (copy), v155 (copy), v91 (copy), FFlagEnableAddAuthMethodPageEmailSignup (copy), v180 (copy), v161 (copy), v128 (copy), DividerWithText (copy), v142 (copy)
		local v205 = if not shouldUseV2FallbackScreen or not v185 then p21.oneMoreStepText else if not v134 or v149 then if not v125 then p21.userGreetingHeaderText else if not v90 then p21.userGreetingHeaderTextWithPasskeyPassword else p21.createdAccountChooseSigninText else p21.userGreetingHeaderText
		local v206 = if not v134 or v149 then if not v127 or not v137 then if not v127 or not v90 then if not v127 then p21.createAPasswordText else p21.secureAccountWithPasskeyText else p21.createAccountPasskeyEmphasisDescriptionText else p21.createPasskeyOrOTPText else p21.createAPasswordText

		if GetFFlagEnableMultiPageSignupExperiment() and v122 then
			v205 = p21.userPasswordOnlyGreetingHeaderText
			v206 = p21.ensureNeverLoseAccountText
		end

		local v207 = not v126 and "passwordFirst" or "passkeyFirst"

		if v134 then
			v207 = if not v149 or not v126 then not v149 and "showPasswordSectionOnly" or "showCreatePasswordButtonPasswordFirst" else "showCreatePasswordButton"
		end

		local v208 = t1[v207]
		local password = v208.password
		local spacing = v208.spacing
		local continue = v208.continue
		local divider = v208.divider
		local v213 = v208.passkey or if not shouldUseV2FallbackScreen then v208.passkeyNonV2 else v208.passkeyV2
		local createPasswordButton = v208.createPasswordButton
		local v215 = if not shouldUseV2FallbackScreen or not v129 then if not shouldUseV2FallbackScreen or not v143 then if not shouldUseV2FallbackScreen then React.createElement(LinkButton, {
			layoutOrder = v213,
			text = p21.setUpPasskeyLabel,
			onActivated = v181,
			isDisabled = not v163,
			buttonRef = v170
		}) else React.createElement(Button, {
			layoutOrder = v213,
			buttonType = ButtonType.Secondary,
			text = p21.createAPasskeyLabel,
			size = UDim2.new(1, 0, 0, 48),
			onActivated = v181,
			isDisabled = not v163,
			buttonRef = v170
		}) else React.createElement(Button2, {
			LayoutOrder = v213,
			variant = ButtonVariant.Standard,
			text = p21.createAPasskeyLabel,
			icon = if not v131 then nil else Foundation.Enums.IconName.Key,
			onActivated = v181,
			isDisabled = not v163,
			size = InputSize.Large,
			width = UDim.new(1, 0),
			buttonRef = v170
		}) else React.createElement(Button2, {
			LayoutOrder = v213,
			variant = ButtonVariant.Emphasis,
			text = p21.createAPasskeyLabel,
			icon = if not v131 then nil else Foundation.Enums.IconName.Key,
			onActivated = v181,
			isDisabled = not v163,
			size = InputSize.Large,
			width = UDim.new(1, 0),
			buttonRef = v170
		})
		local v216 = createPasswordButton and React.createElement(Button2, {
			LayoutOrder = createPasswordButton,
			variant = if not v130 then ButtonVariant.Emphasis else ButtonVariant.Standard,
			text = p21.createAPasswordButtonText,
			icon = if not v132 then nil else Foundation.Enums.IconName.LockClosed,
			onActivated = function() --[[ onActivated ]] -- line: 960
				-- upvalues: v150 (copy)
				v150(false)
			end,
			size = InputSize.Large,
			width = UDim.new(1, 0)
		})

		return React.createElement(FullscreenPageWithSafeArea, {
			BackgroundTransparency = 0,
			includeStatusBar = true,
			BackgroundColor3 = if not v119 then DarkTheme.BackgroundUIDefault.Color else v173.Color.Surface.Surface_0.Color3
		}, {
			PageContent = React.createElement(PageWithDisclaimerLinks, {
				showFooter = v144
			}, {
				HeaderFrameListLayout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				HeaderPadding = React.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 25)
				}),
				HeaderFrame = React.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 48),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					LogoutButton = if shouldUseV2FallbackScreen then nil else React.createElement(ImageSetButton, {
						Size = UDim2.new(0, 36, 0, 36),
						AutoButtonColor = false,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 12, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5),
						ScaleType = Enum.ScaleType.Fit,
						Image = Images["icons/navigation/close"],
						ImageColor3 = DarkTheme.UIEmphasis.Color,
						ImageTransparency = 0,
						[React.Event.Activated] = v182
					}),
					HeaderBackButton = if not v134 or v149 then nil else React.createElement(View, {
						tag = "col",
						Size = UDim2.new(0, 36, 0, 36),
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 12, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5)
					}, {
						Button = React.createElement(IconButton, {
							icon = IconName.ChevronLargeLeft,
							variant = ButtonVariant.Utility,
							size = ButtonSize.Medium,
							onActivated = function() --[[ onActivated ]] -- line: 1022
								-- upvalues: v150 (copy)
								v150(true)
							end
						})
					}),
					Title = React.createElement("TextLabel", {
						Position = UDim2.new(0, 0, 0.5, 0),
						Size = UDim2.new(1, 0, 0, 0),
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						Text = p21.signUpLabel,
						TextWrapped = true,
						Font = v172.Font.CaptionHeader.Font,
						TextSize = v187,
						TextColor3 = DarkTheme.TextEmphasis.Color,
						TextTransparency = DarkTheme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center
					}),
					SetupLaterButton = if not v82 or not v141 then nil else React.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.new(1, -12, 0.5, 0),
						AnchorPoint = Vector2.new(1, 0.5),
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						Button = React.createElement(LinkButton, {
							text = p21.setupLaterText,
							fontStyle = "CaptionHeader",
							colorStyleDefault = "TextDefault",
							colorStyleHover = "TextDefault",
							onActivated = function() --[[ onActivated ]] -- line: 1053
								-- upvalues: v186 (copy), EventStreamConstants (copy)
								v186(EventStreamConstants.Button.SetupLaterCornerButton)
							end
						})
					})
				}),
				Divider = React.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0.5, 0, 0, 48),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = not v119 and 0 or 1,
					BackgroundColor3 = DarkTheme.UIEmphasis.Color,
					LayoutOrder = 2
				}),
				ContentFrame = React.createElement("Frame", {
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 1, -49),
					Position = UDim2.new(0.5, 0, 0, 49),
					AnchorPoint = Vector2.new(0.5, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					BorderSizePixel = 0
				}, {
					ContainerListLayout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, 5)
					}),
					ContentPadding = React.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24),
						PaddingTop = UDim.new(0, v95)
					}),
					MultiPageSignupText = if not v84 then nil else React.createElement(MultiPageSignupText, {
						layoutOrder = 1,
						titleText = v205,
						helpText = v206
					}),
					InstructionsHeadingText = if not v84 then React.createElement("TextLabel", {
						Text = v205,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = v172.Theme.TextEmphasis.Color,
						Font = v172.Font.Header1.Font,
						TextSize = 24
					}, {
						UIPadding = React.createElement("UIPadding", {
							PaddingBottom = UDim.new(0, 36)
						})
					}) else nil,
					InstructionsHeadingBody = if not v84 then React.createElement("TextLabel", {
						Text = v206,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextColor3 = v172.Theme.TextDefault.Color,
						Font = v172.Font.Header2.Font,
						TextSize = 14,
						TextWrapped = true
					}, {}) else nil,
					Spacing = React.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 16)
					}),
					PasswordValidator = if v136 or not password then nil else React.createElement(CollapsingTextInputValidator, {
						layoutOrder = password,
						titleTextKey = "CommonUI.Messages.Label.Password",
						summaryErrorTextKey = "Authentication.SignUp.Label.ErrorsWithPassword",
						prerequisiteMet = true,
						textInputType = EngineFeature and Enum.TextInputType.NewPassword or Enum.TextInputType.Password,
						onInputTextChanged = v178,
						onInputTextValidated = v178,
						validator = PasswordValidator,
						validatorAdditionalProps = {
							username = v185
						},
						returnKeyType = Enum.ReturnKeyType.Next,
						hidePassword = v145,
						onToggleCallback = v177,
						showDetailedError = true,
						textBoxRef = v169
					}),
					EmailInput = if not v136 or not password then nil else React.createElement(TextInputBoxWithBorder, {
						textInputType = Enum.TextInputType.Email,
						textInputHeight = 36,
						layoutOrder = password,
						borderState = if not v157 then AuthStatefulRoundCornerBorder.BorderState.Default else AuthStatefulRoundCornerBorder.BorderState.Error,
						textBarColor = v172.Theme.BackgroundUIContrast.Color,
						onChangeTextCallback = v179,
						labelText = if not v116 then p21.emailLabelText else p21.parentEmailLabelText,
						labelTextColor = v172.Theme.TextDefault.Color,
						errorText = if v155 == "" then if not v157 then nil else p21.invalidEmailText else v155,
						Size = UDim2.new(1, 0, 0, 0),
						placeholderText = v91,
						placeholderTextColor = v172.Theme.TextDefault.Color
					}),
					ParentEmailDisclaimer = if not FFlagEnableAddAuthMethodPageEmailSignup or (not v136 or (not v116 or not continue)) then nil else React.createElement("Frame", {
						LayoutOrder = continue + 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Padding = React.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 4)
						}),
						Label = React.createElement("TextLabel", {
							Text = p21.parentEmailDisclaimerText,
							TextColor3 = v172.Theme.TextDefault.Color,
							TextTransparency = v172.Theme.TextDefault.Transparency,
							Font = v172.Font.Footer.Font,
							TextSize = v172.Font.BaseSize * v172.Font.Footer.RelativeSize,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						})
					}),
					Spacing2 = if not spacing then nil else React.createElement("Frame", {
						LayoutOrder = spacing,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 8)
					}),
					ContinueButton = if not continue then nil else if not v130 then React.createElement(Button, {
						layoutOrder = continue,
						buttonType = ButtonType.PrimaryContextual,
						text = if not shouldUseV2FallbackScreen then p21.continueText else p21.doneText,
						size = UDim2.new(1, 0, 0, 48),
						onActivated = v180,
						isDisabled = not v161
					}) else React.createElement(Button2, {
						LayoutOrder = continue,
						variant = ButtonVariant.Standard,
						text = if not shouldUseV2FallbackScreen then p21.continueText else p21.doneText,
						icon = if not v132 then nil else Foundation.Enums.IconName.LockClosed,
						size = InputSize.Large,
						width = UDim.new(1, 0),
						onActivated = v180,
						isDisabled = not v161
					}),
					DividerWithText = if not shouldUseV2FallbackScreen or (v122 or (v128 or not divider)) then nil else React.createElement(DividerWithText, {
						layoutOrder = divider,
						width = 0,
						height = 0,
						size = UDim2.new(1, 0, 0, 32),
						font = v172.Font.BodySmall.Font,
						fontSize = v172.Font.BaseSize * v172.Font.BodySmall.RelativeSize,
						color3 = v172.Theme.TextMuted.Color,
						transparency = v172.Theme.TextMuted.Transparency,
						text = p21.dividerText,
						padding = 8
					}),
					CreatePasswordButton = v216,
					PasskeyButton = if not v122 and v213 then v215 else nil,
					SetupLaterBottomButton = if not v82 or not v142 then nil else React.createElement(Button2, {
						LayoutOrder = 11,
						variant = ButtonVariant.Utility,
						text = p21.setupLaterText,
						size = InputSize.Large,
						width = UDim.new(1, 0),
						onActivated = function() --[[ onActivated ]] -- line: 1263
							-- upvalues: v186 (copy), EventStreamConstants (copy)
							v186(EventStreamConstants.Button.SetupLaterRowButton)
						end
					})
				})
			})
		})
	end)
end
