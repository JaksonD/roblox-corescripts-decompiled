local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v2) --[[ Line: 7 ]] --[[ Name: selectSubscriptionId ]]
    return v2.subscriptionId;
end;