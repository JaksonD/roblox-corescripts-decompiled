local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
return (v2.createContext({
    friends = {}, 
    hasFriends = false, 
    isFetchingFriends = false, 
    isFriendsListFetchFailed = false, 
    searchFriends = function() --[[ Line: 15 ]] --[[ Name: searchFriends ]]
        return {};
    end, 
    fetchMoreFriends = function() --[[ Line: 18 ]] --[[ Name: fetchMoreFriends ]]
        return {};
    end, 
    searchFriendsString = "", 
    friendsNames = {
        loading = true
    }
}));