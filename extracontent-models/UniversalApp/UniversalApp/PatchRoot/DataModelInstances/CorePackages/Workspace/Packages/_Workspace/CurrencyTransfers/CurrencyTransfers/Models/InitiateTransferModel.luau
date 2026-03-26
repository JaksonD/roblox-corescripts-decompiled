local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.new = function(v5) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6) --[[ Line: 34 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    v6 = v6 or {};
    local v7 = v6.robuxTransfer or {};
    local v8 = v7.sender or {
        targetDisplayName = "MockSender", 
        targetId = 0, 
        targetName = "mock", 
        type = 1
    };
    local v9 = v7.recipient or {
        targetDisplayName = "MockRecipient", 
        targetId = 0, 
        targetName = "mock", 
        type = 1
    };
    local v10 = v6.userRelationshipDetail or {
        mutualFriendsCount = 0, 
        userAccountSinceYear = 0, 
        areFriends = false
    };
    return (v4.new({
        transferRequestId = v6.transferRequestId or "RXT-1234567890", 
        robuxTransfer = {
            transferId = v7.transferId or 1234567890, 
            sender = v8, 
            recipient = v9
        }, 
        userRelationshipDetail = v10, 
        senderRobuxBalance = v6.senderRobuxBalance or 0
    }));
end;
v4.format = function(v11) --[[ Line: 71 ]] --[[ Name: format ]]
    -- upvalues: v4 (copy)
    local l_robuxTransfer_0 = v11.robuxTransfer;
    local l_sender_0 = l_robuxTransfer_0.sender;
    local v14 = if l_sender_0 then {
        targetDisplayName = l_sender_0.targetDisplayName, 
        targetId = l_sender_0.targetId, 
        targetName = l_sender_0.targetName, 
        type = l_sender_0.type
    } else {
        targetDisplayName = "", 
        targetId = 0, 
        targetName = "", 
        type = 0
    };
    return (v4.new({
        transferRequestId = v11.transferRequestId, 
        robuxTransfer = {
            transferId = l_robuxTransfer_0.transferId, 
            sender = v14, 
            recipient = {
                targetDisplayName = l_robuxTransfer_0.recipient.targetDisplayName, 
                targetId = l_robuxTransfer_0.recipient.targetId, 
                targetName = l_robuxTransfer_0.recipient.targetName, 
                type = l_robuxTransfer_0.recipient.type
            }
        }, 
        senderRobuxBalance = v11.senderRobuxBalance, 
        userRelationshipDetail = {
            friendSinceYear = v11.userRelationshipDetail.friendSinceYear, 
            mutualFriendsCount = v11.userRelationshipDetail.mutualFriendsCount, 
            userAccountSinceYear = v11.userRelationshipDetail.userAccountSinceYear, 
            areFriends = v11.userRelationshipDetail.areFriends
        }
    }));
end;
v4.isValid = v3.strictInterface({
    transferRequestId = v3.string, 
    robuxTransfer = v3.strictInterface({
        transferId = v3.number, 
        sender = v3.strictInterface({
            targetDisplayName = v3.string, 
            targetId = v3.number, 
            targetName = v3.string, 
            type = v3.number
        }), 
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