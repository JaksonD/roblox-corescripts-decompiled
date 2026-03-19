local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v2) --[[ Line: 7 ]] --[[ Name: selectExpirationDate ]]
    return v2.expirationDate;
end;