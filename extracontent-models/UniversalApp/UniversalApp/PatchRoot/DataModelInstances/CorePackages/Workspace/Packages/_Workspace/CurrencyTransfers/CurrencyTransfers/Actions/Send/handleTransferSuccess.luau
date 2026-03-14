local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
return function(v3) --[[ Line: 7 ]] --[[ Name: handleTransferSuccess ]]
    -- upvalues: v2 (copy)
    v3.setPromptState(v2.TransferSuccess);
end;