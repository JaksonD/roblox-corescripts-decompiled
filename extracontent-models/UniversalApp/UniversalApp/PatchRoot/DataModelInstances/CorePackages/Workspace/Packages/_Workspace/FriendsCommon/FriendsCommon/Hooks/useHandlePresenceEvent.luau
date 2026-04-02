local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ApolloFriends);
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local l_userIdExists_0 = require(l_Parent_0.SocialCommon).Utils.userIdExists;
local v6 = require(l_Parent_0.ApolloClient);
local l_useQuery_0 = v6.useQuery;
local l_useApolloClient_0 = v6.useApolloClient;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v10 = require(l_script_FirstAncestor_0.EventHandlers.handlePresenceEvent);
local v11 = require(l_script_FirstAncestor_0.EventHandlers.handlePresenceEventWithScores);
local l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 = require(l_Parent_0.SharedFlags).FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame;
local l_FFlagHandleSortScoreUpdatesFromRtn_0 = require(l_Parent_0.SharedFlags).FFlagHandleSortScoreUpdatesFromRtn;
local l_FFlagHandleMessageIdFromRtn_0 = require(l_Parent_0.SharedFlags).FFlagHandleMessageIdFromRtn;
return function() --[[ Line: 29 ]] --[[ Name: useHandlePresenceEvent ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useApolloClient_0 (copy), l_useQuery_0 (copy), l_queries_0 (copy), l_userIdExists_0 (copy), v3 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy), v2 (copy), v11 (copy), l_FFlagHandleMessageIdFromRtn_0 (copy), v10 (copy), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy)
    local v15 = l_useLocalUserId_0();
    local v16 = l_useApolloClient_0();
    local v17 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = not l_userIdExists_0(v15), 
        notifyOnNetworkStatusChange = true, 
        variables = {
            userId = v15, 
            sort = v3.Enums.Sort.FriendshipScore
        }
    });
    local v22 = if l_FFlagHandleSortScoreUpdatesFromRtn_0 then v2.useCallback(function(v18, v19, v20) --[[ Line: 44 ]]
        -- upvalues: v11 (ref), v15 (copy), v16 (copy), v17 (copy), l_FFlagHandleMessageIdFromRtn_0 (ref)
        v11({
            localUserId = v15, 
            apolloClient = v16, 
            onlineFriendsRef = v17, 
            updatedPresences = v18, 
            updatedSortScores = v19, 
            rtnMessageId = if l_FFlagHandleMessageIdFromRtn_0 then v20 else nil
        });
    end, {
        v15, 
        v16, 
        v17
    }) else v2.useCallback(function(v21) --[[ Line: 54 ]]
        -- upvalues: v10 (ref), v15 (copy), v16 (copy), v17 (copy)
        v10({
            localUserId = v15, 
            apolloClient = v16, 
            onlineFriendsRef = v17, 
            updatedPresences = v21
        });
    end, {
        v15, 
        v16, 
        v17
    });
    if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 or l_FFlagHandleSortScoreUpdatesFromRtn_0 then
        local v23 = v2.useCallback(function() --[[ Line: 64 ]]
            -- upvalues: v17 (copy)
            return v17.refetch();
        end, {
            v17
        });
        return {
            handleNewEvent = v22, 
            refetchOnlineFriends = v23
        };
    else
        return v22;
    end;
end;