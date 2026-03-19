local l_Parent_0 = script:FindFirstAncestor("NavigationRodux").Parent;
local l_FFlagAppIaHomeSubTab_0 = require(l_Parent_0.SharedFlags).FFlagAppIaHomeSubTab;
return {
    TempRnSwitchNavigatorName = "RootSwitchNavigator", 
    HomeContainerName = l_FFlagAppIaHomeSubTab_0 and "HomeContainer" or nil
};