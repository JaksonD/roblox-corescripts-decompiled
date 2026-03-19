local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v4 = require(l_Parent_0.Cryo);
local v5 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "discovery-api/omni-recommendation-metadata"
});
return function(v6, v7) --[[ Line: 26 ]]
    -- upvalues: v4 (copy), v5 (copy), l_HttpService_0 (copy)
    local v9 = {
        contents = v4.List.map(v7, function(v8) --[[ Line: 28 ]]
            return {
                contentType = v8.contentType, 
                contentId = v8.contentId
            };
        end), 
        sessionId = "sessionId"
    };
    return v6(v5(), "POST", {
        postBody = l_HttpService_0:JSONEncode(v9)
    });
end;