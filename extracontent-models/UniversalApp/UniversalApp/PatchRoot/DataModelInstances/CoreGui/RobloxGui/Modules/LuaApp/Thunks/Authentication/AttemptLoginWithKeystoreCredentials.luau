local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local TelemetryService = game:GetService("TelemetryService")
local Promise = require(CorePackages.Packages.Promise)
local Modules = CoreGui.RobloxGui.Modules
local LoginResult = require(Modules.LuaApp.Models.Authentication.LoginResult)
local LoginErrorCodes = require(CorePackages.Workspace.Packages.AuthCommon).Enums.LoginErrorCodes
local AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreConstants = AuthCommon.Common.KeystoreConstants
local KeystoreAnalyticsEvents = AuthCommon.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommon.Analytics.KeystoreEventConstants
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagRemoveKeystoreIxpLogic = SharedFlags.GetFFlagRemoveKeystoreIxpLogic
local GetFFlagAddPromCounterToKeystoreOps = SharedFlags.GetFFlagAddPromCounterToKeystoreOps
local AuthAnalytics = require(CorePackages.Workspace.Packages.AuthAnalytics)
local KeystoreGetCredentialsTelemetryConfig = AuthAnalytics.TelemetryConfigs.KeystoreGetCredentialsTelemetryConfig
local KeystoreAutoLoginTelemetryConfig = AuthAnalytics.TelemetryConfigs.KeystoreAutoLoginTelemetryConfig

return function(p1, p2, p3) -- line: 20
	-- upvalues: Promise (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreGetCredentialsTelemetryConfig (copy), HttpService (copy), GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreConstants (copy), KeystoreAutoLoginTelemetryConfig (copy), LoginResult (copy), LoginErrorCodes (copy)
	return function(p4) -- line: 21
		-- upvalues: Promise (copy), p2 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreGetCredentialsTelemetryConfig (copy), HttpService (copy), GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreConstants (copy), p1 (copy), p3 (copy), KeystoreAutoLoginTelemetryConfig (copy), LoginResult (copy), LoginErrorCodes (copy)
		local u23 = false

		return Promise.new(function(p5, p6) -- line: 40
			-- upvalues: p2 (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreGetCredentialsTelemetryConfig (copy), HttpService (copy), GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreConstants (copy), p1 (copy), Promise (copy), u23 (ref), p3 (copy), p4 (copy), KeystoreAutoLoginTelemetryConfig (copy), LoginResult (copy), LoginErrorCodes (copy)
			local t1 = {
				username = nil,
				userId = nil,
				password = nil
			}

			p2():andThen(function(p7) -- line: 48
				-- upvalues: KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreGetCredentialsTelemetryConfig (copy), p6 (copy), t1 (copy), HttpService (copy), GetFFlagRemoveKeystoreIxpLogic (copy), KeystoreConstants (copy), p1 (copy), Promise (copy), u23 (ref), p3 (copy), p4 (copy), KeystoreAutoLoginTelemetryConfig (copy), p5 (copy), LoginResult (copy), LoginErrorCodes (copy)
				if p7 == nil then
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentialsNilResult)

					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, {
							customFields = {
								result = "nil_result"
							}
						}, 1)
					end

					p6({
						credentials = t1,
						credentialsValidForLogin = false,
						redirectToLoginPage = false
					})

					return
				end

				local v34 = HttpService:JSONDecode(p7).response[1]

				t1.username = v34.username
				t1.userId = v34.userId
				t1.password = v34.password

				if GetFFlagRemoveKeystoreIxpLogic() then
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentials, t1.userId)

					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, {
							customFields = {
								result = "has_credentials"
							}
						}, 1)
					end
				else
					t1.experimentGroup = v34.experimentGroup

					local v35 = ({
						[KeystoreConstants.Experiment] = KeystoreEventConstants.origin.getCredentialsExperimentGroup,
						[KeystoreConstants.Control] = KeystoreEventConstants.origin.getCredentialsControlGroup
					})[t1.experimentGroup] or KeystoreEventConstants.origin.getCredentialsNoIxpGroup

					KeystoreAnalyticsEvents.sendPageLoadEvent(v35, t1.userId)

					if t1.experimentGroup ~= KeystoreConstants.Experiment then
						p6({
							credentials = t1,
							credentialsValidForLogin = false,
							redirectToLoginPage = false
						})
					end
				end

				if v34.username == "" then
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentialsEmptyResult)

					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, {
							customFields = {
								result = "empty_result"
							}
						}, 1)
					end

					p6({
						credentials = t1,
						credentialsValidForLogin = false,
						redirectToLoginPage = false
					})

					return
				end

				if not v34.errorCode or v34.errorCode ~= "" then
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentialsPopulateUsername, t1.userId)

					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, {
							customFields = {
								result = "populate_username"
							}
						}, 1)
					end

					p6({
						credentials = t1,
						credentialsValidForLogin = false,
						redirectToLoginPage = true
					})

					return
				end

				local v36 = p1

				p3(function(p8, p9, p10) -- line: 24
					-- upvalues: v36 (copy), Promise (copy), u23 (ref)
					local v43, v44 = v36(p8, p9, p10)

					return v43:andThen(function(p11) -- line: 27
						-- upvalues: Promise (copy)
						return Promise.resolve(p11)
					end):catch(function(p12) -- line: 31
						-- upvalues: u23 (ref), Promise (copy)
						u23 = true

						return Promise.reject(p12)
					end), v44
				end, t1)(p4):andThen(function(p13) -- line: 150
					-- upvalues: KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), t1 (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreAutoLoginTelemetryConfig (copy), u23 (ref), p5 (copy), LoginResult (copy)
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.successfulLogin, t1.userId)

					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, {
							customFields = {
								outcome = "success"
							}
						}, 1)
					end

					if u23 then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.gcsCase, t1.userId)

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, {
								customFields = {
									outcome = "gcs"
								}
							}, 1)
						end

						p5({
							credentials = t1,
							credentialsValidForLogin = false,
							redirectToLoginPage = false
						})

						return
					end

					if LoginResult.hasTwoStepData(p13) then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.hasTwoStepData, t1.userId)

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, {
								customFields = {
									outcome = "two_step"
								}
							}, 1)
						end

						p5({
							credentials = t1,
							credentialsValidForLogin = true,
							redirectToLoginPage = true
						})

						return
					end

					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.regularAccountSuccess, t1.userId)

					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, {
							customFields = {
								outcome = "regular_success"
							}
						}, 1)
					end

					p5({
						loginResult = p13,
						credentials = t1,
						credentialsValidForLogin = true,
						redirectToLoginPage = false
					})
				end):catch(function(p14) -- line: 223
					-- upvalues: KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), t1 (copy), GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreAutoLoginTelemetryConfig (copy), u23 (ref), LoginErrorCodes (copy), p6 (copy)
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.failedLogin, t1.userId)

					if GetFFlagAddPromCounterToKeystoreOps() then
						TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, {
							customFields = {
								outcome = "failed"
							}
						}, 1)
					end

					local v47 = not u23

					if p14 and p14.errorCode == LoginErrorCodes.IncorrectCValueOrPassword then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.failedLoginIncorrectPassword, t1.userId)

						if GetFFlagAddPromCounterToKeystoreOps() then
							TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, {
								customFields = {
									outcome = "failed_incorrect_password"
								}
							}, 1)
						end

						v47 = true
					end

					p6({
						credentials = t1,
						credentialsValidForLogin = false,
						redirectToLoginPage = v47
					})
				end)
			end):catch(function(_) -- line: 262
				-- upvalues: GetFFlagAddPromCounterToKeystoreOps (copy), TelemetryService (copy), KeystoreGetCredentialsTelemetryConfig (copy), p6 (copy), t1 (copy), u23 (ref)
				if GetFFlagAddPromCounterToKeystoreOps() then
					TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, {
						customFields = {
							result = "error"
						}
					}, 1)
				end

				p6({
					credentials = t1,
					credentialsValidForLogin = false,
					redirectToLoginPage = not u23
				})
			end)
		end)
	end
end
