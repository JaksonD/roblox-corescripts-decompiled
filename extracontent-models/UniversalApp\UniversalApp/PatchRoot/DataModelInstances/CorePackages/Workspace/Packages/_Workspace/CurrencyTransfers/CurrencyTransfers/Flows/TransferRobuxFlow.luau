local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.TransferRobuxApp);
local v4 = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v5 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v6 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v7 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v8 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local function _(v9) --[[ Line: 25 ]] --[[ Name: normalizeTransferOrigination ]]
    -- upvalues: v8 (copy)
    local v10 = string.lower(v9);
    if v10 == "unknown" then
        return v8.Unknown;
    elseif v10 == "profile" then
        return v8.Profile;
    elseif v10 == "chat" then
        return v8.Chat;
    elseif v10 == "buyrobux" then
        return v8.BuyRobux;
    elseif v10 == "inexperience" then
        return v8.InExperience;
    else
        return v8.Unknown;
    end;
end;
local function _(v12) --[[ Line: 45 ]] --[[ Name: validateParams ]]
    -- upvalues: v7 (copy)
    if v12.direction ~= v7.Send and v12.direction ~= v7.Receive then
        error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(v12.direction))));
    end;
end;
TransferRobuxFlow = function(v14) --[[ Line: 57 ]] --[[ Name: TransferRobuxFlow ]]
    -- upvalues: v7 (copy), v4 (copy), v8 (copy), v5 (copy), v6 (copy), v2 (copy), v3 (copy)
    if v14.direction ~= v7.Send and v14.direction ~= v7.Receive then
        error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(v14.direction))));
    end;
    local v15 = v4();
    v15.setOnClose(v14.onClose);
    v15.setDirection(v14.direction);
    if v14.transferOrigination then
        local l_setTransferOrigination_0 = v15.setTransferOrigination;
        local l_transferOrigination_0 = v14.transferOrigination;
        local v18 = string.lower(l_transferOrigination_0);
        l_setTransferOrigination_0(if v18 == "unknown" then v8.Unknown else if v18 == "profile" then v8.Profile else if v18 == "chat" then v8.Chat else if v18 == "buyrobux" then v8.BuyRobux else if v18 == "inexperience" then v8.InExperience else v8.Unknown);
    end;
    if v14.direction == v7.Send then
        if v14.recipientUserId then
            v15.setRecipientUserId(v14.recipientUserId);
        end;
        v5(v15);
    elseif v14.direction == v7.Receive then
        if v14.transferId then
            v15.setTransferRequestId(v14.transferId);
        end;
        v6(v15);
    end;
    return (v2.createElement(v3, {
        transferStore = v15
    }));
end;
return TransferRobuxFlow;