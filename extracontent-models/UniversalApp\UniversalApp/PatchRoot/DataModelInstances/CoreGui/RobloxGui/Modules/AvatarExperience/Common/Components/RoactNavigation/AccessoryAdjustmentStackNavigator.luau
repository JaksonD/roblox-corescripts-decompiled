local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local v3 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v3.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v3.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentPage);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustAccessoryView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(script.Parent.createAvatarExperienceStackNavigator);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v13 = {
    {
        [l_AvatarScreen_0.AccessoryAdjustment] = {
            screen = v7
        }
    }, 
    {
        [l_AvatarScreen_0.AdjustAccessoryView] = {
            screen = v9
        }
    }
};
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v11(v13, {
        defaultNavigationOptions = {
            overlayEnabled = true, 
            overlayTransparency = 1, 
            absorbInput = false, 
            screenKind = l_ScreenKind_0.FullScreen, 
            globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
        }, 
        mode = v2.StackPresentationStyle.Default, 
        transitionConfig = v10.instantTransitionConfig
    });
else
    return v2.createRobloxStackNavigator(v13, {
        defaultNavigationOptions = {
            overlayEnabled = true, 
            overlayTransparency = 1, 
            absorbInput = false, 
            screenKind = l_ScreenKind_0.FullScreen, 
            globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
        }, 
        mode = v2.StackPresentationStyle.Default, 
        transitionConfig = v10.instantTransitionConfig
    });
end;