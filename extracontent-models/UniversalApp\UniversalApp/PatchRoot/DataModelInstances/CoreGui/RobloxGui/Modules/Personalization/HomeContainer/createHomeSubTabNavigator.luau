local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v9 = game:DefineFastFlag("AppIaHomeSubTabLazy", false);
local v10 = {
    {
        [l_AppPage_0.Home] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 23 ]]
                -- upvalues: l_default_0 (copy), l_Modules_0 (copy)
                l_default_0:logEventOnce("lazily_require_home_page");
                return require(l_Modules_0.Personalization.Home.HomePage);
            end)
        }
    }, 
    {
        [l_AppPage_0.Games] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 31 ]]
                -- upvalues: l_Modules_0 (copy)
                return require(l_Modules_0.Personalization.Games.GamesPage);
            end)
        }
    }
};
local v11 = {
    initialRouteName = l_AppPage_0.Home
};
return function() --[[ Line: 42 ]] --[[ Name: createHomeSubTabNavigator ]]
    -- upvalues: v9 (copy), v4 (copy), v10 (copy), v11 (copy), v2 (copy)
    local v12 = if v9 then v4.createLazySwitchRouter(v10, v11) else v2.SwitchRouter(v10, v11);
    return v2.createNavigator(v4.AppSwitchView, v12, v11);
end;