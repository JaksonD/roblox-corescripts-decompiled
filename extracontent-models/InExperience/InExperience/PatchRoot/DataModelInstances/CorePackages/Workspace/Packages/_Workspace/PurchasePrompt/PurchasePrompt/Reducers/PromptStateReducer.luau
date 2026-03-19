local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v4 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local v5 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v6 = require(l_script_FirstAncestor_0.Actions.StartPurchase);
local v7 = require(l_script_FirstAncestor_0.Actions.PromptNativeUpsellSuggestions);
local v8 = require(l_script_FirstAncestor_0.Enums.PromptState);
return (l_Rodux_0.createReducer(v8.None, {
    [v3.name] = function(_, v10) --[[ Line: 14 ]]
        return v10.promptState;
    end, 
    [v4.name] = function(_, _) --[[ Line: 17 ]]
        -- upvalues: v8 (copy)
        return v8.None;
    end, 
    [v5.name] = function(_, _) --[[ Line: 20 ]]
        -- upvalues: v8 (copy)
        return v8.Error;
    end, 
    [v6.name] = function(_, _) --[[ Line: 23 ]]
        -- upvalues: v8 (copy)
        return v8.PurchaseInProgress;
    end, 
    [v7.name] = function(_, _) --[[ Line: 26 ]]
        -- upvalues: v8 (copy)
        return v8.RobuxUpsell;
    end
}));