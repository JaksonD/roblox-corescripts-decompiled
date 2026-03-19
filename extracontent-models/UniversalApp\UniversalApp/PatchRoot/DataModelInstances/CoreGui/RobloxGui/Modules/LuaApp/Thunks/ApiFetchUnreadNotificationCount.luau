local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetUnreadNotificationCount);
local v2 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
local l_FFlag_0 = settings():GetFFlag("FixCountOfUnreadNotificationError");
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), l_FFlag_0 (copy), v2 (copy)
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v1 (ref), v4 (copy), l_FFlag_0 (ref), v2 (ref)
        return v1(v4):andThen(function(v6) --[[ Line: 11 ]]
            -- upvalues: l_FFlag_0 (ref), v5 (copy), v2 (ref)
            local l_unreadNotifications_0 = v6.responseBody.unreadNotifications;
            if l_FFlag_0 then
                if l_unreadNotifications_0 and tonumber(l_unreadNotifications_0) >= 0 then
                    v5:dispatch(v2(l_unreadNotifications_0));
                    return l_unreadNotifications_0;
                else
                    warn(string.format("ApiFetchUnreadNotificationCount - notificationCount is not a valid number: %s", (tostring(l_unreadNotifications_0))));
                    return l_unreadNotifications_0;
                end;
            else
                v5:dispatch(v2(l_unreadNotifications_0));
                return l_unreadNotifications_0;
            end;
        end);
    end;
end;