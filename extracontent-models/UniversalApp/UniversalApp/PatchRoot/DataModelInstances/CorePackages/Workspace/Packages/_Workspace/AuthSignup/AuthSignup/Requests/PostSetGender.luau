local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.USERS_URL, 
    path = "gender"
});
return function(v4, v5) --[[ Line: 55 ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy)
    return v4(v3(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            gender = v5
        })
    });
end;