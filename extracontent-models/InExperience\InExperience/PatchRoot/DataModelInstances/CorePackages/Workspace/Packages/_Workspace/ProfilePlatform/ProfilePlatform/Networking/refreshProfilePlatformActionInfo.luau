local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local _ = require(l_script_FirstAncestor_0.Types.Component);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformAddCurrentlyPlaying);
GetProfilePlatform = function(v5) --[[ Line: 12 ]] --[[ Name: GetProfilePlatform ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy)
    local v6 = {
        {
            component = v1.Components.UserProfileHeader
        }, 
        {
            component = v1.Components.Actions
        }
    };
    if v4 then
        table.insert(v6, {
            component = v1.Components.CurrentlyPlaying
        });
    end;
    return v2.API({
        profileId = v5, 
        profileType = v1.ProfileTypes.User, 
        components = v6, 
        includeComponentOrdering = false
    });
end;
return GetProfilePlatform;