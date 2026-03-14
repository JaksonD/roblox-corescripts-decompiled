local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    assert(type(v5) == "string", "invalid challenge has been passed into PostVerifyPhoneNumber");
    assert(type(v4) == "string", "invalid code has been passed into PostVerifyPhoneNumber");
    return v3(string.format("%sv1/verified-signup/voucher", v2.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            code = v4, 
            challenge = v5
        }), 
        maxRetryCount = 0
    });
end;