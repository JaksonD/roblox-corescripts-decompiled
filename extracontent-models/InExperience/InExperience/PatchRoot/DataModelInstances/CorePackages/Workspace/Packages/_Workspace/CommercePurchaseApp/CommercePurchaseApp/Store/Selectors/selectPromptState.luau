local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
local _ = require(l_script_FirstAncestor_0.Enums.CommercePurchasePromptStateEnum);
return function(v3) --[[ Line: 8 ]] --[[ Name: selectPromptState ]]
    return v3.commercePurchaseState.promptState;
end;