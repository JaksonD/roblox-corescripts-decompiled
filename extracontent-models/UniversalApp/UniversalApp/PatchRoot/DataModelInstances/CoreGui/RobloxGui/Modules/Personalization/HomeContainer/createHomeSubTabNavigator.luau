local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v9 = {
    {
        [l_AppPage_0.Home] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 21 ]]
                -- upvalues: l_default_0 (copy), l_Modules_0 (copy)
                l_default_0:logEventOnce("lazily_require_home_page");
                return require(l_Modules_0.Personalization.Home.HomePage);
            end)
        }
    }, 
    {
        [l_AppPage_0.Games] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 29 ]]
                -- upvalues: l_Modules_0 (copy)
                return require(l_Modules_0.Personalization.Games.GamesPage);
            end)
        }
    }
};
local v10 = {
    initialRouteName = l_AppPage_0.Home
};
return function() --[[ Line: 40 ]] --[[ Name: createHomeSubTabNavigator ]]
    -- upvalues: v2 (copy), v9 (copy), v10 (copy), v4 (copy)
    local v11 = v2.SwitchRouter(v9, v10);
    return v2.createNavigator(v4.AppSwitchView, v11, v10);
end;