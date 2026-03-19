local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Action);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v3 = nil;
    v3 = if type(v2) == "string" then v2 else v2.Name;
    return {
        Succeeded = v1(v3 .. "_Succeeded", function(v4, v5, v6, v7, v8) --[[ Line: 14 ]]
            return {
                ids = v4, 
                responseBody = v5, 
                namedIds = v6, 
                postBody = v7 and v7.postBody or nil, 
                queryArgs = v7 and v7.queryArgs, 
                additionalData = v8
            };
        end), 
        Failed = v1(v3 .. "_Failed", function(v9, v10, v11, v12, v13) --[[ Line: 24 ]]
            return {
                ids = v9, 
                error = v10, 
                namedIds = v11, 
                postBody = v12 and v12.postBody or nil, 
                queryArgs = v12 and v12.queryArgs or nil, 
                additionalData = v13
            };
        end)
    };
end;