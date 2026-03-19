local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorStateEnum);
return function(v3) --[[ Line: 8 ]] --[[ Name: selectErrorState ]]
    return v3.errorState;
end;