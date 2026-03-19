local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.RoactNavigation);
local v8 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local v9 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v10 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v11 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v12 = require(l_Modules_0.LuaApp.Http.Url);
local v13 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v14 = tonumber(settings():GetFVariable("CaptchaTimeout"));
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationCaptcha);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper);
local v17 = v5.PureComponent:extend("CaptchaPageBrowserServiceWrapper");
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
v17.defaultProps = {
    webViewVisible = true, 
    backNavigationDisabledWhileLoading = false
};
v17.init = function(v19) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), l_UserInputService_0 (copy)
    v19.state = {
        webViewVisible = v19.props.webViewVisible
    };
    v19.captchaSuccess = false;
    v19.captchaData = nil;
    v19.timerCancelled = false;
    if v19.props.backNavigationDisabledWhileLoading then
        v19.props.setBackNavigationDisabled(true);
    end;
    if v14 > 0 then
        spawn(function() --[[ Line: 45 ]]
            -- upvalues: v14 (ref), v19 (copy)
            local v20 = 0;
            while true do
                if v20 < v14 then
                    wait(1);
                    v20 = v20 + 1;
                    if v19.timerCancelled then
                        return;
                    end;
                else
                    if v19.props.backNavigationDisabledWhileLoading then
                        v19.props.setBackNavigationDisabled(false);
                    end;
                    if v19.props.analytics ~= nil and v19.props.analytics.Diag ~= nil then
                        v19.props.analytics.Diag:reportCounter("CaptchaPageBrowserServiceWrapper_Timeout", 1);
                    end;
                    v19.props.navigation.goBack();
                    return;
                end;
            end;
        end);
    end;
    v19.getPlatformString = function() --[[ Line: 67 ]]
        -- upvalues: l_UserInputService_0 (ref)
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v22 = "unknown";
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
            return "android";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            return "ios";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
            return "uwp";
        else
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
                v22 = "xbox";
            end;
            return v22;
        end;
    end;
    v19.getCaptchaDxBlob = function(v23, v24) --[[ Line: 84 ]]
        if v24 == nil or v24.dxBlob == nil then
            if v24.analytics ~= nil then
                local v25 = {
                    captchaType = v23
                };
                v24.analytics.EventStream:setRBXEventStream("captcha", "captchaDxBlobNotSet", v25);
            end;
            return "";
        else
            return v24.dxBlob;
        end;
    end;
    v19.getCaptchaId = function(v26) --[[ Line: 97 ]]
        if v26 == nil or v26.captchaId == nil then
            return "";
        else
            return v26.captchaId;
        end;
    end;
end;
v17.willUnmount = function(v27) --[[ Line: 105 ]] --[[ Name: willUnmount ]]
    -- upvalues: v11 (copy)
    v27.timerCancelled = true;
    local l_captchaCallback_0 = v27.props.captchaCallback;
    if not v27.captchaSuccess then
        v27.props.setCurrentToastMessage(v11.NetworkingError, "Authentication.Login.Response.SomethingWentWrong");
    end;
    if l_captchaCallback_0 then
        l_captchaCallback_0(v27.captchaSuccess, v27.captchaData);
    end;
end;
v17.render = function(v29) --[[ Line: 118 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v5 (copy), v8 (copy), v15 (copy), v16 (copy), l_HttpService_0 (copy), v13 (copy)
    local l_isVisible_0 = v29.props.isVisible;
    local l_DisplayOrder_0 = v29.props.DisplayOrder;
    local l_captchaType_0 = v29.props.captchaType;
    local l_cvalueType_0 = v29.props.cvalueType;
    local l_cvalue_0 = v29.props.cvalue;
    local l_backNavigationDisabledWhileLoading_0 = v29.props.backNavigationDisabledWhileLoading;
    local v36 = nil;
    if l_captchaType_0 == "login" then
        local v37 = v29.getCaptchaDxBlob(l_captchaType_0, v29.props);
        v36 = string.format("%scaptcha/app/login?hybrid-return-token=1&credentialsType=%s&credentialsValue=%s&data-exchange-blob=%s", v12.WWW_URL, l_cvalueType_0, l_cvalue_0, v37);
        local v38 = v29.getCaptchaId(v29.props);
        v36 = string.format("%scaptcha/app/login?hybrid-return-token=1&credentialsType=%s&credentialsValue=%s&data-exchange-blob=%s&hybrid-return-captcha-id=%s", v12.WWW_URL, l_cvalueType_0, l_cvalue_0, v37, v38);
    else
        local v39 = v29.getCaptchaDxBlob(l_captchaType_0, v29.props);
        v36 = string.format("%scaptcha/app/signup?hybrid-return-token=1&data-exchange-blob=%s", v12.WWW_URL, v39);
        local v40 = v29.getCaptchaId(v29.props);
        v36 = string.format("%scaptcha/app/signup?hybrid-return-token=1&data-exchange-blob=%s&hybrid-return-captcha-id=%s", v12.WWW_URL, v39, v40);
    end;
    return v5.createElement(v8, {
        backNavigationHandledByParent = v15(), 
        isVisible = l_isVisible_0 and v29.state.webViewVisible, 
        modal = true, 
        webViewVisible = v29.state.webViewVisible, 
        displayOrder = l_DisplayOrder_0, 
        url = v36, 
        windowClosedCallback = function() --[[ Line: 164 ]] --[[ Name: windowClosedCallback ]]
            -- upvalues: l_backNavigationDisabledWhileLoading_0 (copy), v29 (copy), v16 (ref)
            if l_backNavigationDisabledWhileLoading_0 then
                v29.props.setBackNavigationDisabled(false);
            end;
            v29.timerCancelled = true;
            if not v16() then
                v29.props.navigation.goBack();
            end;
        end, 
        javaScriptCallback = function(v41) --[[ Line: 173 ]] --[[ Name: javaScriptCallback ]]
            -- upvalues: l_backNavigationDisabledWhileLoading_0 (copy), v29 (copy), l_HttpService_0 (ref), v13 (ref)
            if l_backNavigationDisabledWhileLoading_0 then
                v29.props.setBackNavigationDisabled(false);
            end;
            local v42 = l_HttpService_0:JSONDecode(v41);
            if v42.moduleID == v13.Module.Navigation and v42.functionName == v13.Function.navigateToFeature and v42.params and v42.params.params then
                v29.timerCancelled = true;
                if v29.props.analytics ~= nil and v29.props.analytics.Diag ~= nil then
                    v29.props.analytics.Diag:reportCounter("CaptchaPageBrowserServiceWrapper_NotTimeout", 1);
                end;
                if v42.params.params.feature == v13.Feature.CaptchaSuccess then
                    v29.captchaSuccess = true;
                    v29.captchaData = v42.params.params.captchaData;
                    v29.props.navigation.goBack();
                    return;
                elseif v42.params.params.feature == v13.Feature.CaptchaShown then
                    v29:setState({
                        webViewVisible = true
                    });
                end;
            end;
        end
    });
end;
v17 = v7.withNavigation(v17);
v17 = l_RoactServices_0.connect({
    analytics = v18
})(v17);
return v6.connect(nil, function(v43) --[[ Line: 216 ]]
    -- upvalues: v9 (copy), v10 (copy)
    return {
        setCurrentToastMessage = function(v44, v45) --[[ Line: 218 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v43 (copy), v9 (ref)
            return v43(v9({
                toastType = v44, 
                toastMessage = v45
            }));
        end, 
        setBackNavigationDisabled = function(v46) --[[ Line: 224 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v43 (copy), v10 (ref)
            return v43(v10(v46));
        end
    };
end)(v17);