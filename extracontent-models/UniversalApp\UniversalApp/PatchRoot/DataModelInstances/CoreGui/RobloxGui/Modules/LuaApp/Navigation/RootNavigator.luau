local l_CorePackages_0 = game:GetService("CorePackages");
local l_createRootNavigator_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore).createRootNavigator;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Navigation.getAppRoutes);
local v4 = require(l_Modules_0.LuaApp.Navigation.getSwitchRoutesArray);
return require(l_Modules_0.LuaApp.Navigation.wrapWithSwitchVisibility)(l_createRootNavigator_0(v3(), v4()));