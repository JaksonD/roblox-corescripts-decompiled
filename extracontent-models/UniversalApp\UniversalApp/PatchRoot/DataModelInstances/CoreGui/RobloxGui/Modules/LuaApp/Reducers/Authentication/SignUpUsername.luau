local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpUsername);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or "";
    if v3.type == v1.name then
        return v3.signupUsername;
    else
        return v2;
    end;
end;