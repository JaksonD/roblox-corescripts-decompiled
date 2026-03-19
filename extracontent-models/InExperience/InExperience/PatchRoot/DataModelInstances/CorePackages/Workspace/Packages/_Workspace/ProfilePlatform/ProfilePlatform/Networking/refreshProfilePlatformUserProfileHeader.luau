local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
GetProfilePlatform = function(v3) --[[ Line: 7 ]] --[[ Name: GetProfilePlatform ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.API({
        profileId = v3, 
        profileType = v1.ProfileTypes.User, 
        components = {
            {
                component = v1.Components.UserProfileHeader
            }
        }, 
        includeComponentOrdering = false
    });
end;
return GetProfilePlatform;