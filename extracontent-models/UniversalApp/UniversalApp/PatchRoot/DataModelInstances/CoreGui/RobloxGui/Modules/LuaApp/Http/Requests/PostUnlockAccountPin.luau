local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "invalid account PIN");
    return v3(string.format("%sv1/account/pin/unlock", v2.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            pin = v4
        })
    });
end;