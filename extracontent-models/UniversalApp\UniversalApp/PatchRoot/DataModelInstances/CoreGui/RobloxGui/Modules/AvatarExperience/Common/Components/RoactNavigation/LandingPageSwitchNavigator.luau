local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorPage);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Components.CatalogPage);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorEmotesPage);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.BackButtonAction);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.LandingPage);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.createPreloadingSwitchNavigator);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v13 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v13.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v13.TenFootUiRNTypes.GlobalNavDisplayOption;
local v16 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Pages.SlotBasedEditorPage);
local v17 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v19 = require(l_Modules_0.AvatarExperience.Flags.AXAlternateLandingPageIXP);
local v20 = require(l_Modules_0.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSlotBasedEditorPrimaryEntryPoint);
local v23 = game:DefineFastFlag("AXFixVRForAlwaysDisabledEnabled", false);
local v24 = require(script.Parent.createAvatarSwitchNavigator);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local v27 = l_GuiService_0:IsTenFootInterface() and not l_FFlagEnableLeftNavOnConsole_0;
local l_AXPrefetchMarketplaceIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP;
local v29 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v17.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
local l_FFlagAXUnifiedMarketplaceResultsFetcher_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUnifiedMarketplaceResultsFetcher;
shouldEnableAlwaysRenderedScreensForUser = function() --[[ Line: 60 ]] --[[ Name: shouldEnableAlwaysRenderedScreensForUser ]]
    -- upvalues: v17 (copy), v20 (copy)
    return not v17.readTestVariable(v20.DisableAlwaysRenderedScreen);
end;
local v31 = {};
if v29 or l_FFlagAXUnifiedMarketplaceResultsFetcher_0 then
    local v32 = {
        [l_AvatarScreen_0.AvatarExperienceLandingPage] = {
            screen = v10, 
            navigationOptions = {
                alwaysRendered = if not v23 or l_isSpatial_0() then if v20.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not l_IsVRAppBuild_0() else shouldEnableAlwaysRenderedScreensForUser(), 
                tabBarVisible = true, 
                backButtonAction = v9.Unhandled, 
                screenKind = l_ScreenKind_0.Default, 
                globalNavDisplayOption = l_GlobalNavDisplayOption_0.ShowAll
            }
        }
    };
    local v33 = {
        [l_AvatarScreen_0.AvatarEditor] = {
            screen = if v22() then v16 else v6, 
            navigationOptions = {
                alwaysRendered = if not v23 or l_isSpatial_0() then if v20.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not l_IsVRAppBuild_0() else shouldEnableAlwaysRenderedScreensForUser()
            }
        }
    };
    local v34 = {
        [l_AvatarScreen_0.Catalog] = {
            screen = v7, 
            navigationOptions = {
                alwaysRendered = if not v23 or l_isSpatial_0() then if v20.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not l_IsVRAppBuild_0() else shouldEnableAlwaysRenderedScreensForUser()
            }
        }
    };
    local v35 = {
        [l_AvatarScreen_0.ProfilePictureEditorEmotes] = v8
    };
    if v27 then
        table.insert(v31, v32);
    end;
    table.insert(v31, v33);
    table.insert(v31, v34);
    table.insert(v31, v35);
else
    v31 = {
        {
            [l_AvatarScreen_0.AvatarExperienceLandingPage] = {
                screen = v10, 
                navigationOptions = {
                    alwaysRendered = if not v23 or l_isSpatial_0() then if v20.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not l_IsVRAppBuild_0() else shouldEnableAlwaysRenderedScreensForUser(), 
                    tabBarVisible = true, 
                    backButtonAction = v9.Unhandled, 
                    screenKind = l_ScreenKind_0.Default, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.ShowAll
                }
            }
        }, 
        {
            [l_AvatarScreen_0.AvatarEditor] = {
                screen = if v22() then v16 else v6, 
                navigationOptions = {
                    alwaysRendered = if not v23 or l_isSpatial_0() then if v20.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not l_IsVRAppBuild_0() else shouldEnableAlwaysRenderedScreensForUser()
                }
            }
        }, 
        {
            [l_AvatarScreen_0.Catalog] = {
                screen = v7, 
                navigationOptions = {
                    alwaysRendered = if not v23 or l_isSpatial_0() then if v20.isEnabled() then shouldEnableAlwaysRenderedScreensForUser() else not l_IsVRAppBuild_0() else shouldEnableAlwaysRenderedScreensForUser()
                }
            }
        }, 
        {
            [l_AvatarScreen_0.ProfilePictureEditorEmotes] = v8
        }
    };
end;
local function v41(v36) --[[ Line: 182 ]] --[[ Name: navigationOptions ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ScreenKind_0 (copy), l_GlobalNavDisplayOption_0 (copy), v21 (copy), v27 (copy), v19 (copy), v17 (copy), v9 (copy)
    local v37 = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false, 
        hasSelectionGroup = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
        screenKind = l_ScreenKind_0.FullScreen, 
        globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
    };
    local _ = nil;
    if if v21() then not v27 else v19 and v17.readTestVariable(v19.EnabledForUser) then
        local l_key_0 = v36.navigation.state.key;
        local l_NoOp_0 = v9.NoOp;
        v37.backButtonAction = if not (l_key_0 ~= "AvatarEditor") or l_key_0 == "Catalog" then l_NoOp_0 else nil;
    end;
    return v37;
end;
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v24(v31, {
        backBehavior = v4.BackBehavior.InitialRoute, 
        defaultNavigationOptions = v41, 
        keepVisitedScreensMounted = not l_IsVRAppBuild_0()
    });
else
    return v11(v31, {
        backBehavior = v4.BackBehavior.InitialRoute, 
        defaultNavigationOptions = v41, 
        keepVisitedScreensMounted = not l_IsVRAppBuild_0()
    });
end;