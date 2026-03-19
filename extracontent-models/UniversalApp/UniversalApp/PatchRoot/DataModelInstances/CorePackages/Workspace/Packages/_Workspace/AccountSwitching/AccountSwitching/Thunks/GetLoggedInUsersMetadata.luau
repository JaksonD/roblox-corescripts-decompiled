local l_Parent_0 = script:FindFirstAncestor("AccountSwitching").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v3 = require(script.Parent.Paths);
return function(v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: l_UrlBuilder_0 (copy), v3 (copy), l_HttpService_0 (copy)
    local v7 = l_UrlBuilder_0.fromString(v3.GetAccountsListAsPreviousAccountEntries);
    local v8 = l_HttpService_0:JSONEncode({
        encrypted_users_data_blob = v5, 
        remove_invalid_active_user = v6
    });
    return v4(v7(), "POST", {
        postBody = v8
    });
end;