local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 17 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%supsellcard/type", l_Url_0.APIS_URL), "GET");
end;