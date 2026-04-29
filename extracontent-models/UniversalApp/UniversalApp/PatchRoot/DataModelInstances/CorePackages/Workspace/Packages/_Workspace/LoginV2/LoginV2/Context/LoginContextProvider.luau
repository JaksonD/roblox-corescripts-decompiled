local LoginV2 = script:FindFirstAncestor("LoginV2")
local LoginV2Parent = LoginV2.Parent
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local AppStorageService = game:GetService("AppStorageService")
local MemStorageService = game:GetService("MemStorageService")
local ContentProvider = game:GetService("ContentProvider")
local Enums = require(LoginV2.Enums)

require(LoginV2.Components.Types)

local UserIdentifierType = Enums.UserIdentifierType
local React = require(LoginV2Parent.React)
local Promise = require(LoginV2Parent.Promise)
local AuthCommon = require(LoginV2Parent.AuthCommon)
local OtpLogin = require(LoginV2Parent.OtpLogin)

require(LoginV2Parent.LuauPolyfill)

local useDispatch = require(LoginV2Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(LoginV2Parent.RobloxAppHooks).useRoactService
local useAppPolicy = require(LoginV2Parent.UniversalAppPolicy).useAppPolicy
local LaunchContext = require(LoginV2Parent.AppStartup).Enums.LaunchContext
local CloseCentralOverlay = require(LoginV2Parent.CentralOverlay).Thunks.CloseCentralOverlay
local SetCentralOverlay = require(LoginV2Parent.CentralOverlay).Actions.SetCentralOverlay
local NotificationType = require(LoginV2Parent.RobloxAppEnums).NotificationType
local CentralOverlayType = require(LoginV2Parent.RobloxAppEnums).CentralOverlayType
local AppPage = require(LoginV2Parent.RobloxAppEnums).AppPage
local OpenAccountSwitchingErrorOverlay = require(LoginV2Parent.AccountSwitcher).OpenAccountSwitchingErrorOverlay
local RenderChallenge = require(LoginV2Parent.GenericChallenges).Middleware.RenderChallenge
local ChallengeType = require(LoginV2Parent.GenericChallenges).Types.ChallengeType
local TwoStepVerificationActionType = require(LoginV2Parent.GenericChallenges).Types.TwoStepVerificationActionType
local NavigateDown = require(LoginV2Parent.NavigationRodux).Thunks.NavigateDown
local AuthAnalytics = require(LoginV2Parent.AuthAnalytics)
local StatusCodes = require(LoginV2Parent.Http).StatusCodes
local EventStreamConstants = require(LoginV2Parent.AuthAnalytics).EventStreamConstants
local RoactAppExperiment = require(LoginV2Parent.RoactAppExperiment)
local AppBtidLayers = require(LoginV2Parent.ExperimentLayers).AppBtidLayers
local RoactServiceTags = require(LoginV2Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTags.RoactNetworking
local RoactAnalytics = RoactServiceTags.RoactAnalytics
local AppLinking = RoactServiceTags.AppLinking
local CredentialsProtocol = require(LoginV2Parent.CredentialsProtocol)
local Constants = CredentialsProtocol.Constants
local default = CredentialsProtocol.CredentialsProtocol.default
local CredentialsProtocolErrorCodes = CredentialsProtocol.CredentialsProtocolErrorCodes
local SharedFlags = require(LoginV2Parent.SharedFlags)
local GetFFlagEnableLoginAccountSelector = SharedFlags.GetFFlagEnableLoginAccountSelector
local FFlagEnableLuaAccountSwitch = SharedFlags.FFlagEnableLuaAccountSwitch
local FFlagLuaEnableDidSwitchAccount = SharedFlags.FFlagLuaEnableDidSwitchAccount
local GetFStringVNGDownloadNowUrl = SharedFlags.GetFStringVNGDownloadNowUrl
local FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues = SharedFlags.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues
local FFlagAddReasonToEveryLogout = SharedFlags.FFlagAddReasonToEveryLogout
local FFlagEnablePasskeyLoginErrorLogging = SharedFlags.FFlagEnablePasskeyLoginErrorLogging
local FFlagDisableMemStorageServicePasswordEvent = SharedFlags.FFlagDisableMemStorageServicePasswordEvent
local FFlagEnableLoginV2ForcedUsernameOverride = SharedFlags.FFlagEnableLoginV2ForcedUsernameOverride
local FFlagEnablePWManagerLoginCheck = SharedFlags.FFlagEnablePWManagerLoginCheck
local FFlagEnablePWManagerSignupCheck = SharedFlags.FFlagEnablePWManagerSignupCheck
local GetFFlagKeystoreAutoLoginAvailable = SharedFlags.GetFFlagKeystoreAutoLoginAvailable
local GetFFlagBypassKeystoreLoginIxpV2 = SharedFlags.GetFFlagBypassKeystoreLoginIxpV2
local GetFFlagCheckIsAvailableForKeystoreOperations = SharedFlags.GetFFlagCheckIsAvailableForKeystoreOperations
local GetFFlagRemoveKeystoreIxpLogic = SharedFlags.GetFFlagRemoveKeystoreIxpLogic
local GetFFlagEnableAccountSwitcherFoundationDesign = SharedFlags.GetFFlagEnableAccountSwitcherFoundationDesign
local GetFFlagEnableAccountSwitcherRedesignIXP = SharedFlags.GetFFlagEnableAccountSwitcherRedesignIXP
local FFlagEnableNavigateToLoginAfterLogoutAll = SharedFlags.FFlagEnableNavigateToLoginAfterLogoutAll
local FFlagEnable2SVRecovery = SharedFlags.FFlagEnable2SVRecovery
local v62 = game:DefineFastFlag("LoginV2AwaitPasswordRegistration", false)
local v63 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2", false)
local LoginContext = require(LoginV2.Context.LoginContext)
local LoginStateReducer = require(LoginV2.Reducers.LoginStateReducer)
local StartAuthenticationByUser = require(LoginV2.Thunks.StartAuthenticationByUser)
local StartPasskeyAuthentication = require(LoginV2.Thunks.StartPasskeyAuthentication)
local LoginPageState = require(LoginV2.Enums.LoginPageState)
local LoginActionType = require(LoginV2.Enums.LoginActionType)
local Base64 = AuthCommon.Utils.Base64
local AccountSwitcherConstants = AuthCommon.Common.AccountSwitcherConstants
local LoginResult = AuthCommon.Models.LoginResult
local SetLoginResult = AuthCommon.Actions.SetLoginResult
local SetBackNavigationDisabled = AuthCommon.Actions.SetBackNavigationDisabled
local authClientError = AuthAnalytics.Events.authClientError
local authButtonClick = AuthAnalytics.Events.authButtonClick
local reportEphemeralCounter = AuthCommon.Analytics.reportEphemeralCounter
local AppStorageUtilities = AuthCommon.Utils.AppStorageUtilities
local LoginByPasskey = AuthCommon.Thunks.LoginByPasskey
local LoginByCode = AuthCommon.Thunks.LoginByCode
local LoginByOtp = AuthCommon.Thunks.LoginByOtp
local Login = AuthCommon.Thunks.Login
local User = AuthCommon.Thunks.User
local AppLoginCounterNames = AuthCommon.Enums.AppLoginCounterNames
local LoginErrorCodes = AuthCommon.Enums.LoginErrorCodes
local getTwoStepLoginErrorKey = AuthCommon.Utils.getTwoStepLoginErrorKey
local OpenCentralOverlayForLoginPasswordResetPrompt = AuthCommon.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt
local LogoutAllLoggedInUsers = AuthCommon.Thunks.LogoutAllLoggedInUsers
local AuthLocalStorageKeys = AuthCommon.Enums.AuthLocalStorageKeys
local OpenAccountSelector = AuthCommon.Thunks.OpenAccountSelector
local AuthMemStorageKeys = AuthCommon.Enums.AuthMemStorageKeys
local TwoStepRequests = AuthCommon.Http.Requests.TwoStepRequests
local LogoutReasonNames = AuthCommon.Enums.LogoutReasonNames
local PasskeyConstants = AuthCommon.Common.PasskeyConstants
local record2svCompletion = AuthCommon.Utils.record2svCompletion
local recordLogin = AuthCommon.Utils.recordLogin
local TwoStepErrorCodes = AuthCommon.Enums.TwoStepErrorCodes
local GetUserByUsername = AuthCommon.Thunks.GetUserByUsername
local KeystoreConstants = AuthCommon.Common.KeystoreConstants
local KeystoreAnalyticsEvents = AuthCommon.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommon.Analytics.KeystoreEventConstants
local FFlagEnableRecordLogin = require(LoginV2Parent.SharedFlags).FFlagEnableRecordLogin
local LoginMethods = AuthCommon.Enums.LoginMethods
local GetPasswordManagerUsageStore = AuthCommon.Stores.GetPasswordManagerUsageStore
local SendCode = OtpLogin.Thunks.SendCode
local ResendCode = OtpLogin.Thunks.ResendCode
local Constants2 = OtpLogin.Constants
local Logger = require(LoginV2Parent.Loggers).Logger
local default2 = require(LoginV2Parent.LoggingProtocol).default
local TelemetryConfigs = require(LoginV2Parent.AuthAnalytics).TelemetryConfigs
local KeystoreSaveCredentialsTelemetryConfig = TelemetryConfigs.KeystoreSaveCredentialsTelemetryConfig
local TelemetryService = game:GetService("TelemetryService")
local GetFFlagAddPromCounterToKeystoreOps = SharedFlags.GetFFlagAddPromCounterToKeystoreOps
local useNavigationProps = require(LoginV2Parent.RobloxAppNavigation).useNavigationProps

return function(t1: {[any]: any}) -- line: 159
	-- upvalues: useNavigationProps (copy), FFlagEnableLoginV2ForcedUsernameOverride (copy), UserIdentifierType (copy), React (copy), LoginStateReducer (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), RoactAppExperiment (copy), AppBtidLayers (copy), GetFFlagEnableAccountSwitcherRedesignIXP (copy), GetFFlagEnableAccountSwitcherFoundationDesign (copy), useDispatch (copy), useRoactService (copy), RoactNetworking (copy), RoactAnalytics (copy), AppLinking (copy), useAppPolicy (copy), StartPasskeyAuthentication (copy), StartAuthenticationByUser (copy), SetLoginResult (copy), SetBackNavigationDisabled (copy), LaunchContext (copy), Promise (copy), LoginActionType (copy), LoginPageState (copy), FFlagEnablePWManagerLoginCheck (copy), GetPasswordManagerUsageStore (copy), FFlagEnablePWManagerSignupCheck (copy), LoginByPasskey (copy), LoginByCode (copy), LoginByOtp (copy), CloseCentralOverlay (copy), Login (copy), OpenAccountSelector (copy), User (copy), RenderChallenge (copy), NavigateDown (copy), AppPage (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), AppStorageUtilities (copy), FFlagLuaEnableDidSwitchAccount (copy), GuiService (copy), NotificationType (copy), default2 (copy), TelemetryConfigs (copy), HttpService (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), AuthMemStorageKeys (copy), default (copy), Constants (copy), Logger (copy), authButtonClick (copy), EventStreamConstants (copy), getTwoStepLoginErrorKey (copy), TwoStepErrorCodes (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), ChallengeType (copy), TwoStepVerificationActionType (copy), FFlagEnable2SVRecovery (copy), TwoStepRequests (copy), v62 (copy), FFlagEnableRecordLogin (copy), record2svCompletion (copy), FFlagEnableLuaAccountSwitch (copy), v63 (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), ContentProvider (copy), GetUserByUsername (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), GetFFlagEnableLoginAccountSelector (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), recordLogin (copy), LoginMethods (copy), Constants2 (copy), SendCode (copy), ResendCode (copy), UserInputService (copy), Base64 (copy), CredentialsProtocolErrorCodes (copy), authClientError (copy), PasskeyConstants (copy), FFlagEnablePasskeyLoginErrorLogging (copy), OpenAccountSwitchingErrorOverlay (copy), OpenCentralOverlayForLoginPasswordResetPrompt (copy), LogoutAllLoggedInUsers (copy), SetCentralOverlay (copy), CentralOverlayType (copy), GetFStringVNGDownloadNowUrl (copy), LoginErrorCodes (copy), StatusCodes (copy), FFlagAddReasonToEveryLogout (copy), LogoutReasonNames (copy), LoginContext (copy)
	local v116 = useNavigationProps(function(_: string, p1) -- line: 160
		-- upvalues: FFlagEnableLoginV2ForcedUsernameOverride (copy)
		return {
			credProtocolIsAvailableResponse = p1.credProtocolIsAvailableResponse,
			forcedUsernameOverride = if not FFlagEnableLoginV2ForcedUsernameOverride then nil else p1.forcedUsernameOverride
		}
	end)
	local t2 = {
		userIdentifier = "",
		userIdentifierType = UserIdentifierType.Unknown,
		numLoginAttempts = 0,
		forceLoginByUsername = false,
		availableLoginMethods = {},
		credentialsProtocolStatus = {
			fido2Supported = false,
			passwordsSupported = false,
			v2InterfaceSupported = false,
			shouldShowAuthScreenCredentialsPopup = false,
			shouldShowAuthScreenUserSpecificPasskeyPopup = false,
			initialStateUpdated = false
		},
		shouldAutoShowCredentialPopup = true,
		componentState = {
			LoginScreenV2 = {
				errorKey = "",
				userIdentifier = "",
				shouldAttemptCredentialPrefill = true
			},
			AuthenticationScreen = {
				errorKey = "",
				errorType = nil,
				password = ""
			},
			EmailOtpScreen = {
				errorKey = "",
				emailOtp = "",
				sessionToken = ""
			}
		},
		monoDeps = t1.monoDeps,
		extraProps = v116
	}
	local v118, v119 = React.useReducer(LoginStateReducer, t2)
	local u120 = nil
	local handleLoginWithFormData = nil
	local handleLoginWithCode = nil
	local handleLoginWithOtp = nil

	if FFlagEnableNavigateToLoginAfterLogoutAll then
		u120 = React.useRef(v118.userIdentifier)
		u120.current = v118.userIdentifier
	end

	local v121 = RoactAppExperiment.useBrowserTrackerExperiment({ AppBtidLayers.LoginLayer }, function(p2) -- line: 215
		-- upvalues: AppBtidLayers (copy)
		return {
			shouldLoginWithKeystoreCredentials = (p2[AppBtidLayers.LoginLayer] or {}).shouldLoginWithKeystoreCredentials or false
		}
	end)
	local v122 = not GetFFlagEnableAccountSwitcherRedesignIXP() or RoactAppExperiment.useBrowserTrackerExperiment({ AppBtidLayers.AccountSwitcherLayer }, function(p3) -- line: 226
		-- upvalues: AppBtidLayers (copy)
		return (p3[AppBtidLayers.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true
	end)
	local v123 = GetFFlagEnableAccountSwitcherFoundationDesign() and v122
	local v124 = useDispatch()
	local v125 = useRoactService(RoactNetworking)
	local v126 = useRoactService(RoactAnalytics)
	local v127 = useRoactService(AppLinking)
	local v128 = useAppPolicy(function(p4) -- line: 238
		return p4
	end)
	local LaunchApp = v118.monoDeps.LaunchApp
	local ResetAppState = v118.monoDeps.ResetAppState
	local Logout = v118.monoDeps.Logout

	local function v132() -- line: 247
		-- upvalues: v124 (copy), StartPasskeyAuthentication (copy), v125 (copy)
		return v124(StartPasskeyAuthentication(v125))
	end
	local function v133(p5) -- line: 251
		-- upvalues: v124 (copy), StartAuthenticationByUser (copy), v125 (copy)
		return v124(StartAuthenticationByUser(v125, p5))
	end
	local function v134() -- line: 272
		-- upvalues: v119 (copy), LoginActionType (copy), LoginPageState (copy), UserIdentifierType (copy)
		v119({
			type = LoginActionType.SetComponentState,
			data = {
				component = LoginPageState.AuthenticationScreen,
				payload = {
					errorKey = "",
					errorType = nil,
					password = ""
				}
			}
		})
		v119({
			type = LoginActionType.SetComponentState,
			data = {
				component = LoginPageState.LoginScreenV2,
				payload = {
					errorKey = "",
					userIdentifier = ""
				}
			}
		})
		v119({
			type = LoginActionType.SetUserIdentifierAndType,
			data = {
				userIdentifier = "",
				userIdentifierType = UserIdentifierType.Unknown
			}
		})
	end

	local v135 = if not FFlagEnablePWManagerLoginCheck then nil else GetPasswordManagerUsageStore(false)

	if FFlagEnablePWManagerSignupCheck and v135 then
		v135.resetAll()
	elseif v135 then
		v135.setLoggedinUsingSavedPassword(false)
		v135.setSavedPasswordAfterLogin(false)
	end

	local function v136(...) -- line: 361
		-- upvalues: v124 (copy), Login (copy)
		return v124(Login(...))
	end
	local function v137(p6) -- line: 398
		-- upvalues: User (copy), v124 (copy), ResetAppState (copy), Promise (copy), FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), AppStorageUtilities (copy), FFlagLuaEnableDidSwitchAccount (copy), GuiService (copy), NotificationType (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy)
		if User.fromLocalStorage().userId ~= -1 then
			v124(ResetAppState())
			Promise.resolve():andThen(function(_) -- line: 400
				-- upvalues: FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues (copy), AccountSwitcherConstants (copy), AppStorageUtilities (copy), p6 (copy), FFlagLuaEnableDidSwitchAccount (copy), GuiService (copy), NotificationType (copy)
				local v272 = if not FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues then AccountSwitcherConstants.AccountSwitcherSwitchedStatus else AccountSwitcherConstants.AccountSwitcherSwitchedFromLoginStatus

				AppStorageUtilities.setAccountSwitchStatus(v272)
				AppStorageUtilities.setAccountBlob(p6)
				AppStorageUtilities.flush()

				if FFlagLuaEnableDidSwitchAccount then
					GuiService:BroadcastNotification("", NotificationType.DID_SWITCH_ACCOUNT)

					return
				end

				GuiService:BroadcastNotification("", NotificationType.DID_LOG_OUT)
			end, function(_) -- line: 412
				-- upvalues: AppStorageUtilities (copy), p6 (copy), v124 (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy)
				AppStorageUtilities.setAccountSwitchStatus("switched")
				AppStorageUtilities.setAccountBlob(p6)
				AppStorageUtilities.flush()
				v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
			end)

			return
		end

		AppStorageUtilities.setAccountBlob(p6)
		AppStorageUtilities.flush()
		v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
	end
	local function v138(s2: string?) -- line: 425
		-- upvalues: default2 (copy), TelemetryConfigs (copy), HttpService (copy), v118 (copy), FFlagDisableMemStorageServicePasswordEvent (copy), MemStorageService (copy), AuthMemStorageKeys (copy), default (copy), Constants (copy), FFlagEnablePWManagerLoginCheck (copy), v135 (copy), Logger (copy), authButtonClick (copy), EventStreamConstants (copy)
		if s2 == nil then
			default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
				reason = "missingCredentialsJson"
			})

			return nil
		end

		local data = HttpService:JSONDecode(s2)

		if data.cvalue == nil or data.password == nil then
			default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
				reason = "missingUsernameOrPassword"
			})

			return nil
		end

		if not v118.credentialsProtocolStatus.passwordsSupported then
			if not FFlagDisableMemStorageServicePasswordEvent then
				MemStorageService:Fire(AuthMemStorageKeys.AuthenticatedCredentials, s2)
			end

			default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
				reason = "passwordsNotSupported"
			})

			return nil
		end

		local t3 = {
			username = data.cvalue,
			password = data.password
		}
		local json = HttpService:JSONEncode(t3)

		default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveAttemptedConfig, 1)

		return default:registerCredentials(default.CredentialsTypes.password, json, Constants.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(p9) -- line: 473
			-- upvalues: HttpService (copy), FFlagEnablePWManagerLoginCheck (copy), v135 (copy), Logger (copy), authButtonClick (copy), EventStreamConstants (copy), default2 (copy), TelemetryConfigs (copy)
			if p9 then
				local data2 = HttpService:JSONDecode(p9)

				if data2.errorCode == nil then
					if FFlagEnablePWManagerLoginCheck and v135 then
						v135.setSavedPasswordAfterLogin(true)
					end

					Logger:info("Successfully registered password.")
					authButtonClick(EventStreamConstants.Context.CMPasswordLogin, EventStreamConstants.Button.SavePassword)
					default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveSuccessConfig, 1)

					return
				end

				Logger:warning("Error registering password: {}", data2.errorMsg)
				default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveFailureConfig, 1, {
					errorCode = tostring(data2.errorCode)
				})
			end
		end, function(p10) -- line: 499
			-- upvalues: Logger (copy), default2 (copy), TelemetryConfigs (copy)
			Logger:warning("Error registering password: {}", p10)
			default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginPasswordSaveFailureConfig, 1, {
				error = tostring(p10)
			})
		end)
	end
	local function v139(n1: number?, t4: {[any]: any}) -- line: 509
		-- upvalues: getTwoStepLoginErrorKey (copy), TwoStepErrorCodes (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy)
		local v183 = getTwoStepLoginErrorKey(n1)

		if n1 and n1 == TwoStepErrorCodes.IllegalChildAccountLinking then
			reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
		else
			reportEphemeralCounter(AppLoginCounterNames.FailureUnknownError, 1)
		end

		t4.setInProgress(false)
		t4.setErrorKey(v183)
	end
	local function v140(p11, p12, t5: {[any]: any}) -- line: 522
		-- upvalues: ChallengeType (copy), TwoStepVerificationActionType (copy), FFlagEnable2SVRecovery (copy), TwoStepRequests (copy), v125 (copy), v124 (copy), SetBackNavigationDisabled (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v62 (copy), v138 (copy), FFlagEnableRecordLogin (copy), record2svCompletion (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), v63 (copy), HttpService (copy), v139 (copy), RenderChallenge (copy)
		local ticket = p11.twoStepVerificationData.ticket
		local id = p11.user.id
		local t6 = {
			title = "Authentication.Login.Label.TwoStepVerification",
			challengeType = ChallengeType.TwoStepVerification,
			challengeParameters = {
				actionType = TwoStepVerificationActionType.Login,
				challengeId = ticket,
				userId = id,
				allowRememberDevice = true,
				clientSupports2svRecovery = not not FFlagEnable2SVRecovery
			},
			callbacks = {
				OnChallengeCompleted = function(p13) --[[ OnChallengeCompleted ]] -- line: 537
					-- upvalues: TwoStepRequests (copy), v125 (copy), id (copy), ticket (copy), v124 (copy), SetBackNavigationDisabled (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v62 (copy), v138 (copy), p12 (copy), FFlagEnableRecordLogin (copy), record2svCompletion (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), v63 (copy), HttpService (copy), v139 (copy), t5 (copy)
					TwoStepRequests.login(v125, id, ticket, p13.data.verificationToken, p13.data.rememberDevice):andThen(function(p14) -- line: 545
						-- upvalues: v124 (copy), SetBackNavigationDisabled (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v62 (copy), v138 (copy), p12 (copy), FFlagEnableRecordLogin (copy), record2svCompletion (copy), id (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy)
						v124(SetBackNavigationDisabled(false))
						reportEphemeralCounter(AppLoginCounterNames.Success, 1)

						if v62 then
							local v369 = v138(p12)

							if v369 then
								v369:await()
							end
						end

						if FFlagEnableRecordLogin then
							pcall(function() -- line: 557
								-- upvalues: record2svCompletion (copy), id (copy)
								record2svCompletion(id)
							end)
						end

						if FFlagEnableLuaAccountSwitch then
							v137(p14.responseBody and p14.responseBody.accountBlob)

							return
						end

						v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
					end, function(p15) -- line: 569
						-- upvalues: reportEphemeralCounter (copy), AppLoginCounterNames (copy), v63 (copy), HttpService (copy), v139 (copy), t5 (copy)
						reportEphemeralCounter(AppLoginCounterNames.Failure, 1)

						if v63 then
							local ok, result = pcall(function() -- line: 573
								-- upvalues: HttpService (copy), p15 (copy)
								return HttpService:JSONDecode(p15.Body).errors[1].code
							end)

							v139(if not ok then nil else result, t5)

							return
						end

						reportEphemeralCounter(AppLoginCounterNames.FailureUnknownError, 1)
						t5.setInProgress(false)
						t5.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
					end):finally(function() -- line: 584
						-- upvalues: v62 (copy), v138 (copy), p12 (copy)
						if not v62 then
							v138(p12)
						end
					end)
				end,
				OnChallengeAbandoned = function() --[[ OnChallengeAbandoned ]] -- line: 590
					-- upvalues: t5 (copy)
					t5.setInProgress(false)
				end,
				OnChallengeInvalidated = function() --[[ OnChallengeInvalidated ]] -- line: 593
					-- upvalues: t5 (copy)
					t5.setInProgress(false)
					t5.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end,
				OnChallengeLoadFailed = function() --[[ OnChallengeLoadFailed ]] -- line: 597
					-- upvalues: t5 (copy)
					t5.setInProgress(false)
					t5.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end
			}
		}

		RenderChallenge(t6)
	end
	local function v141(_, _, p18, p19, t7: {[any]: any}) -- line: 605
		-- upvalues: ChallengeType (copy), RenderChallenge (copy)
		local t9 = {
			challengeType = ChallengeType.SecurityQuestions,
			challengeParameters = {
				sessionId = p18.sessionId,
				userId = p18.userId
			},
			callbacks = {
				OnChallengeCompleted = function(p20) --[[ OnChallengeCompleted ]] -- line: 619
					-- upvalues: p18 (copy), p19 (copy)
					local t8 = {
						sessionId = p18.sessionId,
						redemptionToken = p20.data.redemptionToken
					}

					p19(t8)
				end,
				OnChallengeAbandoned = function() --[[ OnChallengeAbandoned ]] -- line: 626
					-- upvalues: t7 (copy)
					t7.setInProgress(false)
				end,
				OnChallengeInvalidated = function() --[[ OnChallengeInvalidated ]] -- line: 629
					-- upvalues: t7 (copy)
					t7.setInProgress(false)
					t7.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end,
				OnChallengeLoadFailed = function() --[[ OnChallengeLoadFailed ]] -- line: 633
					-- upvalues: t7 (copy)
					t7.setInProgress(false)
					t7.setErrorKey("Authentication.Login.Response.SomethingWentWrong")
				end
			}
		}

		RenderChallenge(t9)
	end

	local u142 = nil

	function handleLoginWithFormData(p21, p22, p23, p24, p25, p26, t10: {[any]: any}) -- line: 816
		-- upvalues: u142 (ref), v118 (copy), v124 (copy), SetBackNavigationDisabled (copy), handleLoginWithFormData (copy), v136 (copy), v125 (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), FFlagEnablePWManagerLoginCheck (copy), v135 (copy), HttpService (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), ContentProvider (copy), GetUserByUsername (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy)
		local v207 = u142(t10)
		local v208 = p21 or v118.userIdentifier

		v124(SetBackNavigationDisabled(true))

		return v136(v125, v208, p22, function(p27, p28) -- line: 831
			-- upvalues: handleLoginWithFormData (copy), p21 (copy), p22 (copy), p24 (copy), p25 (copy), p26 (copy), t10 (copy)
			if p27 then
				handleLoginWithFormData(p21, p22, p28, p24, p25, p26, t10)
			end
		end, p23, function(p29) -- line: 845
			-- upvalues: handleLoginWithFormData (copy), p21 (copy), p22 (copy), p23 (copy), p25 (copy), p26 (copy), t10 (copy)
			handleLoginWithFormData(p21, p22, p23, p29, p25, p26, t10)
		end, p24, p25, v118.forceLoginByUsername):andThen(function(p30) -- line: 867
			-- upvalues: AppStorageService (copy), AuthLocalStorageKeys (copy), v208 (copy), FFlagEnablePWManagerLoginCheck (copy), v135 (copy), p26 (copy), HttpService (copy), p22 (copy), t10 (copy), v124 (copy), SetBackNavigationDisabled (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
			AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, v208)
			AppStorageService:Flush()

			if FFlagEnablePWManagerLoginCheck and (v135 and p26) then
				v135.setLoggedinUsingSavedPassword(true)
			end

			local v296 = if p26 then nil else HttpService:JSONEncode({
				cvalue = v208,
				password = p22,
				authType = "login"
			})
			local v297 = t10

			v124(SetBackNavigationDisabled(false))
			Promise.new(function(p31, p32) -- line: 644
				-- upvalues: GetFFlagKeystoreAutoLoginAvailable (copy), v296 (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), Promise (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy)
				if GetFFlagKeystoreAutoLoginAvailable() == false or v296 == nil then
					p31()

					return
				end

				local v387 = not not GetFFlagRemoveKeystoreIxpLogic() or (v121.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2())
				local json = HttpService:JSONEncode({
					server = ContentProvider.BaseUrl
				})
				local data = HttpService:JSONDecode(v296)

				GetUserByUsername(v125, data.cvalue)():andThen(function(p33) -- line: 666
					-- upvalues: p32 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), json (copy), Promise (copy)
					if not p33 or not p33.id then
						return p32("Invalid usernameInfo")
					end

					if GetFFlagCheckIsAvailableForKeystoreOperations() then
						return default:isAvailable(default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(p34) -- line: 676
							-- upvalues: default (copy), json (copy), KeystoreConstants (copy), Promise (copy)
							if p34 and (p34.keystore and p34.keystore.isAvailable) then
								return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout)
							end

							return Promise.resolve(nil)
						end):andThen(function() -- line: 691
							-- upvalues: p33 (copy)
							return p33
						end)
					end

					return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout):andThen(function() -- line: 699
						-- upvalues: p33 (copy)
						return p33
					end)
				end):andThen(function(p35) -- line: 704
					-- upvalues: GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), HttpService (copy), ContentProvider (copy), data (copy), v387 (copy), KeystoreConstants (copy), default (copy)
					local json2

					if GetFFlagRemoveKeystoreIxpLogic() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(p35.id)))

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
								customFields = {
									result = "attempt"
								}
							}, 1)
						end

						json2 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p35.id),
							password = tostring(data.password)
						})
					else
						local Experiment

						if v387 == true then
							Experiment = KeystoreConstants.Experiment
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsExperimentGroup, (tostring(p35.id)))
						else
							Experiment = KeystoreConstants.Control
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsControlGroup, (tostring(p35.id)))
						end

						json2 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p35.id),
							password = tostring(data.password),
							experimentGroup = tostring(Experiment)
						})
					end

					return default:registerCredentials(default.CredentialsTypes.keystore, json2, KeystoreConstants.KeystoreTimeout)
				end):andThen(function(_) -- line: 756
					-- upvalues: p31 (copy)
					p31()
				end):catch(function(p37) -- line: 759
					-- upvalues: GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), p32 (copy)
					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
							customFields = {
								result = "error"
							}
						}, 1)
					end

					p32(p37)
				end)
			end):finally(function() -- line: 775
				-- upvalues: LoginResult (copy), p30 (copy), v124 (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v296 (copy), v297 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
				if LoginResult.hasTwoStepData(p30) then
					local v390 = p30

					v124(SetLoginResult(v390))
					reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function() -- line: 782
						-- upvalues: v140 (copy), p30 (copy), v296 (copy), v297 (copy)
						v140(p30, v296, v297)
					end)
				else
					reportEphemeralCounter(AppLoginCounterNames.Success, 1)

					if v296 then
						if v62 then
							local v391 = v138(v296)

							if v391 then
								v391:await()
							end
						else
							v138(v296)
						end
					end

					if FFlagEnableLuaAccountSwitch then
						v137(p30.accountBlob)
					else
						v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
					end
				end

				if GetFFlagEnableLoginAccountSelector() then
					v124(CloseCentralOverlay())
				end
			end)
		end, function(p38) -- line: 884
			-- upvalues: v207 (copy), v208 (copy), p22 (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy)
			v207(p38, v208, p22, not not FFlagEnableNavigateToLoginAfterLogoutAll or nil)
		end)
	end

	local function v144(p39, p40, t11: {[any]: any}) -- line: 889
		-- upvalues: u142 (ref), v124 (copy), SetBackNavigationDisabled (copy), LoginByPasskey (copy), v125 (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
		local v212 = u142(t11)

		v124(SetBackNavigationDisabled(true))

		return v124(LoginByPasskey(v125, p39, p40)):andThen(function(p41) -- line: 894
			-- upvalues: t11 (copy), v124 (copy), SetBackNavigationDisabled (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
			local v300 = t11

			v124(SetBackNavigationDisabled(false))

			local v301 = nil
			local v302 = nil

			Promise.new(function(p42, p43) -- line: 644
				-- upvalues: GetFFlagKeystoreAutoLoginAvailable (copy), v301 (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), Promise (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy)
				if GetFFlagKeystoreAutoLoginAvailable() == false or v301 == nil then
					p42()

					return
				end

				local v394 = not not GetFFlagRemoveKeystoreIxpLogic() or (v121.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2())
				local json = HttpService:JSONEncode({
					server = ContentProvider.BaseUrl
				})
				local data = HttpService:JSONDecode(v301)

				GetUserByUsername(v125, data.cvalue)():andThen(function(p44) -- line: 666
					-- upvalues: p43 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), json (copy), Promise (copy)
					if not p44 or not p44.id then
						return p43("Invalid usernameInfo")
					end

					if GetFFlagCheckIsAvailableForKeystoreOperations() then
						return default:isAvailable(default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(p45) -- line: 676
							-- upvalues: default (copy), json (copy), KeystoreConstants (copy), Promise (copy)
							if p45 and (p45.keystore and p45.keystore.isAvailable) then
								return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout)
							end

							return Promise.resolve(nil)
						end):andThen(function() -- line: 691
							-- upvalues: p44 (copy)
							return p44
						end)
					end

					return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout):andThen(function() -- line: 699
						-- upvalues: p44 (copy)
						return p44
					end)
				end):andThen(function(p46) -- line: 704
					-- upvalues: GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), HttpService (copy), ContentProvider (copy), data (copy), v394 (copy), KeystoreConstants (copy), default (copy)
					local json3

					if GetFFlagRemoveKeystoreIxpLogic() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(p46.id)))

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
								customFields = {
									result = "attempt"
								}
							}, 1)
						end

						json3 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p46.id),
							password = tostring(data.password)
						})
					else
						local Experiment

						if v394 == true then
							Experiment = KeystoreConstants.Experiment
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsExperimentGroup, (tostring(p46.id)))
						else
							Experiment = KeystoreConstants.Control
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsControlGroup, (tostring(p46.id)))
						end

						json3 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p46.id),
							password = tostring(data.password),
							experimentGroup = tostring(Experiment)
						})
					end

					return default:registerCredentials(default.CredentialsTypes.keystore, json3, KeystoreConstants.KeystoreTimeout)
				end):andThen(function(_) -- line: 756
					-- upvalues: p42 (copy)
					p42()
				end):catch(function(p48) -- line: 759
					-- upvalues: GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), p43 (copy)
					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
							customFields = {
								result = "error"
							}
						}, 1)
					end

					p43(p48)
				end)
			end):finally(function() -- line: 775
				-- upvalues: LoginResult (copy), p41 (copy), v124 (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v302 (copy), v300 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
				if LoginResult.hasTwoStepData(p41) then
					local v397 = p41

					v124(SetLoginResult(v397))
					reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function() -- line: 782
						-- upvalues: v140 (copy), p41 (copy), v302 (copy), v300 (copy)
						v140(p41, v302, v300)
					end)
				else
					reportEphemeralCounter(AppLoginCounterNames.Success, 1)

					if v302 then
						if v62 then
							local v398 = v138(v302)

							if v398 then
								v398:await()
							end
						else
							v138(v302)
						end
					end

					if FFlagEnableLuaAccountSwitch then
						v137(p41.accountBlob)
					else
						v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
					end
				end

				if GetFFlagEnableLoginAccountSelector() then
					v124(CloseCentralOverlay())
				end
			end)
		end, function(p49) -- line: 896
			-- upvalues: v212 (copy), p39 (copy)
			v212(p49, p39, nil)
		end)
	end

	function handleLoginWithCode(p50, p51, p52, p53, t12: {[any]: any}) -- line: 901
		-- upvalues: u142 (ref), v124 (copy), SetBackNavigationDisabled (copy), handleLoginWithCode (copy), LoginByCode (copy), v125 (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
		local v218 = u142(t12)

		v124(SetBackNavigationDisabled(true))

		return v124(LoginByCode(v125, p50, p51, function(p54, p55) -- line: 912
			-- upvalues: handleLoginWithCode (copy), p50 (copy), p51 (copy), t12 (copy)
			if p54 then
				handleLoginWithCode(p50, p51, p55, nil, t12)
			end
		end, p52, function(p56) -- line: 918
			-- upvalues: handleLoginWithCode (copy), p50 (copy), p51 (copy), t12 (copy)
			handleLoginWithCode(p50, p51, nil, p56, t12)
		end, p53)):andThen(function(p57) -- line: 929
			-- upvalues: t12 (copy), v124 (copy), SetBackNavigationDisabled (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
			local v308 = t12

			v124(SetBackNavigationDisabled(false))

			local v309 = nil
			local v310 = nil

			Promise.new(function(p58, p59) -- line: 644
				-- upvalues: GetFFlagKeystoreAutoLoginAvailable (copy), v309 (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), Promise (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy)
				if GetFFlagKeystoreAutoLoginAvailable() == false or v309 == nil then
					p58()

					return
				end

				local v401 = not not GetFFlagRemoveKeystoreIxpLogic() or (v121.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2())
				local json = HttpService:JSONEncode({
					server = ContentProvider.BaseUrl
				})
				local data = HttpService:JSONDecode(v309)

				GetUserByUsername(v125, data.cvalue)():andThen(function(p60) -- line: 666
					-- upvalues: p59 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), json (copy), Promise (copy)
					if not p60 or not p60.id then
						return p59("Invalid usernameInfo")
					end

					if GetFFlagCheckIsAvailableForKeystoreOperations() then
						return default:isAvailable(default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(p61) -- line: 676
							-- upvalues: default (copy), json (copy), KeystoreConstants (copy), Promise (copy)
							if p61 and (p61.keystore and p61.keystore.isAvailable) then
								return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout)
							end

							return Promise.resolve(nil)
						end):andThen(function() -- line: 691
							-- upvalues: p60 (copy)
							return p60
						end)
					end

					return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout):andThen(function() -- line: 699
						-- upvalues: p60 (copy)
						return p60
					end)
				end):andThen(function(p62) -- line: 704
					-- upvalues: GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), HttpService (copy), ContentProvider (copy), data (copy), v401 (copy), KeystoreConstants (copy), default (copy)
					local json4

					if GetFFlagRemoveKeystoreIxpLogic() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(p62.id)))

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
								customFields = {
									result = "attempt"
								}
							}, 1)
						end

						json4 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p62.id),
							password = tostring(data.password)
						})
					else
						local Experiment

						if v401 == true then
							Experiment = KeystoreConstants.Experiment
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsExperimentGroup, (tostring(p62.id)))
						else
							Experiment = KeystoreConstants.Control
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsControlGroup, (tostring(p62.id)))
						end

						json4 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p62.id),
							password = tostring(data.password),
							experimentGroup = tostring(Experiment)
						})
					end

					return default:registerCredentials(default.CredentialsTypes.keystore, json4, KeystoreConstants.KeystoreTimeout)
				end):andThen(function(_) -- line: 756
					-- upvalues: p58 (copy)
					p58()
				end):catch(function(p64) -- line: 759
					-- upvalues: GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), p59 (copy)
					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
							customFields = {
								result = "error"
							}
						}, 1)
					end

					p59(p64)
				end)
			end):finally(function() -- line: 775
				-- upvalues: LoginResult (copy), p57 (copy), v124 (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v310 (copy), v308 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
				if LoginResult.hasTwoStepData(p57) then
					local v404 = p57

					v124(SetLoginResult(v404))
					reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function() -- line: 782
						-- upvalues: v140 (copy), p57 (copy), v310 (copy), v308 (copy)
						v140(p57, v310, v308)
					end)
				else
					reportEphemeralCounter(AppLoginCounterNames.Success, 1)

					if v310 then
						if v62 then
							local v405 = v138(v310)

							if v405 then
								v405:await()
							end
						else
							v138(v310)
						end
					end

					if FFlagEnableLuaAccountSwitch then
						v137(p57.accountBlob)
					else
						v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
					end
				end

				if GetFFlagEnableLoginAccountSelector() then
					v124(CloseCentralOverlay())
				end
			end)
		end, function(p65) -- line: 931
			-- upvalues: reportEphemeralCounter (copy), AppLoginCounterNames (copy), v218 (copy), p50 (copy), p51 (copy)
			reportEphemeralCounter(AppLoginCounterNames.FailureAuthCode, 1)
			v218(p65, p50, p51)
		end)
	end
	function handleLoginWithOtp(s3: string, s4: string, p66, p67, t13: {[any]: any}) -- line: 937
		-- upvalues: u142 (ref), v124 (copy), SetBackNavigationDisabled (copy), handleLoginWithOtp (copy), LoginByOtp (copy), v125 (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), v118 (copy), FFlagEnableRecordLogin (copy), recordLogin (copy), LoginMethods (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
		local v224 = u142(t13)

		v124(SetBackNavigationDisabled(true))

		return v124(LoginByOtp(v125, s3, s4, function(p68) -- line: 948
			-- upvalues: handleLoginWithOtp (copy), s3 (copy), s4 (copy), p67 (copy), t13 (copy)
			handleLoginWithOtp(s3, s4, p68, p67, t13)
		end, p66, p67)):andThen(function(p69) -- line: 953
			-- upvalues: AppStorageService (copy), AuthLocalStorageKeys (copy), v118 (copy), FFlagEnableRecordLogin (copy), recordLogin (copy), LoginMethods (copy), t13 (copy), v124 (copy), SetBackNavigationDisabled (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
			AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, v118.userIdentifier)

			if FFlagEnableRecordLogin then
				pcall(function() -- line: 956
					-- upvalues: recordLogin (copy), p69 (copy), LoginMethods (copy), v118 (copy)
					recordLogin(p69, LoginMethods.EmailOtp, v118.userIdentifier)
				end)
			end

			local v314 = t13

			v124(SetBackNavigationDisabled(false))

			local v315 = nil
			local v316 = nil

			Promise.new(function(p70, p71) -- line: 644
				-- upvalues: GetFFlagKeystoreAutoLoginAvailable (copy), v315 (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), Promise (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy)
				if GetFFlagKeystoreAutoLoginAvailable() == false or v315 == nil then
					p70()

					return
				end

				local v408 = not not GetFFlagRemoveKeystoreIxpLogic() or (v121.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2())
				local json = HttpService:JSONEncode({
					server = ContentProvider.BaseUrl
				})
				local data = HttpService:JSONDecode(v315)

				GetUserByUsername(v125, data.cvalue)():andThen(function(p72) -- line: 666
					-- upvalues: p71 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), json (copy), Promise (copy)
					if not p72 or not p72.id then
						return p71("Invalid usernameInfo")
					end

					if GetFFlagCheckIsAvailableForKeystoreOperations() then
						return default:isAvailable(default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(p73) -- line: 676
							-- upvalues: default (copy), json (copy), KeystoreConstants (copy), Promise (copy)
							if p73 and (p73.keystore and p73.keystore.isAvailable) then
								return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout)
							end

							return Promise.resolve(nil)
						end):andThen(function() -- line: 691
							-- upvalues: p72 (copy)
							return p72
						end)
					end

					return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout):andThen(function() -- line: 699
						-- upvalues: p72 (copy)
						return p72
					end)
				end):andThen(function(p74) -- line: 704
					-- upvalues: GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), HttpService (copy), ContentProvider (copy), data (copy), v408 (copy), KeystoreConstants (copy), default (copy)
					local json5

					if GetFFlagRemoveKeystoreIxpLogic() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(p74.id)))

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
								customFields = {
									result = "attempt"
								}
							}, 1)
						end

						json5 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p74.id),
							password = tostring(data.password)
						})
					else
						local Experiment

						if v408 == true then
							Experiment = KeystoreConstants.Experiment
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsExperimentGroup, (tostring(p74.id)))
						else
							Experiment = KeystoreConstants.Control
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsControlGroup, (tostring(p74.id)))
						end

						json5 = HttpService:JSONEncode({
							server = tostring(ContentProvider.BaseUrl),
							username = tostring(data.cvalue),
							userId = tostring(p74.id),
							password = tostring(data.password),
							experimentGroup = tostring(Experiment)
						})
					end

					return default:registerCredentials(default.CredentialsTypes.keystore, json5, KeystoreConstants.KeystoreTimeout)
				end):andThen(function(_) -- line: 756
					-- upvalues: p70 (copy)
					p70()
				end):catch(function(p76) -- line: 759
					-- upvalues: GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), p71 (copy)
					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
							customFields = {
								result = "error"
							}
						}, 1)
					end

					p71(p76)
				end)
			end):finally(function() -- line: 775
				-- upvalues: LoginResult (copy), p69 (copy), v124 (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v316 (copy), v314 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
				if LoginResult.hasTwoStepData(p69) then
					local v411 = p69

					v124(SetLoginResult(v411))
					reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
					spawn(function() -- line: 782
						-- upvalues: v140 (copy), p69 (copy), v316 (copy), v314 (copy)
						v140(p69, v316, v314)
					end)
				else
					reportEphemeralCounter(AppLoginCounterNames.Success, 1)

					if v316 then
						if v62 then
							local v412 = v138(v316)

							if v412 then
								v412:await()
							end
						else
							v138(v316)
						end
					end

					if FFlagEnableLuaAccountSwitch then
						v137(p69.accountBlob)
					else
						v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
					end
				end

				if GetFFlagEnableLoginAccountSelector() then
					v124(CloseCentralOverlay())
				end
			end)
		end, function(p77) -- line: 962
			-- upvalues: v224 (copy), s3 (copy), s4 (copy)
			v224(p77, s3, s4)
		end)
	end

	local function v147() -- line: 1320
		-- upvalues: v124 (copy), SetCentralOverlay (copy), CentralOverlayType (copy), v127 (copy), GetFStringVNGDownloadNowUrl (copy)
		return v124(SetCentralOverlay(CentralOverlayType.NewAppAvailableModal, {
			onButtonActivated = function() --[[ onButtonActivated ]] -- line: 1322
				-- upvalues: v127 (copy), GetFStringVNGDownloadNowUrl (copy)
				v127:openURL(GetFStringVNGDownloadNowUrl())
			end
		}))
	end
	local function v148(p78, p79, p80, t14: {[any]: any}) -- line: 1329
		-- upvalues: EventStreamConstants (copy), v118 (copy), UserIdentifierType (copy), handleLoginWithOtp (copy), handleLoginWithFormData (copy), v124 (copy), CloseCentralOverlay (copy), OpenAccountSelector (copy)
		local s5 = ""

		if t14.isLoginByOtp then
			s5 = EventStreamConstants.Context.DisambiguationOTP
		elseif v118.userIdentifierType == UserIdentifierType.Email then
			s5 = EventStreamConstants.Context.DisambiguationEmail
		elseif v118.userIdentifierType == UserIdentifierType.Phone then
			s5 = EventStreamConstants.Context.DisambiguationPhone
		end

		local t15 = {
			origin = EventStreamConstants.Context.Login,
			context = s5,
			users = p78,
			onAccountSelection = function(p81) --[[ onAccountSelection ]] -- line: 1348
				-- upvalues: t14 (copy), handleLoginWithOtp (copy), p79 (copy), p80 (copy), handleLoginWithFormData (copy)
				if t14.isLoginByOtp then
					handleLoginWithOtp(p79, p80, nil, p81, t14)

					return
				end

				handleLoginWithFormData(p79, p80, nil, nil, p81, false, t14):await()
			end,
			onAccountSelectionAbandoned = function() --[[ onAccountSelectionAbandoned ]] -- line: 1355
				-- upvalues: t14 (copy), v124 (copy), CloseCentralOverlay (copy)
				t14.setInProgress(false)
				v124(CloseCentralOverlay())
			end,
			titleTextKey = "Authentication.Login.Label.AccountSelectorTitle"
		}

		v124(OpenAccountSelector(t15, true, false))
	end
	local function v149(p82) -- line: 1365
		-- upvalues: v134 (copy), v119 (copy), LoginActionType (copy), LoginPageState (copy)
		v134()
		v119({
			type = LoginActionType.SetComponentState,
			data = {
				component = LoginPageState.LoginScreenV2,
				payload = {
					errorKey = p82.errorKey
				}
			}
		})
		v119({
			type = LoginActionType.ForceLoginByUsername
		})
	end
	local function v150(p83) -- line: 1381
		-- upvalues: LoginErrorCodes (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), StatusCodes (copy)
		if p83.errorCode == LoginErrorCodes.IncorrectCValueOrPassword then
			reportEphemeralCounter(AppLoginCounterNames.FailureCredentials, 1)

			return
		end

		if p83.errorCode == LoginErrorCodes.AccountLocked then
			reportEphemeralCounter(AppLoginCounterNames.FailurePasswordReset, 1)

			return
		end

		if p83.errorCode == LoginErrorCodes.CTypeNotSupported then
			reportEphemeralCounter(AppLoginCounterNames.FailureBadRequest, 1)

			return
		end

		if p83.errorCode == LoginErrorCodes.CValueAndPasswordRequired then
			reportEphemeralCounter(AppLoginCounterNames.FailureBadRequest, 1)

			return
		end

		if p83.errorCode == LoginErrorCodes.SecurityQuestions then
			reportEphemeralCounter(AppLoginCounterNames.FailureSecurityQuestions, 1)

			return
		end

		if p83.errorCode == LoginErrorCodes.MultipleUsersPerCredential then
			reportEphemeralCounter(AppLoginCounterNames.FailureMultipleUsersPerCredential, 1)

			return
		end

		if p83.HttpError == Enum.HttpError.OK and p83.StatusCode == StatusCodes.TOO_MANY_REQUESTS then
			reportEphemeralCounter(AppLoginCounterNames.FailureThrottled, 1)

			return
		end

		if p83.HttpError == Enum.HttpError.OK and p83.StatusCode == StatusCodes.REQUEST_TIMEOUT then
			reportEphemeralCounter(AppLoginCounterNames.FailureTimeout, 1)

			return
		end

		if p83.HttpError == Enum.HttpError.OK and p83.StatusCode == StatusCodes.BAD_REQUEST then
			reportEphemeralCounter(AppLoginCounterNames.FailureBadRequest, 1)

			return
		end

		if p83.HttpError == Enum.HttpError.OK and p83.StatusCode == StatusCodes.NOT_FOUND then
			reportEphemeralCounter(AppLoginCounterNames.FailureNotFound, 1)

			return
		end

		if p83.HttpError == Enum.HttpError.OK and p83.StatusCode == StatusCodes.INTERNAL_SERVER_ERROR then
			reportEphemeralCounter(AppLoginCounterNames.FailureInternalServerError, 1)

			return
		end

		reportEphemeralCounter(AppLoginCounterNames.FailureUnknownError, 1)
	end

	function u142(t16: {[any]: any}) -- line: 1409
		-- upvalues: LoginErrorCodes (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v150 (copy), authClientError (copy), v124 (copy), CloseCentralOverlay (copy), AppStorageUtilities (copy), User (copy), v125 (copy), LogoutAllLoggedInUsers (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), v136 (copy), LoginResult (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), ResetAppState (copy), Promise (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), AccountSwitcherConstants (copy), FFlagAddReasonToEveryLogout (copy), GuiService (copy), LogoutReasonNames (copy), Logout (copy), u120 (ref), v123 (copy), OpenAccountSwitchingErrorOverlay (copy), v149 (copy), LoginPageState (copy), OpenCentralOverlayForLoginPasswordResetPrompt (copy), v147 (copy), v141 (copy), v148 (copy)
		return function(p84, s6: string?, s7: string?, b1: boolean?) --[[ handleLoginError ]] -- line: 1410
			-- upvalues: LoginErrorCodes (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v150 (copy), authClientError (copy), t16 (copy), v124 (copy), CloseCentralOverlay (copy), AppStorageUtilities (copy), User (copy), v125 (copy), LogoutAllLoggedInUsers (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), v136 (copy), LoginResult (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), ResetAppState (copy), Promise (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), AccountSwitcherConstants (copy), FFlagAddReasonToEveryLogout (copy), GuiService (copy), LogoutReasonNames (copy), Logout (copy), u120 (ref), v123 (copy), OpenAccountSwitchingErrorOverlay (copy), v149 (copy), LoginPageState (copy), OpenCentralOverlayForLoginPasswordResetPrompt (copy), v147 (copy), v141 (copy), v148 (copy)
			local u351 = false
			local v352 = p84.errorCode == LoginErrorCodes.MultipleUsersPerCredential
			local v353 = p84.errorCode == LoginErrorCodes.SecurityQuestions

			if v352 or v353 then
				u351 = true
			end

			reportEphemeralCounter(AppLoginCounterNames.Failure, 1)
			v150(p84)
			authClientError(t16.eventContext, p84.errorCode)

			local function v354() -- line: 1428
				-- upvalues: t16 (copy), u351 (ref), v124 (copy), CloseCentralOverlay (copy)
				t16.setInProgress(u351)
				v124(CloseCentralOverlay())
			end
			local function v355() -- line: 1433
				-- upvalues: AppStorageUtilities (copy), User (copy), t16 (copy), v125 (copy), LogoutAllLoggedInUsers (copy), FFlagEnableNavigateToLoginAfterLogoutAll (copy), b1 (copy), v136 (copy), s6 (copy), s7 (copy), LoginResult (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), v124 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), ResetAppState (copy), Promise (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), AccountSwitcherConstants (copy), FFlagAddReasonToEveryLogout (copy), GuiService (copy), LogoutReasonNames (copy), Logout (copy), CloseCentralOverlay (copy)
				local v418 = AppStorageUtilities.getAccountBlob()
				local v419 = User.fromLocalStorage().userId ~= -1

				t16.setInProgress(true)

				local v420 = v125

				LogoutAllLoggedInUsers(v420, v418):await()

				local v421 = false

				if FFlagEnableNavigateToLoginAfterLogoutAll then
					if b1 then
						local ok, result = pcall(function() -- line: 1442
							-- upvalues: v136 (copy), v125 (copy), s6 (copy), s7 (copy)
							return v136(v125, s6, s7):expect()
						end)

						if ok and result and not LoginResult.hasTwoStepData(result) then
							if FFlagEnableLuaAccountSwitch then
								v137(result.accountBlob)

								return
							end

							v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))

							return
						end
					elseif type(s6) ~= "string" then
						v421 = true
					end
				end

				if v419 == true then
					v124(ResetAppState())
					Promise.resolve()
					AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, "")
					AppStorageService:Flush()

					if FFlagEnableNavigateToLoginAfterLogoutAll then
						local v424 = if not v421 then AccountSwitcherConstants.AccountSwitcherPendingLoginV2AfterLogoutAll else AccountSwitcherConstants.AccountSwitcherPendingPasskeyLoginV2AfterLogoutAll

						AppStorageUtilities.setAccountSwitchStatus(v424)
						AppStorageUtilities.flush()
					end

					if FFlagAddReasonToEveryLogout then
						local v425 = v125
						local v426 = GuiService
						local LoginContextAccountSwitchingErrorOverlay = LogoutReasonNames.LoginContextAccountSwitchingErrorOverlay

						v124(Logout(v425, v426, LoginContextAccountSwitchingErrorOverlay))
					else
						local v428 = v125
						local v429 = GuiService

						v124(Logout(v428, v429, nil))
					end
				end

				t16.setInProgress(false)
				v124(CloseCentralOverlay())
			end

			if FFlagEnableLuaAccountSwitch and p84.errorCode == LoginErrorCodes.EmptyAccountSwitchBlobRequired then
				t16.setErrorKey("")

				local v356 = if not FFlagEnableNavigateToLoginAfterLogoutAll or b1 then s6 else u120.current

				if FFlagEnableNavigateToLoginAfterLogoutAll then
					AppStorageUtilities.setAccountSwitchTargetUsername(v356)
				end

				local v357 = not v123 and "Authentication.AccountSwitch.Header.LogoutAllAccounts" or "Authentication.AccountSwitch.Header.SignOutOtherAccounts"
				local v358 = not v123 and "Authentication.AccountSwitch.Description.LogoutConfirmation" or "Authentication.AccountSwitch.Description.ContinueSignOutOthers"
				local v359 = not v123 and "Authentication.AccountSwitch.Action.LogoutAllAccounts" or "Authentication.AccountSwitch.Action.Continue"
				local AccountSwitcherLoginEmptyBlobRequiredError = AccountSwitcherConstants.AccountSwitcherLoginEmptyBlobRequiredError
				local v361 = v356 or nil

				v124(OpenAccountSwitchingErrorOverlay(v357, v358, v359, "Authentication.CrossDevice.Action.CancelLogin", v355, v354, AccountSwitcherLoginEmptyBlobRequiredError, v361))

				return
			end

			if FFlagEnableLuaAccountSwitch and p84.errorCode == LoginErrorCodes.ParentEmptyAccountSwitchBlobRequired then
				t16.setErrorKey("")

				local v362 = if not FFlagEnableNavigateToLoginAfterLogoutAll or b1 then s6 else u120.current

				if FFlagEnableNavigateToLoginAfterLogoutAll then
					AppStorageUtilities.setAccountSwitchTargetUsername(v362)
				end

				local v363 = not v123 and "Authentication.AccountSwitch.Header.LogoutAllAccounts" or "Authentication.AccountSwitch.Header.SignOutOtherAccounts"
				local v364 = not v123 and "Authentication.AccountSwitch.Description.ParentLogoutConfirmation" or "Authentication.AccountSwitch.Description.ContinueSignOutOthers"
				local v365 = not v123 and "Authentication.AccountSwitch.Action.LogoutAllAccounts" or "Authentication.AccountSwitch.Action.Continue"
				local AccountSwitcherParentLoginEmptyBlobRequiredError = AccountSwitcherConstants.AccountSwitcherParentLoginEmptyBlobRequiredError
				local v367 = v362 or nil

				v124(OpenAccountSwitchingErrorOverlay(v363, v364, v365, "Authentication.CrossDevice.Action.CancelLogin", v355, v354, AccountSwitcherParentLoginEmptyBlobRequiredError, v367))

				return
			end

			if p84.errorCode == LoginErrorCodes.MoreThanOneUsername then
				v149(p84)
				t16.navigation.navigate(LoginPageState.LoginScreenV2)

				return
			end

			if p84.errorCode == LoginErrorCodes.AccountLocked then
				v124(OpenCentralOverlayForLoginPasswordResetPrompt())
			end

			if p84.errorCode == LoginErrorCodes.GlobalAppAccessDeniedVNG then
				v147()
			end

			if v353 and p84.securityQuestionsData and p84.securityQuestionsCallback then
				spawn(function() -- line: 1560
					-- upvalues: v141 (copy), s6 (copy), s7 (copy), p84 (copy), t16 (copy)
					v141(s6, s7, p84.securityQuestionsData, p84.securityQuestionsCallback, t16)
				end)

				return
			end

			if v352 and p84.usersData and s6 and s7 then
				v148(p84.usersData, s6, s7, t16)

				return
			end

			t16.setErrorKey(p84.errorKey or "Authentication.Login.Response.SomethingWentWrong")
			t16.setInProgress(u351)
		end
	end

	return React.createElement(LoginContext.Provider, {
		value = {
			state = v118,
			dispatch = v119,
			parentNavigation = t1.parentNavigation,
			utils = {
				handleLoginCompletionWithAccountSwitching = v137,
				handleLoginResult = function(p85, s8: string?, t17: {[any]: any}) -- line: 772
					-- upvalues: v124 (copy), SetBackNavigationDisabled (copy), Promise (copy), GetFFlagKeystoreAutoLoginAvailable (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), LoginResult (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
					v124(SetBackNavigationDisabled(false))
					Promise.new(function(p86, p87) -- line: 644
						-- upvalues: GetFFlagKeystoreAutoLoginAvailable (copy), s8 (copy), GetFFlagRemoveKeystoreIxpLogic (copy), v121 (copy), GetFFlagBypassKeystoreLoginIxpV2 (copy), HttpService (copy), ContentProvider (copy), GetUserByUsername (copy), v125 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), Promise (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy)
						if GetFFlagKeystoreAutoLoginAvailable() == false or s8 == nil then
							p86()

							return
						end

						local v287 = not not GetFFlagRemoveKeystoreIxpLogic() or (v121.shouldLoginWithKeystoreCredentials or GetFFlagBypassKeystoreLoginIxpV2())
						local json = HttpService:JSONEncode({
							server = ContentProvider.BaseUrl
						})
						local data = HttpService:JSONDecode(s8)

						GetUserByUsername(v125, data.cvalue)():andThen(function(p88) -- line: 666
							-- upvalues: p87 (copy), GetFFlagCheckIsAvailableForKeystoreOperations (copy), default (copy), KeystoreConstants (copy), json (copy), Promise (copy)
							if not p88 or not p88.id then
								return p87("Invalid usernameInfo")
							end

							if GetFFlagCheckIsAvailableForKeystoreOperations() then
								return default:isAvailable(default.CredentialsTypes.keystore, KeystoreConstants.KeystoreTimeout):andThen(function(p89) -- line: 676
									-- upvalues: default (copy), json (copy), KeystoreConstants (copy), Promise (copy)
									if p89 and (p89.keystore and p89.keystore.isAvailable) then
										return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout)
									end

									return Promise.resolve(nil)
								end):andThen(function() -- line: 691
									-- upvalues: p88 (copy)
									return p88
								end)
							end

							return default:deleteAllCredentialsFromKeystore(default.CredentialsTypes.keystore, json, KeystoreConstants.KeystoreTimeout):andThen(function() -- line: 699
								-- upvalues: p88 (copy)
								return p88
							end)
						end):andThen(function(p90) -- line: 704
							-- upvalues: GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), HttpService (copy), ContentProvider (copy), data (copy), v287 (copy), KeystoreConstants (copy), default (copy)
							local json6

							if GetFFlagRemoveKeystoreIxpLogic() then
								KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentials, (tostring(p90.id)))

								if GetFFlagAddPromCounterToKeystoreOps() then
									TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
										customFields = {
											result = "attempt"
										}
									}, 1)
								end

								json6 = HttpService:JSONEncode({
									server = tostring(ContentProvider.BaseUrl),
									username = tostring(data.cvalue),
									userId = tostring(p90.id),
									password = tostring(data.password)
								})
							else
								local Experiment

								if v287 == true then
									Experiment = KeystoreConstants.Experiment
									KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsExperimentGroup, (tostring(p90.id)))
								else
									Experiment = KeystoreConstants.Control
									KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.saveCredentialsControlGroup, (tostring(p90.id)))
								end

								json6 = HttpService:JSONEncode({
									server = tostring(ContentProvider.BaseUrl),
									username = tostring(data.cvalue),
									userId = tostring(p90.id),
									password = tostring(data.password),
									experimentGroup = tostring(Experiment)
								})
							end

							return default:registerCredentials(default.CredentialsTypes.keystore, json6, KeystoreConstants.KeystoreTimeout)
						end):andThen(function(_) -- line: 756
							-- upvalues: p86 (copy)
							p86()
						end):catch(function(p92) -- line: 759
							-- upvalues: GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreSaveCredentialsTelemetryConfig (copy), p87 (copy)
							if GetFFlagAddPromCounterToKeystoreOps() then
								TelemetryService:LogCounter(KeystoreSaveCredentialsTelemetryConfig, {
									customFields = {
										result = "error"
									}
								}, 1)
							end

							p87(p92)
						end)
					end):finally(function() -- line: 775
						-- upvalues: LoginResult (copy), p85 (copy), v124 (copy), SetLoginResult (copy), reportEphemeralCounter (copy), AppLoginCounterNames (copy), v140 (copy), s8 (copy), t17 (copy), v62 (copy), v138 (copy), FFlagEnableLuaAccountSwitch (copy), v137 (copy), LaunchApp (copy), v125 (copy), v126 (copy), v128 (copy), LaunchContext (copy), GetFFlagEnableLoginAccountSelector (copy), CloseCentralOverlay (copy)
						if LoginResult.hasTwoStepData(p85) then
							local v290 = p85

							v124(SetLoginResult(v290))
							reportEphemeralCounter(AppLoginCounterNames.FailureTwoStepVerification, 1)
							spawn(function() -- line: 782
								-- upvalues: v140 (copy), p85 (copy), s8 (copy), t17 (copy)
								v140(p85, s8, t17)
							end)
						else
							reportEphemeralCounter(AppLoginCounterNames.Success, 1)

							if s8 then
								if v62 then
									local v291 = v138(s8)

									if v291 then
										v291:await()
									end
								else
									v138(s8)
								end
							end

							if FFlagEnableLuaAccountSwitch then
								v137(p85.accountBlob)
							else
								v124(LaunchApp(v125, nil, v126, v128, LaunchContext.Login))
							end
						end

						if GetFFlagEnableLoginAccountSelector() then
							v124(CloseCentralOverlay())
						end
					end)
				end,
				showPasskeyLoginPopup = function(t18: {[any]: any}, b2: boolean, b3: boolean) -- line: 1015
					-- upvalues: v133 (copy), v118 (copy), v132 (copy), HttpService (copy), Constants (copy), UserInputService (copy), Base64 (copy), default (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), authClientError (copy), EventStreamConstants (copy), PasskeyConstants (copy), v144 (copy)
					local v235 = not b2 and function() -- line: 1028
						-- upvalues: v132 (copy)
						return v132()
					end or function() -- line: 1022
						-- upvalues: v133 (copy), v118 (copy)
						return v133({
							cvalue = v118.userIdentifier,
							ctype = v118.userIdentifierType
						})
					end
					local u236 = false

					return v235():andThen(function(p93) -- line: 1035
						-- upvalues: HttpService (copy), Constants (copy), b3 (copy), UserInputService (copy), Base64 (copy), default (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), authClientError (copy), EventStreamConstants (copy), PasskeyConstants (copy), t18 (copy), u236 (ref), v144 (copy)
						local data = HttpService:JSONDecode(p93.authenticationOptions)
						local sessionId = p93.sessionId
						local num = tonumber(data.publicKey.timeout)
						local v332 = if not num then Constants.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT else num / 1000

						data.keyType = "platform"
						data.deviceBoundOnly = b3

						if UserInputService:GetPlatform() ~= Enum.Platform.Android then
							data.publicKey.challenge = Base64.FromUrlSafeBase64(data.publicKey.challenge)

							if data.publicKey.allowCredentials then
								for _, v in ipairs(data.publicKey.allowCredentials) do
									v.id = Base64.FromUrlSafeBase64(v.id)
								end
							end
						end

						local json = HttpService:JSONEncode(data)

						default:getCredentials(default.CredentialsTypes.FIDO2, json, v332):andThen(function(p94) -- line: 1061
							-- upvalues: HttpService (copy), Logger (copy), CredentialsProtocolErrorCodes (copy), authClientError (copy), EventStreamConstants (copy), PasskeyConstants (copy), Base64 (copy), t18 (copy), u236 (ref), v144 (copy), sessionId (copy)
							if p94 ~= nil then
								local data3 = HttpService:JSONDecode(p94)

								if data3 == nil or next(data3) == nil then
									Logger:info("Passkey credential signing failed. No result returned.")

									return
								end

								if data3.errorCode ~= nil then
									Logger:info("Passkey credential signing failed. Error {} (msg: {}) returned.", data3.errorCode, data3.errorMsg)

									local num2 = tonumber(data3.errorCode)
									local v416 = CredentialsProtocolErrorCodes.GetCredentialsErrorCodes[num2 or -1] or string.format(CredentialsProtocolErrorCodes.UNMAPPED_ERROR_CODE, (tostring(data3.errorCode)))

									authClientError(EventStreamConstants.Context.PasskeyLoginAttempt, v416, PasskeyConstants.PASSKEY_FETCH_LOGIN_V2)

									return
								end

								Logger:info("Passkey credential signing completed. Attempting login.")
								data3.id = Base64.ToUrlSafeBase64(data3.id)
								data3.rawId = Base64.ToUrlSafeBase64(data3.rawId)
								data3.response.signature = Base64.ToUrlSafeBase64(data3.response.signature)
								data3.response.userHandle = Base64.ToUrlSafeBase64(data3.response.userHandle)
								data3.response.authenticatorData = Base64.ToUrlSafeBase64(data3.response.authenticatorData)
								data3.response.clientDataJSON = Base64.ToUrlSafeBase64(data3.response.clientDataJSON)
								t18.setInProgress(true)
								u236 = true
								v144(data3, sessionId, t18)
							end
						end, function(p95) -- line: 1100
							-- upvalues: Logger (copy)
							Logger:warning("Passkey credential signing failed. Error: {}", p95)
						end):await()
					end, function(p96) -- line: 1104
						-- upvalues: Logger (copy), b2 (copy), b3 (copy), t18 (copy)
						Logger:warning("Fetching passkey login options failed with error code: {}", p96.errorCode)

						if b2 and not b3 then
							t18.setErrorKey("Authentication.Login.Response.UnableToSignIn")
						end
					end):finally(function() -- line: 1111
						-- upvalues: t18 (copy), u236 (ref)
						if t18.onCredentialsPopupAbandoned and not u236 then
							t18.onCredentialsPopupAbandoned()
						end
					end)
				end,
				showGenericCredentialLoginPopup = function(b4: boolean, b5: boolean, b6: boolean, t19: {[any]: any}) -- line: 1118
					-- upvalues: v133 (copy), v118 (copy), v132 (copy), HttpService (copy), Constants (copy), UserInputService (copy), Base64 (copy), Logger (copy), default2 (copy), TelemetryConfigs (copy), default (copy), FFlagEnablePasskeyLoginErrorLogging (copy), authClientError (copy), EventStreamConstants (copy), PasskeyConstants (copy), handleLoginWithFormData (copy), v144 (copy)
					if not b4 and not b5 then
						return
					end

					local v241 = not b6 and function() -- line: 1136
						-- upvalues: v132 (copy)
						return v132()
					end or function() -- line: 1130
						-- upvalues: v133 (copy), v118 (copy)
						return v133({
							cvalue = v118.userIdentifier,
							ctype = v118.userIdentifierType
						})
					end
					local data = nil
					local sessionId = nil
					local u244 = nil
					local t20 = {}

					if b4 then
						v241():andThen(function(p97) -- line: 1146
							-- upvalues: data (ref), HttpService (copy), sessionId (ref), u244 (ref), Constants (copy), UserInputService (copy), Base64 (copy)
							data = HttpService:JSONDecode(p97.authenticationOptions)
							sessionId = p97.sessionId
							u244 = tonumber(data.publicKey.timeout) or Constants.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT
							data.keyType = "platform"
							data.deviceBoundOnly = true

							if UserInputService:GetPlatform() ~= Enum.Platform.Android then
								data.publicKey.challenge = Base64.FromUrlSafeBase64(data.publicKey.challenge)

								if data.publicKey.allowCredentials then
									for _, v in ipairs(data.publicKey.allowCredentials) do
										v.id = Base64.FromUrlSafeBase64(v.id)
									end
								end
							end
						end, function(p98) -- line: 1167
							-- upvalues: Logger (copy)
							Logger:warning("Fetching passkey login options failed with error code: {}", p98.errorCode)
						end):await()

						if data ~= nil then
							t20.FIDO2 = data
						end
					end

					if b5 then
						t20.password = {}

						if b6 then
							t20.password.username = v118.userIdentifier
						end
					end

					local v246 = if not u244 then Constants.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT else u244 / 1000
					local u247 = false
					local json = HttpService:JSONEncode(t20)

					default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetShownConfig, 1)

					return default:getCredentials(default.CredentialsTypes.all, json, v246):andThen(function(p99) -- line: 1197
						-- upvalues: HttpService (copy), Logger (copy), default2 (copy), TelemetryConfigs (copy), FFlagEnablePasskeyLoginErrorLogging (copy), authClientError (copy), EventStreamConstants (copy), PasskeyConstants (copy), default (copy), t19 (copy), u247 (ref), handleLoginWithFormData (copy), Base64 (copy), v144 (copy), sessionId (ref)
						if p99 ~= nil then
							local data4 = HttpService:JSONDecode(p99)

							if data4 == nil or not data4.response and not data4.errorCode then
								Logger:info("Generic credential fetch failed. No result returned.")
								default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)

								return
							end

							if data4.errorCode ~= nil then
								Logger:info("Generic credential fetch failed. Error {} (msg: {}) returned.", data4.errorCode, data4.errorMsg)
								default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetErrorConfig, 1, {
									errorCode = tostring(data4.errorCode)
								})

								if FFlagEnablePasskeyLoginErrorLogging and type(data4.errorMsg) == "string" then
									authClientError(EventStreamConstants.Context.PasskeyLoginAttempt, data4.errorMsg, PasskeyConstants.GENERIC_CREDENTIAL_FETCH_LOGIN_V2)

									return
								end
							else
								if data4.credentialType == default.CredentialsTypes.password then
									default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetPasswordSelectedConfig, 1)
									t19.setInProgress(true)
									u247 = true
									handleLoginWithFormData(data4.response.username, data4.response.password, nil, nil, nil, true, t19)

									return
								end

								if data4.credentialType == default.CredentialsTypes.FIDO2 then
									default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetPasskeySelectedConfig, 1)
									data4.response.id = Base64.ToUrlSafeBase64(data4.response.id)
									data4.response.rawId = Base64.ToUrlSafeBase64(data4.response.rawId)
									data4.response.response.signature = Base64.ToUrlSafeBase64(data4.response.response.signature)
									data4.response.response.userHandle = Base64.ToUrlSafeBase64(data4.response.response.userHandle)
									data4.response.response.authenticatorData = Base64.ToUrlSafeBase64(data4.response.response.authenticatorData)
									data4.response.response.clientDataJSON = Base64.ToUrlSafeBase64(data4.response.response.clientDataJSON)
									t19.setInProgress(true)
									u247 = true
									v144(data4.response, sessionId, t19)
								end
							end
						end
					end, function(p100) -- line: 1262
						-- upvalues: Logger (copy), default2 (copy), TelemetryConfigs (copy)
						Logger:warning("Generic credential signing failed. Error: {}", p100)
						default2:logRobloxTelemetryCounter(TelemetryConfigs.IosAuthServiceLoginCredentialSheetDismissedConfig, 1)
					end):andThen(function(_) -- line: 1271
						-- upvalues: t19 (copy), u247 (ref)
						if t19.onCredentialsPopupAbandoned and not u247 then
							t19.onCredentialsPopupAbandoned()
						end
					end):catch(function(_) -- line: 1277
						-- upvalues: t19 (copy), u247 (ref)
						if t19.onCredentialsPopupAbandoned and not u247 then
							t19.onCredentialsPopupAbandoned()
						end
					end)
				end,
				handleLoginWithCode = handleLoginWithCode,
				handleLoginWithFormData = handleLoginWithFormData,
				handleLoginWithPasskey = v144,
				handleLoginWithOtp = handleLoginWithOtp,
				handleSendEmailOtp = function(p103: ((...any) -> ...any), t21: {[any]: any}) -- line: 968
					-- upvalues: v124 (copy), SetBackNavigationDisabled (copy), Constants2 (copy), v118 (copy), SendCode (copy), v125 (copy)
					v124(SetBackNavigationDisabled(true))

					local t22 = {
						origin = Constants2.otpServiceOrigin,
						contactType = Constants2.otpServiceContactType,
						contactValue = v118.userIdentifier
					}

					return v124(SendCode(v125, t22)):andThen(function(p104) -- line: 979
						-- upvalues: p103 (copy)
						p103(p104.otpSessionToken)
					end, function(p105) -- line: 982
						-- upvalues: t21 (copy), Constants2 (copy)
						t21.setInProgress(false)

						local v320 = tonumber(p105) or 0
						local v321 = Constants2.statusCodeMap[v320] or "Unknown"
						local v322 = Constants2.errorMessageKeys[v321] or Constants2.errorMessageKeys.Unknown

						t21.setErrorKey(v322)
					end)
				end,
				handleResendEmailOtp = function(s9: string, p106: ((...any) -> ...any), t23: {[any]: any}) -- line: 991
					-- upvalues: v124 (copy), SetBackNavigationDisabled (copy), Constants2 (copy), ResendCode (copy), v125 (copy)
					v124(SetBackNavigationDisabled(true))

					local t24 = {
						origin = Constants2.otpServiceOrigin,
						contactType = Constants2.otpServiceContactType,
						otpSessionToken = s9
					}

					return v124(ResendCode(v125, t24)):andThen(function(p107) -- line: 1003
						-- upvalues: p106 (copy)
						p106(p107.otpSessionToken)
					end, function(p108) -- line: 1006
						-- upvalues: t23 (copy), Constants2 (copy)
						t23.setInProgress(false)

						local v325 = tonumber(p108) or 0
						local v326 = Constants2.statusCodeMap[v325] or "Unknown"
						local v327 = Constants2.errorMessageKeys[v326] or Constants2.errorMessageKeys.Unknown

						t23.setErrorKey(v327)
					end)
				end,
				openAccountSwitchingErrorOverlay = function(p109, p110, p111, p112, p113, p114, p115, p116) -- line: 1284
					-- upvalues: v124 (copy), OpenAccountSwitchingErrorOverlay (copy)
					return v124(OpenAccountSwitchingErrorOverlay(p109, p110, p111, p112, p113, p114, p115, p116))
				end,
				openPasswordResetPrompt = function() -- line: 1308
					-- upvalues: v124 (copy), OpenCentralOverlayForLoginPasswordResetPrompt (copy)
					return v124(OpenCentralOverlayForLoginPasswordResetPrompt())
				end,
				openWebView = function(s10: string) -- line: 377
					-- upvalues: v124 (copy), NavigateDown (copy), AppPage (copy)
					v124(NavigateDown({
						name = AppPage.GenericWebPage,
						detail = s10,
						extraProps = {
							title = "",
							transitionAnimation = "SlideInFromBottom"
						}
					}))
				end,
				openAccountRecovery = function(s11: string) -- line: 388
					-- upvalues: v124 (copy), NavigateDown (copy), AppPage (copy)
					v124(NavigateDown({
						name = AppPage.AccountRecovery,
						extraProps = {
							identifier = s11,
							recoverPassword = true
						}
					}))
				end,
				logoutAllLoggedInUsers = function(p117, p118) -- line: 1312
					-- upvalues: LogoutAllLoggedInUsers (copy)
					return LogoutAllLoggedInUsers(p117, p118)
				end,
				logoutWithoutShowConfirmation = function(p119, p120, s12: string?) -- line: 1316
					-- upvalues: v124 (copy), Logout (copy)
					return v124(Logout(p119, p120, s12))
				end,
				openNewAppAvailableModal = v147,
				closeCentralOverlay = function() -- line: 357
					-- upvalues: v124 (copy), CloseCentralOverlay (copy)
					return v124(CloseCentralOverlay())
				end,
				clearApp = function() -- line: 267
					-- upvalues: v124 (copy), ResetAppState (copy), Promise (copy)
					v124(ResetAppState())

					return Promise.resolve()
				end,
				openAccountSelector = v148,
				handleCredentialsCollision = v149,
				registerPassword = v138,
				isUserAuthenticated = function() -- line: 369
					-- upvalues: User (copy)
					return User.fromLocalStorage().userId ~= -1
				end
			}
		}
	}, t1.children)
end
