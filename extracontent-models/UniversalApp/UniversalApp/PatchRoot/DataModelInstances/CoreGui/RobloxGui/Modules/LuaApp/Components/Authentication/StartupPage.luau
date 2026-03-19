local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
l_default_0:logEventOnce("start_up_page_require_begin");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.LuaApp.Components.LoadingBar);
local v11 = require(l_Modules_0.LuaApp.Constants);
local v12 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v13 = require(l_Modules_0.Luobu.Thunks.LaunchLuobuApp);
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_AccountSwitcherConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants;
local v17 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v18 = require(l_Modules_0.LuaApp.FlagSettings);
local v19 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v20 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableLuaAccountSwitch_0 = v20.FFlagEnableLuaAccountSwitch;
local l_FFlagApplyLaunchContextForNewAccountSwitches_0 = v20.FFlagApplyLaunchContextForNewAccountSwitches;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v20.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local v24 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v25 = v3.PureComponent:extend("StartupPage");
v25.didMount = function(v26) --[[ Line: 41 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy)
    local l_networking_0 = v26.props.networking;
    local l_analytics_0 = v26.props.analytics;
    local l_appPolicy_0 = v26.props.appPolicy;
    local l_loggingProtocol_0 = v26.props.loggingProtocol;
    local l_prefetchProtocol_0 = v26.props.prefetchProtocol;
    if v26.props.authStatus == v17.UNKNOWN then
        v26.props.launchApp(l_networking_0, v26.props.omniRecommendationsRequest, l_analytics_0, l_appPolicy_0, l_loggingProtocol_0, v26.props.appStartupSequence, l_prefetchProtocol_0);
    end;
    v26.props.loggingProtocol:logEventOnce("startup_page_did_mount");
end;
v25.render = function(_) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v11 (copy), v10 (copy)
    return v3.createElement("Frame", {
        [v3.Tag] = "app-screen.startup", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v11.Color.GRAY4, 
        ZIndex = 1
    }, {
        LoadingBar = v3.createElement(v10)
    });
end;
v25 = v4.connect(function(v33, _) --[[ Line: 73 ]]
    local v35 = v33.Navigation.history[#v33.Navigation.history];
    return {
        authStatus = v33.AuthenticationStatus.status, 
        currentPageName = v35[#v35].name
    };
end, function(v36) --[[ Line: 80 ]]
    -- upvalues: v18 (copy), v13 (copy), v24 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), v19 (copy), l_AccountSwitcherConstants_0 (copy), v12 (copy)
    return {
        launchApp = function(v37, v38, v39, v40, v41, v42, v43) --[[ Line: 82 ]] --[[ Name: launchApp ]]
            -- upvalues: v18 (ref), v36 (copy), v13 (ref), v24 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), v19 (ref), l_AccountSwitcherConstants_0 (ref), v12 (ref)
            if v18.LuaAuthEnabledForLuobu() and v40.useLuobuAuthentication() then
                v36(v13(v37, v39, v40, v24.Startup));
                return;
            else
                local l_Startup_0 = v24.Startup;
                if l_FFlagEnableLuaAccountSwitch_0 and (l_FFlagApplyLaunchContextForNewAccountSwitches_0 or l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0) then
                    local v45 = v19.getAccountSwitchStatus();
                    if v45 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus then
                        l_Startup_0 = v24.Login;
                    elseif v45 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromSignupStatus then
                        l_Startup_0 = v24.SignUp;
                    end;
                end;
                v36(v12(v37, v38, v39, v40, l_Startup_0, v41, v42, v43));
                return;
            end;
        end
    };
end)(v25);
v25 = l_RoactServices_0.connect({
    networking = v6, 
    analytics = v7, 
    loggingProtocol = l_AppLogging_0, 
    appStartupSequence = l_AppStartupSequenceTag_0, 
    prefetchProtocol = l_AppPrefetch_0
})(v25);
v25 = l_RoactAppPolicy_0.connect(function(v46, _) --[[ Line: 135 ]]
    return {
        appPolicy = v46
    };
end)(v25);
l_default_0:logEventOnce("start_up_page_require_end");
return v25;