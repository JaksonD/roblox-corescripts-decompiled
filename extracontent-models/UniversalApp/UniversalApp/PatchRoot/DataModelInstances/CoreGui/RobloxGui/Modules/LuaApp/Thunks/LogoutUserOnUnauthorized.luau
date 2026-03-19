local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
return function(v4, v5, v6) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (copy), v5 (copy), v3 (ref), v6 (copy)
        if v7:getState().AuthenticationStatus.status == v1.LOGGED_IN then
            v7:dispatch(v2(v4, v5, v3.UnauthorizedResponse, v6));
        end;
    end;
end;