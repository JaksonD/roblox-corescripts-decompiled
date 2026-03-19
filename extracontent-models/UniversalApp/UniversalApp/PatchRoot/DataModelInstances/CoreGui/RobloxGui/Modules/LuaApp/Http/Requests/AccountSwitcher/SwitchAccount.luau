local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v3, v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    local v7 = v2.fromString("apis:account-switcher/v1/switch");
    local v8 = l_HttpService_0:JSONEncode({
        switched_to_user_id = v4, 
        switched_from_user_id = v6, 
        encrypted_users_data_blob = v5
    });
    return v3(v7(), "POST", {
        postBody = v8
    });
end;