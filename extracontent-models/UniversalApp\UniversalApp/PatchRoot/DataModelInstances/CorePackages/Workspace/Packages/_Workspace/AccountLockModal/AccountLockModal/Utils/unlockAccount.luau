local l_Parent_0 = script:FindFirstAncestor("AccountLockModal").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
return function(v3) --[[ Line: 9 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    return v3(l_Url_0.APIS_URL .. "account-unlock-api/v1/unlock", "POST", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;