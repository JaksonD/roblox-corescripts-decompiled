local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types.Component);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local l_FFlagAddSocialLinksToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddSocialLinksToCommunityProfile;
local l_FFlagAddVideoToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddVideoToCommunityProfile;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhoto);
local l_FFlagAddCommunityLockedToCommunityProfile_0 = require(l_Parent_0.SharedFlags).FFlagAddCommunityLockedToCommunityProfile;
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAddEventsToCommunityProfile);
return function() --[[ Line: 13 ]]
    -- upvalues: v3 (copy), l_FFlagAddSocialLinksToCommunityProfile_0 (copy), l_FFlagAddVideoToCommunityProfile_0 (copy), v6 (copy), l_FFlagAddCommunityLockedToCommunityProfile_0 (copy), v8 (copy)
    local v9 = {
        {
            component = v3.Components.CommunityProfileHeader
        }, 
        {
            component = v3.Components.About
        }, 
        {
            component = v3.Components.Actions
        }, 
        {
            component = v3.Components.Experiences
        }, 
        {
            component = v3.Components.Store
        }, 
        {
            component = v3.Components.ViewFullProfile
        }
    };
    if l_FFlagAddSocialLinksToCommunityProfile_0 then
        table.insert(v9, {
            component = v3.Components.SocialLinks
        });
    end;
    if l_FFlagAddVideoToCommunityProfile_0 then
        table.insert(v9, {
            component = v3.Components.Videos
        });
    end;
    if v6 then
        table.insert(v9, {
            component = v3.Components.CoverPhoto
        });
    end;
    if l_FFlagAddCommunityLockedToCommunityProfile_0 then
        table.insert(v9, {
            component = v3.Components.CommunityLocked
        });
    end;
    if v8 then
        table.insert(v9, {
            component = v3.Components.Events
        });
    end;
    return v9;
end;