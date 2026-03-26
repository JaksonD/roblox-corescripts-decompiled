local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v3 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: handleGetError ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_setPromptState_0 = v5.setPromptState;
    local l_setErrorTransferModel_0 = v5.setErrorTransferModel;
    local l_getDirection_0 = v5.getDirection;
    if v6 then
        l_setErrorTransferModel_0(v6);
    else
        l_setErrorTransferModel_0(nil);
    end;
    if l_getDirection_0(false) == v3.Receive then
        l_setPromptState_0(v2.ReceiveError);
        return;
    else
        l_setPromptState_0(v2.TransferError);
        return;
    end;
end;