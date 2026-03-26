local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Types.Component);
local v3 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
GetProfilePlatform = function(v4) --[[ Line: 10 ]] --[[ Name: GetProfilePlatform ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v5 = {
        {
            component = v1.Components.UserProfileHeader
        }, 
        {
            component = v1.Components.About
        }
    };
    table.insert(v5, {
        component = v1.Components.ProfileBackground
    });
    return v3.API({
        profileId = v4, 
        profileType = v1.ProfileTypes.User, 
        components = v5, 
        includeComponentOrdering = false
    });
end;
return GetProfilePlatform;