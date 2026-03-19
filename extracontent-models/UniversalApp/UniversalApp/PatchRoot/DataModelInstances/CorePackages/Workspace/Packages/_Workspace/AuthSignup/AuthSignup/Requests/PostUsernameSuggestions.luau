local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3, v4, v5) --[[ Line: 12 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "invalid username");
    assert(type(v5) == "string", "invalid birthday");
    local v6 = l_UrlBuilder_0.fromString("auth:v1/validators/username");
    local v7 = l_HttpService_0:JSONEncode({
        username = v4, 
        birthday = v5
    });
    return v3(v6(), "POST", {
        postBody = v7, 
        maxRetryCount = 0
    });
end;