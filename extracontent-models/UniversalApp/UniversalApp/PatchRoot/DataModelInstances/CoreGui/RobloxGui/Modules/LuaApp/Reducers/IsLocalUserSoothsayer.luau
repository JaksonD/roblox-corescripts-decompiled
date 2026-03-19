local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetIsLocalUserSoothsayer);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v4 = v2 or false;
    if v3.type == v1.name then
        return v3.isSoothsayer;
    else
        return v4;
    end;
end;