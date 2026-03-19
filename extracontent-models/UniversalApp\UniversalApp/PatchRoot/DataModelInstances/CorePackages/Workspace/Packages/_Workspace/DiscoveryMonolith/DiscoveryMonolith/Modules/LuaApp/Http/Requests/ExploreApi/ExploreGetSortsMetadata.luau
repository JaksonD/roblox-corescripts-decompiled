local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "/explore-api/v1/get-sorts-metadata"
});
return function(v4, v5) --[[ Line: 26 ]]
    -- upvalues: l_UrlBuilder_0 (copy), v3 (copy)
    return v4(l_UrlBuilder_0.addQueryString(v3(), {
        sessionId = v5
    }), "GET");
end;