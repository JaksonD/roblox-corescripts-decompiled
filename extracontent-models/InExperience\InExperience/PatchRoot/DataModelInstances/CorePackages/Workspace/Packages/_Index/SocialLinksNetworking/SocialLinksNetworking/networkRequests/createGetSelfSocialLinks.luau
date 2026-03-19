local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetSelfSocialLinks"
    }, function(v3, v4) --[[ Line: 16 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("v1"):path("promotion-channels"):queryArgs({
            alwaysReturnUrls = v4.alwaysReturnUrls, 
            filterLink = v4.filterLink
        });
    end);
end;