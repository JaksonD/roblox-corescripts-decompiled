local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Models.User);
local v2 = {
    [v1.PresenceType.IN_GAME] = 3, 
    [v1.PresenceType.ONLINE] = 2, 
    [v1.PresenceType.IN_STUDIO] = 1, 
    [v1.PresenceType.OFFLINE] = 0
};
return {
    useLastOnlineForSort = function(v3, v4) --[[ Line: 11 ]] --[[ Name: useLastOnlineForSort ]]
        local v5 = false;
        if typeof(v3) == "number" then
            v5 = false;
            if typeof(v4) == "number" then
                v5 = v3 ~= v4;
            end;
        end;
        return v5;
    end, 
    getFriendWeight = function(v6) --[[ Line: 15 ]] --[[ Name: getFriendWeight ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v7 = nil;
        if v6 and v6.presence then
            v7 = v2[v6.presence];
        end;
        if v7 == nil then
            v7 = v2[v1.PresenceType.OFFLINE];
        end;
        return v7;
    end
};