local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
return require(l_script_FirstAncestor_0.dependencies).enumerate(script.Name, {
    ContactWarningSeen = "contactWarningSeen", 
    ContactImporterBannerSeen = "contactImporterBannerSeen", 
    ContactImporterOnAddFriends = "contactImporterOnAddFriends", 
    FriendPruningTooltipSeen = "friendPruningTooltipSeen", 
    FriendPruningNewBadgeSeen = "friendPruningNewBadgeSeen", 
    ProfileQRCodeBannerSeen = "profileQRCodeBannerSeen"
});