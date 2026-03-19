local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_GetFStringTopSongsSortExploreApiPageType_0 = require(l_Parent_0.SharedFlags).GetFStringTopSongsSortExploreApiPageType;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local v5 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "/explore-api/v1/get-sorts"
});
return function(v6, v7, v8, v9) --[[ Line: 28 ]]
    -- upvalues: l_FFlagEnableTopSongsSort_0 (copy), l_GetFStringTopSongsSortExploreApiPageType_0 (copy), l_UrlBuilder_0 (copy), v5 (copy)
    local v10 = {
        sessionId = v9, 
        sortsPageToken = v7
    };
    for v11, v12 in v8 do
        if v10[v11] then
            warn((("URL parameter %* already exists"):format(v11)));
        else
            v10[v11] = v12;
        end;
    end;
    if l_FFlagEnableTopSongsSort_0 then
        v10.pageType = l_GetFStringTopSongsSortExploreApiPageType_0();
    end;
    return v6(l_UrlBuilder_0.addQueryString(v5(), v10), "GET");
end;