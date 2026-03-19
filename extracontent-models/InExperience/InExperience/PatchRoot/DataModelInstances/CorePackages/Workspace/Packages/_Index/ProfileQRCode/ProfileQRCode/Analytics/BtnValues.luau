local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
return require(l_Parent_0.Enumerate)(script.Name, {
    FriendRequestBannerAccepted = "friendRequestBannerAccepted", 
    FriendRequestBannerDismissed = "friendRequestBannerDismissed", 
    QRCodeScannerOpened = "qrCodeScannerOpened"
});