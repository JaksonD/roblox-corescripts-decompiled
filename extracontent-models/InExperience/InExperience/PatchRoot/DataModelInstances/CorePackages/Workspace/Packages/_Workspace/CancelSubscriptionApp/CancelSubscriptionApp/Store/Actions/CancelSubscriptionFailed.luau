local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorStateEnum);
return v2.makeActionCreator("CancelSubscriptionFailed", function(v4, v5) --[[ Line: 15 ]]
    return {
        errorState = v4, 
        subscriptionId = v5
    };
end);