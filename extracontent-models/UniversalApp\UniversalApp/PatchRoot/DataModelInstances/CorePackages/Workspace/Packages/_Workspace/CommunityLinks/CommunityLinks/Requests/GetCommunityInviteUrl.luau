local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.APIS_URL, 
    path = "community-links/v1/guilded/{communityId}/join", 
    query = {
        a = "red", 
        skipRedirect = "true"
    }
});
return function(v3, v4) --[[ Line: 18 ]]
    -- upvalues: v2 (copy)
    return v3(v2({
        communityId = v4
    }), "GET");
end;