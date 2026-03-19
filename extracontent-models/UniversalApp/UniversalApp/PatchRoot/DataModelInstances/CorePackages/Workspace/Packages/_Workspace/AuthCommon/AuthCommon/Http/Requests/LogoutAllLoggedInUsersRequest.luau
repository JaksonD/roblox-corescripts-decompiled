local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    local v5 = l_UrlBuilder_0.fromString("apis:account-switcher/v1/logoutAllLoggedInUsers");
    local v6 = l_HttpService_0:JSONEncode({
        encrypted_users_data_blob = v4
    });
    return v3(v5(), "POST", {
        postBody = v6
    });
end;