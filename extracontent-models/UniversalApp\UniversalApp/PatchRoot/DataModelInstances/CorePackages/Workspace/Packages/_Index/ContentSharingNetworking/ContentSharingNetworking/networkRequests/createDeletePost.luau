local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.POST({
        Name = "DeletePost"
    }, function(v3, v4) --[[ Line: 15 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("posts-api"):path("v1"):path("content-posts"):path("delete"):id(v4.postId):body({});
    end);
end;