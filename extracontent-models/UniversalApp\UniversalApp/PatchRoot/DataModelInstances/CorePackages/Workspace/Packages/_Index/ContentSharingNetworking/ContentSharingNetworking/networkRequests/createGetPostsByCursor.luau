local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 14 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetPostsByCursor"
    }, function(v3, v4) --[[ Line: 17 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("posts-api"):path("v1"):path("content-posts"):path("findByUser"):queryArgs({
            cursor = v4.cursor, 
            sortOrder = v4.sortOrder, 
            userId = v4.userId
        });
    end);
end;