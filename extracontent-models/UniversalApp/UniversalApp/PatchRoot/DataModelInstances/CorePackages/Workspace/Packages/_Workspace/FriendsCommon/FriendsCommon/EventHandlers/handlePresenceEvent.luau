local l_Parent_0 = script:FindFirstAncestor("FriendsCommon").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local v3 = require(l_Parent_0.ApolloPresence);
local v4 = require(l_Parent_0.ApolloFriends);
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local _ = function(v6) --[[ Line: 32 ]] --[[ Name: getPresenceByUserIdDict ]]
    local v7 = {};
    for _, v9 in v6 do
        v7[v9.id] = v9.presence;
    end;
    return v7;
end;
local function v15(v11, v12) --[[ Line: 41 ]] --[[ Name: bulkUpdateUserPresences ]]
    -- upvalues: v3 (copy)
    for _, v14 in v12 do
        v3.Mutations.createUserPresenceCache(v11, {
            id = v14.userId, 
            userPresenceNumber = v14.userPresenceType, 
            lastLocation = v14.lastLocation, 
            lastOnline = v14.lastOnline, 
            gameId = v14.gameId, 
            placeId = v14.placeId, 
            rootPlaceId = v14.rootPlaceId, 
            universeId = v14.universeId
        });
    end;
end;
local function v27(v16, v17, v18) --[[ Line: 56 ]] --[[ Name: shouldRefetchOnlineFriends ]]
    -- upvalues: l_queries_0 (copy), v1 (copy), v3 (copy), l_PresenceType_0 (copy)
    local v19 = v16:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v17
    });
    local v20 = (if v19 then v19.onlineFriendsByUserId else {}) or {};
    local v21 = {};
    for _, v23 in v20 do
        v21[v23.id] = v23.presence;
    end;
    local l_v21_0 = v21;
    return #v1.List.filter(v18, function(v25) --[[ Line: 70 ]]
        -- upvalues: v3 (ref), l_PresenceType_0 (ref), l_v21_0 (copy)
        local v26 = false;
        if v3.Formatters.formatNumberToPresenceType(v25.userPresenceType) ~= l_PresenceType_0.Offline then
            v26 = not l_v21_0[tostring(v25.userId)];
        end;
        return v26;
    end) > 0;
end;
return function(v28) --[[ Line: 78 ]] --[[ Name: handlePresenceEvent ]]
    -- upvalues: v4 (copy), v15 (copy), v27 (copy)
    local v29 = {
        userId = v28.localUserId, 
        sort = v4.Enums.Sort.FriendshipScore
    };
    v15(v28.apolloClient, v28.updatedPresences);
    if v27(v28.apolloClient, v29, v28.updatedPresences) then
        v28.onlineFriendsRef:refetch();
    end;
end;