local v0 = require(script.Parent.Parent.Url);
return function(v1, v2, v3) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    local v4 = v0:makeQueryString({
        userSort = v3
    });
    return v1(string.format("%s/users/%s/friends?%s", v0.FRIEND_URL, v2, v4), "GET");
end;