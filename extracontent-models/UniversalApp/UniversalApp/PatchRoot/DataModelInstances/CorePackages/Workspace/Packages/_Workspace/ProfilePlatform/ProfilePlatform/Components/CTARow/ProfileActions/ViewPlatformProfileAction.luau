local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagEnablePlatformProfileContextualMenuOption_0 = require(l_Parent_0.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption;
local v3 = require(l_script_FirstAncestor_0.Utils.getPlatformFriendsService);
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return {
    [v4.ProfileActions.ViewPlatformProfile] = l_FFlagEnablePlatformProfileContextualMenuOption_0 and function(v7) --[[ Line: 14 ]]
        -- upvalues: v4 (copy), v6 (copy), v3 (copy)
        return {
            text = v7.localized[v4.ProfileActions.ViewPlatformProfile], 
            onActivated = function() --[[ Line: 17 ]] --[[ Name: onActivated ]]
                -- upvalues: v7 (copy), v6 (ref), v3 (ref)
                v7.analytics.fireAnalyticsEvent(v6.ContextualMenuButtonViewPlatformProfile, {
                    buttonSurface = v7.buttonSurface
                });
                v3:ShowProfile(v7.profileWrapperContext.profilePlatformId);
            end
        };
    end or nil
};