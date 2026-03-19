local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetProduct);
local v4 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v6) --[[ Line: 11 ]]
        return {
            id = v6.id, 
            infoType = v6.infoType, 
            equipIfPurchased = v6.equipIfPurchased
        };
    end, 
    [v4.name] = function(_, _) --[[ Line: 18 ]]
        return {};
    end
}));