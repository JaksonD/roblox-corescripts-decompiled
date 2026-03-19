local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_enumerate_0 = v1.enumerate;
local l_getFFlagPYMKAddFriendsEntry_0 = v1.getFFlagPYMKAddFriendsEntry;
return l_enumerate_0(script.Name, {
    RequestFriendship = "requestFriendship", 
    OpenPeopleList = "openPeopleList", 
    AcceptFriendship = "acceptFriendship", 
    FindFriends = l_getFFlagPYMKAddFriendsEntry_0() and "findFriends" or "", 
    SeeAll = l_getFFlagPYMKAddFriendsEntry_0() and "seeAll" or ""
});