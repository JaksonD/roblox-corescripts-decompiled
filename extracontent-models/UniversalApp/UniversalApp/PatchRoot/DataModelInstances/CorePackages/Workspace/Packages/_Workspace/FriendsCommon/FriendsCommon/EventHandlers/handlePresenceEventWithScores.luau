local l_Parent_0 = script:FindFirstAncestor("FriendsCommon").Parent;
local l_FFlagHandleMessageIdFromRtn_0 = require(l_Parent_0.SharedFlags).FFlagHandleMessageIdFromRtn;
local l_FFlagFriendsSortFeatureLoggingEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsSortFeatureLoggingEnabled;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local v4 = require(l_Parent_0.ApolloFriends);
local v5 = require(l_Parent_0.ApolloPresence);
local _ = require(l_Parent_0.GraphQLServer);
local v7 = require(l_Parent_0.SocialLuaAnalytics);
local v8 = require(l_Parent_0.LoggingProtocol);
local function v10(v9) --[[ Line: 40 ]] --[[ Name: rtnPresenceToGraphQLPresence ]]
    -- upvalues: v5 (copy)
    return {
        id = tostring(v9.userId), 
        userPresenceType = v5.Formatters.formatNumberToPresenceType(v9.userPresenceType), 
        lastLocation = v9.lastLocation, 
        lastOnline = v9.lastOnline or "", 
        gameId = v9.gameId or "", 
        placeId = v9.placeId and tostring(v9.placeId) or "", 
        rootPlaceId = v9.rootPlaceId and tostring(v9.rootPlaceId) or "", 
        universeId = v9.universeId and tostring(v9.universeId) or "", 
        __typename = "UserPresence"
    };
end;
local function v15(v11) --[[ Line: 54 ]] --[[ Name: toUserIdToFriendMap ]]
    local v12 = {};
    for _, v14 in v11 do
        v12[v14.id] = table.clone(v14);
    end;
    return v12;
end;
local _ = function(v16) --[[ Line: 63 ]] --[[ Name: userIdFriendMapToList ]]
    local v17 = {};
    for _, v19 in v16 do
        table.insert(v17, v19);
    end;
    return v17;
end;
local v21 = if l_FFlagHandleMessageIdFromRtn_0 then v7.Telemetry.createEmitter({
    telemetryImpl = v8.default, 
    defaultTelemetryConfig = {
        throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000), 
        links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4"
    }, 
    getSharedInfo = function() --[[ Line: 86 ]] --[[ Name: getSharedInfo ]]
        return {};
    end
}) else nil;
local v24 = if l_FFlagHandleMessageIdFromRtn_0 then v7.Telemetry.new({
    name = "FriendsSortFeRtnMessage", 
    description = "User received an rtn message v2", 
    lastUpdated = {
        2026, 
        3, 
        18
    }, 
    backendsList = {
        {
            type = "EventIngest", 
            format = function(v22, _) --[[ Line: 100 ]] --[[ Name: format ]]
                return v22;
            end
        }
    }
}) else nil;
return function(v25) --[[ Line: 108 ]] --[[ Name: handlePresenceEventWithScores ]]
    -- upvalues: v4 (copy), l_queries_0 (copy), v15 (copy), l_FFlagHandleMessageIdFromRtn_0 (copy), l_FFlagFriendsSortFeatureLoggingEnabled_0 (copy), v10 (copy), v21 (copy), v24 (copy)
    local v26 = {
        userId = v25.localUserId, 
        sort = v4.Enums.Sort.FriendshipScore
    };
    local v27 = v25.apolloClient:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v26
    });
    local v28 = if v27 and v27.onlineFriendsByUserId then v15(v27.onlineFriendsByUserId) else {};
    local v29 = if l_FFlagHandleMessageIdFromRtn_0 then {} else nil;
    for _, v31 in pairs(v25.updatedPresences) do
        local v32 = tostring(v31.userId);
        local v33 = v25.updatedSortScores[v32];
        if l_FFlagFriendsSortFeatureLoggingEnabled_0 then
            table.insert(v29, v32);
        end;
        if v31.userPresenceType == 0 then
            v28[v32] = nil;
        elseif v28[v32] ~= nil then
            local v34 = v28[v32];
            v34.presence = v10(v31);
            v34.sortScore = v33;
        else
            v28[v32] = {
                __typename = "Friend", 
                id = tostring(v31.userId), 
                targetUserId = v25.localUserId, 
                presence = v10(v31), 
                sortScore = v33
            };
        end;
    end;
    local v35 = {};
    for _, v37 in v28 do
        table.insert(v35, v37);
    end;
    v25.apolloClient:writeQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v26, 
        data = {
            onlineFriendsByUserId = v35
        }
    });
    if l_FFlagHandleMessageIdFromRtn_0 and l_FFlagFriendsSortFeatureLoggingEnabled_0 and v25.rtnMessageId ~= nil then
        v35 = {
            messageId = v25.rtnMessageId, 
            userId = tonumber(v25.localUserId), 
            friendIds = table.concat(v29, ","), 
            sortType = "Carousel"
        };
        v21.emit(v24, v35);
    end;
end;