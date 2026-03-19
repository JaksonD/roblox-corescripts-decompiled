local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "invalid login code");
    local v5 = l_UrlBuilder_0.fromString("apis:auth-token-service/v1/login/validateCode");
    local v6 = l_HttpService_0:JSONEncode({
        code = v4
    });
    return v3(v5(), "POST", {
        postBody = v6
    });
end;