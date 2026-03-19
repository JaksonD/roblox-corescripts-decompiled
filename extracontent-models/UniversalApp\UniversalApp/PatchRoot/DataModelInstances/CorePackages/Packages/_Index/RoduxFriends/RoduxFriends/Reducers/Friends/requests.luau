local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
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
return function(v11) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
    return v1.combineReducers({
        receivedCount = v2(v11), 
        byUserId = v3(v11), 
        mutualFriends = v4(v11), 
        sourceUniverseIds = v5(v11), 
        nextPageCursor = v6(v11), 
        sentAt = v7(v11), 
        originSourceType = v8(v11), 
        order = v9(v11), 
        senderNickname = v10(v11)
    });
end;