local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.BADGES_URL, 
    path = "v1/user/badges/"
})();
return {
    buildBadgeRemoveUrl = function(v5) --[[ Line: 13 ]] --[[ Name: buildBadgeRemoveUrl ]]
        -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
        return l_UrlBuilder_0.new({
            base = l_Url_0.BADGES_URL, 
            path = "v1/user/badges/{assetId}"
        })({
            assetId = v5
        });
    end, 
    BADGE_REMOVE_URL = v4
};