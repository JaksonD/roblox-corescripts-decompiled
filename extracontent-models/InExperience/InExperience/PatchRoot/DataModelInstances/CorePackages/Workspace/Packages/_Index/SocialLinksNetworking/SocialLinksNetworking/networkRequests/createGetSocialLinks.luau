local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 14 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetSocialLinks"
    }, function(v3, v4) --[[ Line: 17 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("v1"):path("users"):id(v4.userId):path("promotion-channels"):queryArgs({
            alwaysReturnUrls = v4.alwaysReturnUrls, 
            filterLink = v4.filterLink
        });
    end);
end;