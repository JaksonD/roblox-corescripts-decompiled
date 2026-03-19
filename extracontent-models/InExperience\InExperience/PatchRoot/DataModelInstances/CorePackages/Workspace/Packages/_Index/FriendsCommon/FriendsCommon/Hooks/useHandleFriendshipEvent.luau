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
local v10 = require(l_script_FirstAncestor_0.EventHandlers.handleFriendshipEvent);
return function() --[[ Line: 22 ]] --[[ Name: useHandleFriendshipEvent ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useApolloClient_0 (copy), l_useQuery_0 (copy), l_queries_0 (copy), l_userIdExists_0 (copy), v3 (copy), v2 (copy), v10 (copy)
    local v11 = l_useLocalUserId_0();
    local v12 = l_useApolloClient_0();
    local v13 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        skip = not l_userIdExists_0(v11), 
        notifyOnNetworkStatusChange = true, 
        variables = {
            userId = v11, 
            sort = v3.Enums.Sort.FriendshipScore
        }
    });
    return (v2.useCallback(function(v14) --[[ Line: 36 ]]
        -- upvalues: v10 (ref), v11 (copy), v13 (copy), v12 (copy)
        v10({
            localUserId = v11, 
            onlineFriendsRef = v13, 
            apolloClient = v12, 
            friendshipUpdate = v14
        });
    end, {
        v13
    }));
end;