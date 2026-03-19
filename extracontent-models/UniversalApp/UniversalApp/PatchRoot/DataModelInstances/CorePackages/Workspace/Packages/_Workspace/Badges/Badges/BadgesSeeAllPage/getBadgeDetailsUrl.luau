local l_Parent_0 = script:FindFirstAncestor("Badges").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "landing-page-api/badge-details-page/v1beta1"
});
return function(v5, v6) --[[ Line: 14 ]] --[[ Name: getBadgeDetailsUrl ]]
    -- upvalues: l_FFlagSduiUniversalPageEntry_0 (copy), l_UrlBuilder_0 (copy), v4 (copy)
    local v7 = {
        badgeId = v5
    };
    if v6 then
        v7.userId = v6;
    end;
    if l_FFlagSduiUniversalPageEntry_0 then
        v7.PageEntryFormat = "Universal";
    end;
    return (l_UrlBuilder_0.addQueryString(v4(), v7));
end;