local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v3(v2.new({
        base = v1.USERS_URL, 
        path = "users/authenticated/roles"
    })(), "GET");
end;