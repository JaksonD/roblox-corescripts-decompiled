local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
return function() --[[ Line: 5 ]] --[[ Name: cleanupSubscriptionFlow ]]
    -- upvalues: v1 (copy)
    v1.get().triggerUnmountUI();
    v1.cleanup();
end;