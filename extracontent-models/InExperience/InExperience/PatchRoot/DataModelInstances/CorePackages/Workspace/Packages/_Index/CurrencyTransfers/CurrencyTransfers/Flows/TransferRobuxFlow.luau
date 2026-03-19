local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.TransferRobuxApp);
local v4 = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v5 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v6 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v7 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local _ = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local function _(v9) --[[ Line: 24 ]] --[[ Name: validateParams ]]
    -- upvalues: v7 (copy)
    if v9.direction ~= v7.Send and v9.direction ~= v7.Receive then
        error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(v9.direction))));
    end;
end;
TransferRobuxFlow = function(v11) --[[ Line: 36 ]] --[[ Name: TransferRobuxFlow ]]
    -- upvalues: v7 (copy), v4 (copy), v5 (copy), v6 (copy), v2 (copy), v3 (copy)
    if v11.direction ~= v7.Send and v11.direction ~= v7.Receive then
        error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(v11.direction))));
    end;
    local v12 = v4();
    v12.setOnClose(v11.onClose);
    v12.setDirection(v11.direction);
    if v11.transferOrigination then
        v12.setTransferOrigination(v11.transferOrigination);
    end;
    if v11.direction == v7.Send then
        if v11.recipientUserId then
            v12.setRecipientUserId(v11.recipientUserId);
        end;
        v5(v12);
    elseif v11.direction == v7.Receive then
        if v11.transferId then
            v12.setTransferRequestId(v11.transferId);
        end;
        v6(v12);
    end;
    return (v2.createElement(v3, {
        transferStore = v12
    }));
end;
return TransferRobuxFlow;