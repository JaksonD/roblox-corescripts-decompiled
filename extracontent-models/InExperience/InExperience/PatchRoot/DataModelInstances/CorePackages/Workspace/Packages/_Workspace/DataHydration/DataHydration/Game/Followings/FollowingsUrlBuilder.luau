local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.FOLLOWINGS_URL, 
    path = "v1/users/universes/status"
});
local function v7(v5, v6) --[[ Line: 14 ]] --[[ Name: buildFollowingStatusUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_Url_0.FOLLOWINGS_URL, 
        path = "v1/users/{userId}/universes/{universeId}/status"
    })({
        userId = v5, 
        universeId = v6
    });
end;
local v8 = l_UrlBuilder_0.new({
    base = l_Url_0.FOLLOWINGS_URL, 
    path = "v1/users/universes/"
});
return {
    buildFollowingStatusUrl = v7, 
    buildFollowingUpdateUrl = function(v9, v10) --[[ Line: 29 ]] --[[ Name: buildFollowingUpdateUrl ]]
        -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
        return l_UrlBuilder_0.new({
            base = l_Url_0.FOLLOWINGS_URL, 
            path = "v1/users/{userId}/universes/{universeId}"
        })({
            userId = v9, 
            universeId = v10
        });
    end, 
    FOLLOWING_UPDATE_URL = v8, 
    FOLLOWING_STATUS_URL = v4
};