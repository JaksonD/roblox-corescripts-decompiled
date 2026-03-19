local l_Parent_0 = script:FindFirstAncestor("FriendsNetworking").Parent;
return require(l_Parent_0.enumerate)(script.Name, {
    Unknown = "Unknown", 
    PlayerSearch = "PlayerSearch", 
    QrCode = "QrCode", 
    InGame = "InGame", 
    UserProfile = "UserProfile", 
    QqContactImporter = "QqContactImporter", 
    WeChatContactImporter = "WeChatContactImporter", 
    ProfileShare = "ProfileShare", 
    PhoneContactImporter = "PhoneContactImporter", 
    FriendRecommendations = "FriendRecommendations"
});