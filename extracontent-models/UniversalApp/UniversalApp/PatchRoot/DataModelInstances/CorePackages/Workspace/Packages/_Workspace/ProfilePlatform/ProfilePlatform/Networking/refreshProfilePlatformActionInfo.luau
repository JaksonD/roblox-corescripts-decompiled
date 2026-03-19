local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local _ = require(l_script_FirstAncestor_0.Types.Component);
GetProfilePlatform = function(v4) --[[ Line: 10 ]] --[[ Name: GetProfilePlatform ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.API({
        profileId = v4, 
        profileType = v1.ProfileTypes.User, 
        components = {
            {
                component = v1.Components.UserProfileHeader
            }, 
            {
                component = v1.Components.Actions
            }
        }, 
        includeComponentOrdering = false
    });
end;
return GetProfilePlatform;