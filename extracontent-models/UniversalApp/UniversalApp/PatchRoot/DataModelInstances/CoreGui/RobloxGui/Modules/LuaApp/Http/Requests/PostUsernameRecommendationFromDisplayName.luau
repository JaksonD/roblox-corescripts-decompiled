local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v3 = game:DefineFastInt("UsernameRecommendationDisplayNameMaxRetryCount", 0);
local v4 = l_UrlBuilder_0.fromString("auth:v1/validators/recommendedUsernameFromDisplayName");
return function(v5, v6, v7) --[[ Line: 13 ]]
    -- upvalues: l_HttpService_0 (copy), v4 (copy), v3 (copy)
    local v8 = l_HttpService_0:JSONEncode({
        displayName = v6, 
        birthday = v7
    });
    return v5(v4(), "POST", {
        maxRetryCount = v3, 
        postBody = v8
    });
end;