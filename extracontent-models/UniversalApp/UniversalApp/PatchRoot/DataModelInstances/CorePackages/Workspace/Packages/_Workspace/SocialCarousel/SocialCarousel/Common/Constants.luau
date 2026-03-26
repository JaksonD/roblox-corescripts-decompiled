local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagSocialCarouselUpdateVerticalSpacing);
return {
    LOCALIZATION = {
        FRIENDS_LABEL = "Feature.Friends.Label.Friends", 
        FRIENDS_LABEL_WITH_COUNT = "Feature.Home.HeadingFriends", 
        ADD_FRIENDS_HEADING = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
        FRIENDS_HINT_TITLE = "Feature.SocialTab.Label.AddFriendHintBody", 
        FRIENDS_HINT_BODY = "Feature.Friends.Label.FindFriendsHintBody", 
        CONNECTIONS_LABEL = if l_FFlagConnectionsToFriendsRename_0 then nil else "CommonUI.Features.Label.Connections", 
        CONNECTIONS_LABEL_WITH_COUNT = if l_FFlagConnectionsToFriendsRename_0 then nil else "Feature.Friends.Label.ConnectionsCount", 
        CONNECTIONS_HINT_TITLE = if l_FFlagConnectionsToFriendsRename_0 then nil else "Feature.Friends.Label.AddConnectionsHint", 
        CONNECTIONS_HINT_BODY = if l_FFlagConnectionsToFriendsRename_0 then nil else "Feature.Friends.Label.AddConnectionsHintBody", 
        ADD_CONNECTIONS_HEADING = if l_FFlagConnectionsToFriendsRename_0 then nil else "CommonUI.Features.Label.Connect", 
        NEW_FRIEND_REQUESTS_MAX = "Feature.Friends.Label.NewFriendRequestsMax", 
        FRIENDS_ARE_NOW_CONNECTIONS = "Feature.Friends.Label.FriendsAreNowConnections", 
        START_SQUAD_TEXT = "Feature.Squads.Label.StartParty"
    }, 
    ANALYTICS = {
        ACTION_TYPES = {
            OPEN_CONTEXTUAL_MENU = "OpenContextualMenu", 
            OPEN_PROFILE = "OpenProfile", 
            OPEN_CONSOLE_CONTEXTUAL_MENU = "OpenConsoleContextualMenu", 
            OPEN_ADD_FRIENDS = "OpenAddFriends"
        }, 
        BTN_VALUES = {
            OPEN_PEOPLE_LIST = "openPeopleList", 
            ADD_FRIENDS = "AddFriendsButton", 
            VIEW_ALL_FRIENDS = "friendsLanding", 
            START_SQUAD = "StartSquadButton"
        }, 
        SRC = {
            HOMEPAGE_FRIENDS_CAROUSEL = "HomepageFriendsCarousel", 
            PARTY_PAGE_UA = "PartyPageUA", 
            PARTY_PAGE_IN_EXP = "PartyPageInExp"
        }, 
        UI_LOADING_EVENTS = {
            EMPTY_HINT = "EmptyHint", 
            CAROUSEL_FRIEND = "CarouselFriend", 
            ADD_FRIENDS = "AddFriendsBtn", 
            START_SQUAD = "StartSquadBtn"
        }, 
        CONTENT_TYPE = "User"
    }, 
    TILE_TEXT_HEIGHT = v3 and 32 or 45, 
    TILE_TEXT_WIDTH = 125, 
    RODUX_KEY = "FriendsCarousel"
};