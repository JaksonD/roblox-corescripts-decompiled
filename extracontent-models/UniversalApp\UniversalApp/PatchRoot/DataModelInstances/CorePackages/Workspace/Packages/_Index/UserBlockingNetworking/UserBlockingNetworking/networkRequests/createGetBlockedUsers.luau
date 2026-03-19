local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 14 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetBlockedUsers"
    }, function(v3, v4) --[[ Line: 17 ]]
        -- upvalues: v1 (ref)
        return v3(v1, {
            currentUserId = v4 and v4.currentUserId or nil
        }):path("user-blocking-api"):path("v1"):path("users"):path("get-blocked-users"):queryArgs({
            cursor = v4 and v4.cursor or nil, 
            count = v4 and v4.count or nil
        });
    end);
end;