local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.t);
local v4 = {};
v4.new = function(v5) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v4.isValid(v5));
    v4.__index = v4;
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6) --[[ Line: 27 ]] --[[ Name: mock ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v4 (copy)
    v6 = v6 or {};
    local v7 = require(l_script_FirstAncestor_0.Enums.TransferStatus);
    return (v4.new({
        robuxTransfer = v6.robuxTransfer or {
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
        }, 
        isAlreadyAccepted = v6.isAlreadyAccepted ~= nil and v6.isAlreadyAccepted
    }));
end;
v4.format = function(v8) --[[ Line: 57 ]] --[[ Name: format ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v4 (copy)
    local v9 = v8.robuxTransfer or v8.RobuxTransfer;
    local v10 = if v8.isAlreadyAccepted ~= nil then v8.isAlreadyAccepted else v8.IsAlreadyAccepted == true;
    local v11 = require(l_script_FirstAncestor_0.Enums.TransferStatus);
    if not v9 then
        error("AcceptTransferModel.format: robuxTransfer is missing from response");
    end;
    return (v4.new({
        isAlreadyAccepted = v10, 
        robuxTransfer = {
            transferId = v9.transferId or v9.TransferId, 
            sender = {
                type = v9.sender.type or v9.Sender.Type, 
                targetId = v9.sender.targetId or v9.Sender.TargetId, 
                targetName = v9.sender.targetName or v9.Sender.TargetName, 
                targetDisplayName = v9.sender.targetDisplayName or v9.Sender.TargetDisplayName
            }, 
            recipient = {
                type = v9.recipient.type or v9.Recipient.Type, 
                targetId = v9.recipient.targetId or v9.Recipient.TargetId, 
                targetName = v9.recipient.targetName or v9.Recipient.TargetName, 
                targetDisplayName = v9.recipient.targetDisplayName or v9.Recipient.TargetDisplayName
            }, 
            transferAmount = v9.transferAmount or v9.TransferAmount, 
            receivingAmount = v9.receivingAmount or v9.ReceivingAmount, 
            creationTime = v9.creationTime or v9.CreationTime, 
            requireRecipientAction = v9.requireRecipientAction or v9.RequireRecipientAction, 
            status = v11.fromValue(v9.status or v9.Status) or v11.Completed
        }
    }));
end;
v4.isValid = v3.strictInterface({
    robuxTransfer = v3.table, 
    isAlreadyAccepted = v3.boolean
});
return v4;