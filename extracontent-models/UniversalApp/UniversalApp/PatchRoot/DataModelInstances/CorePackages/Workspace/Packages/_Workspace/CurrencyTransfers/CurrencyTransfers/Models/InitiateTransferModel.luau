local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.new = function(v5) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6) --[[ Line: 33 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    v6 = v6 or {};
    local v7 = v6.robuxTransfer or {};
    local v8 = v7.recipient or {
        targetDisplayName = "MockRecipient", 
        targetId = 0, 
        targetName = "mock", 
        type = 1
    };
    local v9 = v6.userRelationshipDetail or {
        mutualFriendsCount = 0, 
        userAccountSinceYear = 0, 
        areFriends = false
    };
    return (v4.new({
        transferRequestId = v6.transferRequestId or "RXT-1234567890", 
        robuxTransfer = {
            transferId = v7.transferId or 1234567890, 
            recipient = v8
        }, 
        userRelationshipDetail = v9, 
        senderRobuxBalance = v6.senderRobuxBalance or 0
    }));
end;
v4.format = function(v10) --[[ Line: 62 ]] --[[ Name: format ]]
    -- upvalues: v4 (copy)
    return (v4.new({
        transferRequestId = v10.transferRequestId, 
        robuxTransfer = {
            transferId = v10.robuxTransfer.transferId, 
            recipient = {
                targetDisplayName = v10.robuxTransfer.recipient.targetDisplayName, 
                targetId = v10.robuxTransfer.recipient.targetId, 
                targetName = v10.robuxTransfer.recipient.targetName, 
                type = v10.robuxTransfer.recipient.type
            }
        }, 
        senderRobuxBalance = v10.senderRobuxBalance, 
        userRelationshipDetail = {
            friendSinceYear = v10.userRelationshipDetail.friendSinceYear, 
            mutualFriendsCount = v10.userRelationshipDetail.mutualFriendsCount, 
            userAccountSinceYear = v10.userRelationshipDetail.userAccountSinceYear, 
            areFriends = v10.userRelationshipDetail.areFriends
        }
    }));
end;
v4.isValid = v3.strictInterface({
    transferRequestId = v3.string, 
    robuxTransfer = v3.strictInterface({
        transferId = v3.number, 
        recipient = v3.strictInterface({
            targetDisplayName = v3.string, 
            targetId = v3.number, 
            targetName = v3.string, 
            type = v3.number
        })
    }), 
    userRelationshipDetail = v3.strictInterface({
        friendSinceYear = v3.optional(v3.number), 
        mutualFriendsCount = v3.number, 
        userAccountSinceYear = v3.number, 
        areFriends = v3.boolean
    }), 
    senderRobuxBalance = v3.number
});
return v4;