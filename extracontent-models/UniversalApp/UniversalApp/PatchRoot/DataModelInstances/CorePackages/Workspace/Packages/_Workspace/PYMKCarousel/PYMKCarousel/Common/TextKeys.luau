local v0 = game:DefineFastFlag("PYMKFriendsToastRename", false);
return {
    FriendRequestSentToast = "Feature.Friends.Action.FriendRequestSent", 
    ConnectionRequestSentToast = v0 and "Feature.Friends.Action.FriendRequestSent" or "Feature.Friends.Action.ConnectionRequestSent", 
    SomethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    FriendAddedToast = "Feature.AddFriends.Action.FriendAdded", 
    ConnectionAddedToast = v0 and "Feature.Friends.Action.FriendAdded" or "Feature.Friends.Action.ConnectionAdded", 
    FriendRequestContext = "Feature.Friends.Label.FriendRequest", 
    ConnectionRequestContext = "Feature.Friends.Label.ConnectionRequest", 
    FindFriendsLabel = "Feature.Friends.Action.FindFriends", 
    SeeAllLabel = "Feature.Home.ActionSeeAll", 
    NewText = "Feature.Catalog.Label.New", 
    FindFriendsTooltipTitle = "Feature.AddFriends.Title.AddFriendsTooltipTitle", 
    FindFriendsTooltipBody = "Feature.AddFriends.Label.AddFriendsTooltip", 
    FromContacts = "Feature.Friends.Description.FromContacts"
};