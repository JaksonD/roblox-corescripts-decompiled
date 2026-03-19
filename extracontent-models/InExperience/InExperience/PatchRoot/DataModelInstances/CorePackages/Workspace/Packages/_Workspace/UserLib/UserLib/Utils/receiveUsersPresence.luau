local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.ReceivedUserPresence);
local l_UpdateFriendPresenceCounts_0 = require(l_Parent_0.LegacyFriendsRodux).Actions.UpdateFriendPresenceCounts;
local v4 = require(l_script_FirstAncestor_0.Enum.WebPresenceMap);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v4 (copy), l_UpdateFriendPresenceCounts_0 (copy)
    for _, v8 in pairs(v5) do
        local v9 = v6:getState().Users[tostring(v8.userId)];
        local v10 = v9 and v9.universeId or nil;
        local l_universeId_0 = v8.universeId;
        v6:dispatch(v2(tostring(v8.userId), v4[v8.userPresenceType], v8.lastLocation, v8.placeId and tostring(v8.placeId) or nil, v8.rootPlaceId and tostring(v8.rootPlaceId) or nil, v8.gameId and tostring(v8.gameId) or nil, v8.lastOnline and tostring(v8.lastOnline) or nil, l_universeId_0, v10));
    end;
    local v12 = {};
    for _, v14 in pairs(v6:getState().Users) do
        if v14.isFriend and v14.presence then
            local v15 = v12[v14.presence] or 0;
            v12[v14.presence] = v15 + 1;
        end;
    end;
    v6:dispatch(l_UpdateFriendPresenceCounts_0(v12));
end;