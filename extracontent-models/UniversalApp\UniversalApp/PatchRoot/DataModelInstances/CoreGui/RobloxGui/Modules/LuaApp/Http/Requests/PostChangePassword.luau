local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4, v5) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "invalid current password");
    assert(type(v5) == "string", "invalid new password");
    return v3(string.format("%sv2/user/passwords/change", v2.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            currentPassword = v4, 
            newPassword = v5
        })
    });
end;