local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local v3 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v3.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v3.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v8 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortPage);
local v9 = require(script.Parent.createAvatarExperienceStackNavigator);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v11 = {
    {
        [l_AvatarScreen_0.LayeredClothingSort] = {
            screen = v8
        }
    }
};
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v9(v11, {
        defaultNavigationOptions = {
            overlayEnabled = true, 
            overlayTransparency = 1, 
            absorbInput = false, 
            screenKind = l_ScreenKind_0.FullScreen, 
            globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
        }, 
        mode = v2.StackPresentationStyle.Default
    });
else
    return v2.createRobloxStackNavigator(v11, {
        defaultNavigationOptions = {
            overlayEnabled = true, 
            overlayTransparency = 1, 
            absorbInput = false, 
            screenKind = l_ScreenKind_0.FullScreen, 
            globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
        }, 
        mode = v2.StackPresentationStyle.Default
    });
end;