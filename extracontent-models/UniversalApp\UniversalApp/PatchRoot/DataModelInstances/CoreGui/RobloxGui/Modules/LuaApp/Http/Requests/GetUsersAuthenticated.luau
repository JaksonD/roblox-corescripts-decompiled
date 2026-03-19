local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%s/users/authenticated", v1.USERS_URL), "GET", {
        maxRetryCount = 0
    });
end;