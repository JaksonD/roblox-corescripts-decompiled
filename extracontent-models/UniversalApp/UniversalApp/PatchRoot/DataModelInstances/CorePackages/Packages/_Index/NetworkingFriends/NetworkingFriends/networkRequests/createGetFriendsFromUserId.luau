local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 9 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetFriendsFromUserId"
    }, function(v3, v4, v5) --[[ Line: 12 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("v1"):path("users"):id(v4):path("friends"):queryArgs({
            userSort = v5 and v5.userSort or nil
        });
    end);
end;