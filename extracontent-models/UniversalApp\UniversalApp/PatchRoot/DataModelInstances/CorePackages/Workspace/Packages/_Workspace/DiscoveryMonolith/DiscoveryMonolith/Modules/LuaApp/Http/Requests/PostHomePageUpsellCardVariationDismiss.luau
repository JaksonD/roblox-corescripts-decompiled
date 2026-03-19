local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3, v4) --[[ Line: 13 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy)
    assert(v3, "requestImpl is required");
    assert(v4, "upsellCardType is required");
    local v5 = l_HttpService_0:JSONEncode({
        cardType = v4
    });
    return v3(string.format("%supsellcard/dismiss", l_Url_0.APIS_URL), "POST", {
        postBody = v5
    });
end;