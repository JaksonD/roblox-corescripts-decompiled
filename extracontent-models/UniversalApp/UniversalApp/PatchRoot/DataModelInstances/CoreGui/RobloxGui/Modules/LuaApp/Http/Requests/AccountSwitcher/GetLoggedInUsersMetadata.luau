local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    local v6 = v2.fromString("apis:account-switcher/v1/getLoggedInUsersMetadata");
    local v7 = l_HttpService_0:JSONEncode({
        encrypted_users_data_blob = v4, 
        remove_invalid_active_user = v5
    });
    return v3(v6(), "POST", {
        postBody = v7
    });
end;