local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.dependencies).enumerate(script.Name, {
    HomePage = "homepage", 
    MorePage = "morepage", 
    GameDetails = "gameDetails", 
    PlayerSearch = "playerSearch", 
    PlayerProfile = "playerProfile", 
    SocialTab = "SocialTab", 
    FriendsLanding = "friendsLanding", 
    FriendRequests = "friendRequestsPage", 
    Chat = "chat", 
    AddFriends = "addUniversalFriends"
});