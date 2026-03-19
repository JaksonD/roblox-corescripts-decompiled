return function(v0, v1) --[[ Line: 1 ]]
    if v1 then
        return Enum.FriendStatus.FriendRequestReceived;
    elseif v0 then
        return v0;
    else
        return Enum.FriendStatus.NotFriend;
    end;
end;