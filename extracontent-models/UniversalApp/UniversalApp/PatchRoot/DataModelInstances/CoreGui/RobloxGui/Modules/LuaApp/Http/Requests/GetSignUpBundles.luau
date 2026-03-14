local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder).new({
    base = v1.AUTH_URL, 
    path = "v3/signup/bundles"
});
return function(v3) --[[ Line: 15 ]]
    -- upvalues: v2 (copy)
    return v3(v2(), "GET");
end;