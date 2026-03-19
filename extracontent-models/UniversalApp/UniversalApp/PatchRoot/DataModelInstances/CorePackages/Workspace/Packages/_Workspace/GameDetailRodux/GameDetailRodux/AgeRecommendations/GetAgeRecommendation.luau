local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_HttpService_0 = game:GetService("HttpService");
local v4 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "experience-guidelines-api/experience-guidelines/get-age-recommendation"
});
return function(v5, v6) --[[ Line: 29 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy)
    return v5(v4(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            universeId = v6
        })
    });
end;