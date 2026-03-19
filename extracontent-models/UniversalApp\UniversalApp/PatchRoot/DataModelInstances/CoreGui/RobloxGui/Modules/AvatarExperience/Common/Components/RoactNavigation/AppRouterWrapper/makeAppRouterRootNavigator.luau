local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterMainStackNavigator);
local function v9(v7) --[[ Line: 22 ]] --[[ Name: buildConfigTable ]]
    -- upvalues: v6 (copy), v2 (copy), l_AvatarScreen_0 (copy), v5 (copy)
    local v8 = v6(v7);
    return (v2.List.join({
        {
            [l_AvatarScreen_0.AvatarExperienceMainStackNavigator] = v8
        }
    }, v5));
end;
return function(v10) --[[ Line: 33 ]] --[[ Name: makeAppRouterRootNavigator ]]
    -- upvalues: v9 (copy), v3 (copy)
    local v11 = v9(v10);
    return (v3.createRobloxStackNavigator(v11, {
        mode = v3.StackPresentationStyle.Overlay, 
        defaultNavigationOptions = {
            absorbInput = false, 
            overlayEnabled = true, 
            overlayTransparency = 1
        }
    }));
end;