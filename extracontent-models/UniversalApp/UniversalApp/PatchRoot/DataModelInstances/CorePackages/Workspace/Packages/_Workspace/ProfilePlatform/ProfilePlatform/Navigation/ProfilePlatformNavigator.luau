local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_Parent_0.EditProfile);
local v4 = require(l_Parent_0.SetAlias);
local v5 = require(l_script_FirstAncestor_0.Components.ProfileContextualMenu);
local l_EditProfilePage_0 = v3.EditProfilePage;
local l_EditProfileLanding_0 = v3.EditProfileLanding;
local l_EditDisplayNameModal_0 = v3.EditDisplayNameModal;
local l_EditDisplayNameErrorModal_0 = v3.EditDisplayNameErrorModal;
local l_UsernameInsufficientFundsModal_0 = v3.UsernameInsufficientFundsModal;
local l_EditDescriptionModal_0 = v3.EditDescriptionModal;
local l_Enums_0 = v3.Enums;
local v13 = require(l_script_FirstAncestor_0.Components.ProfilePlatformViewAdaptor);
local v14 = require(l_script_FirstAncestor_0.Components.Videos.VideoFullscreenPage);
local l_SetAliasModal_0 = v4.SetAliasModal;
local l_EditProfileScreenViewAdapter_0 = v3.EditProfileScreenViewAdapter;
local l_EditProfileToastScreen_0 = v3.EditProfileToastScreen;
local v18 = require(l_script_FirstAncestor_0.Components.EditProfileBackgroundContainer);
local v19 = require(l_script_FirstAncestor_0.Components.CommunityVerificationModal);
local v20 = require(l_Parent_0.RoactNavigation);
local l_FFlagAddVideoToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddVideoToCommunityProfile;
local l_FFlagEditProfileBackgroundEnabled_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileBackgroundEnabled;
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityVerificationModal);
local l_FFlagEditProfileMigration_0 = v3.Flags.FFlagEditProfileMigration;
local v25 = {
    overlayEnabled = true, 
    overlayTransparency = 0.5, 
    absorbInput = true
};
local v26 = {
    {
        [v2.Screens.ProfileMain] = v13
    }, 
    {
        [v2.Screens.EditProfilePage] = {
            screen = if l_FFlagEditProfileMigration_0 then l_EditProfileLanding_0 else l_EditProfilePage_0, 
            navigationOptions = v25
        }
    }, 
    {
        [v2.Screens.EditDisplayNameModal] = {
            screen = l_EditDisplayNameModal_0, 
            navigationOptions = v25
        }
    }, 
    {
        [v2.Screens.EditDescriptionModal] = {
            screen = l_EditDescriptionModal_0, 
            navigationOptions = v25
        }
    }, 
    {
        [v2.Screens.EditDisplayNameErrorModal] = {
            screen = l_EditDisplayNameErrorModal_0, 
            navigationOptions = v25
        }
    }, 
    {
        [v2.Screens.UsernameInsufficientFundsModal] = {
            screen = l_UsernameInsufficientFundsModal_0, 
            navigationOptions = v25
        }
    }, 
    {
        [v2.Screens.SetAliasModal] = {
            screen = l_SetAliasModal_0, 
            navigationOptions = v25
        }
    }, 
    {
        [v2.Screens.ContextualMenu] = {
            screen = v5, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 1, 
                absorbInput = false
            }
        }
    }
};
if l_FFlagAddVideoToCommunityProfile_0 then
    table.insert(v26, {
        [v2.Screens.VideoFullscreen] = {
            screen = v14, 
            navigationOptions = v25
        }
    });
end;
if v23 then
    table.insert(v26, {
        [v2.Screens.CommunityVerificationModal] = {
            screen = v19, 
            navigationOptions = v25
        }
    });
end;
if l_FFlagEditProfileBackgroundEnabled_0 then
    table.insert(v26, {
        [v2.Screens.EditProfileBackground] = {
            screen = v18, 
            navigationOptions = {
                overlayEnabled = false, 
                absorbInput = true, 
                renderUnderlyingPage = true
            }
        }
    });
end;
if l_FFlagEditProfileMigration_0 then
    table.insert(v26, {
        [l_Enums_0.Screens.EditProfileSubScreen] = {
            screen = l_EditProfileScreenViewAdapter_0, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 0.5, 
                absorbInput = false
            }
        }
    });
    table.insert(v26, {
        [l_Enums_0.Screens.EditProfileToast] = {
            screen = l_EditProfileToastScreen_0, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 1, 
                absorbInput = false
            }
        }
    });
end;
return (v20.createRobloxStackNavigator(v26, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        overlayTransparency = 1, 
        disableBackButton = true
    }, 
    mode = v20.StackPresentationStyle.Overlay
}));