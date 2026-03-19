local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegacyFriendsRodux");
local l_SetFriendCount_0 = require(l_script_FirstAncestor_0.Actions).SetFriendCount;
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: l_SetFriendCount_0 (copy)
    v2 = v2 or 0;
    if v3.type == l_SetFriendCount_0.name then
        v2 = v3.count;
    end;
    return v2;
end;