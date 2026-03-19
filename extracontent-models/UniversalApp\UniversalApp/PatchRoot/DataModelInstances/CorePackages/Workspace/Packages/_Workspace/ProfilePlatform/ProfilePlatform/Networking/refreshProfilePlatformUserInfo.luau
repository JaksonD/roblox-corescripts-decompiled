local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Types.Component);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local v4 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
GetProfilePlatform = function(v5) --[[ Line: 11 ]] --[[ Name: GetProfilePlatform ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy)
    local v6 = {
        {
            component = v1.Components.UserProfileHeader
        }, 
        {
            component = v1.Components.About
        }
    };
    if v3 then
        table.insert(v6, {
            component = v1.Components.ProfileBackground
        });
    end;
    return v4.API({
        profileId = v5, 
        profileType = v1.ProfileTypes.User, 
        components = v6, 
        includeComponentOrdering = false
    });
end;
return GetProfilePlatform;