local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.networkingShareLinkTypes);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return (v3.roduxNetworking.POST({
        Name = "resolve"
    }, function(v4, v5) --[[ Line: 11 ]]
        -- upvalues: v1 (ref)
        return v4(v1):path("deeplinks"):path("v2"):path("resolve"):body({
            linkId = v5.linkId
        });
    end));
end;