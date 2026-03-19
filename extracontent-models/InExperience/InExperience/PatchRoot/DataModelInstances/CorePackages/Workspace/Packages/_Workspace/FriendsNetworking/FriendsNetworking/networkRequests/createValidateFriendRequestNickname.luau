local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 8 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.POST({
        Name = "ValidateFriendRequestNickname"
    }, function(v3, v4) --[[ Line: 13 ]]
        -- upvalues: v0 (ref)
        return v3(v0, {
            currentUserId = v4.currentUserId
        }):path("v1"):path("my"):path("friends"):path("validate-nickname"):body({
            senderNickname = v4.senderNickname
        });
    end);
end;