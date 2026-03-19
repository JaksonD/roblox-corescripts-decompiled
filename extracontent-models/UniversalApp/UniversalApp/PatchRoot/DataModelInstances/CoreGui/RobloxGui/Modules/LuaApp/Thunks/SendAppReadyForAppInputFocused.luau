local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.NotificationType);
return function(v2) --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 12 ]]
        -- upvalues: v2 (copy), v1 (ref)
        local v4 = v3:getState();
        local v5 = v4.Navigation.history[#v4.Navigation.history];
        local v6 = v5[#v5];
        v2:BroadcastNotification(v6.name, v1.APP_READY);
    end;
end;