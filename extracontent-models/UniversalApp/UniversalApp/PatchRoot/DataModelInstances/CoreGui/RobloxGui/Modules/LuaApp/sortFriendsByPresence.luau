local l_LuaApp_0 = game:GetService("CoreGui").RobloxGui.Modules.LuaApp;
local v1 = require(l_LuaApp_0.Models.User);
local v2 = {
    [v1.PresenceType.IN_GAME] = 3, 
    [v1.PresenceType.ONLINE] = 2, 
    [v1.PresenceType.IN_STUDIO] = 1, 
    [v1.PresenceType.OFFLINE] = 0
};
return function(v3, v4) --[[ Line: 14 ]]
    -- upvalues: v2 (copy)
    local v5 = v2[v3.presence] or 0;
    local v6 = v2[v4.presence] or 0;
    if v5 == v6 then
        return v3.name:lower() < v4.name:lower();
    else
        return v6 < v5;
    end;
end;