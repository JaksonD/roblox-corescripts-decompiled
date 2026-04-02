local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.TransferRobuxApp);
local v4 = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v5 = require(l_script_FirstAncestor_0.Actions.Send.initiateTransfer);
local v6 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v7 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v8 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local v9 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v10 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local function _(v11) --[[ Line: 27 ]] --[[ Name: normalizeTransferOrigination ]]
    -- upvalues: v8 (copy)
    local v12 = string.lower(v11);
    if v12 == "unknown" then
        return v8.Unknown;
    elseif v12 == "profile" then
        return v8.Profile;
    elseif v12 == "chat" then
        return v8.Chat;
    elseif v12 == "buyrobux" then
        return v8.BuyRobux;
    elseif v12 == "inexperience" then
        return v8.InExperience;
    else
        return v8.Unknown;
    end;
end;
local function _(v14) --[[ Line: 47 ]] --[[ Name: validateParams ]]
    -- upvalues: v7 (copy)
    if v14.direction ~= v7.Send and v14.direction ~= v7.Receive then
        error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(v14.direction))));
    end;
end;
TransferRobuxFlow = function(v16) --[[ Line: 59 ]] --[[ Name: TransferRobuxFlow ]]
    -- upvalues: v7 (copy), v4 (copy), v8 (copy), v5 (copy), v6 (copy), v10 (copy), v9 (copy), v2 (copy), v3 (copy)
    if v16.direction ~= v7.Send and v16.direction ~= v7.Receive then
        error(string.format("[TransferRobuxFlow] Invalid direction: '%s'. Must be either TransferDirection.Send or TransferDirection.Receive.", (tostring(v16.direction))));
    end;
    local v17 = v4();
    v17.setOnClose(v16.onClose);
    v17.setDirection(v16.direction);
    if v16.transferOrigination then
        local l_setTransferOrigination_0 = v17.setTransferOrigination;
        local l_transferOrigination_0 = v16.transferOrigination;
        local v20 = string.lower(l_transferOrigination_0);
        l_setTransferOrigination_0(if v20 == "unknown" then v8.Unknown else if v20 == "profile" then v8.Profile else if v20 == "chat" then v8.Chat else if v20 == "buyrobux" then v8.BuyRobux else if v20 == "inexperience" then v8.InExperience else v8.Unknown);
    end;
    if v16.direction == v7.Send then
        if v16.recipientUserId then
            v17.setRecipientUserId(v16.recipientUserId);
        end;
        v5(v17);
    elseif v16.direction == v7.Receive then
        if v16.transferId then
            v17.setTransferRequestId(v16.transferId);
        end;
        v6(v17);
    end;
    v10(v17, v9.CurrencyTransferFlowOpenedCounter);
    return (v2.createElement(v3, {
        transferStore = v17
    }));
end;
return TransferRobuxFlow;