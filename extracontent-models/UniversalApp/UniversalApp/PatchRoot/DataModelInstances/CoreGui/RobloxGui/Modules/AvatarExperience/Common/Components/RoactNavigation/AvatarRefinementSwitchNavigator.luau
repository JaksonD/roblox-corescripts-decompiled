local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v4.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v4.TenFootUiRNTypes.GlobalNavDisplayOption;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AccessoryAdjustmentStackNavigator);
local v10 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Components.AvatarRefinement);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.LayeredClothingSortStackNavigator);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.LayeredMakeupSortStackNavigator);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.HeadRefinementStackNavigator);
local v15 = require(l_Modules_0.AvatarExperience.AvatarRefinement.ColorAdjustmentPage.ColorAdjustmentPageContainer);
local v16 = require(l_Modules_0.AvatarExperience.AvatarRefinement.BodyShapePage);
local v17 = require(script.Parent.createAvatarSwitchNavigator);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v21 = {
    {
        [l_AvatarScreen_0.AvatarRefinement] = v10
    }, 
    {
        [l_AvatarScreen_0.AccessoryAdjustmentStackNavigator] = v9
    }, 
    {
        [l_AvatarScreen_0.LayeredClothingSortStackNavigator] = v12
    }, 
    {
        [l_AvatarScreen_0.HeadRefinementStackNavigator] = v14
    }, 
    {
        [l_AvatarScreen_0.ColorAdjustment] = {
            screen = function() --[[ Line: 62 ]] --[[ Name: screen ]]
                -- upvalues: v3 (copy), v15 (copy)
                return v3.createElement(v15);
            end
        }
    }
};
if v18() then
    table.insert(v21, {
        [l_AvatarScreen_0.BodyShape] = {
            screen = v16
        }
    });
end;
if l_FFlagAXCustomizeMakeupSupport_0 then
    table.insert(v21, {
        [l_AvatarScreen_0.LayeredMakeupSortStackNavigator] = v13
    });
end;
local v22 = {
    backBehavior = v2.BackBehavior.History, 
    defaultNavigationOptions = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false, 
        renderUnderlyingPage = false, 
        isTransparent = true, 
        screenKind = l_ScreenKind_0.FullScreen, 
        globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
    }, 
    mode = v2.StackPresentationStyle.Default
};
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v17(v21, v22);
else
    return v2.createRobloxSwitchNavigator(v21, v22);
end;