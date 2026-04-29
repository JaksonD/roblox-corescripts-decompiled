local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local MemStorageService = game:GetService("MemStorageService")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local PromiseUtilities = require(Modules.LuaApp.PromiseUtilities)
local AppStorageUtilities = require(script.Parent.AppStorageUtilities)
local ClearApp = require(script.Parent.ClearApp)
local GuiService = game:GetService("GuiService")
local SetAuthenticationStatus = require(CorePackages.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus
local Logout = require(Modules.LuaApp.Thunks.Authentication.Logout)
local luaLogoutReasonNames = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local ResetNavigationHistory = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local LoginStatus = require(Modules.LuaApp.Enum.LoginStatus)
local MemStorageKeys = require(Modules.LuaApp.Enum.MemStorageKeys)
local FlagSettings = require(Modules.LuaApp.FlagSettings)
local NavigateDown = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateToRoute = require(Modules.LuaApp.Thunks.NavigateToRoute)
local AppPage = require(Modules.LuaApp.AppPage)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local ExperimentCacheManager = require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager
local LoggingProtocol = require(CorePackages.Workspace.Packages.LoggingProtocol)
local LuaLogoutReasons = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.LuaLogoutReasons)
local TelemetryService = game:GetService("TelemetryService")
local getAppFeaturePolicies = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local FFlagEnableIosKeychainLoginLua = require(Modules.LuaApp.Flags.FFlagEnableIosKeychainLoginLua)
local GetFFlagKeystoreAutoLoginAvailable = SharedFlags.GetFFlagKeystoreAutoLoginAvailable
local AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreAnalyticsEvents = AuthCommon.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommon.Analytics.KeystoreEventConstants
local FFlagEnableTelemetryV2Logouts = require(Modules.LuaApp.Flags.FFlagEnableTelemetryV2Logouts)
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local LuaLogoutTelemetryConfig = TelemetryConfigs.LuaLogoutTelemetryConfig
local KeystoreRedirectTelemetryConfig = TelemetryConfigs.KeystoreRedirectTelemetryConfig
local GetFFlagAddPromCounterToKeystoreOps = SharedFlags.GetFFlagAddPromCounterToKeystoreOps
local GetFFlagEnableStorePreviousAccountData = SharedFlags.GetFFlagEnableStorePreviousAccountData
local StorePreviousAccountData = AuthCommon.Thunks.StorePreviousAccountData
local FFlagEnableCallingLogoutOnResetIXP = SharedFlags.FFlagEnableCallingLogoutOnResetIXP
local FFlagEnableLuaLoginRevamp = SharedFlags.FFlagEnableLuaLoginRevamp
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local IXPService = game:GetService("IXPService")

return function(p1, p2, p3, p4, s1: string?, t1: {[any]: any}?, b1: boolean?, b2: boolean?) -- line: 84
	-- upvalues: PromiseUtilities (copy), AppStorageUtilities (copy), LocalizationService (copy), FFlagEnableCallingLogoutOnResetIXP (copy), IXPService (copy), AppBtidLayers (copy), luaLogoutReasonNames (copy), Logout (copy), GuiService (copy), GetFFlagEnableStorePreviousAccountData (copy), StorePreviousAccountData (copy), ClearApp (copy), MemStorageService (copy), MemStorageKeys (copy), SetAuthenticationStatus (copy), LoginStatus (copy), LoggingProtocol (copy), LuaLogoutReasons (copy), FFlagEnableTelemetryV2Logouts (copy), TelemetryService (copy), LuaLogoutTelemetryConfig (copy), FlagSettings (copy), ResetNavigationHistory (copy), AppPage (copy), getAppFeaturePolicies (copy), NavigateToRoute (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), KeystoreRedirectTelemetryConfig (copy), FFlagEnableLuaLoginRevamp (copy), NavigateDown (copy), RoactAppExperiment (copy), ExperimentCacheManager (copy)
	PromiseUtilities.Batch({ p4 }):andThen(function(p5) -- line: 94
		-- upvalues: AppStorageUtilities (copy), LocalizationService (copy), p1 (copy), FFlagEnableCallingLogoutOnResetIXP (copy), IXPService (copy), AppBtidLayers (copy), s1 (copy), luaLogoutReasonNames (copy), p2 (copy), Logout (copy), p3 (copy), GuiService (copy), GetFFlagEnableStorePreviousAccountData (copy), StorePreviousAccountData (copy), ClearApp (copy), MemStorageService (copy), MemStorageKeys (copy), SetAuthenticationStatus (copy), LoginStatus (copy), LoggingProtocol (copy), LuaLogoutReasons (copy), FFlagEnableTelemetryV2Logouts (copy), TelemetryService (copy), LuaLogoutTelemetryConfig (copy), FlagSettings (copy), ResetNavigationHistory (copy), AppPage (copy), getAppFeaturePolicies (copy), NavigateToRoute (copy), t1 (copy), FFlagEnableIosKeychainLoginLua (copy), GetFFlagKeystoreAutoLoginAvailable (copy), b2 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), KeystoreRedirectTelemetryConfig (copy), FFlagEnableLuaLoginRevamp (copy), b1 (copy), NavigateDown (copy), RoactAppExperiment (copy), ExperimentCacheManager (copy)
		local g59 = nil
		local g64 = nil
		local v61 = nil

		if p5 and p5[1] then
			p5[1]:match(function(p6) -- line: 96
				-- upvalues: AppStorageUtilities (copy), LocalizationService (copy)
				AppStorageUtilities.setRobloxLocaleId(p6.signupAndLoginLocale)
				LocalizationService:SetRobloxLocaleId(p6.signupAndLoginLocale)
			end)
		end

		if p1 then
			if FFlagEnableCallingLogoutOnResetIXP then
				local ok, result = pcall(function() -- line: 57
					-- upvalues: IXPService (copy), AppBtidLayers (copy)
					return IXPService:GetBrowserTrackerLayerVariables(AppBtidLayers.LandingLayer)
				end)

				if (not ok or (result == nil or (result.iOSEnableCallingLogoutOnReset == nil or result.iOSEnableCallingLogoutOnReset))) and s1 == luaLogoutReasonNames.UnauthorizedAutoLogin then
					p2:dispatch(Logout(p3, GuiService, s1))
					g59 = true
				end
			end

			if not g59 then
				if GetFFlagEnableStorePreviousAccountData() then
					StorePreviousAccountData()
				end

				p2:dispatch(ClearApp())
				MemStorageService:Fire(MemStorageKeys.ThemeUpdate, "dark")
			end
		end

		g59 = false
		p2:dispatch(SetAuthenticationStatus(LoginStatus.LOGGED_OUT))

		if s1 ~= nil then
			LoggingProtocol.default:logRobloxTelemetryEvent(LuaLogoutReasons, nil, {
				lualogoutreasons = s1
			})
		end

		if FFlagEnableTelemetryV2Logouts then
			TelemetryService:LogCounter(LuaLogoutTelemetryConfig, {
				customFields = {
					reason = s1 or luaLogoutReasonNames.Unknown
				}
			}, 1)
		end

		if FlagSettings.WeChatLoginEnabled() then
			p2:dispatch(ResetNavigationHistory({{
				name = AppPage.WeChatLoginWrapper
			}}))
		elseif FlagSettings.LuaAppLoginUIEnabled() then
			if getAppFeaturePolicies().getUseSingleSignOn() then
				p2:dispatch(NavigateToRoute({{
					name = AppPage.SingleSignOnContainer
				}}))
			else
				local v60 = t1

				if v60 == nil then
					v61 = false
				else
					for _, v in pairs(v60) do
						if v ~= nil then
							v61 = true
							g64 = true
						end

						if g64 then
							break
						end
					end

					if not g64 then
						v61 = false
					end
				end

				g64 = false

				if (FFlagEnableIosKeychainLoginLua or GetFFlagKeystoreAutoLoginAvailable()) and t1 and v61 then
					local t2 = {}

					if b2 == nil or b2 == false then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.redirectToLandingPage)

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreRedirectTelemetryConfig, {
								customFields = {
									destination = "landing_page"
								}
							}, 1)
						end

						p2:dispatch(ResetNavigationHistory({{
							name = AppPage.Landing,
							extraProps = t2
						}}))
					else
						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreRedirectTelemetryConfig, {
								customFields = {
									destination = "login_page"
								}
							}, 1)
						end

						if FFlagEnableLuaLoginRevamp then
							t2.forcedUsernameOverride = t1.username
							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.redirectToLoginPage)
							p2:dispatch(ResetNavigationHistory({
								{
									name = AppPage.Landing,
									extraProps = {}
								},
								{
									name = AppPage.LoginV2,
									extraProps = t2
								}
							}))
						else
							t2.usernameFromIosKeychain = t1.username

							if b1 then
								t2.passwordFromIosKeychain = t1.password
							end

							KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.redirectToLoginPage)
							p2:dispatch(ResetNavigationHistory({
								{
									name = AppPage.Landing,
									extraProps = {}
								},
								{
									name = AppPage.Login,
									extraProps = t2
								}
							}))
						end
					end
				else
					if GetFFlagEnableStorePreviousAccountData() then
						StorePreviousAccountData()
					end

					p2:dispatch(ResetNavigationHistory({{
						name = AppPage.Landing,
						extraProps = {}
					}}))
				end
			end
		else
			p2:dispatch(NavigateDown({
				name = AppPage.LoginNative
			}))
		end

		RoactAppExperiment.clearUserLayers()
		ExperimentCacheManager.default:clearCache()
	end)
end
