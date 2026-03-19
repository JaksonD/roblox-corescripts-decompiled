local l_Parent_0 = script.Parent.Parent;
local l_FriendStatuses_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics.Analytics.Enums.FriendStatuses;
local _ = require(l_Parent_0.Common.LocalTypes);
return function(v3) --[[ Line: 9 ]]
    -- upvalues: l_FriendStatuses_0 (copy)
    if v3.isFriendWithUser then
        return l_FriendStatuses_0.Friends;
    elseif v3.hasPendingFriendRequest then
        return l_FriendStatuses_0.RequestSent;
    elseif v3.hasIncomingFriendRequest then
        return l_FriendStatuses_0.RequestReceived;
    else
        return l_FriendStatuses_0.NotFriends;
    end;
end;