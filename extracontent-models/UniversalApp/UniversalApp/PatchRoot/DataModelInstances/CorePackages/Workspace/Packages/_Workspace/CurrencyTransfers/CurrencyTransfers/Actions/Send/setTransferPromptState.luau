local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.InitiateTransferModel);
local v4 = {
    [v2.TransferRequested] = {
        v2.TransferStarted
    }, 
    [v2.TransferStarted] = {
        v2.TransferInput
    }, 
    [v2.TransferInput] = {
        v2.TransferConfirm
    }, 
    [v2.TransferConfirm] = {
        v2.TransferInput, 
        v2.TransferProcessing
    }, 
    [v2.TransferProcessing] = {
        v2.TransferSuccess
    }
};
local _ = function(v5, v6) --[[ Line: 18 ]] --[[ Name: isValidPromptStateTransition ]]
    -- upvalues: v4 (copy)
    local v7 = v4[v5];
    for _, v9 in ipairs(v7) do
        if v9 == v6 then
            return true;
        end;
    end;
    return false;
end;
return function(v11, v12) --[[ Line: 28 ]] --[[ Name: setTransferPromptState ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v13 = false;
    local l_setPromptState_0 = v11.setPromptState;
    local v15 = v4[v11.getPromptState(false)];
    local v16;
    for _, v18 in ipairs(v15) do
        if v18 == v12 then
            v16 = true;
            v13 = true;
        end;
        if v13 then
            break;
        end;
    end;
    if not v13 then
        v16 = false;
    end;
    v13 = false;
    if not v16 then
        l_setPromptState_0(v2.TransferError);
        return;
    else
        l_setPromptState_0(v12);
        return;
    end;
end;