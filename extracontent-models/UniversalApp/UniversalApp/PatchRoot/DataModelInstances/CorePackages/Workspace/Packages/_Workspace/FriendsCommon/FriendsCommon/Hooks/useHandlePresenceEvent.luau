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
return function() --[[ Line: 28 ]] --[[ Name: useHandlePresenceEvent ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useApolloClient_0 (copy), l_useQuery_0 (copy), l_queries_0 (copy), l_userIdExists_0 (copy), v3 (copy), l_FFlagHandleSortScoreUpdatesFromRtn_0 (copy), v2 (copy), v11 (copy), v10 (copy), l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 (copy)
    local v14 = l_useLocalUserId_0();
    local v15 = l_useApolloClient_0();
    local v16 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = not l_userIdExists_0(v14), 
        notifyOnNetworkStatusChange = true, 
        variables = {
            userId = v14, 
            sort = v3.Enums.Sort.FriendshipScore
        }
    });
    local v20 = if l_FFlagHandleSortScoreUpdatesFromRtn_0 then v2.useCallback(function(v17, v18) --[[ Line: 43 ]]
        -- upvalues: v11 (ref), v14 (copy), v15 (copy), v16 (copy)
        v11({
            localUserId = v14, 
            apolloClient = v15, 
            onlineFriendsRef = v16, 
            updatedPresences = v17, 
            updatedSortScores = v18
        });
    end, {
        v14, 
        v15, 
        v16
    }) else v2.useCallback(function(v19) --[[ Line: 52 ]]
        -- upvalues: v10 (ref), v14 (copy), v15 (copy), v16 (copy)
        v10({
            localUserId = v14, 
            apolloClient = v15, 
            onlineFriendsRef = v16, 
            updatedPresences = v19
        });
    end, {
        v14, 
        v15, 
        v16
    });
    if l_FFlagCeaseUAPresenceRealtimeNotificationUpdatesInGame_0 or l_FFlagHandleSortScoreUpdatesFromRtn_0 then
        local v21 = v2.useCallback(function() --[[ Line: 62 ]]
            -- upvalues: v16 (copy)
            return v16.refetch();
        end, {
            v16
        });
        return {
            handleNewEvent = v20, 
            refetchOnlineFriends = v21
        };
    else
        return v20;
    end;
end;