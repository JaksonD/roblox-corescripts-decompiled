local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.SendUserVerifyEmail);
return function(v2) --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    return function(_) --[[ Line: 14 ]]
        -- upvalues: v1 (ref), v2 (copy)
        return v1(v2);
    end;
end;