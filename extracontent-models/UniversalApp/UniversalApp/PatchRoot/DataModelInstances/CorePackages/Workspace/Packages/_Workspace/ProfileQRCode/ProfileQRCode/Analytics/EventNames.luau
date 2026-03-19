local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
return require(l_Parent_0.Enumerate)(script.Name, {
    QRPageLoad = "QRPageLoad", 
    QRPageLoadFailed = "QRPageLoadFailed", 
    QRPageFriendRequestBannerShown = "QRPageFriendRequestBannerShown", 
    QRPageFriendRequestBannerAccepted = "QRPageFriendRequestBannerAccepted", 
    QRPageFriendRequestBannerDismissed = "QRPageFriendRequestBannerDismissed", 
    QRCodeScannerOpened = "QRCodeScannerOpened", 
    QRCodeScannerTooltipShown = "QRCodeScannerTooltipShown", 
    RefreshQrSession = "RefreshQrSession"
});