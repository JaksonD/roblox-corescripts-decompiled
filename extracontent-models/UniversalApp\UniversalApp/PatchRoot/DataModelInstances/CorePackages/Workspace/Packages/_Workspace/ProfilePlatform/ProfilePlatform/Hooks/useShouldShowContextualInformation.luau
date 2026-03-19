local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformAddCurrentlyPlaying);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local l_contextualInformation_0 = (v2(v1.Components.UserProfileHeader) or {}).contextualInformation;
    local v6 = l_contextualInformation_0 and l_contextualInformation_0.context;
    local v7 = nil;
    if v3 then
        v7 = v2(v1.Components.CurrentlyPlaying);
    end;
    if not v6 or v6 == "None" then
        return false;
    elseif v6 == v1.ContextualTypes.Presence and (v4 == v1.PresenceTypes.Online or v4 == v1.PresenceTypes.Offline) then
        return false;
    elseif v3 and v7.universeId ~= nil then
        return false;
    else
        return true;
    end;
end;