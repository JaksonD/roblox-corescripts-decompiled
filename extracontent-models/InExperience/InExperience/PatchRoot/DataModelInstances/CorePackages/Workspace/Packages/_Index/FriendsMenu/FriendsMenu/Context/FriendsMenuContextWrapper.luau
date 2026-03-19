local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = if require(l_Parent_1.Flags.FFlagUpdateInvitesToUsePaginatedFriends) then require(l_Parent_0.FriendsListContextProvider2) else require(l_Parent_0.FriendsListContextProvider);
local v4 = require(l_Parent_0.InviteCallbackProvider);
local v5 = require(l_Parent_0.SelectedUsersContextProvider);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Parent_2.React);
return function(v8) --[[ Line: 29 ]]
    -- upvalues: v6 (copy), v7 (copy), v3 (copy), v4 (copy), v5 (copy)
    local l_excludedFriendsSet_0 = v8.excludedFriendsSet;
    if v8.preselectedUsersUnremovable and v8.preselectedUsers then
        l_excludedFriendsSet_0 = v6.Dictionary.union(l_excludedFriendsSet_0 or {}, v6.List.toSet(v8.preselectedUsers));
    end;
    return v7.createElement(v3, {
        excludedFriendsSet = l_excludedFriendsSet_0, 
        isLoadingCustomParams = v8.isLoadingCustomParams
    }, v7.createElement(v4, {
        inviteSingleFriend = v8.inviteSingleFriend, 
        inviteMultiFriends = v8.inviteMultiFriends
    }, v7.createElement(v5, {
        selectionLimit = v8.selectionLimit, 
        preselectedUsers = v8.preselectedUsers, 
        preselectedUsersUnremovable = v8.preselectedUsersUnremovable, 
        onRemoveCallback = v8.onRemoveCallback
    }, v8.children)));
end;