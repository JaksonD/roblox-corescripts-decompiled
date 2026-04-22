local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_Parent_0.SocialStopwatch);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local v6 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserInfo);
local v7 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v9 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_FFlagMoveInExperienceModeToEditProfile_0 = v3.FFlagMoveInExperienceModeToEditProfile;
return {
    [v7.ProfileActions.EditProfile] = function(v11) --[[ Line: 18 ]]
        -- upvalues: l_ButtonVariant_0 (copy), v7 (copy), v4 (copy), v9 (copy), v6 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy)
        return {
            variant = l_ButtonVariant_0.Standard, 
            text = v11.localized[v7.ProfileActions.EditProfile], 
            onActivated = function() --[[ Line: 22 ]] --[[ Name: onActivated ]]
                -- upvalues: v4 (ref), v11 (copy), v9 (ref), v7 (ref), v6 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref)
                v4.Stopwatch.start(v4.Events.EditProfileOpened);
                v11.analytics.fireAnalyticsEvent(v9.CTAButtonOpenEditProfilePage, {
                    buttonSurface = v11.buttonSurface
                });
                v11.navigation.navigate(v7.Screens.EditProfilePage, {
                    profileScreens = v7.Screens, 
                    navigateToEditUsername = function(v12) --[[ Line: 29 ]] --[[ Name: navigateToEditUsername ]]
                        -- upvalues: v11 (ref), v6 (ref)
                        v11.navigateTo.editUsername({
                            showToast = v12, 
                            onUsernameChanged = function() --[[ Line: 32 ]] --[[ Name: onUsernameChanged ]]
                                -- upvalues: v11 (ref), v6 (ref)
                                v11.dispatch(v6(v11.profileId));
                            end
                        });
                    end, 
                    onIdentityChange = function() --[[ Line: 37 ]] --[[ Name: onIdentityChange ]]
                        -- upvalues: v11 (ref), v6 (ref)
                        v11.dispatch(v6(v11.profileId));
                    end, 
                    onToggleInExperienceMode = l_FFlagMoveInExperienceModeToEditProfile_0 and function() --[[ Line: 41 ]]
                        -- upvalues: v11 (ref), v6 (ref), v9 (ref)
                        v11.dispatch(v6(v11.profileId));
                        v11.analytics.fireAnalyticsEvent(v9.ToggleInExperienceModeButton, {});
                    end or nil
                });
            end
        };
    end
};