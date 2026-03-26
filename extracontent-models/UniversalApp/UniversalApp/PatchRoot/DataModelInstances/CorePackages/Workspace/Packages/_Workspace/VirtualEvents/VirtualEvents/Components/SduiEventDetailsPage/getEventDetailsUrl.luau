local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "virtual-events/v1beta1/event-details-page"
});
return function(v4) --[[ Line: 12 ]] --[[ Name: getEventDetailsUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v3 (copy)
    return (l_UrlBuilder_0.addQueryString(v3(), {
        eventId = v4
    }));
end;