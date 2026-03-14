local l_Parent_0 = script:FindFirstAncestor("FriendsCommon").Parent;
local v1 = require(l_Parent_0.ApolloFriends);
return function(v2) --[[ Line: 13 ]] --[[ Name: handleFriendshipEvent ]]
    -- upvalues: v1 (copy)
    if v2.friendshipUpdate.removedUserId then
        v1.Cache.removeFriendFromCache(v2.apolloClient, {
            targetUserId = v2.localUserId, 
            userId = v2.friendshipUpdate.removedUserId
        });
        return;
    else
        if v2.friendshipUpdate.addedUserId then
            v2.onlineFriendsRef:refetch();
            v1.Cache.addFriendToFriendsByUserIdCache(v2.apolloClient, {
                targetUserId = v2.localUserId, 
                userId = v2.friendshipUpdate.addedUserId, 
                hasVerifiedBadge = nil
            });
        end;
        return;
    end;
end;