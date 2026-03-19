local l_Parent_0 = script:FindFirstAncestor("VerifiedBadges").Parent;
local v1 = require(l_Parent_0.UsersNetworking);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.HttpRequest);
local v4 = v2.config({
    keyPath = "VerifiedBadges.NetworkStatus", 
    networkImpl = v3.config({
        requestFunction = v3.requestFunctions.RequestInternal, 
        maxRetryCount = 0
    })
});
return {
    RoduxNetworking = v4, 
    FriendsNetworking = require(l_Parent_0.FriendsNetworking).config({
        roduxNetworking = v4
    }), 
    UsersNetworking = v1.config({
        roduxNetworking = v4
    })
};