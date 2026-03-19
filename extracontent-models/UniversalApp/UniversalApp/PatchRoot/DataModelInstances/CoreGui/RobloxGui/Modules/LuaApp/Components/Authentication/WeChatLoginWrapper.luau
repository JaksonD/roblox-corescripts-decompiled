local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v11 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Modules_0.LuaApp.withLocalization);
local v14 = require(l_Modules_0.LuaApp.Components.LoadingBar);
local v15 = require(l_Modules_0.LuaApp.Components.FitImageTextButton);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchAccountSettings);
local v17 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v18 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v19 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v21 = v5.PureComponent:extend("WeChatLoginWrapper");
v21.init = function(v22) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_BrowserService_0 (copy), l_HttpService_0 (copy)
    v22.state = {
        showingBrowser = true, 
        hasAuthenticated = false
    };
    v22.openWWWLogin = function() --[[ Line: 37 ]]
        -- upvalues: l_BrowserService_0 (ref), v22 (copy)
        l_BrowserService_0:OpenWeChatAuthWindow();
        v22:setState({
            showingBrowser = true
        });
    end;
    v22.onBrowserWindowClosed = function() --[[ Line: 43 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            showingBrowser = false
        });
    end;
    v22.onAuthTokenUpdated = function() --[[ Line: 48 ]]
        -- upvalues: v22 (copy)
        local l_appPolicy_0 = v22.props.appPolicy;
        v22.props.launchApp(v22.props.networking, v22.props.omniRecommendationsRequest, v22.props.analytics, l_appPolicy_0);
    end;
    v22.onJavascriptCallback = function(v24) --[[ Line: 58 ]]
        -- upvalues: l_HttpService_0 (ref), l_BrowserService_0 (ref), v22 (copy)
        local v25 = l_HttpService_0:JSONDecode(v24);
        if v25.moduleID ~= "Navigation" then
            return;
        elseif v25.functionName ~= "navigateToFeature" then
            return;
        else
            local l_feature_0 = v25.params.params.feature;
            if l_feature_0 == "login" or l_feature_0 == "signUp" then
                l_BrowserService_0:CopyAuthCookieFromBrowserToEngine();
                l_BrowserService_0:CloseBrowserWindow();
                spawn(function() --[[ Line: 70 ]]
                    -- upvalues: v22 (ref)
                    v22:setState({
                        hasAuthenticated = true
                    });
                end);
            end;
            return;
        end;
    end;
end;
v21.didMount = function(_) --[[ Line: 79 ]] --[[ Name: didMount ]]
    -- upvalues: l_BrowserService_0 (copy)
    l_BrowserService_0:OpenWeChatAuthWindow();
end;
v21.render = function(v28) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v11 (copy), l_BrowserService_0 (copy), v14 (copy), v15 (copy), v4 (copy), v20 (copy), v13 (copy)
    local l_appTheme_0 = v28.props.appTheme;
    local l_localization_0 = v28.props.localization;
    local v31 = {
        BrowserWindowClosedConnection = v5.createElement(v11, {
            event = l_BrowserService_0.BrowserWindowClosed, 
            callback = v28.onBrowserWindowClosed
        }), 
        AuthCookieCopiedToEngineConnection = v5.createElement(v11, {
            event = l_BrowserService_0.AuthCookieCopiedToEngine, 
            callback = v28.onAuthTokenUpdated
        }), 
        JavaScriptCallbackConnection = v5.createElement(v11, {
            event = l_BrowserService_0.JavaScriptCallback, 
            callback = v28.onJavascriptCallback
        })
    };
    local function v33(v32) --[[ Line: 102 ]]
        -- upvalues: v28 (copy), v31 (copy), v5 (ref), v14 (ref), v15 (ref), l_appTheme_0 (copy), v4 (ref)
        if v28.state.showingBrowser or v28.state.hasAuthenticated then
            v31.LoadingBar = v5.createElement(v14);
        else
            v31.LoginButton = v5.createElement(v15, {
                backgroundColor = l_appTheme_0.Authentication.WeChatButton.Background.Color, 
                backgroundImage = "LuaApp/buttons/buttonFill", 
                sliceCenter = Rect.new(8, 8, 9, 9), 
                maxWidth = 200, 
                minWidth = 50, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                horizontalPadding = 30, 
                verticalPadding = 9, 
                iconRightPadding = 5, 
                text = v32.loginText, 
                textColor = l_appTheme_0.Authentication.WeChatButton.Text.Color, 
                textFont = l_appTheme_0.Authentication.WeChatButton.Text.Font, 
                textSize = l_appTheme_0.Authentication.WeChatButton.Text.Size, 
                onActivated = v28.openWWWLogin
            });
        end;
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v4.Color.GRAY4, 
            ZIndex = 1
        }, v31);
    end;
    if v20() then
        return v13({
            loginText = "Authentication.Login.Action.WeChatLogin"
        })(v33);
    else
        return v33({
            loginText = l_localization_0:Format("Authentication.Login.Action.WeChatLogin")
        });
    end;
end;
v21 = v19(v21);
v21 = v6.connect(function(_, _) --[[ Line: 144 ]]
    return {};
end, function(v36) --[[ Line: 146 ]]
    -- upvalues: v16 (copy), v17 (copy), v18 (copy)
    return {
        fetchAccountSettings = function(v37, v38, v39) --[[ Line: 148 ]] --[[ Name: fetchAccountSettings ]]
            -- upvalues: v36 (copy), v16 (ref)
            v36(v16(v37, v38, v39));
        end, 
        launchApp = function(v40, v41, v42, v43) --[[ Line: 151 ]] --[[ Name: launchApp ]]
            -- upvalues: v36 (copy), v17 (ref), v18 (ref)
            v36(v17(v40, v41, v42, v43, v18.Login));
        end
    };
end)(v21);
v21 = l_RoactServices_0.connect({
    networking = v8, 
    analytics = v9, 
    localization = v10
})(v21);
return (l_RoactAppPolicy_0.connect(function(v44, _) --[[ Line: 163 ]]
    return {
        appPolicy = v44
    };
end)(v21));