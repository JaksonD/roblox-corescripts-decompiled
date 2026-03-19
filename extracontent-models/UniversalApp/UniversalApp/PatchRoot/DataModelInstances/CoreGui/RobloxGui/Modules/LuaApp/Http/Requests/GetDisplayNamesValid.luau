local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = v1.USERS_URL, 
    path = "display-names/validate", 
    query = "displayname={displayname}&birthdate={birthday}"
});
return function(v3, v4, v5) --[[ Line: 16 ]]
    -- upvalues: v2 (copy)
    return v3(v2({
        displayname = v4, 
        birthday = v5
    }), "GET", {
        maxRetryCount = 0
    });
end;