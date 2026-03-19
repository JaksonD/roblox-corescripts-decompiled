local l_Parent_0 = script.Parent.Parent.Parent;
return (require(l_Parent_0.React).createContext({
    selectedFriendsSize = 0, 
    selectedFriends = {}, 
    addFriend = function() --[[ Line: 21 ]] --[[ Name: addFriend ]]

    end, 
    removeFriend = function() --[[ Line: 22 ]] --[[ Name: removeFriend ]]

    end, 
    isFriendSelected = function() --[[ Line: 23 ]] --[[ Name: isFriendSelected ]]
        return false;
    end, 
    preselectedUsers = {}, 
    onRemoveCallback = function() --[[ Line: 27 ]] --[[ Name: onRemoveCallback ]]

    end
}));