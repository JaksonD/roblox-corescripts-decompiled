local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.createAvatarExperienceStackNavigator);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.buildMainStackConfigTable);
return function(v5) --[[ Line: 20 ]] --[[ Name: makeAppRouterMainStackNavigator ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local v6 = v4(v5);
    return (v3(v6, {
        mode = v2.StackPresentationStyle.Overlay, 
        defaultNavigationOptions = {
            overlayEnabled = true, 
            overlayTransparency = 1, 
            absorbInput = false, 
            renderUnderlyingPage = true
        }
    }));
end;