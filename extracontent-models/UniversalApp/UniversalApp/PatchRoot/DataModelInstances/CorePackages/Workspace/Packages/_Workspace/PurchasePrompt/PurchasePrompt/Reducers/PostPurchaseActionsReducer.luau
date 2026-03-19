local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
return (l_Rodux_0.createReducer({}, {
    [v4.name] = function(_, v6) --[[ Line: 14 ]]
        return v6.postPurchaseActions;
    end
}));