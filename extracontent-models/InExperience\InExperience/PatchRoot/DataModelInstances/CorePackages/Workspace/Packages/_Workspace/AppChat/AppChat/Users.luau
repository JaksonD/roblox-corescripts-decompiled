local v0 = require(script.getThumbnailsForUserIds);
local v1 = require(script.populateUserWithState);
local v2 = require(script.userPresenceUtils);
return {
    getThumbnailsForUserIds = v0, 
    populateUserWithState = v1, 
    userPresenceUtils = v2
};