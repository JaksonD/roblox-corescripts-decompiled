local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_createNavigator_0 = v2.createNavigator;
local l_SwitchRouter_0 = v2.SwitchRouter;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.PreloadingSwitchView);
return function(v6, v7) --[[ Line: 38 ]]
    -- upvalues: l_SwitchRouter_0 (copy), l_createNavigator_0 (copy), v5 (copy)
    local v8 = l_SwitchRouter_0(v6, v7);
    return l_createNavigator_0(v5, v8, v7 or {});
end;