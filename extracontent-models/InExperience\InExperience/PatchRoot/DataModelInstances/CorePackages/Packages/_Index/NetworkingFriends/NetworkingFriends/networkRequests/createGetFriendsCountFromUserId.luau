local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 9 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetFriendsCountFromUserId"
    }, function(v3, v4) --[[ Line: 14 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("v1"):path("users"):id(v4):path("friends"):path("count");
    end);
end;