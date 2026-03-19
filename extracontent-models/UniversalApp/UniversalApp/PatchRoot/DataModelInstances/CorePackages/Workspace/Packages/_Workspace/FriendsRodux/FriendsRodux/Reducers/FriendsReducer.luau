local v0 = require(script.Parent.Friends.byUserId);
local v1 = require(script.Parent.Friends.countsByUserId);
local v2 = require(script.Parent.Friends.requests);
local v3 = require(script.Parent.Friends.recommendations);
local v4 = require(script.Parent.Friends.followings);
local v5 = require(script.Parent.Friends.friendshipStatus);
local v6 = require(script.Parent.Friends.friendsRankByUserId);
local v7 = require(script.Parent.Friends.contactNamesByUserId);
local v8 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0, 
        newFriendRequestsCount = 0
    }, 
    recommendations = {}, 
    followings = {}, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}, 
    contactNamesByUserId = {}
};
return function(v9) --[[ Line: 24 ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v10 = v0(v9);
    local v11 = v1(v9);
    local v12 = v2(v9);
    local v13 = v3(v9);
    local v14 = v4(v9);
    local v15 = v5(v9);
    local v16 = v6(v9);
    local v17 = v7(v9);
    return function(v18, v19) --[[ Line: 34 ]]
        -- upvalues: v8 (ref), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy)
        local v20 = v18 or v8;
        return {
            byUserId = v10(v20.byUserId, v19), 
            countsByUserId = v11(v20.countsByUserId, v19), 
            requests = v12(v20.requests, v19), 
            recommendations = v13(v20.recommendations, v19), 
            followings = v14(v20.followings, v19), 
            friendshipStatus = v15(v20.friendshipStatus, v19), 
            friendsRankByUserId = v16(v20.friendsRankByUserId, v19), 
            contactNamesByUserId = v17(v20.contactNamesByUserId, v19)
        };
    end;
end;