local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 15 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv2/passwords/current-status", v1.AUTH_URL), "GET");
end;