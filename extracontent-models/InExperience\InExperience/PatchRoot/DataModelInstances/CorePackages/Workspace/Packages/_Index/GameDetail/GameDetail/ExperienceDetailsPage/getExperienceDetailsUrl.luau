local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3) --[[ Line: 7 ]] --[[ Name: getExperienceDetailsUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
    return (l_UrlBuilder_0.new({
        base = l_Url_0.APIS_URL, 
        path = "experience-details-api/v2/universes/{universeId}/experience-details"
    })({
        universeId = v3
    }));
end;