local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_AddSystemInfoToArgs_0 = require(l_Parent_0.DiscoveryUtils).AddSystemInfoToArgs;
return function(v4, v5) --[[ Line: 55 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy), l_AddSystemInfoToArgs_0 (copy)
    if v5 and v5.searchQuery then
        v5.searchQuery = l_HttpService_0:UrlEncode(v5.searchQuery);
    elseif v5 and v5.SearchQuery then
        v5.SearchQuery = l_HttpService_0:UrlEncode(v5.SearchQuery);
    end;
    local l_APIS_URL_0 = l_Url_0.APIS_URL;
    l_AddSystemInfoToArgs_0(v5);
    local v7 = l_Url_0:makeQueryString(v5);
    return v4(string.format("%ssearch-api/omni-search?%s", l_APIS_URL_0, v7), "GET");
end;