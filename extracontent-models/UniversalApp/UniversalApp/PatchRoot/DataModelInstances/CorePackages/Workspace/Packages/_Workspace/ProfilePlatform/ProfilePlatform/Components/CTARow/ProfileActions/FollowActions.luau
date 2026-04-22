local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ButtonVariant_0 = require(l_Parent_0.Foundation).Enums.ButtonVariant;
local v3 = require(l_script_FirstAncestor_0.Networking.GroupsNetworking);
local v4 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local v5 = require(l_script_FirstAncestor_0.Hooks.getAvailableCommunityComponents);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local function _(v10) --[[ Line: 18 ]] --[[ Name: areFollowActionsSupportedForProfileType ]]
    -- upvalues: v6 (copy)
    return v10 == v6.ProfileTypes.Community;
end;
return {
    [v6.ProfileActions.Follow] = v9 and function(v12) --[[ Line: 24 ]]
        -- upvalues: v6 (copy), l_ButtonVariant_0 (copy), v8 (copy), v3 (copy), v4 (copy), v5 (copy)
        if not (v12.profileType == v6.ProfileTypes.Community) then
            return nil;
        else
            return {
                variant = l_ButtonVariant_0.Standard, 
                text = v12.localized[v6.ProfileActions.Follow], 
                onActivated = function() --[[ Line: 31 ]] --[[ Name: onActivated ]]
                    -- upvalues: v12 (copy), v8 (ref), v3 (ref), v4 (ref), v5 (ref)
                    v12.analytics.fireAnalyticsEvent(v8.CTAButtonFollow, {
                        buttonSurface = v12.buttonSurface
                    });
                    return v12.dispatch(v3.JoinGroup.API({
                        groupId = v12.profileId
                    })):andThen(function() --[[ Line: 39 ]]
                        -- upvalues: v12 (ref), v4 (ref), v5 (ref)
                        v12.dispatch(v4.API({
                            profileType = v12.profileType, 
                            profileId = v12.profileId, 
                            components = v5(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            };
        end;
    end or nil, 
    [v6.ProfileActions.Unfollow] = v9 and function(v13) --[[ Line: 53 ]]
        -- upvalues: v6 (copy), v8 (copy), v3 (copy), v4 (copy), v5 (copy)
        if not (v13.profileType == v6.ProfileTypes.Community) then
            return nil;
        else
            return {
                text = v13.localized[v6.ProfileActions.Unfollow], 
                onActivated = function() --[[ Line: 59 ]] --[[ Name: onActivated ]]
                    -- upvalues: v13 (copy), v8 (ref), v3 (ref), v4 (ref), v5 (ref)
                    v13.analytics.fireAnalyticsEvent(v8.ContextualMenuButtonUnfollow, {
                        buttonSurface = v13.buttonSurface
                    });
                    return v13.dispatch(v3.LeaveGroup.API({
                        groupId = v13.profileId, 
                        userId = v13.localUserId
                    })):andThen(function() --[[ Line: 69 ]]
                        -- upvalues: v13 (ref), v4 (ref), v5 (ref)
                        v13.dispatch(v4.API({
                            profileType = v13.profileType, 
                            profileId = v13.profileId, 
                            components = v5(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            };
        end;
    end or nil
};