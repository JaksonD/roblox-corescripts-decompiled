local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.RoactNavigation);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceMainStackContainer);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarPromptDescriptors);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v10 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_RobloxStackView_0 = v3.RobloxStackView;
local l_createNavigator_0 = v3.createNavigator;
local l_ScreenKind_0 = v10.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v10.TenFootUiRNTypes.GlobalNavDisplayOption;
local v15 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.createAvatarExperienceRootNavigator);
local l_FFlagAXCustomGetStateForActionHandler_0 = v4.FFlagAXCustomGetStateForActionHandler;
local v22 = v5.List.join({
    {
        [l_AvatarScreen_0.AvatarExperienceMainStackNavigator] = {
            screen = v7, 
            navigationOptions = function(v19) --[[ Line: 36 ]] --[[ Name: navigationOptions ]]
                -- upvalues: v3 (copy)
                local l_navigation_0 = v19.navigation;
                local v21 = v3.getActiveChildNavigationOptions(l_navigation_0);
                return {
                    overlayTransparency = 1, 
                    absorbInput = false, 
                    backButtonAction = v21.backButtonAction
                };
            end
        }
    }
}, v8);
local v23 = {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = false, 
        screenKind = l_ScreenKind_0.FullScreen, 
        globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
    }, 
    transitionConfig = v9.instantTransitionConfig, 
    mode = v3.StackPresentationStyle.Overlay
};
if l_FFlagAXCustomGetStateForActionHandler_0 then
    local v24 = v17(v22, v23);
    return l_createNavigator_0(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v15.AppStackView else l_RobloxStackView_0, v24, v23);
else
    return v3.createRobloxStackNavigator(v22, v23);
end;