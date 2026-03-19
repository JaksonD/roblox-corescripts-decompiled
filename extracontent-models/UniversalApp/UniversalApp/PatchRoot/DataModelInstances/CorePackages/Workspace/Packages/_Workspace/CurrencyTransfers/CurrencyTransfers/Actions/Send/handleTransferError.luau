local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.ErrorTransferModel);
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: handleTransferError ]]
    -- upvalues: v2 (copy)
    local l_setPromptState_0 = v4.setPromptState;
    local l_setErrorTransferModel_0 = v4.setErrorTransferModel;
    if v5 then
        l_setErrorTransferModel_0(v5);
    else
        l_setErrorTransferModel_0(nil);
    end;
    l_setPromptState_0(v2.TransferError);
end;