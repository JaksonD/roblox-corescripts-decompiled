local l_Parent_0 = script:FindFirstAncestor("DiscoveryTypes").Parent;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
return {
    GenreExplorer = "GenreExplorerLabel", 
    Carousel = "Carousel", 
    AvatarCarousel = "AvatarCarousel", 
    UserInfo = "UserInfo", 
    FriendCarousel = "FriendCarousel", 
    FriendRecommendationCarousel = "FriendRecommendationCarousel", 
    HomeGameGrid = "SortlessGrid", 
    JoinYourFriendsCarousel = "JoinYourFriendsCarousel", 
    ServerDrivenUi = "sdui", 
    SearchGameGrid = "SearchGameGrid", 
    SearchText = "SearchText", 
    UpsellCard = "UpsellCard", 
    UserSearchGrid = "UserSearchGrid", 
    Pills = "Pills", 
    SearchPillCarousel = l_FFlagSearchOmniAutocompletePage_0 and "SearchPillCarousel" or nil, 
    SongCarousel = l_FFlagEnableTopSongsSort_0 and "SongCarousel" or nil
};