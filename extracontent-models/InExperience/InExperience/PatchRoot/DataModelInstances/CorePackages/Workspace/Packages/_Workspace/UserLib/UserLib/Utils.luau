local v0 = require(script.Constants);
local v1 = require(script.ThumbnailRequest);
local v2 = require(script.AvatarThumbnailRequests);
return {
    getStandardSizeAvatarHeadShotRbxthumb = require(script.getStandardSizeAvatarHeadShotRbxthumb), 
    getRbxthumbWithTypeSizeAndOptions = require(script.getRbxthumbWithTypeSizeAndOptions), 
    getFriendsActiveGamesPlaceIdsFromUsersPresence = require(script.getFriendsActiveGamesPlaceIdsFromUsersPresence), 
    receiveUsersPresence = require(script.receiveUsersPresence), 
    Constants = v0, 
    ThumbnailRequest = v1, 
    AvatarThumbnailRequests = v2, 
    isPlayerVerified = require(script.isPlayerVerified)
};