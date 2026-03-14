local v0 = require(script.Parent.Parent.FRIENDS_URL);
local _ = require(script.Parent.Parent.networkingFriendsTypes);
return function(v2) --[[ Line: 11 ]]
    -- upvalues: v0 (copy)
    return v2.roduxNetworking.GET({
        Name = "SearchFriendsByQuery"
    }, function(v3, v4, v5) --[[ Line: 16 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("v1"):path("users"):id(v4):path("friends"):path("search"):queryArgs({
            query = if v5 then v5.query else nil, 
            userSort = if v5 then v5.userSort else nil, 
            cursor = if v5 then v5.cursor else nil, 
            limit = if v5 then v5.limit else nil
        });
    end);
end;