local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.dependencies).enumerate(script.Name, {
    OpenPeopleList = "openPeopleList", 
    RequestFriendship = "requestFriendship", 
    RevokeFriendRequest = "revokeFriendRequest", 
    FriendsLanding = "friendsLanding", 
    AddFriendsButton = "AddFriendsButton"
});