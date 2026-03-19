local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegacyFriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_UpdateFriendPresenceCounts_0 = require(l_script_FirstAncestor_0.Actions).UpdateFriendPresenceCounts;
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: l_UpdateFriendPresenceCounts_0 (copy), v2 (copy)
    v4 = v4 or {};
    if v5.type == l_UpdateFriendPresenceCounts_0.name then
        v4 = v2.Dictionary.join({}, v5.presenceCounts);
    end;
    return v4;
end;