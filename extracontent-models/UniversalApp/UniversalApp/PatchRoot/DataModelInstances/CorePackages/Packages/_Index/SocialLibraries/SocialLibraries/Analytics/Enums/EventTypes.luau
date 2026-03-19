local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.dependencies).enumerate(script.Name, {
    JoinGameInPeopleList = "joinGameInPeopleList", 
    ButtonClick = "buttonClick", 
    PageLoad = "luaPageLoad", 
    PageMountingTime = "pageMountingTime", 
    PageLoadingTime = "pageLoadingTime", 
    FriendsCarouselLoaded = "friendsCarouselLoaded", 
    UserSeen = "userSeen"
});