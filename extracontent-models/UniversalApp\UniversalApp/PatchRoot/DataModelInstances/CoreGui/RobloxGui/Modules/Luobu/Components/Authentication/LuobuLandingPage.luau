local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v10.Style.withStyle;
local v13 = require(l_Modules_0.LuaApp.withLocalization);
local v14 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v15 = require(l_Modules_0.LuaApp.Themes.Colors);
local v16 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v20 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v21 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v22 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_AuthenticationProtocol_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol;
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v25 = require(l_Modules_0.LuaApp.Components.WeChatButton);
local v26 = require(l_Modules_0.LuaApp.Components.QQButton);
local v27 = require(l_Modules_0.Luobu.Thunks.RequestMSDKLogin);
local v28 = require(l_Modules_0.Luobu.Thunks.RequestTokenAuthentication);
local v29 = require(l_Modules_0.Luobu.Thunks.LaunchLuobuApp);
local v30 = require(l_Modules_0.LuaApp.Http.Requests.FetchUpdatedUserAgreements);
local v31 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginInProgress);
local v32 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginErrMessageKey);
local v33 = require(l_Modules_0.Luobu.Actions.SetTokenAuthErrMessageKey);
local v34 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginOpenId);
local v35 = require(l_Modules_0.Luobu.Actions.SetSignUpInfo);
local v36 = v2.PureComponent:extend("LuobuLandingPage");
v36.validateProps = v11.strictInterface({
    loginInProgress = v11.boolean, 
    MSDKLoginErrMessageKey = v11.optional(v11.string), 
    tokenAuthErrMessageKey = v11.optional(v11.string), 
    requestMSDKLogin = v11.callback, 
    requestTokenAuthentication = v11.callback, 
    launchLuobuApp = v11.callback, 
    setMSDKLoginInProgress = v11.callback, 
    setMSDKLoginOpenId = v11.callback, 
    setSignUpInfo = v11.callback, 
    resetMSDKLoginErrMessageKey = v11.callback, 
    resetTokenAuthErrMessageKey = v11.callback, 
    resetSignUpInfo = v11.callback, 
    navigateToSignUpPage = v11.callback, 
    navigateBack = v11.callback, 
    showUserAgreementsPrompt = v11.callback, 
    showAlert = v11.callback, 
    networking = v11.callback, 
    analytics = v11.table, 
    authAnalytics = v11.table, 
    appPolicy = v11.table, 
    guiService = v11.table
});
v36.init = function(v37) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v14 (copy), l_AuthenticationProtocol_0 (copy)
    v37.resetErrorMessages = function() --[[ Line: 75 ]]
        -- upvalues: v37 (copy)
        v37.props.resetMSDKLoginErrMessageKey();
        v37.props.resetTokenAuthErrMessageKey();
    end;
    v37.shutdownApp = function() --[[ Line: 80 ]]
        -- upvalues: v37 (copy), v22 (ref)
        v37.props.guiService:BroadcastNotification("", v22.NATIVE_EXIT);
    end;
    v37.onLogin = function(v38) --[[ Line: 85 ]]
        -- upvalues: v37 (copy)
        local l_analytics_0 = v37.props.analytics;
        local l_networking_0 = v37.props.networking;
        local l_appPolicy_0 = v37.props.appPolicy;
        local l_setMSDKLoginInProgress_0 = v37.props.setMSDKLoginInProgress;
        local l_setMSDKLoginOpenId_0 = v37.props.setMSDKLoginOpenId;
        local l_setSignUpInfo_0 = v37.props.setSignUpInfo;
        local l_launchLuobuApp_0 = v37.props.launchLuobuApp;
        local l_requestMSDKLogin_0 = v37.props.requestMSDKLogin;
        local l_requestTokenAuthentication_0 = v37.props.requestTokenAuthentication;
        local l_navigateToSignUpPage_0 = v37.props.navigateToSignUpPage;
        local l_navigateBack_0 = v37.props.navigateBack;
        v37:resetErrorMessages();
        l_setMSDKLoginInProgress_0(true);
        local v50, v51 = l_requestMSDKLogin_0(l_analytics_0, v38, l_networking_0, l_appPolicy_0):await();
        if not v50 then
            l_setMSDKLoginInProgress_0(false);
            return;
        else
            l_setMSDKLoginOpenId_0(v51.openId);
            local v52, v53 = l_requestTokenAuthentication_0(l_networking_0, l_analytics_0, v38, v51):await();
            if not v52 then
                l_setMSDKLoginInProgress_0(false);
                if l_appPolicy_0.useMSDKWebAuthentication() then
                    l_navigateBack_0();
                end;
                return;
            elseif not v53.voucher then
                l_launchLuobuApp_0(l_networking_0, l_analytics_0, l_appPolicy_0);
                return;
            else
                l_setSignUpInfo_0(v53.displayName, v53.voucher, v38, v51.channelId);
                l_navigateToSignUpPage_0();
                return;
            end;
        end;
    end;
    v37.onWeChatButtonActivated = function() --[[ Line: 128 ]]
        -- upvalues: v37 (copy), v14 (ref), l_AuthenticationProtocol_0 (ref)
        if v37.props.loginInProgress then
            return;
        else
            v37.props.authAnalytics.reportQQButtonClicked(v14.Context.LuobuLandingPage);
            v37.onLogin(l_AuthenticationProtocol_0.AuthMethods.WECHAT);
            return;
        end;
    end;
    v37.onQQButtonActivated = function() --[[ Line: 137 ]]
        -- upvalues: v37 (copy), v14 (ref), l_AuthenticationProtocol_0 (ref)
        if v37.props.loginInProgress then
            return;
        else
            v37.props.authAnalytics.reportQQButtonClicked(v14.Context.LuobuLandingPage);
            v37.onLogin(l_AuthenticationProtocol_0.AuthMethods.QQ);
            return;
        end;
    end;
end;
v36.willUnmount = function(v54) --[[ Line: 147 ]] --[[ Name: willUnmount ]]
    v54.props.setMSDKLoginInProgress(false);
end;
v36.didMount = function(v55) --[[ Line: 151 ]] --[[ Name: didMount ]]
    -- upvalues: v30 (copy)
    v55.props.resetSignUpInfo();
    local v56, v57 = v30(v55.props.networking, v55.props.analytics):await();
    if not v56 or type(v57) ~= "table" or next(v57) == nil then
        local l_shutdownApp_0 = v55.shutdownApp;
        v55.props.showAlert("CommonUI.Messages.Label.Alert", "Luobu.Authentication.Message.UnknownErrorTryAgain", "Application.ConnectionError.Action.Ok", l_shutdownApp_0);
        return;
    else
        v55.props.showUserAgreementsPrompt(v57);
        return;
    end;
end;
v36.render = function(v59) --[[ Line: 167 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v13 (copy), v2 (copy), v24 (copy), v16 (copy), v15 (copy), v25 (copy), v26 (copy)
    local v60 = v59.props.MSDKLoginErrMessageKey ~= "" and v59.props.MSDKLoginErrMessageKey or v59.props.tokenAuthErrMessageKey ~= "" and v59.props.tokenAuthErrMessageKey;
    return l_withStyle_0(function(v61) --[[ Line: 171 ]]
        -- upvalues: v13 (ref), v60 (copy), v59 (copy), v2 (ref), v24 (ref), v16 (ref), v15 (ref), v25 (ref), v26 (ref)
        return v13({
            logInTextWeChat = "Authentication.Login.Action.WeChatLogin", 
            logInTextQQ = "Authentication.Login.Action.QQLogin", 
            antiAddictionText = "Luobu.Authentication.Login.Label.AntiAddictionText", 
            networkLicense = "Luobu.Authentication.Login.Label.NetworkLicense", 
            tokenAuthFailure = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain", 
            localizedError = v60 ~= "" and v60 or nil
        })(function(v62) --[[ Line: 179 ]]
            -- upvalues: v59 (ref), v2 (ref), v24 (ref), v16 (ref), v61 (copy), v15 (ref), v25 (ref), v26 (ref)
            local l_loginInProgress_0 = v59.props.loginInProgress;
            return v2.createElement(v24, {
                ContentAlign = v16.Top, 
                LuobuLogoEnabled = true
            }, {
                LandingPageContents = v2.createElement("Frame", {
                    Size = UDim2.new(1, -40, 0, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, 10), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom
                    }), 
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 36)
                    }), 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, 0), 
                        MaxSize = Vector2.new(360, 1e999)
                    }), 
                    AntiAddictionText = v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        TextColor3 = v61.Theme.SystemPrimaryDefault.Color, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v62.antiAddictionText, 
                        TextTransparency = 0.5, 
                        TextSize = v61.Font.BaseSize * v61.Font.Footer.RelativeMinSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    ErrorText = v2.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        TextColor3 = v15.Red, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v62.localizedError or "", 
                        Font = v61.Font.Footer.Font, 
                        TextSize = v61.Font.BaseSize * v61.Font.Footer.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }, {
                        UISizeConstraint = v2.createElement("UISizeConstraint", {
                            MinSize = Vector2.new(0, 10)
                        })
                    }), 
                    WeChatButton = v2.createElement(v25, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = v62.logInTextWeChat, 
                        TextSize = v61.Font.BaseSize * v61.Font.Header1.RelativeSize, 
                        Color = v61.Theme.ContextualPrimaryDefault.Color, 
                        Transparency = v61.Theme.ContextualPrimaryDefault.Transparency, 
                        isDisabled = l_loginInProgress_0, 
                        isLoading = l_loginInProgress_0, 
                        onActivated = v59.onWeChatButtonActivated
                    }), 
                    QQButton = v2.createElement(v26, {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = v62.logInTextQQ, 
                        TextSize = v61.Font.BaseSize * v61.Font.Header1.RelativeSize, 
                        Color = v61.Theme.TextLink.Color, 
                        Transparency = v61.Theme.TextLink.Transparency, 
                        isDisabled = l_loginInProgress_0, 
                        isLoading = l_loginInProgress_0, 
                        onActivated = v59.onQQButtonActivated
                    }), 
                    NetworkLicense = v2.createElement("TextLabel", {
                        LayoutOrder = 5, 
                        TextColor3 = v61.Theme.SystemPrimaryDefault.Color, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v62.networkLicense, 
                        TextTransparency = 0.5, 
                        TextSize = v61.Font.BaseSize * v61.Font.Footer.RelativeMinSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            });
        end);
    end);
end;
v36 = v3.connect(function(v64, _) --[[ Line: 277 ]]
    return {
        loginInProgress = v64.Luobu.MSDKAuth.loginInProgress, 
        MSDKLoginErrMessageKey = v64.Luobu.MSDKAuth.MSDKLoginErrMessageKey, 
        tokenAuthErrMessageKey = v64.Luobu.MSDKAuth.tokenAuthErrMessageKey
    };
end, function(v66) --[[ Line: 283 ]]
    -- upvalues: v27 (copy), v28 (copy), v29 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v18 (copy), v17 (copy), v21 (copy), v20 (copy), v19 (copy)
    return {
        requestMSDKLogin = function(v67, v68, v69, v70) --[[ Line: 285 ]] --[[ Name: requestMSDKLogin ]]
            -- upvalues: v66 (copy), v27 (ref)
            return v66(v27(v67, v68, v69, v70));
        end, 
        requestTokenAuthentication = function(v71, v72, v73, v74) --[[ Line: 288 ]] --[[ Name: requestTokenAuthentication ]]
            -- upvalues: v66 (copy), v28 (ref)
            return v66(v28(v71, v72, v73, v74));
        end, 
        launchLuobuApp = function(v75, v76, v77) --[[ Line: 291 ]] --[[ Name: launchLuobuApp ]]
            -- upvalues: v66 (copy), v29 (ref)
            return v66(v29(v75, v76, v77));
        end, 
        setMSDKLoginInProgress = function(v78) --[[ Line: 294 ]] --[[ Name: setMSDKLoginInProgress ]]
            -- upvalues: v66 (copy), v31 (ref)
            return v66(v31(v78));
        end, 
        resetMSDKLoginErrMessageKey = function() --[[ Line: 297 ]] --[[ Name: resetMSDKLoginErrMessageKey ]]
            -- upvalues: v66 (copy), v32 (ref)
            return v66(v32(""));
        end, 
        resetTokenAuthErrMessageKey = function() --[[ Line: 300 ]] --[[ Name: resetTokenAuthErrMessageKey ]]
            -- upvalues: v66 (copy), v33 (ref)
            return v66(v33(""));
        end, 
        setMSDKLoginOpenId = function(v79) --[[ Line: 303 ]] --[[ Name: setMSDKLoginOpenId ]]
            -- upvalues: v66 (copy), v34 (ref)
            return v66(v34(v79));
        end, 
        setSignUpInfo = function(v80, v81, v82, v83) --[[ Line: 306 ]] --[[ Name: setSignUpInfo ]]
            -- upvalues: v66 (copy), v35 (ref)
            return v66(v35(v80, v81, v82, v83));
        end, 
        resetSignUpInfo = function() --[[ Line: 309 ]] --[[ Name: resetSignUpInfo ]]
            -- upvalues: v66 (copy), v35 (ref)
            return v66(v35("", "", "", ""));
        end, 
        navigateToSignUpPage = function() --[[ Line: 312 ]] --[[ Name: navigateToSignUpPage ]]
            -- upvalues: v66 (copy), v18 (ref), v17 (ref)
            return v66(v18({
                name = v17.LuobuSignUpPage
            }));
        end, 
        showUserAgreementsPrompt = function(v84) --[[ Line: 315 ]] --[[ Name: showUserAgreementsPrompt ]]
            -- upvalues: v66 (copy), v21 (ref), v20 (ref)
            v66(v21(v20.UserAgreementsPrompt, {
                agreements = v84
            }));
        end, 
        navigateBack = function() --[[ Line: 320 ]] --[[ Name: navigateBack ]]
            -- upvalues: v66 (copy), v19 (ref)
            v66(v19());
        end, 
        showAlert = function(v85, v86, v87, v88) --[[ Line: 323 ]] --[[ Name: showAlert ]]
            -- upvalues: v66 (copy), v21 (ref), v20 (ref)
            v66(v21(v20.SimpleTextAlertPrompt, {
                titleKey = v85, 
                bodyTextKey = v86, 
                confirmButtonTextKey = v87, 
                confirmButtonCallback = v88
            }));
        end
    };
end)(v36);
v36 = l_RoactServices_0.connect({
    networking = v5, 
    analytics = v7, 
    authAnalytics = v8, 
    guiService = l_AppGuiService_0
})(v36);
return (l_RoactAppPolicy_0.connect(function(v89, _) --[[ Line: 341 ]]
    return {
        appPolicy = v89
    };
end)(v36));