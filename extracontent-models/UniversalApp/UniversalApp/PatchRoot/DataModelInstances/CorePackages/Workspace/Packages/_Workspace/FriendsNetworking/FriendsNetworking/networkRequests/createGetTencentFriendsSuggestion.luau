local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetTencentFriendsSuggestion"
    }, function(v3, v4) --[[ Line: 9 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("v1"):path("tecent-friends-suggestion"):queryArgs({
            userOpenId = v4.userOpenId, 
            userAccessToken = v4.userAccessToken, 
            type = v4.type, 
            appType = v4.appType
        });
    end);
end;