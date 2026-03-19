local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_enumerate_0 = v1.enumerate;
local l_getFFlagPYMKAddFriendsEntry_0 = v1.getFFlagPYMKAddFriendsEntry;
return l_enumerate_0(script.Name, {
    CarouselLoadedWithUsers = "CarouselLoadedWithUsers", 
    PYMKCarouselLoadingTime = "PYMKCarouselLoadingTime", 
    UserSeen = "UserSeen", 
    UserPressed = "UserPressed", 
    RequestFriendship = "RequestFriendship", 
    AcceptFriendship = "AcceptFriendship", 
    CarouselGenericTileClicked = l_getFFlagPYMKAddFriendsEntry_0() and "CarouselGenericTileClicked" or nil, 
    PYMKUserPresenceLoad = "PYMKUserPresenceLoad"
});