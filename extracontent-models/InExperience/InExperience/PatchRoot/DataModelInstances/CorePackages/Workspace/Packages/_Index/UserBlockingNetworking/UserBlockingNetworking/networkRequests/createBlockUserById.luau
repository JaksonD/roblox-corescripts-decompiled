local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.POST({
        Name = "BlockUserById"
    }, function(v3, v4) --[[ Line: 16 ]]
        -- upvalues: v1 (ref)
        return v3(v1, {
            currentUserId = v4.currentUserId
        }):path("user-blocking-api"):path("v1"):path("users"):id(v4.userId):path("block-user"):body({});
    end);
end;