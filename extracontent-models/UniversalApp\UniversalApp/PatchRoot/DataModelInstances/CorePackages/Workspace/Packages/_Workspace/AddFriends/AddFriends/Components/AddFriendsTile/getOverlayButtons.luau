local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.t);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local _ = require(script.Parent.getFriendRequestHandlersExtraProps);
local l_IconName_0 = require(l_Parent_0.Foundation).Enums.IconName;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_ButtonTypes_0 = require(l_Parent_0.UserList).Enums.ButtonTypes;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
local v8 = v1.strictInterface({
    isFriendRequest = v1.boolean, 
    hasIncomingFriendRequest = v1.optional(v1.boolean), 
    friendStatus = v1.optional(v1.enum(Enum.FriendStatus)), 
    handleRequestFriendship = v1.optional(v1.callback), 
    handleAcceptFriendRequest = v1.optional(v1.callback), 
    handleDeclineFriendRequest = v1.optional(v1.callback), 
    shouldAddFocusEventName = v1.optional(v1.boolean)
});
return function(v9) --[[ Line: 34 ]]
    -- upvalues: v8 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_IconName_0 (copy), l_Images_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_ButtonTypes_0 (copy)
    assert(v8(v9));
    local v10 = {};
    if v9.isFriendRequest then
        if (v9.friendStatus or Enum.FriendStatus.FriendRequestReceived) == Enum.FriendStatus.FriendRequestReceived then
            table.insert(v10, {
                icon = if l_FFlagAddFriendsUserListEnabled_0 then l_IconName_0.X else l_Images_0["icons/actions/reject"], 
                isSecondary = not l_FFlagAddFriendsUserListEnabled_0 or nil, 
                onActivated = function() --[[ Line: 50 ]] --[[ Name: onActivated ]]
                    -- upvalues: v9 (copy)
                    v9.handleDeclineFriendRequest();
                end, 
                focusEventName = if v9.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.IgnoreFriendRequest else nil, 
                type = if l_FFlagAddFriendsUserListEnabled_0 then l_ButtonTypes_0.Dismiss else nil
            });
            table.insert(v10, {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = if l_FFlagAddFriendsUserListEnabled_0 then nil else false, 
                onActivated = function() --[[ Line: 61 ]] --[[ Name: onActivated ]]
                    -- upvalues: v9 (copy)
                    v9.handleAcceptFriendRequest();
                end, 
                focusEventName = if v9.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else nil, 
                type = if l_FFlagAddFriendsUserListEnabled_0 then l_ButtonTypes_0.Accept else nil
            });
            return v10;
        end;
    else
        local v11 = v9.friendStatus or Enum.FriendStatus.NotFriend;
        if v9.hasIncomingFriendRequest then
            table.insert(v10, {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = if l_FFlagAddFriendsUserListEnabled_0 then nil else false, 
                onActivated = function() --[[ Line: 80 ]] --[[ Name: onActivated ]]
                    -- upvalues: v9 (copy)
                    v9.handleAcceptFriendRequest();
                end, 
                focusEventName = if v9.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToAcceptFriendRequest else nil, 
                type = if l_FFlagAddFriendsUserListEnabled_0 then l_ButtonTypes_0.Accept else nil
            });
            return v10;
        elseif v11 == Enum.FriendStatus.NotFriend then
            table.insert(v10, {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                isSecondary = if l_FFlagAddFriendsUserListEnabled_0 then nil else false, 
                onActivated = function() --[[ Line: 92 ]] --[[ Name: onActivated ]]
                    -- upvalues: v9 (copy)
                    v9.handleRequestFriendship();
                end, 
                focusEventName = if v9.shouldAddFocusEventName then l_FocusNavigationEventNameEnum_0.HoldToAddFriend else nil, 
                type = if l_FFlagAddFriendsUserListEnabled_0 then l_ButtonTypes_0.Add else nil
            });
            return v10;
        elseif v11 == Enum.FriendStatus.FriendRequestSent then
            table.insert(v10, {
                icon = l_Images_0["icons/actions/friends/friendpending"], 
                isSecondary = if l_FFlagAddFriendsUserListEnabled_0 then nil else false, 
                isDisabled = true, 
                onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]

                end, 
                type = if l_FFlagAddFriendsUserListEnabled_0 then l_ButtonTypes_0.Pending else nil
            });
        end;
    end;
    return v10;
end;