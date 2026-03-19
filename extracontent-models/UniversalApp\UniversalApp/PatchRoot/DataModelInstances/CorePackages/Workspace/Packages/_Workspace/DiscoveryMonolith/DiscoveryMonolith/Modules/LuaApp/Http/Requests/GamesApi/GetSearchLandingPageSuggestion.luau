local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagLuaAppNewSlpEndpoint_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNewSlpEndpoint;
return function(v3, v4) --[[ Line: 22 ]]
    -- upvalues: l_Url_0 (copy), l_FFlagLuaAppNewSlpEndpoint_0 (copy)
    local l_APIS_URL_0 = l_Url_0.APIS_URL;
    local v6 = l_Url_0:makeQueryString(v4);
    return v3(string.format(l_FFlagLuaAppNewSlpEndpoint_0 and "%ssearch-landing-page-api/v1?%s" or "%ssearch-api/search-landing-page?%s", l_APIS_URL_0, v6), "GET");
end;