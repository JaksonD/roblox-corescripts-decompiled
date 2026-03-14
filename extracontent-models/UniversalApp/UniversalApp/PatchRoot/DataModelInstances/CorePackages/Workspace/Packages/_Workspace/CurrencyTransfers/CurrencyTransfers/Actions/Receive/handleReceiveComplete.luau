local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
return function(v3) --[[ Line: 8 ]] --[[ Name: handleReceiveComplete ]]
    -- upvalues: v2 (copy)
    local l_setPromptState_0 = v3.setPromptState;
    local l_triggerOnClose_0 = v3.triggerOnClose;
    l_setPromptState_0(v2.ReceiveComplete);
    l_triggerOnClose_0();
end;