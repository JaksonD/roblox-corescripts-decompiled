local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v4 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.Components.LayeredMakeupSortPage);
local v5 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.Hooks.useLayeredMakeupSortPageViewModel);
local function v8(v6) --[[ Line: 13 ]] --[[ Name: LayeredMakeupSortScreen ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (ref)
    local v7 = v5(v6);
    return v2.createElement(v4, v7);
end;
v4 = v3(v4);
return v8;