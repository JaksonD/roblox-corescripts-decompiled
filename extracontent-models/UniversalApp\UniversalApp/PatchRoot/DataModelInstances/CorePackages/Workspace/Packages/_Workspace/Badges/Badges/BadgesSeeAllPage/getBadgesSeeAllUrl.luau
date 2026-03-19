local l_Parent_0 = script:FindFirstAncestor("Badges").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "landing-page-api/badges-see-all/v1beta1"
});
local v5 = game:DefineFastInt("LuaAppBadgesSeeAllRequestPageSize", 50);
return function(v6, v7) --[[ Line: 16 ]] --[[ Name: getBadgesSeeAllUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v4 (copy), v5 (copy), l_FFlagSduiUniversalPageEntry_0 (copy)
    return (l_UrlBuilder_0.addQueryString(v4(), {
        universeId = v6, 
        pageSize = v5, 
        cursor = v7, 
        PageEntryFormat = l_FFlagSduiUniversalPageEntry_0 and "Universal" or nil
    }));
end;