local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
return {
    buildGamePassesUrl = l_UrlBuilder_0.new({
        base = l_Url_0.APIS_URL, 
        path = "game-passes/v1/universes/{universeId}/game-passes", 
        query = "pageSize=50&passView=Full"
    })
};