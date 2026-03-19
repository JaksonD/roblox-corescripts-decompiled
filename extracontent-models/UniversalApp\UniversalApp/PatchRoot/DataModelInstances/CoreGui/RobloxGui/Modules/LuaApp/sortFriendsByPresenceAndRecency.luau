local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Models.User);
local l_useLastOnlineForSort_0 = require(l_Modules_0.LuaApp.sortFriendsUtilities).useLastOnlineForSort;
local l_getFriendWeight_0 = require(l_Modules_0.LuaApp.sortFriendsUtilities).getFriendWeight;
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: l_getFriendWeight_0 (copy), v1 (copy), l_useLastOnlineForSort_0 (copy)
    local v6 = l_getFriendWeight_0(v4);
    local v7 = l_getFriendWeight_0(v5);
    if v6 == v7 then
        if v4.presence ~= v1.PresenceType.OFFLINE and l_useLastOnlineForSort_0(v4.lastOnline, v5.lastOnline) then
            return v4.lastOnline > v5.lastOnline;
        else
            return v4.name:lower() < v5.name:lower();
        end;
    else
        return v7 < v6;
    end;
end;