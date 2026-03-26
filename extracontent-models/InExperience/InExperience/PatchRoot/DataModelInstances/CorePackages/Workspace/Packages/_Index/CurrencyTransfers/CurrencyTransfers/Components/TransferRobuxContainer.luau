local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v5 = require(l_script_FirstAncestor_0.Components.Send.TransferRobuxInputSheet);
local v6 = require(l_script_FirstAncestor_0.Components.Send.TransferRobuxConfirmSheet);
local v7 = require(l_script_FirstAncestor_0.Components.Send.TransferRobuxErrorSheet);
local v8 = require(l_script_FirstAncestor_0.Components.Send.InsufficientBalanceSheet);
local v9 = require(l_script_FirstAncestor_0.Components.Send.TransferRobuxSuccessToast);
local v10 = require(l_script_FirstAncestor_0.Components.Send.TransferBlockSheet);
local v11 = require(l_script_FirstAncestor_0.Components.Receive.ReceiveRobuxSuccessToast);
local v12 = require(l_script_FirstAncestor_0.Components.Receive.ReceiveBlockSheet);
local v13 = require(l_script_FirstAncestor_0.Components.Receive.ReceiveErrorSheet);
local v14 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
return function(_) --[[ Line: 26 ]] --[[ Name: TransferRobuxContainer ]]
    -- upvalues: v14 (copy), v3 (copy), v4 (copy), v2 (copy), v5 (copy), v8 (copy), v6 (copy), v9 (copy), v7 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy)
    local v16 = v14();
    local v17 = v3.useSignalState(v16.getPromptState);
    if v17 == v4.TransferInput then
        return v2.createElement(v5, {});
    elseif v17 == v4.TransferInsufficientBalance then
        return v2.createElement(v8, {});
    elseif v17 == v4.TransferConfirm then
        return v2.createElement(v6, {});
    elseif v17 == v4.TransferSuccess then
        return v2.createElement(v9, {});
    elseif v17 == v4.TransferError then
        return v2.createElement(v7, {});
    elseif v17 == v4.TransferBlocked then
        return v2.createElement(v10);
    elseif v17 == v4.ReceiveSuccess then
        return v2.createElement(v11, {});
    elseif v17 == v4.ReceiveBlocked then
        return v2.createElement(v12);
    elseif v17 == v4.ReceiveError then
        return v2.createElement(v13, {});
    else
        return nil;
    end;
end;