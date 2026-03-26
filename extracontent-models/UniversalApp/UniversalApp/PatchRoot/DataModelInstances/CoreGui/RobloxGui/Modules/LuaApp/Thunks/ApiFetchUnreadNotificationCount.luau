local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetUnreadNotificationCount);
local v2 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        return v1(v3):andThen(function(v5) --[[ Line: 9 ]]
            -- upvalues: v4 (copy), v2 (ref)
            local l_unreadNotifications_0 = v5.responseBody.unreadNotifications;
            v4:dispatch(v2(l_unreadNotifications_0));
            return l_unreadNotifications_0;
        end);
    end;
end;