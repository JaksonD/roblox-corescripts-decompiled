local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.APIS_URL, 
    path = "community-links/v1/universes/{universeId}/community"
});
return function(v3, v4) --[[ Line: 23 ]]
    -- upvalues: v2 (copy)
    return v3(v2({
        universeId = v4
    }), "GET");
end;