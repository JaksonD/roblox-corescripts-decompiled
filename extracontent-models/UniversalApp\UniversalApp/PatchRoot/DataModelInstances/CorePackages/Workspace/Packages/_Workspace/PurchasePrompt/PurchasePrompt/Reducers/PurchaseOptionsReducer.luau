local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetPurchaseOptions);
local _ = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local _ = require(l_script_FirstAncestor_0.types);
local v6 = {
    shouldSkipOwnershipCheck = false
};
return (l_Rodux_0.createReducer(v6, {
    [v3.name] = function(_, v8) --[[ Line: 17 ]]
        return v8.purchaseOptions;
    end
}));