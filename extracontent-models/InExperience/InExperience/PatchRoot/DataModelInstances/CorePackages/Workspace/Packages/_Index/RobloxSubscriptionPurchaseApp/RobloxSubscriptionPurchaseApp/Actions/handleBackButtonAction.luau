local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v2 = require(l_script_FirstAncestor_0.Actions.cleanupSubscriptionFlow);
return function() --[[ Line: 6 ]] --[[ Name: handleBackButtonAction ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1.get().triggerOnBackButtonActivated();
    v2();
end;