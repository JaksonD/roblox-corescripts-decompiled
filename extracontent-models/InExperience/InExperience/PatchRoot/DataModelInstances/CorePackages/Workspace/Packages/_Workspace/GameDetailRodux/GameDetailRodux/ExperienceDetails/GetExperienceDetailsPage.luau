local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.APIS_URL, 
    path = "experience-details-api/v1/get-experience-details", 
    query = {
        universeId = "{universeId}"
    }
});
return function(v3, v4) --[[ Line: 23 ]]
    -- upvalues: v2 (copy)
    assert(type(v4) == "string", "GetExperienceDetailsPage request expects universeId to be a string");
    return v3(v2({
        universeId = v4
    }), "GET");
end;