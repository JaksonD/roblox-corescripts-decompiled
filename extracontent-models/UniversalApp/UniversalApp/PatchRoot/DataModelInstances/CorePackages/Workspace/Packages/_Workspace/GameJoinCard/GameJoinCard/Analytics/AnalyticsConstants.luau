local v0 = {
    Thumbnail = "thumbnail", 
    Title = "title"
};
local v1 = {
    UserTile = "userTile", 
    ViewProfileButton = "viewProfileButton"
};
return {
    Btns = {
        OpenGameJoinCard = "openGameJoinCard", 
        GameJoinCardButton = "gameJoinCardButton"
    }, 
    GameJoinCardButtonAction = {
        Invalid = 0, 
        JoinGame = 1, 
        OpenProfileFromUserTile = 2, 
        OpenProfileFromViewProfile = 3, 
        ViewExperienceDetailsFromTitle = 4, 
        ViewExperienceDetailsFromThumbnail = 5
    }, 
    GameJoinCardSurface = {
        Desktop = "desktop", 
        Mobile = "mobile"
    }, 
    viewEDPsourceValues = v0, 
    viewProfileSourceValues = v1
};