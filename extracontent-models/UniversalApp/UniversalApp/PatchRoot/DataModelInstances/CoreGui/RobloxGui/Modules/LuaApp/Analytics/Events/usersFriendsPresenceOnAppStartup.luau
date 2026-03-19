local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: l_UserModel_0 (copy)
    local l_FriendCount_0 = v2.FriendCount;
    local v5 = v2.FriendPresenceCounts[l_UserModel_0.PresenceType.ONLINE] or 0;
    local v6 = v2.FriendPresenceCounts[l_UserModel_0.PresenceType.IN_GAME] or 0;
    v3.EventStream:setRBXEventStream("onlineFriends", "usersFriendsPresenceOnAppStartup", {
        onlineFriendCount = v5 + v6, 
        inGameFriendCount = v6, 
        totalFriendCount = l_FriendCount_0
    });
end;