local _ = require(script.Parent.networkingFriendsTypes);
local l_networkRequests_0 = script.Parent.networkRequests;
local v2 = require(l_networkRequests_0.createGetFriendsFromUserId);
local v3 = require(l_networkRequests_0.createFindFriendsFromUserId);
local v4 = require(l_networkRequests_0.createSearchFriendsByQuery);
local v5 = require(l_networkRequests_0.createGetFriendRequestsCount);
local v6 = require(l_networkRequests_0.createUnfriendTargetUserId);
local v7 = require(l_networkRequests_0.createGetFriendRequests);
local v8 = require(l_networkRequests_0.createAcceptFriendRequestFromUserId);
local v9 = require(l_networkRequests_0.createDeclineFriendRequestFromUserId);
local v10 = require(l_networkRequests_0.createDeclineAllFriendRequests);
local v11 = require(l_networkRequests_0.createGetFriendsCountFromUserId);
local v12 = require(l_networkRequests_0.createGetInactiveFriends);
local v13 = require(l_networkRequests_0.createRequestFriendshipFromUserId);
local v14 = require(l_networkRequests_0.createRequestFriendshipFromContactId);
local v15 = require(l_networkRequests_0.createGetFollowingExists);
local v16 = require(l_networkRequests_0.createGetUserFollowers);
local v17 = require(l_networkRequests_0.createGetFriendRecommendationsFromUserId);
local v18 = require(l_networkRequests_0.createGetFriendshipStatus);
local v19 = require(l_networkRequests_0.createGetExtendedFriendshipStatus);
local v20 = require(l_networkRequests_0.createAcceptFriendRequestWithToken);
local v21 = require(l_networkRequests_0.createGetFollowersCount);
local v22 = require(l_networkRequests_0.createGetFollowingsCount);
local v23 = require(l_networkRequests_0.createValidateFriendRequestNickname);
return function(v24) --[[ Line: 32 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy)
    return {
        GetFriendsFromUserId = v2(v24), 
        FindFriendsFromUserId = v3(v24), 
        SearchFriendsByQuery = v4(v24), 
        GetFriendRequestsCount = v5(v24), 
        UnfriendTargetUserId = v6(v24), 
        GetFriendRequests = v7(v24), 
        AcceptFriendRequestFromUserId = v8(v24), 
        DeclineFriendRequestFromUserId = v9(v24), 
        DeclineAllFriendRequests = v10(v24), 
        GetFriendsCountFromUserId = v11(v24), 
        GetInactiveFriends = v12(v24), 
        RequestFriendshipFromUserId = v13(v24), 
        RequestFriendshipFromContactId = v14(v24), 
        GetFollowingExists = v15(v24), 
        GetUserFollowers = v16(v24), 
        GetFriendRecommendationsFromUserId = v17(v24), 
        GetFriendshipStatus = v18(v24), 
        GetExtendedFriendshipStatus = v19(v24), 
        AcceptFriendRequestWithToken = v20(v24), 
        GetFollowersCount = v21(v24), 
        GetFollowingsCount = v22(v24), 
        ValidateFriendRequestNickname = v23(v24)
    };
end;