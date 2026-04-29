local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NotificationService = game:GetService("NotificationService")
local UserInputService = game:GetService("UserInputService")
local default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local RoactNavigation = require(CorePackages.Packages.RoactNavigation)
local LoggingProtocol = require(CorePackages.Workspace.Packages.LoggingProtocol)
local t = require(CorePackages.Packages.t)
local UIBlox = require(CorePackages.Packages.UIBlox)
local BrowserServiceWrapper = require(Modules.LuaApp.Components.BrowserServiceWrapper)
local ActionType = require(Modules.LuaApp.Enum.Challenge.Captcha.ActionType)
local Type = require(Modules.LuaApp.Enum.Challenge.Type)
local ExecuteJavaScriptInWebView = require(Modules.LuaApp.Util.ExecuteJavaScriptInWebView)
local GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView)
local GetFFlagLuaAppChallengeForceInvisibleCaptchaDev = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeForceInvisibleCaptchaDev)
local GetFFlagLuaAppChallengeForceVisibleCaptchaDev = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeForceVisibleCaptchaDev)
local GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled)
local GetFFlagLuaAppEnableCredentialsProtocol = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol
local GetFIntLuaAppCredentialsProtocolTimeout = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout
local GetFIntLuaAppCredentialsProtocolAvailableTimeout = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds = require(Modules.LuaApp.Flags.GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds)
local GetFFlagReplaceBrowserServiceWrapper = require(Modules.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper)
local GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabled = require(Modules.LuaApp.Flags.GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabled)
local GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSeconds = require(Modules.LuaApp.Flags.GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSeconds)
local v27 = game:DefineFastFlag("EnableGCSWebViewLaunchFlowLogging", false)
local JavascriptHybrid = require(Modules.LuaApp.Enum.JavascriptHybrid)
local Roact = require(Modules.Common.Roact)
local RoactAnalytics = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactRodux = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local SetBackNavigationDisabled = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local ActionType2 = require(Modules.LuaApp.Enum.Challenge.TwoStepVerification.ActionType)
local Url = require(Modules.LuaApp.Http.Url)
local withLocalization = require(Modules.LuaApp.withLocalization)
local Constants = UIBlox.App.Style.Constants
local default2 = LoggingProtocol.default
local v39 = Roact.PureComponent:extend(script.Name)
local AccountService = nil

pcall(function() -- line: 60
	-- upvalues: AccountService (ref)
	AccountService = game:GetService("AccountService")
end)
v39.validateProps = t.intersection(t.interface({
	appContainerNavigation = t.interface({
		isVisible = t.boolean,
		displayOrder = t.integer
	}),
	onChallengeAbandoned = t.callback,
	onChallengeLoadFailed = t.callback,
	forceWebViewVisible = t.optional(t.boolean),
	onChallengeDisplayed = t.optional(t.callback),
	onChallengeUnmounted = t.optional(t.callback)
}), t.union(t.interface({
	challengeType = t.literal(Type.Captcha),
	challengeParameters = t.strictInterface({
		actionType = ActionType.isEnumValue,
		dataExchangeBlob = t.string,
		captchaId = t.string,
		onChallengeCompleted = t.callback,
		onChallengeInvalidated = t.callback
	})
}), t.interface({
	challengeType = t.literal(Type.SecurityQuestions),
	challengeParameters = t.strictInterface({
		userId = t.string,
		sessionId = t.string,
		onChallengeCompleted = t.callback,
		onChallengeInvalidated = t.callback
	})
}), t.interface({
	challengeType = t.literal(Type.TwoStepVerification),
	challengeParameters = t.strictInterface({
		challengeId = t.string,
		userId = t.string,
		actionType = ActionType2.isEnumValue,
		allowRememberDevice = t.boolean,
		onChallengeCompleted = t.callback,
		onChallengeInvalidated = t.callback,
		clientSupports2svRecovery = t.optional(t.boolean),
		recoverySessionId = t.optional(t.string)
	})
}), t.interface({
	challengeType = t.literal(Type.Reauthentication),
	challengeParameters = t.strictInterface({
		onChallengeCompleted = t.callback,
		onChallengeInvalidated = t.callback
	})
}), t.interface({
	challengeType = t.literal(Type.Generic),
	challengeParameters = t.strictInterface({
		genericChallengeId = t.string,
		genericChallengeType = t.string,
		genericChallengeMetadata = t.string,
		onChallengeCompleted = t.callback,
		onChallengeInvalidated = t.callback
	})
})))

function v39.init(p1) -- line: 174
	-- upvalues: UserInputService (copy)
	p1:setState({
		challengeDisplayed = false,
		forceWebViewVisibleOnLoadFailure = false
	})
	p1.webViewLoaded = false
	p1.challengeInitializationFailed = false
	p1.completionData = nil
	p1.invalidationData = nil
	p1.appType = (function() -- line: 187
		-- upvalues: UserInputService (copy)
		local Platform = UserInputService:GetPlatform()
		local s1 = "unknown"

		if Platform == Enum.Platform.Android then
			return "android"
		end

		if Platform == Enum.Platform.IOS then
			return "ios"
		end

		if Platform == Enum.Platform.Windows then
			return "windows"
		end

		if Platform == Enum.Platform.OSX then
			return "osx"
		end

		if Platform == Enum.Platform.UWP then
			return "uwp"
		end

		if Platform == Enum.Platform.XBoxOne then
			s1 = "xbox"
		end

		return s1
	end)()
end
function v39.didMount(p2) -- line: 209
	-- upvalues: GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds (copy), GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabled (copy), GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSeconds (copy), v27 (copy), default2 (copy)
	p2.isMounted = true

	local analytics = p2.props.analytics
	local UnixTimestampMillis = DateTime.now().UnixTimestampMillis

	spawn(function() -- line: 217
		-- upvalues: UnixTimestampMillis (copy), GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds (copy), p2 (copy), GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabled (copy), GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSeconds (copy), analytics (copy), v27 (copy), default2 (copy)
		local UnixTimestampMillis2 = DateTime.now().UnixTimestampMillis

		while UnixTimestampMillis2 - UnixTimestampMillis < GetFIntLuaAppChallengeHybridWebViewTimeoutSeconds() * 1000 do
			wait(1)

			if p2.webViewLoaded then
				return
			end

			if GetFFlagLuaAppForceWebViewVisibleAfterTimeoutEnabled() and UnixTimestampMillis2 - UnixTimestampMillis >= GetFIntLuaAppChallengeForceWebViewVisibleTimeoutSeconds() * 1000 and not p2.state.forceWebViewVisibleOnLoadFailure then
				p2:setState({
					forceWebViewVisibleOnLoadFailure = true
				})
			end

			UnixTimestampMillis2 = DateTime.now().UnixTimestampMillis
		end

		if analytics ~= nil and analytics.Diag ~= nil then
			analytics.Diag:reportCounter("ChallengeHybridWebView_Timeout", 1)
		end

		if p2.isMounted then
			if v27 then
				default2:logEventOnce("challenge_launch_fail")
			end

			p2:navigateBack()
		end
	end)
end
function v39.willUnmount(p3) -- line: 261
	-- upvalues: Type (copy)
	p3.isMounted = false

	if p3.props.onChallengeUnmounted ~= nil then
		p3.props.onChallengeUnmounted()
	end

	local s2

	if p3.completionData ~= nil then
		s2 = "Completed"
		p3.props.challengeParameters.onChallengeCompleted(p3.completionData)
	elseif p3.invalidationData ~= nil then
		s2 = "Invalidated"
		p3.props.challengeParameters.onChallengeInvalidated(p3.invalidationData)
	elseif not p3.webViewLoaded or p3.challengeInitializationFailed then
		s2 = p3.webViewLoaded and "InitializationFailed" or "LoadFailed"
		p3.props.onChallengeLoadFailed()
	else
		s2 = "Abandoned"
		p3.props.onChallengeAbandoned()
	end

	if p3.props.analytics ~= nil then
		local v50 = Type.toRawValue(p3.props.challengeType):gsub("%-", "")

		if p3.props.analytics.Diag ~= nil then
			local v51 = string.format("ChallengeHybridWebView_Result_%s_%s_%s", s2, p3.appType, v50)

			p3.props.analytics.Diag:reportCounter(v51, 1)
		end

		if p3.props.analytics.EventStream ~= nil then
			p3.props.analytics.EventStream:setRBXEventStream(s2, "challengeHybridWebViewResult", {
				appType = p3.appType,
				challengeType = v50,
				queryParameters = p3:getBaseQueryParameters() .. p3:getChallengeTypeQueryParameters()
			})
		end
	end
end

local function buildQueryParametersFromTable(p4) -- line: 311
	local s3 = ""

	for k, v in pairs(p4) do
		s3 ..= string.format("%s=%s&", k, v)
	end

	return s3
end

function v39.getChallengeTypeQueryParameters(p5) -- line: 319
	-- upvalues: Type (copy), buildQueryParametersFromTable (copy), ActionType (copy), ActionType2 (copy)
	return ({
		[Type.Captcha] = function() -- line: 321
			-- upvalues: buildQueryParametersFromTable (copy), ActionType (copy), p5 (copy)
			return (buildQueryParametersFromTable({
				["action-type"] = ActionType.toRawValue(p5.props.challengeParameters.actionType),
				["data-exchange-blob"] = p5.props.challengeParameters.dataExchangeBlob,
				["captcha-id"] = p5.props.challengeParameters.captchaId
			}))
		end,
		[Type.TwoStepVerification] = function() -- line: 328
			-- upvalues: p5 (copy), ActionType2 (copy), buildQueryParametersFromTable (copy)
			local t1 = {
				["challenge-id"] = p5.props.challengeParameters.challengeId,
				["user-id"] = p5.props.challengeParameters.userId,
				["action-type"] = ActionType2.toRawValue(p5.props.challengeParameters.actionType),
				["allow-remember-device"] = not p5.props.challengeParameters.allowRememberDevice and "false" or "true",
				["client-supports-2sv-recovery"] = not p5.props.challengeParameters.clientSupports2svRecovery and "false" or "true"
			}
			local recoverySessionId = p5.props.challengeParameters.recoverySessionId

			if recoverySessionId ~= nil and string.len(recoverySessionId) > 0 then
				t1["recovery-session-id"] = recoverySessionId
			end

			return (buildQueryParametersFromTable(t1))
		end,
		[Type.SecurityQuestions] = function() -- line: 343
			-- upvalues: buildQueryParametersFromTable (copy), p5 (copy)
			return (buildQueryParametersFromTable({
				["user-id"] = p5.props.challengeParameters.userId,
				["session-id"] = p5.props.challengeParameters.sessionId
			}))
		end,
		[Type.Reauthentication] = function() -- line: 349
			-- upvalues: buildQueryParametersFromTable (copy)
			return (buildQueryParametersFromTable({}))
		end,
		[Type.Generic] = function() -- line: 352
			-- upvalues: buildQueryParametersFromTable (copy), p5 (copy)
			return (buildQueryParametersFromTable({
				["generic-challenge-id"] = p5.props.challengeParameters.genericChallengeId,
				["generic-challenge-type"] = p5.props.challengeParameters.genericChallengeType,
				["challenge-metadata-json"] = p5.props.challengeParameters.genericChallengeMetadata
			}))
		end
	})[p5.props.challengeType]()
end
function v39.getBaseQueryParameters(p6) -- line: 362
	-- upvalues: NotificationService (copy), Constants (copy), Type (copy), GetFFlagLuaAppChallengeForceVisibleCaptchaDev (copy), GetFFlagLuaAppChallengeForceInvisibleCaptchaDev (copy), buildQueryParametersFromTable (copy)
	local v58 = NotificationService.SelectedTheme == Constants.ThemeName.Dark
	local t2 = {
		["challenge-type"] = Type.toRawValue(p6.props.challengeType),
		["app-type"] = p6.appType,
		["dark-mode"] = not v58 and "false" or "true"
	}

	if GetFFlagLuaAppChallengeForceVisibleCaptchaDev() then
		t2.fc_nosuppress = "1"
	end

	if GetFFlagLuaAppChallengeForceInvisibleCaptchaDev() then
		t2.fc_suppress = "1"
	end

	return (buildQueryParametersFromTable(t2))
end
function v39.navigateBack(p7) -- line: 378
	p7.props.navigation.goBack()
end
function v39.render(p8) -- line: 382
	-- upvalues: GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView (copy), Url (copy), v27 (copy), default2 (copy), withLocalization (copy), Roact (copy), BrowserServiceWrapper (copy), GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled (copy), GetFFlagReplaceBrowserServiceWrapper (copy), HttpService (copy), JavascriptHybrid (copy), GetFFlagLuaAppEnableCredentialsProtocol (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), ExecuteJavaScriptInWebView (copy), GetFIntLuaAppCredentialsProtocolTimeout (copy), Logging (copy), AccountService (ref)
	local isVisible = p8.props.appContainerNavigation.isVisible
	local displayOrder = p8.props.appContainerNavigation.displayOrder
	local v64 = p8.props.forceWebViewVisible and true
	local challengeDisplayed = p8.state.challengeDisplayed
	local forceWebViewVisibleOnLoadFailure = p8.state.forceWebViewVisibleOnLoadFailure
	local v67 = GetFFlagLuaAppUseStaticCdnUrlForChallengeHybridWebView(p8.props.challengeParameters.userId) and Url.STATIC_CDN_URL or Url.WWW_URL
	local v68 = string.format("%schallenge/cdn/hybrid?%s%s", v67, p8:getBaseQueryParameters(), p8:getChallengeTypeQueryParameters())

	if v27 then
		default2:logEventOnce("challenge_launch_begin")
	end

	return withLocalization({
		title = "Feature.AccountSettings.Heading.Tab.Security"
	})(function(p9) -- line: 404
		-- upvalues: Roact (copy), BrowserServiceWrapper (copy), isVisible (copy), displayOrder (copy), GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled (copy), v64 (copy), challengeDisplayed (copy), forceWebViewVisibleOnLoadFailure (copy), GetFFlagReplaceBrowserServiceWrapper (copy), p8 (copy), v68 (copy), HttpService (copy), JavascriptHybrid (copy), v27 (copy), default2 (copy), GetFFlagLuaAppEnableCredentialsProtocol (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), ExecuteJavaScriptInWebView (copy), GetFIntLuaAppCredentialsProtocolTimeout (copy), Logging (copy), AccountService (ref)
		return Roact.createElement(BrowserServiceWrapper, {
			isVisible = isVisible,
			displayOrder = displayOrder,
			ignoreBackNavigationDisabled = GetFFlagLuaAppChallengeShouldIgnoreBackNavigationDisabled(),
			backNavigationHandledByParent = true,
			webViewVisible = v64 or (isVisible and challengeDisplayed or forceWebViewVisibleOnLoadFailure),
			windowClosedCallback = function() --[[ windowClosedCallback ]] -- line: 415
				-- upvalues: GetFFlagReplaceBrowserServiceWrapper (copy), p8 (copy)
				if not GetFFlagReplaceBrowserServiceWrapper() then
					p8:navigateBack()
				end
			end,
			modal = false,
			isGenericWebview = true,
			enableOverlayReplacement = true,
			title = p9.title,
			url = v68,
			javaScriptCallback = function(p10) --[[ javaScriptCallback ]] -- line: 427
				-- upvalues: p8 (copy), HttpService (copy), JavascriptHybrid (copy), v27 (copy), default2 (copy), GetFFlagLuaAppEnableCredentialsProtocol (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), ExecuteJavaScriptInWebView (copy), GetFIntLuaAppCredentialsProtocolTimeout (copy), Logging (copy), AccountService (ref)
				if not p8.isMounted then
					return
				end

				local data = HttpService:JSONDecode(p10)

				if data.moduleID ~= JavascriptHybrid.Module.Navigation or data.functionName ~= JavascriptHybrid.Function.navigateToFeature or not data.params or not data.params.params then
					return
				end

				if not p8.webViewLoaded then
					if v27 then
						default2:logEventOnce("challenge_launch_end")
					end

					p8.webViewLoaded = true

					if p8.props.analytics ~= nil and p8.props.analytics.Diag ~= nil then
						p8.props.analytics.Diag:reportCounter("ChallengeHybridWebView_NotTimeout", 1)
					end
				end

				local params = data.params.params

				if params.feature == JavascriptHybrid.Feature.ChallengeParsed and params.data.parsed == false then
					p8.challengeInitializationFailed = true
					p8:navigateBack()

					return
				end

				if params.feature == JavascriptHybrid.Feature.ChallengeInitialized and params.data.initialized == false then
					p8.challengeInitializationFailed = true
					p8:navigateBack()

					return
				end

				if GetFFlagLuaAppEnableCredentialsProtocol() and params.feature == JavascriptHybrid.Feature.CredentialsProtocolAvailable then
					default:isAvailable(default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p11) -- line: 482
						-- upvalues: ExecuteJavaScriptInWebView (copy), params (copy)
						local v83 = p11.isAvailable or false

						ExecuteJavaScriptInWebView.Execute(params.data.callId, (tostring(v83)))
					end):catch(function() -- line: 486
						-- upvalues: ExecuteJavaScriptInWebView (copy), params (copy)
						ExecuteJavaScriptInWebView.Execute(params.data.callId, "false")
					end)

					return
				end

				if GetFFlagLuaAppEnableCredentialsProtocol() and params.feature == JavascriptHybrid.Feature.GetCredentials then
					default:getCredentials(default.CredentialsTypes.FIDO2, params.data.authenticationOptionsJSON, GetFIntLuaAppCredentialsProtocolTimeout()):andThen(function(p12) -- line: 502
						-- upvalues: Logging (copy), HttpService (copy), ExecuteJavaScriptInWebView (copy), params (copy)
						if p12 ~= nil then
							Logging.warn("Executing javascript on webview to return GetCredentialsResponse")

							local json = HttpService:JSONEncode(p12)

							ExecuteJavaScriptInWebView.Execute(params.data.callId, json)
						end
					end):catch(function() -- line: 509
						-- upvalues: ExecuteJavaScriptInWebView (copy), params (copy)
						ExecuteJavaScriptInWebView.Execute(params.data.callId, "")
					end)

					return
				end

				if params.feature == JavascriptHybrid.Feature.GetIntegrityToken then
					if game:GetEngineFeature("AccountService") and AccountService and AccountService:DeviceIntegrityAvailable() then
						local DeviceIntegrityTokenYield = AccountService:GetDeviceIntegrityTokenYield(params.data.deviceIntegrityParams)

						if DeviceIntegrityTokenYield ~= nil then
							local json = HttpService:JSONEncode(DeviceIntegrityTokenYield)

							ExecuteJavaScriptInWebView.Execute(params.data.callId, json)

							return
						end
					end

					ExecuteJavaScriptInWebView.Execute(params.data.callId, "")

					return
				end

				if params.feature == JavascriptHybrid.Feature.ChallengeCompleted then
					p8.completionData = params.data
					p8:navigateBack()

					return
				end

				if params.feature == JavascriptHybrid.Feature.ChallengeInvalidated then
					p8.invalidationData = params.data
					p8:navigateBack()

					return
				end

				if data.params.params.feature == JavascriptHybrid.Feature.ChallengeDisplayed then
					p8:setState({
						challengeDisplayed = true
					})

					if p8.props.onChallengeDisplayed ~= nil then
						p8.props.onChallengeDisplayed()
					end
				end
			end
		})
	end)
end

local v42 = RoactNavigation.withNavigation(v39)
local v43 = RoactRodux.connect(nil, function(p13) -- line: 561
	-- upvalues: SetBackNavigationDisabled (copy)
	return {
		setBackNavigationDisabled = function(p14) --[[ setBackNavigationDisabled ]] -- line: 564
			-- upvalues: p13 (copy), SetBackNavigationDisabled (copy)
			return p13(SetBackNavigationDisabled(p14))
		end
	}
end)(v42)

return (RoactServices.connect({
	analytics = RoactAnalytics
})(v43))
