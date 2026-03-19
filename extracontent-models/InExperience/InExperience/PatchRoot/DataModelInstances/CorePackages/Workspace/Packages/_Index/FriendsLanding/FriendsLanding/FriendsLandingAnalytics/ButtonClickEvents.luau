local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
return require(l_script_FirstAncestor_0.dependencies).enumerate(script.Name, {
    AddFriendsNoFriends = "addFriendsNoFriends", 
    AddFriendsNoFriendsEmptyView = "addFriendsNoFriendsEmptyView", 
    AddFriends = "addFriends", 
    PlayerTile = "playerTile", 
    FriendFilterPill = "friendFilterPill", 
    LoadMoreUsers = "loadMoreUsers", 
    FriendFilterApply = "friendFilterApply", 
    FriendTileUnfriendButton = "friendTileUnfriendButton", 
    IgnoreAllButton = "ignoreAll", 
    ConnectWithFriends = "connectWithFriends", 
    PlayerProfile = "playerProfile", 
    PeopleSearchBar = "peopleSearchBar", 
    ProfileQRCode = "shareProfileQRCode", 
    RequestFriendship = "requestFriendship", 
    DeclineFriendship = "declineFriendship", 
    AcceptFriendship = "acceptFriendship"
});