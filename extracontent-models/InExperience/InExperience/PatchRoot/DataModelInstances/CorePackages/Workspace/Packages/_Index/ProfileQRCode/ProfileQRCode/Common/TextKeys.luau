local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return {
    AcceptFriend = "Feature.Profile.Action.AcceptFriends", 
    AcceptConnection = "CommonUI.Features.Label.AcceptConnection", 
    Description = "Feature.Profile.Description.QrCodeScanning", 
    ScanQRText = "Feature.Profile.Description.ScanQR", 
    QrCodeDescription = l_FFlagConnectionsToFriendsRename_0 and "Feature.Profile.Description.QrCodeDescription.FriendsRename" or "Feature.Profile.Description.QrCodeDescription", 
    TrustedConnectionDescription = "Feature.Profile.Description.QrCodeDescription", 
    TrustedFriendsDescription = "Feature.Profile.Description.QrCodeDescription.FriendsRename", 
    FailedToLoad = "Feature.Profile.Message.QRLoadFailed", 
    FriendAdded = "Feature.Profile.Message.FriendAdded", 
    ConnectionAdded = "Feature.Friends.Action.ConnectionAdded", 
    NotificationRequest = "Feature.Profile.Message.QRNofificationRequest", 
    NotificationRequestText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Profile.Message.QRNotificationRequest.FriendsRename" or "Feature.Profile.Message.QRNotificationRequest", 
    Title = "Feature.Profile.Heading.ProfileQRCode", 
    TooltipText = "Feature.Profile.Tooltip.QrScanner", 
    TooltipTitle = "Feature.Profile.Title.QrScanner", 
    ShareProfileLink = "Feature.Profile.Action.ShareProfileLink", 
    CopyProfileLink = "Feature.Profile.Action.CopyProfileLink"
};