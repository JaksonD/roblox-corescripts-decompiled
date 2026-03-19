local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v4 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local v5 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v6 = require(l_script_FirstAncestor_0.Actions.StartPurchase);
local v7 = require(l_script_FirstAncestor_0.Actions.PromptNativeUpsellSuggestions);
local v8 = require(l_script_FirstAncestor_0.Actions.SetWindowState);
local v9 = require(l_script_FirstAncestor_0.Enums.WindowState);
local v10 = require(l_script_FirstAncestor_0.Enums.PromptState);
return l_Rodux_0.createReducer(v9.Hidden, {
    [v3.name] = function(_, v12) --[[ Line: 18 ]]
        -- upvalues: v10 (copy), v9 (copy)
        if v12.promptState == v10.None then
            return v9.Hidden;
        else
            return v9.Shown;
        end;
    end, 
    [v8.name] = function(_, v14) --[[ Line: 25 ]]
        return v14.state;
    end, 
    [v5.name] = function(_, _) --[[ Line: 28 ]]
        -- upvalues: v9 (copy)
        return v9.Shown;
    end, 
    [v6.name] = function(_, _) --[[ Line: 31 ]]
        -- upvalues: v9 (copy)
        return v9.Shown;
    end, 
    [v7.name] = function(_, _) --[[ Line: 34 ]]
        -- upvalues: v9 (copy)
        return v9.Shown;
    end, 
    [v4.name] = function(_, _) --[[ Line: 37 ]]
        -- upvalues: v9 (copy)
        return v9.Hidden;
    end
});