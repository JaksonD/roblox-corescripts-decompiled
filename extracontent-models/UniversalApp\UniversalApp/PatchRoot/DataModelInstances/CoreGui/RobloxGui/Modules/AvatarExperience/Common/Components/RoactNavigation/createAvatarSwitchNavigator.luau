local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_createNavigator_0 = v2.createNavigator;
local l_SwitchRouter_0 = v2.SwitchRouter;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.PreloadingSwitchView);
local l_FFlagAXUsePreloadingSwitchView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUsePreloadingSwitchView;
return function(v9, v10) --[[ Line: 13 ]] --[[ Name: createAvatarSwitchNavigator ]]
    -- upvalues: l_SwitchRouter_0 (copy), l_createNavigator_0 (copy), l_FFlagAXUsePreloadingSwitchView_0 (copy), v7 (copy), v6 (copy)
    local v11 = l_SwitchRouter_0(v9, v10);
    return l_createNavigator_0(if l_FFlagAXUsePreloadingSwitchView_0 then v7 else v6.AppSwitchView, v11, v10);
end;