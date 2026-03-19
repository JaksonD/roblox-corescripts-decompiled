local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppBrowserService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppBrowserService;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppGame_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGame;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v13 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v14 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local l_LaunchGame_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchGame;
local v17 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v18 = require(l_Modules_0.LuaApp.AppPage);
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local v21 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v23 = require(l_Modules_0.LuaApp.Thunks.NavigateFromWebView);
local l_AuthSessionRefresh_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Http.Requests.AuthSessionRefresh;
local l_FFlagRefreshAuthSessionAfterLanguageChange_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRefreshAuthSessionAfterLanguageChange;
local v26 = game:DefineFastFlag("GenericNavigationDeepLinkEnabled", false);
local v27 = game:DefineFastFlag("PushPermissionTriggerEnabled", false);
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local v29 = if l_GetFFlagEnableUnifiedWebViews_0() then game:GetService("WebViewService") else nil;
local v30 = v5.Component:extend("UniversalAppRobloxHybridEventReceiver");
v30.defaultProps = {
    webViewService = v29
};
v30.init = function(v31) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_ChatEntryPointNames_0 (copy), v14 (copy), v18 (copy), v17 (copy), v26 (copy), l_LaunchGame_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_FFlagRefreshAuthSessionAfterLanguageChange_0 (copy), l_AuthSessionRefresh_0 (copy), v27 (copy)
    v31.onJavascriptCallback = function(v32) --[[ Line: 47 ]]
        -- upvalues: l_HttpService_0 (ref), l_GetFFlagEnableUnifiedWebViews_0 (ref), v31 (copy), l_ChatEntryPointNames_0 (ref), v14 (ref), v18 (ref), v17 (ref), v26 (ref), l_LaunchGame_0 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_FFlagRefreshAuthSessionAfterLanguageChange_0 (ref), l_AuthSessionRefresh_0 (ref), v27 (ref)
        local v33 = l_HttpService_0:JSONDecode(v32);
        if v33.moduleID == "Navigation" and v33.functionName == "startWebChatConversation" and v33.params.userId then
            if not l_GetFFlagEnableUnifiedWebViews_0() then
                v31.props.browserService:CloseBrowserWindow();
            end;
            v31.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.AppShellWebView);
            v31.props.guiService:BroadcastNotification(tostring(v33.params.userId), v14.LAUNCH_CONVERSATION);
            return;
        elseif v33.moduleID == "Navigation" and v33.functionName == "openUserProfile" and v33.params.userId then
            if l_GetFFlagEnableUnifiedWebViews_0() then
                v31.props.navigateFromWebView({
                    name = v18.ViewUserProfile, 
                    detail = v33.params.userId
                });
                return;
            else
                v31.props.browserService:CloseBrowserWindow();
                v31.props.navigateDown({
                    name = v18.ViewUserProfile, 
                    detail = v33.params.userId
                });
                return;
            end;
        elseif v33.moduleID == "Navigation" and v33.functionName == "navigateToFeature" and v33.params.params.urlPath then
            if l_GetFFlagEnableUnifiedWebViews_0() then
                local v34 = v17.fromString("www:" .. v33.params.params.urlPath);
                v31.props.navigateFromWebView({
                    name = v18.GenericWebPage, 
                    detail = v34(), 
                    extraProps = {
                        title = v33.params.params.feature or ""
                    }
                });
                return;
            else
                local v35 = v17.fromString("www:" .. v33.params.params.urlPath);
                v31.props.browserService:CloseBrowserWindow();
                v31.props.navigateDown({
                    name = v18.GenericWebPage, 
                    detail = v35(), 
                    extraProps = {
                        title = v33.params.params.feature or ""
                    }
                });
                return;
            end;
        elseif v26 and v33.moduleID == "Navigation" and v33.functionName == "navigateToFeature" and v33.params.params.deepLinkUrlPath then
            v31.props.linking:detectURL(v33.params.params.deepLinkUrlPath);
            return;
        elseif v33.moduleID == "Game" and v33.functionName == "launchGame" and v33.params.request.placeId then
            v31.props.navigateBack();
            if l_GetFFlagEnableUnifiedWebViews_0() then
                v31.props.webViewService:CloseWindow();
            else
                v31.props.browserService:CloseBrowserWindow();
            end;
            l_LaunchGame_0(v33.params.request.placeId, "GameDetailPageJSHybridEvent", {
                accessCode = v33.params.request.accessCode, 
                gameInstanceId = v33.params.request.instanceId, 
                linkCode = v33.params.request.linkCode, 
                joinAttemptId = v33.params.request.joinAttemptId, 
                joinAttemptOrigin = v33.params.request.joinAttemptOrigin
            }, v31.props.game, v33.params.request.joinAttemptOrigin, nil);
            return;
        elseif v33.moduleID == "Game" and v33.functionName == "launchGame" and v33.params.request.requestType == "RequestFollowUser" then
            v31.props.navigateBack();
            if l_GetFFlagEnableUnifiedWebViews_0() then
                v31.props.webViewService:CloseWindow();
            else
                v31.props.browserService:CloseBrowserWindow();
            end;
            l_LaunchGame_0(nil, "FollowUserJSHybridEvent", {
                userId = v33.params.request.userId, 
                joinAttemptId = v33.params.request.joinAttemptId, 
                joinAttemptOrigin = v33.params.request.joinAttemptOrigin
            }, v31.props.game, v33.params.request.joinAttemptOrigin, nil);
            return;
        elseif v33.moduleID == "Localization" and v33.functionName == "languageChangeTrigger" then
            v31.props.navigateBack();
            if l_GetFFlagEnableUnifiedWebViews_0() then
                v31.props.webViewService:CloseWindow();
            else
                v31.props.browserService:CloseBrowserWindow();
            end;
            local l_newRobloxLanguageValue_0 = v33.params.newRobloxLanguageValue;
            if typeof(l_newRobloxLanguageValue_0) == "table" then
                l_newRobloxLanguageValue_0 = l_newRobloxLanguageValue_0.locale;
            end;
            local v37 = string.gsub(l_newRobloxLanguageValue_0, "_", "-");
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.RobloxLocaleId, v37);
            if l_FFlagRefreshAuthSessionAfterLanguageChange_0 then
                l_AuthSessionRefresh_0(v31.props.networkImpl):finally(function() --[[ Line: 166 ]]
                    -- upvalues: v31 (ref), v14 (ref)
                    v31.props.guiService:BroadcastNotification("", v14.RESTART_LUA_APP);
                end);
                return;
            else
                v31.props.guiService:BroadcastNotification("", v14.RESTART_LUA_APP);
                return;
            end;
        elseif v27 and v33.moduleID == "Push" and v33.functionName == "pushPermissionTrigger" then
            v31.props.guiService:BroadcastNotification(v33.moduleID, v14.APP_READY);
            return;
        else
            if v33.moduleID == "Overlay" and v33.functionName == "close" then
                v31.props.navigateBack();
                if l_GetFFlagEnableUnifiedWebViews_0() then
                    v31.props.webViewService:CloseWindow();
                    return;
                else
                    v31.props.browserService:CloseBrowserWindow();
                end;
            end;
            return;
        end;
    end;
end;
v30.render = function(v38) --[[ Line: 191 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v13 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy)
    return v5.createElement(v13, {
        event = if l_GetFFlagEnableUnifiedWebViews_0() then v38.props.webViewService.OnJavaScriptCall else v38.props.browserService.JavaScriptCallback, 
        callback = v38.onJavascriptCallback
    });
end;
v30 = v6.connect(nil, function(v39) --[[ Line: 200 ]]
    -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy), v21 (copy), v22 (copy), v23 (copy), l_EnteredChatFromEntryPoint_0 (copy)
    return {
        navigateDown = if l_GetFFlagEnableUnifiedWebViews_0() then nil else function(v40) --[[ Line: 204 ]]
            -- upvalues: v39 (copy), v21 (ref)
            return v39(v21(v40));
        end, 
        navigateBack = function() --[[ Line: 207 ]] --[[ Name: navigateBack ]]
            -- upvalues: v39 (copy), v22 (ref)
            return v39(v22());
        end, 
        navigateFromWebView = function(v41) --[[ Line: 210 ]] --[[ Name: navigateFromWebView ]]
            -- upvalues: v39 (copy), v23 (ref)
            return v39(v23(v41));
        end, 
        enteredChatFromEntryPoint = function(v42) --[[ Line: 213 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v39 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            return v39(l_EnteredChatFromEntryPoint_0(v42));
        end
    };
end)(v30);
return (l_RoactServices_0.connect({
    browserService = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_AppBrowserService_0, 
    guiService = l_AppGuiService_0, 
    networkImpl = if l_FFlagRefreshAuthSessionAfterLanguageChange_0 then l_RoactNetworking_0 else nil, 
    game = l_AppGame_0, 
    linking = l_AppLinking_0
})(v30));