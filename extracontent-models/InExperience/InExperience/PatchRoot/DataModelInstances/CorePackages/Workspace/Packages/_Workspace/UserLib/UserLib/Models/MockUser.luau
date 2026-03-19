local v0 = require(script.Parent.User);
local v1 = 0;
local function _() --[[ Line: 7 ]]
    -- upvalues: v1 (ref)
    v1 = v1 + 1;
    return (tostring(v1));
end;
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (ref)
    local v4 = v0.new();
    v1 = v1 + 1;
    v4.id = tostring(v1);
    v4.isFetching = false;
    v4.isFriend = false;
    v4.friendRank = 0;
    v4.lastLocation = nil;
    v4.name = "USER NAME";
    v4.universeId = nil;
    v4.placeId = nil;
    v4.rootPlaceId = nil;
    v4.gameInstanceId = nil;
    v4.presence = v0.PresenceType.OFFLINE;
    v4.membership = nil;
    v4.thumbnails = nil;
    v4.lastOnline = nil;
    v4.displayName = "DN+" .. v4.name;
    v4.externalAppDisplayName = "EXTERNAL APP DISPLAY NAME";
    v4.hasVerifiedBadge = false;
    v4.hasRobloxSubscription = false;
    setmetatable(v4, {
        __index = v0
    });
    return v4;
end;
v3.mockEndpointResponse = function() --[[ Line: 45 ]] --[[ Name: mockEndpointResponse ]]
    return {
        created = "0001-01-01T06:00:00Z", 
        displayName = "DN+12345", 
        friendFrequentRank = 1, 
        friendFrequentScore = 2, 
        id = 12345, 
        isBanned = false, 
        isDeleted = false, 
        isOnline = false, 
        name = "USER NAME", 
        presenceType = 0, 
        hasVerifiedBadge = false
    };
end;
return v3;