local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%smaintenance-status/v1/alerts/alert-info", v1.APIS_URL), "GET");
end;