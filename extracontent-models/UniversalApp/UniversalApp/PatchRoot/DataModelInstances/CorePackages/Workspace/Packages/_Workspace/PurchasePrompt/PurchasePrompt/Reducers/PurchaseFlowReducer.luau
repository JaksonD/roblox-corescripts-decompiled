local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlow);
local v4 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local v5 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
return l_Rodux_0.createReducer(false, {
    [v4.name] = function(_, _) --[[ Line: 12 ]]
        -- upvalues: v5 (copy)
        return v5.None;
    end, 
    [v3.name] = function(_, v9) --[[ Line: 15 ]]
        return v9.purchaseFlow;
    end
});