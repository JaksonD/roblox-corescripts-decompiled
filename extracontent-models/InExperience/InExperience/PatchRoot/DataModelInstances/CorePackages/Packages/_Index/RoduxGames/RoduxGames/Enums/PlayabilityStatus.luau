local l_Parent_0 = script:FindFirstAncestor("RoduxGames").Parent;
return require(l_Parent_0.enumerate)(script.Name, {
    Playable = "Playable", 
    UnplayableOtherReason = "UnplayableOtherReason", 
    GuestProhibited = "GuestProhibited", 
    GameUnapproved = "GameUnapproved", 
    IncorrectConfiguration = "IncorrectConfiguration", 
    UniverseRootPlaceIsPrivate = "UniverseRootPlaceIsPrivate", 
    InsufficientPermissionFriendsOnly = "InsufficientPermissionFriendsOnly", 
    InsufficientPermissionGroupOnly = "InsufficientPermissionGroupOnly", 
    DeviceRestricted = "DeviceRestricted", 
    UnderReview = "UnderReview", 
    PurchaseRequired = "PurchaseRequired", 
    AccountRestricted = "AccountRestricted", 
    TemporarilyUnavailable = "TemporarilyUnavailable"
});