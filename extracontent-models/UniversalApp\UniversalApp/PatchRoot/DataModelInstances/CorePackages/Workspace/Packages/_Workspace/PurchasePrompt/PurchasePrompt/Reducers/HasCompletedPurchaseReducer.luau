local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.PurchaseCompleteRecieved);
local v4 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
return l_Rodux_0.createReducer(false, {
    [v3.name] = function(_, _) --[[ Line: 10 ]]
        return true;
    end, 
    [v4.name] = function(_, _) --[[ Line: 13 ]]
        return false;
    end
});