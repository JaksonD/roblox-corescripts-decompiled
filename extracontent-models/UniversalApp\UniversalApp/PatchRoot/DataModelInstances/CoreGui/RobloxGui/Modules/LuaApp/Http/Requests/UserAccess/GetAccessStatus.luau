local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return v2(v1.usermoderation.accessDetail(), "GET");
end;