local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.Hooks.convertPrimaryActionToFriendStatus);
local v3 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixAnalyticsPrimaryAction);
return function() --[[ Line: 11 ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v2 (copy)
    local v5 = nil;
    if v4 then
        local l_buttons_0 = v3(v1.Components.Actions).buttons;
        v5 = if l_buttons_0 and l_buttons_0[1] then l_buttons_0[1].type else nil;
    else
        v5 = v3(v1.Components.Actions).primary or {};
    end;
    return v2(v5);
end;