local l_Parent_0 = script:FindFirstAncestor("FriendsNetworking").Parent;
local v1 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
local l_FFlagAddFriendsSessionId_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSessionId;
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), l_FFlagAddFriendsSessionId_0 (copy)
    return v4.roduxNetworking.GET({
        Name = "GetFriendRequests"
    }, function(v5, v6) --[[ Line: 14 ]]
        -- upvalues: v1 (ref), l_FFlagAddFriendsSessionId_0 (ref)
        return v5(v1, {
            currentUserId = v6.currentUserId
        }):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
            fetchMutualFriends = v6.fetchMutualFriends, 
            sortOrder = v6.sortOrder, 
            limit = v6.limit, 
            cursor = v6.cursor, 
            sessionId = if l_FFlagAddFriendsSessionId_0 then v6.sessionId else nil
        });
    end);
end;