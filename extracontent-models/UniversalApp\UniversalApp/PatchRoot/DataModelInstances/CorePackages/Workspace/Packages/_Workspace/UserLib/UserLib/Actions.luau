local v0 = require(script.AddUser);
local v1 = require(script.AddUsers);
local v2 = require(script.ReceivedDisplayName);
local v3 = require(script.RemoveUser);
local v4 = require(script.SetUserIsFriend);
local v5 = require(script.SetUserMembershipType);
local v6 = require(script.ReceivedUserPresence);
local v7 = require(script.SetUserPresence);
local v8 = require(script.SetLocalUserId);
local v9 = require(script.SetLocalUserUnder13);
local v10 = require(script.SetUserHasRobloxSubscription);
return {
    AddUser = v0, 
    AddUsers = v1, 
    ReceivedDisplayName = v2, 
    RemoveUser = v3, 
    SetUserIsFriend = v4, 
    SetUserMembershipType = v5, 
    SetUserHasRobloxSubscription = v10, 
    ReceivedUserPresence = v6, 
    SetUserPresence = v7, 
    SetLocalUserId = v8, 
    SetLocalUserUnder13 = v9
};