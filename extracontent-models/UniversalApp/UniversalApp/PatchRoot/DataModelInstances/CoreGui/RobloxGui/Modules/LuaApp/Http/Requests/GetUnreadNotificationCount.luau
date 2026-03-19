local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
return function(v2) --[[ Line: 14 ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv2/stream-notifications/unread-count", v1.NOTIFICATION_URL), "GET");
end;