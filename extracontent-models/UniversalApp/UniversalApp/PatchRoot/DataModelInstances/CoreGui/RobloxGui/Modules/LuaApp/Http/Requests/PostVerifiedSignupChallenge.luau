local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "invalid delivery target");
    return v3(string.format("%sv1/verified-signup/challenge", v2.AUTH_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            deliveryMethod = 0, 
            deliveryTarget = v4
        })
    });
end;