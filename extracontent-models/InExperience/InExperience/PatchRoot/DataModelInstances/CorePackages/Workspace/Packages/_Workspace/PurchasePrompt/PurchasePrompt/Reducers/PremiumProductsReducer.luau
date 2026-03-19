local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local v4 = require(l_script_FirstAncestor_0.Actions.PremiumInfoRecieved);
return (l_Rodux_0.createReducer({}, {
    [v4.name] = function(_, v6) --[[ Line: 11 ]]
        return v6.premiumInfo;
    end, 
    [v3.name] = function(_, _) --[[ Line: 14 ]]
        return {};
    end
}));