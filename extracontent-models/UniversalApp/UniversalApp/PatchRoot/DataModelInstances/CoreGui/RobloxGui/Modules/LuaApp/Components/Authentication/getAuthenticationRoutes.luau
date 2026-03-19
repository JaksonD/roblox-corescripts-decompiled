local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v2 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v2.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v2.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return function() --[[ Line: 15 ]]
    -- upvalues: l_AppPage_0 (copy), l_createLazyComponent_0 (copy), l_CorePackages_0 (copy), l_ScreenKind_0 (copy), l_GlobalNavDisplayOption_0 (copy), l_default_0 (copy), l_Modules_0 (copy)
    return {
        {
            [l_AppPage_0.PlatformAccountRouter] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 19 ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.AppStartup).PlatformAccountRouter;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.EngagementScreenContainer] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 30 ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.EngagementScreen).EngagementScreenContainer;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.SingleSignOnError] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 41 ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SingleSignOn).SingleSignOnError;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.Startup] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 52 ]]
                    -- upvalues: l_default_0 (ref), l_Modules_0 (ref)
                    l_default_0:logEventOnce("lazily_require_startup_page");
                    return require(l_Modules_0.LuaApp.Components.Authentication.StartupPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.Landing] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 64 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Authentication.LandingPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.SinglePageSignUp] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 75 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Authentication.SinglePageSignUp);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.MultiPageSignup] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 86 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Authentication.MultiPageSignupMonoWrapper);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.SingleSignOnContainer] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 97 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Authentication.SingleSignOnContainer);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.Login] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 108 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Authentication.LoginView);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.CrossDeviceLogin] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 119 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceLoginPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }
    };
end;