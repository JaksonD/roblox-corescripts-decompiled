local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.GAME_URL, 
    path = "v1/games/favorites"
});
local function v6(v5) --[[ Line: 14 ]] --[[ Name: buildFavoriteUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_Url_0.GAME_URL, 
        path = "v1/games/{universeId}/favorites"
    })({
        universeId = v5
    });
end;
local v7 = l_UrlBuilder_0.new({
    base = l_Url_0.GAME_URL, 
    path = "v1/games/favorites/update"
});
return {
    buildFavoriteUrl = v6, 
    buildFavoriteUpdateUrl = function(v8) --[[ Line: 28 ]] --[[ Name: buildFavoriteUpdateUrl ]]
        -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
        return l_UrlBuilder_0.new({
            base = l_Url_0.GAME_URL, 
            path = "v1/games/{universeId}/favorites"
        })({
            universeId = v8
        });
    end, 
    FAVORITE_URL = v4, 
    FAVORITE_UPDATE_URL = v7
};