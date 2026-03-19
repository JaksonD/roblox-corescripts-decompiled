local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv1/themes/User/%d", v1.ACCOUNT_SETTINGS, v3), "GET");
end;