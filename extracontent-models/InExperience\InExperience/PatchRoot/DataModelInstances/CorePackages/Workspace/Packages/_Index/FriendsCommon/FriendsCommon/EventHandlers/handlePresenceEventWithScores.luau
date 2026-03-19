local l_Parent_0 = script:FindFirstAncestor("FriendsCommon").Parent;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local v2 = require(l_Parent_0.ApolloFriends);
local v3 = require(l_Parent_0.ApolloPresence);
local _ = require(l_Parent_0.GraphQLServer);
local function v6(v5) --[[ Line: 33 ]] --[[ Name: rtnPresenceToGraphQLPresence ]]
    -- upvalues: v3 (copy)
    return {
        id = tostring(v5.userId), 
        userPresenceType = v3.Formatters.formatNumberToPresenceType(v5.userPresenceType), 
        lastLocation = v5.lastLocation, 
        lastOnline = v5.lastOnline or "", 
        gameId = v5.gameId or "", 
        placeId = v5.placeId and tostring(v5.placeId) or "", 
        rootPlaceId = v5.rootPlaceId and tostring(v5.rootPlaceId) or "", 
        universeId = v5.universeId and tostring(v5.universeId) or "", 
        __typename = "UserPresence"
    };
end;
local function v11(v7) --[[ Line: 47 ]] --[[ Name: toUserIdToFriendMap ]]
    local v8 = {};
    for _, v10 in v7 do
        v8[v10.id] = table.clone(v10);
    end;
    return v8;
end;
local _ = function(v12) --[[ Line: 56 ]] --[[ Name: userIdFriendMapToList ]]
    local v13 = {};
    for _, v15 in v12 do
        table.insert(v13, v15);
    end;
    return v13;
end;
return function(v17) --[[ Line: 65 ]] --[[ Name: handlePresenceEventWithScores ]]
    -- upvalues: v2 (copy), l_queries_0 (copy), v11 (copy), v6 (copy)
    local v18 = {
        userId = v17.localUserId, 
        sort = v2.Enums.Sort.FriendshipScore
    };
    local v19 = v17.apolloClient:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v18
    });
    local v20 = if v19 and v19.onlineFriendsByUserId then v11(v19.onlineFriendsByUserId) else {};
    for _, v22 in pairs(v17.updatedPresences) do
        local v23 = tostring(v22.userId);
        local v24 = v17.updatedSortScores[v23];
        if v22.userPresenceType == 0 then
            v20[v23] = nil;
        elseif v20[v23] ~= nil then
            local v25 = v20[v23];
            v25.presence = v6(v22);
            v25.sortScore = v24;
        else
            v20[v23] = {
                __typename = "Friend", 
                id = tostring(v22.userId), 
                targetUserId = v17.localUserId, 
                presence = v6(v22), 
                sortScore = v24
            };
        end;
    end;
    local v26 = {};
    for _, v28 in v20 do
        table.insert(v26, v28);
    end;
    v17.apolloClient:writeQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v18, 
        data = {
            onlineFriendsByUserId = v26
        }
    });
end;