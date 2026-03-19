local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetIsUserEligibleForUnifiedPurchaseFlow);
return (l_Rodux_0.createReducer(false, {
    [v3.name] = function(_, v5) --[[ Line: 10 ]]
        return v5.isUserEligibleForUnifiedPurchaseFlow;
    end
}));