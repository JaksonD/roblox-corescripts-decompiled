local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v4 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
refreshProfilePlatform = function(v5) --[[ Line: 15 ]] --[[ Name: refreshProfilePlatform ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v7 = v2.List.map(v5.components, function(v6) --[[ Line: 16 ]]
        return {
            component = v6
        };
    end);
    return v4.API({
        profileType = v5.profileType, 
        profileId = v5.profileId, 
        components = v7, 
        includeComponentOrdering = false
    });
end;
return refreshProfilePlatform;