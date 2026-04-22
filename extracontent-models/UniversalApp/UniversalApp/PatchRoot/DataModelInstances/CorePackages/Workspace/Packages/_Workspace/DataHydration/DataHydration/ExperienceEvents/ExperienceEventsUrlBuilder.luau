local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "virtual-events/v1/virtual-events/rsvps"
});
return {
    buildRsvpUpdateUrl = function(v5) --[[ Line: 14 ]] --[[ Name: buildRsvpUpdateUrl ]]
        -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
        return l_UrlBuilder_0.new({
            base = l_Url_0.APIS_URL, 
            path = "virtual-events/v1/virtual-events/{id}/rsvps"
        })({
            id = v5
        });
    end, 
    RSVP_UPDATE_URL = v4
};