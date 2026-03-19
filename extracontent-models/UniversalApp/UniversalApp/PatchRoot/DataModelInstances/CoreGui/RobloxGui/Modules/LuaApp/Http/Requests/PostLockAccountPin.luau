local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv1/account/pin/lock", v1.AUTH_URL), "POST", {
        postBody = ""
    });
end;