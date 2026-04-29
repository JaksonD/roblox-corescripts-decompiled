local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Roact = require(CorePackages.Packages.Roact)
local RoactNavigation = require(CorePackages.Packages.RoactNavigation)
local default = require(CorePackages.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default
local JavascriptHybrid = require(Modules.LuaApp.Enum.JavascriptHybrid)
local ExecuteJavaScriptInWebView = require(Modules.LuaApp.Util.ExecuteJavaScriptInWebView)
local BrowserServiceWrapper = require(Modules.LuaApp.Components.BrowserServiceWrapper)
local withLocalization = require(Modules.LuaApp.withLocalization)
local GetFFlagLuaAppEnableCredentialsProtocol = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol
local GetFIntLuaAppCredentialsProtocolTimeout = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout
local GetFIntLuaAppCredentialsProtocolAvailableTimeout = require(CorePackages.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local v15 = game:DefineFastFlag("RequireDeviceBoundOnlyForFIDO2", false)
local v16 = Roact.PureComponent:extend("SettingsNativeWrapper")

v16.defaultProps = {
	BrowserWrapperComponent = BrowserServiceWrapper,
	url = nil,
	titleKey = nil,
	isVisible = false,
	windowClosedCallback = nil,
	displayOrder = nil
}

function v16.render(p1) -- line: 45
	-- upvalues: withLocalization (copy), Roact (copy), HttpService (copy), GetFFlagLuaAppEnableCredentialsProtocol (copy), JavascriptHybrid (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), v15 (copy), ExecuteJavaScriptInWebView (copy), GetFIntLuaAppCredentialsProtocolTimeout (copy), Logging (copy)
	return withLocalization({
		title = p1.props.titleKey
	})(function(p2) -- line: 46
		-- upvalues: Roact (copy), p1 (copy), HttpService (copy), GetFFlagLuaAppEnableCredentialsProtocol (copy), JavascriptHybrid (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), v15 (copy), ExecuteJavaScriptInWebView (copy), GetFIntLuaAppCredentialsProtocolTimeout (copy), Logging (copy)
		return Roact.createElement(p1.props.BrowserWrapperComponent, {
			isVisible = p1.props.isVisible,
			modal = false,
			title = p2.title,
			webViewVisible = true,
			displayOrder = p1.props.displayOrder,
			url = p1.props.url,
			isGenericWebview = true,
			windowClosedCallback = p1.props.windowClosedCallback,
			javaScriptCallback = function(p3) --[[ javaScriptCallback ]] -- line: 56
				-- upvalues: HttpService (copy), GetFFlagLuaAppEnableCredentialsProtocol (copy), JavascriptHybrid (copy), default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeout (copy), v15 (copy), ExecuteJavaScriptInWebView (copy), GetFIntLuaAppCredentialsProtocolTimeout (copy), Logging (copy)
				local data = HttpService:JSONDecode(p3)

				if GetFFlagLuaAppEnableCredentialsProtocol() and ((if data.moduleID ~= JavascriptHybrid.Module.Navigation or (data.functionName ~= JavascriptHybrid.Function.navigateToFeature or (not data.params or not data.params.params)) then nil else data.params.params.feature)) == JavascriptHybrid.Feature.CredentialsProtocolAvailable then
					default:isAvailable(default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p4) -- line: 69
						-- upvalues: v15 (copy), ExecuteJavaScriptInWebView (copy), data (copy)
						local v23 = p4.isAvailable or false

						if v15 then
							v23 = not not v23 and (p4.supportsDeviceBoundOnly or false)
						end

						ExecuteJavaScriptInWebView.Execute(data.params.params.data.callId, (tostring(v23)))
					end):catch(function() -- line: 77
						-- upvalues: ExecuteJavaScriptInWebView (copy), data (copy)
						ExecuteJavaScriptInWebView.Execute(data.params.params.data.callId, "false")
					end)

					return
				end

				if GetFFlagLuaAppEnableCredentialsProtocol() and ((if data.moduleID ~= JavascriptHybrid.Module.Navigation or (data.functionName ~= JavascriptHybrid.Function.navigateToFeature or (not data.params or not data.params.params)) then nil else data.params.params.feature)) == JavascriptHybrid.Feature.RegisterCredentials then
					default:registerCredentials(default.CredentialsTypes.FIDO2, data.params.params.data.creationOptionsJSON, GetFIntLuaAppCredentialsProtocolTimeout()):andThen(function(p5) -- line: 93
						-- upvalues: Logging (copy), HttpService (copy), ExecuteJavaScriptInWebView (copy), data (copy)
						if p5 ~= nil then
							Logging.warn("Executing javascript on webview to return RegisterCredentialsResponse")

							local json = HttpService:JSONEncode(p5)

							ExecuteJavaScriptInWebView.Execute(data.params.params.data.callId, json)
						end
					end):catch(function() -- line: 100
						-- upvalues: ExecuteJavaScriptInWebView (copy), data (copy)
						ExecuteJavaScriptInWebView.Execute(data.params.params.data.callId, "")
					end)

					return
				end

				if GetFFlagLuaAppEnableCredentialsProtocol() and ((if data.moduleID ~= JavascriptHybrid.Module.Navigation or (data.functionName ~= JavascriptHybrid.Function.navigateToFeature or (not data.params or not data.params.params)) then nil else data.params.params.feature)) == JavascriptHybrid.Feature.GetCredentials then
					default:getCredentials(default.CredentialsTypes.FIDO2, data.params.params.data.authenticationOptionsJSON, GetFIntLuaAppCredentialsProtocolTimeout()):andThen(function(p6) -- line: 116
						-- upvalues: Logging (copy), HttpService (copy), ExecuteJavaScriptInWebView (copy), data (copy)
						if p6 ~= nil then
							Logging.warn("Executing javascript on webview to return GetCredentialsResponse")

							local json = HttpService:JSONEncode(p6)

							ExecuteJavaScriptInWebView.Execute(data.params.params.data.callId, json)
						end
					end):catch(function() -- line: 123
						-- upvalues: ExecuteJavaScriptInWebView (copy), data (copy)
						ExecuteJavaScriptInWebView.Execute(data.params.params.data.callId, "")
					end)

					return
				end
			end
		})
	end)
end

return (RoactNavigation.withNavigation(v16))
