local l_Parent_0 = script:FindFirstAncestor("Badges").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagSduiV2PaginationSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2PaginationSupport;
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
local v5 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "landing-page-api/badges-see-all/v1beta1"
});
local v6 = game:DefineFastInt("LuaAppBadgesSeeAllRequestPageSize", l_FFlagSduiV2PaginationSupport_0 and 50 or 500);
return function(v7, v8) --[[ Line: 18 ]] --[[ Name: getBadgesSeeAllUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v5 (copy), v6 (copy), l_FFlagSduiV2PaginationSupport_0 (copy), l_FFlagSduiUniversalPageEntry_0 (copy)
    return (l_UrlBuilder_0.addQueryString(v5(), {
        universeId = v7, 
        pageSize = v6, 
        cursor = if l_FFlagSduiV2PaginationSupport_0 then v8 else nil, 
        PageEntryFormat = l_FFlagSduiUniversalPageEntry_0 and "Universal" or nil
    }));
end;