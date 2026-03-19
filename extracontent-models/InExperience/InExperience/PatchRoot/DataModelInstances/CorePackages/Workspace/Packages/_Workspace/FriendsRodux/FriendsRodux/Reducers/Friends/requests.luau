local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.receivedCount);
local v3 = require(script.byUserId);
local v4 = require(script.mutualFriends);
local v5 = require(script.sourceUniverseIds);
local v6 = require(script.nextPageCursor);
local v7 = require(script.sentAt);
local v8 = require(script.originSourceType);
local v9 = require(script.order);
local v10 = require(script.senderNickname);
local v11 = require(script.newFriendRequestsCount);
return function(v12) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    return v1.combineReducers({
        receivedCount = v2(v12), 
        byUserId = v3(v12), 
        mutualFriends = v4(v12), 
        sourceUniverseIds = v5(v12), 
        nextPageCursor = v6(v12), 
        sentAt = v7(v12), 
        originSourceType = v8(v12), 
        order = v9(v12), 
        senderNickname = v10(v12), 
        newFriendRequestsCount = v11(v12)
    });
end;