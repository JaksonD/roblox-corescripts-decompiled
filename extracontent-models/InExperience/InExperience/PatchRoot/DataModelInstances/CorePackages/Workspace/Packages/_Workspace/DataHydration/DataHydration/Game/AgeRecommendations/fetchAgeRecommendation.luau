local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.Http);
local v2 = require(l_Parent_0.HttpRequest);
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = v1.Url;
local v6 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "experience-guidelines-api/experience-guidelines/get-age-recommendation"
})();
return function(v7) --[[ Line: 20 ]] --[[ Name: requestAgeRecommendation ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy), v6 (copy)
    local v8 = l_HttpService_0:JSONEncode({
        universeId = v7
    });
    return v2.config({
        requestFunction = function(v9, v10, v11) --[[ Line: 23 ]] --[[ Name: requestFunction ]]
            -- upvalues: v2 (ref)
            return v2.requestFunctions.HttpRbxApi(v9, v10, v11);
        end
    })(v6, "POST", {
        postBody = v8
    });
end;