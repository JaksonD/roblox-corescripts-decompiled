local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local v1 = require(l_script_FirstAncestor_0.Common.Enums);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return v1.FriendStatus.Unknown;
    elseif v2 == v1.ProfileActions.PendingFriendRequest then
        return v1.FriendStatus.RequestSent;
    elseif v2 == v1.ProfileActions.AcceptFriendRequest then
        return v1.FriendStatus.RequestReceived;
    elseif v2 == v1.ProfileActions.Chat or v2 == v1.ProfileActions.JoinExperience then
        return v1.FriendStatus.Friends;
    elseif v2 == v1.ProfileActions.EditProfile then
        return v1.FriendStatus.Self;
    elseif v2 == v1.ProfileActions.Unfriend then
        return v1.FriendStatus.Ineligible;
    else
        return v1.FriendStatus.NotFriends;
    end;
end;