local v0 = require(script.Parent.Friends.byUserId);
local v1 = require(script.Parent.Friends.countsByUserId);
local v2 = require(script.Parent.Friends.requests);
local v3 = require(script.Parent.Friends.recommendations);
local v4 = require(script.Parent.Friends.friendshipStatus);
local v5 = require(script.Parent.Friends.friendsRankByUserId);
local v6 = require(script.Parent.Friends.contactNamesByUserId);
local v7 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0
    }, 
    recommendations = {}, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}, 
    contactNamesByUserId = {}
};
return function(v8) --[[ Line: 21 ]]
    -- upvalues: v7 (copy), v0 (copy), v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    return function(v9, v10) --[[ Line: 22 ]]
        -- upvalues: v7 (ref), v0 (ref), v8 (copy), v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref)
        local v11 = v9 or v7;
        local v12 = v0(v8);
        local v13 = v1(v8);
        local v14 = v2(v8);
        local v15 = v3(v8);
        local v16 = v4(v8);
        local v17 = v5(v8);
        local v18 = v6(v8);
        return {
            byUserId = v12(v11.byUserId, v10), 
            countsByUserId = v13(v9, v10), 
            requests = v14(v11.requests, v10), 
            recommendations = v15(v11.recommendations, v10), 
            friendshipStatus = v16(v11.friendshipStatus, v10), 
            friendsRankByUserId = v17(v11.friendsRankByUserId, v10), 
            contactNamesByUserId = v18(v11.contactNamesByUserId, v10)
        };
    end;
end;