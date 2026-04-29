local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppBrowserService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppBrowserService
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppGame = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGame
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local ExternalEventConnection = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local NotificationType = require(Modules.LuaApp.Enum.NotificationType)
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local LaunchGame = require(CorePackages.Workspace.Packages.GameLaunch).LaunchGame
local UrlBuilder = require(Modules.LuaApp.Http.UrlBuilder)
local AppPage = require(Modules.LuaApp.AppPage)
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local EnteredChatFromEntryPoint = require(CorePackages.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint
local NavigateDown = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBack = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateFromWebView = require(Modules.LuaApp.Thunks.NavigateFromWebView)
local AuthSessionRefresh = require(CorePackages.Workspace.Packages.AuthCommon).Http.Requests.AuthSessionRefresh
local FFlagRefreshAuthSessionAfterLanguageChange = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRefreshAuthSessionAfterLanguageChange
local v27 = game:DefineFastFlag("PushPermissionTriggerEnabled", false)
local GetFFlagEnableUnifiedWebViews = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews
local v29 = if not GetFFlagEnableUnifiedWebViews() then nil else game:GetService("WebViewService")
local v30 = Roact.Component:extend("UniversalAppRobloxHybridEventReceiver")

v30.defaultProps = {
	webViewService = v29
}

function v30.init(p1) -- line: 44
	-- upvalues: HttpService (copy), GetFFlagEnableUnifiedWebViews (copy), ChatEntryPointNames (copy), NotificationType (copy), AppPage (copy), UrlBuilder (copy), LaunchGame (copy), AppStorageService (copy), LocalStorageKey (copy), FFlagRefreshAuthSessionAfterLanguageChange (copy), AuthSessionRefresh (copy), v27 (copy)
	function p1.onJavascriptCallback(p2) -- line: 45
		-- upvalues: HttpService (copy), GetFFlagEnableUnifiedWebViews (copy), p1 (copy), ChatEntryPointNames (copy), NotificationType (copy), AppPage (copy), UrlBuilder (copy), LaunchGame (copy), AppStorageService (copy), LocalStorageKey (copy), FFlagRefreshAuthSessionAfterLanguageChange (copy), AuthSessionRefresh (copy), v27 (copy)
		local data = HttpService:JSONDecode(p2)

		if data.moduleID == "Navigation" and (data.functionName == "startWebChatConversation" and data.params.userId) then
			if not GetFFlagEnableUnifiedWebViews() then
				p1.props.browserService:CloseBrowserWindow()
			end

			p1.props.enteredChatFromEntryPoint(ChatEntryPointNames.AppShellWebView)
			p1.props.guiService:BroadcastNotification(tostring(data.params.userId), NotificationType.LAUNCH_CONVERSATION)

			return
		end

		if data.moduleID == "Navigation" and data.functionName == "openUserProfile" and data.params.userId then
			if GetFFlagEnableUnifiedWebViews() then
				p1.props.navigateFromWebView({
					name = AppPage.ViewUserProfile,
					detail = data.params.userId
				})

				return
			end

			p1.props.browserService:CloseBrowserWindow()
			p1.props.navigateDown({
				name = AppPage.ViewUserProfile,
				detail = data.params.userId
			})

			return
		end

		if data.moduleID == "Navigation" and data.functionName == "navigateToFeature" and data.params.params.urlPath then
			if GetFFlagEnableUnifiedWebViews() then
				local v37 = UrlBuilder.fromString("www:" .. data.params.params.urlPath)

				p1.props.navigateFromWebView({
					name = AppPage.GenericWebPage,
					detail = v37(),
					extraProps = {
						title = data.params.params.feature or ""
					}
				})

				return
			end

			local v38 = UrlBuilder.fromString("www:" .. data.params.params.urlPath)

			p1.props.browserService:CloseBrowserWindow()
			p1.props.navigateDown({
				name = AppPage.GenericWebPage,
				detail = v38(),
				extraProps = {
					title = data.params.params.feature or ""
				}
			})

			return
		end

		if data.moduleID == "Navigation" and data.functionName == "navigateToFeature" and data.params.params.deepLinkUrlPath then
			p1.props.linking:detectURL(data.params.params.deepLinkUrlPath)

			return
		end

		if data.moduleID == "Game" and data.functionName == "launchGame" and data.params.request.placeId then
			p1.props.navigateBack()

			if GetFFlagEnableUnifiedWebViews() then
				p1.props.webViewService:CloseWindow()
			else
				p1.props.browserService:CloseBrowserWindow()
			end

			LaunchGame(data.params.request.placeId, "GameDetailPageJSHybridEvent", {
				accessCode = data.params.request.accessCode,
				gameInstanceId = data.params.request.instanceId,
				linkCode = data.params.request.linkCode,
				joinAttemptId = data.params.request.joinAttemptId,
				joinAttemptOrigin = data.params.request.joinAttemptOrigin
			}, p1.props.game, data.params.request.joinAttemptOrigin, nil)

			return
		end

		if data.moduleID == "Game" and data.functionName == "launchGame" and data.params.request.requestType == "RequestFollowUser" then
			p1.props.navigateBack()

			if GetFFlagEnableUnifiedWebViews() then
				p1.props.webViewService:CloseWindow()
			else
				p1.props.browserService:CloseBrowserWindow()
			end

			LaunchGame(nil, "FollowUserJSHybridEvent", {
				userId = data.params.request.userId,
				joinAttemptId = data.params.request.joinAttemptId,
				joinAttemptOrigin = data.params.request.joinAttemptOrigin
			}, p1.props.game, data.params.request.joinAttemptOrigin, nil)

			return
		end

		if data.moduleID == "Localization" and data.functionName == "languageChangeTrigger" then
			p1.props.navigateBack()

			if GetFFlagEnableUnifiedWebViews() then
				p1.props.webViewService:CloseWindow()
			else
				p1.props.browserService:CloseBrowserWindow()
			end

			local newRobloxLanguageValue = data.params.newRobloxLanguageValue

			if typeof(newRobloxLanguageValue) == "table" then
				newRobloxLanguageValue = newRobloxLanguageValue.locale
			end

			local v40 = string.gsub(newRobloxLanguageValue, "_", "-")

			AppStorageService:SetItem(LocalStorageKey.RobloxLocaleId, v40)

			if FFlagRefreshAuthSessionAfterLanguageChange then
				AuthSessionRefresh(p1.props.networkImpl):finally(function() -- line: 163
					-- upvalues: p1 (copy), NotificationType (copy)
					p1.props.guiService:BroadcastNotification("", NotificationType.RESTART_LUA_APP)
				end)

				return
			end

			p1.props.guiService:BroadcastNotification("", NotificationType.RESTART_LUA_APP)

			return
		end

		if v27 and data.moduleID == "Push" and data.functionName == "pushPermissionTrigger" then
			p1.props.guiService:BroadcastNotification(data.moduleID, NotificationType.APP_READY)

			return
		end

		if data.moduleID == "Overlay" and data.functionName == "close" then
			p1.props.navigateBack()

			if GetFFlagEnableUnifiedWebViews() then
				p1.props.webViewService:CloseWindow()

				return
			end

			p1.props.browserService:CloseBrowserWindow()
		end
	end
end
function v30.render(p3) -- line: 188
	-- upvalues: Roact (copy), ExternalEventConnection (copy), GetFFlagEnableUnifiedWebViews (copy)
	return Roact.createElement(ExternalEventConnection, {
		event = if not GetFFlagEnableUnifiedWebViews() then p3.props.browserService.JavaScriptCallback else p3.props.webViewService.OnJavaScriptCall,
		callback = p3.onJavascriptCallback
	})
end

local v31 = RoactRodux.connect(nil, function(p4) -- line: 197
	-- upvalues: GetFFlagEnableUnifiedWebViews (copy), NavigateDown (copy), NavigateBack (copy), NavigateFromWebView (copy), EnteredChatFromEntryPoint (copy)
	return {
		navigateDown = not GetFFlagEnableUnifiedWebViews() and function(p5) -- line: 201
			-- upvalues: p4 (copy), NavigateDown (copy)
			return p4(NavigateDown(p5))
		end or nil,
		navigateBack = function() --[[ navigateBack ]] -- line: 204
			-- upvalues: p4 (copy), NavigateBack (copy)
			return p4(NavigateBack())
		end,
		navigateFromWebView = function(p6) --[[ navigateFromWebView ]] -- line: 207
			-- upvalues: p4 (copy), NavigateFromWebView (copy)
			return p4(NavigateFromWebView(p6))
		end,
		enteredChatFromEntryPoint = function(p7) --[[ enteredChatFromEntryPoint ]] -- line: 210
			-- upvalues: p4 (copy), EnteredChatFromEntryPoint (copy)
			return p4(EnteredChatFromEntryPoint(p7))
		end
	}
end)(v30)

return (RoactServices.connect({
	browserService = if not GetFFlagEnableUnifiedWebViews() then AppBrowserService else nil,
	guiService = AppGuiService,
	networkImpl = if not FFlagRefreshAuthSessionAfterLanguageChange then nil else RoactNetworking,
	game = AppGame,
	linking = AppLinking
})(v31))
