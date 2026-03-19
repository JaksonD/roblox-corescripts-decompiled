local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 19 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.POST({
        Name = "RequestFriendshipFromUserId"
    }, function(v3, v4) --[[ Line: 24 ]]
        -- upvalues: v0 (ref)
        return v3(v0, {
            currentUserId = v4.currentUserId
        }):path("v1"):path("users"):id(v4.targetUserId):path("request-friendship"):body({
            friendshipOriginSourceType = v4.friendshipOriginSourceType, 
            senderNickname = v4.senderNickname
        });
    end);
end;