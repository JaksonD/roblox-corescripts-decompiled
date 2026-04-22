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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = require(l_Modules_0.LuaApp.Components.LoadingBar);
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v14 = require(l_Modules_0.Luobu.Thunks.LaunchLuobuApp);
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_AccountSwitcherConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants;
local v18 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v19 = require(l_Modules_0.LuaApp.FlagSettings);
local v20 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v21 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableLuaAccountSwitch_0 = v21.FFlagEnableLuaAccountSwitch;
local l_FFlagUseNavigationSelectors_0 = v21.FFlagUseNavigationSelectors;
local l_FFlagApplyLaunchContextForNewAccountSwitches_0 = v21.FFlagApplyLaunchContextForNewAccountSwitches;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v21.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local v26 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v27 = v3.PureComponent:extend("StartupPage");
v27.didMount = function(v28) --[[ Line: 43 ]] --[[ Name: didMount ]]
    -- upvalues: v18 (copy)
    local l_networking_0 = v28.props.networking;
    local l_analytics_0 = v28.props.analytics;
    local l_appPolicy_0 = v28.props.appPolicy;
    local l_loggingProtocol_0 = v28.props.loggingProtocol;
    local l_prefetchProtocol_0 = v28.props.prefetchProtocol;
    if v28.props.authStatus == v18.UNKNOWN then
        v28.props.launchApp(l_networking_0, v28.props.omniRecommendationsRequest, l_analytics_0, l_appPolicy_0, l_loggingProtocol_0, v28.props.appStartupSequence, l_prefetchProtocol_0);
    end;
    v28.props.loggingProtocol:logEventOnce("startup_page_did_mount");
end;
v27.render = function(_) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v12 (copy), v11 (copy)
    return v3.createElement("Frame", {
        [v3.Tag] = "app-screen.startup", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v12.Color.GRAY4, 
        ZIndex = 1
    }, {
        LoadingBar = v3.createElement(v11)
    });
end;
v27 = v4.connect(function(v35, _) --[[ Line: 75 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v37 = nil;
    if l_FFlagUseNavigationSelectors_0 then
        v37 = l_Selectors_0.selectCurrentPageName(v35);
    else
        local v38 = v35.Navigation.history[#v35.Navigation.history];
        v37 = v38[#v38].name;
    end;
    return {
        authStatus = v35.AuthenticationStatus.status, 
        currentPageName = v37
    };
end, function(v39) --[[ Line: 88 ]]
    -- upvalues: v19 (copy), v14 (copy), v26 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), v20 (copy), l_AccountSwitcherConstants_0 (copy), v13 (copy)
    return {
        launchApp = function(v40, v41, v42, v43, v44, v45, v46) --[[ Line: 90 ]] --[[ Name: launchApp ]]
            -- upvalues: v19 (ref), v39 (copy), v14 (ref), v26 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), v20 (ref), l_AccountSwitcherConstants_0 (ref), v13 (ref)
            if v19.LuaAuthEnabledForLuobu() and v43.useLuobuAuthentication() then
                v39(v14(v40, v42, v43, v26.Startup));
                return;
            else
                local l_Startup_0 = v26.Startup;
                if l_FFlagEnableLuaAccountSwitch_0 and (l_FFlagApplyLaunchContextForNewAccountSwitches_0 or l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0) then
                    local v48 = v20.getAccountSwitchStatus();
                    if v48 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus then
                        l_Startup_0 = v26.Login;
                    elseif v48 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromSignupStatus then
                        l_Startup_0 = v26.SignUp;
                    end;
                end;
                v39(v13(v40, v41, v42, v43, l_Startup_0, v44, v45, v46));
                return;
            end;
        end
    };
end)(v27);
v27 = l_RoactServices_0.connect({
    networking = v6, 
    analytics = v7, 
    loggingProtocol = l_AppLogging_0, 
    appStartupSequence = l_AppStartupSequenceTag_0, 
    prefetchProtocol = l_AppPrefetch_0
})(v27);
v27 = l_RoactAppPolicy_0.connect(function(v49, _) --[[ Line: 143 ]]
    return {
        appPolicy = v49
    };
end)(v27);
l_default_0:logEventOnce("start_up_page_require_end");
return v27;