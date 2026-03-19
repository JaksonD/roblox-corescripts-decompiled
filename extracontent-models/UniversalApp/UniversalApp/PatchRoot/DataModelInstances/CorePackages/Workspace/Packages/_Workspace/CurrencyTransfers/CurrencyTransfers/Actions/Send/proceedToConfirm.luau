local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.InitiateTransferModel);
local v4 = require(l_script_FirstAncestor_0.Actions.Send.setTransferPromptState);
return function(v5, v6) --[[ Line: 10 ]] --[[ Name: proceedToConfirm ]]
    -- upvalues: v4 (copy), v2 (copy)
    v5.setSelectedAmount(v6);
    v4(v5, v2.TransferConfirm);
end;