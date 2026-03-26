local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.new = function(v5) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6) --[[ Line: 26 ]] --[[ Name: mock ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v4 (copy)
    v6 = v6 or {};
    local v7 = require(l_script_FirstAncestor_0.Enums.TransferStatus);
    return (v4.new({
        transfer = v6.transfer or {
            transferId = 123456, 
            sender = {
                type = 1, 
                targetId = 100, 
                targetName = "SenderUser", 
                targetDisplayName = "Sender Display"
            }, 
            recipient = {
                type = 1, 
                targetId = 200, 
                targetName = "RecipientUser", 
                targetDisplayName = "Recipient Display"
            }, 
            transferAmount = 100, 
            creationTime = "2025-01-01T00:00:00Z", 
            requireRecipientAction = false, 
            status = v7.Completed
        }
    }));
end;
local function v12(v8) --[[ Line: 56 ]] --[[ Name: formatRobuxTransfer ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v9 = require(l_script_FirstAncestor_0.Enums.TransferStatus);
    local l_sender_0 = v8.sender;
    local l_recipient_0 = v8.recipient;
    return {
        transferId = v8.transferId, 
        sender = {
            type = l_sender_0.type, 
            targetId = l_sender_0.targetId, 
            targetName = l_sender_0.targetName, 
            targetDisplayName = l_sender_0.targetDisplayName
        }, 
        recipient = {
            type = l_recipient_0.type, 
            targetId = l_recipient_0.targetId, 
            targetName = l_recipient_0.targetName, 
            targetDisplayName = l_recipient_0.targetDisplayName
        }, 
        transferAmount = v8.transferAmount, 
        creationTime = v8.creationTime, 
        requireRecipientAction = v8.requireRecipientAction, 
        status = v9.fromValue(v8.status) or v9.Completed
    };
end;
v4.format = function(v13) --[[ Line: 81 ]] --[[ Name: format ]]
    -- upvalues: v4 (copy), v12 (copy)
    local l_transfer_0 = v13.transfer;
    if not l_transfer_0 then
        error("GetTransferByIdModel.format: transfer is missing from response");
    end;
    return (v4.new({
        transfer = v12(l_transfer_0)
    }));
end;
v4.isValid = v3.strictInterface({
    transfer = v3.table
});
return v4;