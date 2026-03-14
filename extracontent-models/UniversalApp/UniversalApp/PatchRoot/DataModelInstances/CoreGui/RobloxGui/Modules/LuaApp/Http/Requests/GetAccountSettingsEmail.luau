local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 16 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv1/email", v1.ACCOUNT_SETTINGS_URL), "GET");
end;