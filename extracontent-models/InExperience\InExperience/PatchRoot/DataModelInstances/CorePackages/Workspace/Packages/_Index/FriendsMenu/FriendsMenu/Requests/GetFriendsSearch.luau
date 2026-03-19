local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3, v4, v5, v6) --[[ Line: 6 ]]
    -- upvalues: l_Url_0 (copy)
    local v7 = l_Url_0:makeQueryString({
        query = v4, 
        cursor = v6, 
        limit = v5
    });
    return v2(string.format("%s/users/%s/friends/search?%s", l_Url_0.FRIEND_URL, v3, v7), "GET");
end;