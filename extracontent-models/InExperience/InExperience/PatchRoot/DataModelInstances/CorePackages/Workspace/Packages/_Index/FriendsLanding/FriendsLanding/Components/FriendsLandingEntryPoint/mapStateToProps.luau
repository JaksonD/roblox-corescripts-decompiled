local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_FriendsNetworking_0 = v1.FriendsNetworking;
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_FriendsNetworking_0 (copy)
    local v5 = l_getDeepValue_0(v4, string.format("FriendsLanding.Friends.byUserId.%s", v4.LocalUserId));
    return {
        localUserId = v4.LocalUserId, 
        screenSize = v4.ScreenSize, 
        inactiveFriendsNetworkRequestStatus = l_FriendsNetworking_0.GetInactiveFriends.getStatus(v4, v4.LocalUserId), 
        friendRequestCount = l_getDeepValue_0(v4, "FriendsLanding.Friends.requests.receivedCount") or 0, 
        totalFriendCount = v5 and #v5 or 0
    };
end;