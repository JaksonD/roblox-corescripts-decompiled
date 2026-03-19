local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
return require(l_script_FirstAncestor_0.dependencies).enumerate(script.Name, {
    AddFriendsHintTitle = "Feature.SocialTab.Label.AddFriendHint", 
    AddFriendsHintText = "Feature.SocialTab.Label.AddFriendHintBody", 
    AddProviderFriendsHintTitle = "Feature.Home.AddProviderFriendHintTitle", 
    AddFriend = "Feature.Chat.Label.AddFriends", 
    InviteFriend = "Feature.Friends.Action.InviteProviderFriends", 
    FriendsHeader = "CommonUI.Features.Label.Friends", 
    FriendsHeaderWithCount = "Feature.Home.HeadingFriends"
});